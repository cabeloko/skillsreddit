# Contributing

Thanks for helping improve this list!

Not ready to write a PR? [Suggest a tool](https://github.com/uveshm003/ai-dev-toolkit/issues/new?template=suggest-a-tool.yml) or [report a broken link](https://github.com/uveshm003/ai-dev-toolkit/issues/new?template=broken-link.yml) instead.

## What belongs here

- Skills, plugins or workflows that make AI coding agents noticeably better at any stage of the SDLC, or at writing.
- The project must be open source and actively maintained, with a README that explains how to install it.
- You have actually used it. Please say how in the PR.

## How to add an entry

1. Put it in the best-fitting section, ranked by quality: stronger picks go higher.
2. Follow the existing format:

   ````markdown
   ### Tool Name

   [owner/repo](https://github.com/owner/repo) ![stars](https://img.shields.io/github/stars/owner/repo?style=flat-square&label=%E2%AD%90)

   🏢 Company · 🔑 what key it needs · 🤖 Claude Code, Codex, Cursor

   One or two sentences on what it does.

   <details>
   <summary>Install</summary>

   ```bash
   the install command the project recommends
   ```

   </details>

   **Best for:** optional, one line.
   ````

3. Tags: add 🏢 only if it comes from the platform's own team or an established company, and 🔑 only if it needs an API key or token beyond the agent itself. For 🤖, list the agents its README says it supports. If it installs with `npx skills`, write `any skills agent`; if it's an MCP server, write `any MCP client`. Leave out a tag rather than guess.
4. Copy the install command from the project's own README. Don't write one from memory.
5. Keep descriptions factual. No marketing language.
6. One entry per PR, please.

## What gets declined

- Your own project with no users yet. Share it in an issue first.
- Duplicates of something already listed, unless it's clearly better.
- Anything built to harm systems or people without authorization.

## Keeping it fresh

A [weekly check](.github/workflows/link-check.yml) tests every link and flags repos that were archived, moved or deleted. Problems land in an issue labeled `broken-link`, which makes a good first contribution.
