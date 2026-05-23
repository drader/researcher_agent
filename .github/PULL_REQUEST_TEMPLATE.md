<!--
Thanks for the PR. The checklist below mirrors CONTRIBUTING.md and
CLAUDE.md; please fill it out so review can move quickly.
-->

## Summary

<!-- One or two sentences. What does this PR change and why? -->

## Motivation

<!--
Link the originating Issue if there is one (`Fixes #N` / `Closes #N` / `Refs #N`).
If there is no Issue, write 2-4 sentences on what problem this solves or what gap
it fills. PRs without context are hard to evaluate.
-->

- Issue: <!-- e.g. Fixes #12, or "no issue, see motivation below" -->
- Type of change:
  - [ ] Bugfix
  - [ ] New mode in an existing skill
  - [ ] New skill
  - [ ] New sub-agent persona
  - [ ] New slash command
  - [ ] Refactor (no behaviour change)
  - [ ] Documentation
  - [ ] Tooling / scripts / CI
  - [ ] Other (describe below)

## Scope discipline

- [ ] This PR makes **one** logical change. (CONTRIBUTING.md: "one PR per logical change.")
- [ ] If the change spans multiple files, all touched files relate to the same logical change.

## Registry impact

- [ ] [`MODE_REGISTRY.md`](MODE_REGISTRY.md) updated, or N/A
- [ ] [`AGENT_REGISTRY.md`](AGENT_REGISTRY.md) updated, or N/A
- [ ] [`ARCHITECTURE.md`](ARCHITECTURE.md) updated, or N/A
- [ ] The single source of truth for the affected domain (per [CLAUDE.md](CLAUDE.md)) is correct; dependent files were updated to follow it, **not the other way around**.

## CHANGELOG

- [ ] [`CHANGELOG.md`](CHANGELOG.md) has a one-line entry under the appropriate version section for this change, or this PR is the CHANGELOG entry itself, or this change is too small to warrant one.

## HTML report-page parity (CLAUDE.md Rule 1 + 2)

- [ ] I checked whether [`docs/index.html`](docs/index.html) or [`docs/architecture.html`](docs/architecture.html) needs to follow this change (skill/mode counts, command names, version, layout, principles, diagrams, status block, registry counts).
- [ ] If a sync was needed, this PR includes that sync. If this PR is part of a series, the **final commit before push** is the sync commit (or the sync was empty and verified).

## Verification

- [ ] I ran `bash scripts/parity-check.sh` and it exited 0.
- [ ] If this PR adds or removes a sub-agent persona, the new/removed file matches the entry in AGENT_REGISTRY.md.
- [ ] If this PR adds or removes a mode, MODE_REGISTRY.md's per-skill row counts still match the contract (7/9/6/2).

## Breaking change?

- [ ] No.
- [ ] Yes — described below, with migration notes.

<!-- If yes, describe what breaks and how downstream users adapt. -->

## Additional notes

<!-- Anything that doesn't fit above: design alternatives considered, follow-up work, screenshots, etc. -->
