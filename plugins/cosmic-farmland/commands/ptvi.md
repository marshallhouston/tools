---
description: PTV an idea. Short alias for /ptv-idea. Levels whiff|sniff|huff|dutch-oven-yourselff.
argument-hint: "[whiff|sniff|huff|dutch-oven-yourselff] <idea text | path/to/spec.md | 'last turn'>"
---

Invoke the `ptv-idea` skill.

Args: `$ARGUMENTS`

Parse args:
- First token matching `whiff|sniff|huff|dutch-oven-yourselff` → level. Default `sniff`.
- Remaining tokens → the idea to audit (inline text, file path, or `last turn`).

Follow the skill's audit dimensions and output format exactly. Do not soften verdicts.
