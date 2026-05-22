# Security Policy

`researcher_agent` is a framework that drives LLM workflows over
user-supplied research material. Its threat surface is not the same as
a typical library — most of the meaningful issues are about whether the
framework's **integrity guarantees** can be bypassed, not about
classical memory-safety or remote-execution bugs.

This file describes what we treat as a security issue, how to report
one, and what to expect afterwards.

## Reporting channel

Report privately via **GitHub's "Report a vulnerability" feature** on
the repository's Security tab:

> Repository → Security → Advisories → Report a vulnerability

This opens a private security advisory visible only to the maintainer.
**Please do not open a public Issue for a security report** — once a
disclosure is public, downstream users have no time to update.

We do not maintain a separate security email. The private advisory
channel is the only supported reporting path.

## In-scope categories

These are framework-specific failure modes. If you can demonstrate any
of them with a minimal reproduction, please report:

### 1. Prompt-injection of sub-agents

A sub-agent persona behaves contrary to its spec because user-supplied
text (a PDF, transcript, web fetch, or pasted draft) contains
adversarial instructions that the framework fails to neutralize. This
includes:

- A sub-agent leaking information across skill boundaries.
- A sub-agent ignoring a mandatory checkpoint or revision-loop cap.
- A sub-agent fabricating a `<verified>` flag for an unverified claim.

### 2. AI-disclosure bypass

A path through the framework that lets a user produce an artefact while
`compose-disclosure` either (a) silently omits an AI-assisted step from
the disclosure statement or (b) produces a disclosure that does not
match what was actually run. The framework's design principle is
*transparency over deception*; any path that breaks this is in scope.

### 3. Citation-hallucination re-introduction

A scenario where `research-verify` or the broader provenance pipeline
allows a fabricated citation to land in a deliverable without being
flagged. This includes:

- Forged locators (page numbers / section headings that do not exist in
  the cited source).
- Citations that pass `verify` but cite a real source that does not
  support the claim, when the source is locally available.
- The framework producing a citation it cannot trace to any anchor in
  the provenance log.

### 4. Provenance-chain break

A claim ends up in a published deliverable without an anchor in the
provenance log (cited source / user input / framework computation /
`<unverified>` flag), through a mode-combination the framework should
have caught.

### 5. Checkpoint discipline bypass

A path that lets the pipeline progress past a mandatory gate without
explicit user approval being recorded in `pipeline-logbook.json`.

### 6. Two-loop revision cap bypass

A workflow that produces more than two revision passes on a single
deliverable without the residual issues being moved into "Unresolved
Issues."

## Out of scope

These are not framework security issues; report them upstream or treat
them as ordinary quality issues:

- **LLM model failures** that any prompt would encounter (hallucination
  in free-form prose, refusals, calibration drift). These are model
  properties, not framework guarantees.
- **Claude Code platform issues** — report to Anthropic / Claude Code,
  not here.
- **Bugs that produce wrong output but do not bypass a stated guarantee**
  — open a regular Issue.
- **Vulnerabilities in tools the user installed alongside the framework**
  (Pandoc, LaTeX, citation managers) — report upstream.

## What to include in a report

- Repro: minimal mode invocation + the input that triggered the issue.
- Expected behaviour per the framework's stated guarantees (cite
  `ARCHITECTURE.md` or the relevant skill's `SKILL.md` if helpful).
- Observed behaviour.
- Versions: the framework version, Claude Code version, and (if
  relevant) the model identifier.

## What to expect

`researcher_agent` is maintained by a single author. There is no SLA.
We aim to:

- Acknowledge the advisory within **7 days**.
- Assess scope and reproducibility within **30 days**.
- Coordinate a fix and a public disclosure on a timeline that gives
  downstream users a chance to update. For the kinds of issues in scope
  here, this typically means a fix in the next minor release plus a
  short advisory in `CHANGELOG.md`.

Reporters who follow the private-advisory process and act in good faith
will be credited in the advisory unless they ask to remain anonymous.

## Related

- General contribution guidance: [CONTRIBUTING.md](CONTRIBUTING.md)
- Design principles the framework promises to uphold:
  [ARCHITECTURE.md](ARCHITECTURE.md) and the "Principles" section of
  [README.md](README.md)
- Project rules including parity discipline: [CLAUDE.md](CLAUDE.md)
