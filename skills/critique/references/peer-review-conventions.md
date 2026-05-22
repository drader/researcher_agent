# Peer-Review Conventions

Background reference for the `critique` skill. Describes the standard
shapes of peer review across disciplines so that the skill's simulated
reviewers produce output that resembles what an author will actually
encounter at submission.

This document describes conventions; it does not prescribe a single
correct form. The `critique` skill draws on the conventions appropriate
to the manuscript's discipline when assembling reports.

---

## What peer review is for

Peer review is the practice by which a scholarly venue asks
independent experts to assess a manuscript before publishing it. The
review serves several overlapping purposes:

- A quality filter: are the methods adequate, the claims supported,
  the contribution real?
- A correction loop: what should the author fix before the work is
  put into the permanent record?
- A signal to readers: a peer-reviewed paper has passed through a
  process that an unreviewed one has not.
- A judgement on fit: is this manuscript right for this venue?

None of these purposes is sufficient on its own. A paper can pass
peer review and still be wrong; a paper can fail peer review and
still be useful. The system is a check, not a guarantee.

---

## Review models

Three principal models exist, with hybrids.

### Single-blind

The reviewers know the authors' identities; the authors do not know
the reviewers'. Common in many natural science journals and most
engineering conferences. The argument for single-blind is that
reviewers can assess plausibility against the authors' track record;
the argument against is that reputation can substitute for substance
and that reviewers may treat well-known authors more leniently.

### Double-blind

Neither party knows the other's identity. Common in much of
computer science (machine learning conferences in particular), in
economics, and in some humanities venues. The argument for double-
blind is that it reduces bias related to author identity, prestige,
geography, and gender. The argument against is that in small fields
authors are often identifiable from the work itself; deanonymization
is difficult to prevent.

### Open review

Reviews are signed and, in some venues, published alongside the
final paper. Some venues (eLife, F1000Research, OpenReview-hosted
conferences) operate this way. The argument for open review is
that it makes reviewers accountable and the review record useful as
a scholarly object in its own right; the argument against is that
some reviewers will not write candidly under their own name,
especially when criticizing senior figures.

Hybrids exist: review is double-blind during evaluation and signed
on publication; reviewers may opt to sign or remain anonymous; the
review record is published only if the paper is accepted.

The `critique` skill is most often used to rehearse for single-blind
or double-blind review. The reviewer reports it produces are written
in a register appropriate to either.

---

## Standard reviewer report structure

Across disciplines, a competent reviewer report typically contains:

### Summary of the manuscript

One paragraph in which the reviewer demonstrates that they have read
and understood the work. The summary is not just decorative — it
signals to the editor and the authors that the criticisms below
rest on a correct reading of the paper. A reviewer who summarizes a
paper inaccurately undermines their own criticisms.

### Strengths

A short section that names what the manuscript does well. Even
papers that need substantial revision typically have something
worth recognizing. Naming strengths is also a calibration aid: a
reviewer who can find nothing to praise may be unduly harsh; a
reviewer who praises everything may be unduly lenient.

### Weaknesses (or major comments)

The substantive section. The reviewer names the issues that the
authors would need to address before the work can be published. The
weaknesses are specific: a passage, a claim, a method, a missing
analysis. "The introduction is weak" is not a useful comment;
"The introduction does not motivate why the choice of evaluation
metric matters for downstream applications" is.

### Specific comments (or minor comments)

Numbered, ordered by section of the manuscript. These are smaller
issues: typos, unclear sentences, missing details, suggestions for
rephrasing. Specific comments do not by themselves drive a
disposition; they are the cleanup list.

### Recommendation

The reviewer's recommended editorial action. The set of options
varies by venue but typically includes: accept, accept with minor
revisions, major revisions required, reject and resubmit, reject.
Some venues add categories such as "transfer to sister journal" or
"reject and encourage resubmission." Some conference venues use
scored scales (1–10) plus a confidence score.

### Confidence

In many venues the reviewer reports their confidence in their
recommendation: high, medium, low, very low. A low-confidence
reviewer may have read carefully but believes the manuscript is
outside their core expertise; the editor weighs the review
accordingly.

### Comments to the editor (private)

Some venues allow private comments to the editor that the authors
do not see. These typically cover suspicions of misconduct, concerns
about conflict of interest, or context that would be inappropriate
to share with the authors directly. The `critique` skill, being
run by the author, does not produce private-to-editor comments.

---

## Standard editorial decision categories

Editors translate reviewer reports into one of a small set of
decisions:

### Accept

The manuscript is ready as is, or with editorial copyediting only.
Rare on first submission. More common on the final round of a
multi-round revision.

### Accept with minor revisions

The manuscript is essentially ready. The required changes are
mechanical: clarifying sentences, adding a missing reference,
correcting a typo, sharpening a definition. The revised version
may not need re-review.

### Major revisions required

Substantive changes are needed: a missing analysis, a methodological
clarification, a strengthening of the contribution argument, a
restructuring of a section. The revised version will be re-reviewed,
usually by the same reviewers.

### Reject and resubmit

The required changes go beyond what a major revision can
accommodate: new data, a different evaluation, a re-framing of the
contribution. The authors are invited to do the work and submit
again, possibly with a new manuscript ID.

### Reject

The manuscript cannot be salvaged at this venue. The reasons may be
substantive (the work is flawed in ways that cannot be fixed) or
fit-related (the work is good but wrong for this venue). A clean
reject closes the file; an "encourage resubmission" reject suggests
that a substantially different submission would be welcome.

The distinction between "reject and resubmit" and "reject with
encouragement to resubmit" is venue-specific. Authors should read
decision letters carefully to understand which they have received.

---

## Per-discipline norms

Disciplines differ in what reviewers emphasize and in the shape of
the publication cycle.

### Biomedical and clinical sciences

Heavily structured. Reviewers expect adherence to reporting
guidelines (CONSORT for randomized trials, STROBE for observational
studies, PRISMA for systematic reviews, CARE for case reports).
Statistical analysis is closely scrutinized; statistical reviewers
are often assigned separately. Ethics approval, registration of
trials, and data availability statements are checked.

Citation style typically follows the Vancouver convention (numbered
references). Reviews are often longer than in other fields and may
include a checklist completed against the relevant reporting
guideline.

### Social sciences (empirical)

Methodology is the primary point of contention: identification
strategies, threats to causal inference, sample selection, measurement
validity, replication. Open-science practices (pre-registration, data
availability, code sharing) are increasingly expected though uneven
across subfields. Theoretical contribution is also weighted; a paper
that finds a result without explaining it may be sent back for
better theoretical framing.

### Humanities

Argument-centric review. The reviewer evaluates whether the
manuscript engages adequately with the existing scholarship, whether
its argument is internally coherent, whether its evidence (textual,
archival, ethnographic) supports its claims, and whether the
contribution is original. Tone is often more discursive than in the
sciences; reviewer reports may run to several pages of prose
without a checklist structure. Editorial decisions sometimes hinge
on a single reviewer's view in fields where the pool of qualified
referees is small.

### Computer science

Conference-heavy. Major conferences (NeurIPS, ICML, ACL, SIGGRAPH,
OSDI, SOSP, etc.) host much of the field's archival publication.
Review cycles are short, reviewer load is high, and the review form
is structured: scores on novelty, clarity, soundness, significance;
confidence scores; an overall recommendation. Rebuttals are common:
the authors get a short window to respond to reviews before the
final decision. Double-blind review is standard at most top venues.

Journal publication exists but is often a re-publication or
extension of a conference paper.

### Engineering

A mix of conference and journal publication, varying by sub-discipline.
Reviewer attention focuses on problem definition, design rationale,
the validity of the evaluation (often experimental), the fairness of
the comparisons made to prior work, and the appropriateness of the
ablations. Reproducibility is increasingly important.

### Mathematics

Different from most other fields. The reviewer's primary task is to
verify the proofs, or to be convinced that the proofs are likely
correct. Reviews are often longer in elapsed time (months to
years) and shorter in word count than in other fields. The
distinction between "I have checked the proofs" and "I am
sufficiently convinced" is sometimes explicit. Conjecture-status
results are reviewed with attention to whether the statement is
clearly false, clearly correct, or genuinely open.

### Mixed-methods and interdisciplinary work

Reviewers from different disciplines may apply different standards
to the same manuscript. Editors typically try to assemble a panel
that covers each methodology, but this is not always possible.
Authors of interdisciplinary work should expect heterogeneous
reviews and should address them on their own terms rather than
trying to reconcile them.

---

## Common review-process pitfalls

Failures the `critique` skill should not replicate.

**The "I would have written a different paper" review.** The
reviewer suggests redesigns that effectively turn the manuscript
into a different study. This is generally inappropriate. The
reviewer's role is to evaluate the manuscript the authors wrote,
not the one the reviewer would have written.

**The "missing my paper" review.** The reviewer demands citation of
their own work without strong relevance. Editors discount such
demands, but they appear often enough to be a known pattern.

**The dismissive paragraph.** A reviewer summarizes the manuscript
inaccurately and rejects it on grounds the manuscript does not
contain. Editors notice this when the reviewer's summary contradicts
the abstract.

**The over-precise demand.** A reviewer insists on a specific
analysis ("you must use a mixed-effects model with these random
effects") when several analyses would be defensible. Authors may
honor the request, or push back on it, but editors generally side
with the more defensible analysis.

**The contradictory pair.** Two reviewers contradict each other on
the same point. The editor must weigh which is correct, or note
the disagreement and let the authors address both views.

**The disposition mismatch.** A reviewer writes a review whose
substance suggests "major revisions" but checks the "reject" box,
or vice versa. The editor reads the substance, not the box.

**The escalating reviewer.** A reviewer becomes more demanding on
each round, treating each addressed issue as the trigger for new
issues. Editors should intervene; in practice they sometimes do not.

---

## Reviewer responsibilities and limits

A reviewer is responsible for:

- Reading the manuscript carefully end to end
- Evaluating it against the standards of the discipline and venue
- Producing a report that helps the editor reach a decision and
  helps the authors improve the work
- Disclosing conflicts of interest
- Maintaining confidentiality of the manuscript
- Delivering the review within the requested time

A reviewer is not responsible for:

- Re-running the authors' analyses
- Locating new sources the authors might cite (though they may
  flag specific obvious omissions)
- Editorial copyediting (though they may flag pervasive writing
  problems)
- Making the editorial decision (they recommend; the editor decides)
- Mentoring the authors at length (though many do, voluntarily)

The `critique` skill's simulated reviewers operate within these
bounds. They do not re-run analyses; they do not search the
literature for citations the authors missed (that is the
`research` skill's job); they do not produce editorial decisions
unilaterally. They model what a careful reviewer would write so
that the author can rehearse before the real reviewer arrives.
