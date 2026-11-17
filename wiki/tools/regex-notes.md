---
Title: Regex notes (grep -P, R)
Topic: tools
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [tech_notes/300_tech_notes.qmd](../../tech_notes/300_tech_notes.qmd)
---

# Regex notes (grep -P, R)

Goal from the notes: stop relearning regex "every 6 months" — "use grep -P, regex to understand how REGEX works". Regex can find, validate, replace/insert, and split. The notes deliberately separate learning REGEX (grep -P) from using REGEX in R, which they find "a tad easier".

## Definitions

- "regex is a string; do not forget this."
- META CHARACTERS — characters which by default have non-literal meaning to the engine that digests them; **engine specific**. Must ESCAPE them to use as literals. Other contexts have the same idea: in the unix shell `<`, `>` mean redirect; in C's sprintf, `%` means formatting.
- To escape = indicate to the underlying engine that a meta character should be handled as though literal.
- Character class — "Things like [0-9]." "Rmk: [0-9]+ means repeat one or more of the prior **Character class**" — "So both 321 and 333 match this regex."

## R specifics

Before the regex library (engine) sees the code, the compiler (byte code?) gets it first: use a double backslash for the regex engine to see one backslash. Shell interpreters have no such compiler, so a single backslash suffices.

## Grouping: capture vs non-capture

Perl PCRE for lookaheads and capture (in R, `perl=T`). Capturing groups can be reused later in the regex match or in the replacement part; making a group non-capturing simply exempts it from both uses — useful when capturing many things and only some groups matter.

## Files in the notes

`~/code/docs/tech_notes/REGEX.md`; `001_grep_regex_P_examples.qmd`; `002_grep_examples.md`; some regex in `~/code/zsh_project/ZSH_SH_FILES/`.

## See Also

- [Zsh configuration notes](zsh-notes.md) — zsh glob patterns vs grep
- [Simple CLI cheat sheet](simple-cli-cheatsheet.md)
