# Example: guided-mode dialogue fragment

> **Illustrative only.** The manuscript and review below are fictional,
> produced as a worked example for the `critique` skill. The exchange
> below is a stylized transcript of what `critique-guided` dialogue
> might look like; real sessions will vary in length, sequence, and
> phrasing. Use this file to understand the shape of guided-mode
> output, not as a source of substantive claims.

---

## Context (one paragraph, for the example)

The author has shared a draft of an empirical paper that uses an
online survey to test whether a brief framing intervention changes
self-reported willingness-to-pay for a renewable-energy upgrade. The
draft includes an introduction, a methods section, a results section
with one main figure, and a discussion. The author has asked the
`critique` skill for a guided session, indicating they want to
"work through what might be wrong, not be handed a list."

Per SKILL.md section 5.5, the skill has run the five upstream
sub-agents and is holding an internal candidate-issue queue. The
candidate issues are not shown to the user; they shape the
sequence of questions below.

---

## Dialogue

### Turn 1 (skill)

I have read the draft end to end. Before we go through it, can I
ask: when you read your own introduction, what do you see as the
single claim the rest of the paper is built to support?

### Turn 1 (user)

That a brief informational framing — the one in our condition — is
enough to shift stated willingness-to-pay. I want to make the case
that low-cost interventions have a measurable effect.

### Turn 2 (skill)

Good. Now look at the methods section, specifically how the
willingness-to-pay outcome is measured. Read paragraph two of
section 3.2 again and tell me what you notice about the measure
itself.

### Turn 2 (user)

It's a single-item self-report. We ask people directly how much
they would be willing to pay per month.

### Turn 3 (skill)

A reviewer in this area would likely ask whether a single-item
self-report of a hypothetical payment is the right measure of the
construct you are trying to capture. What do you think about that
question?

### Turn 3 (user)

I see what you're getting at. It's a measure of stated intention,
not behaviour. I had been treating it as if it stood in for the
behaviour and the reviewer would probably push back on that.

### Turn 4 (skill)

Right. There are two paths from here: defend the measure on the
grounds that stated WTP is the standard measure in the literature
and you are using it in the same way, or acknowledge the gap and
narrow the claim to "stated willingness-to-pay" rather than
"willingness-to-pay." Which is closer to what you want to say?

### Turn 4 (user)

Honestly, I think narrowing the claim is closer to what the data
support. I had been over-claiming.

### Turn 5 (skill)

Note that down. Let's look at the results section. Figure 1 is the
main figure. When you read your interpretation in section 4, what
is the effect size you are emphasizing, and how does it compare to
the variability shown in the figure?

### Turn 5 (user)

The effect is statistically significant. I'm reporting it as a
shift of about €2.40 per month. The error bars on the figure are
about the same size as the effect.

### Turn 6 (skill)

A reviewer would probably comment on that. A significant difference
whose error bars approach the effect size is real but its practical
size is harder to argue. How are you framing the practical
significance currently?

### Turn 6 (user)

I'm framing it as evidence that even small interventions matter. I
think you're pointing me at: the effect size relative to the
uncertainty doesn't justify that strong a framing of practical
importance.

### Turn 7 (skill)

That's my read. You have two options that would each be defensible.
You can keep the statistical claim and soften the practical
framing — "we observe a small but statistically detectable shift" —
or you can argue, with citations, that even shifts of this
magnitude have policy relevance and accept the heavier defensive
load that creates. Which feels more like the paper you want to
write?

### Turn 7 (user)

The first. I don't have the policy-relevance literature lined up to
defend the second, and I don't think the data will sustain it
anyway.

### Turn 8 (skill)

Good. One more, and then we can break. In your discussion section,
you write that the intervention "demonstrates the potential of
informational framings for sustainability behaviour change." Given
the two adjustments you just made — narrowing the outcome from WTP
to stated WTP, softening the practical-significance framing — does
that sentence still match the paper?

### Turn 8 (user)

No, it doesn't. The intervention demonstrates that this kind of
framing can shift stated WTP in a survey context. The leap to
"sustainability behaviour change" is several steps further than the
data support. I'll rewrite the sentence.

### Turn 9 (skill, recap)

Three things you noticed in this session:

1. The outcome measure is stated WTP, not WTP. The introduction and
   the discussion need to track the narrower construct.
2. The effect size relative to the error bars does not sustain the
   strong practical-significance framing. You will soften the
   framing.
3. The discussion's leap to "sustainability behaviour change"
   exceeds the evidence. You will rewrite the conclusion sentence
   accordingly.

There are other items I noticed during my read that we did not
discuss — issues about the sample's representativeness, the
robustness of the result across the pre-registered subgroups, and
the literature on stated-versus-revealed preferences. If you want,
we can take another session on those. For now, I would suggest you
start with the three above; they re-frame the contribution and
several other items downstream will resolve as you make those
changes.

Would you like me to draft a brief written summary of what you
noticed today?

### Turn 9 (user)

Yes please, but keep it short. I'll start with the three you
listed; we can do another session for the rest.

---

## Brief written summary (skill, on user request)

Issues the author noticed in the guided session:

1. **Construct narrowing.** The outcome is stated willingness-to-
   pay, not willingness-to-pay. The introduction and the
   discussion will be revised to track the narrower construct.
2. **Practical-significance framing.** The effect size relative to
   the reported variability does not sustain a strong practical
   claim. The framing will be softened to "small but statistically
   detectable shift."
3. **Discussion overreach.** The leap from a survey-based stated
   WTP shift to "sustainability behaviour change" will be removed;
   the discussion will close on the survey-context result.

Issues raised in the read but not yet discussed:

- Sample representativeness.
- Robustness across pre-registered subgroups.
- Engagement with the stated-versus-revealed-preferences literature.

The author indicated they would tackle the three above first and
return for another session on the remaining items.

End of example.
