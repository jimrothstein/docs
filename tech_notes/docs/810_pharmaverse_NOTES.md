jim
2023-12-20

## TODO

- cleanup !

[^1] \[CDISC_api\]
<https://wiki.cdisc.org/display/LIBSUPRT/Welcome+Package+for+CDISC+Library+Users>

ODMv2 api example [^2] pinnacle and api \[^CDISC_pinnacle_api\]
<https://www.lexjansen.com/pharmasug/2024/MM/PharmaSUG-2024-MM-245.pdf>

# My Notes

## intro notes

go to [My Notes](#my-notes)

Take me to the anchor at [bottom](#bottom)

## Tools

For Package: Use these:


    # nolint start
    ...
    # nolint end

## Videos & Reading

### Videos

2024 \| Pilot3 Demo \| R Consortium
<https://www.youtube.com/watch?v=Krcy3gSfDzs&list=PL4IzsxWztPdkqYWxrmAH0GSbQ9C4QXwBp&index=12>

2024 \| clinical submissions with r(ben):

- (@ 25:30) <https://www.youtube.com/watch?v=5PF6mHeQNS4> to from adsl

- (@ 36.01 ) template; sdtm -\> adam (for adeg)

- \[getting started\]
  <https://pharmaverse.github.io/admiral/articles/admiral.html> check:
  so idea is start with adsl structure, add necessary columns, rows

- Review of Pilot 1 - 4 (25NOV2024)
  <https://www.youtube.com/watch?v=4cqnIk9iDjs>

2023 \| pharmaverse workshop (admiral, metatools, metacore walkthrough -
good, ross @ 7:00): - (@7:00 or so)
<https://youtu.be/nHbDmxjVqRM?si=usfW_i9zdQyBKA0D> - with metacore
object we have `specs` (ex: column names and order) =\> compare to data

2022 \| CI/CD; pharmaverse github workflow (ben) -
<https://www.youtube.com/watch?v=OcNzurpCCpY> -
<https://github.com/bms63/demo>

2022 \| Day \#1 (good) <https://www.youtube.com/watch?v=9eod8MLF5ys> @
23:12 - diagram, package handoffs… @ 48:00 - Admiral, design flow of
derive_var\_… (good)

Coursera: [^3] New contributors
<https://www.youtube.com/watch?v=MhEyod3Sevc&list=PLbcglKxZP5PPBplKMO9obNAjLIM7GGfp4&index=3>

### Reading

- Ben2024 (overview) Ben, 2024
  <https://pharmasug.org/proceedings/2024/SD/PharmaSUG-2024-SD-343.pdf>
  <https://pharmasug.org/proceedings/2024/SS/PharmaSUG-2024-SS-344.pdf>
- (coding)
  <https://pharmaverse.github.io/admiral/articles/concepts_conventions.html>
- (*Programming Strategy*)
  <https://pharmaverse.github.io/admiraldev/articles/programming_strategy.html>
- (list ADAM variables & admiral function to create)
  <https://pharmaverse.github.io/admiraldiscovery/articles/reactable.html>
- (examples: repo ) <https://github.com/pharmaverse/examples>
- (examples: run in Posit Cloud)
  <https://pharmaverse.github.io/examples/>
- Imputed Dates: (discussion)
  <https://advance.hub.phuse.global/wiki/spaces/WEL/pages/26807243/Imputing+Partial+Dates>

\*\*\* Additional Reading (maybe older topics or presentations) - (using
tidyverse to maninpulate SDTM tibbles)
<https://www.pharmasug.org/proceedings/2023/QT/PharmaSUG-2023-QT-280.pdf>

## Buzz words

> [!NONE]
>
> Admiral

- **Admiral** overview: Ben S
  https://www.youtube.com/watch?v=5PF6mHeQNS4
- functions create ADaM structures
- Intro (for Pharma Users): <https://pharmaverse.github.io/admiral/>
- Getting Started (vignette, introducing code)
  <https://pharmaverse.github.io/admiral/articles/admiral.html>

*for Developers:* - Contributing:
<https://pharmaverse.github.io/admiral/CONTRIBUTING.html> - FAQ (some
background) <https://pharmaverse.github.io/admiral/articles/faq.html>

**ADRG** ADaM Data Review Guide (pdf end result !)  
\* SEE
<https://github.com/parmsam/quarto-adrg/blob/main/adrg-pilot4.qmd> \*
<https://github.com/RConsortium/submissions-pilot2-to-fda/blob/main/m5/datasets/rconsortiumpilot2/analysis/adam/datasets/adrg.pdf>

**ADSL** - required dataset format for CDISC (Adam); patient/treatment
level ; attempt to capture treatments/interventions in a STUDY; must be
flexible, yet rigourous. (clear)
<https://www.linkedin.com/pulse/decoding-adsl-treatment-variables-study-designs-clinical-baghai-hhzfe/>

- **Admiraldev** (some background)
  <https://pharmaverse.github.io/admiraldev/articles/admiraldev.html>

**box**

### What is CDISC?

The “I” is for interchange, ie to move data between computers and
applications. In particular, CDISC is an attempt to standardize
structure of data that flow from patient through data analysis so things
like dates, units, dataset fields are consistent. At the
government/regulary agency end, the standardization of data simplifies
comparisons.

CDISC is intended to be an improvement over [prior
methods](https://www.cdisc.org/kb/articles/short-history-cdisc-and-sas-transport-files)
to exchange data.[^4]

From an R developer’s point-of-view, this roughly boils down to data
tables and format. CDISC is both an abstraction and a guide to choosing
the right variables. Just like an engineer who grows special crystals
might benefit from learning a bit about group theory and various
symetries, so too an R developer might pick up insights from CDISC
abstractions.

Depending on abstraction: PLAN -\> COLLECT -\> ORGANIZE -\> ANALYSIS -\>
REPORTS OR, CDISC -\> CDASH -\> SDTM -\> ADaM -\>data analyst

SEE [^5] [^6]

[CDISC
wikipedia](https://en.wikipedia.org/wiki/Clinical_Data_Interchange_Standards_Consortium)
Good, not perfect, one page summary.

### Where to Start with CDISC?

Basic introduction:  
\* **CDISC 9 short videos (JAN 2025)** :
<https://www.youtube.com/watch?v=muzo9veBOFw&list=PL4vFrmnpUDeRziW2ozobayozgukgAmL1S>
\* [**CDISC data exchange
definitions**:](https://www.cdisc.org/standards/data-exchange) \*
**CDISC Genius (AI)[^7] :**
https://chatgpt.com/g/g-677223310d8081918ca4bdda574a5384-cdisc-genius \*
**CDISC Primer** : <https://www.cdisc.org/primer> \* **cdisc api
library** (info) <https://www.cdisc.org/cdisc-library>

### What are the CDISC specs?

Example: In ADaM specify columns, or the type (string, number etc) is
determined by metacore (metadata) and this in turn is based on … - Goal?
At R level, structure of ADaM, SDTM tables (deliverables) - [CDISC
videos](https://www.youtube.com/@CDISCInc/playlists) - [^CDISC
Glossary](https://datascience.cancer.gov/resources/cancer-vocabulary/cdisc-terminology)

### What exactly are these CDISC specs?

ODM - At simplest level, ODM is overall guide to formatting
data/metadata; what ADaM and SDTM datasets should look like and how to
pass as JSON files.
https://www.cdisc.org/standards/data-exchange/odm-xml/odm-v2-0  

``` verbatim
<ODM>
<STUDY>
  <SPONSOR>
  <VISITS>
  ...
```

Example schema: CDISC_schema:
<https://github.com/cdisc-org/DataExchange-ODM/blob/main/schema/ODM-clinicaldata.xsd>

SDTM schema (snippet)

``` verbatim
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

``` verbatim
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

``` verbatim
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

``` verbatim
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
(9-27-2024)
https://evs.nci.nih.gov/ftp1/CDISC/Define-XML/Define-XML%20Terminology.html

**define-xml** describes how to (encapsulate??) metadata needed to
create tabular dataset structure into a json `container`. - Define-XML
(https://www.cdisc.org/standards/foundational/define-xml/define-xml-v2-1-6)

**Controlled Terminology:**
https://evs.nci.nih.gov/ftp1/CDISC/Define-XML/Define-XML%20Terminology.html
**cdisc define-xml** https://www.linkedin.com/groups/4975366/ - official
cdisc define-xml (linkedin)

#### define-xml (in json)

{ “Study”: { “GlobalVariables”: { “StudyName”: “Example Study”,
“StudyDescription”: “A Phase 3 Clinical Trial”, “ProtocolName”: “XYZ123”
}, “ItemGroupDef”: \[ { “OID”: “IG.DM”, “Name”: “Demographics”, “Label”:
“Demographics”, “ItemRef”: \[ { “ItemOID”: “IT.DM.AGE”, “Mandatory”:
“Yes” }, { “ItemOID”: “IT.DM.SEX”, “Mandatory”: “Yes” } \] } \],
“ItemDef”: \[ { “OID”: “IT.DM.AGE”, “Name”: “AGE”, “Label”: “Age”,
“DataType”: “integer”, “CodeListRef”: { “CodeListOID”: “CL.AGEU” } }, {
“OID”: “IT.DM.SEX”, “Name”: “SEX”, “Label”: “Sex”, “DataType”: “text”,
“CodeListRef”: { “CodeListOID”: “CL.SEX” } } \] } }

### Examples: what filetype is end result?

Currently: xpt Future: json

### What is dataset-json standard ?

“dataset exchange format” in JSON file for tabular datasets Read [^8]
https://swhume.github.io/why-json-for-datasets

- XML, structured document (DOM, body, src, images,…)

- JSON, structured data

- database structure
  <https://www.lexjansen.com/pharmasug/2023/SS/PharmaSUG-2023-SS-140.pdf>

- dataset-json https://www.lexjansen.com/css-us/2023/PRE_01.pdf

- **Good explanation of cdisc dataset-json v1.1 specification**
  https://github.com/cdisc-org/dataexchange-datasetjson/blob/master/doc/dataset-json1-1.md

- cdisc json v1.1.0 user’s guide; compared to define-xml
  <https://wiki.cdisc.org/display/pub/dataset-json+v1.1+user%27s+guide>

https://github.com/cdisc-org/dataexchange-datasetjson-api/blob/main/dataset-json-api.html

### Examples (json v xpt)

cdisc examples (json v xpt)

> for anyone interested, **cdisc** has an open source [**dataexchange
> repo**](https://github.com/cdisc-org/dataexchange-datasetjson/tree/master/examples)
> here with examples of the adam datasets {adsl,adae,adlbc,adtte,adadas}
> used in pilot 5. interesting to compare the .xpt, .json, and .ndjson
> file formats and their properties. you can browse through using a data
> viewer. (robert devine)

- Blog: [how JSON fits](https://swhume.github.io/why-json-for-datasets)

- PharmaSUG 2022 Define-XML 2.0 to 2.1
  <https://www.lexjansen.com/pharmasug/2022/DS/PharmaSUG-2022-DS-064.pdf>

- (v 2.1)
  https://www.lexjansen.com/pharmasug/2022/ds/pharmasug-2022-ds-064.pdf

- trial example candidate for spec
  <https://github.com/cdisc-org/dataexchange-datasetjson-api>

### What is Dataset-XML

Substitute(?) for SAS V5 tranfer.

### More about json

- (wikipedia)<https://en.wikipedia.org/wiki/json>  
- (syntax) <https://www.w3schools.com/js/js_json_syntax.asp>  
- (\*\* create a schema)
  <https://json-schema.org/learn/getting-started-step-by-step>
- Schema keywords and tutorials
  https://json-schema.org/understanding-json-schema/keywords

#### Example schema with properties

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

- LinkML - tool to create & validate schema (json/yaml)
  \<https://linkml.io/linkml/

- (EXAMPLE: schema for atomic vector)
  <https://artifactdb.github.io/BiocObjectSchemas/>

- examine [atomic
  vector](https://artifactdb.github.io/BiocObjectSchemas/atomic_vector/v1.json)

- examne properties \| atomic vector \| properties \| enum (logical,
  integer …)

- (json for apis) <https://apisjson.org/>

### R implimenation

**datasetjson** - R package convert cdisc data between json and r
data.frame + special attributes (good example code)  
(json is usually only the transfer, not stored at either end).

- hard code special attribute(?) , ie not reading and incorporating info
  from json spec https://github.com/atorus-research/datasetjson.

- uses package **jasonvalidate::** to confirm data and a schema match.

- (\* getting started, code)
  <https://atorus-research.github.io/datasetjson/articles/datasetjson.html>

------------------------------------------------------------------------

### Post-ADaM analysis

the **cdisc analysis results data (ard or ardg) model** emerging
standard for encoding statistical analysis summaries in a
machine-readable format.

**ARS** - Analysis Results Standard (post-ADam, metadata) ( oct 2024
https://www.danieldsjoberg.com/ARD-RinPharma-workshop-2024/)

### More

- Pinnacle 21 (was called openCDISC)

- video (Define.xml 2.0, pinnacle21)
  <https://www.youtube.com/watch?v=8PzYO0YlO0I> Define.xml desribes
  content of an FDA submission.

- Pinnacle21 ( a company?)
  videos:<https://www.youtube.com/@pinnacle21llc/playlists>

- SAS
  <https://www.youtube.com/playlist?list=PLbW_LFBIHlxu2abXtm0KE3HSZu1YCuRMO>

- FDA Pilot JSON <https://www.youtube.com/watch?v=ljr6d4Aw7nA>

------------------------------------------------------------------------

### after CDISC (placeholder)

- *datacutr*
  https://www.youtube.com/watch?v=ZyK-Tiqw5hU&list=PLbcglKxZP5PPBplKMO9obNAjLIM7GGfp4&index=6
  has sample data; functions to restrict data to ONE date, or patients …
  a slice of data

- [DOM](https://developer.mozilla.org/en-US/docs/Web/API/Document_Object_Model) -
  tree structure representing html or xml document. Allows code running
  in browser to select elements of document.

- **expr() example** call: f(mtcars, var=expr(hp)) \# no need to use
  “hp” (string) f = function(ds, var) { dplyr::select(ds, !!var)}

**eCTD** **eCTR** = electronic communications ..

**end-to-end clinical reporting** https://pharmaverse.org/e2eclinical/

**harmonize** - harmonized means consistent metadata/specifications
object

- styler::style_pkg()  
- devtools::lint() \# package  
- devtools::test_coverage() \# entire package
- devtools::spell_check(use_wordlist = TRUE) \# package
- spelling::update_wordlist(pkg=“.”) \# runs spell AND asks to update
  WORDLIST

For File: Use these:

- active_fie = rstudioapi::getSourceEditorContext()\$path
- devtools::test_active_file()
- devtools::test_coverage_active_file()
- styler::style_file(path = ) \# dir, file
- lintr::lint(filename=““)
- spelling::update_wordlist(pkg=“.”) \# runs spell and asks to update
  WORDLIST
- urlchecker::url_check()

(see lintr package - many options to control nolint) [^9] lintr::lint()

**GxP** “Good Practice” esp regarding FDA submissions.

**LOCF** https://www.lexjansen.com/nesug/nesug09/po/PO12.pdf
https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4785044/ - missing
observtions? assume last reported value continues.

- **metacore** (Atorus, up to 6 datasets, info re: tables, columns, … )
  creates R object to hold all metadata needed for an ADaM (structure of
  tables, columns etc) Accepts .xslx, or define.xml, several formats
  that are company-specific. This vignette explains the process, if
  given define.xml
  <https://github.com/atorus-research/metacore/blob/main/vignettes/Example.Rmd>

For .xml, reads using xml2 package, example:
<https://xml2.r-lib.org/reference/read_xml.html#ref-examples>

video: (10/20/2023, R/Pharma, Intro to Pharmaverse covers the process to
ADaM)
<https://youtu.be/nHbDmxjVqRM?list=PLbcglKxZP5PPBplKMO9obNAjLIM7GGfp4>

Blog Post:
<https://posit.co/blog/creating-adsl-with-the-pharmaverse-part-2/>

File with reference datasets:ds …
https://github.com/atorus-research/metacore/blob/main/tests/testthat/test-reader.R
SEE: https://github.com/atorus-research/metacore

ds_spec - dataset name, purupse (ex: AE, DM) info ds_vars holds each
field (columns) of dataset var_spec

- **metatools** https://github.com/pharmaverse/metatools tools to
  develop, work with metacore objects (ex: companies may have different
  names to describe one entity) does some preliminary checks (harder
  analysis is done in admiral)

**ODM**

**ODM-XML** an xml file

## Pilot

**Pilot 2** - shiny, no webassembly

**Pilot 3** scripts, shiny; use admiral to generate ADaM (ADSL, ADAE)
–\> TLF

**Pilot 4** pilot2 + webassembly and/or container - now shiny does not
need httpuv - Ben likes container (easy transport) - But FDA like
webassembly, fewer parts to install (done via browser, no server,
compile in browser) container: webassembly and Podman (not open source)
https://rpodcast.quarto.pub/pilot4-webassembly-adrg/#introduction  
https://github.com/RConsortium/submissions-pilot4-webR - no .zip?
Docker? .tar.gz?

**Pilot 5**

**Pilot future: Nix OS, can isolate R in same OS**

**Programming Strategy**
https://pharmaverse.github.io/admiraldev/articles/programming_strategy.html

Coding (rlang
etc)https://pharmaverse.github.io/admiral/articles/concepts_conventions.html
PR overview
https://pharmaverse.github.io/admiraldev/articles/pr_review_guidance.html
PR/branches/commits/
https://pharmaverse.github.io/admiraldev/articles/git_usage.html

**PHUSE (UK)** - lots of conferences\|
https://phuse.global/Communications/Webinar_Wednesday
https://phuse.global/Working_Groups \[PHUSE Working Groups\] **pharmaR**
(original attempt) -\> pharmaverse

**pinnacle21** https://www.pinnacle21.com/ **oak**

**random.cdisc.data** package: create random AdAM datasets?
https://cran.r-project.org/web/packages/random.cdisc.data/random.cdisc.data.pdf

**R Validation Hub** (~50 companies) \| **R Consortium Working Group**
https://rconsortium.github.io/submissions-wg/ \[R Consortium\] R
Submissions Working Group\]
https://rconsortium.github.io/submissions-wg/

**R6** Advanced R Chapter 14 - object\$method (each class: n methods;
unlike S3 generic) - teal.code R6 chunks (‘exprs’ & env in container) -
teal.slice R6 filters

**rhino** good intro,box https://youtu.be/QmyilJr7jXs

**R Consortium Tables Working Group**:
https://rconsortium.github.io/rtrs-wg/

**riskmetric** package and a shiny app: *Riskasessment*

**SAP** - Statistical Analysis Plan \| Example:
https://cdn.clinicaltrials.gov/large-docs/80/NCT04182880/SAP_001.pdf
What is SAP? “A lot of what we make is based on the Study Design and
questions being asked in the study to prove the safety and efficacy of
the drug through something called the **SAP (Statistical Analysis
Plan)**. So which ADaMs, TLFs you pick is really dependent on the SAP.
There is something called the **Protocol** that is a higher-level
version of the SAP which influences the **eCRF (electronic Case Report
Form)** and determines what data is collected.” – Ben Straub

**SAS** Good validation (CDISC STDM/Admiral standard) R has many
packages, but who validates?

**SDTM** = Study Data Tabulation Model
https://en.wikipedia.org/wiki/SDTM

**sdtmchecks** SEE:
https://www.youtube.com/watch?v=tBL0Eo6CBdw&list=PLbcglKxZP5PPBplKMO9obNAjLIM7GGfp4&index=5

**Shiny**

**supplemental** There are the main data domains (= Parent in our
example e.g. DM) which contain pre-defined and standard variables. **New
variables** which are not as per standard cannot be added to a data
domain. If a user has additional data for a domain which cannot be
entered into the domain using the standard SDTM variables, then a
**supplemental qualifier dataset** must be used (SUPPDM in our example).

**TLG** - tables, listings, graphics ….
https://pharmaverse.org/e2eclinical/tlg/ - October 20, 2023 (rtables)
https://www.youtube.com/watch?v=3S4_WROtFK8 j k - Pawel Rucki: WebR to
TLG, 25NOV2024 (Demo @15:48)
https://youtu.be/vaoDUrUscZA?list=PLbcglKxZP5PPBplKMO9obNAjLIM7GGfp4

**Teal** Teal + ShinyLive (ie WebR; no need server)
https://pharmaverse.github.io/examples/interactive/teal.html 2024
Workshop:
https://github.com/pharmaverse/tealworkshop-phuseusconnect2024/tree/main/code

- May 16, 2023 Overview of Teal framework (no code)
  https://youtu.be/D2DJQYo3Nag

- October 20, 2023:(Dony\| very good walk through of config modules,
  filters, teal_slice(), in basic teal app)
  https://www.youtube.com/watch?v=3S4_WROtFK8

- October 24, 2024 (Dony \| intro to teal module)
  https://youtu.be/WnTgIWU59RM?list=PLbcglKxZP5PPrBVVV9AItiVXUCFcTQb9J

- teal vidoes 000_teal
  https://www.youtube.com/playlist?list=PLbcglKxZP5PPrBVVV9AItiVXUCFcTQb9J

- shiny videos (+ teal) 000_shiny
  https://www.youtube.com/playlist?list=PLbcglKxZP5PO-TktNs849mfbjY5UeWnoo

- shiny developer series:
  https://www.youtube.com/@ShinyDeveloperSeries/playlists

**tools** phuse.org/valtools (nice spreadsheet)

https://github.com/pharmaverse/ggsurvfit (seems interesting)

https://github.com/pharmaverse/envsetup (plumbing can be intersting)

https://github.com/pharmaverse/pharmaverseadam/issues/58

**XLSX** In Micrsoft Excel, XLSX is an XML-based open file format and
XLS is a proprietary Microsoft format.

## Empty Placeholder

## FAQ

**Tests** In tests, how to check correct error/warning is issued?\*\*

- Please use expect_snapshot() to ensure that the correct error message
  is issued. By the way, unit test for errors and warnings should never
  accept any error or warning but always check that the expected one is
  issued (by using expect_snapshot() or the class argument of
  expect_error()/expect_warning() ).

**Is my version of admiraldev, pharamverse, out-of-date?** - Check:
Namespace file & packageVersion(“admiraldev”) - install latest from
github by using devtools::install_github(“pharmaverse/admiraldev”

When we depend on a dev version of a package, we should also indicated
this in our DESCRIPTION file FYI

Imports: admiraldev (\>= 1.1.0.9006),

It used to be the case, that Remotes: would re-install all pkgs listed
in Remotes upon installation of the pkg, but that is no longer the case
after pak replaced remotes for GH intallations.

*Skills to focus on:*
https://pharmaverse.slack.com/archives/D07DL8CP00G/p1728234941977779
`templates, documentation & navigation, pkgdown & organization, R environments`

*Data:*
https://pharmaverse.slack.com/archives/D07DL8CP00G/p1722857716071859

*What is “starting date” ?* When is example data contrived, from CDISC,
a subset etc. the data usually starts at Informed Consent - RFISDTC

*When to use metacore/metatools ? Or, admiral? Seems to be overlap.*

    Yes there are lots of overlap between the packages.  For example, there are functions in metatools to bring copies of variables from SDTM or you could just use dplyr or base R to bring them over.  We built them independent so you didn't have to commit to them if you wanted to use one or the other.  I use both in my ADaM programming and work well together.  I think the example site has best example.

*How many “ADaM(s)” are there?*

    3 types of Adam (ADSL, BDS, occ...)   Is there ONE ADSL or many kinds;  was very confused about this.

    There is only one ADSL in each study, but each study's ADSL will
    look different depending on what is needed for Subject-level data
    as defined in the Study SAP (Statistical Analysis Plan), for
    example baseline tables and endpoints.  There is a forth ADaM
    called ADaM Other - which captures some exotic ADaM structures.

**Templates:** (not FAQ, a direction) We are trying to compare things
from the templates in CI Workflow; use of diffdf

Why do we use both library(pharmaversesdtm::ae) and
ae=pharamaversesdtm::ae

We are just trying to be explicit on where the data is coming from as we
are assuming folks are not super familiar with R yet if they are using
our template programs. Yes we could drop the library() call, but the
comment on the datasets origin is important to also point out to new
users.

*What topics does bi-weekly Admiral meetings cover?*

A lot of what we make is based on the Study Design and questions being
asked in the study to prove the safety and efficacy of the drug through
something called the SAP (Statistical Analysis Plan). So which ADaMs,
TLFs you pick is really dependent on the SAP. There is something called
the Protocol that is a higher-level version of the SAP which influences
the eCRF (electronic Case Report Form) and determines what data is
collected.However, you will always have an ADSL dataset!!

We have bi-weekly meetings on Wednesdays at 10 AM US EST. They are not
mandatory to be in the group but highly encouraged. You get to meet
various people and participate in discussions. However, we understand
that can be tough with full-time job needs. Occasionally we split out
into Working Groups to tackle various topics.

**History of package datasets**
https://app.slack.com/client/T028PB489D3/D07DL8CP00G

I’m not worried about creating the data in admiral. I believe this is
the way forward that you have been working on.We have been doing it for
3 years now just not using the recommended data/data-raw convention.The
pharmaverseadam package was created to allow folks to load ADaM data for
other projects rather than having to load admiral. We actually used to
have all those ADaMs in admiral but it bloated the package and decided
to remove them. So pharamverseadam came later and it is a little
confusing as our templates make those ADaMs and so adsl is identical
between the two packages.The templates should create the datasets (adsl
and adlb). admiral_adlb should require some subsetting with the proposed
Subjects. If the data is not an exact match, then it would be nice to
understand what is not matching. The diffdf package is very nice for
this.If it doesn’t match, then lets figure out why and it might just be
a minor updates to the templates that have been done over the last few
years. AGain I’m not particular worried as the package hasn’t changed so
drastically that the Hy’s Vignette would become unusable. (edited)

*SAP* - Statistical Analysis Plan \| Example:
https://cdn.clinicaltrials.gov/large-docs/80/NCT04182880/SAP_001.pdf

*How I join bi-weekly Admiral meetings?*
https://github.com/pharmaverse/admiral/discussions/2169#discussioncomment-10376594

Once you do a few more successfully merged PRs I will propose to core
team that you be included! Be great to have you involved.

*Reviewers: PR* (Ben) So I see everything that happens in admiral:
issues, conversations, PRs, etc as I have my settings that way. Yes
always assign a reviewer. You can ping people you have interacted with
and ask for review or use @pharmaverse/admiral teams to ask for
additional reviewers. If crickets, ping on slack as well; Stefan is the
best for thorough code review. Edoardo and I are okay for code, but we
are very user focused and pay close attention to documentation of
usability of the function. there are a few others out there but you
haven’t interacted with them much yet

**Steps before release** example of pre-release CRAN checklist
https://github.com/pharmaverse/admiral/discussions/2394

## Working with JSON

See https://json-schema.org/learn/getting-started-step-by-step

JSON data, but with more info not really sure of context, can even
validate: use JSON Schema!

    {
      "productId": 1,
      "productName": "A green door",
      "price": 12.50,
      "tags": [ "home", "green" ]
    }

Schema has few special `schema keywords` With right tool, can validate
the JSON data is indeed a valid JSON and follows JSON schema.

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

## Footnotes

pinnacle and api \[^CDISC_pinnacle_api\]:
https://www.lexjansen.com/pharmasug/2024/MM/PharmaSUG-2024-MM-245.pdf

This is the bottom <a name="bottom"></a>

[^1]: \[CDISC_api\]
    <https://wiki.cdisc.org/display/LIBSUPRT/Welcome+Package+for+CDISC+Library+Users>

[^2]: <https://www.cdisc.org/kb/articles/use-hl7-fhir-esource-pre-populate-cdash-case-report-forms-using-cdisc-odm-api>

[^3]: <https://www.coursera.org/learn/hands-on-clinical-reporting-using-r>

[^4]: <https://www.cdisc.org/kb/articles/short-history-cdisc-and-sas-transport-files>

[^5]: \[CDISC wikipedia\]
    <https://en.wikipedia.org/wiki/Clinical_Data_Interchange_Standards_Consortium>

[^6]: \[vendor_def\]
    <https://www.scian.com/statistical-programming-and-analysis/adam/define-xml/>
    \[^CDISC Glossary\]: \[CDISC_glossary\]
    <https://datascience.cancer.gov/resources/cancer-vocabulary/cdisc-terminology>

[^7]: \[CDISC_genius\]
    <https://chatgpt.com/g/g-677223310d8081918ca4bdda574a5384-cdisc-genius>

[^8]: \[swhume\] <https://swhume.github.io/why-json-for-datasets>

[^9]: <https://lintr.r-lib.org/articles/lintr.html>
