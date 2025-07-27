# 280_emacs_notes.qmd
jim
2025-07-27

To render to PDF (via quarto’s typst cli) quarto render \<file.qmd\>

> [!NOTE]
>
> quarto render 280_emacs_notes.qmd –to gfm –output 280_emacs_notes.md

<div class="regular_text">

[280_emacs_notes.qmd](280_emacs_notes.qmd) 300_tech_notes.qmd
810_pharmaverse_notes.qmd

#### TODO

- i3 and emacs can conflict. SEE:
  https://sqrtminusone.xyz/posts/2021-10-04-emacs-i3/

#### HELP

^h v display-line-number (help for variable)  
^h a eval \# any emacs/gnu topic?  
^h k F10 \# enter keystroke to see binding  
^h f current-buffer \| ^h f ess-eval-region (help for emacs/ESS
function)

M-x apropos-documenation eval M-x describe-bindings M-x describe-mode

#### LEARNING

- [Beginner-protesilaos](https://protesilaos.com/codelog/2024-11-28-basic-emacs-configuration/)
- [Xahlee](http://xahlee.info/emacs/how_to_read.html)
- [ESS Manual](ess.r-project.org/manual)
- \[Emacs Manual\]
- [emacswiki: (look for newbie \| self-doc)](https://www.emacswiki.org/)
- [emacs, with
  explanatons!](https://www2.lib.uchicago.edu/keith/tcl-course/emacs-tutorial.html)
- [short emacs guide (1st time: omit
  lisp):](https://github.com/chrisdone-archive/elisp-guide?tab=readme-ov-file#programming-in-emacs-lisp)
- [practical: (REPL)- gigamonkeys](https://gigamonkeys.com/book/)
- [Evil, Read & re-read:](https://github.com/noctuid/evil-guide)
- \[SFU\] videos + web

**Videos** - daviwil: emacs from scratch: videos + config
<https://github.com/daviwil/emacs-from-scratch/tree/8c302a79bf5700f6ef0279a3daeeb4123ae8bd59> -
Tsoding - Protesillaos - Goparism - tdhock (12 videos + R) - hacking
vanilla

**Blog** - [protesilaos](https://protesilaos.com/)  
- <https://protesilaos.com/codelog/>

**Shell** ^x p e for eShell  
^h i m Elisp RET (read manual) not working  

**Watch Every Command ! ** M-x global-command-log-mode  
M-x clm/open-command-log-buffer  

Create a footnote: [^1]

#### ESS / R

tips:
<https://stackoverflow.com/questions/2901198/useful-keyboard-shortcuts-and-tips-for-ess-r>
collection of ESS config/intros:
<https://github.com/ess-intro/ess-intro>  
- got flycheck, usethis::use-tidy_style working; lintr now auto works.

#### Quarto

M-x quarto-prese… C-c C-c m re-render

#### LISP

Run lisp ? or REPL: open ~/code/elisp_project/010_basic_elisp.el
[SICPv2](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-1.html) -
gnu elisp
https://www.gnu.org/software/emacs/manual/html_node/eintr/index.html -
Toretzky Gentle Common Lisp http://www.cs.cmu.edu/~dst/LispBook/

</div>

[^1]: This is footnote one.
