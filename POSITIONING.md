# Positioning

This document records the design intent and license boundaries for
`researcher_agent`. It is the authoritative reference when license
edge cases arise.

## What this framework is

`researcher_agent` is a source-available scholarly research copilot
designed for human-in-the-loop use. It assists a human researcher
through the standard academic lifecycle (question → literature →
synthesis → manuscript → review → revision). It is distributed as
a suite of Claude Code skills, slash commands, and sub-agent personas.

## What this framework is not

- It is not a fully autonomous research system. It will not initiate
  studies, decide what to argue, or commit to a methodology without
  human approval.
- It is not a generator of submission-ready manuscripts without
  human review. Every deliverable is a draft that requires the user
  to read, evaluate, edit, and approve.
- It is not a replacement for peer review. The "critique" skill
  (Phase 3) simulates a reviewer's perspective but does not constitute
  an actual independent peer review.
- It is not a tool for concealing AI involvement. A disclosure command
  is provided so that AI assistance can be documented in venue-appropriate
  language.

## Allowed uses (under CC BY-NC 4.0)

- Personal academic work: thesis, dissertation, journal articles,
  conference papers, grant proposals
- Teaching and training: using the framework to demonstrate methodology
  to students; using sub-agents as examples in research-methods courses
- Non-profit collaboration: research groups, labs, and academic
  departments sharing the framework internally
- Adaptation for personal use: forking, modifying, and using your
  own variant in your own research

## Disallowed uses (under CC BY-NC 4.0)

- Commercial SaaS or hosted services built on the framework
- Consulting, freelance, or paid services that deliver outputs
  generated primarily by this framework
- Internal use at for-profit organizations where the framework's
  outputs contribute to revenue-generating work
- Repackaging, rebranding, or reselling the framework as a paid
  product
- Wrapping the framework in a commercial API
- Using the framework to produce content for clients who pay for it

The CC BY-NC 4.0 license uses "commercial" in the sense of "primarily
intended for or directed toward commercial advantage or monetary
compensation." Edge cases (e.g., a researcher employed by a for-profit
who uses the tool for genuinely non-commercial publication) should
be resolved by considering the dominant purpose of the use.

## Discouraged uses (not license violations, but contrary to design)

- Submitting AI-assisted output as solely human-authored without any
  disclosure (an academic integrity issue separate from license)
- Treating critique-skill output as a substitute for actual peer review
- Running the orchestrator end-to-end without engaging with the
  intermediate deliverables (defeats the human-in-the-loop design)
- Using the framework to produce volume rather than quality

## Design philosophy

**The framework's job is the part that requires patience but not
intellectual judgment.** Searching multiple databases for relevant
sources, formatting citations, checking for consistency across
sections, verifying that claimed sources actually say what they
are claimed to say — these are time-consuming, error-prone, and
not where human cognitive effort produces the most value.

**The user's job is the part that requires judgment.** Choosing the
research question, deciding what evidence counts, interpreting what
the data mean, writing the sentences that frame the argument — these
are the parts of scholarship that define the work as the user's.

**Checkpoints are structural, not stylistic.** They are not "would
you like me to continue?" friction. They are gates at points where
the framework is about to commit to a decision that would be costly
to undo (e.g., scope of a systematic review, inclusion/exclusion
criteria, final manuscript structure). The user must explicitly
approve at these points.

**Failure modes are surfaced, not hidden.** If the framework cannot
locate evidence for a claim, it says so rather than fabricating a
citation. If two retrieved sources contradict each other, it
records the contradiction rather than picking one silently. If a
revision loop reaches the limit, remaining issues are documented
as known limitations rather than glossed.

## Independence statement

This is original work, written from scratch. The framework references
common academic methodologies (PRISMA 2020, Socratic dialogue, peer
review protocols, APA 7) which are public-domain scholarly practices.
No prompt text, agent specification, template, or example is borrowed
or paraphrased from any other research-skills tool.

## Commercial licensing

For uses that fall outside the CC BY-NC 4.0 allowance, contact the
copyright holder for commercial licensing terms. Reasonable arrangements
can be made for genuine use cases.

## Citing this work

```
Gençer, O. (2026). researcher_agent: An LLM-driven research assistance
framework [Computer software]. CC BY-NC 4.0.
```
