---
Title: Git Commands
Topic: git
Updated: 2026-11-08
Sources: tech_notes (in-place notes, undated)
Raw: [110_simple_cheat.md](../../tech_notes/110_simple_cheat.md)
---

# Git Commands

Everyday git recipes from the cheat-sheet notes: rebase and squash, amend-and-force-push when history is already public, file recovery without detached-HEAD surprises, diff variants (local vs remote), pull-conflict recovery, log recipes, and .gitignore hygiene. The notes' one hard rule: `git reset` — "NO, do not use"; use `git restore` instead.

## Rebase and squash

Simple rebase — moves commits from `dev` after HEAD of `main`:

```sh
git rebase main
```

Show gitconfig: `git config list`.

Squash with interactive rebase: mark the commit *after which* nothing should change, i.e. `<after-this-commit>` — "This <SHA> will not change":

```sh
git rebase -i <after-this-commit>
```

For every pick except the final one, change the verb `pick` → `s`.

## Amend a pushed commit

"If pushed: CHANGE Last commit, keep same msg, must force":

```sh
git add
git commit --amend -C HEAD
git push -f
```

## Restore files to an earlier state

```sh
git checkout <SHA> -- <file>   # restores <file> as it was at <SHA>
git checkout <SHA>             # detached HEAD; git checkout - to return
git show <commit>:<file>       # no detached HEAD, just prints file content
```

Sequence from the notes: (1) `git checkout master` — now on branch 'master'; (2) `git checkout master~2 Makefile` — replace Makefile with the version 2 commits back; `rm -f hello.c` (accidental delete); (3) `git checkout hello.c` — recover the lost file.

## Check-ignore and .gitignore

```sh
git check-ignore **/*
git check-ignore -v <path-to-file>   # lists ignored file, plus line in .gitignore
```

- `.gitkeep` — git does not allow empty dirs; by convention `.gitkeep` is the placeholder in an empty dir.
- `~/.gitignore` — global, plus per-repo `.gitignore`.
- `git update-index --skip-worktree <file>` — (as of 2024) way to remove a file from the index (do not update).

## diff

```sh
git diff                        # green shows CHANGES, if you COMMIT
git diff HEAD                   # changes in working dir since last commit
git diff HEAD~ HEAD             # last commit vs one prior (add = green, delete = orange)
git diff HEAD --unified=0       # only lines deleted/added since last commit
git diff <oldest> <newest>
git diff HEAD~ HEAD -- <file>   # recent change to one file
```

Local vs remote:

```sh
git fetch                       # makes no changes locally, safe
git diff main origin/main
git diff <br> origin/<br>
```

## Pull gives errors

1. abort
2. fix, then try: `git diff <my-local-br> origin/<remote-br>` (my-local-br may be "main")
3. pull again

## log

`git log [ opts ] [revision-range] [--] <path>` (see SIC 2.3 REF):

```sh
git log -p -2                        # last 2 commits
git log --pretty=format:'%h_ %AM'    # sha, name
git log --relative-date
git log --oneline -5                 # terse
git log --since=2.weeks
git log --until
```

Range notation: `origin..HEAD` — after origin, before HEAD; `HEAD ^origin` — same.

## See Also

- [Simple CLI cheat sheet](../tools/simple-cli-cheatsheet.md)
