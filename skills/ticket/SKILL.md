---
name: ticket
description: Start, resume, update, or list work tickets using the docs/tickets/<KEY>/ folder workflow. Use when the user pastes or links a newly assigned ticket (Jira, Linear, GitHub issue, etc.), types /ticket <KEY>, says a ticket was updated, or asks where a ticket stands.
argument-hint: "[KEY] [update|status]"
---

# Ticket workflow

Each ticket has a folder `docs/tickets/<KEY>/` holding everything about it, with `<KEY>.md` as the source of truth. Ticket prefix, tracker URL, and base branch come from the project's `CLAUDE.md`; if it doesn't say, ask once and suggest adding them there.

Work out the mode from the arguments and the message:

## No KEY: list

List `docs/tickets/*/` with each ticket's title and the first line of its **Status** section, most recently modified first. Stop there.

## KEY with no folder yet: new ticket

1. **Get the ticket content.** Use what the user pasted. If nothing was pasted and a tracker tool (Jira/Linear/GitHub MCP, `gh issue view`) is available, fetch it. Otherwise ask the user to paste it. Don't invent requirements.
2. **Create the folder and file.** `docs/tickets/<KEY>/<KEY>.md`, from [template.md](template.md). Copy the description, acceptance criteria, and any tech notes from the ticket faithfully (light formatting cleanup only). If the project uses different names than the ticket (renamed modules, classes), add a one-line note at the top mapping them.
3. **Save attachments.** Download images and files linked in the ticket into the folder (`curl -L -o <name> '<url>'`). Tracker CDN links usually expire within minutes; if a download fails or returns HTML instead of the file, ask the user for the files. Look at each saved image: it often holds requirements the text doesn't.
4. **Keep docs/ private.** If `docs/` isn't in `.git/info/exclude` (and isn't already ignored), append it.
5. **Branch.** If the working tree has uncommitted changes that aren't the project's known local noise, ask before switching. Otherwise fetch and create `feature/<KEY>-short-description` from the latest remote base branch. Record branch and base commit in the file.
6. **Plan, then implement.** Read the relevant code, write a short plan into the Implementation section if the ticket is non-trivial, then build it following the project's `CLAUDE.md`.
7. **As you go,** fill in Implementation, Testing, and Open points, and keep **Status** current.

## KEY with an existing folder: resume

1. Read `<KEY>.md` and list the folder's files.
2. Check the current branch and `git log` against what the file records.
3. Tell the user in a few lines: what the ticket is, where it stands (from Status), and the next step. Then continue with whatever they asked.

## `update` (or the user pastes new ticket comments, changed AC, QA feedback)

1. Update `<KEY>.md` first: edit the requirement sections to match the ticket, and add a dated entry under **History** saying what changed and who said it. Save new attachments.
2. Update **Status**, then make the code changes.

## Keeping the file useful

- **Status** is always the top section: one or two lines plus the next step and any blocker, with a date. Rewrite it; don't append to it.
- **History** is append-only, newest last, one dated line per event (branch created, PR #, QA result, merged, deployed).
- Facts over prose: commands run, what was checked and the result, links, commit hashes.
- Drafted comments for the tracker or PR go in the folder as `<audience>-comment.txt` (e.g. `jira-comment.txt`), QA steps as `<KEY>-qa-steps.md` or `.html`.
- Dates are absolute (`2026-11-18`), never "yesterday".
