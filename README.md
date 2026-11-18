# AI Dev Toolkit

> The best **skills, plugins, MCP servers and workflows** for AI coding agents (Claude Code, Codex, Cursor, Copilot, Gemini CLI and more), organized across the whole software development lifecycle, from planning to shipping, plus writing.
>
> Each entry says **what it does**, **when to use it** and **how to install it**. Within every section, the strongest picks come first.

<p align="center">
  <a href="#-top-10">Top 10</a> ·
  <a href="#-andrej-karpathy">Karpathy</a> ·
  <a href="#1-full-workflows">Workflows</a> ·
  <a href="#2-plan-and-spec">Plan</a> ·
  <a href="#3-code">Code</a> ·
  <a href="#4-context-and-memory">Context</a> ·
  <a href="#5-design-and-ui">Design</a> ·
  <a href="#6-test-and-debug">Test</a> ·
  <a href="#7-review-and-ship">Review</a> ·
  <a href="#8-security">Security</a> ·
  <a href="#9-deploy-and-infrastructure">Deploy</a> ·
  <a href="#10-cost-and-usage">Cost</a> ·
  <a href="#11-docs-diagrams-and-visuals">Docs</a> ·
  <a href="#12-writing">Writing</a>
</p>

---

## Contents

- [🏆 Top 10](#-top-10)
- [🐐 Andrej Karpathy](#-andrej-karpathy)
- [Before you install](#before-you-install)
- **The SDLC**
  1. [Full workflows](#1-full-workflows)
  2. [Plan and spec](#2-plan-and-spec)
  3. [Code](#3-code)
  4. [Context and memory](#4-context-and-memory)
  5. [Design and UI](#5-design-and-ui)
  6. [Test and debug](#6-test-and-debug)
  7. [Review and ship](#7-review-and-ship)
  8. [Security](#8-security)
  9. [Deploy and infrastructure](#9-deploy-and-infrastructure)
  10. [Cost and usage](#10-cost-and-usage)
  11. [Docs, diagrams and visuals](#11-docs-diagrams-and-visuals)
- **Beyond code**
  12. [Writing](#12-writing)
  13. [Mobile](#13-mobile)
  14. [Career](#14-career)
  15. [Learning](#15-learning)
- [Find more](#find-more)
- [Write your own skill](#write-your-own-skill)
- [Contributing](#contributing)

---

## 🏆 Top 10

If you install nothing else, start here.

| # | Tool | Why |
|---|---|---|
| 1 | [Superpowers](#superpowers) | Makes the agent ask, spec and plan before it codes. The biggest single upgrade. |
| 2 | [Karpathy Guidelines](#karpathy-guidelines) | One `CLAUDE.md` that stops wrong assumptions, bloat and drive-by edits. |
| 3 | [Matt Pocock's Skills](#matt-pococks-skills) | Real engineering habits on demand: `/tdd`, `/diagnosing-bugs`, `/to-spec`. |
| 4 | [Context7](#context7) | Up-to-date library docs, so no more hallucinated APIs. |
| 5 | [GSD Core](#gsd-core) | Discuss, plan, execute, verify and ship in fresh context windows. |
| 6 | [Spec Kit](#spec-kit) | GitHub's toolkit for spec-driven development. |
| 7 | [Impeccable](#impeccable) | Stops generic "AI-looking" UIs. |
| 8 | [Humanizer](#humanizer) | Makes AI-written text read like a person wrote it. |
| 9 | [SkillSpector](#skillspector) | NVIDIA's scanner: check a skill is safe *before* you install it. |
| 10 | [TokenEconomizer](#tokeneconomizer) | Microsoft Research plugin that cut agent costs 18–31% on SWE-Bench. |

---

## 🐐 Andrej Karpathy

Karpathy coined "vibe coding," and much of how people work with LLMs today traces back to his posts and repos. Here's what's useful from his work, in order.

### Karpathy Guidelines

[multica-ai/andrej-karpathy-skills](https://github.com/multica-ai/andrej-karpathy-skills) ![stars](https://img.shields.io/github/stars/multica-ai/andrej-karpathy-skills?style=flat-square&label=%E2%AD%90)

A single `CLAUDE.md` built from [Karpathy's observations](https://x.com/karpathy/status/2015883857489522876) on where LLMs go wrong when coding: silent wrong assumptions, 1,000 lines where 100 would do, and edits to code they don't understand. It turns those into four rules:

| Principle | Fixes |
|---|---|
| **Think before coding** | Wrong assumptions, hidden confusion, missing tradeoffs |
| **Simplicity first** | Over-engineering, bloated abstractions |
| **Surgical changes** | Touching code that's unrelated to the task |
| **Goal-driven execution** | No clear success criteria; it pushes tests first |

```
/plugin marketplace add forrestchang/andrej-karpathy-skills
/plugin install andrej-karpathy-skills@karpathy-skills
```

**Best for:** everyone. This is the cheapest upgrade on the list: one file, always on.

### autoresearch

[karpathy/autoresearch](https://github.com/karpathy/autoresearch) ![stars](https://img.shields.io/github/stars/karpathy/autoresearch?style=flat-square&label=%E2%AD%90)

Give an agent a small but real LLM training setup and let it experiment overnight. It edits `train.py`, trains for 5 minutes, keeps the change if validation improved, and repeats. You only edit `program.md`, the agent's instructions. It's a clean, tiny template for any "agent improves a metric in a loop" setup.

```bash
uv run prepare.py   # one-time data + tokenizer
# then point your agent at program.md
```

**Heads-up:** needs a GPU.

### LLM Council

[karpathy/llm-council](https://github.com/karpathy/llm-council) ![stars](https://img.shields.io/github/stars/karpathy/llm-council?style=flat-square&label=%E2%AD%90)

Ask several LLMs the same question. Each one then reviews and ranks the others' answers anonymously, and a "chairman" model writes the final answer. It's a quick way to compare models side by side and get a better answer on hard questions. Karpathy calls it a "vibe coded" Saturday hack.

### rendergit

[karpathy/rendergit](https://github.com/karpathy/rendergit) ![stars](https://img.shields.io/github/stars/karpathy/rendergit?style=flat-square&label=%E2%AD%90)

Flattens any GitHub repo into one static HTML page with syntax highlighting. It has a human view and an LLM view, so you can paste a whole repo into a chat.

```bash
uv tool install git+https://github.com/karpathy/rendergit
rendergit https://github.com/karpathy/nanogpt
```

### reader3

[karpathy/reader3](https://github.com/karpathy/reader3) ![stars](https://img.shields.io/github/stars/karpathy/reader3?style=flat-square&label=%E2%AD%90)

A tiny self-hosted EPUB reader that shows one chapter at a time, so you can paste it into an LLM and read along together. It shows how small a useful LLM workflow tool can be.

### Learn how LLMs actually work

The best free path from zero to understanding the models your agent runs on:

| Repo | What you learn |
|---|---|
| [nn-zero-to-hero](https://github.com/karpathy/nn-zero-to-hero) | Video course: neural nets from scratch up to GPT |
| [micrograd](https://github.com/karpathy/micrograd) | Backprop in about 100 lines; start here |
| [minbpe](https://github.com/karpathy/minbpe) | How tokenizers work (BPE) |
| [nanoGPT](https://github.com/karpathy/nanoGPT) | Train a GPT in a few hundred lines |
| [nanochat](https://github.com/karpathy/nanochat) | The full pipeline: tokenizer, pretraining, finetuning, eval and a chat UI on one GPU node |
| [llm.c](https://github.com/karpathy/llm.c) | LLM training in raw C/CUDA |

---

## Before you install

### What's what

| Thing | What it gives the agent | Example |
|---|---|---|
| **Skill** | Know-how: *how* to do a task well. A folder with a `SKILL.md` that loads only when relevant. | `/tdd` |
| **MCP server** | Tools: *access* to a system (browser, GitHub, docs) | Playwright MCP |
| **Plugin** | A bundle of skills, commands, hooks and MCP config | Superpowers |
| **Workflow / framework** | A whole process: phases, roles, artifacts | GSD, BMAD, Spec Kit |
| **CLAUDE.md / AGENTS.md** | Always-on project rules | Karpathy Guidelines |

### Three ways to install a skill

```bash
# 1. skills CLI: works across 70+ agents
npx skills add <owner>/<repo>        # this project
npx skills add <owner>/<repo> -g     # all projects

# 2. Claude Code plugin marketplace
/plugin marketplace add <owner>/<repo>
/plugin install <plugin>@<marketplace>

# 3. By hand
cp -r some-skill ~/.claude/skills/
```

Start a new session afterwards.

> [!IMPORTANT]
> **Skills run with your agent's permissions.** NVIDIA's research found vulnerabilities in 26% of 31,000 skills analyzed. Scan anything unfamiliar with [SkillSpector](#skillspector) first.

> [!TIP]
> **Don't install everything.** Pick one workflow, one design skill and Context7. Use them for a week, then add more. Overlapping skills make agents less predictable.

---

## 1. Full workflows

End-to-end methods that run the whole cycle: idea, spec, plan, build, test, ship. **Pick one.** They overlap.

### Superpowers

[obra/superpowers](https://github.com/obra/superpowers) ![stars](https://img.shields.io/github/stars/obra/superpowers?style=flat-square&label=%E2%AD%90)

The most popular agent methodology. When you start building, the agent doesn't jump to code. It asks what you're really trying to do, shows you a spec in short chunks you can actually read, writes a plan, then builds with TDD and subagents. It works with Claude Code, Codex, Cursor, Gemini CLI, Copilot CLI, OpenCode and more.

```
/plugin install superpowers@claude-plugins-official
```

**Best for:** anyone who wants one solid default process.

### GSD Core

[open-gsd/gsd-core](https://github.com/open-gsd/gsd-core) ![stars](https://img.shields.io/github/stars/open-gsd/gsd-core?style=flat-square&label=%E2%AD%90)

**Get Shit Done**, the community home since the original `gsd-build/get-shit-done` repo was archived. It solves *context rot*: quality drops as a session fills up. Every milestone runs a five-step loop of **Discuss, Plan, Execute, Verify and Ship**, and each executor starts in a fresh 200k-token context.

```bash
npx @opengsd/gsd-core@latest
# then: /gsd-new-project   or   /gsd-onboard (existing repo)
```

**Best for:** long projects where sessions fall apart halfway through.

### gstack

[garrytan/gstack](https://github.com/garrytan/gstack) ![stars](https://img.shields.io/github/stars/garrytan/gstack?style=flat-square&label=%E2%AD%90)

Garry Tan's (CEO of Y Combinator) daily setup. It turns your agent into a virtual team with specialist roles: a CEO who rethinks the product, an eng manager who locks the architecture, a designer who catches AI slop, a reviewer who finds production bugs, plus QA and release. Every change carries its tests and review evidence.

```bash
git clone --single-branch --depth 1 https://github.com/garrytan/gstack.git ~/.claude/skills/gstack \
  && cd ~/.claude/skills/gstack && ./setup
```

**Best for:** founders and solo builders who want a whole team's judgment.

### BMAD Method

[bmad-code-org/BMAD-METHOD](https://github.com/bmad-code-org/BMAD-METHOD) ![stars](https://img.shields.io/github/stars/bmad-code-org/BMAD-METHOD?style=flat-square&label=%E2%AD%90)

"Breakthrough Method for Agile AI-Driven Development." It brings agile roles and phases (analyst, PM, architect, stories, dev) to your agent as installable modules. It also has a Founder module for pricing, fundraising and the business side.

```bash
npx bmad-method install
```

**Best for:** building a whole product from zero, with documents at every phase.

### SuperClaude

[SuperClaude-Org/SuperClaude_Framework](https://github.com/SuperClaude-Org/SuperClaude_Framework) ![stars](https://img.shields.io/github/stars/SuperClaude-Org/SuperClaude_Framework?style=flat-square&label=%E2%AD%90)

A configuration framework that adds 30 commands, 20 agents, 7 behavioral modes and 8 MCP server integrations to Claude Code.

```
/plugin marketplace add SuperClaude-Org/superclaude-plugin-marketplace
/plugin install superclaude
```

### wshobson/agents

[wshobson/agents](https://github.com/wshobson/agents) ![stars](https://img.shields.io/github/stars/wshobson/agents?style=flat-square&label=%E2%AD%90)

The biggest catalog here: 93 plugins with about 200 agents, 185 skills and 100 commands for Python, JS, review, testing, infra and more. They're written once and adapted for Claude Code, Codex, Cursor, OpenCode, Copilot and others. Install only the plugins you need.

```
/plugin marketplace add wshobson/agents
/plugin install python-development@claude-code-workflows
```

### Leo's Claude Starter

[leogodin217/leos_claude_starter](https://github.com/leogodin217/leos_claude_starter) ![stars](https://img.shields.io/github/stars/leogodin217/leos_claude_starter?style=flat-square&label=%E2%AD%90)

One developer's real setup of skills, agents and hooks, shared across many repos with symlinks so a fix lands everywhere. Read it to see how someone *actually* organizes this.

---

## 2. Plan and spec

Agree on **what** to build before the agent builds it.

### Spec Kit

[github/spec-kit](https://github.com/github/spec-kit) ![stars](https://img.shields.io/github/stars/github/spec-kit?style=flat-square&label=%E2%AD%90)

GitHub's open-source toolkit for spec-driven development. It gives agents structured processes with templates and documented outcomes: a feature goes from spec to plan, implementation and convergence. A bug goes from cause to scoped fix to verification.

```bash
uv tool install specify-cli
specify init my-project --integration copilot   # use your agent's key
```

### Elephant-Goldfish Model

[google/elephant-goldfish-model](https://github.com/google/elephant-goldfish-model) ![stars](https://img.shields.io/github/stars/google/elephant-goldfish-model?style=flat-square&label=%E2%AD%90)

From Google: **design with an elephant, review with a goldfish.** The Elephant holds your project context and drafts the spec. Goldfish reviewers then check it *without* the earlier conversation, so they catch unstated assumptions and blind spots. It can also report where your design docs have drifted from the code.

```bash
claude plugin marketplace add google/elephant-goldfish-model
claude plugin install egm@egm
# try: /egm:egm-review docs/designs/my-design.md
```

**Best for:** design docs and PR plans that need a fresh-eyes review.

### OpenSpec

[Fission-AI/OpenSpec](https://github.com/Fission-AI/OpenSpec) ![stars](https://img.shields.io/github/stars/Fission-AI/OpenSpec?style=flat-square&label=%E2%AD%90)

Lightweight spec-driven development. You and the agent agree on a change proposal first, then build against it. It's lighter than Spec Kit and works on existing codebases.

```bash
npm install -g @fission-ai/openspec@latest
```

### Task Master

[eyaltoledano/claude-task-master](https://github.com/eyaltoledano/claude-task-master) ![stars](https://img.shields.io/github/stars/eyaltoledano/claude-task-master?style=flat-square&label=%E2%AD%90)

A task-management system for AI-driven development. It breaks a project into tasks your agent works through one at a time. It runs as an MCP server in Claude Code, Cursor, Windsurf and others.

```bash
claude mcp add taskmaster-ai -- npx -y task-master-ai
```

### Spec Kitty

[spec-kitty/spec-kitty](https://github.com/spec-kitty/spec-kitty) ![stars](https://img.shields.io/github/stars/spec-kitty/spec-kitty?style=flat-square&label=%E2%AD%90)

Spec-driven development with **team governance**. Specs say what to build, and a Charter enforces how, across whichever agent each teammate uses.

```bash
pipx install spec-kitty-cli
```

---

## 3. Code

Skills that make day-to-day coding sharper.

### Matt Pocock's Skills

[mattpocock/skills](https://github.com/mattpocock/skills) ![stars](https://img.shields.io/github/stars/mattpocock/skills?style=flat-square&label=%E2%AD%90)

"Skills for real engineers." Small, sharp tools you call by name:

- `/tdd`: red-green-refactor, one vertical slice at a time
- `/diagnosing-bugs`: a reproduce, minimize, hypothesize, instrument, fix loop
- `/to-spec` and `/to-tickets`: turn a chat into a spec, then into tickets
- `/implement`: build from tickets, then review before committing
- `/prototype`, `/domain-modeling`, `/retro` and more

```bash
claude plugin install mattpocock-skills@claude-plugins-official
```

Run `/setup-matt-pocock-skills` once per repo.

### Ponytail

[DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail) ![stars](https://img.shields.io/github/stars/DietrichGebert/ponytail?style=flat-square&label=%E2%AD%90)

"Makes your AI agent think like the laziest senior dev in the room. The best code is the code you never wrote." It steers the agent toward the smallest change that works.

```
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
```

**Best for:** agents that over-engineer or rewrite things nobody asked them to.

### Anthropic Skills

[anthropics/skills](https://github.com/anthropics/skills) ![stars](https://img.shields.io/github/stars/anthropics/skills?style=flat-square&label=%E2%AD%90)

Anthropic's official skills. They include example skills (web-app testing, MCP server generation, art and more) and the **document skills** behind Claude's Word, PDF, PowerPoint and Excel features. It's the reference for how skills should be written.

```
/plugin marketplace add anthropics/skills
/plugin install example-skills@anthropic-agent-skills
```

---

## 4. Context and memory

Give the agent the right information: current docs, your codebase and what happened last session.

### Context7

[upstash/context7](https://github.com/upstash/context7) ![stars](https://img.shields.io/github/stars/upstash/context7?style=flat-square&label=%E2%AD%90)

LLMs are trained on year-old docs, so they hallucinate APIs. Context7 pulls **up-to-date, version-specific docs and code examples** straight from the source into your agent. Add "use context7" to a prompt.

```bash
npx ctx7 setup
```

**Best for:** anyone using fast-moving libraries (Next.js, Flutter, Supabase…).

### claude-mem

[thedotmack/claude-mem](https://github.com/thedotmack/claude-mem) ![stars](https://img.shields.io/github/stars/thedotmack/claude-mem?style=flat-square&label=%E2%AD%90)

Persistent memory across sessions. It captures what your agent does, compresses it and brings the relevant parts back next time. Your second session in a project opens already knowing the first.

```bash
npx claude-mem install
```

**Heads-up:** anonymous analytics are on by default. Turn them off with `npx claude-mem telemetry disable`.

### Graphify

[Graphify-Labs/graphify](https://github.com/Graphify-Labs/graphify) ![stars](https://img.shields.io/github/stars/Graphify-Labs/graphify?style=flat-square&label=%E2%AD%90)

Turns a codebase, along with its docs, SQL schemas, configs and PDFs, into a queryable knowledge graph. It uses local, deterministic AST parsing, explains every edge and needs no vector store.

```bash
uv tool install graphifyy && graphify install
# then in your agent: /graphify .
```

**Best for:** joining a new project or contributing to a big open-source repo.

### Serena

[oraios/serena](https://github.com/oraios/serena) ![stars](https://img.shields.io/github/stars/oraios/serena?style=flat-square&label=%E2%AD%90)

"The IDE for your coding agent." An MCP toolkit with **symbol-level** code search, editing and refactoring, so the agent doesn't have to grep and edit line numbers. It helps most in large codebases.

```bash
uv tool install -p 3.13 serena-agent
```

**Heads-up:** the authors say *not* to install it from MCP marketplaces, which have outdated commands.

### Repomix

[yamadashy/repomix](https://github.com/yamadashy/repomix) ![stars](https://img.shields.io/github/stars/yamadashy/repomix?style=flat-square&label=%E2%AD%90)

Packs an entire repo into one AI-friendly file you can paste into any chat. It also runs as an MCP server. For a browsable version, see Karpathy's [rendergit](#rendergit).

```bash
npx repomix@latest
```

---

## 5. Design and UI

Agents default to purple gradients and identical card grids. These skills fix that.

### Impeccable

[pbakaus/impeccable](https://github.com/pbakaus/impeccable) ![stars](https://img.shields.io/github/stars/pbakaus/impeccable?style=flat-square&label=%E2%AD%90)

"The design vocabulary for your coding agent." Steer with `polish` and `bolder`, review with `critique` and `audit`. It includes a CLI detector that catches AI-slop patterns and can run in CI.

```bash
npx impeccable install
npx impeccable detect src/
```

### Taste Skill

[Leonxlnx/taste-skill](https://github.com/Leonxlnx/taste-skill) ![stars](https://img.shields.io/github/stars/Leonxlnx/taste-skill?style=flat-square&label=%E2%AD%90)

Art direction for agents. It works from reference images and checks the result in a real browser.

```bash
npx skills add https://github.com/Leonxlnx/taste-skill --skill "design-taste-frontend"
```

### Hallmark

[Nutlope/hallmark](https://github.com/Nutlope/hallmark) ![stars](https://img.shields.io/github/stars/Nutlope/hallmark?style=flat-square&label=%E2%AD%90)

An anti-AI-slop design skill with a `sloplint` checker. It works with Claude Code, Cursor and Codex.

```bash
npx skills add nutlope/hallmark -g
```

### Emil Kowalski's Skills

[emilkowalski/skills](https://github.com/emilkowalski/skills) ![stars](https://img.shields.io/github/stars/emilkowalski/skills?style=flat-square&label=%E2%AD%90)

UI and animation craft from a design engineer who worked at Vercel and Linear. They fix small mistakes that add up, like `ease-in` on enter animations or solid borders where a soft shadow belongs.

```bash
npx skills@latest add emilkowalski/skills
```

---

## 6. Test and debug

Let the agent see and drive the running app.

### Chrome DevTools for Agents

[ChromeDevTools/chrome-devtools-mcp](https://github.com/ChromeDevTools/chrome-devtools-mcp) ![stars](https://img.shields.io/github/stars/ChromeDevTools/chrome-devtools-mcp?style=flat-square&label=%E2%AD%90)

From the Chrome team. Your agent controls and inspects a live Chrome browser: performance traces, network requests, console and screenshots. It's available as an MCP server, a CLI and skills.

```
/plugin marketplace add ChromeDevTools/chrome-devtools-mcp
/plugin install chrome-devtools-mcp@chrome-devtools-plugins
```

**Best for:** debugging front-end bugs and performance.

### Playwright CLI

[microsoft/playwright-cli](https://github.com/microsoft/playwright-cli) ![stars](https://img.shields.io/github/stars/microsoft/playwright-cli?style=flat-square&label=%E2%AD%90)

Microsoft's recommended way for coding agents to use Playwright: a CLI plus skills. It uses fewer tokens than MCP because it doesn't load big tool schemas or accessibility trees into context. It records and generates tests, inspects selectors and takes screenshots.

```bash
npm install -g @playwright/cli@latest
```

### Playwright MCP

[microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp) ![stars](https://img.shields.io/github/stars/microsoft/playwright-mcp?style=flat-square&label=%E2%AD%90)

Browser automation over MCP using the accessibility tree, so no vision model is needed. Use it for long exploratory or self-healing test loops. For everyday coding, the CLI above is lighter.

```bash
claude mcp add playwright npx @playwright/mcp@latest
```

> For TDD and bug diagnosis skills, see [Matt Pocock's Skills](#matt-pococks-skills) (`/tdd`, `/diagnosing-bugs`).

---

## 7. Review and ship

### Claude Code Action

[anthropics/claude-code-action](https://github.com/anthropics/claude-code-action) ![stars](https://img.shields.io/github/stars/anthropics/claude-code-action?style=flat-square&label=%E2%AD%90)

Claude in your GitHub PRs and issues. Mention it to review a PR, answer questions about the code or implement fixes and features.

```
# inside Claude Code:
/install-github-app
```

### GitHub MCP Server

[github/github-mcp-server](https://github.com/github/github-mcp-server) ![stars](https://img.shields.io/github/stars/github/github-mcp-server?style=flat-square&label=%E2%AD%90)

GitHub's official MCP server. Agents can read repos, manage issues and PRs, check Actions runs, investigate failing builds and review Dependabot alerts.

```bash
claude mcp add github -e GITHUB_PERSONAL_ACCESS_TOKEN=$GITHUB_PAT -- \
  docker run -i --rm -e GITHUB_PERSONAL_ACCESS_TOKEN ghcr.io/github/github-mcp-server
```

### Claude Code Security Review

[anthropics/claude-code-security-review](https://github.com/anthropics/claude-code-security-review) ![stars](https://img.shields.io/github/stars/anthropics/claude-code-security-review?style=flat-square&label=%E2%AD%90)

A GitHub Action that security-reviews every PR. It reads only the changed files, comments its findings on the PR and filters out false positives. Setup is a workflow file; see the README.

---

## 8. Security

### SkillSpector

[NVIDIA/SkillSpector](https://github.com/NVIDIA/SkillSpector) ![stars](https://img.shields.io/github/stars/NVIDIA/SkillSpector?style=flat-square&label=%E2%AD%90)

NVIDIA's security scanner for agent skills. Skills run with your agent's trust, and in NVIDIA's dataset **26.1% had vulnerabilities and 5.2% looked malicious.** SkillSpector checks 71 patterns in 17 categories, including prompt injection, data exfiltration, privilege escalation, supply chain and memory poisoning. It gives a 0–100 risk score with JSON, Markdown or SARIF output.

```bash
uv tool install --python 3.13 git+https://github.com/NVIDIA/skillspector.git
skillspector scan ./some-skill/
```

**Best for:** everyone. Run it before installing any skill from someone you don't know.

### Trail of Bits Skills

[trailofbits/skills](https://github.com/trailofbits/skills) ![stars](https://img.shields.io/github/stars/trailofbits/skills?style=flat-square&label=%E2%AD%90)

Security research, vulnerability detection and audit workflows from one of the best-known security firms.

```
/plugin marketplace add trailofbits/skills
/plugin menu
```

### Cloudflare Security Audit

[cloudflare/security-audit-skill](https://github.com/cloudflare/security-audit-skill) ![stars](https://img.shields.io/github/stars/cloudflare/security-audit-skill?style=flat-square&label=%E2%AD%90)

A multi-phase security audit with independently verified, machine-readable findings.

```bash
npx skills add https://github.com/cloudflare/security-audit-skill --skill security-audit
```

### Claude Red

[SnailSploit/Claude-Red](https://github.com/SnailSploit/Claude-Red) ![stars](https://img.shields.io/github/stars/SnailSploit/Claude-Red?style=flat-square&label=%E2%AD%90)

Offensive-security skills for pentesters, one per attack surface.

> [!WARNING]
> Only for systems you own or are explicitly authorized to test.

---

## 9. Deploy and infrastructure

Official skills from the platforms themselves.

| Tool | What it does | Install |
|---|---|---|
| [Vercel Agent Skills](https://github.com/vercel-labs/agent-skills) | `vercel-optimize` audits cost, performance and caching from real metrics; `web-design-guidelines` reviews UI | `npx skills add vercel-labs/agent-skills` |
| [Supabase Agent Skills](https://github.com/supabase/agent-skills) | Supabase and Postgres best practices for 18+ agents | `npx skills add supabase/agent-skills` |
| [HashiCorp Agent Skills](https://github.com/hashicorp/agent-skills) | 16 Terraform and 4 Packer skills, including style guides | `npx skills add hashicorp/agent-skills` |

### AX (Agent Executor)

[google/ax](https://github.com/google/ax) ![stars](https://img.shields.io/github/stars/google/ax?style=flat-square&label=%E2%AD%90)

Google's runtime for running large numbers of sandboxed agent tasks on Kubernetes. You declare a `Workspace`, a `Task` and a `Model` in YAML, then `ax apply`. It's for building agent platforms, not for everyday coding. It's in heavy development.

---

## 10. Cost and usage

### TokenEconomizer

[microsoft/TokenEconomizer](https://github.com/microsoft/TokenEconomizer) ![stars](https://img.shields.io/github/stars/microsoft/TokenEconomizer?style=flat-square&label=%E2%AD%90)

From Microsoft Research and UC Berkeley. It makes agents cheaper in repos you work in often, without changing the agent. On SWE-Bench it cut mean cost by **18.4–30.9%** across five agent–model combinations, and Pass@1 went *up* in 4 of 5. It works in three ways:

- **Micro-skills** remember repo facts the agent keeps rediscovering (which test command works, what must build first).
- **Tool pruning** stops loading tools you never use.
- **A loop guard** steps in when a turn is stuck repeating the same failures.

Everything it learns stays local in `~/.tokeneconomizer`.

```bash
git clone https://github.com/microsoft/TokenEconomizer.git
claude plugin marketplace add "$PWD/TokenEconomizer"
claude plugin install tokeneconomizer@tokeneconomizer
```

### ccusage

[ccusage/ccusage](https://github.com/ccusage/ccusage) ![stars](https://img.shields.io/github/stars/ccusage/ccusage?style=flat-square&label=%E2%AD%90)

Daily, weekly, monthly and per-session token and cost reports from your agent CLIs' local data. You'll finally know where the money goes.

```bash
npx ccusage@latest
```

---

## 11. Docs, diagrams and visuals

### Visual Explainer

[nicobailon/visual-explainer](https://github.com/nicobailon/visual-explainer) ![stars](https://img.shields.io/github/stars/nicobailon/visual-explainer?style=flat-square&label=%E2%AD%90)

Turns terminal walls of text into styled HTML pages: architecture diagrams, `/diff-review`, `/plan-review`, data tables and slide decks.

```
/plugin marketplace add nicobailon/visual-explainer
/plugin install visual-explainer@visual-explainer-marketplace
```

### Diagram Design

[cathrynlavery/diagram-design](https://github.com/cathrynlavery/diagram-design) ![stars](https://img.shields.io/github/stars/cathrynlavery/diagram-design?style=flat-square&label=%E2%AD%90)

Editorial-quality diagrams: 45 types as self-contained HTML + SVG. "No Mermaid slop."

```bash
npx skills add cathrynlavery/diagram-design
```

### Anatomy

[wheresryan22/anatomy](https://github.com/wheresryan22/anatomy) ![stars](https://img.shields.io/github/stars/wheresryan22/anatomy?style=flat-square&label=%E2%AD%90)

Interactive isometric illustrations of machines and complex systems, rendered as SVG with optional WebGL effects.

```bash
npx skills add wheresryan22/anatomy -g
```

---

## 12. Writing

### Humanizer

[blader/humanizer](https://github.com/blader/humanizer) ![stars](https://img.shields.io/github/stars/blader/humanizer?style=flat-square&label=%E2%AD%90)

Makes AI-written text sound like a person wrote it, without changing what it says. It's built on Wikipedia's [Signs of AI writing](https://en.wikipedia.org/wiki/Wikipedia:Signs_of_AI_writing) guide: it cuts the "I'm thrilled to announce 🚀" tone, the em-dash habit and the filler. In a blind test, judges preferred its rewrite 16 out of 16 times. It edits for readers and doesn't try to evade AI detectors.

```
/plugin marketplace add blader/humanizer
/plugin install humanizer@humanizer
```

**Best for:** READMEs, PR descriptions, docs, emails and LinkedIn posts.

### Marketing Skills

[coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) ![stars](https://img.shields.io/github/stars/coreyhaines31/marketingskills?style=flat-square&label=%E2%AD%90)

Copywriting, SEO, conversion optimization (CRO), analytics and growth skills for founders and technical marketers.

```bash
npx skills add coreyhaines31/marketingskills --skill copywriting
```

### Anthropic Document Skills

[anthropics/skills](https://github.com/anthropics/skills) ![stars](https://img.shields.io/github/stars/anthropics/skills?style=flat-square&label=%E2%AD%90)

The skills behind Claude's file creation: write and edit **Word, PDF, PowerPoint and Excel** files from your agent.

```
/plugin install document-skills@anthropic-agent-skills
```

---

## 13. Mobile

| Tool | What it does | Install |
|---|---|---|
| [Flutter Agent Plugins](https://github.com/flutter/agent-plugins) | Official, from the Flutter team: widget and integration tests, responsive layouts, layout-overflow fixes, architecture, JSON serialization | [docs.flutter.dev/ai/get-started](https://docs.flutter.dev/ai/get-started) |
| [Dart Skills](https://github.com/dart-lang/skills) | Official Dart skills; pair them with the above | see repo |
| [Expo Skills](https://github.com/expo/skills) | Official, from the Expo team: build, deploy, upgrade and debug Expo and React Native apps | `npx skills@latest add expo/skills --skill '*'` |

---

## 14. Career

### career-ops

[career-ops-hq/career-ops](https://github.com/career-ops-hq/career-ops) ![stars](https://img.shields.io/github/stars/career-ops-hq/career-ops?style=flat-square&label=%E2%AD%90)

An open-source job-search agent. It scans job boards, scores each role 1–5 against your CV, tailors an ATS-friendly resume and cover letter, preps you for interviews and tracks applications. You still press Submit.

```bash
npx @santifer/career-ops init
```

### Multi-Claude career skills

Small skills by [alexyc9381](https://github.com/alexyc9381) that run a panel of Claudes:

| Skill | What it does |
|---|---|
| [hiring-panel](https://github.com/alexyc9381/hiring-panel-skill) | 7 Claudes try to reject your resume, then rebuild it |
| [mock-interview](https://github.com/alexyc9381/mock-interview-skill) | Interviews you from a real job post and grades every answer |
| [hunter](https://github.com/alexyc9381/hunter-skill) | Finds and scores jobs that fit you |
| [linkedin-roast](https://github.com/alexyc9381/linkedin-roast-skill) | Roasts your LinkedIn, then fixes it |
| [client-room](https://github.com/alexyc9381/client-room-skill) | Finds paying clients for freelancers |

---

## 15. Learning

### LearnHarness

[amosblomqvist/learnharness](https://github.com/amosblomqvist/learnharness) ![stars](https://img.shields.io/github/stars/amosblomqvist/learnharness?style=flat-square&label=%E2%AD%90)

An agent harness for learning hard things. It measures where your understanding ends, plans a path to your goal, teaches one reasoning step at a time and keeps a knowledge graph across sessions. Download it from [learnharness.ai](https://learnharness.ai).

To understand the models themselves, see [Karpathy's learning path](#learn-how-llms-actually-work).

---

## Find more

- [vercel-labs/skills](https://github.com/vercel-labs/skills) is the `npx skills` CLI. Search with `npx skills find`, or browse [skills.sh](https://skills.sh).
- [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official) has Anthropic's own Claude Code plugins. Browse them in Claude Code with `/plugin` → Discover.
- [hesreallyhim/awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) is a large curated list of Claude Code resources.
- [BehiSecc/awesome-claude-skills](https://github.com/BehiSecc/awesome-claude-skills) and [karanb192/awesome-claude-skills](https://github.com/karanb192/awesome-claude-skills) are curated skill lists.

---

## Write your own skill

The fastest way to learn is to write one:

```markdown
---
name: commit-message
description: Write a conventional commit message for the staged changes. Use when the user asks to commit or write a commit message.
---

1. Run `git diff --staged` and read the changes.
2. Pick a type: feat, fix, docs, refactor, test or chore.
3. Write a subject under 72 characters in the imperative mood.
4. Add a body only if the *why* isn't obvious from the diff.
```

Save it as `~/.claude/skills/commit-message/SKILL.md` and start a new session.

- **The description is the trigger.** Say *what* the skill does and *when* to use it.
- **Keep `SKILL.md` short.** Move long references into separate files.
- **Write steps, not essays.** Agents follow checklists better than prose.
- **Study the best:** [anthropics/skills](https://github.com/anthropics/skills) and [mattpocock/skills](https://github.com/mattpocock/skills).

---

## Contributing

Found something that made your agent noticeably better? Open a PR. See [CONTRIBUTING.md](CONTRIBUTING.md).

If this helped you, a ⭐ helps others find it.

## License

[CC0 1.0](LICENSE). This list is in the public domain. Each linked project has its own license.
