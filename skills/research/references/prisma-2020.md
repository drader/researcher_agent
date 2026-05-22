# PRISMA 2020 Implementation Notes

Operational guidance for producing a systematic review that conforms
to the PRISMA 2020 reporting standard. Use this file as a reference
when running the `research` skill in `systematic` mode.

The underlying standard is described in Page et al. (2021),
*The PRISMA 2020 statement: an updated guideline for reporting
systematic reviews*. This file is an implementation note in our
own words; for authoritative wording, consult the standard itself.

---

## Purpose

PRISMA 2020 is a reporting standard, not a methodology. It tells you
what to report in a systematic review so that readers can judge the
review's rigour and reproduce it. It does not tell you how to design
the review.

Following PRISMA does not, by itself, make a review good. It makes
the review *legible*: a reader can see exactly what was done, what
was excluded, and on what grounds. A poorly designed review that
follows PRISMA is still a poor review, but a reader can recognize
that it is poor. A well-designed review that does not follow
PRISMA may be excellent but harder to evaluate.

This skill applies PRISMA 2020 to any systematic-review deliverable
it produces.

---

## The four phases

PRISMA describes the review process as four phases, captured in a
flow diagram.

### Phase 1: Identification

Locate all records that might be relevant. This is the broad sweep.

- Search across multiple databases (typically at least three)
- Record the exact query string used in each database
- Record the date the search was run
- Record the number of records retrieved from each database
- Add records identified through other sources (citation chasing,
  consultation with experts, registry searches)
- De-duplicate

Outputs: total records before de-duplication, total after.

### Phase 2: Screening

From the de-duplicated record set, filter by title and abstract.

- Two independent reviewers screen each record (gold standard;
  may be relaxed for small reviews with documented reason)
- Apply the eligibility criteria as defined in the protocol
- Resolve disagreements by discussion or by a third reviewer
- Record the number of records excluded at this phase, with
  reasons grouped by category

Outputs: records screened, records excluded with reasons, records
retained for full-text review.

### Phase 3: Eligibility

For records that survived screening, retrieve the full text and
apply the eligibility criteria more thoroughly.

- Record the number of full texts assessed
- Record the number excluded at this phase, with reasons
  (now reported per-study; common categories: wrong population,
  wrong intervention, wrong outcome, wrong study design, not
  in the included languages, retracted)
- Record any full texts that could not be obtained (state the
  reason: paywalled, missing from archives, no response from
  authors)

Outputs: full texts assessed, full texts excluded with reasons,
studies meeting eligibility.

### Phase 4: Inclusion

Studies that pass eligibility enter the final synthesis.

- Record the total number of included studies
- Record any studies that were included for narrative discussion
  but excluded from quantitative synthesis (state why: outcome
  reported in incompatible format, insufficient data, etc.)
- Record the number of reports per study (a single study may have
  multiple linked reports, e.g., protocol + main paper + follow-up)

Outputs: included studies, included reports, studies in narrative
synthesis, studies in quantitative synthesis.

---

## The 27 reporting items

PRISMA 2020 specifies 27 items grouped under seven section headings.
Below is our compact paraphrase. For exact wording, consult Page
et al. (2021).

**Title (item 1).** Identify the document as a systematic review.

**Abstract (item 2).** Structured abstract following PRISMA's
abstract checklist (separately published).

**Introduction.**
- Item 3: Rationale — why this review, given existing knowledge.
- Item 4: Objectives — the explicit research question, ideally
  framed as PICO or analogous.

**Methods.**
- Item 5: Eligibility criteria — populations, interventions,
  comparators, outcomes, study designs, languages, dates, settings.
- Item 6: Information sources — databases, registries, websites
  searched, with dates.
- Item 7: Search strategy — full query strings for each database,
  with filters and limits.
- Item 8: Selection process — who screened, blind or unblinded,
  how disagreements resolved.
- Item 9: Data collection process — how data were extracted, who
  extracted, what tool used.
- Item 10a: Data items — outcomes for which data were sought.
- Item 10b: Data items — other variables (funding, sample size,
  setting, etc.).
- Item 11: Study risk of bias assessment — tool used (e.g.,
  RoB 2, ROBINS-I, Newcastle-Ottawa), who assessed, blinding.
- Item 12: Effect measures — risk ratios, mean differences,
  standardized mean differences, etc.
- Item 13a-f: Synthesis methods — how studies were grouped, how
  data were prepared, methods used to tabulate or visualize, what
  meta-analytic model (if any), heterogeneity assessment,
  sensitivity analyses, subgroup analyses.
- Item 14: Reporting bias assessment — methods to assess missing
  results (e.g., funnel plot, Egger's test).
- Item 15: Certainty assessment — GRADE or analogous framework.

**Results.**
- Item 16a-b: Study selection — flow diagram (the famous PRISMA
  diagram) showing identification, screening, eligibility,
  inclusion counts.
- Item 17: Study characteristics — table summarizing each
  included study.
- Item 18: Risk of bias in studies — per-study assessment.
- Item 19: Results of individual studies — effect estimate and
  precision for each.
- Item 20a-d: Results of syntheses — characteristics of studies
  in each synthesis, results of statistical syntheses,
  investigations of heterogeneity, sensitivity analyses.
- Item 21: Reporting biases — assessment results.
- Item 22: Certainty of evidence — assessment of certainty for
  each outcome.

**Discussion.**
- Item 23a-d: General interpretation, limitations of evidence,
  limitations of the review process, implications for practice
  and research.

**Other.**
- Item 24a-c: Registration and protocol — registration number,
  where protocol is available, amendments since registration.
- Item 25: Support — sources of financial and non-financial support.
- Item 26: Competing interests — declarations.
- Item 27: Data, code, materials availability — what is available
  and where.

---

## The flow diagram

The PRISMA flow diagram has four boxes, one per phase, connected
top-to-bottom, with branches showing exclusions at each phase.

Typical structure (described in words; the actual diagram is a
figure):

```
Identification
  Records identified from databases (n=...)
  Records identified from other sources (n=...)
  → De-duplicated total (n=...)

Screening
  Records screened (n=...)
  Records excluded (n=...)

Eligibility
  Full texts assessed (n=...)
  Full texts excluded with reasons (n=..., reasons listed)

Inclusion
  Studies included in qualitative synthesis (n=...)
  Studies included in quantitative synthesis (n=...)
```

When this skill produces a systematic review, the flow diagram is
described in text (with all four counts) in the Results section and,
where the deliverable format supports it, accompanied by a generated
figure (PNG or SVG). The numerical content takes precedence; the
visual form is a convenience.

---

## Protocol registration

PRISMA encourages prospective registration of the review protocol
(commonly via PROSPERO for health-related reviews, OSF for many
others). The skill recommends registration at the scope-confirmation
checkpoint in `systematic` mode. If the user proceeds without
registration, this is noted in item 24a as "not registered" with
the user's reason.

Registration matters because the protocol commits the reviewer to
the questions, eligibility criteria, and outcomes ahead of seeing
the results. Post-hoc changes are then visible as such.

---

## Common pitfalls

**Drifting eligibility criteria.** During screening, reviewers
sometimes silently expand or contract the eligibility criteria to
make the review yield a sensible number of studies. This is
selective inclusion. The skill enforces the criteria as written
and requires explicit, documented amendments if they change.

**Single-reviewer screening with no audit.** When only one reviewer
screens and no second reviewer or audit is involved, screening
errors are unchecked. The skill will run as a single-reviewer
process only when the user accepts this as a limitation, and the
deliverable will note it under item 23c.

**Unreported exclusions.** Excluding studies at any phase without
recording the reason makes the review unreproducible. The skill
records every exclusion with its reason, grouped by category.

**Missing databases.** Searching only one database biases the
review. The skill enforces a minimum of three databases for any
`systematic` mode run.

**Risk-of-bias assessment skipped.** Without per-study risk-of-bias
assessment, the review cannot speak to the certainty of its
findings. The skill prompts the user to choose a tool at the
protocol checkpoint and applies it.

**Conflating included with synthesized.** A study may be eligible
but excluded from a quantitative synthesis for technical reasons
(outcome reported in an incompatible scale, for example). This
distinction is reported clearly.

**Treating PRISMA as a guarantee of quality.** PRISMA is a
reporting standard. A review that meets every PRISMA item can
still be substantively flawed if, for example, the question is
poorly framed or the eligibility criteria are designed to produce
a desired conclusion. PRISMA makes flaws visible; it does not
prevent them.

---

## Adaptation for narrative reviews

PRISMA 2020 is designed for systematic reviews with or without
meta-analysis. For narrative reviews, scoping reviews, rapid
reviews, and other variants, separate guidance exists (e.g.,
PRISMA-ScR for scoping reviews; PRISMA-RR for rapid reviews).
The `systematic` mode applies PRISMA 2020 by default; for other
review types, the user should request the appropriate variant
at the scope checkpoint.
