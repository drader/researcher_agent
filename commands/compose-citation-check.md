---
description: Audit citation consistency and accuracy across a manuscript via the compose skill in citation-check mode.
model: sonnet
---

Invoke the `compose` skill in **citation-check mode**.

Audit a manuscript's citations for internal consistency and basic
accuracy. This mode reports; it does not silently fix.

Workflow:

1. Gather inputs:
   - Manuscript (full draft with in-text citations)
   - Reference list (if separate file)
   - Citation style claimed by the manuscript (APA 7, Vancouver, etc.)

2. Build two indices:
   - All in-text citations (author, year, page if present)
   - All reference list entries (author, year, title, venue)

3. Run the following checks:

   a. **Orphan citations** — in-text citations with no reference
      list entry
   b. **Unused references** — reference list entries that are never
      cited
   c. **Author/year mismatches** — in-text "(Smith, 2019)" but
      reference list says "Smith, 2020"
   d. **Style consistency** — in-text formatting uniform (parenthetical
      vs narrative use, page numbers, et al. cutoffs)
   e. **Reference list formatting** — each entry follows the claimed
      style; common errors flagged
   f. **Duplicate references** — same source listed twice
   g. **Suspicious patterns** — same author cited many times for many
      different claims (could indicate over-reliance on one source),
      preprints cited without indication, retracted papers
   h. **DOI/URL validity** — DOIs that are structurally invalid (do
      not resolve)

4. For each issue, record:
   - Issue type
   - Location in manuscript (section, paragraph, sentence number)
   - Original text
   - Recommended fix (specific, not "fix the citation")

5. Present a structured error report grouped by issue type. Provide
   a count summary at the top.

6. Offer to apply fixes individually (the user picks which) but do
   not bulk-apply silently.

Length: dependent on issues found. A clean manuscript may produce a
short report; a messy one may produce a long one.

Style: support APA 7, MLA 9, Vancouver, IEEE, Chicago author-date.
If style cannot be inferred from the reference list, ask the user.

Refusals:
- Do not silently rewrite the manuscript
- Do not declare a manuscript "clean" without running every check
- Do not invent reference list entries to satisfy orphan citations;
  flag them for the author to source
