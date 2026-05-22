# Mode Registry

Canonical list of all modes across `researcher_agent` skills.

Last updated: 2026-05-21 (v1.0.0)

When adding or modifying modes, update this file first. All `SKILL.md`
files and other documentation should reference this registry rather
than restating mode definitions.

## Conventions

**Spectrum bias** — how the mode weights three competing goals:
- *Generative* — encourages user thinking, avoids prescriptive answers,
  emphasizes question-formulation and counter-arguments
- *Balanced* — mixed; the default for general use
- *Analytic* — precise, low-creativity, high accuracy; emphasizes
  verifiable output and minimal interpretation

**Oversight** — how frequently the user is asked to approve in-flow:
- *Low* — runs largely to completion, presents final artefact
- *Medium* — one or two checkpoints
- *High* — multiple checkpoints (typical for full-mode workflows)
- *Very high* — predominantly dialogue; user drives at every step

**Status** — `available`, `in-development`, or `planned`.

---

## research skill (7 modes)

| Mode | Spectrum | Output | Oversight | Trigger phrases | Status |
|------|----------|--------|-----------|-----------------|--------|
| `brief` | Analytic | Short literature summary, 500–1500 words | Low | "quick literature summary", "research brief", "30-minute scan" | available |
| `full` | Hybrid | Comprehensive literature report, 3000–8000 words, APA 7 | High | "deep research", "comprehensive literature review", "research report" | available |
| `socratic` | Generative | Refined research question + plan summary | Very High | "help me think through", "guide my research", "I have a vague idea" | available |
| `systematic` | Analytic | PRISMA 2020 systematic review, 5000–15000 words | Medium | "systematic review", "PRISMA", "meta-analysis preparation" | available |
| `verify` | Analytic | Claim-by-claim verification report with locators | Medium | "verify claims", "fact-check", "evidence audit" | available |
| `annotate` | Analytic | Annotated bibliography (10–50 sources) | Medium | "annotated bibliography", "annotated reading list" | available |
| `evaluate` | Hybrid | Critical review of one provided source | High | "evaluate this paper", "review this source", "assess this study" | available |

---

## compose skill (9 modes)

| Mode | Spectrum | Output | Oversight | Status |
|------|----------|--------|-----------|--------|
| `full` | Hybrid | Complete manuscript draft (IMRaD or domain-appropriate) | High | available |
| `outline` | Hybrid | Detailed outline with evidence map | High | available |
| `revision` | Analytic | Revised manuscript + point-by-point response letter | High | available |
| `revision-triage` | Hybrid | Revision roadmap from reviewer comments | Medium | available |
| `abstract` | Analytic | Abstract + keywords | Medium | available |
| `lit-section` | Analytic | Literature review section as integrated prose | Medium | available |
| `format` | Analytic | Format conversion (LaTeX, DOCX via Pandoc, PDF, Markdown) | Low | available |
| `citation-check` | Analytic | Citation consistency and accuracy audit | Low | available |
| `disclosure` | Analytic | Venue-specific AI-assistance disclosure statement | Low | available |

---

## critique skill (6 modes)

| Mode | Spectrum | Output | Oversight | Status |
|------|----------|--------|-----------|--------|
| `full` | Hybrid | 5 reviewer reports + editorial decision + revision roadmap | High | available |
| `quick` | Analytic | Brief editor-style first impression | Low | available |
| `methodology` | Analytic | In-depth methodology critique | Medium | available |
| `re-review` | Analytic | Revision verification + residual issue list | Medium | available |
| `guided` | Generative | Socratic issue-by-issue dialogue with the author | Very High | available |
| `calibration` | Analytic | Reviewer-accuracy calibration report (FNR/FPR) | Medium | available |

---

## orchestrate skill (1 orchestrator + 1 resume mode)

| Mode | Spectrum | Output | Oversight | Status |
|------|----------|--------|-----------|--------|
| `pipeline` | Hybrid | 10-stage end-to-end research-to-manuscript workflow with mandatory checkpoints | Very High | available |
| `resume` | Analytic | Resume a prior pipeline run from its saved pipeline-logbook | High | available |

---

## Summary

| Skill | Modes | Status |
|-------|-------|--------|
| research | 7 | Phase 1 (available) |
| compose | 9 | Phase 2 (available) |
| critique | 6 | Phase 3 (available) |
| orchestrate | 2 | Phase 4 (available) |
| **Total** | **24** | — |

All four phases now ship. Version 1.0.0 marks feature-complete
delivery of the four planned skills (24 modes total).
