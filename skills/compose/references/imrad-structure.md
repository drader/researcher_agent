# IMRaD structure and domain variants

This reference describes the standard IMRaD manuscript structure
(Introduction, Methods, Results, Discussion) and the common domain
variants the `compose` skill supports. The structures here are
templates; specific venues may require adjustments and the user's
target venue takes precedence.

The IMRaD format became the dominant structure for scientific
reporting through the second half of the twentieth century; for a
historical overview, see Sollaci & Pereira (2004).

## 1. Canonical IMRaD (empirical research article)

Used for: experimental, observational, or computational empirical
studies in the natural sciences, social sciences, biomedical
sciences, and engineering.

### Section order

1. Title
2. Authors and affiliations
3. Abstract
4. Keywords
5. Introduction
6. Methods (sometimes "Materials and Methods" or "Methodology")
7. Results
8. Discussion
9. Conclusion (sometimes folded into Discussion)
10. Limitations (sometimes folded into Discussion)
11. Acknowledgments
12. Author contributions (CRediT taxonomy is increasingly required)
13. Conflicts of interest
14. Data availability
15. References
16. Supplementary material (separate file, or appendix)

### Length proportions

For a typical 6000-word journal article:

| Section | Words | Share |
|---------|-------|-------|
| Abstract | 150–300 | 3–5% |
| Introduction | 800–1500 | 13–25% |
| Methods | 1200–2000 | 20–33% |
| Results | 1200–2000 | 20–33% |
| Discussion | 1000–1800 | 17–30% |
| Conclusion | 200–400 | 3–7% |

Proportions vary by discipline. Biomedical articles tend to have
longer Methods. Engineering articles tend to have longer Results
(measurement tables) and shorter Discussion. Computer science
conference papers often compress Methods.

### Section content

**Introduction.** Three paragraphs is a common shape:

1. The broad problem. What is the field interested in, and why?
2. The narrower problem. What is known, what is the gap, what
   open question motivates this study? This is where the
   literature review fits (for a short paper; longer papers have a
   dedicated Related Work section).
3. The present study. What was done, what is the contribution, what
   is the one-sentence summary of findings.

**Methods.** Past tense, sufficient detail for replication. Common
subsections:

- Participants / subjects / data sources (for studies involving
  human or animal subjects, or for studies on existing datasets)
- Materials / apparatus / instrumentation
- Procedure / protocol
- Measures / instruments
- Analysis (statistical methods, computational methods, etc.)
- Ethics statement (where applicable)

**Results.** Descriptive, no interpretation. Common structure:

- Reporting in the order the analyses were planned (or the order
  most useful to the reader, when post-hoc analyses are involved)
- Tables and figures referenced from the text
- Statistical reporting per the relevant disciplinary conventions
- Negative or null results reported alongside positive results

**Discussion.** Common shape:

1. Restate the main finding in one or two sentences.
2. Compare to prior work (consistent with, contradicts, extends).
3. Mechanistic or theoretical interpretation.
4. Limitations (or a separate section).
5. Implications and future directions.

### Common pitfalls

- Introducing methods in Introduction (Introduction should motivate;
  Methods should describe)
- Interpreting results in Results (interpretation belongs in
  Discussion)
- Restating Results in Discussion without adding interpretation
- Overclaiming in Conclusion beyond what the Results support
- Burying limitations at the end of Discussion in vague language
- Citing only supporting work in Introduction and ignoring
  contradictory literature

---

## 2. Clinical case report

Used for: a single patient case or small case series, often
illustrating a rare presentation, a new diagnostic approach, or a
novel treatment.

### Section order

1. Title
2. Authors and affiliations
3. Abstract (often unstructured, 100–200 words)
4. Keywords
5. Introduction (1–2 paragraphs; the clinical context)
6. Case presentation
   - Patient demographics
   - Presenting complaint
   - History
   - Examination
   - Investigations
   - Differential diagnosis
   - Treatment
   - Follow-up
7. Discussion (compare to literature, mechanistic discussion,
   implications)
8. Conclusion
9. Patient consent statement
10. References

### Length proportions

Total typically 1000–3000 words.

- Introduction: 100–300 words
- Case presentation: 500–1500 words (the bulk)
- Discussion: 400–1000 words

### Common pitfalls

- Over-generalizing from N=1
- Missing patient consent statement (most journals require it)
- Insufficient differential diagnosis discussion
- Using identifying patient details (de-identification is
  mandatory)

---

## 3. Systematic review and meta-analysis

Used for: comprehensive evidence synthesis on a specific question,
following a prespecified protocol. For PRISMA 2020 compliance, see
the `research` skill's `references/prisma-2020.md`.

### Section order

1. Title (typically includes "systematic review" or "meta-analysis")
2. Authors and affiliations
3. Abstract (structured, with the elements PRISMA 2020 requires)
4. Keywords
5. Introduction (rationale + objectives)
6. Methods
   - Protocol and registration (PROSPERO or equivalent)
   - Eligibility criteria
   - Information sources
   - Search strategy
   - Selection process
   - Data extraction
   - Risk of bias assessment
   - Synthesis methods (narrative or meta-analytic)
7. Results
   - Study selection (PRISMA flow diagram)
   - Study characteristics
   - Risk of bias within studies
   - Synthesis of results
   - Additional analyses (subgroup, sensitivity)
8. Discussion (summary of evidence, limitations, conclusions)
9. References
10. Supplementary material (full search strings, extracted data,
    excluded-with-reasons list)

### Length proportions

Total typically 6000–15000 words.

- Introduction: 5–10%
- Methods: 25–35% (heavy methodological detail)
- Results: 30–40% (study characteristics tables drive length)
- Discussion: 20–25%

### Common pitfalls

- Search strategy not reproducible
- Selection criteria not pre-specified or shifted during the review
- Risk of bias not assessed or assessed informally
- Heterogeneity not addressed
- Conclusions stronger than the evidence supports

---

## 4. Philosophy essay

Used for: argumentative essays in philosophy, intellectual history,
critical theory, and related humanities disciplines.

### Section order

The IMRaD structure does not apply. A philosophy essay typically
has:

1. Title
2. Author and affiliation
3. Abstract (often optional in humanities, where required typically
   unstructured 100–250 words)
4. Introduction (the question, the thesis, the structure of the
   essay)
5. Body sections, named by the argument they advance (typically
   3–7 sections, each making one move in the argument)
6. Objections and replies (sometimes a dedicated section)
7. Conclusion
8. References / Works cited (MLA 9 or Chicago notes-and-bibliography
   are common in humanities)

### Length proportions

Total typically 6000–12000 words.

### Common pitfalls

- Thesis too broad
- Citation of authoritative voices without engaging the arguments
- Skipping objections to the thesis
- Long literature review at the front instead of integrating
  literature into the argument

---

## 5. Engineering paper

Used for: applied engineering research, often with a system
description, evaluation, and benchmarking.

### Section order

1. Title
2. Authors and affiliations
3. Abstract (structured or unstructured, 150–250 words)
4. Keywords
5. Introduction
6. Related Work (often a separate section in engineering papers,
   distinct from the Introduction)
7. System / Method (the proposed approach, design, or algorithm)
8. Experimental Setup
9. Results
10. Discussion (sometimes folded into Results)
11. Conclusion and Future Work
12. References

### Length proportions

For an 8-page conference paper:

- Introduction: 1 page
- Related Work: 1 page
- System: 2 pages
- Experimental Setup: 1 page
- Results: 2 pages
- Discussion + Conclusion: 1 page

### Common pitfalls

- Insufficient ablation studies
- Comparison only against weak baselines
- Reporting only the metric the proposed method optimizes
- Missing reproducibility details (hyperparameters, training time,
  hardware)

---

## 6. Technical report

Used for: standalone technical documents that may not be peer
reviewed (lab reports, internal reports, thesis chapters, grant
deliverables).

### Section order

Flexible. A common structure:

1. Title
2. Authors
3. Executive Summary
4. Introduction
5. Background
6. Approach / Methodology
7. Implementation
8. Evaluation
9. Discussion
10. Conclusion and Recommendations
11. References
12. Appendices

### Length proportions

Variable. Executive Summary should be 1 page; the rest is open.

### Common pitfalls

- Missing executive summary (decision-makers may not read further)
- Burying findings in appendices
- Inconsistent terminology across sections (technical reports often
  have multiple contributors)

---

## 7. Thesis chapter

Used for: chapters within a PhD or master's thesis. Each chapter
often resembles a journal article structurally, with some
adaptations.

### Section order

Per chapter, a common shape:

1. Chapter title
2. Brief introduction (the chapter's question, its place in the
   thesis)
3. Methods
4. Results
5. Discussion
6. Chapter summary (the chapter's contribution to the thesis as a
   whole)

The thesis overall has additional structural elements (front matter,
acknowledgments, lay summary in some institutions, conclusion
chapter, full reference list), but those are thesis-level rather
than chapter-level concerns.

### Length proportions

Variable by discipline and institution. A typical empirical chapter
runs 8000–15000 words.

### Common pitfalls

- Chapters reading as standalone papers without connection to the
  thesis argument
- Inconsistent terminology across chapters
- Reference lists per chapter when the thesis requires one
  consolidated list
- The conclusion chapter as a summary rather than a synthesis

---

## 8. Domain selection rules

The `compose` skill defaults to canonical IMRaD unless the user
indicates a different domain. Signals for each variant:

| User signal | Variant |
|-------------|---------|
| "case report", "case series", "patient", "clinical case" | Clinical case |
| "systematic review", "meta-analysis", "PRISMA" | Systematic review |
| "philosophy paper", "philosophy essay", "argument paper" | Philosophy essay |
| "conference paper", "ICML", "NeurIPS", "ACM", "IEEE", "engineering paper" | Engineering paper |
| "technical report", "lab report", "deliverable", "internal report" | Technical report |
| "thesis chapter", "dissertation chapter" | Thesis chapter |
| "journal article", "research paper" (no other signal) | Canonical IMRaD |

When the signal is ambiguous, ask once.

## 9. Section ordering within drafts

The `compose` skill drafts sections in this order regardless of how
they appear in the final manuscript:

1. Methods
2. Results
3. Introduction
4. Discussion
5. Conclusion
6. Abstract

The rationale: Methods and Results are the most constrained by
what actually happened. Drafting them first locks in the empirical
scope of the paper. Introduction and Discussion are then drafted
to frame and interpret what Methods and Results report. Abstract
is drafted last because it summarizes everything.

In assembly, sections are reordered into their canonical position
in the manuscript.

## 10. Title conventions

Titles are typically 10–20 words. A title typically does:

- Names the topic
- Indicates the type of study (review, experiment, case report,
  meta-analysis, etc.)
- Hints at the main finding when concise enough to do so

Avoid:

- Witty or rhetorical titles (humanities sometimes; STEM rarely)
- Question-titles for empirical papers (acceptable for reviews and
  position papers)
- Titles longer than 25 words

## 11. Authorship and affiliations

The `compose` skill records authorship as supplied by the user. It
does not assign authorship, decide author order, or apply CRediT
roles without user input. The CRediT taxonomy (Contributor Roles
Taxonomy) is increasingly required by journals; the user supplies
which role each author played.

## Closing note

Use the structure that fits the work, not the work that fits the
structure. The IMRaD shape is dominant because it works for
empirical reporting, not because it is universal. For a paper that
does not fit any of the variants above, ask the user what shape
the venue expects.

## References

Sollaci, L. B., & Pereira, M. G. (2004). The introduction, methods,
results, and discussion (IMRAD) structure: a fifty-year survey.
*Journal of the Medical Library Association*, 92(3), 364–371.
