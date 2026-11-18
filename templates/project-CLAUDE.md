# CLAUDE.md — <Project name>

<!--
Copy this file to the root of a new project as CLAUDE.md and fill it in.
Only project-specific facts go here; the ticket workflow, git conventions,
and general working rules come from the `ticket` skill.
Delete any section that doesn't apply. Short and accurate beats complete.
Leave it untracked (add to .git/info/exclude) unless the team wants it in the repo.
-->

<One or two sentences: what the system is, the stack, where it runs, which part I work on.>

- Design / architecture docs: `<path or URL>`
- Current state notes: `<path>`

## Tickets and git

For any ticket work (new ticket, resuming one, branching, committing, PRs), use the `ticket` skill and follow its rules.

| Thing | Value |
|---|---|
| Tracker | <Jira/Linear/GitHub> — `<https://company.atlassian.net/browse/>` |
| Ticket prefix | `<ABC>` (e.g. `ABC-123`) |
| Base branch | `<develop/main>` — PRs target it |
| Remote to branch from | `<origin/upstream>` |
| Deploy branches | `<stage-branch>` → stage, `<prod-branch>` → prod |
| Reviewers to tag | `<@github-handle>` |

<Any deviation from the global git rules, e.g. a different branch format or commit subject.>

## Names

| Thing | Value |
|---|---|
| Local URL | `<>` |
| Environments | dev `<>` / stage `<>` / prod `<>` |
| Main code location | `<path>` |

## Commands

```bash
# Start / stop local
<>

# Build
<>

# Tests and linters (must pass before a PR)
<>

# Refresh local data from dev
<>
```

- <Gotchas: commands that need a special flag, things that fail locally and why.>

## Project rules

- <Where new code goes; what is shared with other teams and must not change without checking.>
- <Config / migrations / feature-flag rules.>
- <Translation, accessibility, security, logging conventions.>
- <Coding standards and the tools that enforce them.>

## Known local noise

- <Files that always show as modified locally and must never be committed or reset, and why.>
