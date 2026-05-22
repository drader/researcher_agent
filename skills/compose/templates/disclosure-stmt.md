# AI-assistance disclosure statement

<!-- Pick the variant that matches the target venue's policy
     category. See `references/ai-disclosure-patterns.md` for the
     category descriptions. Fill the placeholders with the user's
     actual use pattern. The framework refuses to produce
     statements that misrepresent what the AI did. -->

**Manuscript title.** {{Title}}
**Target venue.** {{Venue name}}
**Policy category.** {{A: high-disclosure | B: moderate-disclosure | C: restrictive | D: preprint server}}
**Date prepared.** {{YYYY-MM-DD}}

---

## Variant 1: high-disclosure venues (Category A)

<!-- For Nature portfolio, Springer, Elsevier, JAMA, Cell Press,
     PLOS, BMJ, and similar. Often placed in a dedicated section
     near the Acknowledgments or as a Methods subsection. -->

**Use of generative AI in manuscript preparation.** The
corresponding author used {{tool_name}} ({{provider}}; version
{{version}}) during the preparation of this manuscript to assist
with the following tasks: {{task_list — e.g., outlining the
manuscript structure, drafting initial versions of the Methods
and Results sections, checking citation consistency, and
converting the document between Markdown and LaTeX}}. All
AI-generated text was reviewed and edited by the author. All
citations were verified against the original sources. The author
takes full responsibility for the manuscript's content, its
conclusions, and its adherence to the journal's policies. The AI
tool is not listed as an author and made no substantive
intellectual contribution to the work's conceptualization, data
analysis, or interpretation.

---

## Variant 2: moderate-disclosure venues (Category B)

<!-- For many ACM, IEEE, Royal Society, and society journals.
     Often placed in the Acknowledgments or in a short statement
     in submission metadata. -->

**AI-assistance disclosure.** The authors used {{tool_name}}
({{version}}) during the preparation of this manuscript for
{{task_list — e.g., drafting prose, citation formatting, and
format conversion}}. The authors reviewed and edited the AI output
as needed and take full responsibility for the content of this
publication.

---

## Variant 3: restrictive-policy venues (Category C)

<!-- For venues with explicit restrictions on AI use. The statement
     confirms compliance and names what the AI did and did not do. -->

**Statement of compliance with the journal's AI policy.** The
authors confirm compliance with {{Venue}}'s policy on the use of
generative AI in manuscript preparation. {{Tool_name}} ({{version}})
was used only for {{permitted_task_list — e.g., copy-editing,
citation formatting, and format conversion}}. It was not used for
{{prohibited_task_list — e.g., generating literature review
content, drafting the Discussion, producing or interpreting data,
or generating figures}}. All substantive intellectual content was
authored by the listed humans, who take full responsibility for
the manuscript.

---

## Variant 4: preprint server note (Category D)

<!-- For arXiv, bioRxiv, medRxiv, SSRN, OSF preprints, and similar.
     Often a short note in the manuscript body or a free-text field
     in the submission form. -->

**Note on AI assistance.** During the preparation of this
preprint, the corresponding author used {{tool_name}} ({{version}})
for {{task_list — e.g., outlining, drafting, citation-checking,
and format conversion}}. All output was reviewed and edited by
the author, who is responsible for the content of this preprint.

---

## Variant 5: conference venues (NeurIPS / ICML / ACL / similar)

<!-- Many ML and NLP conferences have evolving policies. Check the
     current call for papers. The pattern below is conservative. -->

**Use of large language models in manuscript preparation.** We
used {{tool_name}} ({{version}}) to assist with {{task_list — e.g.,
prose editing, citation formatting, and code commentary}}. The
tool was not used to {{exclusions — e.g., generate experimental
results, propose research questions, or write the contribution
statements}}. The authors verified all AI-assisted text and code
and take responsibility for the content of the paper.

---

## Variant 6: minimal Acknowledgments line

<!-- For venues that allow a brief mention in Acknowledgments
     rather than a dedicated section. Use only when a longer
     statement is not required. -->

The author acknowledges the use of {{tool_name}} ({{version}})
for {{task_list}} during the preparation of this manuscript.

---

## Notes for the disclosure-generator agent

- The agent draws the task list from the framework's session
  record. If the user requests a task list that contradicts the
  record (e.g., naming only "language polish" when the record
  shows substantive section drafting), the agent flags the
  inconsistency and asks the user to confirm.
- The version field is filled when known; if not known, the field
  is omitted or marked "current at time of preparation."
- The provider field is filled when the venue requests it; some
  venues request the product name only.
- The agent does not produce a "no AI was used" statement when the
  framework's record shows AI was used. The user may decline to
  submit a disclosure if the venue does not require one, but the
  agent will not generate language that denies AI use.
