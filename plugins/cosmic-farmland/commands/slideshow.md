---
description: Build an on-brand LinkedIn/Instagram carousel from a topic or outline. Produces HTML slides, PNGs, a combined PDF, and a draft caption.
argument-hint: "[topic or outline]"
---

Invoke the `slideshow` skill.

If the user passed arguments, treat them as the topic or outline. Otherwise ask for topic, audience, source material, and CTA before building.

Follow the skill's slide-structure + template catalog exactly. Always run `build.sh` at the end -- the PDF is the deliverable, not the HTML.
