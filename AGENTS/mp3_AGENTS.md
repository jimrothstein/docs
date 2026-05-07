## Repo Structure
- Flat directory, no subdirectories. All files reside in root.
- Contains audio files (.mp3, .ogg, .ogx, .opus) and R script `audio_files_analysis.R`.

## Dependencies
- R script requires tidyverse packages: `tibble`, `dplyr`, `stringr`. Install via `install.packages("tidyverse")` if missing.

## Commands
- Run R analysis script: `Rscript audio_files_analysis.R`

## File Naming
- Most audio files start with 4-digit numeric prefixes (e.g., `2506__NA_ABBE_LANE...ogg`).
- Some include date suffixes (e.g., `_2021-10-27_`).
- A few files lack extensions.
