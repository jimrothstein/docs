// Some definitions presupposed by pandoc's typst output.
#let blockquote(body) = [
  #set text( size: 0.92em )
  #block(inset: (left: 1.5em, top: 0.2em, bottom: 0.2em))[#body]
]

#let horizontalrule = [
  #line(start: (25%,0%), end: (75%,0%))
]

#let endnote(num, contents) = [
  #stack(dir: ltr, spacing: 3pt, super[#num], contents)
]

#show terms: it => {
  it.children
    .map(child => [
      #strong[#child.term]
      #block(inset: (left: 1.5em, top: -0.4em))[#child.description]
      ])
    .join()
}

// Some quarto-specific definitions.

#show raw.where(block: true): set block(
    fill: luma(230),
    width: 100%,
    inset: 8pt,
    radius: 2pt
  )

#let block_with_new_content(old_block, new_content) = {
  let d = (:)
  let fields = old_block.fields()
  fields.remove("body")
  if fields.at("below", default: none) != none {
    // TODO: this is a hack because below is a "synthesized element"
    // according to the experts in the typst discord...
    fields.below = fields.below.amount
  }
  return block.with(..fields)(new_content)
}

#let empty(v) = {
  if type(v) == "string" {
    // two dollar signs here because we're technically inside
    // a Pandoc template :grimace:
    v.matches(regex("^\\s*$")).at(0, default: none) != none
  } else if type(v) == "content" {
    if v.at("text", default: none) != none {
      return empty(v.text)
    }
    for child in v.at("children", default: ()) {
      if not empty(child) {
        return false
      }
    }
    return true
  }

}

// Subfloats
// This is a technique that we adapted from https://github.com/tingerrr/subpar/
#let quartosubfloatcounter = counter("quartosubfloatcounter")

#let quarto_super(
  kind: str,
  caption: none,
  label: none,
  supplement: str,
  position: none,
  subrefnumbering: "1a",
  subcapnumbering: "(a)",
  body,
) = {
  context {
    let figcounter = counter(figure.where(kind: kind))
    let n-super = figcounter.get().first() + 1
    set figure.caption(position: position)
    [#figure(
      kind: kind,
      supplement: supplement,
      caption: caption,
      {
        show figure.where(kind: kind): set figure(numbering: _ => numbering(subrefnumbering, n-super, quartosubfloatcounter.get().first() + 1))
        show figure.where(kind: kind): set figure.caption(position: position)

        show figure: it => {
          let num = numbering(subcapnumbering, n-super, quartosubfloatcounter.get().first() + 1)
          show figure.caption: it => {
            num.slice(2) // I don't understand why the numbering contains output that it really shouldn't, but this fixes it shrug?
            [ ]
            it.body
          }

          quartosubfloatcounter.step()
          it
          counter(figure.where(kind: it.kind)).update(n => n - 1)
        }

        quartosubfloatcounter.update(0)
        body
      }
    )#label]
  }
}

// callout rendering
// this is a figure show rule because callouts are crossreferenceable
#show figure: it => {
  if type(it.kind) != "string" {
    return it
  }
  let kind_match = it.kind.matches(regex("^quarto-callout-(.*)")).at(0, default: none)
  if kind_match == none {
    return it
  }
  let kind = kind_match.captures.at(0, default: "other")
  kind = upper(kind.first()) + kind.slice(1)
  // now we pull apart the callout and reassemble it with the crossref name and counter

  // when we cleanup pandoc's emitted code to avoid spaces this will have to change
  let old_callout = it.body.children.at(1).body.children.at(1)
  let old_title_block = old_callout.body.children.at(0)
  let old_title = old_title_block.body.body.children.at(2)

  // TODO use custom separator if available
  let new_title = if empty(old_title) {
    [#kind #it.counter.display()]
  } else {
    [#kind #it.counter.display(): #old_title]
  }

  let new_title_block = block_with_new_content(
    old_title_block, 
    block_with_new_content(
      old_title_block.body, 
      old_title_block.body.body.children.at(0) +
      old_title_block.body.body.children.at(1) +
      new_title))

  block_with_new_content(old_callout,
    block(below: 0pt, new_title_block) +
    old_callout.body.children.at(1))
}

// 2023-10-09: #fa-icon("fa-info") is not working, so we'll eval "#fa-info()" instead
#let callout(body: [], title: "Callout", background_color: rgb("#dddddd"), icon: none, icon_color: black) = {
  block(
    breakable: false, 
    fill: background_color, 
    stroke: (paint: icon_color, thickness: 0.5pt, cap: "round"), 
    width: 100%, 
    radius: 2pt,
    block(
      inset: 1pt,
      width: 100%, 
      below: 0pt, 
      block(
        fill: background_color, 
        width: 100%, 
        inset: 8pt)[#text(icon_color, weight: 900)[#icon] #title]) +
      if(body != []){
        block(
          inset: 1pt, 
          width: 100%, 
          block(fill: white, width: 100%, inset: 8pt, body))
      }
    )
}



#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: "linux libertine",
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: "linux libertine",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  doc,
) = {
  set page(
    paper: paper,
    margin: margin,
    numbering: "1",
  )
  set par(justify: true)
  set text(lang: lang,
           region: region,
           font: font,
           size: fontsize)
  set heading(numbering: sectionnumbering)
  if title != none {
    align(center)[#block(inset: 2em)[
      #set par(leading: heading-line-height)
      #if (heading-family != none or heading-weight != "bold" or heading-style != "normal"
           or heading-color != black or heading-decoration == "underline"
           or heading-background-color != none) {
        set text(font: heading-family, weight: heading-weight, style: heading-style, fill: heading-color)
        text(size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(size: subtitle-size)[#subtitle]
        }
      } else {
        text(weight: "bold", size: title-size)[#title]
        if subtitle != none {
          parbreak()
          text(weight: "bold", size: subtitle-size)[#subtitle]
        }
      }
    ]]
  }

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  if date != none {
    align(center)[#block(inset: 1em)[
      #date
    ]]
  }

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
    ]
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}

#set table(
  inset: 6pt,
  stroke: none
)

#show: doc => article(
  title: [300\_tech\_notes.md],
  authors: (
    ( name: [jim],
      affiliation: [],
      email: [] ),
    ),
  date: [2026-07-28],
  font: ("Liberation Serif",),
  toc_title: [Table of contents],
  toc_depth: 3,
  cols: 1,
  doc,
)

= TOP
<top>
LLM NOTES? go here: 320\_LLM\_agents\_NOTES.md

== Jul 2026
<jul-2026>
- Change from #emph[.typ file to ];.md; why? it simple text and md easier

=== sudo apt
<sudo-apt>
sudo apt autoremove \# a dependency no longer needed sudo apt-mark \# pkgs settings, such as being held sudo apt install –fix-broken sudo apt install –fix-missing

== linux cli
<linux-cli>
df -h \# free space on system

journalctl -b -1 \# show system messages from prior boot

=== Audio
<audio>
WirePlumber PipeWire ALSA (bottom)

- Audio: low-level Pipewire, replaces pulseaudio (https:\/\/wiki.archlinux.org/title/PipeWire) (ALSA remains the lowest level library)
- Audio: #emph[WirePlumper] (wpctl) is used to manage this library
- Audio: May see references to older PulseAudio, but this probably PipeWire emulating the older package. PulseAudo package is no longer on machine.
- #emph[wpctl] is CLI

#strong[Mar 2026]

=== Use Calibre for all files - one central place - including those currently on iPad.
<use-calibre-for-all-files---one-central-place---including-those-currently-on-ipad.>
From iPad: can upload to Drive! To iPad: from Drive to iPad? - from Linux? iPad runs "Calibre Companion" to retrieve from linux - NOT the reverse - From iCloud to linux? - sftp between linux & ipad? (linux: sudo systemctl start ssh; then ftp localhost)

#strong[Feb 2026] Haskell working hard on data science; tutorials… cloud based GUI

#strong[Dec 2025] - HP boot reports amdgpu psp gfx failed, but continues - Status: unresolved - HP 845 G8, laptop; otherwise runs fine. - sudo dmesg - sudo journalctr -b - secureddisplay? LOAD\_TA(0x1)

=== Hardware
<hardware>
23 DEC 2024 - wireless mouse, \$10, bestbuy, M220 logitech, 18 month batter life, plain vanilla is just fine.

=== folds
<folds>
folds: use za or (define-key evil-normal-state-map (kbd "") ’evil-toggle-fold) need package for evil/folds - za open fold - zc close fold - zr open all folds - zm close all folds - C-3 S-TAB (show outline upto level 3 - WORKS!)

=== url links
<url-links>
nytimes.com \@ nytimes \
file:280\_emacs\_notes.qmd \@ emacs notes \
https:\/\/www.nytimes.com \@ nytimes.com \

#strong[TODO]

- use folds, to simplify navigating this document

- no R here, no Stats

- includes #emph[i3];, #emph[emacs];, #emph[Debian]

- HTTR2 notes = mess

- Break this document into separate files, merge into one big one?

- \<2024-10-10 Thu\> now Debian 12 (Cinnamon or i3); no more linux mint; LMDE … \<2024-08-26 Mon\>

- do not use emacs as "DESKTOP" - everything, windows on the screen at once.

- humans can not multitask; keep window only used for current work.

- computers great for keeping lists of buffers, search when you move to next task.

- tools like ivy can recall things like split window, code 1 side; dir on other

- exist tools to maintain buffers in 'projects'

- EXWM still not sure.

\<2024-07-01 Mon\> - ex looks very useful! - SO(3) - not sure what I am asking; normal subgroups, symmetries?

\*\* Github actions - do not guess, do not play: READ DOCS - render quarto (in gfm, github format, SEE #emph[gh\_actions\_project/quarto, SEE main.yaml] - will render qmd to md file (github format) - do not soft link qmd files, actual file or copy must in project - of course, can render to md locally and merely push to github; - do not know branch and yaml the same (ie not both main…)

- (Github actions) Reading
  - Book #link("https://orchid00.github.io/actions_sandbox/")
  - #link("https://www.r-bloggers.com/2021/01/automatic-rendering-of-a-plot-with-github-actions-3/")
  - #link("https://www.simonpcouch.com/blog/2020-12-27-r-github-actions-commit/index.html")
  - #link("https://fromthebottomoftheheap.net/2020/04/30/rendering-your-readme-with-github-actions/")

\*\* Posit Connect Cloud (new) - works with Shiny; gets code and manifest (json, with all R dependencies) from github (works)

\*\* 29-May-2024: Upgrade to R 4.4, Linux Mint 21.3 (Virginia)

\<2024-09-25 Wed\>

#strong["ex" editor]

- simple, vi-like editor (see https:\/\/www.geeksforgeeks.org/ex-command-in-linux-with-examples/)
- :a (to add text)
- :w , :wq
- print : 1,3 or :1,3p :4 (print line 4)
- delete : 1,2d

prior to 'ex', was 'ed'

\*\* PGP - install public key: #emph[gpg –recv-keys XXX];, where XXX= 16 alphanumber - KEY SIGNING: (summary) I can create public-private keypair. If I 'sign' doc with private key, then anyone with my public key can READ and will know ONLY I could have encryted the file. - Encrypt with my PUBLIC KEY, then only someone with my PRIVATE KEY can read it. - ALL keys belong on Debian key ring. \*\*\* R - This is a nightmare. There are several discrete steps; Do one at time! - sketch: get public key; import; convert .asc to .gpg (if needed); cp .gpg to Debian’s ring - USE gpg; DO NOT USE apt-key - apt-secure - ONLY 2 line to run. Just do what Cran R says to do for Debian, key-ring: https:\/\/ftp.osuosl.org/pub/cran/. Then reboot, update apt. - gpg keys; Debian: see apt-secure, READ carefully, but it doeswork. - gpg –list-keys

\*\* i3, i3wm Videos: basic config: https:\/\/www.youtube.com/watch?v=88o2XuH3E08&list=PLbcglKxZP5PMTWVe1KhZX3Jvo0xqk8h5I&index=1 - man i3 has good help, but quick becomes #emph[x11] - review man i3-dmenu-desktop

\*\* PURPOSE: Misc Tech Notes; details, notes can be here (but COMMANDS put on INDEX C). Math, R, probability and stats notes #strong[do NOT go here]

\*\* emacs/org mode/eLisp

CAUTION: org mode is structured outline; markdown, typst are for document formatting. TODO: Which to use?

SEE: Separate emacs/org documentation \
281\_emacs\_notes.typ

SEE: 000\_PROJECTS.org

\*\* functional programming (julia, rust, lisp) - Julia easier? - RUST learning curve, but high performance - Both have functional?, but seems to learn functional stay with lisp, racket, haskell or any similar

#strong[IMPERATIVE v DECLARATIVE] - math notation is DECLARATIVE; indicates meaning, not exact details (example1: summation sign). Tell computer what you WANT, leave details to compiler or program. - IMPERATIVE (older, obsolete?) every detail, machine language?

\*\* QUARTO: 2023-12-06 - Try couple of cv or resume templates and one quarto extension. Seemed to be more work than worth. Just use Rmarkdown to create resume. 2024-01-26 READ r4ds Ch 28-29 b/c Quarto and config knitr

To render a Quarto (\*.qmd) file with embeded typst. Use regular quarto render methods.

\*\* {X11, Wayland, video} #strong[Warning:] Stay with X11 (proven, well-supported, works)

Wayland is open source #emph[protocol] replacement for X windows, (widgets says get graphics from X or Wayland). WESTON is reference implementation.

Because Wayland accepts same toolkits (Qt, GTK) as X, the impact for developers and users should be minimal. Wayland shrinks X; much functional now in Linux kernel.

- Xserver: 'display' server, runs locally, makes display and keyboard available to apps (either local or network) \~/.xsession-errors - Unlike cli, GUIs have no console; errors err redirected to this file \~/.Xauthority - is random code to control which progams output to my X11 session

\*\* PDF, Pandoc, Latex

=== PDF Notes \[ignores html, css; also ignores YAML header (pandoc & ::render()\]
<pdf-notes-ignores-html-css-also-ignores-yaml-header-pandoc-render>
=== Print raw text (example, from github, raw)
<print-raw-text-example-from-github-raw>
#emph[Quarto] saveas qmd, add yaml header, enclose all text in \`\`\` (verbatim); render inside rstudio.

2023-12-30 - tlmgr controls much latex install: fonts, \*.sty, - for PDF: pdf2latex, pdflatex (pandoc will do it, but complain) - in R, tinytex::latexmk()

To create pdf, just about everything works: pandoc, markdown, latex, knitr.. Note: zathura uses library, open source `popler`.

NOTE: Missing latex .sty ? \
\- With .tex file, run (in R) tinytex:latemk(\*.tex) to install - OR, use tlmgr install font - fonts installed? fc-list : family - also luaotfload (loads fonts) - ENGINE=software (such as #strong[luatex];, tex, pdftex) - FORMAT=macros (such as #strong[lualatex];)

(Jan 2022) #strong[Missing font, package? TinyTex] \* update R \* keep\_tex: true (in YAML) \* at R console tinytex::lualatex("…. .tex"), or tinytex::latexmk(“#emph[.tex”) ] \~ some times works, sometimes not \~

Lua in #emph[.tex file ] see \~/code/publish\_project/TEX/

(pre-Quarto !) HTML \[to produce HTML with pandoc, all latex is IGNORED.\]

I do #strong[not] know how to create fancy HTML files from knitr, pandoc.

HTML is pain in ass and HUGE time waste. Pandoc can handle markdown and small amounts of latex (math) b/c ppl have added filters or other widgets to pandoc.

If using Latex, its packages, diagrams with Latex … must go with PDF.

\-H header \
\-V or –variable \
–pdf-engine=xelatex

- Try verbatum; process as a markdown. pandoc balks at processing straight text if it thinks it sees markdown. If lucky, !pandoc % -o file.pdf will work.

=== section{LATEX NOTES}
<sectionlatex-notes>
- Tikz seems to be most popular way to gaphics vs #strong[pstricks];.

  footnote:

  #strong[postscript] a more powerful programming language than tex; #strong[pstricks];, ghostscript; pdf (a subset of postscript) hails from this. However, using postscript with latex requires addins, such as ghostscript; drivers; … Avoid #strong[postscript] and packages pstricks, even if greater capability.

Original tex was 320 low-level cmds (aka primitives). Macros created from these. But actual engine (tex) hidden from user.

#strong[LuaTex] (engine) is re-write of core TEX engine (hard, written in C). \
Therefore, #strong[LuaTex] added primitives, more open (can use tex or lua)

#strong[LuaLatex] is macro package.

EXAMPLE: In .tex file, write lua: directlua is new primitive; lua api inside value for

\$\$\\pi = \\directlua{tex.sprint(math.pi)}\$\$

=== revealjs slides with Quarto
<revealjs-slides-with-quarto>
\*\* GIT commands

HEAD - normally points to branch (tip) but can point to commit (detached HEAD). #strong[Goes where you go, like a shadow.] Commits are immutable. HEADS can move around.

- git merge –no-ff –no-commit main (no fastforward, #emph[dry-run];)

- git restore –source master\~2 path/file (2 commits back, give path to file)

- git log MANY USEFUL! See Book 2.3 (https:\/\/git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History), Refernce (https:\/\/git-scm.com/docs/git-log)

- git diff HEAD\~ HEAD \#show change between prior and most recent commit (“https:\/\/git-scm.com/docs/git-diff\_) book: (https:\/\/git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository.html\#\_git\_diff\_staged)

- git diff HEAD – path/to/file.R \# this file only, show diff (Ex: git diff play dev \# merge back into dev, but 1st see changes)

- ☐ UNDO one or more commits (many ways) Detach head by git checkout , then build out new branch (git checkout -b new) git revert \# keeps history, undo one past commit git revert HEAD\~2..HEAD \# keep history, but undo last 2 commits

- git reflog \# how HEAD jumped around

- git checkout HEAD\@{n} \# move back to n \*\* Install R

  - on Ubuntu, or mint linux virgina, use jammy and follow https:\/\/cran.r-project.org/bin/linux/ubuntu/ (works) \
  - on Debian (such as LMDE) follow https:\/\/cran.r-project.org/bin/linux/debian/
    #block[
    #set enum(numbering: "(1)", start: 1)
    + Add: sudo vim.tiny /etc/apt/sources.list
    + insert: the deb XXX link
    + save, run as jim, sudo apt install r-base etc.
    ]

\*\* REGEX - TODO import (?) all REGEX/\* files to here

- for regex reading see 300\_tech\_reading.md

= ———————–
<section>
== DOCUMENT REGEX HERE
<document-regex-here>
== (text, no examples in this file)
<text-no-examples-in-this-file>
= ———————–
<section-1>
\/home/jim/code/docs/tech\_notes/REGEX.md

2024-04-30 - Use a cheat sheet - Reduce paper - Annotate (here, or in 2 files) ONLY when needs

== this file: \~/code/docs/tech\_notes/REGEX.md
<this-file-codedocstech_notesregex.md>
== \~/code/docs/tech\_notes/001\_grep\_regex\_P\_examples.qmd
<codedocstech_notes001_grep_regex_p_examples.qmd>
== \~/code/docs/tech\_notes/002\_grep\_examples.md
<codedocstech_notes002_grep_examples.md>
== SOME regex: in \~/code/zsh\_project/ZSH\_SH\_FILES/
<some-regex-in-codezsh_projectzsh_sh_files>
== REGEX
<regex>
TODO: - sed, when to use? - emphasize goal: use grep -P, regex to understand how REGEX works. Tired of every 6 months learning all over again. - greedy/not greedy and backtrack . Think like a regex engine! - How to aerate regex ! - regex can be used to: - find - validate - replace/insert - split - … - When whiz, can do summersaults with CLI, zsh tools (sed, grep , cut …) and regex. Not NOW.

- Separate learning REGEX (grep -P, regex) and using REGEX in R, which I think is a tad easier.

=== DEFINITIONS - as always, crucial
<definitions---as-always-crucial>
- regex is a string; do not forget this.

- META CHARACTERS - ascii (?) characters which by-default have non-literal meaning to engine that digests them. #strong[Engine] specific. Must ESCAPE these characters to use as literals. Other contexts, such as unix shell, have similar idea: `<`, `>' for example, refer to **redirect** . In C, sprintf,`%\` indicates formatting and literal use.

- #strong[To Escape] indicate to underlying engine that this meta character should be handled as though literal.

- POSIX:

- backslash \

- \[ \]

- { }

- ( )

- caret ^

- \$

- dot .

- pipe |

- ?

- asterisk \*

- `+ -`

- \`\`+ - ’’

- + - X

- \\begin{verbatim}

- - \\end{verbatim}

=== Render REGEX Verbatim - 4 ways (latex?)
<render-regex-verbatim---4-ways-latex>
`+ -`

\`\`+ - ’’

- #strong[Character Class] Things like \[0-9\]. \
  Rmk: \[0-9\]+ means repeat one or more of the prior #strong[Character class] So both 321 and 333 match this regex.

=== Specific to vim/neovim
<specific-to-vimneovim>
- magic = o need to escape (wait till know what doing first) - well, um.

- magic = `\v` no need to escape (wait till know what doing first)

=== Specific to R
<specific-to-r>
- Before regex library (engine) sees code, the #strong[compiler] (byte code?) gets it first. Must use double backslash for just one backslash to be seen by regex engine. Shell interpreters have no such compiler and single backslash suffices.

\#\#\#= Regex grouping: capture & non-capture

#strong[Perl] PCRE for lookaheads, capture (in R, perl=T) from !so

Groups that capture you can use later on in the regex to match OR you can use them in the replacement part of the regex. Making a non-capturing group simply exempts that group from being used for either of these reasons.

Non-capturing groups are great if you are trying to capture many different things and there are some groups you don’t want to capture.

=== LINUX / DEBIAN
<linux-debian>
==== lightdm/login
<lightdmlogin>
- #emph[gnome-control-center] is cli to manage linux, X11, ..(even with cinnamon/lightdm)

- xfce4-session-\* \# (may need to poke around)

- autologin, if using lightdm, as root edit /etc/lightdm/lightdm.confg

  - in \[seat:\*\], uncomment user and timeout line; set user to "jim" (no spaces around =)

- mount usb: sudo mount /dev/sdb /media/usb\_drive (RHS must EXIST)

- When logging, using a #emph[getty];, which looks (default)

- /etc/profile

- \~/.profile

==== Xsession
<xsession>
- look /etc/X11/Xsession and …/Xsession.d
- too much - don’t understand; confused

RESCUE MODE, How to get to cli prompt? - Use Debian installer, rescue mode - eventually will get prompt (a lot of screens to go through)

DEBIAN iso: should not need dd command; just cd to USB

- Debian: shutdown when sytem hangs? CTRL-ALT-DEL or ALT-printScreen

versions: - Debian stable - Debian testing/sid - next version

=== mount
<mount>
mount –bind mount | grep "/dev/" \# list devices /dev/\*

To temporarily load and run and sys: sudo chroot /mnt/X/ \# where /mnt/X must already exist

\#\#\#= plymouth (linux) Bundled in initial ramdisk, before any fs mounted. Provides a graphical boot?? splash screen check /var/log/boot.log

\<2024-10-04 Fri\> Cinnamon and i3 do not mix well (at this point) - Both are "desktop environment" (others: xfce4, gnome?) - When lightdm (login manager) runs, user can choose ’desktop envir” AND authenticates. - SEE for "rules" https:\/\/forums.linuxmint.com/viewtopic.php?p=2533879\#p2533879 - LMDE is meant to run Cinnamon (and not i3); I got i3 to run using testing Debian. But this breaks LMDE (Cinnamon).

21-July-2023: Rumors, Linux Mint (now based upon Ubuntu/Canonical ) may be moving to #strong[LMDE] (Linux Mint Debian Edition) - 2024 - tried Mint; I think had some issues with i3; tried Debian - 2025 - Debian 13

- Booting … firmware | bootloader (finds all kernels, os) | grub2 (user select) ; \

- READ \>info grub

- /kernel is MINIMUM to start; this is why drivers often need separate install, not in kernel.

- SWAP - latest Linuxmint built-in, no need

- LinuxMint - installer sets mountpoints

- PARTIONs - is separate; ~for all else (\~30-40GB enough)

- Boot drive - needs flag `boot` and `esp` (?)

\#\#\#= GRUB2 - 1st: do not panic - pre-linux boot - Usally all it wants is to know which partition is root - Read: any simple article on this. (ex: https:\/\/www.dedoimedo.com/computers/grub-2.html) - May see (hd0) or (hd0,gpt2), (hd0,gpt3) refer to hard drive and partition - In my case (hd0, 2), and command \~ set root=(hd0,gpt2) - May involve updates to /etc/default/grub (use their tool)

GRUB is bootloade, boots kernel into RAM (vmlinuz, .initrd.gz) MBR long gone, IGNORE (hd0,2) means drive hd0, partition 2

== CAPSLOCK
<capslock>
=== setxkbmap
<setxkbmap>
put in: - \~/.profile (for login) - \~/.xinitrc (2/26 - setxkbmap is here) - other locations, but get help

=== Xmodmap (older, easier ?)
<xmodmap-older-easier>
- SEE Xahlee.info/Xmodmap
- ALSO modmap -pke \# useful commands

=== SETUP/CONFIG new HP Elitebook machine
<setupconfig-new-hp-elitebook-machine>
\<2024-10-10 Thu\> HP Elitebook but with pure Debian/Cinnamon & i3

#emph[CAPSLOCK ESCAPE];; many easy ways =\> confusion! - Debian/Cinnamon & i3: #emph[setxkbmap -option "caps:escape" (immediate)] reboot? may need to source \~/.xinitrc - other methods, like /etc/default/keyboard do not seem to work

(did not work for non-Cinnamon)CAPS\_LOCK: Use Cinnamon, keyboard options GUI to set CAPS\_LOCK to ESC (easy) June 9, 2024 (Configure HP Elitebook, 845, G8 - 2nd HP laptop) - #emph[\~/dotfiles/create\_soft\_links.sh] VERY helpful - Emacs: must link emacs files in \~/dotfiles files in \~/emacs.d\* = - must re-install: wezterm (see webpage), i3, zsh, git, emacs, ZSH, gh - public keys .. read debian’s guide - zsh change shell: chsh -s \$(which zsh) jim - emacs: FIRST install/config #emph['use-package'] always a pane: - Cinnamen: hardward/keyboard/layout/options choice to set CAPSLOCK to ESC (works, but with i3 too?) - websites: Google 1st, then Firefox (rest should follow) - #emph[keep] sh files, links, config files up-to-date AND in dotfiles/backup!

=== Chromebox
<chromebox>
PURPOSE: #strong[maps ChromeBox "capslock" key to Escape.] - use \> xev to find that capslock is key 133. - xmodmap is older, but simpler to change key action to change key action. - newer is #strong[setxkbmap] but I find more effort to figure out simple things. - SEE tech\_notes - lots of ways to do this remap. This works, stay with it:

=== Lenovo
<lenovo>
xmodmap -e "keycode 133 = Escape" Lenovo: capslock keycode = 66, and escape is 9. However, capslock still insisting on going in caps lock (UPPER CASE) setkbmap seems to suggest using caps:swapescape and not caps:escape, but xmodmap won’t accept.

=== Partitions
<partitions>
Drive is NOT 512G NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS sda 8:0 0 238.5G 0 disk ├─sda1 8:1 0 512M 0 part /boot/efi ├─sda2 8:2 0 27.9G 0 part / ├─sda3 8:3 0 977M 0 part \[SWAP\] └─sda4 8:4 0 209.1G 0 part /home

#strong[du -f (run on 11NOV2024)] Filesystem Size Used Avail Use% Mounted on udev 7.5G 0 7.5G 0% /dev tmpfs 1.5G 1.7M 1.5G 1% /run /dev/sda2 28G 9.4G 17G 37% / tmpfs 7.5G 18M 7.5G 1% /dev/shm tmpfs 5.0M 12K 5.0M 1% /run/lock /dev/sda4 205G 3.9G 191G 2% /home /dev/sda1 511M 5.9M 506M 2% /boot/efi tmpfs 1.5G 52K 1.5G 1% /run/user/1000

\*\*\* format fat32, for copiers To make fat32 usb device.(for copier) 1) (optional; too slow) can put all zeros (optional, slow - \~ 5MB/s or 200 seconds for 1 GB on USB 2.0) 2) sudo parted /dev/sda mklabel msdos (makes empty partition table, of form MBR) 3) sudo parted /dev/sda mkpart primary fat32 0% 100% (makes partition) 4) sudo mkfs.fat -F32 /dev/sda (format this partiion, if says to use -I do so!) 5) sudo parted /dev/sdb print (confirms fat32)

To burn iso on usb (I never got gui’s to work) 1) sudo dd bs=4M if=/path/to/file.iso of=/dev/sda status=progress oflag=sync

- mount usb\_device (thumb drive)
- format, partition etc. check fs: #strong[df -Th /dev/sda]

\-format -NO! use fat32 (above) to work with other devices sudo mkfs.exfat /dev/sda

\-mount mount /dev/sda /media/a\_mt\_point (a\_mt\_point must already exist)

\*\* cron job, crontab

{ grep jim /var/log/syslog \# see cron jobs that ran

Sat May 21 18:48:16 PDT 2022 - jr changed /etc/rsyslog/50-default.conf - uncomment \#cron – cron s/d now log to cron.log - after change, run sudo service rsyslog restart

- see cron Icard ('linux') }

\*\* Linux Kernel

{ - one LTS Ubuntu can have many (upstream) kernels - Mix & Match kernels? X? - Kernel Upgrade - See INDEX C.

}

- systemctl - control dameon and services
- loginctl - control login daemon (such as when i3/lightdm crashes)

#emph[jim\_Permissions] u g o (user group other)

\*\* ZSH notes

#emph[ZSH] ZSH REF CARD: (start) https:\/\/www.bash2zsh.com/zsh\_refcard/refcard.pdf SEE MANUAL: https:\/\/zsh.sourceforge.io/Doc/Release/ SEE ZSH GUIDE (2003, Stephenson) https:\/\/zsh.sourceforge.io/Guide/zshguide.html ZSH FAQ (2010) https:\/\/zsh.sourceforge.io/FAQ/ ZSH REF: Lots of simple GLOB examples here: http:\/\/reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell/

\~/dotfiles/.zshrc \~/dotfiles/.zshenv zsh -x \*.sh \# prints line then executes

=== script header
<script-header>
\#!/bin/zsh -xv \# verbose

=== diff -y file1 file2 (2 columns)
<diff--y-file1-file2-2-columns>
- SEE github, zsh\_project
- arrays, SEE 008\_array, ordered, unordered, append, typeset, unset, array + glob
- structures: for, case … see 032\_
- find: 028\_ and others
- prompt, ansi, echo \$fg\_bold\[green’\]hi SEE:
- also: grep, \${var}, tee, (( string\_to\_numbers)), do..done

=== widgets
<widgets>
- software chunk, "beginning of line", "kill-line"
- to invoke: user types , \<CTRL-\[-B\> (using vim notation)
- but notation: '^a', '' '^\[b'
- '' =
- '^\[' = also

=== bind to widget
<bind-to-widget>
- bindkey '^k' kill-line (binkey.shortcut.existing widget)

=== glob vs extended-glob (SEE Guide 5.9.7):w
<glob-vs-extended-glob-see-guide-5.9.7w>
- ll demo/\*\*/\*.txt
- ls -l demo/\*\*/\*\<1-10\>.txt
- ls -l demo/\*\*/\[a\]\*.txt (begins with `a`)
- ls -l demo/\*\*/\[^cC\]\*.txt (do not begin with `c` or `C`)
- print -l \*\*/\*(/) \# just dir (recurse)
- print -l \*\*/\*(.) \# just files (recurse)
- ls -ldh demo/\*\*/\*(DOL\[1,6\]) \# 6 largest files
- Lots of syntax to select JUST what you want!

=== parameter expansion
<parameter-expansion>
SEE 000\_PE\_examples.sh - \${var/old/new} 1 replace - \${var\/\/old/new} all - \${f\##emph[.} is x.y where f = file.x.y (remove left) - \${f\#];.} is x.y where f = file.x.y (remove left) - \${f\#\#\*.} is y (greedy, remove all left)

- SEE FAQ73, https:\/\/mywiki.wooledge.org/ , GNU Bash Ref Manual 3.5.3

=== zsh/unix permissions
<zshunix-permissions>
\*\*\* unix, zsh permissions u g o owner–in group–others

r=4 w=2 x=1 chmod 700 rwx — — "public" 644 rw- r– r– "private" 600 rw- — —

=== basic linux commands
<basic-linux-commands>
- delete all files EXCEPT "txt" files: \
  find . ! -name ’\*.txt’ -type f -exec rm -f {} + grabs all non txt files, replaces{} with these files, all one line (+)

=== zsh commands in emacs (SEE: zsh\_project)
<zsh-commands-in-emacs-see-zsh_project>
=== completion, Use zstyle
<completion-use-zstyle>
man zshcompsys zstyle + 3rd party scripts - do MANY things (completion, modify settings, config VCS\_INFO …) SEE: https:\/\/thevaluable.dev/zsh-completion-guide-examples/

#emph[VCS\_INFO] is a function, used to populate variables (prompt, for ex) #emph[retrieved from vcs, ie git] SEE: https:\/\/arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html SEE: https:\/\/zsh.sourceforge.io/Doc/Release/User-Contributions.html\#Version-Control-Information

USAGE: #emph[zstyle]
and is NOT so OBVIOUS ! if match, apply the style USAGE: zstyle
Completion: ex: cd completion zstyle ':completion:#emph[:];:cp:' zstyle ’:completion:\*’

General: :completion::::: - command (cd, rm, etc) - (could be files, users, options ??)

#emph[precmd] is hook function, runs before ZSH prompt (SEE manual 9.3.1) SEE: https:\/\/zsh.sourceforge.io/Doc/Release/Functions.html\#Special-Functions

=== printf
<printf>
- string(%s), digit(%d); example: digit,pad with by 5 printf "%05d" \${x}

- R: see sprintf https:\/\/www.r-bloggers.com/2010/05/number-formatting/

\*\*\* zle = zsh line editor/keymaps/widgets/

\*\*\* misc zsh

SEE Serge Gebhardt widgets correspond to commands, often with shortcut

Given a widget (ex: '', ie esc b) bindkey '' \#returns backward-word; ie ESC-b, aka M-b goes back one word ! \
binddky '^b' \# returns backward-charac

bindkey '' \# returns foward-word

bindkey '^a' \# returns beginning-of-line

zle -al \# list of widgets

keymaps=collection of shortcuts bindkey -l \# vi modes?

To see mapping: 1. cat ; type key; ends (try M-b) 2. ; type key

invoke widget: 1. bind to shortcut 2. zle \# to execut 3. sp widget

TERMCAP - obsolete

=== sudo vs su ….
<sudo-vs-su-.>
{

- su jim change to User 'jim'

- sudo cmd - last \~ 15’ (temporary use of root privileges) - asks for user’s password - allows root 'privileges' but the home directory, path etc remains the user’s

- next 3 are same: (change to root user, with root env) \[use exit to exit\]

- - su - root \# change to root user, with root env

- - sudo su

- - sudo su -

    - shell: either login or non-login
    - non-login has 2 flavors: #strong[interactive] (user at CLI) and #strong[non-interactive] (a subshell for scripts)

!askubuntu 376199 !askubuntu 1225041

}

=== drive info
<drive-info>
```
# succinct, useful info
lsblk --output NAME,UUID,PARTUUID
```

xev keyboard

{ - Keyboard specific, find what #emph[keycode] a button is mapped to: - USAGE: \> xev - type just 1 button, look for its keycode, keysym on this keyboard - example: q will be keycode=24, keysym=0x71 called 'q'

}

17JULY2023 - ebook-viewer (calibre) has conflict with caps:swapescape, can not figure out REF: #link("https://wiki.archlinux.org/title/Xorg/Keyboard_configuration") FIX: now using #strong[setxkbmap -option caps:escape (in .xinitrc) ] DEPRECATES anything before 17JULY 2023

xxd

{

```
- To find how zsh maps a button (A, alt, F2) :  
- USAGE: > xxd <CR>
- press <ALT>+a
- terminal displays coding (^[a)
- SEE ROTHGAR
```

}

=== GLOB
<glob>
grep\_vs\_ls

#emph[Grep] always finds words that match a pattern and returns file names of matches.

ls (+ glob) #strong[finds filenames that match a pattern];. Very different from grep. (same in vim)

#emph[jim\_GLOB\_examples] Mostly of form ls or ll or print -l and \*\*/\* example: print -l \~/code/\*\*/\*.(R|Rmd) \# any level, return all .R and .Rmd files

See my zsh GLOG handwritten notes (till typed in here)

=== ZLE
<zle>
ZLE = Zsh line editor | NOT GNU readline \
#emph[zle\_widgets] (all commands)

Output from zle -al (\~403 cmds)

=== BINDKEY
<bindkey>
#emph[bindkey] \# results, all shortcuts

(sample) "#super[A”-”];C" self-insert "^D" list-choices "#super[E”-”];F" self-insert "^G" list-expand "^H" vi-backward-delete-char "^I" expand-or-complete

=== Google, API, curl
<google-api-curl>
(1APR2022) Google’s example, with loop for uri\_redirect https:\/\/accounts.google.com/o/oauth2/v2/auth? scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fyoutube.readonly& response\_type=code& state=security\_token%3D138r5719ru3e1%26url%3Dhttps%3A%2F%2Foauth2.example.com%2Ftoken& redirect\_uri=http%3A\/\/127.0.0.1%3A9004& client\_id=client\_id

```
- Google's authorization server: https://accounts.google.com/o/oauth2/v2/auth
```

=== From Explorer
<from-explorer>
GET https:\/\/youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=\[YOUR\_API\_KEY\] HTTP/1.1

Authorization: Bearer \[YOUR\_ACCESS\_TOKEN\] Accept: application/json

=== 
<section-2>
same, but as Curl

curl \
'https:\/\/youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=\[YOUR\_API\_KEY\]' \
–header 'Authorization: Bearer \[YOUR\_ACCESS\_TOKEN\]' \
–header 'Accept: application/json' \
–compressed

=== From Google Playground
<from-google-playground>
https:\/\/youtube.googleapis.com/youtube/v3/commentThreads?videoId=Mec9sw1cJk8&part=snippet,replies \#\#\#

=== 
<section-3>
CURL | YOUTUBE API | GOOGLE API | OAUTH 2.0 |

client = oauth\_client(id= client\_id, token\_url = token\_url, secret = client\_secret, key = API\_KEY, auth = "body", \# header or body

```
    name = "youtube_ONE_video_ALL_comments")
```

req \<- request("https:\/\/www.googleapis.com/youtube/v3/commentThreads?videoId=Mec9sw1cJk8&part=snippet,replies") %\>% req\_oauth\_auth\_code(client = client, auth\_url = auth\_url, token\_params=scope\[\[1\]\])

resp \<- req %\>% req\_perform()

Some Remarks: - Google is but one implementation of various API, oauth technologies. The more you read the more confused you may become (at least for me). \
\- The R package #strong[gargle] is uses #strong[httr] and therefore not my preference. \
\- I am using httr2 to automate things; I’d like to understand things using a little as possible: curl, browser and local server running as localhost. \
\- Most of the R work is done at lower level, such as packages curl and httpuv.

begin{verbatim} G O O G L E end{verbatim}

=== HTTR2 - NOTES (needs clean up!)
<httr2---notes-needs-clean-up>
PURPOSE: Demonstrate configuration for HTTR2 and OAUTH2 with Google’s Youtube API.

```
                        - uses off-the-shelf `httr2::req_oauth_auth_code()` + configuration
                      - uses authorization code flow.
                        - uses redirect_uri localhost, cut & paste (via obo) is deprecated.
                        - httr2:: hides almost all details of interaction.
                        - use curl and localhost such as httpuv:: to see lower level
```

Source: https:\/\/developers.google.com/youtube/v3/guides/auth/installed-apps

RELATED INFO: - Google Explorer (youtube) - Google OAUTH2 playground

```

#\###**==========================
From Google (Youtube) Explorer:
GET https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=[YOUR_API_KEY] HTTP/1.1

Authorization: Bearer [YOUR_ACCESS_TOKEN]
Accept: application/json

#\###**==========================
```

For youtube (auth code): echo "curl -Lsv \"https:\/\/accounts.google.com/o/oauth2/v2/auth? \
client\_id=\$client\_id& \
redirect\_uri=https:\/\/127.0.0.1:8080& \
scope=https:\/\/www.googleapis.com/auth/youtube& \
response\_type=code\""

scope = list( "https:\/\/www.googleapis.com/auth/youtube", "https:\/\/www.googleapis.com/auth/youtube.force-ssl")

For youtube (obtain results): curl \
'https:\/\/youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=\[YOUR\_API\_KEY\]' \
–header 'Authorization: Bearer \[YOUR\_ACCESS\_TOKEN\]' \
–header 'Accept: application/json' \
–compressed

\#\#\#= NEEDED SCOPES: https:\/\/www.googleapis.com/auth/youtube Manage your YouTube account https:\/\/www.googleapis.com/auth/youtube.force-ssl See, edit, and permanently delete your YouTube videos, ratings, comments and captions

playlistId = "PLlXfTHzgMRUIqYrutsFXCOmiqKUgOgGJ5" \# Pavel Grinfeld, Linear Alg 3

\#\#\#= Procedure: - Follow hadley outlines in Vignette for Github and and getting user’s information. (Requires oauth token) - Change for google - let httr2 handle the details, use this function: httr2::req\_oauth\_auth\_code() - If I have this right, this will (1) get the access token and (2) complete REST request.

\*\* Pandoc PANDOC: !pandoc –metadata=project:xxx –lua-filter doc/panvimdoc/scripts/skip-blocks.lua –lua-filter doc/panvimdoc/scripts/include-files.lua -t doc/panvimdoc/scripts/panvimdoc.lua % -o doc/jimHelp.txt

\*\* MORE CURL CURL Examples:

cURL write (to standard) w response after callling example.com
github curl https:\/\/api.github.com/zen

returns lot of kev=value pairs curl https:\/\/api.github.com/users/defunkt

\-include headers curl -i https:\/\/api.github.com/users/defunkt

headers only curl –head

CURL\_CONFIG (a FILE) USAGE curl -K CURL\_CONFIG …

Misc Notes: "State" - cookies used to be used; now state carried in headers

Misc Notes: "State" - cookies used to be used; now state carried in headers \
vim:nospell

\*\* ANDROID

=== Android, Mobile, Cell Phone - notes
<android-mobile-cell-phone---notes>
#emph[Nov 2024] - need wireless phone? or working wifi-only phone? (mine does not work)

#emph[Carrier] - 5G or `slower` 4G/LTE - 1-5 GB per month seems OK for some video, streaming … - podcasts \~ 1MB/minute of talk (use wifi) - want unlimited text/talk - MintMobile (owned by T-Mobile) claims \$15 per month - US - SIMS: physical or eSim, if device supports - not my current onePlus 3T,

- device must support 5G? GSM? Volte? ..
- device should also support wifi (for mp3 downloads)

#emph[mp3 players] - DAC, dongle, digital devices: seem to be superb music; not android or podcast devices. - Sony as usual is best; also Fifo and many others

RETAIL DEMO UNIT ('retail mode'): - ie runs in endless LOOP, no Cell ability, no MEI - useable ONLY for wifi - Can be BARGAIN, but … - Must unlock bootloader (to remove 'endless loop software' and become regular wifi device. Locked means bootloder hard-coded insist OS match a code. - if CAN unlock bootloader , BARGAIN. Beware endless hours otherwise.

- bootloader lock - at least TWO kinds
- carrier lock - that carrier only and even if unlocked software may persist
- factory lock - seems many are carrier unlocked; but less or factory unlocked.

\*\*\* Google Pixel #strong[3a XL] (my phone, 6.3” good size) - screen broken Aug ’25 - Android 12 = final google update. - DO expect "unofficial" Android 13 for this phone (sooner or lalter).

- Pixel 4a (5.8”, too small) cheaper glass than pixel 3a; practical gone (Aug ’25)

- OnePlus

- (1/26) - older "flagships" models should be good.

- Samsung - some say good; other don’t agree.

- waste so much time on this.

- OnePlus 12, 13 all good - not cheap

- OnePlus 8 (bought 9/25) (\$137) very good, but no 3mm jack;

- buy Redmi Note 14; because mid-range; has 3mm jack; 6GB/128GB (\$140)

\*\* Typst (and emacs) (22 MARCH 2026) - assorted problems getting all emacs pieces installed. needs lsp, mist, and a few other pieces. Maybe very active development now. Postpone till I have more info.

#set align(center)
#block(
  fill: rgb("f58025"),
  inset: 14pt,
  width: 100%,
[=debloat: adb -d shell -d for device, not emulator then use pm command to list/remove packages]
)
\*\*\* #strong[OEM Unlock] - greyed out? (like mine) then not possible to unlock bootloader itself. Means: no root. #strong[no ROM install] #strong[no TWRP] - my pixel is VERISON (sprint?) phone; not a Google phone; b/c IMEI begins with 35… NO way to change bootloader.

=== ADB
<adb>
- #emph[ADB] DEBUG: a "mode" that allows installing apps, read logs on Android, file transfer… Works by running TCP sever on host (PC) and daemon on device (phone) Works by running TCP sever on host (PC) and daemon on device (phone)

- SEE https:\/\/www.howtogeek.com/192732/android-usb-connections-explained-mtp-ptp-and-usb-mass-storage/

  - adb –help
  - adb shell
  - adb shell df -h
    - adb shell ls /system/bin (available cmds)
  - adb push \[ – sync \] \# only push if newer
  - #strong[adb push \* /sdcard/Music \# worked 3/25, push to pixel 4]

- Photo tranfer, different.

- #strong[mp3 file transfer] ADB appears to be FUSSY: remove things like `?` from file names or foregin char. ADB sucks at error messages; chokes; just seem to stall. Just fix the file names and adb will work; speed is very good; but even 25 MB/s \~ 1.8 GB/min. Be patient with 40 GB.

- Bluetooth - wasted plenty of time: use wired ADB; some mention Ubuntu & bluetooth never got along. Either way - TIME SINK; waste.

- #emph[MTP] is protocol to move files; seems imperfect (CLAIM: now standardized, better) ; PTP for photos

mtp:\/\/\[usb:001,085\] where 085 refers to device. (Run lsusb) - AVOID this stuff; #strong[stay with ADB and fix those file names]

- #strong[adb backup] dissappointing, time-sink; THINK backup all all my apps, data, but can NOT find clear documentation. STOP.
- Do not like Google bloatware. Expected something like ONEPLUS (which I install ROM). Google’s rules, annoyances - must remove. do not want G- ecosystem to point to each of its sister apps.

\*\*\* Android os - Android is U/I to actual OS, which is #strong[Dalik];, uses java VM #strong[Recovery Mode] is separate partition(?) contains just enough code to boot in this mode. Replacing this code is #strong[custom] recovery vs #strong[stock] recovery. - #strong[FASTBOOT] purpose to `flash` ROM on device; level beyond ADB.

=== section{Laptop Buying Notes}
<sectionlaptop-buying-notes>
#strong[eMMc] is on bmotherboard(embedded), slow but works: cheap, reliable; fine to boot. Check /dev/mmcblk\*\* SSD is much better, but more expensive.

\*\*\* Lenovo T480 (stolen May 2024)

- running Linux Mint (no more Chromebooks)
- Power, 65W, need brick or wall charger.
- cable must support 3 Amps
- buzz words GaN, PD (Power Delivery), no need latest PPS
- name brands: Anker, Belkin, "Amazon Basics", #strong[Beware off-brand] buy based on what is compatible with T480 (go crazy trying to match standards, USB-C 3.1, 3.2, 4.0, generatations, standard or not?)

\*\* RUST (systems level language)

- programmer has control over memory, variables. Leads to SAFETY and PERFORMANCE. At cost of understanding more about memory etc.

- #emph[macro] is code that runs at COMPILE time; inserts compiled code sections. (Saves programmer from needing to write common code over and over.)

#emph[CAR NOTES] https:\/\/check-vin.org/

my VIN: 1HGEM22911L031079

=== Battery Notes (3/1/2026)
<battery-notes-312026>
- AGM is lead, with sulfuric acid. The acid is absorbed(?) by a mat; so does not spill.
- Resting Voltage (no load) \~ 12.8-12.9 V
- When just recharged - voltage can be \> 13 V. This will settle back soon.
- When car starts, the 12.8V will drop (should stay above 10V) and immediately bounce back as alternator begins.
- The alternator (regulates battery re-charge) will bring voltage up to \~14V, at least briefly.

Because computer runs the show, any change in one place triggers change somewhere else computer constantly adjusts.

DC Voltage 100% charge - 12.8 75% charge - 12.6 50% charge - 12.3

Time to recharge a 12V battery depends on SoC (state of charge?) and amp output (10, 20 even 30 AMPS) of charger. Noco is good name. Battery charger is NOT same as battery jumper, the latter is more expensive. Ask because I don’t know.

BLACK, Prius 5 - 4 door , all owners in family (?) Chicago car: https:\/\/corvallis.craigslist.org/cto/d/corvallis-2011-toyota-prius-4dr/7791577925.html carfax: https:\/\/www.autovhr.com/CFReports-ran/AutoVhr-CFreport\_1728601520.html -carfax clean no records, post-2018 Ingrid 2009/Prius Hatch 4D/112k/\$9/(carfax: says \$8.4) (JTDKB20U3 93503700) car: WHTIE, https:\/\/portland.craigslist.org/wsc/cto/d/portland-upgraded-base-model-prius-2009/7786557907.html carfax: https:\/\/www.autovhr.com/CFReports-ran/AutoVhr-CFreport\_1728671601.html

waiting: Travis has receipt for last; and battery: 12V or hybrid

\#———————— Jack JACK, 2012/preisC/111K/\$8.9/JTDKDTB30C1023315 (#emph[dealer offered him \$7k trade-in];) Waiting: his battery, recent records car: https:\/\/portland.craigslist.org/mlt/cto/d/portland-2012-toyota-prius/7789997037.html carfax: see pdf (shows battery replaced; Jack says it wasn’t) service records: see pdf

=== Reddit, API
<reddit-api>
````
Managing and exporting your saved items on Reddit can be tricky because **Reddit’s native interface does not include a search bar for saved items**, and it enforces a strict **1,000-item limit** (saving a 1,001st item will push the oldest one out of your list).

Because your saved list is private, a direct URL like `reddit.com/user/jimrothstein1/saved/` can only be viewed when you are securely logged into your specific account.

A breakdown of the different methods available to search, download, or handle this list includes Python options, AI tools, and browser extensions.


### Method 1: Using Python and the Reddit API (Highly Recommended)

Using Python alongside **PRAW** (Python Reddit API Wrapper) is the most reliable way to back up your list. It allows you to download everything into a readable file (like a CSV or Markdown file) which you can then easily search using standard computer tools or open in Excel.

**How it works:**

1. Go to Reddit’s App Preferences while logged in and create an app to get your `client_id` and `client_secret`.
2. Install PRAW using pip: `pip install praw`
3. Run a script to iterate through your saved history.

**Example Python Script:**

```python
import praw
import csv

# Initialize Reddit API credentials
reddit = praw.Reddit(
    client_id="YOUR_CLIENT_ID",
    client_secret="YOUR_CLIENT_SECRET",
    user_agent="SavedPostExporter v1.0 by /u/jimrothstein1",
    username="jimrothstein1",
    password="YOUR_PASSWORD"
)

# Open a CSV file to write the data
with open("reddit_saved.csv", "w", newline="", encoding="utf-8") as file:
    writer = csv.writer(file)
    writer.writerow(["Type", "Title/Comment", "Subreddit", "URL"])

    # Fetch saved items (Maxes out at Reddit's 1000 limit)
    for item in reddit.user.me().saved(limit=None):
        if isinstance(item, praw.models.Submission):
            writer.writerow(["Post", item.title, item.subreddit.display_name, item.url])
        elif isinstance(item, praw.models.Comment):
            writer.writerow(["Comment", item.body, item.subreddit.display_name, item.permalink])

print("Backup complete! Check reddit_saved.csv")
````

\#—

=== Method 2: Can you tell an AI Agent to do it?
<method-2-can-you-tell-an-ai-agent-to-do-it>
#strong[Yes, but with security and privacy caveats.]

An AI agent #strong[cannot] download the list simply by reading the URL you provided. Because your saved list requires a secure login, a standard AI agent will just see a "403 Forbidden" or "Page Not Found" error.

To use an AI agent (like a local LLM or an AI automation tool), you would have to choose one of two paths:

+ #strong[The Automated Browser Route (Safer but Technical):] You can use an AI coding assistant (like Claude or ChatGPT) to write a script utilizing #strong[Playwright] or #strong[Selenium];. You log into Reddit manually on your computer, and the AI-generated script handles scrolling through the page, scraping the text, and compiling it into a document.
+ #strong[The Credential Route (High Risk):] You could provide an AI agent with your Reddit API keys or username/password to execute a Python backup script for you. #strong[This is highly discouraged] unless the AI agent is running completely locally on your own machine, as sharing passwords or session cookies with third-party cloud AIs poses a severe security risk.

=== Method 3: Dedicated Third-Party Tools & Extensions
<method-3-dedicated-third-party-tools-extensions>
If you prefer not to write code, several community-built tools bypass Reddit’s limitations:

- #strong[Reddit Data Request (Official Takeout):] You can request a complete legal archive of your data directly from Reddit via #strong[#link("https://www.google.com/search?q=https://reddit.com/settings/data-request")[reddit.com/settings/data-request];];. Reddit will email you a ZIP file containing CSV files of your history. Note that this often only contains the #emph[links] to your saved items rather than full text descriptions, and it can take several days to process.
- #strong[Browser Extensions (Notion / CSV Exporters):] There are several popular extensions on the Chrome Web Store and Firefox Add-ons library designed specifically for this purpose. They use secure OAuth authentication (meaning you never reveal your password) to let you click a single button to export your saved items directly into a spreadsheet or a Notion database, complete with search and tagging capabilities.
- #strong[Web Utilities (e.g., Reddit-Saved.com):] Free web apps exist that securely authenticate through Reddit OAuth, index your list, and provide an instant search bar. Because they store a record of your saves once synced, they can often help you preserve items beyond Reddit’s 1,000-post memory wall.

\`\`\`
