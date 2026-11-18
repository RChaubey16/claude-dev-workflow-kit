# Claude Dev Workflow Kit

My ticket-folder workflow and git rules for Claude Code, packaged so they work in every project.

## What's in it

| File | Goes to | Purpose |
|---|---|---|
| `skills/ticket/` | `~/.claude/skills/ticket/` | The `/ticket` skill: the ticket-folder workflow, git rules (branch/commit format, no Claude attribution, commit only when asked), and working rules. Includes the `<KEY>.md` template. |
| `templates/project-CLAUDE.md` | `<project>/CLAUDE.md` | Skeleton for the project-specific part: tracker, prefix, base branch, commands, project rules. It tells Claude to use the `ticket` skill for ticket work. |

The rules live in the skill, not a global `CLAUDE.md`, so nothing is loaded into sessions that don't involve tickets. The project's `CLAUDE.md` overrides the skill wherever they differ.

## Set up (once per machine)

```bash
git clone <this repo> ~/projects/claude-dev-workflow-kit
~/projects/claude-dev-workflow-kit/install.sh
```

This symlinks the skill into `~/.claude/skills`, so it's available in every project and editing it here updates everywhere.

## New project

```bash
cp ~/projects/claude-dev-workflow-kit/templates/project-CLAUDE.md ./CLAUDE.md
echo "docs/" >> .git/info/exclude        # ticket notes stay private
echo "CLAUDE.md" >> .git/info/exclude    # unless the team wants it committed
```

Fill in `CLAUDE.md` (or ask Claude: "fill in CLAUDE.md from this codebase, using the template's sections"). At minimum: tracker URL, ticket prefix, base branch, test/lint commands.

## Daily use

| You do | Claude does |
|---|---|
| Paste a new ticket, or `/ticket ABC-123` | Creates `docs/tickets/ABC-123/ABC-123.md` from the ticket, saves attachments, branches from the latest base, then plans and implements. |
| `/ticket ABC-123` on an existing ticket | Reads the file and tells you where it stands and what's next. |
| `/ticket ABC-123 update` + paste new comments/QA feedback | Updates the requirements and History first, then the code. |
| `/ticket` | Lists every ticket with its current status line. |

Each `<KEY>.md` has a **Status** section at the top (always current) and a **History** section at the bottom (dated log), so anyone, including a fresh Claude session, can pick the ticket up.

The git rules apply once the skill is loaded in a session. If you commit outside ticket work, start with `/ticket <KEY>` or put the commit rules in the project's `CLAUDE.md`.

## Changing the rules

Edit `skills/ticket/SKILL.md`. If something only applies to one project, put it in that project's `CLAUDE.md` instead.
