jim
2023-12-20

#### Hardware

23 DEC 2024 - wireless mouse, \$10, bestbuy, M220 logitech, 18 month
batter life, plain vanilla is just fine.

#### folds

folds: use za or (define-key evil-normal-state-map (kbd “<tab>”)
’evil-toggle-fold) need package for evil/folds - za open fold - zc close
fold - zr open all folds - zm close all folds - C-3 S-TAB (show outline
upto level 3 - WORKS!)

#### url links

\[\[nytimes.com\]\]\[nytimes\] \[\[‘file:280_emacs_notes.qmd’\]\]\[emacs
notes\] \[\[https://www.nytimes.com\]\[nytimes.com\]\]

## TODO

    -   use folds, to simplify navigating this document
    -   **no R here, no Stats**
    -   includes *i3*, *emacs*, *Debian*
    -   HTTR2 notes = mess
    -   Break this document into separate files, merge into one big one?

- \<2024-10-10 Thu\> now Debian 12 (Cinnamon or i3); no more linux mint;
  LMDE … \<2024-08-26 Mon\>
- do not use emacs as “DESKTOP” - everything, windows on the screen at
  once.
- humans can not multitask; keep window only used for current work.
- computers great for keeping lists of buffers, search when you move to
  next task.
- tools like ivy can recall things like split window, code 1 side; dir
  on other
- exist tools to maintain buffers in ‘projects’
- EXWM still not sure.

\<2024-07-01 Mon\> - ex looks very useful! - SO(3) - not sure what I am
asking; normal subgroups, symmetries?

### Github actions

- do not guess, do not play: READ DOCS
- render quarto (in gfm, github format, SEE *gh_actions_project/quarto,
  SEE main.yaml*
  - will render qmd to md file (github format)
  - do not soft link qmd files, actual file or copy must in project
  - of course, can render to md locally and merely push to github;
  - do not know branch and yaml the same (ie not both main…)
- (Github actions) Reading
  - Book <https://orchid00.github.io/actions_sandbox/>
  - <https://www.r-bloggers.com/2021/01/automatic-rendering-of-a-plot-with-github-actions-3/>
  - <https://www.simonpcouch.com/blog/2020-12-27-r-github-actions-commit/index.html>
  - <https://fromthebottomoftheheap.net/2020/04/30/rendering-your-readme-with-github-actions/>

\*\* Posit Connect Cloud (new) - works with Shiny; gets code and
manifest (json, with all R dependencies) from github (works)

\*\* 29-May-2024: Upgrade to R 4.4, Linux Mint 21.3 (Virginia)

\<2024-09-25 Wed\>

### “ex” editor

- simple, vi-like editor (see
  https://www.geeksforgeeks.org/ex-command-in-linux-with-examples/)

- :a (to add text)

- :w , :wq

- print : 1,3 or :1,3p :4 (print line 4)

- delete : 1,2d

- print all lines g /the/ p

- : 3 s/this/that (line 3)

- /he/ he, help, heading…

- /\<he\>/ “he” only

- /\<.he\>/ not “he”, but “she”, “the” will pass

- : /\<a move to first line where “a” begins  
  /\>last\$

prior to ‘ex’, was ‘ed’

### PGP

- install public key: *gpg –recv-keys XXX*, where XXX= 16 alphanumber
- KEY SIGNING: (summary) I can create public-private keypair. If I
  ‘sign’ doc with private key, then anyone with my public key can READ
  and will know ONLY I could have encryted the file.
- Encrypt with my PUBLIC KEY, then only someone with my PRIVATE KEy can
  read it.
- ALL keys belong on Debian key ring. \*\*\* R
- This is a nightmare. There are several discrete steps; Do one at time!
- sketch: get public key; import; convert .asc to .gpg (if needed); cp
  .gpg to Debian’s ring
- USE gpg; DO NOT USE apt-key
- apt-secure - ONLY 2 line to run. Just do what Cran R says to do for
  Debian, key-ring: https://ftp.osuosl.org/pub/cran/. Then reboot,
  update apt.
- gpg keys; Debian: see apt-secure, READ carefully, but it doeswork.
- gpg –list-keys

\*\* i3, i3wm Videos: basic config:
https://www.youtube.com/watch?v=88o2XuH3E08&list=PLbcglKxZP5PMTWVe1KhZX3Jvo0xqk8h5I&index=1 -
man i3 has good help, but quick becomes *x11* - review man
i3-dmenu-desktop

\*\* PURPOSE:  
Misc Tech Notes; details, notes can be here (but COMMANDS put on INDEX
C). Math, R, probability and stats notes \*\*do NOT go here\* \*\*
emacs/org mode/eLisp

SEE: Separate emacs/org documentation

\*\* functional programming (julia, rust, lisp) - Julia easier? - RUST
learning curve, but high performance - Both have functional?, but seems
to learn functional stay with lisp, racket, haskell or any similar

\*\* IMPERATIVE v DECLARATIVE - math notation is DECLARATIVE; indicates
meaning, not exact details (example1: summation sign). Tell computer
what you WANT, leave details to compiler or program. - IMPERATIVE
(older, obsolete?) every detail, machine language? \## QUARTO:
2023-12-06 - Try couple of cv or resume templates and one quarto
extension. Seemed to be more work than worth. Just use Rmarkdown to
create resume. 2024-01-26 READ r4ds Ch 28-29 b/c Quarto and config knitr

\*\* {X11, Wayland, video} **Warning:** Stay with X11 (proven,
well-supported, works)

Wayland is open source replacement for X windows, (widgets says get
graphics from X or Wayland). WESTON is reference implementation.

Because Wayland accepts same toolkits (Qt, GTK) as X, the impact for
developers and users should be minimal. Wayland shrinks X; much
functional now in Linux kernel.

- Xserver: ‘display’ server, runs locally, makes display and keyboard
  available to apps (either local or network) ~/.xsession-errors -
  Unlike cli, GUIs have no console; errors err redirected to this file
  ~/.Xauthority - is random code to control which progams output to my
  X11 session

\*\* {PDF, Pandoc, Latex}

\*\*\* PDF Notes \[ignores html, css; also ignores YAML header (pandoc &
::render()\] \*\*\* Print raw text (example, from github, raw) *Quarto*
saveas qmd, add yaml header, enclose all text in \`\`\` (verbatim);
render inside rstudio.

2023-12-30 - tlmgr controls much latex install: fonts, \*.sty, - for
PDF: pdf2latex, pdflatex (pandoc will do it, but complain) - in R,
tinytex::latexmk()

To create pdf, just about everything works: pandoc, markdown, latex,
knitr.. Note: zathura uses library, open source `popler`.

NOTE: Missing latex .sty ?  
- With .tex file, run (in R) tinytex:latemk(\*.tex) to install - OR, use
tlmgr install <font> - fonts installed? fc-list : family - also
luaotfload (loads fonts) - ENGINE=software (such as **luatex**, tex,
pdftex) - FORMAT=macros (such as **lualatex**)

(Jan 2022) **Missing font, package? TinyTex** \* update R \* keep_tex:
true (in YAML) \* at R console tinytex::lualatex(“…. .tex”), or
tinytex::latexmk(“*.tex”) * \~~ some times works, sometimes not \~~

Lua in *.tex file * see ~/code/publish_project/TEX/

(pre-Quarto !) HTML \[to produce HTML with pandoc, all latex is
IGNORED.\]

I do **not** know how to create fancy HTML files from knitr, pandoc.

HTML is pain in ass and HUGE time waste. Pandoc can handle markdown and
small amounts of latex (math) b/c ppl have added filters or other
widgets to pandoc.

If using Latex, its packages, diagrams with Latex … must go with PDF.

-H header  
-V or –variable  
–pdf-engine=xelatex

- Try verbatum; process as a markdown. pandoc balks at processing
  straight text if it thinks it sees markdown. If lucky, !pandoc % -o
  file.pdf will work.

\*\*\* section{LATEX NOTES}

- Tikz seems to be most popular way to gaphics vs **pstricks**.

  footnote:

  **postscript** a more powerful programming language than tex;
  **pstricks**, ghostscript; pdf (a subset of postscript) hails from
  this. However, using postscript with latex requires addins, such as
  ghostscript; drivers; … Avoid **postscript** and packages pstricks,
  even if greater capability.

Original tex was 320 low-level cmds (aka primitives). Macros created
from these. But actual engine (tex) hidden from user.

**LuaTex** (engine) is re-write of core TEX engine (hard, written in
C).  
Therefore, **LuaTex** added primitives, more open (can use tex or lua)

**LuaLatex** is macro package.

EXAMPLE: In .tex file, write lua: directlua is new primitive; lua api
inside value for

$$\pi = \directlua{tex.sprint(math.pi)}$$

\*\*\* revealjs slides with Quarto

**make**

- Make: seldom use; but I did collect many examples of zsh, ls + regex
  examples, zsh commands re: disk, storage, files …, R to create
  packages
- tips: FILES=\$(wildcard \*.R) SHELL := /bin/zsh lots of useful zsh
  commands buried in make_project
- Therefore, **do not discard make_project directory**
- https://github.com/jimrothstein/make_project
- CHEAT
  https://github.com/mxenoph/cheat_sheets/blob/master/make_cheatsheet.pdf

### GIT commands

HEAD - can point to branch (tip) or a commit (detached HEAD). Commits
are immutable. HEADS can move around. - git merge –no-ff –no-commit main
(no fastforward, *dry-run*)

- git restore –source master~2 path/file (2 commits back, give path to
  file)

- git log MANY USEFUL! See Book 2.3
  (https://git-scm.com/book/en/v2/Git-Basics-Viewing-the-Commit-History),
  Refernce (https://git-scm.com/docs/git-log)

- git diff HEAD~ HEAD \#show change between prior and most recent commit
  (“https://git-scm.com/docs/git-diff\_) book:
  (https://git-scm.com/book/en/v2/Git-Basics-Recording-Changes-to-the-Repository.html#\_git_diff_staged)

- git diff HEAD – path/to/file.R \# this file only, show diff

\*\* Install R - on Ubuntu, or mintlinux virgina, use jammy and follow
https://cran.r-project.org/bin/linux/ubuntu/ (works)  
- on Debian (such as LMDE) follow
https://cran.r-project.org/bin/linux/debian/ (1) Add: sudo vim.tiny
/etc/apt/sources.list (2) insert: the deb XXX link (3) save, run as jim,
sudo apt install r-base etc.

\*\* REGEX - TODO import (?) all REGEX/\* files to here

- for regex reading see 300_tech_reading.md

# ———————–

## DOCUMENT REGEX HERE

## (text, no examples in this file)

# ———————–

/home/jim/code/docs/tech_notes/REGEX.md

2024-04-30 - Use a cheat sheet - Reduce paper - Annotate (here, or in 2
files) ONLY when needs

## this file: ~/code/docs/tech_notes/REGEX.md

## ~/code/docs/tech_notes/001_grep_regex_P_examples.qmd

## ~/code/docs/tech_notes/002_grep_examples.md

## SOME regex: in ~/code/zsh_project/ZSH_SH_FILES/

## REGEX

TODO: - sed, when to use? - emphasize goal: use grep -P, regex to
understand how REGEX works. Tired of every 6 months learning all over
again. - greedy/not greedy and backtrack . Think like a regex engine! -
How to aerate regex ! - regex can be used to: - find - validate -
replace/insert - split - … - When whiz, can do summersaults with CLI,
zsh tools (sed, grep , cut …) and regex. Not NOW.

- Separate learning REGEX (grep -P, regex) and using REGEX in R, which I
  think is a tad easier.

### DEFINTIIONS - as always, crucial

    -   regex is a string;  do not forget this.
    -   META CHARACTERS - ascii (?) characters which by-default have
        non-literal meaning to engine that digests them.  **Engine** specific.
        Must ESCAPE these characters to use as literals.  Other contexts, such
        as unix shell, have similar idea:  `<`, `>' for example, refer to
        **redirect** .    In C, sprintf, `%` indicates formatting and literal
        use.
    -   **To Escape** indicate to underlying engine that this meta character
        should be handled as though literal.

    -   POSIX:
        -   backslash \
        -   [ ]
        -   { }
        -   ( )
        -   caret ^
        -   $
        -   dot .
        -   pipe |
        -   ?
        -   asterisk *
        -   `+ -`
        -   ``+ - ''
        -   \verbX + - X
        -   \begin{verbatim} 
            + - 
            \end{verbatim}

### Render REGEX Verbatim - 4 ways (latex?)

`+ -`

\`\`+ - ’’

- **Character Class** Things like \[0-9\].  
  Rmk: \[0-9\]+ means repeat one or more of the prior **Character
  class** So both 321 and 333 match this regex.

### Specific to vim/neovim

- magic = o need to escape (wait till know what doing first) - well, um.

- magic = `\v` no need to escape (wait till know what doing first)

### Specific to R

- Before regex library (engine) sees code, the **compiler** (byte code?)
  gets it first. Must use double backslash for just one backslash to be
  seen by regex engine. Shell interpreters have no such compiler and
  single backslash suffices.

#### Regex grouping: capture & non-capture

**Perl** PCRE for lookaheads, capture (in R, perl=T) from !so

Groups that capture you can use later on in the regex to match OR you
can use them in the replacement part of the regex. Making a
non-capturing group simply exempts that group from being used for either
of these reasons.

Non-capturing groups are great if you are trying to capture many
different things and there are some groups you don’t want to capture.

### LINUX

- Debian: shutdown when sytem hangs? CTRL-ALT-DEL or ALT-printScreen
- *gnome-control-center* is cli to manage linux, X11, ..(even with
  cinnamon/lightdm)
- autologin, if using lightdm, as root edit /etc/lightdm/lightdm.confg
  - in \[seat:\*\], uncomment user and timeout line; set user to “jim”
    (no spaces around =)
- mount usb: sudo mount /dev/sdb /media/usb_drive (RHS must EXIST)

\<2024-10-04 Fri\> Cinnamon and i3 do not mix well (at this point) -
Both are “desktop environment” (others: xfce4, gnome?) - When lightdm
(login manager) runs, user can choose ’desktop envir” AND
authenticates. - SEE for “rules”
https://forums.linuxmint.com/viewtopic.php?p=2533879#p2533879 - LMDE is
meant to run Cinnamon (and not i3); I got i3 to run using testing
Debian. But this breaks LMDE (Cinnamon).

21-July-2023: Rumors, Linux Mint (now based upon Ubuntu/Canonical ) may
be moving to **LMDE** (Linux Mint Debian Edition) Why? some issues with
Canonical? Claims that LMDE much firmer ground; Mint will also then be
more independent. 2024-01-13 - Linux Mint updates, seems no problem

- Booting … firmware \| bootloader (finds all kernels, os) \| grub2
  (user select) ;  
- READ \>info grub <CR>
- /kernel is MINIMUM to start; this is why drivers often need separate
  install, not in kernel.
- SWAP - latest Linuxmint built-in, no need
- LinuxMint - installer sets mountpoints
- PARTIONs - is separate;  for all else (~30-40GB enough)
- Boot drive - needs flag `boot` and `esp` (?)

\*\*\* SETUP/CONFIG new HP Elitebook machine \<2024-10-10 Thu\> HP
Elitebook but with pure Debian/Cinnamon & i3 *CAPSLOCK ESCAPE*; many
easy ways =\> confusion! - Debian/Cinnamon & i3: *setxkbmap -option
“caps:escape” (immediate)* reboot? may need to sourc .xinitrc - other
methods, like /etc/default/keyboard do not seem to work

(did not work for non-Cinnamon)CAPS_LOCK: Use Cinnamon, keyboard options
GUI to set CAPS_LOCK to ESC (easy) June 9, 2024 (HP Elitebook, 845, G8 -
2nd HP laptop) - *~/dotfiles/create_soft_links.sh* VERY helpful - Emacs:
must link emacs files in ~/dotfiles files in ~/emacs.d\* = - must
re-install: wezterm (see webpage), i3, zsh, git, emacs, ZSH, gh - public
keys .. read debian’s guide - zsh change shell: chsh -s \$(which zsh)
jim - emacs: FIRST install/config *‘use-package’* always a pane: -
Cinnamen: hardward/keyboard/layout/options choice to set CAPSLOCK to ESC
(works, but with i3 too?) - websites: Google 1st, then Firefox (rest
should follow) - *keep* sh files, links, config files up-to-date AND in
dotfiles/backup!

Drive is NOT 512G NAME MAJ:MIN RM SIZE RO TYPE MOUNTPOINTS sda 8:0 0
238.5G 0 disk ├─sda1 8:1 0 512M 0 part /boot/efi ├─sda2 8:2 0 27.9G 0
part / ├─sda3 8:3 0 977M 0 part \[SWAP\] └─sda4 8:4 0 209.1G 0 part
/home

du -f (run on 11NOV2024) Filesystem Size Used Avail Use% Mounted on udev
7.5G 0 7.5G 0% /dev tmpfs 1.5G 1.7M 1.5G 1% /run /dev/sda2 28G 9.4G 17G
37% / tmpfs 7.5G 18M 7.5G 1% /dev/shm tmpfs 5.0M 12K 5.0M 1% /run/lock
/dev/sda4 205G 3.9G 191G 2% /home /dev/sda1 511M 5.9M 506M 2% /boot/efi
tmpfs 1.5G 52K 1.5G 1% /run/user/1000 \*\*\* format fat32, for copiers
To make fat32 usb device.(for copier) 1) (optional; too slow) can put
all zeros (optional, slow - ~ 5MB/s or 200 seconds for 1 GB on USB 2.0)
2) sudo parted /dev/sda mklabel msdos (makes empty partition table, of
form MBR) 3) sudo parted /dev/sda mkpart primary fat32 0% 100% (makes
partition) 4) sudo mkfs.fat -F32 /dev/sda (format this partiion, if says
to use -I do so!) 5) sudo parted /dev/sdb print (confirms fat32)

To burn iso on usb (I never got gui’s to work) 1) sudo dd bs=4M
if=/path/to/file.iso of=/dev/sda status=progress oflag=sync

\*\*\* mount usb_device (thumb drive) - format, partition etc. check fs:
df -Th /dev/sda

-format -NO! use fat32 (above) to work with other devices sudo
mkfs.exfat /dev/sda

-mount mount /dev/sda /media/a_mt_point (a_mt_point must already exist)

\*\*\* remap capslock to escape

{ \# PURPOSE: **maps ChromeBox “capslock” key to Escape.** \# - use \>
xev to find that capslock is key 133. \# - xmodmap is older, but simpler
to change key action to change key action. \# - newer is **setxkbmap**
but I find more effort to figure out simple things. \# - SEE tech_notes
\# - lots of ways to do this remap. This works, stay with it: \#
DEPRECTED:

xmodmap -e “keycode 133 = Escape” Lenovo: capslock keycode = 66, and
escape is 9. However, capslock still insisting on going in caps lock
(UPPER CASE) setkbmap seems to suggest using caps:swapescape and not
caps:escape, but xmodmap won’t accept.

}

\*\* cron job, crontab

{ grep jim /var/log/syslog \# see cron jobs that ran

Sat May 21 18:48:16 PDT 2022 - jr changed /etc/rsyslog/50-default.conf -
uncomment \#cron – cron s/d now log to cron.log  
- after change, run sudo service rsyslog restart

- see cron Icard (‘linux’) }

#### Linux Kernel

{ - one LTS Ubuntu can have many (upstream) kernels - Mix & Match
kernels? X? - Kernel Upgrade - See INDEX C.

}

- systemctl - control dameon and services
- loginctl - control login daemon (such as when i3/lightdm crashes)

*jim_Permissions* u g o (user group other)

<!-- begin  ZSH -->

## ZSH notes

*ZSH* ZSH REF CARD: (start)
https://www.bash2zsh.com/zsh_refcard/refcard.pdf SEE MANUAL:
https://zsh.sourceforge.io/Doc/Release/ SEE ZSH GUIDE (2003, Stephenson)
https://zsh.sourceforge.io/Guide/zshguide.html ZSH FAQ (2010)
https://zsh.sourceforge.io/FAQ/ ZSH REF: Lots of simple GLOB examples
here:
http://reasoniamhere.com/2014/01/11/outrageously-useful-tips-to-master-your-z-shell/

~/dotfiles/.zshrc ~/dotfiles/.zshenv zsh -x \*.sh \# prints line then
executes

### script header

\#!/bin/zsh -xv \# verbose

### diff -y file1 file2 (2 columns)

- SEE github, zsh_project
- arrays, SEE 008_array, ordered, unordered, append, typeset, unset,
  array + glob
- structures: for, case … see 032\_
- find: 028\_ and others
- prompt, ansi, echo \$fg_bold\[green’\]hi SEE:
- also: grep, \${var}, tee, (( string_to_numbers)), do..done

### widgets

- software chunk, “beginning of line”, “kill-line”
- to invoke: user types <C-A>, <ALT-B> \<CTRL-\[-B\> (using vim
  notation)
- but notation: ‘^a’, ‘’ ‘^\[b’
- ‘’ = <ESC>
- ‘^\[’ = also <ESC>

### bind to widget

- bindkey ‘^k’ kill-line (binkey.shortcut.existing widget)

### glob vs extended-glob (SEE Guide 5.9.7):w

- ll demo/\*\*/\*.txt
- ls -l demo/\*\*/\*\<1-10\>.txt
- ls -l demo/\*\*/\[a\]\*.txt (begins with `a`)
- ls -l demo/\*\*/\[^cC\]\*.txt (do not begin with `c` or `C`)
- print -l \*\*/\*(/) \# just dir (recurse)
- print -l \*\*/\*(.) \# just files (recurse)
- ls -ldh demo/\*\*/\*(DOL\[1,6\]) \# 6 largest files
- Lots of syntax to select JUST what you want!

### parameter expansion

SEE 000_PE_examples.sh - \${var/old/new} 1 replace - \${var//old/new}
all - \${f#*.} is x.y where f = file.x.y (remove left) - \${f#*.} is x.y
where f = file.x.y (remove left) - \${f##\*.} is y (greedy, remove all
left)

- SEE FAQ73, https://mywiki.wooledge.org/ , GNU Bash Ref Manual 3.5.3

### zsh/unix permissions

\*\*\* unix, zsh permissions u g o owner–in group–others

r=4 w=2 x=1 chmod 700 rwx — — “public” 644 rw- r– r– “private” 600 rw- —
—

\*\*\* zsh commands in emacs (SEE: zsh_project)

### completion, Use zstyle

man zshcompsys zstyle + 3rd party scripts - do MANY things (completion,
modify settings, config VCS_INFO …) SEE:
https://thevaluable.dev/zsh-completion-guide-examples/

*VCS_INFO* is a function, used to populate variables (prompt, for ex)
*retrieved from vcs, ie git* SEE:
https://arjanvandergaag.nl/blog/customize-zsh-prompt-with-vcs-info.html
SEE:
https://zsh.sourceforge.io/Doc/Release/User-Contributions.html#Version-Control-Information

USAGE: *zstyle* <pattern>
<style>

<values> and is NOT so OBVIOUS ! if match, apply the style USAGE: zstyle
<configure><VCS_INFO>
<OUTPUT>

Completion: ex: cd <TAB> completion zstyle ‘:completion:*:*:cp:’ zstyle
’:completion:\*’

General: :completion:<fun>:<complete>:<command>:<arguments>:<tag> -
command (cd, rm, etc) - <tag> (could be files, users, options ??)

*precmd* is hook function, runs before ZSH prompt (SEE manual 9.3.1)
SEE:
https://zsh.sourceforge.io/Doc/Release/Functions.html#Special-Functions

### printf

- string(%s), digit(%d); example: digit,pad with by 5 printf “%05d”
  \${x}

- R: see sprintf https://www.r-bloggers.com/2010/05/number-formatting/

\*\*\* zle = zsh line editor/keymaps/widgets/

\*\*\* misc zsh

SEE Serge Gebhardt widgets correspond to commands, often with shortcut

Given a widget (ex: ‘’, ie esc b) bindkey ‘’ \#returns backward-word; ie
ESC-b, aka M-b goes back one word !  
binddky ‘^b’ \# returns backward-charac

bindkey ‘’ \# returns foward-word

bindkey ‘^a’ \# returns beginning-of-line

zle -al \# list of widgets

keymaps=collection of shortcuts bindkey -l \# vi modes?

To see mapping: 1. cat <CR>; type key; <C-C> ends (try M-b) 2. <C-V> ;
type key

invoke widget: 1. <C-A> bind to shortcut 2. zle <widget> \# to execut 3.
sp widget <execute-named-command>

TERMCAP - obsolete

### sudo vs su ….

{

- su jim change to User ‘jim’

- sudo cmd - last ~ 15’ (temporary use of root privileges) - asks for
  user’s password - allows root ‘privileges’ but the home directory,
  path etc remains the user’s

- next 3 are same: (change to root user, with root env) \[use exit to
  exit\]

- - su - root \# change to root user, with root env

- - sudo su

- - sudo su -

    - shell: either login or non-login
    - non-login has 2 flavors: **interactive** (user at CLI) and
      **non-interactive** (a subshell for scripts)

!askubuntu 376199 !askubuntu 1225041

}

<!-- end ZSH -->

### drive info

    # succinct, useful info
    lsblk --output NAME,UUID,PARTUUID

xev keyboard

{ - Keyboard specific, find what *keycode* a button is mapped to: -
USAGE: \> xev - type just 1 button, look for its keycode, keysym on this
keyboard - example: q will be keycode=24, keysym=0x71 called ‘q’

}

17JULY2023 - ebook-viewer (calibre) has conflict with caps:swapescape,
can not figure out REF:
<https://wiki.archlinux.org/title/Xorg/Keyboard_configuration> FIX: now
using **setxkbmap -option caps:escape (in .xinitrc) ** DEPRECATES
anything before 17JULY 2023

xxd

{

    -  To find how zsh maps a button (A, alt, F2) :  
    -    USAGE:  > xxd <CR>
    -  press <ALT>+a
    -  terminal displays coding (^[a)
    -    SEE ROTHGAR

}

### GLOB

grep_vs_ls

*Grep* always finds words that match a pattern and returns file names of
matches.

ls (+ glob) **finds filenames that match a pattern**. Very different
from grep. (same in vim)

*jim_GLOB_examples* Mostly of form ls or ll or print -l and \*\*/\*
example: print -l ~/code/\*\*/\*.(R\|Rmd) \# any level, return all .R
and .Rmd files

See my zsh GLOG handwritten notes (till typed in here)

### ZLE

ZLE = Zsh line editor \| NOT GNU readline  
*zle_widgets* (all commands)

Output from zle -al (~403 cmds) <snip>

### BINDKEY

*bindkey* \# results, all shortcuts

(sample) “<sup>A”-”</sup>C” self-insert “^D” list-choices
“<sup>E”-”</sup>F” self-insert “^G” list-expand “^H”
vi-backward-delete-char “^I” expand-or-complete

### Google, API, curl

(1APR2022) Google’s example, with loop for uri_redirect
https://accounts.google.com/o/oauth2/v2/auth?
scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fyoutube.readonly&
response_type=code&
state=security_token%3D138r5719ru3e1%26url%3Dhttps%3A%2F%2Foauth2.example.com%2Ftoken&
redirect_uri=http%3A//127.0.0.1%3A9004& client_id=client_id

    -  Google's authorization server: https://accounts.google.com/o/oauth2/v2/auth

### Finally, Request: appropriate query sent to:

GET https://www.googleapis.com/youtube/v3/commentThreads

### From Explorer

GET
https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=\[YOUR_API_KEY\]
HTTP/1.1

Authorization: Bearer \[YOUR_ACCESS_TOKEN\] Accept: application/json

### 

same, but as Curl

curl  
‘https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=\[YOUR_API_KEY\]’  
–header ‘Authorization: Bearer \[YOUR_ACCESS_TOKEN\]’  
–header ‘Accept: application/json’  
–compressed

### From Google Playground

https://youtube.googleapis.com/youtube/v3/commentThreads?videoId=Mec9sw1cJk8&part=snippet,replies
\###

# CURL \| YOUTUBE API \| GOOGLE API \| OAUTH 2.0 \|

client = oauth_client(id= client_id, token_url = token_url, secret =
client_secret, key = API_KEY, auth = “body”, \# header or body

        name = "youtube_ONE_video_ALL_comments")

req \<-
request(“https://www.googleapis.com/youtube/v3/commentThreads?videoId=Mec9sw1cJk8&part=snippet,replies”)
%\>% req_oauth_auth_code(client = client, auth_url = auth_url,
token_params=scope\[\[1\]\])

resp \<- req %\>% req_perform()

Some Remarks: - Google is but one implementation of various API, oauth
technologies. The more you read the more confused you may become (at
least for me).  
- The R package **gargle** is uses **httr** and therefore not my
preference.  
- I am using httr2 to automate things; I’d like to understand things
using a little as possible: curl, browser and local server running as
localhost.  
- Most of the R work is done at lower level, such as packages curl and
httpuv.

begin{verbatim} G O O G L E end{verbatim}

#### HTTR2 - NOTES (needs clean up!)

PURPOSE: Demonstrate configuration for HTTR2 and OAUTH2 with Google’s
Youtube API.

                            - uses off-the-shelf `httr2::req_oauth_auth_code()` + configuration
                          - uses authorization code flow.
                            - uses redirect_uri localhost, cut & paste (via obo) is deprecated.
                            - httr2::  hides almost all details of interaction.
                            - use  curl and localhost such as httpuv:: to see lower level

Source:
https://developers.google.com/youtube/v3/guides/auth/installed-apps

RELATED INFO: - Google Explorer (youtube) - Google OAUTH2 playground


    #   ===============================
    From Google (Youtube) Explorer:
    GET https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=[YOUR_API_KEY] HTTP/1.1

    Authorization: Bearer [YOUR_ACCESS_TOKEN]
    Accept: application/json

    #   ===============================

For youtube (auth code): echo “curl -Lsv
"https://accounts.google.com/o/oauth2/v2/auth?  
client_id=\$client_id&  
redirect_uri=https://127.0.0.1:8080&  
scope=https://www.googleapis.com/auth/youtube&  
response_type=code"”

scope = list( “https://www.googleapis.com/auth/youtube”,
“https://www.googleapis.com/auth/youtube.force-ssl”)

For youtube (obtain results): curl  
‘https://youtube.googleapis.com/youtube/v3/playlists?part=snippet%2CcontentDetails&maxResults=5&mine=true&key=\[YOUR_API_KEY\]’  
–header ‘Authorization: Bearer \[YOUR_ACCESS_TOKEN\]’  
–header ‘Accept: application/json’  
–compressed

#### NEEDED SCOPES:

https://www.googleapis.com/auth/youtube Manage your YouTube account
https://www.googleapis.com/auth/youtube.force-ssl See, edit, and
permanently delete your YouTube videos, ratings, comments and captions

playlistId = “PLlXfTHzgMRUIqYrutsFXCOmiqKUgOgGJ5” \# Pavel Grinfeld,
Linear Alg 3

#### Procedure:

- Follow hadley outlines in Vignette for Github and and getting user's information.  (Requires oauth token)

- Change for google - let httr2 handle the details, use this function:
  httr2::req_oauth_auth_code()

- If I have this right, this will (1) get the access token and (2)
  complete REST request.

\*\* Pandoc PANDOC: !pandoc –metadata=project:xxx –lua-filter
doc/panvimdoc/scripts/skip-blocks.lua –lua-filter
doc/panvimdoc/scripts/include-files.lua -t
doc/panvimdoc/scripts/panvimdoc.lua % -o doc/jimHelp.txt

\*\* MORE CURL CURL Examples:

cURL write (to standard) w response after callling example.com
github curl https://api.github.com/zen

returns lot of kev=value pairs curl https://api.github.com/users/defunkt

-include headers curl -i https://api.github.com/users/defunkt

headers only curl –head <URL>

CURL_CONFIG (a FILE) USAGE curl -K CURL_CONFIG …

Misc Notes: “State” - cookies used to be used; now state carried in
headers

Misc Notes: “State” - cookies used to be used; now state carried in
headers  
vim:nospell

\*\* ANDROID

#### Android, Mobile, Cell Phone - notes

*Nov 2024* - need wireless phone? or working wifi-only phone? (mine does
not work)

*Carrier* - 5G or `slower` 4G/LTE - 1-5 GB per month seems OK for some
video, streaming … - podcasts ~ 1MB/minute of talk (use wifi) - want
unlimited text/talk - MintMobile (owned by T-Mobile) claims \$15 per
month - US - SIMS: physical or eSim, if device supports - not my current
onePlus 3T,

- device must support 5G? GSM? Volte? ..
- device should also support wifi (for mp3 downloads)

RETAIL DEMO UNIT (‘retail mode’): - ie runs in endless LOOP, no Cell
ability, no MEI - useable ONLY for wifi - Can be BARGAIN, but … - Must
unlock bootloader (to remove ‘endless loop software’ and become regular
wifi device. Locked means bootloder hard-coded insist OS match a code. -
if CAN unlock bootloader , BARGAIN. Beware endless hours otherwise.

\*\*\* Google Pixel 3a XL (my phone) - Android 12 = final google
update. - DO expect “unofficial” Android 13 for this phone (sooner or
lalter).

\*\*\* **OEM Unlock** - greyed out? (like mine) then not possible to
unlock bootloader itself. Means: no root. **no ROM install** **no
TWRP** - my pixel is VERISON (sprint?) phone; not a Google phone; b/c
IMEI begins with 35… NO way to change bootloader.

### ADB

- *ADB* DEBUG: a “mode” that allows installing apps, read logs on
  Android, file transfer… Works by running TCP sever on host (PC) and
  daemon on device (phone) Works by running TCP sever on host (PC) and
  daemon on device (phone)

- SEE
  https://www.howtogeek.com/192732/android-usb-connections-explained-mtp-ptp-and-usb-mass-storage/

  - adb –help
  - adb shell <command>
  - adb shell df -h
    - adb shell ls /system/bin (available cmds)
  - adb push \[ – sync \] \# only push if newer
  - **adb push \* /sdcard/Music \# worked 3/25, push to pixel 4**

- Photo tranfer, different.

- **mp3 file transfer** ADB appears to be FUSSY: remove things like `?`
  from file names or foregin char. ADB sucks at error messages; chokes;
  just seem to stall. Just fix the file names and adb will work; speed
  is very good; but even 25 MB/s ~ 1.8 GB/min. Be patient with 40 GB.

- Bluetooth - wasted plenty of time: use wired ADB; some mention Ubuntu
  & bluetooth never got along. Either way - TIME SINK; waste.

- *MTP* is protocol to move files; seems imperfect (CLAIM: now
  standardized, better) ; PTP for photos

mtp://\[usb:001,085\] where 085 refers to device. (Run lsusb) - AVOID
this stuff; **stay with ADB and fix those file names**

- **adb backup** disapppointing, time-sink; THINK backup all all my
  apps, data, but can NOT find clear documentation. STOP.
- Do not like Google bloatware. Expected something like ONEPLUS (which I
  install ROM). Google’s rules, annoyances - must remove. do not want G-
  ecosystem to point to each of its sister apps.

\*\*\* Android os - Android is U/I to actual OS, which is **Dalik**,
uses java VM **Recovery Mode** is separate partition(?) contains just
enough code to boot in this mode. Replacing this code is **custom**
recovery vs **stock** recovery. - **FASTBOOT** purpose to `flash` ROM on
device; level beyond ADB.

\*\* section{Laptop Buying Notes}

**eMMc** is on bmotherboard(embedded), slow but works: cheap, reliable;
fine to boot. Check /dev/mmcblk\*\* SSD is much better, but more
expensive.

\*\*\* Lenovo T480 (stolen May 2024)

- running Linux Mint (no more Chromebooks)
- Power, 65W, need brick or wall charger.
- cable must support 3 Amps
- buzz words GaN, PD (Power Delivery), no need latest PPS
- name brands: Anker, Belkin, “Amazon Basics”, **Beware off-brand** buy
  based on what is compatible with T480 (go crazy trying to match
  standards, USB-C 3.1, 3.2, 4.0, generatations, standard or not?)

\*\* RUST (systems level language)

- programmer has control over memory, variables. Leads to SAFETY and
  PERFORMANCE. At cost of understanding more about memory etc.

- *macro* is code that runs at COMPILE time; inserts compiled code
  sections. (Saves programmer from needing to write common code over and
  over.)

*CAR NOTES* https://check-vin.org/

## my VIN: 1HGEM22911L031079

BLACK, Prius 5 - 4 door , all owners in family (?) Chicago car:
https://corvallis.craigslist.org/cto/d/corvallis-2011-toyota-prius-4dr/7791577925.html
carfax:
https://www.autovhr.com/CFReports-ran/AutoVhr-CFreport_1728601520.html
-carfax clean no records, post-2018 — Ingrid 2009/Prius Hatch
4D/112k/\$9/(carfax: says \$8.4) (JTDKB20U3 93503700) car:
https://portland.craigslist.org/wsc/cto/d/portland-upgraded-base-model-prius-2009/7786557907.html
carfax:
https://www.autovhr.com/CFReports-ran/AutoVhr-CFreport_1728671601.html

waiting: Travis has receipt for last; and battery: 12V or hybrid

———————— Jack JACK, 2012/preisC/111K/\$8.9/JTDKDTB30C1023315 (*dealer
offered him \$7k trade-in*) Waiting: his battery, recent records car:
WHTIE,
https://portland.craigslist.org/mlt/cto/d/portland-2012-toyota-prius/7789997037.html
carfax: see pdf (shows battery replaced; Jack says it wasn’t) service
records: see pdf

------------------------------------------------------------------------
