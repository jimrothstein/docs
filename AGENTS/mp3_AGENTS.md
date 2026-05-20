# GOAL:   list all audio files. 

## Directories
Audio files are located here:
- ~/mp3_latest_downloads
- ~/mp3_old_downloads

Store all *.R files and anything related:
- ~/code/try_things_here


## Tools
Use R language.   Use tidyverse where useful. 
Use R scripts (Rscript ...), which may be run from command line.

As needed, R script requires tidyverse packages: `tibble`, `dplyr`, `stringr`. Install via `install.packages("tidyverse")` only if missing.

## NEVER

Use bash or zsh script files

## Output
An Rscript file (*.R) called audio_files_list.R: that runs from command line and saves all audio files in a tibble.


STOP - do not READ.
END.

## Repo Structure
- Flat directory, no subdirectories. All files reside in root.
- Contains audio files (.mp3, .ogg, .ogx, .opus) and R script `audio_files_analysis.R`.



## Commands
- Run R analysis script: `Rscript audio_files_analysis.R`


## Steps
### Step #1
- run R code to obtain tibble (with dim = n x 1, n is number of rows).

- write R function "remove_prefix" that reads an 
- modify this tibble to add one column, "revision1" (check:  dim = n x 2)
- if the file name begins with 4,5 or 6 digits followed by "_", remove it  
- (examples to remove:    ^1234_ ^99999_, 
- (do NOT remove A1234_ 99999my_name_is)

## File Naming
- Most audio files start with 4-digit numeric prefixes (e.g., `2506__NA_ABBE_LANE...ogg`).
- Some include date suffixes (e.g., `_2021-10-27_`).
- A few files lack extensions.
