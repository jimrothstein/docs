---
name: 115_aNCA_workflow_summary.md
description: PK data lifecycle 
metadata:
  version: 0.001
  date: 21 May 2026
---
=======================================
This document is high-level conceptual summary that highlight the core workflow. 
A second  section reviews the ideas in the **implementation.**
A final section works some of functions, tibbles.

---

## 1. The Core Data Pathway

The lifecycle of PK data follows a rigid, standardized progression:


$$\text{Raw Data} \longrightarrow \text{SDTM (PC/EX)} \longrightarrow \text{aNCA Engine} \longrightarrow \text{ADaM (ADPC/ADPP)}$$

* **Raw Data:** Consists of one and possibly two separate, messy streams: **Dosing** (from clinical sites) is required and **Concentrations** is optional (from bioanalytical labs).
* **SDTM:** The "Rosetta Stone" phase where a programmer maps those two streams into a uniform language using strict, standardized variables (e.g., `USUBJID`, `PCSEQ`).
* **ADaM:** The final "analysis-ready" structures (**ADPC** for concentrations/curves, **ADPP** for calculated macro-parameters like $C_{max}$ and $AUC$).

---

## 2. Key Clarifications & Corrections

During our conversation, we sharpened a few critical concepts where the real-world software design differs from initial assumptions:

* **Who Maps Raw Data to SDTM?**
* `aNCA` does **not** touch raw data. The mapping to SDTM is done beforehand by a **Programmer** (user? , other pharmaverse packages?) using standard R/tidyverse tools, guided by a study specification document.


* **What `aNCA` Expects as Input:**
* `aNCA` expects the data to **already be in clean SDTM format** before it ever reads it. aNCA requires SDTM `PC` (concentrations) and optionally accepts SDTM `EX` (dosing).


* **The "Recipe" (Analysis Settings):**
*  The R code automates the *execution*, but the **Programmer** must supply the *rules*, for example *exclusions* (more later).  You must pass `aNCA` functions  your specific **Analysis Settings** (arguments/metadata) to tell it exactly how to handle BQL values, how to group profiles, and which PK parameters to calculate. (ex: Cmax)

### Table A: SDTM PC (Pharmacokinetic Concentrations)
This table acts as a time-series log tracking drug levels found in blood samples. 

* **Natural Composite Key:** `STUDYID` + `USUBJID` + `PCTESTCD` + `PCCAT` + `PCVISITNUM` + `PCDTC` + `PCTPTNUM`
* **Technical Surrogate Key:** `USUBJID` + `PCSEQ` (Where `PCSEQ` is a sequential auto-incrementing integer starting at 1 for each unique subject).

```text
# Conceptual Example of a Clean SDTM PC Dataset
  STUDYID   USUBJID    PCTESTCD  PCORRES  PCORRESU  PCVISITNUM  PCDTC             PCSEQ
1 PROT-001  SUBJ-101   DRUG-X    BQL      ng/mL              1  2026-10-12T08:15      1
2 PROT-001  SUBJ-101   DRUG-X    10.5     ng/mL              1  2026-10-12T09:15      2
3 PROT-001  SUBJ-101   DRUG-X    45.2     ng/mL              1  2026-10-12T10:15      3
4 PROT-001  SUBJ-101   DRUG-X    22.1     ng/mL              1  2026-10-12T12:15      4
5 PROT-001  SUBJ-101   DRUG-X    5.3      ng/mL              1  2026-10-12T16:15      5

(Note: `BQL` stands for Below the Quantifiable Limit—it means the lab instrument detected the drug but it was too low to measure as a clean float value.)

```
`aNCA` expects to find its source data stored in two standardized tables defined by the CDISC SDTM framework. Because a clinical database is wide and flat rather than fully normalized, unique rows are enforced using composite natural keys or a dedicated technical surrogate key.


### Table B: SDTM EX (Exposure / Dosing) - *Optional*

This table tracks exactly when a physical dose of the drug was administered to the patient.

* **Technical Surrogate Key:** `USUBJID` + `EXSEQ`

```text
# Conceptual Example of an SDTM EX Dataset
  STUDYID   USUBJID    EXTRT     EXDOSE  EXDOSU  EXSTDTC           EXSEQ
1 PROT-001  SUBJ-101   DRUG-X       100  mg      2026-10-12T08:15      1
2 PROT-001  SUBJ-102   DRUG-X       100  mg      2026-10-12T08:30      1

```

---

## 3. What Happens Inside `aNCA` (The First Steps)

(TODO: mapping SDTM -> ADaM colNames)
Once `aNCA` package receives the SDTM data and your Analysis Settings, it alters the dataset by renaming variables (e.g., `PCORRES` $\rightarrow$ `AVAL`), imputing BQLs, and adding relative time columns. Its very first task is **Profile Grouping**:

* It isolates unique time-concentration curves.
* *Crucial Concept:* If the same patient returns for a second visit, `aNCA` treats this as a completely separate, independent PK profile (Curve 1 vs. Curve 2).

---

========================================
```text *
*Post-SDTM Phase (`aNCA` Territory):** The `aNCA` application begins execution *strictly* after this boundary. It reads the standardized input tables, blends them with an external configuration, and generates completely new relational analysis tables.

---

## 2. Phase 1: Input Tables (Post-SDTM State)

```

---

## 3. The Rules Engine: Configuration Metadata

The `aNCA` R code executes transformations programmatically, but it lacks the logic to make study-specific data decisions on its own. The developer must supply these rules via a **Configuration Metadata Object** (instantiated as an R `list` object or a JSON configuration file read into the R session memory at runtime).

This metadata does not mix into the source tables; it acts as a look-up parameter matrix that dictates processing logic:
j
* **Data Partitioning Blueprint:** Instructs the R engine which columns to group by to build an independent time-concentration matrix (e.g., partition data by `USUBJID` + `PCVISITNUM` + `PCTESTCD`).
* **Imputation Logic Rules:** Contains explicit conditional mapping instructions for the math engine. For example: *“If a row contains `PCORRES == 'BQL'` AND the sample timestamp `PCDTC` is less than or equal to the dose timestamp `EXSTDTC`, mutate the numerical result to `0`. If it occurs after a valid numeric concentration, mutate it to `NA`.”*

---

## 4. Phase 2: Output Tables (ADaM Target Schema)

By executing the `aNCA` processing functions, the R engine performs a schema migration, mutating and renaming fields to conform to CDISC ADaM standards.

The two primary target tables generated are:

### Table 1: ADPC (Analysis Dataset PK Concentrations)

This is an altered, enhanced clone of the input concentration data. Text fields are cast to numeric floats, non-numeric strings are imputed, and absolute date-timestamps are calculated into relative numeric intervals.

* **`PCORRES` (Character)** is converted and renamed to **`AVAL` (Numeric)**.
* **`PCTESTCD` (Character)** is converted and renamed to **`PARAMCD` (Character)**.
* The delta between `PCDTC` and `EXSTDTC` is calculated to create a new numeric time elapsed variable, **`AFRLT`** (Actual Relative Time).

```text
# Conceptual Example of a Generated ADPC Table
  USUBJID    PARAMCD   AVAL  AVALU  AFRLT  VISITNUM
1 SUBJ-101   DRUG-X     0.0  ng/mL   0.0          1  <-- Imputed BQL to 0.0
2 SUBJ-101   DRUG-X    10.5  ng/mL   1.0          1  <-- Calculated 1 hour post-dose
3 SUBJ-101   DRUG-X    45.2  ng/mL   2.0          1
4 SUBJ-101   DRUG-X    22.1  ng/mL   4.0          1
5 SUBJ-101   DRUG-X     5.3  ng/mL   8.0          1

```

### Table 2: ADPP / ADNCA (Analysis Dataset PK Parameters)

This table stores the final summarized results calculated across an entire partitioned data group. Instead of representing individual blood draws over a timeline, it aggregates a single profile partition down to **one unique summary row per parameter, per patient profile**.

* **Technical Surrogate Key:** `USUBJID` + `PARAMCD` + `PPSEQ`

```text
# Conceptual Example of a Generated ADPP Summary Table
  USUBJID    PARAMCD   PARAM                      AVAL  AVALU  VISITNUM
1 SUBJ-101   CMAX      Max Concentration          45.2  ng/mL         1
2 SUBJ-101   TMAX      Time of Max Conc            2.0  hr            1
3 SUBJ-101   AUCALL    Area Under the Curve      185.4  h*ng/mL       1

```

---

## 5. Official Specification Blueprints

The core formatting rules, naming restrictions, and validation schemas used to govern these structural designs are fully documented in the following global clinical data registry standards:

* **Input Tables Validation Schema:** [CDISC SDTM Implementation Guide (SDTMIG)](https://www.cdisc.org/standards/foundational/sdtmig)
* **Output Tables Validation Schema:** [CDISC ADaM Implementation Guide (ADAMIG)](https://www.google.com/search?q=https://www.cdisc.org/standards/foundational/adamig)

```

```
