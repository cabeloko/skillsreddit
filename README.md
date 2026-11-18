# Agent Skills Handbook

> A hand-picked list of **agent skills, plugins and workflows** that make AI coding agents (Claude Code, Codex, Cursor, Copilot, Gemini CLI and more) plan better, design better and ship better code. Each entry includes what it does, who it's for and how to install it.

Most "AI made my code worse" stories come from agents with no process and no taste. Skills fix that. They're small folders of instructions an agent loads when it needs them. This list collects the ones worth installing and explains how to use them.

## Contents

- [What is a skill?](#what-is-a-skill)
- [How to install skills](#how-to-install-skills)
- [Where to start](#where-to-start)
- [Engineering workflow](#engineering-workflow)
- [Spec-driven development](#spec-driven-development)
- [Design and UI taste](#design-and-ui-taste)
- [Diagrams and visuals](#diagrams-and-visuals)
- [Understanding a codebase](#understanding-a-codebase)
- [Security](#security)
- [Framework-specific](#framework-specific)
- [Career and job search](#career-and-job-search)
- [Learning](#learning)
- [Running agents at scale](#running-agents-at-scale)
- [More lists](#more-lists)
- [Write your own skill](#write-your-own-skill)
- [Contributing](#contributing)

---

## What is a skill?

A **skill** is a folder with a `SKILL.md` file. The file has a short description at the top and instructions underneath, plus any scripts or reference files the instructions need.

```
my-skill/
├── SKILL.md        # name + description + instructions
├── scripts/        # optional helpers the agent can run
└── references/     # optional docs loaded only when needed
```

The agent sees only the **description** until a task matches it. Then it reads the full instructions. You can install dozens of skills without bloating every conversation.

Skills vs. the other things you'll hear about:

| Thing | What it gives the agent | Example |
|---|---|---|
| **Skill** | Know-how: *how* to do a task well | "Write tests red-green-refactor" |
| **MCP server** | Tools: *access* to a system | "Query this database" |
| **Plugin** | A bundle of skills, commands, hooks and MCP config | `superpowers` |
| **CLAUDE.md / AGENTS.md** | Always-on project rules | "Use pnpm, not npm" |

## How to install skills

There are three common ways. Each entry below shows the one its authors recommend.

**1. The `skills` CLI** (works across many agents)

```bash
npx skills add <owner>/<repo>          # into the current project
npx skills add <owner>/<repo> -g       # for every project
```

**2. A Claude Code plugin marketplace**

```
/plugin marketplace add <owner>/<repo>
/plugin install <plugin>@<marketplace>
```

**3. Copy the folder by hand**

```bash
cp -r some-skill ~/.claude/skills/     # Claude Code, all projects
cp -r some-skill .claude/skills/       # this project only
```

Start a new session after installing so the agent picks the skill up.

> [!TIP]
> Don't install everything. Start with one workflow skill and one design skill, use them for a week, then add more. Too many overlapping skills can make an agent less predictable.

## Where to start

| If you want to... | Install |
|---|---|
| Stop the agent from jumping straight into code | [Superpowers](#engineering-workflow) |
| Get smaller, simpler diffs | [Ponytail](#engineering-workflow) |
| Have real engineering habits: TDD, specs, tickets, debugging | [Matt Pocock's skills](#engineering-workflow) |
| Stop generic "AI-looking" UIs | [Impeccable](#design-and-ui-taste) or [Hallmark](#design-and-ui-taste) |
| Agree on *what* to build before building it | [OpenSpec](#spec-driven-development) |
| Find your way around a big unfamiliar repo | [Graphify](#understanding-a-codebase) |
| Build Flutter apps with an agent | [Flutter Agent Plugins](#framework-specific) |
| Find a job | [career-ops](#career-and-job-search) |

---

## Engineering workflow

Skills that change *how* the agent works: ask before building, plan, test, review.

### [Superpowers](https://github.com/obra/superpowers) ![stars](https://img.shields.io/github/stars/obra/superpowers?style=flat-square&label=%E2%AD%90)

A full development methodology built from composable skills. When you start building something, the agent first asks what you're really trying to do. Then it writes a spec in readable chunks, plans the work and implements it with test-driven, subagent-driven development.

```
/plugin install superpowers@claude-plugins-official
```

**Use it when:** you want one opinionated process instead of assembling your own. Works with Claude Code, Codex, Cursor, Gemini CLI, Copilot CLI, OpenCode and others.

### [Matt Pocock's Skills](https://github.com/mattpocock/skills) ![stars](https://img.shields.io/github/stars/mattpocock/skills?style=flat-square&label=%E2%AD%90)

"Skills for real engineers," taken straight from Matt's own `.agents` directory. Includes `tdd`, `diagnosing-bugs`, `to-spec`, `to-tickets`, `implement`, `prototype`, `domain-modeling`, `retro` and more. Run `/setup-matt-pocock-skills` once per repo.

```bash
claude plugin install mattpocock-skills@claude-plugins-official
# other agents:
npx skills@latest add mattpocock/skills
```

**Use it when:** you want individual, sharp tools you can call by name, such as `/tdd` or `/diagnosing-bugs`.

### [Ponytail](https://github.com/DietrichGebert/ponytail) ![stars](https://img.shields.io/github/stars/DietrichGebert/ponytail?style=flat-square&label=%E2%AD%90)

"Makes your AI agent think like the laziest senior dev in the room. The best code is the code you never wrote." It pushes the agent toward the smallest change that works instead of a big rewrite.

```
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
```

**Use it when:** your agent keeps over-engineering, adding abstractions or touching files it didn't need to.

### [Leo's Claude Starter](https://github.com/leogodin217/leos_claude_starter) ![stars](https://img.shields.io/github/stars/leogodin217/leos_claude_starter?style=flat-square&label=%E2%AD%90)

One developer's real Claude Code setup of skills, agents, hooks and conventions, shared across several repos via symlinks so a fix lands everywhere at once. It's honest about its limits: "What this does not: Revolutionize anything."

```bash
git clone https://github.com/leogodin217/leos_claude_starter.git
# then follow the README to link /get-started into your project
```

**Use it when:** you want to see how someone actually organizes skills across many projects.

---

## Spec-driven development

Agree on *what* to build in a written spec, then let the agent build against it.

### [OpenSpec](https://github.com/Fission-AI/OpenSpec) ![stars](https://img.shields.io/github/stars/Fission-AI/OpenSpec?style=flat-square&label=%E2%AD%90)

Lightweight spec-driven development for AI coding assistants. You and the agent agree on a change proposal before any code is written.

```bash
npm install -g @fission-ai/openspec@latest   # Node 22.20+
```

**Use it when:** features keep coming out "almost right" because the requirements lived only in chat.

### [BMAD Method](https://github.com/bmad-code-org/BMAD-METHOD) ![stars](https://img.shields.io/github/stars/bmad-code-org/BMAD-METHOD?style=flat-square&label=%E2%AD%90)

"Breakthrough Method for Agile AI-Driven Development." It brings agile roles and workflows (analysis, planning, architecture, stories) to your agent as installable skill modules.

```bash
npx bmad-method install
```

**Use it when:** you're building a whole product, not a single feature, and want structured phases.

### [Spec Kitty](https://github.com/spec-kitty/spec-kitty) ![stars](https://img.shields.io/github/stars/spec-kitty/spec-kitty?style=flat-square&label=%E2%AD%90)

Spec-driven development with organizational governance. Specs tell agents *what* to build, and a Charter governs *how*. It has git-native missions and enforceable workflows across different agents.

```bash
pipx install spec-kitty-cli
```

**Use it when:** a team needs consistent standards no matter which agent each person uses.

---

## Design and UI taste

Agents default to the same purple gradients and card grids. These skills give them taste.

### [Impeccable](https://github.com/pbakaus/impeccable) ![stars](https://img.shields.io/github/stars/pbakaus/impeccable?style=flat-square&label=%E2%AD%90)

"The design vocabulary for your coding agent." Steer with commands like `polish` and `bolder`, review with `critique` and `audit`, and catch AI slop before it ships. It also includes a CLI detector you can run in CI.

```bash
npx impeccable install
npx impeccable detect src/      # scan for anti-patterns
```

### [Taste Skill](https://github.com/Leonxlnx/taste-skill) ![stars](https://img.shields.io/github/stars/Leonxlnx/taste-skill?style=flat-square&label=%E2%AD%90)

Gives coding agents art direction. It works from reference images and checks the result in a browser, so you don't get generic AI pages.

```bash
npx skills add https://github.com/Leonxlnx/taste-skill --skill "design-taste-frontend"
```

### [Hallmark](https://github.com/Nutlope/hallmark) ![stars](https://img.shields.io/github/stars/Nutlope/hallmark?style=flat-square&label=%E2%AD%90)

An anti-AI-slop design skill for Claude Code, Cursor and Codex, with a `sloplint` checker.

```bash
npx skills add nutlope/hallmark -g
```

### [Emil Kowalski's Skills](https://github.com/emilkowalski/skills) ![stars](https://img.shields.io/github/stars/emilkowalski/skills?style=flat-square&label=%E2%AD%90)

UI and animation skills from a designer-engineer who worked at Vercel and Linear. They cover the small mistakes agents make, like `ease-in` on enter animations or solid borders where a soft shadow belongs.

```bash
npx skills@latest add emilkowalski/skills
```

**Use them when:** the UI works but doesn't *feel* right.

---

## Diagrams and visuals

### [Diagram Design](https://github.com/cathrynlavery/diagram-design) ![stars](https://img.shields.io/github/stars/cathrynlavery/diagram-design?style=flat-square&label=%E2%AD%90)

Editorial-quality diagrams: 45 diagram types as self-contained HTML + SVG. "No shadows. No Mermaid slop."

```bash
npx skills add cathrynlavery/diagram-design
```

### [Anatomy](https://github.com/wheresryan22/anatomy) ![stars](https://img.shields.io/github/stars/wheresryan22/anatomy?style=flat-square&label=%E2%AD%90)

Creates detailed, interactive isometric illustrations of real machines and complex systems. It outputs polished SVGs with optional WebGL shaders. No API keys and no dependencies.

```bash
npx skills add wheresryan22/anatomy -g
```

**Use them when:** you're writing docs, a README or a blog post and want visuals that explain things.

---

## Understanding a codebase

### [Graphify](https://github.com/Graphify-Labs/graphify) ![stars](https://img.shields.io/github/stars/Graphify-Labs/graphify?style=flat-square&label=%E2%AD%90)

Turns any codebase, along with its docs, SQL schemas, configs and PDFs, into a queryable knowledge graph. It uses local, deterministic AST parsing, explains every edge and needs no vector store.

```bash
uv tool install graphifyy
graphify install          # registers the skill with your assistant
# then, in your agent:
/graphify .
```

**Use it when:** you've just joined a project, or you're about to contribute to a large open-source repo.

---

## Security

### [Cloudflare Security Audit](https://github.com/cloudflare/security-audit-skill) ![stars](https://img.shields.io/github/stars/cloudflare/security-audit-skill?style=flat-square&label=%E2%AD%90)

A multi-phase security audit skill from Cloudflare. Findings are independently verified and come out as machine-readable files.

```bash
npx skills add https://github.com/cloudflare/security-audit-skill --skill security-audit
```

### [Claude Red](https://github.com/SnailSploit/Claude-Red) ![stars](https://img.shields.io/github/stars/SnailSploit/Claude-Red?style=flat-square&label=%E2%AD%90)

A library of offensive-security skills for penetration testers and security researchers. Each skill covers one attack surface, from SQL injection to exploit development.

```bash
git clone https://github.com/SnailSploit/claude-red ~/.claude/skills/claude-red
```

> [!WARNING]
> Only use this on systems you own or are explicitly authorized to test (pentest engagements, CTFs, your own labs).

---

## Framework-specific

### [Flutter Agent Plugins](https://github.com/flutter/agent-plugins) ![stars](https://img.shields.io/github/stars/flutter/agent-plugins?style=flat-square&label=%E2%AD%90)

Official plugins from the Flutter team. They bundle skills, MCP config and rules for widget tests, integration tests, responsive layouts, fixing layout overflows, JSON serialization, architecture and more. Pair them with the [Dart skills](https://github.com/dart-lang/skills).

Install guide: [docs.flutter.dev/ai/get-started](https://docs.flutter.dev/ai/get-started)

**Example prompt:** *"Fix the overflow error on the profile page when the keyboard is visible."*

---

## Career and job search

### [career-ops](https://github.com/career-ops-hq/career-ops) ![stars](https://img.shields.io/github/stars/career-ops-hq/career-ops?style=flat-square&label=%E2%AD%90)

An open-source job-search agent. It scans job boards, scores each role 1–5 against your CV, tailors an ATS-friendly resume and cover letter, preps you for interviews and tracks applications. It never submits for you; you press Submit.

```bash
npx @santifer/career-ops init
```

### Alex's career skills (by [alexyc9381](https://github.com/alexyc9381))

Small, fun, multi-agent Claude Code skills, all MIT-licensed:

| Skill | What it does |
|---|---|
| [hiring-panel](https://github.com/alexyc9381/hiring-panel-skill) | Seven Claudes try to reject your resume, then rebuild it with every mistake fixed |
| [hunter](https://github.com/alexyc9381/hunter-skill) | Five Claudes find jobs that fit you, score them and tailor your application |
| [mock-interview](https://github.com/alexyc9381/mock-interview-skill) | Interviews you from a real job post, grades every answer and rewrites the weak ones |
| [linkedin-roast](https://github.com/alexyc9381/linkedin-roast-skill) | Five Claudes roast your LinkedIn profile, then fix it |
| [client-room](https://github.com/alexyc9381/client-room-skill) | Twelve Claudes hunt for paying clients for your freelance work |

```
/plugin marketplace add alexyc9381/hiring-panel-skill
/plugin install hiring-panel-skill@hiring-panel-skill
```

(Same pattern for the others.)

---

## Learning

### [LearnHarness](https://github.com/amosblomqvist/learnharness) ![stars](https://img.shields.io/github/stars/amosblomqvist/learnharness?style=flat-square&label=%E2%AD%90)

An agent harness for learning hard things. It measures where your understanding ends, plans a path to your goal, teaches one reasoning step at a time and keeps a knowledge graph across sessions. Download it from [learnharness.ai](https://learnharness.ai).

**Use it when:** you want to *actually understand* something (system design, a new language, maths), not just get an answer.

---

## Running agents at scale

### [AX (Agent Executor)](https://github.com/google/ax) ![stars](https://img.shields.io/github/stars/google/ax?style=flat-square&label=%E2%AD%90)

Google's open orchestration runtime for running many sandboxed agent tasks on Kubernetes. You declare a `Workspace`, a `Task` and a `Model` in YAML, then `ax apply`. It's in heavy development and breaking changes are expected.

**Use it when:** you're building agent infrastructure. It's not for everyday coding.

---

## More lists

- [BehiSecc/awesome-claude-skills](https://github.com/BehiSecc/awesome-claude-skills) is a large curated list of Claude skills.
- [karanb192/awesome-claude-skills](https://github.com/karanb192/awesome-claude-skills) has 50+ verified skills for Claude Code, Claude.ai and the API.

---

## Write your own skill

The fastest way to learn is to write one. Minimal example:

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

Tips:
- **The description is the trigger.** Say *what* the skill does and *when* to use it.
- **Keep `SKILL.md` short.** Move long references into separate files the skill points to.
- **Write steps, not essays.** Agents follow checklists better than prose.

---

## Contributing

Found a skill that made your agent noticeably better? Open a PR. See [CONTRIBUTING.md](CONTRIBUTING.md).

If this list helped you, a ⭐ helps other people find it.

## License

[![CC0](https://licensebuttons.net/p/zero/1.0/88x31.png)](https://creativecommons.org/publicdomain/zero/1.0/)

This list is dedicated to the public domain under CC0. Each linked project has its own license.
