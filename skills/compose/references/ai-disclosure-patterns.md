# AI-assistance disclosure patterns

This reference summarizes how academic venues currently treat
disclosure of AI assistance during manuscript preparation, and offers
template patterns the `disclosure` mode can adapt. Venue policies
change frequently — the `disclosure-generator` agent must verify the
current policy at submission time, not rely on this document alone.

The framing principle is straightforward: AI assistance should be
described accurately so that editors, reviewers, and readers can
evaluate the contribution. Disclosure is not an admission; it is a
methodological note, on par with naming the statistical package
used or the lab equipment that produced a measurement.

---

## 1. Policy categories

Most venue policies fall into one of four categories. The categories
are not formal — they are convenient buckets for choosing a template
variant.

### Category A: require detailed disclosure

The venue requires a named disclosure section or paragraph that
identifies the tool, the tasks performed, and the human oversight
applied. AI systems are explicitly barred from authorship; the
corresponding human author is responsible for all content.

Typical signals in the venue's instructions:

- A dedicated "Use of AI" or "Declaration of generative AI" section
- A statement that authors must declare any use of generative AI
  during manuscript preparation
- Explicit exclusion of AI tools from the author list
- Sometimes a requirement to include the disclosure in the
  Acknowledgments or in a Methods subsection

Examples of venue families in this category (verify at submission):
Nature portfolio journals, Springer journals broadly, Elsevier
journals broadly, JAMA Network, Cell Press, PLOS journals, BMJ.

### Category B: require disclosure when AI was used substantively

The venue requires disclosure when AI assistance went beyond minor
copy-editing or grammar checking. Routine spell-check, grammar
suggestions, or reference-formatting tools may not require
declaration; substantive drafting, summarization, or content
generation does.

Typical signals:

- A statement that "substantive" or "significant" AI assistance must
  be declared, with no required declaration for trivial use
- A description of what does and does not need to be disclosed
- A separation between AI used for writing (often requires
  disclosure) and AI used as a research tool inside the methodology
  (described in Methods)

Examples of venue families in this category (verify at submission):
many ACM venues, many IEEE venues, the Royal Society journals, some
society journals.

### Category C: discourage or prohibit AI use beyond minor assistance

The venue restricts AI use in manuscript preparation, sometimes to
the point of prohibiting it for content generation. Disclosure is
required even where use is permitted, and the policy may rule out
certain tasks (e.g., generating literature review prose, drafting
discussion sections).

Typical signals:

- Language describing AI-generated content as undesirable or
  prohibited
- Explicit lists of permitted vs. prohibited tasks
- Requirements that AI not be used to generate references, figures,
  or data interpretation
- Statements that violations may result in rejection or retraction

Examples vary; some humanities journals, some clinical journals, and
some specialist society journals have adopted restrictive language.

### Category D: preprint servers

Preprint servers tend toward a lighter touch but increasingly request
disclosure. The disclosure may be a free-text field in the submission
form rather than a section in the manuscript.

Typical signals:

- A submission-form field asking whether AI tools were used and how
- Guidance to include a note in the manuscript when AI was used
- No prohibition on AI use, but a requirement to be transparent

Examples: arXiv, bioRxiv, medRxiv, SSRN, OSF preprints, ChemRxiv.
Verify current policies; arXiv in particular has updated its policy
multiple times.

---

## 2. What to disclose

When disclosure is required, the statement should name:

1. **Tool identity.** The product or system name. Where relevant,
   the provider (e.g., "Claude Code (Anthropic)").
2. **Tool version.** If the version is known and the venue requests
   it. Some venues consider version material; others do not.
3. **Tasks performed by the AI.** Specifically what the system did.
   Useful categories:
   - Planning and outlining (e.g., proposing a section structure)
   - Drafting prose (e.g., writing a first draft of a section)
   - Revising prose (e.g., editing a draft for clarity)
   - Translation between languages
   - Citation formatting and consistency checking
   - Cross-format conversion (e.g., Markdown to LaTeX)
   - Code generation (analysis scripts, figure-rendering code)
   - Literature search assistance (if applicable)
   - Summarization of source material
4. **Human oversight applied.** How the user supervised the AI's
   output. Examples: "all AI-generated text was reviewed and edited
   by the corresponding author"; "all references suggested by the
   AI were verified against original sources"; "the AI's structural
   proposals were accepted, modified, or rejected by the author at
   each section."
5. **Authorial responsibility.** A statement that the human author
   takes responsibility for the manuscript's content, including any
   AI-assisted text.

---

## 3. What not to claim

Disclosure statements should avoid these patterns:

- **AI as author.** No major venue currently permits AI systems as
  authors. The framework refuses to draft language that lists an AI
  as an author or that implies authorship-level contribution.
- **AI as decision-maker for substantive content.** Statements like
  "the AI decided which sources to include" or "the AI selected
  which results to report" misrepresent the division of
  responsibility. The author makes substantive decisions; the AI
  assists with mechanics.
- **AI as data source.** Statements that imply the AI generated the
  data analyzed, or supplied facts that were not verified against
  primary sources, misrepresent the methodology. If the AI was used
  to generate synthetic data for an explicit purpose, describe that
  in Methods, not in disclosure.
- **Understatement of use.** A statement that AI was used only for
  language polish, when in fact it drafted whole sections, is
  inaccurate. The `disclosure-generator` agent flags inconsistencies
  between the user's recollection and the framework's session record.
- **Vague boilerplate.** "AI tools may have been used" is not a
  disclosure; it is an evasion. Statements should be specific.

---

## 4. Template patterns

The patterns below are starting points, not finished statements. The
`disclosure-generator` agent fills in tool name, tasks, and version
based on the user's actual use pattern, then the user reviews.

### Pattern 1: detailed disclosure (Category A venues)

```
Use of generative AI in manuscript preparation. The
corresponding author used {{tool_name}} (version {{version}}) to
assist with the following tasks: {{task_list}}. All AI-generated
content was reviewed and edited by the author. The author verified
all citations against the original sources and takes full
responsibility for the manuscript's content, conclusions, and
adherence to the journal's policies.
```

### Pattern 2: methodological note (Category A or B venues, Methods-style)

```
During the preparation of this manuscript, the authors used
{{tool_name}} for {{task_list}}. After using this tool, the
authors reviewed and edited the content as needed and take full
responsibility for the content of the publication.
```

### Pattern 3: light disclosure (Category B venues, minor use)

```
AI assistance disclosure. {{Tool_name}} was used for
{{task_list}} during manuscript preparation. The authors reviewed
and verified all AI-assisted output.
```

### Pattern 4: restrictive-venue compliant (Category C)

```
The authors confirm compliance with the journal's policy on the
use of generative AI. {{Tool_name}} was used solely for
{{task_list}}; it was not used for {{prohibited_task_list}}. All
content reflecting substantive intellectual contribution was
authored by the listed humans.
```

### Pattern 5: preprint-server note (Category D)

```
Note on AI assistance. The corresponding author used
{{tool_name}} during the preparation of this preprint to
{{task_list}}. The author reviewed all output and is responsible
for the manuscript's content.
```

### Pattern 6: minimal Acknowledgments line (when only brief
acknowledgment is appropriate)

```
The author acknowledges the use of {{tool_name}} for
{{task_list}}.
```

---

## 5. Verification at submission time

Venue policies have changed multiple times since the broad
deployment of large language models in late 2022. The
`disclosure-generator` agent does the following before producing a
final statement:

1. Asks the user whether they have consulted the venue's current
   instructions to authors.
2. If the user has the current policy text, asks them to paste it
   so the statement aligns with the venue's wording conventions.
3. If the user does not have the current policy, recommends
   verifying before submission and produces a statement based on
   the venue family's prior pattern, flagged as such.

The agent does not assume a policy persists from a previous
submission cycle.

---

## 6. Special cases

**Multiple authors with different AI use patterns.** The disclosure
covers the manuscript, not each author individually. If only the
corresponding author used AI, the statement says so. If multiple
authors used AI for different tasks, the statement names the tasks
without attempting to map them to individual contributors unless
the venue requires it.

**AI use in figures or code.** If AI generated code that produced a
figure or an analysis, this is typically described in Methods (as a
methodological detail) rather than in the disclosure section.
Different venues have different conventions; the user supplies the
relevant venue rule.

**AI-translated manuscripts.** Translation is a disclosable task in
most Category A and B venues. The disclosure names the source and
target languages and the tool.

**Refusal to misrepresent.** When the user requests a statement that
the framework's record shows to be inaccurate, the
`disclosure-generator` agent names the inconsistency and asks the
user to either correct the statement or correct the record.

---

## 7. Closing note

A good disclosure is short, specific, and accurate. The reader
should be able to tell what the AI did, what the human did, and who
is responsible. Anything else is either decoration or evasion.
