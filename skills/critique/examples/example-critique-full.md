# Example: full-mode critique output

> **Illustrative only.** The manuscript and review below are fictional,
> produced as a worked example for the `critique` skill. The
> manuscript title, authors, results, and reviews do not correspond
> to any real publication. Use this file to understand the shape of
> `critique-full` output, not as a source of substantive claims.

---

## The (fictional) manuscript

**Title.** A photonic-neuromorphic hybrid for low-power keyword spotting at the edge

**Abstract (synthetic, ~120 words).** Wake-word detection on battery-
powered devices is constrained by the energy cost of always-on
acoustic feature extraction. We present a hybrid architecture that
performs early acoustic feature extraction in a passive photonic
front-end and downstream classification on a digital neuromorphic
processor. We evaluate the system on the Google Speech Commands v2
benchmark and a custom in-room recording set. The photonic front-end
operates without active electrical signal conversion until the
neuromorphic stage, reducing average sensing energy by an estimated
73% relative to a CMOS baseline. Classification accuracy on the
standard benchmark is 94.1%, within 1.4 percentage points of a
strong recurrent baseline. We discuss design trade-offs, robustness
to ambient noise, and integration with existing low-power audio
front-ends. We argue that photonic-neuromorphic hybrids are a
promising direction for energy-constrained always-on inference.

---

## Reviewer 1 (methodological rigour)

### Summary

The manuscript proposes a hybrid sensing-and-classification system
that splits the acoustic processing pipeline between a passive
photonic front-end and a digital neuromorphic back-end. The headline
claims are a 73% reduction in average sensing energy versus a CMOS
baseline and a classification accuracy of 94.1% on Speech Commands
v2, within 1.4 percentage points of a strong recurrent baseline. My
review focuses on whether the evaluation supports these claims.

### Strengths

1. The system architecture is well described in section 3 and the
   block diagram in Figure 2 makes the partitioning of the pipeline
   clear.
2. The choice of benchmark (Speech Commands v2) is standard for the
   sub-field and allows direct comparison to prior work.
3. The energy reporting in section 5.2 separates the sensing,
   transduction, and classification phases, which is useful.

### Weaknesses (major comments)

1. **Energy baseline.** The 73% reduction is reported against a
   single CMOS baseline whose specification is given in section 5.1
   in two sentences. The baseline's filter-bank stage, ADC bit
   depth, and sample rate are not stated. Without these, the
   comparison cannot be verified. The manuscript should specify the
   baseline in enough detail that a competent reader could
   reproduce the comparison, and ideally should report against more
   than one baseline (e.g., a standard MFCC pipeline at common
   parameter settings).

2. **Active-component energy.** Section 5.2 reports the front-end as
   "passive" and assigns the photonic stage zero active energy. The
   downstream electrical readout and the neuromorphic stage are
   evaluated for energy; the photonic stage's pump source, if any,
   and its temperature-stabilization cost (if any) are not. If the
   front-end is truly fully passive in steady state, this should be
   demonstrated or argued explicitly. If it requires any active
   source, that source's energy should be in the budget.

3. **Statistical reporting.** The 94.1% accuracy is reported as a
   point estimate. The manuscript does not report a confidence
   interval, a cross-validation breakdown, or a comparison against
   prior work that includes uncertainty intervals. The 1.4-
   percentage-point gap to the recurrent baseline could be inside
   or outside the noise; the reader cannot tell.

4. **In-room recording set.** Section 4.3 introduces a "custom
   in-room recording set" used in the robustness evaluation. The
   size, composition, recording conditions, and labeling procedure
   for this set are not described. A custom dataset whose
   construction is undocumented cannot ground the robustness claim.

### Specific comments (minor)

1. Section 3.1, p. 4: "the photonic front-end" is used before it is
   defined. Define earlier or in section 2.
2. Figure 2: the labels on the back-end stage overlap; the spike
   bus label is partially occluded.
3. Section 5.2, equation 7: the units on the right-hand side appear
   to be milliwatts but the left-hand side is energy per inference.
   Either a time integration is missing or the variable name is
   confusing.
4. Section 6: "we discuss design trade-offs" — the discussion is
   brief; consider expanding.

### Recommendation

**Major revisions required.**

### Rationale

Major comments 1, 2, and 3 are each by themselves sufficient to
warrant major revision. The energy comparison is the headline
result and currently rests on an underspecified baseline and an
incomplete budget. The accuracy comparison lacks uncertainty
reporting. None of these is unfixable, but addressing them
requires substantive work.

### Confidence

**Medium.** I am confident in the methodology comments. I cannot
independently assess the photonic front-end's hardware claims; a
specialist in integrated photonics should weigh in.

---

## Reviewer 2 (literature grounding)

### Summary

The manuscript positions itself within the keyword-spotting
literature and the broader low-power audio-front-end literature.
The contribution is framed as a hybrid combining two established
research lines (passive photonic sensing and neuromorphic
classification). My review focuses on the engagement with prior
work.

### Strengths

1. The introduction cites the canonical Speech Commands benchmark
   paper and a recent survey on always-on audio processing.
2. The related-work section in section 2 separates photonic
   front-ends and neuromorphic back-ends usefully.

### Weaknesses (major comments)

1. **Missing antecedents on photonic acoustic sensing.** The
   manuscript discusses photonic front-ends as if the combination
   with classification is novel. Section 2.1 cites three works on
   photonic acoustic transduction but does not engage with the
   subsequent literature on photonic-electronic hybrid pipelines.
   Several recent papers should be addressed; the manuscript's
   contribution should be positioned against them.

2. **Treatment of the recurrent baseline.** The 94.1% accuracy is
   compared against "a strong recurrent baseline" cited as one
   source. The keyword-spotting literature includes a number of
   architectures (TC-ResNet variants, attention-based, multi-stage)
   that have reported comparable or higher accuracy. The
   manuscript should engage with this broader baseline landscape
   rather than treating a single recurrent reference as the bar.

3. **Energy literature.** The 73% energy reduction is framed as
   significant. The manuscript should locate this against the
   existing energy reductions reported in the always-on audio
   literature. Some recent work has claimed comparable reductions
   using approaches that do not require a photonic stage; the
   manuscript should engage with these claims and explain what its
   hybrid offers that they do not.

### Specific comments (minor)

1. Section 2.2: the neuromorphic-classification subsection is shorter
   than the photonic-sensing subsection; consider rebalancing.
2. Reference list: the conference proceedings entries are
   inconsistently formatted; some include the city, others do not.
3. Citation of the Speech Commands v2 release: the version is not
   specified; v2 includes several sub-releases.

### Recommendation

**Major revisions required.**

### Rationale

Major comment 1 is the principal driver: the manuscript's framing of
the contribution depends on the literature engagement, and the
current engagement is incomplete. Major comments 2 and 3 are also
substantive but addressable.

### Confidence

**High.** The literature in this area is my primary research
context.

---

## Reviewer 3 (clarity and presentation)

### Summary

The manuscript describes a hybrid architecture and an evaluation. My
review focuses on whether a reader (specialist or careful non-
specialist) can follow the description and the evaluation as
written.

### Strengths

1. The figures are clean and the captions are informative.
2. The methods description in section 3 is well sectioned.
3. The abstract is a faithful summary of what the paper does.

### Weaknesses (major comments)

1. **Section 4 transition.** The transition from section 3 (system
   description) to section 4 (evaluation) is abrupt. Section 3 ends
   with an unfinished discussion of the spike-bus protocol; section
   4 begins with the evaluation setup. A short bridging paragraph
   would help.

2. **Terminology consistency.** "Front-end," "sensing stage," and
   "transduction stage" appear to be used interchangeably in
   sections 3 and 5. The reader cannot tell whether these are
   synonyms or distinct stages. The manuscript should pick one
   term or clearly distinguish them.

3. **Figure 4.** The robustness plot compresses three conditions
   into one panel; the legend uses three line styles, two of which
   are difficult to distinguish at print size. Consider three
   panels or distinct colour assignments.

### Specific comments (minor)

1. Section 3.1, p. 5: the sentence beginning "Given that the photonic
   pathway operates passively..." runs for four lines; consider
   splitting.
2. Section 4.2: the paragraph order does not match the order in
   which the evaluation conditions are described in section 4.1.
3. Section 5.2: the unit "pJ/inference" is used in equation 7 and
   "nJ/inference" in equation 8. Consistency is needed.
4. Section 6, third paragraph: "we believe that" appears three times
   in five sentences; consider varying.
5. Reference 23: page numbers missing.

### Recommendation

**Accept with minor revisions.**

### Rationale

The clarity issues are addressable in a focused revision. None
reaches the level of impeding comprehension of the work's main
contribution. The methodology and literature reviewers may
recommend stronger revision; from a clarity standpoint, the
manuscript is largely sound.

### Confidence

**High.**

---

## Reviewer 4 (contribution significance)

### Summary

The manuscript claims a 73% energy reduction and within-1.4-point
accuracy on Speech Commands v2. The contribution as framed is a
hybrid architecture for low-power keyword spotting. My review asks:
is this the right framing of the contribution, and is the
contribution significant on the framing's own terms?

### Strengths

1. The choice of hybrid framing is sensible. Photonic-only and
   neuromorphic-only approaches each have known limitations; a
   hybrid is a natural design point.
2. The application (keyword spotting at the edge) is well-defined
   and important.

### Weaknesses (major comments)

1. **Significance of the energy reduction.** A 73% reduction is
   significant only if the absolute baseline is meaningful. The
   manuscript does not establish that the CMOS baseline used for
   comparison is the right point of reference. The recent
   always-on-audio literature has demonstrated CMOS-only systems
   with much lower energy than the baseline used here; the
   reduction may be smaller against the appropriate baseline.

2. **Accuracy gap.** Being within 1.4 percentage points of a strong
   baseline is presented as a strength. Reviewer 2 raises whether
   this is the strongest baseline; even granting it, a 1.4-point
   gap at 94.1% may be inside or outside the relevant operating
   region for edge deployment. The discussion does not address
   whether this gap matters in deployment.

3. **Generality of the claim.** The conclusion frames the result as
   evidence that photonic-neuromorphic hybrids are a promising
   direction. A single application, a single dataset, and a single
   hardware configuration are reported. The conclusion's
   generality exceeds the evidence; it should be either narrowed
   or supported by additional evaluations.

### Specific comments (minor)

1. The contribution paragraph in the introduction (p. 2) lists four
   contributions; on inspection, contributions 2 and 4 overlap.
2. The discussion in section 6 introduces "future work" items that
   would be substantial and probably necessary for the broader
   claim; consider whether the claim should be reduced now.

### Recommendation

**Major revisions required.**

### Rationale

The significance claim depends on the energy baseline (raised by
reviewers 1 and 2) and on the generality of the demonstration.
Without addressing these, the contribution as framed is
overstated. The work itself is interesting; the framing needs
work.

### Confidence

**Medium-high.**

---

## Reviewer 5 (general)

### Summary

A photonic front-end feeds a neuromorphic classifier in a keyword-
spotting system. The system uses much less energy than a baseline
and is almost as accurate as a standard model. I read the paper as
a curious non-specialist in either photonics or neuromorphic
computing.

### Strengths

1. The motivation is clear: always-on keyword spotting is
   energy-constrained; this work proposes a hybrid that addresses
   the energy constraint.
2. The block-level system description in section 3 is accessible.
3. The energy budget in section 5.2 is appreciated even where I
   cannot evaluate the numbers myself.

### Weaknesses (major comments)

1. **What does the photonic stage actually compute?** Section 3.1
   describes the front-end's hardware but a non-specialist reader
   cannot tell what mathematical operation the front-end
   performs on the acoustic signal. A short paragraph that says
   "the front-end computes X feature from the audio waveform"
   would help.

2. **Why this hybrid and not another?** The manuscript justifies
   the hybrid framing in a sentence in section 1. A non-specialist
   reader would benefit from a paragraph on the design space and
   the choice made.

3. **What would success look like?** Section 6 discusses the result
   but does not say what a successful keyword-spotting system at
   the edge looks like in deployment. A reader who is not in the
   field cannot weigh the result without this context.

### Specific comments (minor)

1. The phrase "low-power" is used without a target operating range.
2. The acronym TIA appears on p. 6 without definition.

### Recommendation

**Major revisions required.**

### Rationale

The reviewers more specialised than I am have raised substantive
issues. From my position, the manuscript would benefit
significantly from making the work accessible to a broader edge-AI
readership without specialised photonics background.

### Confidence

**Low.** I am not in this sub-field.

---

## Editorial decision letter

**Recommended disposition.** Major revisions required.

Dear authors,

After consideration of the five attached reviewer reports, the
recommended disposition is **major revisions required**. The
reviewers converge on a small number of substantive issues that the
revised manuscript will need to address before it can be considered
ready for publication.

The principal areas of convergence:

1. The energy baseline (raised by Reviewers 1, 2, and 4) is the
   single most important issue. The 73% reduction is the
   manuscript's headline result and currently rests on an
   under-specified baseline and an incomplete energy budget.
2. The literature engagement (raised by Reviewer 2 and reinforced
   by Reviewer 4) requires expansion. The hybrid framing depends on
   what the prior work has and has not done; the current engagement
   is incomplete.
3. The reporting of uncertainty on the accuracy result (raised by
   Reviewer 1) is needed for any of the comparison claims to be
   evaluable.

Points of divergence: Reviewer 3 recommends "accept with minor
revisions" on the basis of clarity considerations alone. Reviewers
1, 2, 4, and 5 recommend "major revisions required." The
substantive issues raised by reviewers 1, 2, and 4 are sufficient
to warrant major revision; the converged disposition is therefore
"major revisions required."

### Required revisions

1. **Specify the energy baseline.** Provide the CMOS baseline in
   enough detail that a reader can reproduce the comparison.
   Consider reporting against more than one baseline.
2. **Complete the energy budget.** Account for any active components
   in the photonic stage (pump source, temperature stabilization)
   or demonstrate that the steady-state operation is fully passive.
3. **Report uncertainty on accuracy.** Provide confidence intervals
   or repeated-evaluation standard deviations on the 94.1% number
   and on the comparison baselines.
4. **Document the custom in-room recording set.** Describe its
   size, composition, recording conditions, and labeling.
5. **Expand the literature engagement.** Address recent
   photonic-electronic hybrid work and the broader baseline
   landscape for keyword spotting.
6. **Narrow or substantiate the generality claim.** The conclusion
   that photonic-neuromorphic hybrids are broadly promising
   exceeds the demonstration; either narrow the claim or add
   evaluations that support it.

### Recommended revisions

1. Resolve terminology inconsistency between "front-end,"
   "sensing stage," and "transduction stage."
2. Rework Figure 4 for visibility of all three conditions.
3. Add a paragraph in section 3 explaining what mathematical
   operation the photonic stage performs.
4. Address minor figure, citation, and unit inconsistencies listed
   across the reviewer reports.

This decision letter is produced by the `critique` skill as a
rehearsal. It is not an actual editorial decision and does not
bind any venue.

---

## Revision roadmap (summary)

For consumption by `compose-revision-triage` and `compose-revision`.
The full roadmap is delivered as a separate file.

1. Energy baseline specification — critical — Reviewer 1, 2, 4.
2. Energy budget completeness — critical — Reviewer 1.
3. Uncertainty reporting on accuracy — major — Reviewer 1.
4. In-room recording set documentation — major — Reviewer 1.
5. Literature engagement on photonic-electronic hybrids — major —
   Reviewer 2.
6. Narrowing or supporting generality claim — major — Reviewer 4.
7. Terminology consistency — minor — Reviewer 3.
8. Figure 4 revision — minor — Reviewer 3.

End of example.
