---
description: In-depth methodology critique via the critique skill in methodology mode.
model: sonnet
---

Invoke the `critique` skill in **methodology mode**.

Produce a deep critique focused on the methodology of an empirical
or systems manuscript. Use this when methods are the most consequential
or most contested aspect of the work.

Workflow:

1. Gather inputs:
   - The manuscript (methods section is essential; results + intro
     for context)
   - Domain (biomedical / social science / engineering / etc.) —
     affects which rubric applies
   - The user's own concerns, if any

2. Invoke two agents: methodology-critic and devil-advocate. Both
   read the same manuscript and produce independent reports.

3. Methodology-critic produces a structured assessment using the
   methodology-critique template:
   - Study design assessment (or analogous for non-empirical work)
   - Statistical analysis review (if applicable)
   - Validity threats (internal, external, construct, statistical
     conclusion)
   - Comparison and baseline critique
   - Replicability assessment
   - Severity-ranked issue list (critical / major / minor / suggestion)

4. Devil-advocate produces a parallel "hostile-but-fair reviewer"
   report:
   - Alternative explanations the manuscript did not consider
   - Hidden assumptions
   - Cases where the evidence does not support the conclusion as
     stated
   - Points where the manuscript overclaims

5. Editorial-decider (optional, if user requests) synthesizes the
   two reports into a methodology-only recommendation. Skipped by
   default since this mode is methodology-focused, not full editorial.

6. Present the two reports. Offer one revision pass.

Mandatory checkpoint: final acceptance (step 6).

Length: typically 2000–4000 words for the combined output.

Output discipline:
- Be specific. "Sample size seems small" is not a useful critique;
  "n=30 across 3 conditions with no power analysis yields insufficient
  detection of effects below Cohen's d=0.8" is useful.
- Distinguish between fatal flaws and improvable issues. Mark severity
  explicitly.
- Acknowledge what the manuscript got right; methodology critique is
  not a hatchet.
