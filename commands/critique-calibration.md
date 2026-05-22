---
description: Measure reviewer-accuracy (FNR/FPR) on gold-standard inputs via the critique skill in calibration mode.
model: sonnet
---

Invoke the `critique` skill in **calibration mode**.

Measure how accurately the critique skill identifies issues on a
manuscript whose review outcome is already known. Use this when a
research group wants to assess whether to trust the skill's reviews
for their domain.

Workflow:

1. Gather inputs:
   - Gold-standard manuscript: a paper for which a real peer review
     is available (e.g., an OpenReview record, the user's own paper
     with archived reviews, a published-with-disclosed-reviews
     manuscript)
   - The real peer review document (the "ground truth")
   - Domain (so calibration can be reported by domain)

2. Run the critique skill in full mode on the gold-standard
   manuscript, blinded to the real review (do not let the real
   review's content leak into the critique pass).

3. Compare the skill's output to the ground truth:
   - **True positive (TP)** — issue present in real review AND in
     the skill's output
   - **False negative (FN)** — issue present in real review but
     MISSING from the skill's output
   - **False positive (FP)** — issue raised by the skill but NOT
     in real review (and not reasonably attributable to legitimate
     differences in reviewer focus)

   "Same issue" requires a judgment call: paraphrases of the same
   underlying concern count as one issue. Be conservative — if in
   doubt, count separately.

4. Compute calibration metrics:
   - False-negative rate (FNR) = FN / (TP + FN) — issues the skill
     missed
   - False-positive rate (FPR) = FP / (TP + FP) — issues the skill
     raised that real reviewers did not
   - 95% confidence interval on each, given the small sample size
   - Severity-weighted FNR (critical and major issues weighted more
     heavily than minor and suggestion)

5. Produce the calibration-report template:
   - Inputs (manuscript, real review, domain)
   - Critique-skill output summary
   - TP / FN / FP issue lists
   - FNR, FPR, severity-weighted FNR
   - 95% CI
   - Domain coverage statement
   - Confidence statement for downstream users

6. Present the report. Recommend whether to trust the skill for this
   domain (low FNR + low FPR = high confidence; high FNR = the skill
   misses things; high FPR = the skill cries wolf).

Length: 1000–2500 words.

This mode is for research groups doing meta-evaluation. A single
calibration run is preliminary; meaningful confidence requires
calibration across multiple manuscripts (5+ recommended).

Output discipline:
- Honest measurement. Do not adjust the critique-skill output to
  match the ground truth after the fact.
- Document the comparison methodology so others can replicate.
- "We don't have enough calibration data" is a legitimate finding.
