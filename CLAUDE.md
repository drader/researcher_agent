# researcher_agent — Claude Code project rules

This file is the canonical rule set for Claude Code sessions inside this
repository. It is read once at the start of every session.

For project overview see [README.md](README.md). For technical design see
[ARCHITECTURE.md](ARCHITECTURE.md). For the canonical mode list see
[MODE_REGISTRY.md](MODE_REGISTRY.md).

---

## Documentation parity — `docs/index.html` and `docs/architecture.html`

The two HTML files under `docs/` are **report pages**: visual,
slide-deck summaries of the project's current state. They are not
generated artefacts — they are hand-maintained and must stay in lockstep
with the rest of the repo.

They live under `docs/` (not the repo root) so GitHub Pages can serve
them from a clean source path (`docs/`) without Jekyll attempting to
parse the rest of the repository's markdown — see the build entry in
[CHANGELOG.md](CHANGELOG.md) for the historical context.

| File | Mirrors |
|---|---|
| [docs/index.html](docs/index.html) | README.md · POSITIONING.md · MODE_REGISTRY.md · CHANGELOG.md |
| [docs/architecture.html](docs/architecture.html) | ARCHITECTURE.md · MODE_REGISTRY.md · AGENT_REGISTRY.md · skills/* · commands/* · agents/* |
| [docs/diagrams/*.svg](docs/diagrams/) | rendered into both pages (referenced as `diagrams/...` from within docs/) |

### Single sources of truth

When a fact appears in multiple files, the authoritative file wins and
everything else must follow it. Conflict resolution order:

| Domain | Authoritative file |
|---|---|
| The 24 modes (skill, mode, spectrum, output, oversight) | [MODE_REGISTRY.md](MODE_REGISTRY.md) |
| The 21 sub-agent personas (skill, role, status) | [AGENT_REGISTRY.md](AGENT_REGISTRY.md) |
| The orchestrate pipeline (10 stages) and its 6 mandatory gates | [skills/orchestrate/SKILL.md](skills/orchestrate/SKILL.md) §3–4 |
| The provenance contract (anchor types, `<unverified>` flag) | [ARCHITECTURE.md](ARCHITECTURE.md) §Provenance |
| Version and release date | [CHANGELOG.md](CHANGELOG.md) latest entry |

If you discover that an authoritative file disagrees with what you
remember or what was previously stated, the authoritative file wins.
Update the dependents, not the authority.

### The rule

**Rule 1 — sync immediately.** Whenever the repo is modified (a mode is
added or removed, a skill's mode count changes, a slash command is
renamed, the version bumps, a principle is restated, the license changes,
the directory layout shifts, a counted number anywhere changes), check
whether `docs/index.html` or `docs/architecture.html` needs to follow. If
yes, update it **in the same working session** and commit the change.

**Rule 2 — sync before push.** If the working session produces multiple
commits that will go out in a single `git push`, the **final commit
before the push** must be the HTML report-page sync. This holds even
when individual intermediate commits each updated the HTML — the final
commit consolidates and verifies. Commit message format:

```
docs(html): sync index/architecture with <one-line description>
```

If the HTML was already in sync after the prior commits and the sync
commit would be empty, skip it — but verify, do not assume.

**Rule 3 — verify, do not guess.** Before declaring the HTML in sync,
run the parity check below. Numbers, names, and file references in the
report pages must match the actual repo state.

### Scope of what to check

When something changes, the following surfaces in the HTML are the most
common drift points. Walk this list before pushing.

`docs/index.html`:
- Slide 1 — version tag, license tag
- Slide 13 — the four skill cards (skill names, mode counts, mode lists)
- Slide 14 — pipeline diagram reference (if `docs/diagrams/pipeline.svg`
  changed)
- Slide 16 — status block: version, release date, totals (skills, modes,
  commands, sub-agents, reference docs, templates, examples)
- Slide 17 — repo URL, install snippet

`docs/architecture.html`:
- Slide 1 — version tag
- Slide 5 — the 24-mode matrix (skill, mode, spectrum, output, oversight)
- Slide 6 — sub-agent persona lists
- Slide 7 — checkpoint discipline (gate count, scope text)
- Slide 9 — pipeline SVG (reflects `docs/diagrams/pipeline.svg`)
- Slide 12 — repository layout tree
- Slide 14 — extension points (file paths, conventions)

`docs/diagrams/*.svg`:
- `topology.svg` — layer names, mode/skill/persona counts
- `pipeline.svg` — stage names, gate count, skill assignments per stage
- `two-loops.svg` — the revision-cap convention

### Parity check (run before any push)

A single script runs all seven parity checks:

```bash
bash scripts/parity-check.sh
```

Exit code `0` means clean. Non-zero means at least one drift was
detected; the script prints which one. The seven checks are:

1. HTML tag balance + slide count + exactly one `active` slide per page
2. Every `<img src=…>` reference in the HTML pages resolves to a real file
3. MODE_REGISTRY row counts per skill match the 7/9/6/2 contract (24 total)
4. AGENT_REGISTRY persona names match `skills/<skill>/agents/*.md` filenames
5. README's claimed counts (sub-agents, modes, slash commands) match reality
6. `commands/*.md` file count agrees across disk, README, and `docs/index.html`
7. Version + release date in `CHANGELOG.md` latest entry match `CITATION.cff`, `docs/index.html`, and `README.md`

If a check fails, fix the dependent file, not the authoritative source.
The "Single sources of truth" table above lists which file wins per
domain.

### What does NOT need an HTML update

- Internal refactors that do not change public-facing counts, names, or
  directory layout
- Typo fixes in reference docs that are not quoted in the HTML
- Whitespace / formatting changes
- Changes to files in `.gitignore` paths
- Local development scaffolding

When in doubt, run the parity check — it is cheap.

---

## License and scope reminders

The framework is licensed CC BY-NC 4.0. Refuse contributions or
modifications that would enable commercial reuse without a separate
arrangement — see [POSITIONING.md](POSITIONING.md).

The framework's design principle is **transparency over deception** —
do not add features that help conceal AI assistance.
