# NCA Parameter Imputation Rules

## Overview

Imputation rules (start concentration and BLQ handling) are applied during interval creation in `update_main_intervals()`. The appropriate imputation method is selected based on:

- Dose characteristics (route, duration, metabolite status)
- Data availability (pre-dose concentrations, post-dose concentrations for log-linear regression)

## Which Parameters Get Imputation?

The key question is: **Does this parameter depend on AUC or AUMC?**

### Parameters that DO NOT get imputation
These are purely observational — they come directly from measured concentrations:

| Parameter | Description |
|-----------|-------------|
| `cmax` | Maximum observed concentration |
| `tmax` | Time of CMAX |
| `auclast` | AUC to last non-zero concentration |
| `clast.obs` | Last observed concentration |
| `clast.pred` | Predicted last concentration |
| `cmin` | Minimum concentration |
| `cstart` | Predose concentration |
| `ctrough` | Trough concentration |
| `tfirst` | Time of first concentration above LOQ |
| `tlast` | Time of last non-zero concentration |
| `tlag` | Lag time |
| `half.life` | Terminal half-life (depends on tmax, tlast) |
| `lambda.z` | Elimination rate |
| `r.squared` | R² of half-life fit |
| `adj.r.squared` | Adjusted R² of half-life fit |
| `span.ratio` | Half-life span ratio |
| `vz.obs`, `vz.pred` | Volume of distribution |
| `vss.obs`, `vss.pred` | Steady-state volume |
| `cmax.dn`, `clast.obs.dn` | Dose-normalized concentrations |

### Parameters that DO get imputation
These depend on AUC or AUMC and may require extrapolation to infinity:

| Parameter | Description |
|-----------|-------------|
| `aucinf.obs` | AUC to infinity (observed Clast) |
| `aucinf.pred` | AUC to infinity (predicted Clast) |
| `aucall` | AUC all (including triangle) |
| `aucint.last` | AUC from T1 to T2 |
| All `auc*` variants | Any AUC parameter |
| All `aumc*` parameters | Area under moment curve |
| `cl.last`, `cl.obs`, `cl.pred` | Clearance (depends on AUC) |
| `cav`, `cav.dn` | Average concentration (depends on AUC) |
| `cavg`, `cavg.dn` | Average concentration |
| All MRT parameters | Mean residence time |
| All KEL parameters | Elimination rate constants |
| `swing` | Swing (depends on cmax, cmin) |
| `deg.fluc` | Degree of fluctuation |
| `ptr` | Peak-to-trough ratio |

## Implementation in aNCA

In `R/intervals.R`, the function `rm_impute_obs_params()` handles this:

```r
# Parameters that depend on AUC or AUMC
params_auc_dep <- metadata_nca_parameters %>%
  filter(grepl("auc|aumc", PKNCA) | grepl("auc", Depends)) %>%
  pull(PKNCA)

# Parameters NOT to impute: everything except AUC-dependent parameters
params_not_to_impute <- metadata_nca_parameters %>%
  filter(
    !grepl("auc|aumc", PKNCA),
    !grepl(paste0(params_auc_dep, collapse = "|"), Depends)
  ) %>%
  pull(PKNCA)
```

## Imputation Methods Available

PKNCA provides three imputation methods:

1. **`start_conc0`** — Set pre-dose concentration to 0
2. **`start_predose`** — Move pre-dose sample to time 0
3. **`start_cmin`** — Use minimum concentration as start

These are applied via the `impute` column in the PKNCAdata object.
