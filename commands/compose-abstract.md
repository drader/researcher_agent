---
description: Abstract + keywords for a manuscript via the compose skill in abstract mode.
model: sonnet
---

Invoke the `compose` skill in **abstract mode**.

Generate an abstract and a keyword list for a manuscript, given the
manuscript (or its outline + main results) and the target venue.

Workflow:

1. Gather inputs:
   - Manuscript (full draft preferred; otherwise outline + results
     summary)
   - Target venue (for word limit and structured/unstructured choice)
   - Author's central claim, in one sentence

2. Determine the abstract type required by the venue:
   - **Structured** (Background / Methods / Results / Conclusion or
     analogous) — common in biomedical, clinical, social-science
     journals
   - **Unstructured** single-paragraph — common in physical-science
     and humanities venues
   - **Extended** abstract (500–1500 words) — some conferences
   If the venue is ambiguous, ask.

3. Draft the abstract using the `abstract-block.md` template:
   - Open with the question or problem
   - State the method or approach
   - Report the key finding (most important first)
   - Close with the implication or contribution
   - Respect the venue word limit (typical: 150–300 words)

4. Generate 3–7 keywords:
   - Mix high-specificity terms (e.g., "convolutional autoencoder")
     with mid-specificity terms (e.g., "anomaly detection") to
     improve discoverability
   - Include terms a likely reader would search for, not just terms
     the author personally favors
   - Avoid keywords already in the title (no need to repeat)

5. Generate an optional running title if the venue requires one
   (usually ≤50 characters).

6. Present the abstract + keywords + running title. Offer one
   revision pass.

Length: as specified by venue. Default: 200-word structured or
unstructured.

Refusals:
- Do not inflate findings beyond what the manuscript supports
- Do not include claims in the abstract that are not present in the
  full draft
- Do not use ambiguous hedges that obscure what was actually done
