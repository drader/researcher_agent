---
description: Annotated bibliography (10–50 sources) via the research skill in annotate mode.
model: sonnet
---

Invoke the `research` skill in **annotate mode**.

The user wants a reading list with annotations: bibliographic entry
plus a structured summary of each source. This is a useful preparatory
artefact for a literature review, a course reading list, or a
grant-proposal references section.

Workflow:

1. Confirm parameters with the user:
   - Topic and scope
   - Number of sources desired (10–50 typical)
   - Source-type mix (peer-reviewed only, or also preprints,
     monographs, conference papers, gray literature)
   - Time window
   - Intended use (literature review, course, grant, briefing)

2. Run a search calibrated to the desired count. Over-retrieve by
   ~50% to allow for verification dropouts.

3. Apply source-verifier rules. Drop sources flagged as low confidence
   unless the topic has thin literature and the user accepted lower
   confidence in step 1.

4. For each retained source, produce an entry following the
   `annotated-bibliography.md` template:
   - Full citation (APA 7)
   - Source type
   - Quality flag (high / medium / low confidence)
   - Summary (100–200 words): what the source argues or finds, in
     your own words
   - Methodology critique (50–100 words): how the source produced
     its findings, with one or two notes on strength or limitation
   - Relevance to the user's stated purpose (1–2 sentences)

5. Group the entries thematically if the user requested grouping,
   or list alphabetically by first-author surname otherwise.

6. Provide a short header summarizing: count by source type, count
   by quality flag, themes covered (if grouped).

7. Present the draft. Offer one revision pass to adjust grouping,
   add/drop sources, or adjust annotation depth.

Output target length: roughly 250–400 words per entry plus header.
For a 20-source bibliography, expect 5000–8000 words.

Citation style: APA 7 unless the user specifies otherwise.

Quality discipline:
- Every annotation is written by you in your own words, paraphrasing
  the source. Do not copy the source's abstract verbatim.
- If you cannot find the source's full text to read and must work
  from abstract only, mark the annotation as "based on abstract" so
  the user knows the depth of your reading.
- If a source is highly cited but you suspect issues (retraction,
  methodological criticism, replication failure), include a brief
  note. Do not omit silently.
