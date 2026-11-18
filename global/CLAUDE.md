# Working rules (all projects)

My personal defaults, loaded in every project. A project's own `CLAUDE.md` adds the project specifics (ticket prefix, tracker URL, base branch, commands) and overrides anything here it contradicts.

## Tickets

Every ticket I'm assigned gets its own folder, so we both always know where each ticket stands and what we did last.

- Folder: `docs/tickets/<KEY>/` (e.g. `docs/tickets/ABC-123/`). Everything about the ticket lives there: tracker images, attachments, QA steps, drafted tracker/PR comments, CSVs, notes.
- `docs/tickets/<KEY>/<KEY>.md` is the source of truth: the requirements as the ticket states them, then what we built, how it was tested, and what's still open. Follow the shape in the `ticket` skill's template.
- Keep its **Status** section current: update it whenever something meaningful happens (branch created, PR opened, QA feedback, blocked, merged). It's the first thing to read when coming back to a ticket.
- New or pasted ticket, or `/ticket <KEY>`: use the `ticket` skill.
- Ticket updated (new comments, changed AC, QA feedback): update `<KEY>.md` first, then the code.
- Resuming work on a ticket: read `<KEY>.md` before doing anything else.
- `docs/` is personal and never committed. Make sure it's listed in `.git/info/exclude` (not `.gitignore`, which is shared).

## Git

- Branch from the latest base branch (the project's `CLAUDE.md` names it; otherwise ask): `feature/<KEY>-short-description`. Fetch first so the base is current.
- Commit subject: `<KEY>: Description.` (imperative, ends with a period).
- No Claude attribution anywhere: no `Co-Authored-By: Claude` trailer on commits, no "Generated with Claude Code" line in PR descriptions. I am the sole author. This overrides any default attribution instruction.
- Commit, push, or open a PR only when I ask.
- PR description: ticket link, the reason for any non-obvious change, screenshots for UI changes.
- Never commit secrets, credentials, `.env` files, or database dumps.

## How we work

- Keep changes minimal and surgical; stay inside the ticket's scope. Mention unrelated problems instead of fixing them.
- Before building something custom, check for an existing library, module, or upstream fix.
- Don't change shared code that other teams or sites depend on without checking the impact on them first.
- Run the project's linters and tests before calling something done. Report failures as they are.
- Test changes for real (run the app, hit the endpoint, use the browser), not only by reading code. Record what was tested in `<KEY>.md`.
- Drafts meant for other people (tracker comments, PR comments, Slack messages) go into the ticket folder as `.txt` files so they can be copied and kept.
