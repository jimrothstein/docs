---
Title: Zsh configuration notes
Topic: tools
Updated: 2026-11-09
Sources: tech_notes (in-place notes, undated)
Raw: [tech_notes/300_tech_notes.qmd](../../tech_notes/300_tech_notes.qmd)
---

# Zsh configuration notes

References kept in the notes: ref card (bash2zsh.com/zsh_refcard), the zsh manual (zsh.sourceforge.io/Doc/Release/), the ZSH Guide (2003, Stephenson), the FAQ (2010), and "Lots of simple GLOB examples" at reasoniamhere.com. Config files: `~/dotfiles/.zshrc`, `~/dotfiles/.zshenv`. Debug: `zsh -x *.sh` (prints line then executes); script header `#!/bin/zsh -xv` (verbose).

## Widgets and bindkey

Widgets correspond to commands, often with a shortcut. Notation: `'\e'` = <ESC>, `'^['` also <ESC>; vim-style `<C-A>`, `<ALT-B>`.

- `bindkey '^k' kill-line` — bind shortcut to existing widget.
- `bindkey '\eb'` → backward-word (ESC-b, aka M-b, back one word); `'\ef'` forward-word; `'^a'` beginning-of-line.
- `zle -al` — list widgets (~403 commands on the notes' machine). Keymaps = collection of shortcuts; `bindkey -l` lists them.
- To see a mapping: (1) `cat` <CR>, type the key, <C-C> ends; or (2) <C-V>, type the key.
- Invoke a widget: press its shortcut, or `zle <widget>`.

## Glob vs extended-glob (Guide 5.9.7)

```zsh
ll demo/**/*.txt              # any depth
ls -l demo/**/*<1-10>.txt
ls -l demo/**/[a]*.txt        # begins with 'a'
ls -l demo/**/[^cC]*.txt      # does not begin with 'c' or 'C'
print -l **/*(/)              # just dirs (recurse)
print -l **/*(.)              # just files (recurse)
ls -ldh demo/**/*(DOL[1,6])   # 6 largest files
```

grep vs ls+glob: **grep** finds words matching a pattern and returns file names of matches; **ls (+ glob) finds filenames** matching a pattern — very different. Example: `print -l ~/code/**/*.(R|Rmd)` — any level, all .R and .Rmd files.

## Parameter expansion

- `${var/old/new}` — replace first; `${var//old/new}` — all.
- `${f#*.}` → `x.y` where f = file.x.y (remove left, non-greedy); `${f##*.}` → `y` (greedy, remove all left).

## Permissions

u g o (owner / in group / others); r=4, w=2, x=1. `chmod 700` → rwx --- ---; "public" 644 → rw- r-- r--; "private" 600 → rw- --- ---.

## printf

`printf "%05d\n" ${x}` — digit, padded to 5. (R equivalent: sprintf.)

## zstyle, completion, VCS_INFO

`zstyle <pattern> <style> <values>` — "NOT so OBVIOUS"; if match, apply the style. Patterns like `':completion:*:*:cp:'` or `':completion:*'`; general form `:completion:<fun>:<complete>:<command>:<arguments>:<tag>`. *VCS_INFO* is a function that populates variables (e.g. prompt) retrieved from the VCS, i.e. git. *precmd* is a hook function that runs before the zsh prompt.

## sudo vs su

- `sudo cmd` — `last ~ 15'` (temporary use of root privileges); "asks for user's password"; "allows root 'privileges'" — the home directory, path etc remains that of the user.
- `su - root`, `sudo su`, `sudo su -` — all change to root user with root env (use `exit` to leave); plain `su jim` changes to user 'jim'.
- Shells: login or non-login; non-login has two flavors — interactive (user at CLI) and non-interactive (a subshell for scripts).

## Misc commands

```sh
find . ! -name '*.txt' -type f -exec rm -f {} +   # delete all EXCEPT txt
find . -name '*.txt' -type f -exec rm -i {} ;     # ask before removing
ls -l ~/.config/emacs/bin/doom ~/.emacs.d/bin/doom 2>/dev/null
```

## See Also

- [Simple CLI cheat sheet](simple-cli-cheatsheet.md)
- [Regex notes (grep -P, R)](regex-notes.md)
