---
name:   110_aNCA_vocabulary.md
description:  Short definitions, link for key technical vocabulary.
  metadata:
---

**TODO:  Check for accuracy, completeness, source and examples.  These are my rough notes**


ADAM (or ADaM)
CDISC specified dataset structure. Specific colnames, variable types, units etc.  Yet also flexible enough to accomodate variety of data from clinical trials.  Constructed from domains.
Example:  ADLB  (lab analysis) is constructed from domain dm, ds and others.  See paper (?)

ADPC
ADaM for pharamokinetic concentrations and times,  includes records flagged for exclusion (pt vomitted)
AVAL here refers to concentration.
downstream from: SDTM PC and ADSL

ADPP
ADaM for pharmokinetic parameters
Q: This holds the calculated values?

ADNCA
AdaM BDS, holds calculated NCA parameters (Cmax, etc)
One row for each profile (ie one patient, same visit, results)
AVAL here refers to value derived.
(Check: before or after?) ADNCA may additional columns (Creatine Clearance, from SDTM LB, lab)
Downstream from  ADPC, after engine calculations; Once NCA calulations are done, the time-series data is less important. 

|USUBJID	    |PARAMCD	|PARAM	           |AVAL	|AVALU
|---------------|-----------|---------------   |--------|-----|

SUBJ-001	CMAX	Max Concentration	     45.2	ng/mL
SUBJ-001	TMAX	Time of Max Concentration	2.0	hr
SUBJ-001	AUCLST	AUC Zero to Last Measurable Conc	312.5	hr*ng/mL
SUBJ-001	LAMZ	Terminal Elimination Rate (Lambda-z)	0.08


ADPP
Should be same as ADNCA,  ADPP means ADaM PK parameters 
ADSL
Subject level core values 
Q: is this an ADaM?
Parameter-Value (BDS - Basic Data Structure) model
normalized (or long tidyverse form) used in ADNCA. (Wide would have separate columns for Cmax, Tmax, etc.)
more below at bottom

ADaMIG -  CDISC 
https://www.cdisc.org/system/files/members/standard/foundational/ADaMIG_for_Non-compartmental_Analysis_Input_Data_v1.0_1.pdf
Requires knowing vocabulary.

ADRG
Analysis Data xxx Guide

BDS
What measured ?
When measured ?
see ADMIG v 1.2 Section 3.3

CDATA or Specifications Document
Mapping from raw data to SDTM.

Duration
(TODO: check )
Ex:  ml of urine in a duration


Dataset-JSON
A json file carrying data and metadata between machines or software.   Replaces SAS .xpt format 

Half-Life
Time where original value is cut in 1/2 (example: concentration) Should be independent of dose. Can be calculated from "curve stripping" algorithm.  Or fit ln(x)

Interval
(TODO: check & give examples)
Time-slice (in hours) (ex:  0-12, 12-24, 132-144)


Model
Why? NCA works on observed measurements.  What about different doses/patients?

PK Profile:
The PK curve is describes  single patient, drug, one or more doses,  concentrations v time.

SAP
Statistical Analysis Plan

SDTM  (see: https://en.wikipedia.org/wiki/SDTM)
Study Data Tabulation Model

SDTM EX
Dosing

SDTM PC
observed concentrations, PC domain

TLG
Tables, lists, graphs

Time v Duration
SEE https://www.linkedin.com/pulse/understanding-intervals-time-duration-clinical-trials-daniel-wanjiru-b2gkf/ 
Time requires 2 measurements (start, stop)
Duration is difference, or can be its own variable.
Give examples.

Also see wikipidea: CDISC 
pdf: ADaMIG v1.2, Section 3.3 (BDS, most of the dataset variables can be found )

Footnotes
NCA formats:
Here is how the two worlds map to each other:
Database / Tidy Data Term     | CDISC ADaM BDS Equivalent

Primary Key / Composite Entity | USUBJID + PARAMCD + AVISIT + ATP_ (Period/Avisol, etc.)

| Attribute / KeyPARAMCD (e.g., CMAX, TMAX) | 
| Value | AVAL (Analysis Value)MetadataPARAM (Description), AVALU (Units) |
|                                           |                                                                      |
The "Tidy Data" Trade-off in Clinical Trials

In modern data analysis, we usually live by the rule that "every variable gets its own column." However, clinical trial programming opts for this normalized, row-based BDS structure for two huge reasons:The Dynamic Attribute Problem: A standard NCA run can spit out anywhere from 5 to 50+ distinct parameters depending on the drug profile (half-lives, clearance rates, accumulation ratios, steady-state metrics). 

Building a database table with 50 columns—where 30 of them might be empty (NULL) for an immediate-release drug but filled for a sustained-release drug—is a maintenance nightmare.Standardization across therapeutic areas: By normalizing the rows, a statistical program designed to generate a "Summary of PK Parameters" table doesn't care what drug you are testing. It just loops through PARAMCD, calculates the mean and standard deviation of AVAL, and prints the output.When it finally comes time to hand the data off to the clinical statisticians or the FDA reviewers who do prefer to see things wide (for example, comparing $C_{max}$ vs. $AUC$ in a scatter plot), we simply "pivot" or "transpose" the data back out into a wide layout right at the finish line.
