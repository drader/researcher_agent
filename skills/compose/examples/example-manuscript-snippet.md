# Example IMRaD manuscript snippet

> **Notice.** Example output for demonstration only. The text below is
> a synthetic illustration produced for the `compose` skill's example
> set. Citations are illustrative and may not correspond to real
> publications. Do not cite this document as a source of empirical
> claims.

---

## Title

A microcontroller-based gesture recognition pipeline using
event-based vision

---

## Abstract (structured, ~200 words)

**Background.** Gesture recognition on resource-constrained
microcontrollers is limited by frame-camera bandwidth and the
energy cost of per-frame inference. Event cameras emit sparse,
asynchronous brightness-change events, offering an alternative
data stream that may match low-power inference budgets.

**Methods.** We built a pipeline pairing a 240x180 event sensor
with an ARM Cortex-M7 microcontroller (216 MHz, 320 KB RAM). The
device accumulated events into 10 ms time-surfaces, classified
each surface with a 12 KB quantized convolutional model, and
applied majority-voting smoothing across five surfaces. We
recorded 14 participants performing eight hand gestures in three
lighting conditions, splitting the data by participant for
training, validation, and test.

**Results.** Per-frame test accuracy was 91.2% (95% CI:
89.4–92.7%), with 95.6% accuracy after voting smoothing.
Inference latency was 6.8 ms per surface, and median energy per
inference was 4.1 mJ. Performance degraded by 4.3 percentage
points under low-light conditions (50 lux).

**Conclusion.** Event-driven gesture recognition is feasible on
mid-range microcontrollers at low energy cost, with accuracy
competitive against frame-based baselines reported in prior work.
The pipeline is suitable for always-on wearable and ambient
sensing applications where energy is the binding constraint.

---

## Introduction

Gesture recognition is a well-established interface modality for
wearable devices, ambient sensing, and human-robot interaction.
The dominant technical approach uses RGB or infrared cameras
sampled at fixed frame rates, with per-frame inference on a
classifier. This approach faces two recurring limits on
battery-powered devices: the bandwidth cost of streaming frame
data to memory, and the energy cost of running the classifier on
every frame whether or not movement is present (Park & Lee, 2019).
Recent work has explored several remedies — temporal subsampling,
motion-triggered wake-up, and offload to a co-processor — each
with its own trade-offs in latency and accuracy.

Event-based vision sensors offer a structurally different option.
Rather than producing frames at fixed intervals, each pixel
asynchronously emits an "event" when its log-intensity crosses a
threshold (Gallego et al., 2020). The resulting data stream is
sparse: a static scene produces no events, while moving scenes
produce events proportional to the moving content. For gesture
recognition, where the relevant signal is hand motion against a
relatively static background, event streams concentrate
information where it matters and discard it where it does not. A
growing body of work has demonstrated event-based gesture
recognition on workstation-class hardware (Amir et al., 2017; Liu
& Delbruck, 2020), but few studies have evaluated the pipeline on
microcontroller-class targets, where memory and compute budgets
are an order of magnitude tighter than on the embedded GPUs used
in prior work.

The present study evaluates whether event-based gesture
recognition can run end-to-end on a mid-range ARM Cortex-M7
microcontroller, at accuracy and energy levels suitable for
always-on operation. We built a complete pipeline — sensor,
event accumulation, quantized classifier, and decision smoothing
— and characterized its accuracy, latency, and energy on a
held-out test set covering eight gestures, fourteen participants,
and three lighting conditions. We make three contributions: (1) a
pipeline design optimized for the microcontroller memory budget;
(2) an empirical evaluation across participants and lighting; and
(3) an open release of the time-surface accumulator and quantized
model as supplementary material.

---

## Methods

The hardware comprised a 240x180 event sensor (Inivation DVXplorer
Lite) interfaced over SPI to an STM32H743 microcontroller
operating at 216 MHz with 320 KB of RAM and 2 MB of flash. Events
were accumulated into a per-pixel exponential time-surface with a
10 ms decay constant, refreshed every 10 ms. Each surface was
classified by a quantized convolutional neural network (8-bit
weights, 32-bit activations), occupying 12 KB of flash and
producing eight class scores. A trailing-window majority vote
across the last five surface classifications produced the emitted
gesture label. We trained the classifier offline on an Nvidia RTX
3060 workstation using PyTorch, then post-training quantized to
the on-device format using the TFLite Micro converter.

We collected data from 14 participants (ages 19–53, mixed
handedness) in a single room across three lighting conditions:
office (450 lux), low-light (50 lux), and bright-window (1100
lux). Each participant performed eight gestures (left swipe,
right swipe, up swipe, down swipe, fist, open palm, thumbs up,
thumbs down) ten times per lighting condition, yielding 3360
trials. We split the trials by participant: nine participants for
training, two for validation, three held out for test. Inference
latency was measured by toggling a GPIO pin around the classifier
call and capturing with a logic analyzer. Energy was measured
with a Power Profiler Kit II in series with the microcontroller
supply rail, integrated over 1000 inferences per condition. All
analyses were pre-specified before the test split was unsealed.

---

## Results

Classification accuracy on the held-out test participants reached
91.2% per surface (95% CI: 89.4–92.7%) and 95.6% after
majority-voting smoothing. Confusion was concentrated between the
two pairs of structurally similar gestures: thumbs up vs. fist
(8.1% confusion) and open palm vs. up swipe at the moment of
hand-raise (5.4% confusion). Down swipe was the most accurately
classified (98.7%) and thumbs down the least (87.2%). The
lighting-condition breakdown showed accuracy of 92.4% in office
light, 96.1% in bright-window light, and 88.1% in low light, a
4.3-point degradation against the office-light baseline. The
participant-held-out split was a stringent generalization test;
within-participant evaluation on the training participants
reached 97.3%, indicating that participant identity accounts for
a substantial fraction of remaining error.

Inference latency was 6.8 ms per surface (sd 0.4 ms), well within
the 10 ms surface refresh budget. Median energy per inference was
4.1 mJ (interquartile range 3.8–4.5 mJ); end-to-end energy per
classified gesture (including event accumulation and voting) was
22.4 mJ. At a 100 Hz inference rate, average power was 410 mW
including the sensor; gating inference on event-rate exceeding a
quiescent-scene threshold reduced average power to 87 mW. No
hardware failures occurred during the 168 hours of cumulative
test recording.

A small ablation isolated the contribution of voting smoothing.
Without smoothing, per-emit accuracy fell to the 91.2% per-surface
level; with three-surface voting, accuracy rose to 94.0%; with
five-surface voting (the default), to 95.6%; with seven-surface
voting, to 95.9% (a 0.3-point gain not significant at the trial
count tested). We adopted five-surface voting as the operating
point.

---

## Discussion

The principal finding is that event-based gesture recognition is
practical on a mid-range microcontroller, with accuracy
competitive against the frame-camera baselines reported by Park
and Lee (2019) at substantially lower average power. The
4.3-point degradation under low light reflects the event sensor's
sensitivity floor rather than a classifier deficit, consistent
with the device characterization in Gallego et al. (2020); the
quiescent-scene gating approach reduced average power by an
order of magnitude without measurable accuracy cost, suggesting
that always-on operation on a coin-cell battery is within reach
for application domains tolerant of the present accuracy.

The per-participant generalization gap (97.3% on training
participants vs. 91.2% on held-out test) is consistent with prior
work in event-based gesture recognition (Amir et al., 2017) and
suggests that small-scale on-device adaptation, such as the
prototype-update approach proposed by Liu and Delbruck (2020),
would be a productive direction for follow-up work. The pipeline
does not currently include user-specific adaptation; doing so
without violating the memory budget would require either a sparse
update mechanism or a separate adaptation pass on a host device.

---

## Limitations

The study covered fourteen participants in a single room, eight
gestures, and three lighting conditions. Generalization to
out-of-distribution participants, unseen environments, and
gesture sets with finer discrimination requirements is not
established. The energy measurements are device-specific; other
microcontroller targets will produce different results. The
classifier was trained and evaluated on data collected in the
same session as the test split, leaving day-to-day variability
unmeasured.

---

## References

Amir, A., Taba, B., Berg, D., Melano, T., McKinstry, J., Di Nolfo,
C., Nayak, T., Andreopoulos, A., Garreau, G., Mendoza, M., Kusnitz,
J., Debole, M., Esser, S., Delbruck, T., Flickner, M., & Modha, D.
(2017). A low power, fully event-based gesture recognition system.
In *Proceedings of the IEEE Conference on Computer Vision and
Pattern Recognition* (pp. 7243–7252).
https://doi.org/10.1109/CVPR.2017.781

Gallego, G., Delbrück, T., Orchard, G., Bartolozzi, C., Taba, B.,
Censi, A., Leutenegger, S., Davison, A. J., Conradt, J., Daniilidis,
K., & Scaramuzza, D. (2020). Event-based vision: A survey. *IEEE
Transactions on Pattern Analysis and Machine Intelligence*, 44(1),
154–180. https://doi.org/10.1109/TPAMI.2020.3008413

Liu, S.-C., & Delbruck, T. (2020). On-device adaptation for
event-based gesture recognition. *Frontiers in Neuroscience*,
14, 567890. https://doi.org/10.3389/fnins.2020.567890

Park, M., & Lee, H. (2019). Energy-efficient gesture recognition
on wearable devices: A comparative review. *IEEE Sensors Journal*,
19(14), 5512–5524. https://doi.org/10.1109/JSEN.2019.2904567

Sironi, A., Brambilla, M., Bourdis, N., Lagorce, X., & Benosman, R.
(2018). HATS: Histograms of averaged time surfaces for robust
event-based object classification. In *Proceedings of the IEEE
Conference on Computer Vision and Pattern Recognition* (pp.
1731–1740). https://doi.org/10.1109/CVPR.2018.00186

Tan, M., & Le, Q. (2019). EfficientNet: Rethinking model scaling
for convolutional neural networks. In *Proceedings of the 36th
International Conference on Machine Learning* (pp. 6105–6114).

Warden, P., & Situnayake, D. (2019). *TinyML: Machine learning
with TensorFlow Lite on Arduino and ultra-low-power
microcontrollers*. O'Reilly Media.

Zhou, Y., Shen, K., & Wu, X. (2022). Quantized convolutional
networks for embedded gesture recognition. *ACM Transactions on
Embedded Computing Systems*, 21(5), 1–24.
https://doi.org/10.1145/3500001
