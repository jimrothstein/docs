jim
2025-07-06

*“Drop a goat exactly equidistant between 2 identical stacks of hay. The
goat has no problem selecting one. A human in similar situation would
starve” * -unknown

### admiral_verify_templates.R

### Today’s Objectives

    Understand status of ongoing work
    Clarify what is yet to be done
    Identify and MVP to merge in and test out with the full team.
    Decide whether to do this in one of the original PRs or start fresh.

### Useful Code Links

older PR: <https://github.com/pharmaverse/admiral/pull/2662>  
newer PR: <https://github.com/pharmaverse/admiral/pull/2773>

latest GHA workflow:
<https://github.com/pharmaverse/admiral/blob/feedback_template_verification/.github/workflows/verify_templates_experimental.yml>

create_adams_data.R (re-generate and save ADaMs by calling each
template)
<https://github.com/pharmaverse/pharmaverseadam/blob/main/data-raw/create_adams_data.R>

### Status - overall

The script does run and produce output, as does the GHA workflow. But it
remains rough with a number of lingering issues.

Stefan has been extremely helpful but his availability is limited.

I list several types of issues below. But the real problem, IMHO, is I
have trouble with fork in the road (Choose to code this way? or that?
Select default behavior? Re-write this function or live with it?)  
A shortcoming , yes, but it slows me down. In other words, possible to
have brief, more frequent discussions re: decisions.

Also, helpful:

Itemize and prioritize todo/specification list, before coding?
Standardize (example: use cli\_\*, less paste0 ?)

### Background

Because of overlap, the R file admiral_verify_templates.R inherited some
code from create_adams_data.R (in pharmaverseadam)

However, I had hoped to “improve” the pharamaverseadam code by
documenting and/or simplifying some of the code, especially where there
is overlap.

This is still a `to do`.

### Script Usage?

Pls clarify - Triggers to run GHA? (branch, PR) - Will developer modify
template and then run interactively?

### intermediate files

NOW: Intermediate files are now stored in several temporary `tempdir()`
R directories and therefore disappear when code ends.  
This makes debugging a little more difficult. Also USER running this
interactively clobbers results of previous run.

Proposed: Store intermediate results in permanent directories. Cleanup
after run. Allow user to aluse the cleanup.

### Related - Use tibble, not lists

Currently, using several names lists (for each ADaM, list for templates,
another for dir, …) Confusing.

Example:

    #' Directories used to find files:

    #'  cache_dir
    #'  diff_dir
    #'  tempdir()
    #'  template_dir  location of template R files (inst/templates)
    #'  adam_new_dir (aka tempdir() or cache_dir ):  after running, templates place new ADaMs here
    #'  adam_old_dir : ADaMs downloaded from pharamverseadam

    #' Named vectors/lists, use adam_name to name
    #'
    #'  adam_names (named character vector)
    #'  path  (named list)
    #'  keys  (named list)
    #'  obj   (named list)
    #'  templates (named list)

REF:
<https://github.com/pharmaverse/admiral/blob/55c003ddb2fbcda6321795e45411131e185520de/data-raw/admiral_verify_templates.R#L16-L23>

Propose Use tibble as lookup. One row for each ADaM, columns for
location of each template, directories etc. Populate as exact strings,
constructed ONCE?

### USE RDS, not RDA?

\`load(dataset) puts symbol in environment. Need a few lines of code to
get actual databbase.

non-intuitive example (to me):
<https://github.com/pharmaverse/pharmaverseadam/blob/db39a719c3b1ddc10d3529bb76c72afbc402a50e/data-raw/create_adams_data.R#L39-L42>

better?

``` r
save(mtcars, file="mt.rda")
f  <- function() { get(load("mt.rda"))}
f() |> head(n=3)
```

.rda files are used in templates and put into user’s cache dir (os
dependent)
<https://github.com/pharmaverse/admiral/blob/9052fc30be418214002574c4cc4994e15f5a8577/inst/templates/ad_adae.R#L149-L157>

Propose: Can we use RDS?

### GHA workflows

- When should GHA workflow should trigger? Branch, event?

- Speed things up? Use of docker image for R? (I use `act` when I can)

- all .rda files, only changed rda?
  <https://github.com/pharmaverse/admiral/pull/2773#issuecomment-3000031760>

To pin down exact rda file changes, I am working through things like:

    git diff HEAD~ HEAD --name-only

    # and
    git diff --exit-code ...
    echo $?    # 0 = no difference   1 = difference


    echo "--- Files changed (names only) ---"
    git diff --name-only ${{ github.event.before }} ${{ github.sha }}

### Unit tests

Needs unit tests. And more feedback from USER.

### diffdf

- diffdf uses key fields, if provided, or guesses. Uses quess.
- Hard to insert emoji; Eli’s work embeds diffdf in quarto file

Use of key fields; removed

### Minor Issues, code checks?

    - <https://github.com/pharmaverse/admiral/pull/2773#discussion_r2159570703>
