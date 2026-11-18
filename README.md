# Claude workflow kit

My ticket-folder workflow and git rules for Claude Code, packaged so they work in every project.

## What's in it

| File | Goes to | Purpose |
|---|---|---|
| `global/CLAUDE.md` | `~/.claude/CLAUDE.md` | Rules loaded in **every** project: ticket folders, git conventions, no Claude attribution, how we work. |
| `skills/ticket/` | `~/.claude/skills/ticket/` | The `/ticket` command: start, resume, update, or list tickets. Includes the `<KEY>.md` template. |
| `templates/project-CLAUDE.md` | `<project>/CLAUDE.md` | Skeleton for the project-specific part: tracker, prefix, base branch, commands, project rules. |

The split matters: generic rules live once in `~/.claude`, so a new project's `CLAUDE.md` only holds what's specific to that project.

## Set up (once per machine)

```bash
./install.sh
```

This symlinks the files into `~/.claude`, so editing them here updates every project. Keep this folder in git (a private GitHub repo) to carry it to a new laptop.

## New project

```bash
cp ~/projects/claude-workflow-kit/templates/project-CLAUDE.md ./CLAUDE.md
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

## Changing the rules

Edit the files here. If something only applies to one project, put it in that project's `CLAUDE.md` instead.
