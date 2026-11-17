---
Title: Emacs basics and learning resources
Topic: tools
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [tech_notes/281_emacs_NOTES.qmd](../../tech_notes/281_emacs_NOTES.qmd)
---

# Emacs basics and learning resources

Working notes on GNU emacs (the DOOM heading in the source is empty — all content is GNU-side — and its frontmatter title is a stray copy of "260_typst_cheat.qmd "). This article covers help bindings, shells, rendering, and the curated learning list; the ESS/R, i3+daemon, and org-mode material of the same source is deferred to a later pass.

## Help and discovery

- `M-x apropos-documenation` (spelled as in the source), `M-x describe-bindings`, `M-x describe-mode`.
- Help keystrokes from the notes: `^h v` → `display-line-number` (variable); `^h a` → eval; `^h f current-buffer` (comment cell empty). The `^h k` row is garbled in the source (`^h a F10`) — treat with caution.

## Frames and windows

> In emacs, open "frame" then 1 or more "windows" inside the frame

## Shells and logs

- `^x p e` for eShell.
- `^h i m Elisp RET` (read manual) is flagged "not working" in the notes.
- Watch every command: `M-x global-command-log-mode`, then `M-x clm/open-command-log-buffer`.

## Rendering from emacs

- Typst (note dated 3-24-2026): "To render:" `typst watch <file.typ>` — "PROBLEMS" "with tree-sitter, LSP, mist," — "Just wait".
- Quarto: `C-c C-c m` re-render (an `M-x quarto-prese...` command name is truncated in the source).

## Elisp

- Reading TODOs: the Prot book and the Chicago book, both marked `:read:`; the Prot text repo via `M-x Dired` | `M-x dired-do-info` (over file: elispelem.info).
- REPL: "open" `~/code/elisp_project/010_basic_elisp.el`.

## Learning resources

Curated list, annotations as written in the source:

- [Beginner-Protes basic emacs config](https://protesilaos.com/codelog/2024-11-28-basic-emacs-configuration/) — Beginner.
- [Xahlee - how to read](http://xahlee.info/emacs/how_to_read.html)
- [emacswiki](https://www.emacswiki.org/) — "look for newbie | self-doc".
- [UChicago emacs tutorial](https://www2.lib.uchicago.edu/keith/tcl-course/emacs-tutorial.html) — "emacs, with explanatons!" (sic).
- [elisp-guide](https://github.com/chrisdone-archive/elisp-guide?tab=readme-ov-file#programming-in-emacs-lisp) — "short emacs guide (1st time: omit lisp)".
- [gigamonkeys](https://gigamonkeys.com/book/) — "practical: (REPL)".
- [evil-guide](https://github.com/noctuid/evil-guide) — "Evil, Read & re-read".
- [emacs-from-scratch](https://github.com/daviwil/emacs-from-scratch/tree/8c302a79bf5700f6ef0279a3daeeb4123ae8bd59) — daviwil: videos + config.
- [SICP full text](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-1.html)
- [GNU Emacs Lisp intro (eintr)](https://www.gnu.org/software/emacs/manual/html_node/eintr/index.html)
- [Toretzky, Gentle Common Lisp (LispBook)](http://www.cs.cmu.edu/~dst/LispBook/)
- [protesilaos.com](https://protesilaos.com/) and [codelog](https://protesilaos.com/codelog/)

Videos: daviwil "emacs from scratch" (videos + config), Protesillaos (see the HELP video), tdhock (12 videos + R).

## See Also

- [Simple CLI cheat sheet](simple-cli-cheatsheet.md) — Doom Emacs spelling (flyspell + aspell).
- [Typst basics](../typst/typst-basics.md)
- [Typst-Quarto workflow](../typst/typst-quarto-workflow.md)
