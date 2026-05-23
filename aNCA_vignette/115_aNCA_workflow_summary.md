---
name: 115_aNCA_workflow_summary.md
description: PK data lifecycle 
metadata:
  version: 0.001
  date: 21 May 2026
---
=======================================

## Intro

These are my notes. As such very imperfect with errors, gaps and
missing logic.

The original intent was to bridge the gap between 2 vignettes:
1. background.md
2. this document
3. manual.md

This document is to show high-level, CDISC aligned work-flow from raw data to final ADaM ready for TLG.

The second  section goes a little deeper ideas in the **implementation.**
A final section goes a little deeper into functions, tibbles.

The goal is to ease the transition to code-level and the manual.md

---

## The Core Data Pathway

The lifecycle of PK data follows a rigid, standardized progression: 

The clinical reporting pipeline is an ETL (Extract, Transform, Load) architecture divided strictly into Pre-SDTM and Post-SDTM phases.


## pre-SDTM

Raw Concentration Stream \ 
                          ---> [Custom R ETL Scripts] ---> SDTM PC Table & SDTM EX Table
Raw Dosing Stream        /


Pre-SDTM Mapping (Normalization & Standardization)
(TODO: Clean up!)


Data arrives as raw, unstructured database tables or flat files from
separate transactional systems. To get these to a valid CDISC SDTM
format, a clinical programmer must build custom R mapping scripts.

The Dosing Table Pipeline: Raw fields from the clinic's Electronic
Data Capture (EDC) system are mapped to the SDTM EX (Exposure)
domain.The Concentration Table Pipeline: Raw transactional fields from
the external Bioanalytical Lab are mapped to the SDTM PC
(Pharmacokinetic Concentrations) domain.

Primary & Composite Keys in SDTM PC Because clinical data is highly
denormalized, no single field guarantees row uniqueness. You must look
at the data through composite keys.

  The Business/Natural Composite Key: To uniquely identify a
concentration record under the official CDISC standard, you require a
composite key of:$$\{\text{STUDYID}, \text{USUBJID}, \text{PCTESTCD},
\text{PCCAT}, \text{PCVISITNUM}, \text{PCDTC}, \text{PCTPTNUM}\}$$

  The Surrogate Technical Key (PCSEQ): Real-world operational data can
capture duplicate timestamps (PCDTC). To guarantee absolute entity
integrity, CDISC enforces a dedicated surrogate sequence counter
field, PCSEQ. Therefore, the leanest guaranteed technical key for any
row in the table is:$$\{\text{USUBJID} + \text{PCSEQ}\}$$


$$\text{Raw Data} \longrightarrow \text{SDTM (PC/EX)} \longrightarrow \text{aNCA Engine} \longrightarrow \text{ADaM (ADPC/ADPP)}$$

* **Raw Data:** Consists of one and possibly two separate, messy streams: **Dosing** (from clinical sites) is required and **Concentrations** is optional (from bioanalytical labs).
* **SDTM:** The "Rosetta Stone" phase where a programmer maps those two streams into a uniform language using strict, standardized variables (e.g., `USUBJID`, `PCSEQ`).
* **ADaM:** The final "analysis-ready" structures (**ADPC** for concentrations/curves, **ADPP** for calculated macro-parameters like $C_{max}$ and $AUC$).

---


* **Who Maps Raw Data to SDTM?**
* `aNCA` does **not** touch raw data. The mapping to SDTM is done beforehand by a **Programmer** (user? , other pharmaverse packages?) using standard R/tidyverse tools, guided by a study specification document.


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
## post-SDTM


aNCA execution BEGINS entirely POST-SDTM. It cannot touch the raw data.

[Phase 2: Post-SDTM Mapping & Derivation]

SDTM PC & EX Tables ---> [aNCA Engine + Configuration Metadata] ---> ADaM ADPC & ADPP Tables

* **What `aNCA` Expects as Input:**
* `aNCA` expects the data to **already be in clean SDTM format** before it ever reads it. aNCA requires SDTM `PC` (concentrations) and optionally accepts SDTM `EX` (dosing).


* **The "Recipe" (Analysis Settings):**
*  The R code automates the *execution*, but the **Programmer** must supply the *rules*, for example *exclusions* (more later).  You must pass `aNCA` functions  your specific **Analysis Settings** (arguments/metadata) to tell it exactly how to handle BQL values, how to group profiles, and which PK parameters to calculate. (ex: Cmax)

---


(TODO: mapping SDTM -> ADaM colNames)
3. Phase 2: Post-SDTM Mapping to ADaM (Where aNCA Operates)The aNCA package acts strictly Post-SDTM. 

| Source SDTMColumn | Target ADaMColumn | TransformationType     | ConceptualPurpose                                                        |
|------------------|------------------|------------------------|--------------------------------------------------------------------------|
| PCORRES (Char)   | AVAL (Numeric)   | Type Cast / Imputation | Converts text strings to float values for math engines.                  |
| PCTESTCD (Char)  | PARAMCD (Char)   | System-wide Remap      | Converts a lab test code to an analysis parameter code.                  |
| PCDTC / EXSTDTC  | AFRLT (Numeric)  | Calculated Delta       | Computes Actual Relative Time from Analyte First Dose (tsample​−tdose​). |

It imports the valid SDTM tables and handles a complex mapping and derivation layer to generate CDISC ADaM (Analysis Data Model) datasets.


This step requires a complete schema migration where source variables are transformed, re-typed, and renamed into analysis-ready targets:

Source SDTM ColumnTarget ADaM ColumnTransformation TypeConceptual Purpose

Once `aNCA` package receives the SDTM data and your Analysis Settings, it alters the dataset by renaming variables (e.g., `PCORRES` $\rightarrow$ `AVAL`), imputing BQLs, and adding relative time columns. Its very first task is **Profile Grouping**:

* It isolates unique time-concentration curves.
* *Crucial Concept:* If the same patient returns for a second visit, `aNCA` treats this as a completely separate, independent PK profile (Curve 1 vs. Curve 2).

---

```text *
*Post-SDTM Phase (`aNCA` Territory):** The `aNCA` application begins execution *strictly* after this boundary. It reads the standardized input tables, blends them with an external configuration, and generates completely new relational analysis tables.

```

## The Rules Engine: Configuration Metadata

The `aNCA` R code executes transformations programmatically, but it lacks the logic to make study-specific data decisions on its own. The developer must supply these rules via a **Configuration Metadata Object** (instantiated as an R `list` object or a JSON configuration file read into the R session memory at runtime).

This metadata does not mix into the source tables; it acts as a look-up parameter matrix that dictates processing logic:

* **Data Partitioning Blueprint:** Instructs the R engine which columns to group by to build an independent time-concentration matrix (e.g., partition data by `USUBJID` + `PCVISITNUM` + `PCTESTCD`).
* **Imputation Logic Rules:** Contains explicit conditional mapping instructions for the math engine. For example: *“If a row contains `PCORRES == 'BQL'` AND the sample timestamp `PCDTC` is less than or equal to the dose timestamp `EXSTDTC`, mutate the numerical result to `0`. If it occurs after a valid numeric concentration, mutate it to `NA`.”*

Instead of being hardcoded, this is treated as a Configuration Metadata Object (or a settings file uploaded into the aNCA session).
Where it sits in the Data Flow

The metadata object acts as a side-car lookup parameter. It does not replace the source data; it is read simultaneously by aNCA processing functions to determine conditional branching logic during data processing.

SDTM PC Table --------> [ aNCA Engine ] --------> ADaM ADPC/ADPP Tables
                           ^
Configuration Metadata ----+ (Controls logic for BQL, Grouping keys, Slope rules)

What this Metadata contains:

    Imputation Rules (e.g., BLQ/BQL): Defines conditional value replacements. For example, if a record is flagged as Below the Limit of Quantification (BLQ), the metadata specifies whether the R engine mutates AVAL to 0, LOQ/2, or drops the record entirely based on timing.

    Partitioning/Grouping Keys: Tells the R script which column combinations constitute a distinct, isolated time-concentration curve (a single PK Profile). For example, it might instruct the engine to group by USUBJID + VISITNUM + PARAMCD. If a patient returns on Visit 2, the composite key changes, forcing the engine to instantiate a second, completely distinct profile group.

---

## Output Tables (ADaM Target Schema)

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

## Official Specification Blueprints

The core formatting rules, naming restrictions, and validation schemas used to govern these structural designs are fully documented in the following global clinical data registry standards:

* **Input Tables Validation Schema:** [CDISC SDTM Implementation Guide (SDTMIG)](https://www.cdisc.org/standards/foundational/sdtmig)
* **Output Tables Validation Schema:** [CDISC ADaM Implementation Guide (ADAMIG)](https://www.google.com/search?q=https://www.cdisc.org/standards/foundational/adamig)

```

For the exact data structures, column schemas, and validation constraints governing these transforms, the primary regulatory blueprints are:

    Pre-SDTM Mapping Rules: Formally documented in the Data Transfer Agreement (DTA) or the study-specific Data Specifications Document (Data Spec).

    Official CDISC Standards:

        To verify the structural rules of the input PC table, refer to the CDISC SDTM Implementation Guide (SDTMIG).

        To verify the structural rules of the output tables, refer to the CDISC ADaM Implementation Guide (ADAMIG).
