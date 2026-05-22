# Source Quality Assessment

Operational guidance for the `source-verifier` sub-agent. Defines
the criteria, rubric, and procedures for grading sources as high,
medium, low, or reject.

---

## Purpose

Not all sources are equal. A peer-reviewed empirical study in a
reputable journal is more citable than a blog post; a primary
source is preferred over a secondary summary; a retracted paper
should not be cited as evidence. This file specifies how the
verifier sub-agent makes those judgements.

The grade reflects a source's citability under standard academic
norms. It does not reflect whether the source's claims are true.
A `high` grade does not mean the paper is correct; it means the
paper is the kind of thing a reader expects to see cited as
evidence.

---

## Criteria

### Peer-review status

Was the source subjected to independent review before publication?

- **Peer-reviewed journal article**: yes, formally.
- **Peer-reviewed conference paper**: yes, though the review
  process varies in rigour across conferences.
- **Workshop paper, poster, extended abstract**: usually lighter
  review or no review.
- **Preprint**: not peer-reviewed at the time of posting (though
  it may later become a peer-reviewed paper).
- **Book from an academic press**: usually peer-reviewed at the
  proposal and manuscript stages.
- **Book from a trade press**: editorial review, not peer review.
- **Thesis or dissertation**: examined by a committee, which is a
  form of review but distinct from journal peer review.
- **Technical report**: institutional review only, varies.
- **Self-published, blog, social media**: no peer review.

Peer review is not a guarantee of quality, but its absence shifts
the evidential burden onto the source itself.

### Venue quality

Where was the source published?

- **Indexed journal in the field's recognized core**: high signal.
  Most disciplines have a list of journals considered central.
- **Indexed journal outside the core**: medium signal. Could be
  legitimate but lower-impact, or could be specialized.
- **Predatory journal**: a journal that accepts payment for
  publication with little or no review. Multiple lists exist
  attempting to identify these; the verifier checks against
  available lists and flags candidates.
- **Major conference in the field**: high signal in fields where
  conference publication is the norm (computer science, much of
  engineering).
- **Workshop or local conference**: medium signal.
- **arXiv, bioRxiv, medRxiv, PsyArXiv, SSRN**: legitimate preprint
  venues. Medium-by-default until peer-reviewed.

### Author affiliations

Are the authors at recognized research institutions? Industry
researchers, independent scholars, and academics all produce
legitimate work, but the affiliation provides context. Lack of
affiliation is noted but not disqualifying.

### Citation pattern

How often has this source been cited, and by whom?

- High citation count in a mature field: signal of impact.
- Low citation count for a new paper: normal; not informative.
- Low citation count for an old paper: signal of limited influence.
- Cited only by the same small cluster of authors: signal of a
  narrow influence; possibly insular subfield, possibly
  groundbreaking work that has not yet been picked up.

Citation count is one signal among many. It is not the primary
criterion.

### Retraction status

Has the source been retracted or had a correction or expression
of concern issued?

- **Retracted**: do not cite as evidence. May be cited as a case
  study of the retraction itself.
- **Expression of concern**: cite with explicit warning.
- **Correction**: cite the corrected version; note the correction
  if the corrected portion is what is being cited.

Check Retraction Watch and the publisher's errata pages where
accessible.

### Conflicts of interest

Are conflicts disclosed? Industry-funded studies on industry
products are not invalid but the funding relationship is reported.
Authors who have served as consultants to the entities they study
are similarly noted.

### Methodology rigour

Does the source describe its methodology adequately? An empirical
paper without a methods section is less citable than one with a
thorough methods section, even if both have peer review.

The verifier does not deeply assess methodology — that is the
reader's job — but does note whether a methods section is present
and whether it reports the basics (sample size, inclusion
criteria, analysis approach, software/instruments used).

### Primary vs secondary

- **Primary**: original data, original analysis, original argument.
- **Secondary**: summarizes, reviews, or synthesizes the primary
  literature.

When a secondary source cites a primary for a fact, the primary is
preferred. Secondary sources are useful for framing, for
identifying primary literature, and for noting how a field
interprets its evidence.

### Currency

When was the source published? Currency matters more in some
fields than in others; a 2010 paper in classical philology is
recent; a 2010 paper in machine learning is dated. Note the year
and let the user decide.

---

## The four-grade rubric

### High

All of the following:

- Existence verified
- Not retracted
- Peer-reviewed venue
- Reputable journal or recognized conference
- Authors with research-context affiliations or established
  publication record
- No undisclosed conflicts of interest

Recent papers with no citations can still be high if all other
criteria are met. Citation count is supportive, not necessary.

### Medium

Any of the following, in the absence of disqualifying factors:

- Well-cited preprint that has not yet been peer-reviewed
- Peer-reviewed paper in a less-recognized venue
- Conference paper in a moderate-tier venue
- Book from an established academic press
- Thesis from a recognized institution

### Low

Any of the following:

- Substantive academic blog post by a credentialed author
- Technical report from a legitimate organization (government
  agency, established think tank, recognized lab)
- News article that reports primary research (prefer the primary
  if accessible)
- Opinion piece, commentary, editorial in an academic venue
- Source whose venue is hard to assess but does not appear
  predatory

### Reject

Any of the following:

- Existence cannot be verified
- Retracted (note in the record but exclude from citations as
  evidence)
- Predatory-venue publication, unless the user has explicit
  justification for inclusion
- Citations whose metadata is internally inconsistent (year does
  not match publication record, authors do not appear in the
  source, etc.)
- Sources that exist only as second-hand mentions with no
  primary record locatable

---

## Procedure

For each candidate source:

1. **Verify existence.** Search the citation in at least one
   bibliographic database (Crossref, OpenAlex, Google Scholar).
   If you cannot find it, mark `reject` with reason.

2. **Check retractions.** Search Retraction Watch and the
   publisher's site. If retracted, mark `reject` (with retraction
   note retained).

3. **Classify venue.** Identify the journal, conference, press,
   or other venue. Check against any available predatory-venue
   lists. Note the venue's standing in the field as best you can
   determine.

4. **Determine peer-review status.** From the venue's policy and
   the source's type.

5. **Inspect authors.** Note affiliations. Do not search for
   ad hominem material; just record what is on the publication.

6. **Note citation count.** If accessible; otherwise omit.

7. **Note conflicts.** As disclosed in the source.

8. **Classify primary vs secondary.**

9. **Assign grade.** Apply the rubric. When in doubt between two
   grades, choose the lower.

10. **Document the judgement.** Each grade is supported by a
    short note (one to three sentences).

---

## Edge cases

**Withdrawn preprints.** Some preprints are withdrawn by their
authors after posting. Treat similarly to retraction: do not cite
as evidence. Note the withdrawal reason where known.

**Predatory journals with legitimate-looking papers.** Some papers
in predatory journals are genuinely good and would be high-graded
in a legitimate venue. The verifier still grades them low or
reject because the venue confers no review-quality assurance. If
the user insists on inclusion, this is noted as a deviation.

**Self-published primary research.** Pre-publication or self-
published primary work (e.g., an independent researcher's
methodology white paper) may be the only source for a particular
finding. Treat as low; the user decides whether to include and
what caveats to apply.

**Translated sources.** A translation may differ in subtle ways
from the original. Note the translation status and, where
practical, cite the original as well.

**News coverage of primary research.** Use only as a pointer to
the primary research. Cite the primary; do not treat the news
article as evidence of the empirical claim.

**Wikipedia.** Useful for orientation, not citable as evidence in
academic work. Use Wikipedia's reference lists to find the
primary sources it draws on, and cite those.

**Tweets, blog posts, podcasts.** Cite only when the source is
itself the subject of analysis (e.g., a study of science
communication on social media). Not citable as evidence of the
claims it discusses.

**Government and NGO reports.** Often legitimate primary sources
for policy-relevant data. Grade by the reporting organization's
reputation and the methodology described.

**Datasets.** Grade by the data repository's reputation,
documentation quality, and licensing. Cite per the data citation
norms of the chosen style.
