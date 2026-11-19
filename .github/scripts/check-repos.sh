#!/usr/bin/env bash
# Flags GitHub repos linked from the given Markdown files that are archived,
# moved (renamed or transferred) or gone. Prints a Markdown list of problems
# and exits 1 if there are any. Needs an authenticated `gh` (GH_TOKEN in CI).
#
# Usage: .github/scripts/check-repos.sh README.md [more.md ...]

set -euo pipefail

[ "$#" -gt 0 ] || set -- README.md
self="uveshm003/ai-dev-toolkit"

repos=$(grep -ohE 'https://github\.com/[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+' "$@" \
  | sed -E 's#^https://github\.com/##; s#\.git$##' \
  | sort -uf)

lower() { tr '[:upper:]' '[:lower:]' <<< "$1"; }

checked=0
problems=0
while read -r repo; do
  [ -n "$repo" ] || continue
  [ "$(lower "$repo")" != "$self" ] || continue
  checked=$((checked + 1))

  if ! info=$(gh api "repos/$repo" --jq '[.full_name, (.archived | tostring)] | @tsv' 2>/dev/null); then
    echo "- ❌ \`$repo\`: not found (deleted or made private)"
    problems=$((problems + 1))
    continue
  fi

  name=$(cut -f1 <<< "$info")
  archived=$(cut -f2 <<< "$info")

  if [ "$archived" = "true" ]; then
    echo "- 📦 \`$repo\`: archived, so it's no longer maintained"
    problems=$((problems + 1))
  fi
  if [ "$(lower "$name")" != "$(lower "$repo")" ]; then
    echo "- ↪️ \`$repo\`: moved to \`$name\`; update the link"
    problems=$((problems + 1))
  fi
done <<< "$repos"

echo "Checked $checked repos: $problems problem(s)." >&2
[ "$problems" -eq 0 ]
