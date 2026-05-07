// Time-stamp: <Last changed 2026-04-25 20:58:19 by jim>

#set heading(numbering: "1.")
#set text(
  font: "New Computer Modern"
)

= Learning aNCA

Regarding learning it depends on what you want. For ratio calculations is something so specific that there is nothing about because it cannot get very extended, but if you have specific questions let me know and I can try my best on that!

For other more general topics regarding this repo I would recommend checking our website, there you can find about:

    NCA basic concepts. Here you can find the most basic theory behind Non Compartmental Analysis

    Design & Architecture. This can give you a better perspective on how our R package (which is indeed also a ShinyApp) is structured

Other pages:

    PKNCA website. This is the package that we use in the background for all calculations. Unfortunately their website is very focussed on how to use PKNCA, and not so much on the concepts behind NCA. But maybe can be useful.  Video:  https://www.youtube.com/watch?v=dSnMlLvnnbA&list=PLbcglKxZP5PPBplKMO9obNAjLIM7GGfp4&index=1&t=2443s


    ADNCA - CDISC guideline. CDISC has some guidelines explaining the format expected for ADNCA, which is the input that our App uses. For some people like me is easier to understand the concepts once you grab how the data is structured, so here you have it.

I've checked many websites and books on the Internet myself, but if I am honest with you nothing that I would highly recommend based on my experience 😅

= aNCA
Let me give you more context. When we do [*Non-Compartmental Analysis (NCA)*], our purpose is to characterize some drug properties by calculating what are called pharmacokinetic parameters (PP). These PPs CDISC mandates to collect them in a standard dataset format (called SDTM.PP or PP in short). This format specifies what standard names (PPTEST) or code names (PPTESTCD) should they have. Our whole list of PPs can be found with their descriptions in metadata_nca_parameters.csv

== Design PKNCA::

Summary of package, structure ...
Goal:  Understand 
https://github.com/humanpred/pknca/tree/main/design
== Ratio Parameters

Ratio Parameters are a special kind of PPs, because they are derived by dividing some PPs (like CMAX) with others. Their general purpose is to have a measure that somehow compare the behavior of the drug under different circumstances. So in order to specify those circumstances, you need to tell the App what groups will be used as the test (fraction nominator) or the reference (fraction denominator) of the ratio calculation. To understand better the function I also recommend you to run the App, map data and then go the NCA tab at left and find the collapsible for Parameter ratios. There you will find a help button (icon ?) that explains better how the operation is done. It will also probably give you more understanding on why we have these arguments for the function.



== ADNCA

    Also, you mentioned SDTM. In Admiral, the process is about moving from SDTM to ADAM. aNCA uses SDTM?

Not exactly. Right now aNCA uses ADNCA as an input. ADNCA is a specific kind of ADAM that is the result of combining SDTM.PC, SDTM.DM & SDTM.DM information. We use it to calculate the Pharmacokinetic Parameters (SDTM.PP) of the drug based on the analysis specifications done in ADNCA and through the App
title: "suggestions.md to improve background.md "
format: html
---

as of 25 APR 2026

 DRAFT 

link to background.Rmd (https://github.com/pharmaverse/aNCA/blob/main/vignettes/background.Rmd)
link to manual.Rmd (https://github.com/pharmaverse/aNCA/blob/main/vignettes/manual.Rmd)
## Contents
* Purpose
* Audience
* Set goals
* Proposed Changes (long list)
* Links for more Info
* Notes, TODOs  (not well-organized)

## PURPOSE
The goal is improve the document "What is NCA?" (background.md).   The purpose this document,  **suggestions.md**,  is to collect suggestions, ideas, snippets of code that might improve or extend the vignette "What is aNCA?" in the file **background.rmd**.  **suggestions.md** exisits only on branch [#1247](https://github.com/pharmaverse/aNCA/issues/1247) in the directory **inst/** and will be removed before final merge to main.

Specifically, @Gero1999 (or anyone else) is encouraged to comment or review **suggestions.md** before changes are made to the actual vignette 

@jimrothstein (jim) will keep **suggestions.md** up-to-date by including the various comments from others.  The idea is to come to  general agreement **before** making major changes to the vignette.  Of course, nothing is ever final but hopefully this approach will make process as simple as possible.

## AUDIENCE?
Is document for  a new developer?   For the user of the package **aNCA** ?   Someone else?

I would like to write so useful to someone like me.   Familar with R, but new to pharmacokinetics (PK) , CDISC standards and the functions of aNCA package.  This person wants  to contribute to the codebase, ie a new developer.


## INITIAL  THOUGHTS
As it stands now, the vignette "What is NCA?" is good.   The big issue, as I see it, is how aNCA and PKNCA packages implement the process and align with CDISC standards.   So before reading manual.md. I think a bit of supplemental material could fit int.   For example,
* a sketch of data flows through aNCA, 
* more comments/explanations where CDISC standards apply, 
* links to a "cheat sheet" for variables, for example (https://github.com/humanpred/pknca/blob/ee1b433a0efcf102f4ec5260a1e3b39803ba26b2/design/01-architecture.md)
* understanding ADNCA format means 
* videos:   
  Then manual.Rmd can proceed to more details.
  * This is excellent video:   Appilson, 5/29/25,   (https://www.youtube.com/watch?v=hvVS80I6s_U) (if accents are new to you, set playback speed to 0.80)
* CDISC, BSD standards  https://www.youtube.com/watch?v=rjSi4F1eZYQ&list=PLJEUlD4Y7xnn5T4mCCCKXv1ofIY8D2G6v&index=1
* Official CDISC/NcA    https://www.cdisc.org/system/files/members/standard/foundational/ADaMIG_for_Non-compartmental_Analysis_Input_Data_v1.0_1.pdf
## Not a Book (LOL) :smile:
"What is NCA?" should be as short as possible, and definitely not lengthy.  Instead, the vignette should offer links where the reader can find more detailed information.  

It seems the entire clinical trials industry is filled with dataset words that I find difficult to follow when learning the code base.  The basic ideas of concentration, time, doses do not seem difficult.   So I propose to have many simple examples as possible so the reader gains confidence.  

Please see LLM chat (below)

## Links for more info
* Basic pharmakinetics 1 Paths of drug through body (https://www.youtube.com/watch?v=WCmFrheYtcc ) 

* Basic pharmakinetics 2 - How choice of route affects NCA parameters https://www.youtube.com/watch?v=WCmFrheYtcc 

* Info on ADNCA Standard (https://pharmasug.org/proceedings/2024/DS/PharmaSUG-2024-DS-406.pdf)

* Using GUI (app) from aNCA package https://youtu.be/RW1zbnDkTCM?si=wvFsSfBHwbq_SC9Z 


*video (2016) - Bill P introduces PKNCA package & process  (https://www.youtube.com/watch?v=WCmFrheYtcc)


Mostly Admiral pk functions, but beginning explains nominal vs actual time, other measures of time hhttps://youtu.be/70tqe60aL1w?si=5uH3g3h2zelRt3Pd 

Data Flow
aNCA - metadata (adnca example)  https://github.com/pharmaverse/aNCA/blob/main/R/data.R 
User data (data.frame)
    │
    ├── PKNCAconc()  ──── validates, stores concentration data + metadata
    ├── PKNCAdose()  ──── validates, stores dose data + metadata
    │
    └── PKNCAdata()  ──── combines conc + dose, generates intervals
            │
            └── pk.nca()  ──── orchestrates all parameter calculations
                    │            (R/pk.calc.all.R)
                    │
                    └── PKNCAresults  ──── long-format results
                            │
                            └── summary()  ──── formatted wide table

## NEXT?


<hr>


## WIP (not yet organized)

## Big List for Discussion ...
Possible inclusions?
- link to official CDISC documentation (https://www.cdisc.org/system/files/members/standard/foundational/ADaMIG_for_Non-compartmental_Analysis_Input_Data_v1.0_1.pdf)
- ADNCA format ( explain,  show trival example, ~ 5 rows, example or two in codebase)
- (related?) link to `admiral` https://pharmaverse.github.io/admiral/articles/pk_adnca.html
- edit chat with Gemini (below) 
- much, much more
- LLM chat shows very simple ADNCA example.  What is more realistic example in the code base?
adnca_example  is 1308 x 33 dataset 

> names(adnca_example)
 [1] "STUDYID"  "USUBJID"  "PCSPEC"   "PARAM"    "METABFL"  "AFRLT"    "NFRLT"    "ARRLT"    "NRRLT"   
[10] "TRTRINT"  "RRLTU"    "AVAL"     "AVALU"    "VOLUME"   "VOLUMEU"  "DOSETRT"  "TRT01A"   "DOSEA"   
[19] "DOSEU"    "ROUTE"    "ADOSEDUR" "ATPTREF"  "AGE"      "AGEU"     "RACE"     "SEX"      "NCA1XRS" 
[28] "NCA2XRS"  "NEFRLT"   "NERRLT"   "AEFRLT"   "AERRLT"   "DOSFRM"  

## Initial Chat with Gemini LLM (unedited, if reader wants "more information link to list)
 Gemini
**ADNCA Format for NCA Analysis**
Conversation with Gemini

**Please explain ADNCA format in non-compartmental analysis (NCA). Give simiple example of a dataset in ADNCA format. No more than 5 rows.**

>In the world of clinical data standards, specifically CDISC ADaM, the ADNCA (Analysis Data for Non-Compartmental Analysis) dataset serves as the bridge between raw concentration-time data and the final calculated PK parameters (like Cmax​ or AUC).

> Its primary purpose is to organize clinical trial data into a structure that NCA software (like WinNonlin or R packages like nca) can ingest to perform calculations.

>Key Characteristics of ADNCA

>    One Record per Timepoint: Each row represents a single blood draw or observation for a specific subject at a specific time.

>   Traceability: It maintains a clear link back to the source SDTM datasets (usually PC for Pharmacokinetics Concentrations and EX for Exposure).

>    Ready for Calculation: It includes "Analysis" variables (prefixed with A) that have been cleaned—for example, handling values below the limit of quantification (BLQ) or converting actual sampling times into relative time from dose.

>Simple Example: ADNCA Dataset

>Below is a simplified example showing a single subject receiving a single dose.

USUBJID	   EXTRT	ATIME	AVAL	AVALU	AVALCAT1
-------    ----     ----    ----    ----    --------
| 001-01 | Drug X	| 0	   |  0	     | ng/mL	BLQ
| 001-01 | Drug X	| 0.5  |12.5	 | ng/mL	Analyzed
| 001-01 | Drug X	| 1.0  |	25.2 |	ng/mL	Analyzed
| 001-01	Drug X	|2.0   | 18.7	    ng/mL	Analyzed
| 001-01	Drug X	|4.0   |	8.3	    ng/mL	Analyzed

>Core Variables Explained

>    USUBJID: Unique Subject Identifier.

>    EXTRT: The treatment/drug name.

>    ATIME (Analysis Time): The relative time from the dose (e.g., hours). This is crucial for calculating the area under the curve (AUC).

>    VAL (Analysis Value): The numerical concentration result used for the math.

>    AVALU: The unit for the concentration (e.g., ng/mL).

>    AVALCAT1: Often used to flag values like "BLQ" (Below Limit of Quantitation), which tells the software whether to treat the value as zero or missing.

**Where did you find "ATIME", "AVAL" as core variables and their purpose?**

The definitions for AVAL and ATIME come directly from the CDISC ADaM (Analysis Data Model) standards. Specifically, they are part of the Basic Data Structure (BDS) and the ADaM Implementation Guide for Non-compartmental Analysis (ADNCA).
1. AVAL (Analysis Value)

This is a core variable in the BDS class, which is the foundation for almost all analysis datasets.

    Source: CDISC ADaM Implementation Guide (ADaMIG).

    Purpose: It is the primary numeric variable used for statistical analysis. In the context of ADNCA, AVAL holds the drug concentration value.

    Why it's used: By standardizing the results into AVAL, programmers and regulatory reviewers (like the FDA) can run automated scripts for calculations or validation (e.g., using Pinnacle 21) without needing to know if the original raw variable was named PCORRES or CONC.

2. ATIME (Analysis Time)

While "Time" variables in SDTM (raw data) are often ISO 8601 strings (like 2026-04-22T14:30), NCA requires numeric time for calculations.

    Source: ADaM Implementation Guide for Non-compartmental Analysis (ADNCA) v1.0.

    Purpose: It represents the Analysis Time, typically the actual time elapsed since the dose was administered.

    Why it's used: You cannot calculate an AUC (Area Under the Curve) using a clock timestamp; you need a numeric value (e.g., 0.5 hours, 1.0 hours) to serve as the x-axis for the trapezoidal rule.

**Where to Find the Official Documentation**

If you are building these datasets in your R environment (using packages like admiral or admiralneuro), these definitions are pulled from:

    CDISC ADaMIG for NCA: The specialized supplement that defines how to bridge SDTM PC (Concentrations) and EX (Exposure) into an NCA-ready format.

    The pharmaverse admiral documentation: Specifically the NCA vignette, which maps these CDISC variables to R functions.

Review of proposed NCA ADAM standard

This video provides an industry-level overview of the ADNCA standard and how it aligns with regulatory expectations for pharmacokinetic data.
Review of proposed NCA ADAM standard - YouTube
International Society of Pharmacometrics (ISOP) · 403 views

**Is there a pdf file or url list these and their definitions?**

Yes, there are several official and industry-standard resources where you can find these definitions. Depending on whether you want the formal regulatory standard or a practical "how-to" guide for R, you can use the following:
1. The Official CDISC ADNCA Standard

The formal source is the ADaM Implementation Guide for Non-compartmental Analysis Input Data (ADNCA) v1.0.

    Access: You can find the landing page and document link on the CDISC ADaM Foundational Standards page.

    What it contains: It includes the full metadata tables for every variable permitted in an ADNCA dataset, including AVAL, ATIME, and others like NFRLT (Nominal Relative Time from Last Dose).

    Format: It is provided as a PDF (once you sign in to a free CDISC account).

2. Pharmaverse admiral Documentation (Best for R Users)

If you are working in R, the admiral package (which is part of the pharmaverse) provides a comprehensive mapping of these variables with clear, developer-friendly definitions.

    URL: Creating a PK ADNCA Dataset (admiral)

    Why it's useful: It explains how to derive ATIME from raw SDTM date/times and maps it directly to the CDISC standard. It also lists "Required Variables" versus "Permissible Variables."

3. CDISC Knowledge Base (Quick Reference)

The CDISC Knowledge Base has a specific page for the Basic Data Structure (BDS), which defines the core variables used in ADNCA (since ADNCA is a type of BDS dataset).

    URL: ADaM Basic Data Structure (BDS) Example

    Table Content: This link provides a table similar to the one below, detailing the Variable Name, Label, and Source/Derivation.

Variable Definition Summary

If you just need a quick cheat sheet for the variables you mentioned:
Variable	Label	Definition / Purpose
AVAL	Analysis Value	The numeric result (concentration) used for the analysis.
ATIME	Analysis Time	The elapsed time since dose (e.g., in hours) used as the x-axis for NCA.
PARAM	Parameter	The descriptive name (e.g., "Drug X Concentration").
PARAMCD	Parameter Code	The short code for the parameter (e.g., "CONC").
ADTM	Analysis Date/Time	The actual clock date and time of the sample (ISO 8601).


<hr>

=  Admiral Tools

```
For pkg
- styler::style_pkg() \
- devtools::lint()   # package   \
- devtools::test_coverage()   # entire package 
- devtools::spell_check(use_wordlist = TRUE) # package 
- spelling::update_wordlist(pkg=".") # runs spell AND asks to update WORDLIST  

**For File:  Use these:**

- active_fie =  rstudioapi::getSourceEditorContext()$path 
- devtools::test_active_file() 
- devtools::test_coverage_active_file()
- styler::style_file(path = )   # dir, file
- styler::style_file("data-raw/admiral_verify_templates.R")
- lintr::lint(filename="")
- spelling::update_wordlist(pkg=".") # runs spell and asks to update WORDLIST
- urlchecker::url_check()

(see lintr package - many options to control nolint) 
lintr::lint()
```


/*

## TODO
- cleanup !

[^CDISC_api] [CDISC_api]  <https://wiki.cdisc.org/display/LIBSUPRT/Welcome+Package+for+CDISC+Library+Users> 

ODMv2 api example [^CDISC_hl7_api]
pinnacle and api [^CDISC_pinnacle_api] <https://www.lexjansen.com/pharmasug/2024/MM/PharmaSUG-2024-MM-245.pdf>

# My Notes

## intro notes

go to [My Notes]

Take me to the anchor at [bottom](#bottom)

## Tools

For Package:  Use these:
```

# nolint start
...
# nolint end

 ```
## Videos & Reading

### Videos

2024 | Pilot3 Demo | R Consortium  <https://www.youtube.com/watch?v=Krcy3gSfDzs&list=PL4IzsxWztPdkqYWxrmAH0GSbQ9C4QXwBp&index=12>

2024 |  clinical submissions with r(ben):

* (@ 25:30) <https://www.youtube.com/watch?v=5PF6mHeQNS4>  to from adsl
* (@ 36.01 ) template; sdtm -> adam (for adeg)
*  [getting started] <https://pharmaverse.github.io/admiral/articles/admiral.html>
  check:  so idea is start with adsl structure, add necessary columns, rows
  
-  Review of Pilot 1 - 4 (25NOV2024)
  <https://www.youtube.com/watch?v=4cqnIk9iDjs>


2023 | pharmaverse workshop (admiral, metatools, metacore  walkthrough - good, ross @ 7:00):
- (@7:00 or so) <https://youtu.be/nHbDmxjVqRM?si=usfW_i9zdQyBKA0D>
- with metacore object we have  `specs` (ex: column names and order) => compare to data

2022 | CI/CD; pharmaverse github workflow (ben)
- <https://www.youtube.com/watch?v=OcNzurpCCpY>
- <https://github.com/bms63/demo>
 

2022 | Day #1 (good) <https://www.youtube.com/watch?v=9eod8MLF5ys>
@ 23:12 - diagram, package handoffs...
@ 48:00  - Admiral, design flow of derive_var_... (good)

Coursera: [^coursera] 
New contributors <https://www.youtube.com/watch?v=MhEyod3Sevc&list=PLbcglKxZP5PPBplKMO9obNAjLIM7GGfp4&index=3>


### Reading

   - Ben2024 (overview) Ben, 2024 <https://pharmasug.org/proceedings/2024/SD/PharmaSUG-2024-SD-343.pdf>
<https://pharmasug.org/proceedings/2024/SS/PharmaSUG-2024-SS-344.pdf>
   - (coding) <https://pharmaverse.github.io/admiral/articles/concepts_conventions.html>
   - (*Programming Strategy*) <https://pharmaverse.github.io/admiraldev/articles/programming_strategy.html>
   - (list ADAM variables & admiral function to create)  <https://pharmaverse.github.io/admiraldiscovery/articles/reactable.html>
   - (examples: repo  ) <https://github.com/pharmaverse/examples>
   - (examples:  run in Posit Cloud) <https://pharmaverse.github.io/examples/>
   - Imputed Dates: (discussion) <https://advance.hub.phuse.global/wiki/spaces/WEL/pages/26807243/Imputing+Partial+Dates>

*** Additional Reading (maybe older topics or presentations)
- (using tidyverse to maninpulate SDTM tibbles) <https://www.pharmasug.org/proceedings/2023/QT/PharmaSUG-2023-QT-280.pdf>
  

## Buzz words

::: callout

Admiral 

:::

- **Admiral** overview:  Ben S https://www.youtube.com/watch?v=5PF6mHeQNS4
- functions create ADaM structures
- Intro (for Pharma Users):  <https://pharmaverse.github.io/admiral/>
- Getting Started (vignette, introducing code) <https://pharmaverse.github.io/admiral/articles/admiral.html>

 *for Developers:*
- Contributing: <https://pharmaverse.github.io/admiral/CONTRIBUTING.html>
- FAQ (some background) <https://pharmaverse.github.io/admiral/articles/faq.html>

**ADRG** ADaM Data Review Guide (pdf end result !) \
* SEE <https://github.com/parmsam/quarto-adrg/blob/main/adrg-pilot4.qmd>
* <https://github.com/RConsortium/submissions-pilot2-to-fda/blob/main/m5/datasets/rconsortiumpilot2/analysis/adam/datasets/adrg.pdf>

**ADSL**  - required dataset format for CDISC (Adam); patient/treatment level ; 
attempt to capture treatments/interventions in a STUDY; must be flexible, yet rigourous.
(clear) <https://www.linkedin.com/pulse/decoding-adsl-treatment-variables-study-designs-clinical-baghai-hhzfe/>

- **Admiraldev** (some background) <https://pharmaverse.github.io/admiraldev/articles/admiraldev.html>

**box**


### What is CDISC?

The "I" is for interchange, ie to move data between computers and applications. In particular, CDISC is an attempt to standardize structure of data that flow from patient through data analysis so things like dates, units, dataset fields are consistent. At the government/regulary agency end, the standardization of data simplifies comparisons.

CDISC is intended to be an improvement over [prior methods](https://www.cdisc.org/kb/articles/short-history-cdisc-and-sas-transport-files) to exchange data.[^prior_methods]

From an R developer's point-of-view, this roughly boils down to data tables and format.  CDISC is both an abstraction and a guide to choosing the right variables. 
Just like an engineer who grows special crystals might benefit from learning a bit about group theory and various symetries, so too an R developer might pick up insights from CDISC abstractions.


Depending on abstraction:
PLAN -> COLLECT -> ORGANIZE -> ANALYSIS -> REPORTS
OR, 
CDISC -> CDASH -> SDTM -> ADaM ->data analyst

SEE [^wiki_CDISC] [^vendor_def]

[CDISC wikipedia](<https://en.wikipedia.org/wiki/Clinical_Data_Interchange_Standards_Consortium>)
 Good, not perfect, one page summary.

### Where to Start with CDISC?
Basic introduction: \
* **CDISC 9 short videos (JAN 2025)** : <https://www.youtube.com/watch?v=muzo9veBOFw&list=PL4vFrmnpUDeRziW2ozobayozgukgAmL1S>
* [**CDISC data exchange definitions**:](https://www.cdisc.org/standards/data-exchange)
* **CDISC Genius (AI)[^genius] :** https://chatgpt.com/g/g-677223310d8081918ca4bdda574a5384-cdisc-genius 
* **CDISC Primer** :  <https://www.cdisc.org/primer>
* **cdisc api library** (info)  <https://www.cdisc.org/cdisc-library>

### What are the CDISC specs?

 Example:  In ADaM specify columns, or  the type (string, number etc)  is determined by metacore (metadata) and this in turn is based on ...
- Goal?  At R level, structure of ADaM, SDTM tables (deliverables) 
- [CDISC videos](https://www.youtube.com/@CDISCInc/playlists)
- [^CDISC Glossary](https://datascience.cancer.gov/resources/cancer-vocabulary/cdisc-terminology)


### What exactly are these CDISC specs?
ODM   - At simplest level, ODM is overall guide to formatting data/metadata; what ADaM and SDTM datasets should look like and how to pass as JSON files.
https://www.cdisc.org/standards/data-exchange/odm-xml/odm-v2-0 \

```verbatim
<ODM>
<STUDY>
  <SPONSOR>
  <VISITS>
  ...
```

Example schema: CDISC_schema:  <https://github.com/cdisc-org/DataExchange-ODM/blob/main/schema/ODM-clinicaldata.xsd>

SDTM schema (snippet)
```verbatim
"$schema": "http://json-schema.org/draft-07/schema#",
  "title": "CDISC SDTM Dataset",
  "type": "object",
  "properties": {
    "domain": {
      "type": "string",
      "description": "The SDTM domain abbreviation (e.g., DM, AE, LB)"
    },
    "variables": {
      "type": "array",
      "items": {
        "type": "object",
        "properties": {
          "variable_name": { "type": "string" },
          "label": { "type": "string" },
          "data_type": { "type": "string", "enum": ["string", "integer", "float", "date"] },
          "controlled_terminolog
		  <SNIP>
```

snippet of ADaM, BDS JSON file (ie with data)

```verbatim
{
  "dataset_name": "ADLB",
  "dataset_description": "Analysis Dataset for Laboratory Results",
  "variables": [
    {
      "variable_name": "USUBJID",
      "label": "Unique Subject Identifier",
      "data_type": "string",
      "controlled_terminology": null,
      "mandatory": true
    },
    {
      "variable_name": "PARAMCD",
      "label": "Parameter Code",
      "data_type": "string",
      "controlled_terminology": "codelist: PARAMCD",
      "mandatory": true
    },
    {
      "variable_name": "PARAM",
      "label": "Parameter",
      "data_type": "string",
      "controlled_terminology": null,
      "mandatory": true
    },
```

```verbatim
    {
      "variable_name": "AVISIT",
      "label": "Analysis Visit",
      "data_type": "string",
      "controlled_terminology": "codelist: AVISIT",
      "mandatory": true
    },
    {
      "variable_name": "AVAL",
      "label": "Analysis Value",
      "data_type": "float",
      "controlled_terminology": null,
      "mandatory": true
    },
	{
	  ll,
      "mandatory": true
    }
  ],
```
```verbatim
  "data": [
    {
      "USUBJID": "SUBJ001",
      "PARAMCD": "ALT",
      "PARAM": "Alanine Aminotransferase",
      "AVISIT": "Week 4",
      "AVAL": 30.5,
      "AVALU": "U/L",
      "BASE": 25.0,
      "CHG": 5.5,
      "PCHG": 22.0,
      "ADT": "2024-02-15"
    },
    {
      "USUBJID": "SUBJ002",
      "PARAMCD": "AST",
      "PARAM": "Aspartate Aminotransferase",
      "AVISIT": "Week 8",
      "AVAL": 28.0,
      "AVALU": "U/L",
      "BASE": 20.0,
      "CHG": 8.0,
      "PCHG": 40.0,
      "ADT": "2024-03-10"
    }
  ]
}
```

### What is `Controlled Terminology`
<https://www.cdisc.org/kb/articles/controlled-terminology-faqs>
(9-27-2024) https://evs.nci.nih.gov/ftp1/CDISC/Define-XML/Define-XML%20Terminology.html

**define-xml** describes how to (encapsulate??) metadata needed to create  tabular dataset structure  into a json `container`.
- Define-XML (https://www.cdisc.org/standards/foundational/define-xml/define-xml-v2-1-6) 

**Controlled Terminology:** https://evs.nci.nih.gov/ftp1/CDISC/Define-XML/Define-XML%20Terminology.html
**cdisc define-xml** https://www.linkedin.com/groups/4975366/ - official cdisc define-xml (linkedin) 

#### define-xml (in json)
{
  "Study": {
    "GlobalVariables": {
      "StudyName": "Example Study",
      "StudyDescription": "A Phase 3 Clinical Trial",
      "ProtocolName": "XYZ123"
    },
    "ItemGroupDef": [
      {
        "OID": "IG.DM",
        "Name": "Demographics",
        "Label": "Demographics",
        "ItemRef": [
          {
            "ItemOID": "IT.DM.AGE",
            "Mandatory": "Yes"
          },
          {
            "ItemOID": "IT.DM.SEX",
            "Mandatory": "Yes"
          }
        ]
      }
    ],
    "ItemDef": [
      {
        "OID": "IT.DM.AGE",
        "Name": "AGE",
        "Label": "Age",
        "DataType": "integer",
        "CodeListRef": {
          "CodeListOID": "CL.AGEU"
        }
      },
      {
        "OID": "IT.DM.SEX",
        "Name": "SEX",
        "Label": "Sex",
        "DataType": "text",
        "CodeListRef": {
          "CodeListOID": "CL.SEX"
        }
      }
    ]
  }
}




### Examples: what filetype is end result?
Currently: xpt
Future:  json

### What is dataset-json standard ?
"dataset exchange format" in JSON file for tabular datasets
Read [^swhume] https://swhume.github.io/why-json-for-datasets

- XML,  structured document (DOM, body, src, images,...)
- JSON, structured data

- database structure <https://www.lexjansen.com/pharmasug/2023/SS/PharmaSUG-2023-SS-140.pdf> 
- dataset-json https://www.lexjansen.com/css-us/2023/PRE_01.pdf
- **Good explanation of cdisc dataset-json v1.1 specification** 
https://github.com/cdisc-org/dataexchange-datasetjson/blob/master/doc/dataset-json1-1.md 

- cdisc json v1.1.0 user's guide; compared to define-xml <https://wiki.cdisc.org/display/pub/dataset-json+v1.1+user%27s+guide> 

https://github.com/cdisc-org/dataexchange-datasetjson-api/blob/main/dataset-json-api.html

### Examples (json v xpt)
cdisc examples (json v xpt)

> for anyone interested, **cdisc** has an open source [**dataexchange
repo**](
https://github.com/cdisc-org/dataexchange-datasetjson/tree/master/examples)
here with examples of the adam datasets {adsl,adae,adlbc,adtte,adadas}
used in pilot 5. interesting to compare the .xpt, .json, and .ndjson
file formats and their properties. you can browse through using a data
viewer. (robert devine)


- Blog: [how JSON fits](https://swhume.github.io/why-json-for-datasets)

- PharmaSUG 2022 Define-XML 2.0 to 2.1 <https://www.lexjansen.com/pharmasug/2022/DS/PharmaSUG-2022-DS-064.pdf>
- (v 2.1) https://www.lexjansen.com/pharmasug/2022/ds/pharmasug-2022-ds-064.pdf
- trial example candidate for spec <https://github.com/cdisc-org/dataexchange-datasetjson-api>

### What is Dataset-XML
Substitute(?) for SAS V5 tranfer.

### More about json
- (wikipedia)<https://en.wikipedia.org/wiki/json>  
- (syntax) <https://www.w3schools.com/js/js_json_syntax.asp>  
- (** create a schema) <https://json-schema.org/learn/getting-started-step-by-step>
- Schema keywords and tutorials
https://json-schema.org/understanding-json-schema/keywords

#### Example schema with properties

```
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "https://example.com/product.schema.json",
  "title": "Product",
  "description": "A product from Acme's catalog",
  "type": "object",
  "properties": {
    "productId": {
      "description": "The unique identifier for a product",
      "type": "integer"
    }
  }
}

```



-  LinkML - tool to create & validate schema (json/yaml) <https://linkml.io/linkml/

- (EXAMPLE: schema for atomic vector) <https://artifactdb.github.io/BiocObjectSchemas/>
- examine [atomic vector](https://artifactdb.github.io/BiocObjectSchemas/atomic_vector/v1.json)
- examne properties | atomic vector | properties | enum (logical, integer ...)
- (json for apis) <https://apisjson.org/>

### R implimenation

**datasetjson** 
- R package convert cdisc data between json and r data.frame + special attributes (good example code)  
(json is usually only the transfer, not stored at either end).   

- hard code special attribute(?) , ie not reading and incorporating info from json spec
https://github.com/atorus-research/datasetjson.  

- uses package **jasonvalidate::** to confirm data and a schema match.

- (* getting started, code) <https://atorus-research.github.io/datasetjson/articles/datasetjson.html>

***

### Post-ADaM analysis

the **cdisc analysis results data (ard or ardg) model**  emerging standard for encoding statistical analysis summaries in a machine-readable format. 


**ARS** - Analysis Results Standard (post-ADam,  metadata)
( oct 2024 https://www.danieldsjoberg.com/ARD-RinPharma-workshop-2024/)

### More

- Pinnacle 21 (was called openCDISC)
- video (Define.xml 2.0, pinnacle21) <https://www.youtube.com/watch?v=8PzYO0YlO0I>  Define.xml desribes content of an FDA submission.

- Pinnacle21 ( a company?) videos:<https://www.youtube.com/@pinnacle21llc/playlists>  


- SAS <https://www.youtube.com/playlist?list=PLbW_LFBIHlxu2abXtm0KE3HSZu1YCuRMO>
- FDA Pilot JSON <https://www.youtube.com/watch?v=ljr6d4Aw7nA> 

***

### after CDISC (placeholder)

- *datacutr* https://www.youtube.com/watch?v=ZyK-Tiqw5hU&list=PLbcglKxZP5PPBplKMO9obNAjLIM7GGfp4&index=6
  has sample data; functions to restrict data to ONE date, or patients ... a slice of data

- [DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model) - tree structure representing html or xml document.  Allows code running in browser to select elements of document.


- **expr() example**
call:  f(mtcars, var=expr(hp))  # no need to use "hp" (string)
f = function(ds, var) { dplyr::select(ds, !!var)}

**eCTD**
**eCTR** = electronic communications ..

**end-to-end clinical reporting** https://pharmaverse.org/e2eclinical/

**harmonize** - harmonized means consistent metadata/specifications object



**GxP** "Good Practice" esp regarding FDA submissions.

**LOCF** https://www.lexjansen.com/nesug/nesug09/po/PO12.pdf
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4785044/
- missing observtions?    assume last reported value continues.

- **metacore**  (Atorus, up to 6 datasets, info re:  tables, columns, ... )
creates R object to hold all metadata needed for an ADaM (structure of tables, columns etc)
Accepts .xslx, or define.xml, several formats that are company-specific.
This vignette explains the process, if given define.xml <https://github.com/atorus-research/metacore/blob/main/vignettes/Example.Rmd>

For .xml, reads using xml2 package, example: <https://xml2.r-lib.org/reference/read_xml.html#ref-examples>

video:  (10/20/2023, R/Pharma, Intro to Pharmaverse covers the process to ADaM)
<https://youtu.be/nHbDmxjVqRM?list=PLbcglKxZP5PPBplKMO9obNAjLIM7GGfp4>

Blog Post: <https://posit.co/blog/creating-adsl-with-the-pharmaverse-part-2/>

File with reference datasets:ds ... https://github.com/atorus-research/metacore/blob/main/tests/testthat/test-reader.R
SEE:  https://github.com/atorus-research/metacore

ds_spec  - dataset name, purupse (ex: AE, DM) info
ds_vars holds each field (columns) of dataset 
var_spec



- **metatools** https://github.com/pharmaverse/metatools
  tools to develop, work with metacore objects (ex:  companies may have different names to describe one entity)
  does some preliminary checks  (harder analysis is done in admiral)

**ODM**

**ODM-XML** an xml file

## Pilot

**Pilot 2** - shiny, no webassembly

**Pilot 3**
scripts, shiny; use admiral to  generate ADaM (ADSL, ADAE) --> TLF

**Pilot 4**
pilot2 + webassembly and/or container
- now shiny does not need httpuv
- Ben likes container (easy transport)
- But FDA like webassembly, fewer parts to install (done via browser, no server, compile in browser)
container:  webassembly and Podman (not open source)
https://rpodcast.quarto.pub/pilot4-webassembly-adrg/#introduction  
https://github.com/RConsortium/submissions-pilot4-webR
- no .zip?  Docker?  .tar.gz?

**Pilot 5**

**Pilot future:   Nix OS, can  isolate R in same OS**

**Programming Strategy** https://pharmaverse.github.io/admiraldev/articles/programming_strategy.html

Coding (rlang etc)https://pharmaverse.github.io/admiral/articles/concepts_conventions.html
PR overview https://pharmaverse.github.io/admiraldev/articles/pr_review_guidance.html
PR/branches/commits/ https://pharmaverse.github.io/admiraldev/articles/git_usage.html

**PHUSE (UK)** - lots of conferences| https://phuse.global/Communications/Webinar_Wednesday https://phuse.global/Working_Groups [PHUSE Working Groups]
**pharmaR** (original attempt)  -> pharmaverse

**pinnacle21**  https://www.pinnacle21.com/
**oak**

**random.cdisc.data** package:  create random AdAM datasets?
https://cran.r-project.org/web/packages/random.cdisc.data/random.cdisc.data.pdf

**R Validation Hub** (~50 companies) |
**R Consortium Working Group** https://rconsortium.github.io/submissions-wg/ [R Consortium]  R Submissions Working Group] https://rconsortium.github.io/submissions-wg/

**R6** Advanced R Chapter 14
- object$method (each class: n methods; unlike S3 generic)
- teal.code R6 chunks ('exprs' & env in container)
- teal.slice R6 filters

**rhino** good intro,box https://youtu.be/QmyilJr7jXs

**R Consortium Tables Working Group**:  https://rconsortium.github.io/rtrs-wg/

**riskmetric** package  and a shiny app:  *Riskasessment*

**SAP** - Statistical Analysis Plan |  Example: https://cdn.clinicaltrials.gov/large-docs/80/NCT04182880/SAP_001.pdf
What is SAP?
"A lot of what we make is based on the Study Design and questions
being asked in the study to prove the safety and efficacy of the drug
through something called the **SAP (Statistical Analysis Plan)**.  So
which ADaMs, TLFs you pick is really dependent on the SAP.  There is
something called the **Protocol** that is a higher-level version of the
SAP which influences the **eCRF (electronic Case Report Form)** and
determines what data is collected."  -- Ben Straub

**SAS**
Good validation (CDISC STDM/Admiral standard)
R has many packages, but who validates?


**SDTM** =  Study Data Tabulation Model https://en.wikipedia.org/wiki/SDTM

**sdtmchecks**
  SEE:  https://www.youtube.com/watch?v=tBL0Eo6CBdw&list=PLbcglKxZP5PPBplKMO9obNAjLIM7GGfp4&index=5
  
**Shiny**

**supplemental**
There are the main data domains (= Parent in our example e.g. DM) which contain pre-defined and standard variables. **New variables** which are not as per standard cannot be added to a data domain. If a user has additional data for a domain which cannot be entered into the domain using the standard SDTM variables, then a **supplemental qualifier dataset** must be used (SUPPDM in our example).

**TLG** -  tables, listings, graphics .... https://pharmaverse.org/e2eclinical/tlg/
- October 20, 2023 (rtables) https://www.youtube.com/watch?v=3S4_WROtFK8  j  k
- Pawel Rucki:  WebR to TLG, 25NOV2024  (Demo @15:48) https://youtu.be/vaoDUrUscZA?list=PLbcglKxZP5PPBplKMO9obNAjLIM7GGfp4

**Teal**
  Teal + ShinyLive (ie WebR; no need server) https://pharmaverse.github.io/examples/interactive/teal.html
  2024 Workshop:  https://github.com/pharmaverse/tealworkshop-phuseusconnect2024/tree/main/code

- May 16, 2023 Overview of Teal framework (no code) https://youtu.be/D2DJQYo3Nag
- October 20, 2023:(Dony| very good walk through of config modules,  filters, teal_slice(),  in basic teal app) https://www.youtube.com/watch?v=3S4_WROtFK8
- October 24, 2024 (Dony | intro to teal module) https://youtu.be/WnTgIWU59RM?list=PLbcglKxZP5PPrBVVV9AItiVXUCFcTQb9J 

- teal vidoes 000_teal https://www.youtube.com/playlist?list=PLbcglKxZP5PPrBVVV9AItiVXUCFcTQb9J
- shiny videos (+ teal) 000_shiny https://www.youtube.com/playlist?list=PLbcglKxZP5PO-TktNs849mfbjY5UeWnoo
- shiny developer series: https://www.youtube.com/@ShinyDeveloperSeries/playlists





**tools**
phuse.org/valtools (nice spreadsheet)

https://github.com/pharmaverse/ggsurvfit (seems interesting)

https://github.com/pharmaverse/envsetup (plumbing can be intersting)


https://github.com/pharmaverse/pharmaverseadam/issues/58

**XLSX**  In Micrsoft Excel,   XLSX is an XML-based open file format and XLS is a proprietary Microsoft format.

## Empty Placeholder
## FAQ

**Tests**
In tests, how to check correct error/warning is issued?**

-  Please use expect_snapshot() to ensure that the correct error
message is issued.  By the way, unit test for errors and warnings
should never accept any error or warning but always check that the
expected one is issued (by using expect_snapshot() or the class
argument of expect_error()/expect_warning() ).

**Is my version of admiraldev, pharamverse, out-of-date?**
- Check:  Namespace file & packageVersion("admiraldev")
- install latest from github by using devtools::install_github("pharmaverse/admiraldev"

When we depend on a dev version of a package, we should also indicated this in our DESCRIPTION file FYI

Imports:
    admiraldev (>= 1.1.0.9006),

It used to be the case, that Remotes: would re-install all pkgs listed in Remotes upon installation of the pkg, but that is no longer the case after pak replaced remotes for GH intallations.


*Skills to focus on:*
https://pharmaverse.slack.com/archives/D07DL8CP00G/p1728234941977779
 `templates, documentation & navigation, pkgdown & organization, R environments`


*Data:*
https://pharmaverse.slack.com/archives/D07DL8CP00G/p1722857716071859

*What is "starting date" ?*
    When is example data contrived, from CDISC, a subset etc. the data usually starts at Informed Consent - RFISDTC

*When to use metacore/metatools ?   Or,   admiral?   Seems to be overlap.*

    Yes there are lots of overlap between the packages.  For example, there are functions in metatools to bring copies of variables from SDTM or you could just use dplyr or base R to bring them over.  We built them independent so you didn't have to commit to them if you wanted to use one or the other.  I use both in my ADaM programming and work well together.  I think the example site has best example.

*How many "ADaM(s)" are there?*

    3 types of Adam (ADSL, BDS, occ...)   Is there ONE ADSL or many kinds;  was very confused about this.

    There is only one ADSL in each study, but each study's ADSL will
    look different depending on what is needed for Subject-level data
    as defined in the Study SAP (Statistical Analysis Plan), for
    example baseline tables and endpoints.  There is a forth ADaM
    called ADaM Other - which captures some exotic ADaM structures.
   

**Templates:**
(not FAQ, a direction) We are trying to compare things from the templates in CI Workflow; use of diffdf

Why do we use both library(pharmaversesdtm::ae) and ae=pharamaversesdtm::ae

We are just trying to be explicit on where the data is coming from as
we are assuming folks are not super familiar with R yet if they are
using our template programs.  Yes we could drop the library() call,
but the comment on the datasets origin is important to also point out
to new users.


*What topics does bi-weekly Admiral meetings cover?*

A lot of what we make is based on the Study Design and questions being
asked in the study to prove the safety and efficacy of the drug
through something called the SAP (Statistical Analysis Plan).  So
which ADaMs, TLFs you pick is really dependent on the SAP.  There is
something called the Protocol that is a higher-level version of the
SAP which influences the eCRF (electronic Case Report Form) and
determines what data is collected.However, you will always have an
ADSL dataset!!

We have bi-weekly meetings on Wednesdays at 10 AM US EST.  They are
not mandatory to be in the group but highly encouraged.  You get to
meet various people and participate in discussions.  However, we
understand that can be tough with full-time job needs.  Occasionally
we split out into Working Groups to tackle various topics.

**History of package datasets**
https://app.slack.com/client/T028PB489D3/D07DL8CP00G

I'm not worried about creating the data in admiral.  I believe this is
the way forward that you have been working on.We have been doing it
for 3 years now just not using the recommended data/data-raw
convention.The pharmaverseadam package was created to allow folks to
load ADaM data for other projects rather than having to load admiral.
We actually used to have all those ADaMs in admiral but it bloated the
package and decided to remove them.  So pharamverseadam came later and
it is a little confusing as our templates make those ADaMs and so adsl
is identical between the two packages.The templates should create the
datasets (adsl and adlb).  admiral_adlb should require some subsetting
with the proposed Subjects.  If the data is not an exact match, then
it would be nice to understand what is not matching.  The diffdf
package is very nice for this.If it doesn't match, then lets figure
out why and it might just be a minor updates to the templates that
have been done over the last few years.  AGain I'm not particular
worried as the package hasn't changed so drastically that the Hy's
Vignette would become unusable. (edited)


*SAP* - Statistical Analysis Plan |  Example: https://cdn.clinicaltrials.gov/large-docs/80/NCT04182880/SAP_001.pdf


*How I join bi-weekly Admiral  meetings?*
https://github.com/pharmaverse/admiral/discussions/2169#discussioncomment-10376594

Once you do a few more successfully merged PRs I will propose to core
team that you be included! Be great to have you involved.

*Reviewers: PR*
(Ben) So I see everything that happens in admiral: issues, conversations,
PRs, etc as I have my settings that way.
Yes always assign a reviewer.
You can ping people you have interacted with and ask for review or use
@pharmaverse/admiral teams to ask for additional reviewers.
If crickets, ping on slack as well; Stefan is the best for thorough
code review.  Edoardo and I are okay for code, but we are very user
focused and pay close attention to documentation of usability of the
function.
there are a few others out there but you haven't interacted
with them much yet

**Steps before release**
   example of pre-release CRAN checklist  https://github.com/pharmaverse/admiral/discussions/2394 

## Working with JSON
See https://json-schema.org/learn/getting-started-step-by-step 

JSON data, but with more info not really sure of context, can even validate:  use JSON Schema!

```
{
  "productId": 1,
  "productName": "A green door",
  "price": 12.50,
  "tags": [ "home", "green" ]
}
```


Schema has few special `schema keywords`
With right tool, can validate the JSON data is indeed a valid JSON and follows JSON schema.
```
{
  "$schema": "https://json-schema.org/draft/2020-12/schema",
  "$id": "https://example.com/product.schema.json",
  "title": "Product",
  "description": "A product in the catalog",
  "type": "object",
  "properties" : {
	"productId": {
	  "description": "the productID is unique identifier",
	  "type": "integer"},
	"productName": {...},
	"price": {...},
	

   "required": [ "productId", "productName", "price" ]    # these are required
}
```

## Footnotes
[^lintr]: <https://lintr.r-lib.org/articles/lintr.html>
[^coursera]: <https://www.coursera.org/learn/hands-on-clinical-reporting-using-r>
[^prior_methods]: <https://www.cdisc.org/kb/articles/short-history-cdisc-and-sas-transport-files>
[^wiki_CDISC]: [CDISC wikipedia] <https://en.wikipedia.org/wiki/Clinical_Data_Interchange_Standards_Consortium>
[^genius]: [CDISC_genius] <https://chatgpt.com/g/g-677223310d8081918ca4bdda574a5384-cdisc-genius>
[^swhume]: [swhume] <https://swhume.github.io/why-json-for-datasets>
[^vendor_def]: [vendor_def] <https://www.scian.com/statistical-programming-and-analysis/adam/define-xml/>
[^CDISC Glossary]: [CDISC_glossary] <https://datascience.cancer.gov/resources/cancer-vocabulary/cdisc-terminology>
[^CDISC_schema]: [CDISC_schema]  <https://github.com/cdisc-org/DataExchange-ODM/blob/main/schema/ODM-clinicaldata.xsd>
[^CDISC_api]: [CDISC_api]  <https://wiki.cdisc.org/display/LIBSUPRT/Welcome+Package+for+CDISC+Library+Users> 
[^CDISC_hl7_api]: <https://www.cdisc.org/kb/articles/use-hl7-fhir-esource-pre-populate-cdash-case-report-forms-using-cdisc-odm-api>

pinnacle and api [^CDISC_pinnacle_api]: https://www.lexjansen.com/pharmasug/2024/MM/PharmaSUG-2024-MM-245.pdf


This is the bottom
<a name="bottom"></a>

*/
