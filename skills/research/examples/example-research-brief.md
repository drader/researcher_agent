# Research Brief: Energy Efficiency of Event-Based Vision Sensors

> **Notice.** Example output for demonstration only; citations are
> illustrative and may not correspond to real publications. This
> file shows the structure and tone of a `brief`-mode deliverable.

**Date.** 2026-05-21
**Mode.** brief
**Citation style.** APA 7

---

## Question

What is known about the energy efficiency of event-based vision
sensors (silicon retinas, dynamic vision sensors) compared to
conventional frame-based CMOS image sensors in low-power computer
vision applications such as object tracking and gesture recognition
on embedded platforms?

---

## Scope

This brief covers sensor-level and system-level energy comparisons
between event-based vision sensors (EVS, including DVS-style and
DAVIS-style devices) and conventional rolling-shutter or global-
shutter CMOS imagers. Coverage is from 2017 to early 2026, with
emphasis on peer-reviewed publications. Custom application-specific
integrated circuits (ASICs) for downstream processing are mentioned
but not the focus; the focus is on the sensor and its immediate
readout pipeline. Studies that report only sensor pixel power
without including the downstream processing pipeline are flagged
as such. Non-vision event-based sensors (audio, tactile) are out
of scope.

---

## Methods

Sources were retrieved via Google Scholar and IEEE Xplore using
combinations of the terms "event-based vision," "dynamic vision
sensor," "silicon retina," "energy efficiency," and
"low-power object tracking." Approximately 60 candidate sources
were identified across two query iterations. Sources were graded
for credibility per the source-quality rubric used by this skill;
12 high-confidence and 4 medium-confidence sources were retained
for synthesis. Search was completed on 2026-05-19.

---

## Key Findings

- Event-based vision sensors typically report static-scene power
  consumption between 5 and 30 mW at the sensor level, compared
  to 100–300 mW for conventional CMOS sensors operating at
  comparable spatial resolutions and 30–120 Hz frame rates
  (Brandli et al., 2017, p. 2189; Tanaka & Murakami, 2021,
  sec. 3.2).

- The advantage shrinks substantially when scene activity is
  high. Under dense motion, event-based sensors can generate
  millions of events per second, raising readout power into the
  same range as a conventional sensor; some reports place
  high-activity power within 20% of frame-based equivalents
  (Vasiljević et al., 2022, p. 78).

- Downstream system-level energy depends critically on the
  processing pipeline. Conventional CNN inference on event streams
  converted into frames recovers most of the frame-based energy
  cost; native event-driven processing on neuromorphic hardware
  preserves the sensor's efficiency advantage and can reduce total
  system energy by an order of magnitude for sparse-activity
  workloads (Chen & Park, 2023, p. 451; Okafor et al., 2024,
  sec. 4.1).

- Latency-energy product, rather than pure energy, is the metric
  that most strongly favours event-based sensors in tracking and
  gesture tasks. Reported median end-to-end latencies for event-
  driven gesture recognition on embedded SoCs are 2–10 ms,
  compared to 30–80 ms for frame-based equivalents at matched
  energy budgets (Lin et al., 2024, p. 1102; Brandli et al.,
  2017, p. 2196).

- Benchmark heterogeneity is a recurring concern. There is no
  community-standard energy-efficiency benchmark for event-based
  vision; different studies measure different boundaries (pixel
  array, sensor IC, sensor plus interface, sensor plus processor)
  and report results that are difficult to compare directly
  (Vasiljević et al., 2022, p. 81; Okafor et al., 2024, sec. 5).

- Manufacturing maturity matters. Early DVS designs reported
  power figures that subsequent fabrications did not consistently
  reproduce; the literature on energy efficiency since 2020 is
  more reliable than the literature from before 2018 (Tanaka &
  Murakami, 2021, p. 14).

- Application fit is variable. Tasks with sparse temporal activity
  (high-speed tracking, surveillance with infrequent motion,
  optical-flow estimation in stable scenes) show the largest
  efficiency gains; dense scenes (continuous video for general
  classification) show much smaller gains and sometimes none
  (Chen & Park, 2023, p. 458; Mensah & Ali, 2025, sec. 2.3).

---

## Disagreement

Reported sensor-level power figures vary by an order of magnitude
across sources. Some of this is real (different sensor generations,
different fabrications, different scene statistics); some appears
methodological. Vasiljević et al. (2022) attribute much of the
spread to inconsistent measurement boundaries, while Tanaka and
Murakami (2021) attribute it primarily to genuine differences in
sensor design. The two positions are not mutually exclusive but
the relative weighting of each cause is not settled.

There is also disagreement about whether downstream pipeline
energy should be reported as part of the sensor's efficiency story.
Brandli et al. (2017) argue that sensor power alone is the right
metric for benchmarking; Okafor et al. (2024) argue that
system-level energy is the only metric that matters for
applications. Both positions are defensible; the choice affects
how reported numbers should be interpreted.

---

## Open Questions

1. What would a community-standard energy benchmark for event-based
   vision look like, and which measurement boundary should it
   adopt as canonical?
2. How does sensor-level power scale with spatial resolution beyond
   the typical 240×180 to 1280×720 range studied in current
   literature?
3. To what extent do the efficiency advantages observed in
   controlled experiments persist in deployed embedded systems
   under realistic ambient conditions (variable lighting, vibration,
   thermal cycling)?
4. How does training-time energy (where applicable) compare
   between event-driven networks and conventional CNN equivalents?

---

## Unresolved Issues

- Three identified sources were paywalled and could not be
  obtained within the time available; their abstracts were used
  but the body content was not verified.
- The search did not cover non-English literature; relevant work
  may exist in Japanese, Chinese, and German publications.
- Conference workshop papers were excluded except where they had
  been substantially cited in subsequent journal work.
- Industry white papers were not included; some sensor
  manufacturers publish energy figures that would be relevant but
  were considered out of scope per the source-quality rubric.

---

## References

- Brandli, C., Berner, R., & Liu, S.-C. (2017). A 240×180 130 dB
  3 µs latency global shutter spatiotemporal vision sensor.
  *IEEE Journal of Solid-State Circuits*, 49(10), 2185–2197.
  https://doi.org/example.brandli.2017

- Chen, X., & Park, J. (2023). System-level energy comparison of
  event-driven and frame-based pipelines for embedded object
  tracking. *ACM Transactions on Embedded Computing Systems*,
  22(4), 445–470. https://doi.org/example.chen.park.2023

- Lin, H., Romero, F., & Patel, K. (2024). Sub-10-millisecond
  gesture recognition with event cameras and neuromorphic
  inference. *IEEE Transactions on Circuits and Systems for
  Video Technology*, 34(3), 1098–1112.
  https://doi.org/example.lin.2024

- Mensah, A., & Ali, R. (2025). When does event-based sensing
  actually save energy? A scoping review of application contexts.
  *Frontiers in Neuromorphic Engineering*, 7, Article 12.
  https://doi.org/example.mensah.ali.2025

- Okafor, U., Devereaux, M., & Singh, P. (2024). Standardising
  energy benchmarks for event-based vision: a call for community
  guidelines. *Sensors*, 24(7), 2110–2125.
  https://doi.org/example.okafor.2024

- Tanaka, Y., & Murakami, S. (2021). A decade of dynamic vision
  sensor evolution: power, resolution, and dynamic range trends.
  *IEEE Sensors Journal*, 21(2), 9–22.
  https://doi.org/example.tanaka.murakami.2021

- Vasiljević, M., Heinrich, T., & Bauer, L. (2022). Why
  event-camera energy numbers do not match: a methodological
  audit of recent benchmarks. *Neuromorphic Computing and
  Engineering*, 2(3), 75–89.
  https://doi.org/example.vasiljevic.2022
