---
description: Literature review section as integrated prose via the compose skill in lit-section mode.
model: sonnet
---

Invoke the `compose` skill in **lit-section mode**.

Produce the literature review section of a manuscript: integrated
prose rather than annotated entries. Use this mode when the user
has source material (from `research` skill output) and needs the
prose for inclusion in a draft.

Workflow:

1. Gather inputs:
   - Verified source list with quality flags
   - Research question or thesis the lit review supports
   - Target venue (affects length and structural conventions)
   - Author's intended themes (if any), or request for thematic
     induction from the source set

2. If themes are not pre-specified, induce them from the source set.
   Cluster sources by what they investigate / argue. Aim for 3–6
   themes for most manuscripts.

3. Confirm theme structure with the user before drafting. Ask:
   "Use these themes (T1, T2, T3, ...) — does this match how you
   want to frame the field?"

4. Draft the section using the `lit-review-section.md` template:
   - Brief scope statement (1 paragraph)
   - Thematic body: per theme, an overview paragraph, evidence
     paragraph(s), disagreement paragraph (if applicable), gap
     paragraph (what is not yet known)
   - Synthesis paragraph: integrate across themes; identify cross-
     cutting patterns; locate the present work in the field
   - Transition paragraph: connect the lit review to the specific
     contribution of the manuscript

5. Every claim cites a source. Multiple-source synthesis cites
   each contributing source. Disagreements are named, not glossed.

6. Present the section. Offer one revision pass.

Length: typically 1000–3500 words depending on field, manuscript
type, and number of themes. Some venues request shorter (compact
lit reviews); some longer (dissertations, review articles).

Citation style: matches the rest of the manuscript or APA 7 default.

This mode does NOT search for new literature. If a theme has a gap
in source coverage, route the user to `research` skill before
proceeding.

Refusals:
- Do not invent themes that the source set does not actually
  support
- Do not synthesize across contradictory sources without naming
  the disagreement
- Do not pad with generic transitions; if a transition is hard to
  write, the underlying organization may be off
