---
description: PTV an idea/proposal BEFORE code. Same PTVM rubric as /ptv, input is a written idea. Levels whiff|sniff|huff|dutch-oven-yourselff.
argument-hint: "[whiff|sniff|huff|dutch-oven-yourselff] <idea text | path/to/spec.md | 'last turn'>"
---

Invoke the `ptv-idea` skill.

Args: `$ARGUMENTS`

Parse args:
- First token matching `whiff|sniff|huff|dutch-oven-yourselff` → level. Default `sniff`.
- Remaining tokens → the idea to audit: inline text, a path to a spec/plan doc, or `last turn` / `this proposal` / `what I just said`.
- If no target is given, scan recent conversation for the most recent proposal-shaped content per the skill's input-resolution rules. Ask one question only if genuinely ambiguous.

Follow the skill's audit dimensions and output format exactly. Do not soften verdicts. Do not write the code.
