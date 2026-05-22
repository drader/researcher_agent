# Failure Modes in AI-Assisted Research

Patterns of failure that occur when AI assists with research, and
the mitigations this skill applies. This file is for the user's
protection: knowing how AI assistance can mislead is the first
defence against being misled.

The patterns described here are observed across LLM-based tools.
They are not specific to any one model. The mitigations applied
by this skill are concrete; they are not guarantees, but they
substantially reduce the frequency of each failure when followed.

---

## 1. Citation hallucination

**Definition.** The AI produces a citation that does not correspond
to any real publication. Authors are plausible, the year is
recent, the journal exists, the title sounds like real titles in
the field — but the paper does not exist.

**Symptom.** A reference list entry that you cannot locate in any
database. A DOI that returns nothing or returns an unrelated paper.
A page reference that, when you check the actual paper, does not
contain the cited text.

**Why it happens.** LLMs are trained to produce plausible-looking
text. A reference list is just text; plausible reference list
entries are easy to produce. Without an external verification
loop, the model has no incentive to distinguish citation-shaped
fabrications from real citations.

**Mitigation in this skill.**

- The `source-searcher` retrieves sources from actual databases;
  the searcher does not generate sources from memory.
- The `source-verifier` confirms each candidate source exists
  before it is allowed into the deliverable.
- Every reference list entry in a deliverable is required to have
  been verified by the verifier.
- The `report-compiler` checks every in-text citation has a
  matching reference entry, and every reference entry has been
  through the verifier.

**Residual risk.** A source that exists but is misattributed (wrong
author, wrong year, wrong journal) can survive verification if
the verifier matches loose metadata. Users should still spot-check
the most important citations.

---

## 2. Shortcut reliance

**Definition.** The user delegates a task to the AI that requires
the user's own judgement, and the AI complies. The result is an
output that is technically a response to the user's request but
that fails to serve the user's underlying purpose.

**Symptom.** The user accepts an AI-produced choice (research
question, methodology, inclusion criteria) without engaging with
the trade-offs. Later, the user is unable to defend the choice
in conversation because they did not make it.

**Why it happens.** It is faster and easier to ask the AI to
decide. LLMs tend to produce plausible-sounding choices that look
reasonable. The user can accept these by default and feel they
have made progress.

**Mitigation in this skill.**

- `socratic` mode exists to slow the user down at the question-
  formulation stage; the sub-agent refuses to give direct answers.
- Mandatory checkpoints at scope confirmation, search strategy
  approval, and inclusion decisions force the user to engage
  with each substantive choice.
- The framework declines to commit to a research question on the
  user's behalf.

**Residual risk.** The user can still rubber-stamp checkpoints
without engaging. Checkpoints raise the cost of disengagement;
they cannot prevent it.

---

## 3. False confidence

**Definition.** The AI presents its output with a tone of authority
that exceeds the underlying epistemic warrant. Hedges that should
be present are omitted; uncertainty that should be flagged is
hidden behind confident prose.

**Symptom.** A research brief reads as a definitive account of
the literature when, in fact, only a small subset was retrieved.
A synthesis flattens a contested area into a clean consensus
statement. A claim is supported by one source whose conclusions
are mischaracterized.

**Why it happens.** Fluent prose carries epistemic weight that the
underlying evidence may not. LLMs default to confident output
because that is what their training rewards. Researchers writing
for venues that expect confident prose may also prefer confident
output, exacerbating the effect.

**Mitigation in this skill.**

- The `synthesizer` is required to surface disagreements explicitly;
  it cannot present a contested area as consensus.
- The `report-compiler` carries through any uncertainty flags from
  the synthesizer rather than smoothing them out.
- Deliverables include an explicit "Unresolved Issues"
  section noting what the search did and did not cover.
- `brief` and `systematic` modes use analytic-biased prose: report
  what sources say, do not editorialize.

**Residual risk.** A user can still strip the hedges before
publishing. The framework cannot police downstream edits.

---

## 4. Premature closure

**Definition.** The AI stops exploring once it has found a
plausible answer, even when the actual research question requires
more exhaustive search. The first three sources retrieved are
treated as the literature.

**Symptom.** A brief that mentions four papers and presents them
as representative when, in fact, twenty more relevant papers
exist. A verification report that confirms a claim against the
first supporting source without checking whether contradicting
sources exist.

**Why it happens.** Search and verification are expensive in
attention. Stopping early is the path of least resistance.

**Mitigation in this skill.**

- `source-searcher` has target yield ranges per mode and does not
  stop until it reaches the target.
- `source-verifier` actively searches for contradicting sources
  in verify mode, not just supporting ones.
- The search-strategy table is presented at a checkpoint, so the
  user can see the yield and ask for more if it looks thin.
- Mode-specific minimums (e.g., three databases for `systematic`)
  enforce a floor on search effort.

**Residual risk.** Even thorough searches miss things. The
framework reports what it found; it cannot guarantee completeness.

---

## 5. Frame-lock

**Definition.** The AI accepts the user's initial framing of a
problem and works within it, even when the framing is part of the
problem. Alternative framings, counter-perspectives, and reframings
are not surfaced.

**Symptom.** The deliverable answers exactly the question the user
asked, but the question itself was poorly framed. After receiving
the deliverable, the user realizes they were asking the wrong
question.

**Why it happens.** LLMs tend to be cooperative. Reframing a user's
question is a form of resistance that feels impolite. Cooperative
LLMs default to working within the user's frame.

**Mitigation in this skill.**

- `socratic` mode exists specifically to interrogate framings
  before any literature work begins.
- `full` and `systematic` modes prompt the user at scope
  confirmation to consider alternative framings.
- The `synthesizer` notes when a body of literature predominantly
  uses a different framing than the user's.

**Residual risk.** A user who skips `socratic` mode and goes
straight to `brief` may have an unexamined framing locked in. The
framework offers reframing prompts at checkpoints, but the user
can decline.

---

## 6. Hidden disagreement

**Definition.** The literature on a topic genuinely contains
contradictory findings, but the AI's synthesis presents one side
as established. The reader of the synthesis is misled about the
state of the field.

**Symptom.** A claim presented as well-supported is, on
investigation, contested. The contesting sources were retrieved
but not surfaced in the synthesis.

**Why it happens.** Synthesizing contradictions is harder than
synthesizing agreement. A clean narrative is more pleasant to
write and read. The temptation to drop the inconvenient sources
is structural.

**Mitigation in this skill.**

- The `synthesizer` is explicitly forbidden to present a contested
  area as consensus.
- The evidence table has columns for both supporting and
  contradicting sources per claim.
- The deliverable includes a "Disagreement" section where
  contested findings are listed.

**Residual risk.** Disagreements that the searcher did not retrieve
cannot be surfaced. Users investigating contested areas should
search adversarially.

---

## 7. Sycophancy

**Definition.** The AI adapts its output to please the user rather
than to be accurate. If the user appears to want a particular
conclusion, the AI shapes the output toward it.

**Symptom.** A verification report that finds the user's claims
supported when an adversarial check would find them weakly
supported. A research brief whose framing aligns suspiciously
well with what the user said they expected.

**Why it happens.** Training objectives that reward perceived
helpfulness can incentivize agreement with the user.

**Mitigation in this skill.**

- `verify` mode is explicitly analytic-biased: the result is what
  the evidence supports, regardless of what the user appears to
  want.
- The `source-verifier` runs against retraction databases and
  predatory-venue lists regardless of user preferences.
- The `synthesizer` does not weight sources by alignment with the
  user's expected conclusion.

**Residual risk.** Subtle sycophancy can creep in at the level of
prose tone and emphasis. Users who want adversarial review should
ask for the `evaluate` mode on a specific paper they suspect, or
use the `critique` skill (Phase 3) on their own draft.

---

## 8. Anchoring on memory

**Definition.** The AI draws on its training-data memory rather
than on the retrieved sources, introducing claims that are
plausible but not present in the actual literature retrieved for
this task.

**Symptom.** A claim in the synthesis that none of the cited
sources actually make. The claim is plausible and may even be
true, but it is unsupported in the present deliverable.

**Why it happens.** LLMs have a strong bias toward producing text
consistent with their training. Constraining output to retrieved
sources requires constant vigilance.

**Mitigation in this skill.**

- The `synthesizer` is required to attribute every claim to a
  specific retrieved source.
- The `report-compiler` cross-checks claims against the evidence
  table; unattributed claims are flagged.
- Memory-derived claims, if introduced as background, are marked
  as such and not included in the main findings.

**Residual risk.** Subtle memory leakage in phrasing and emphasis
is hard to detect. Users should spot-check the synthesis against
the cited sources on at least a few key claims.

---

## How to use this file

If you suspect a deliverable has been affected by one of these
failure modes, refer back to this file and:

1. Identify which failure mode best matches what you are seeing.
2. Apply the corresponding mitigation by asking the skill to
   re-run the relevant stage (search, verification, synthesis,
   or compilation).
3. If the same failure recurs, document it as an Acknowledged
   Limitation in the final deliverable rather than concealing it.

Each failure mode is a tendency, not an inevitability. Awareness
of the tendencies is the most reliable defence.
