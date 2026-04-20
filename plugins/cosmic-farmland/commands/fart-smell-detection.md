---
description: "[DEPRECATED] Renamed to /fart-sniffing-detection in 1.0.0. Shim kept for transition; remove in 2.0.0."
argument-hint: "[whiff|sniff|huff|dutch-oven-yourselff] [PR #N | git-range | --staged]"
---

**Deprecated:** `/fart-smell-detection` renamed to `/fart-sniffing-detection` in v1.0.0. Update your muscle memory. This shim will be removed in v2.0.0.

Invoke the `fart-sniffing-detection` skill.

Args: `$ARGUMENTS`

Parse args:
- First token matching `whiff|sniff|huff|dutch-oven-yourselff` → level. Default `sniff`.
- Remaining tokens → target (PR number, git range, or `--staged`). If absent, skill resolves per its input rules.

Follow the skill's audit process and output format exactly. Do not soften verdicts.
