---
description: PRISMA 2020 systematic literature review (5000–15000 words) via the research skill in systematic mode.
model: sonnet
---

Invoke the `research` skill in **systematic mode**.

This mode produces a deliverable that conforms to PRISMA 2020
(Page et al., 2021). It is the most rigorous and most time-intensive
mode. Reach for it only when the user genuinely needs a systematic
review — not when a `full` mode report would suffice.

Workflow:

1. Confirm the user actually wants a systematic review. Ask:
   - Is the goal an exhaustive evidence synthesis, or a representative
     overview?
   - Is this for publication, regulatory submission, or internal use?
   - Will a meta-analysis follow, or is the goal narrative synthesis?
   If the answer to (a) suggests a representative overview suffices,
   recommend `full` mode instead.

2. Define eligibility criteria (PICOS or analogous):
   - Population / Problem
   - Intervention / Phenomenon of interest
   - Comparison (if any)
   - Outcomes / Measures
   - Study design
   - Time period, language, geography

   Wait for explicit user approval before searching. This is the
   most consequential checkpoint in the entire workflow.

3. Design the search strategy:
   - List databases (at least 3 for a credible systematic review)
   - Draft search strings for each, with boolean structure
   - Specify supplementary methods (hand-search of key journals,
     citation chasing, contact with experts) if applicable
   - Document the cutoff date

4. Present the strategy to the user. Approve before executing.

5. Execute the searches. Record yield per database. Deduplicate.

6. Screening (two-pass):
   - Title/abstract screen: flag clearly out-of-scope sources
   - Full-text screen: apply eligibility criteria strictly
   - Record reasons for exclusion at the full-text stage

7. Risk-of-bias assessment for each included study, using a domain-
   appropriate tool (RoB 2 for randomized trials, ROBINS-I for
   non-randomized, AMSTAR-2 for reviews, etc.). Document tool choice
   and rater calibration if multiple raters are nominal.

8. Data extraction into a structured table.

9. Synthesis. If quantitative meta-analysis is planned: heterogeneity
   assessment, effect-size pooling, sensitivity analyses. Otherwise:
   narrative synthesis grouped by theme.

10. Apply the `systematic-review.md` template. Populate all PRISMA
    2020 reporting items (27 items across the title, abstract,
    introduction, methods, results, discussion, and other sections).
    Generate the PRISMA flow diagram (textual or, if requested, a
    description suitable for figure preparation).

11. Present the draft. Offer two revision passes. Remaining issues
    become Unresolved Issues.

Mandatory checkpoints: scope/eligibility approval (step 2), search-
strategy approval (step 4), inclusion-list approval (step 6), final
acceptance (step 11).

Length target: 5000–15000 words depending on the size of the included
literature.

Citation style: APA 7 unless the discipline conventionally uses
another (e.g., Vancouver for biomedical). Confirm with the user.

If at any point the search yields too few studies to support a
systematic review (typically fewer than 5–10), pause and notify the
user; recommend either broadening eligibility or switching to `full`
mode with a narrower question.
