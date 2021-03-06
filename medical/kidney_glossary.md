---
title: Template for .Rmd 
date: "`r paste('last updated', 
    format(lubridate::now(), '%H:%M, %d %B %Y'))`"
output: 
  html_document:
    toc: true 
    toc_depth: 2
    toc_float: true
  pdf_document: 
    latex_engine: xelatex
toc: TRUE 
toc_depth:  1 
fontsize: 10pt 
geometry: margin=0.5in,top=0.25in 
---

<!--

# =========================================================================
IF PANDOC fails?  
# =========================================================================
[wants ulem.sty ] see ~/r_try_things_here/ tinytex .Rmd

Save as .Rmd, and knitr to html, works fine
rmarkdown::render(file, output_dir="~/Downloads/print_and_delete")

OR, use pandoc to generate .tex output.  Firefox can read and format .tex

vim:linebreak:spell:nowrap:cul tw=78 fo=tqlnr foldcolumn=3 cc=+1

# ======
  PANDOC
# ======
!pandoc % -t latex --toc -V linkcolor:blue -V fontsize=10pt -V geometry:margin=0.4in -o ~/Downloads/print_and_delete/out.pdf

!pandoc % -t latex --toc -V linkcolor:blue -V fontsize=10pt -V geometry:margin=0.4in -o ~/Downloads/print_and_delete/out.pdf

# very complicated?   try --pdf-engine xelatex
!pandoc % -f markdown -t latex --pdf-engine xelatex --toc -V linkcolor:blue -V fontsize=10pt -V geometry:margin=0.4in -o out.pdf

# want .tex output?
!pandoc % -f markdown -t latex --toc -V linkcolor:blue -V fontsize=10pt -V
geometry:margin=0.4in -o ~/Downloads/print_and_delete/out.tex

pandoc % \
    -f markdown \
    --include-in-header chapter_break.tex \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="DejaVu Serif" \
    -V monofont="DejaVu Sans Mono" \
		--pdf-engine=xelatex \
    -o ~/Downloads/print_and_delete/out.pdf
    

\usepackage option "normalem"
\input ulem.sty’
-->

#### /home/jim/documents/medical/kidney_glossary.md
## As of 28 DEC 2020


<!--

-	find URLS
\w\+:\/\/[^[:space:]]\+
 -->

####
 NIH glossary;   AUA 2014 Guidelines, www.kidney.org
* ANATOMY of KIDNEY- http://www.healthpages.org/anatomy-function/kidney/
* [CDC](https://www.cdc.gov/diabetes/programs/initiatives/kidney.html) (lot here)
* U of Chicago (Coe) http://kidneystones.uchicago.edu/
* OHSU text:   “Nephrology Secrets” | “Manual  of Nephrology”, Schier | WJ300 .M294
* “Renal and … Disorders”, 8th, Schier | WJ300, R391,1018
* Netter: Clinical Anatomy | QS 17
* Chapple, et al “Urodynamics Made Easy …” | WJ102.C467 u
* Smith’s  | WJ100 .S64 2013
* Medscape:  Nice overview of Hypocitraturia (http://bit.ly/2iLE7HD)


Heading Level 3, for letters. Normal text is Arial 9.  For
Single spacing, Shift-Enter.

Papers
Asplin, J.R. Urolithiasis (2016) 44: 33.
https://doi.org/10.1007/s00240-015-0846-5 (Litholink) he management of patients
with enteric hyperoxaluria.

-- A --

ACIDOSIS (vs. ALKALOSIS) -  Acidic blood. Normal Blood is basic pH- 7.35-7.45
(Urine s/d be slightly acidic, 6.5-7.0) https://en.wikipedia.org/wiki/Acidosis
Use  KCit, NaCit; Na Bicarbonate to lower blood acid.  Bicarbonate (HC03 -1  is
blood pH buffer.  Can add H or lose H) . 

  *  Metabolic Acidosis - Kidney not removing all acids from blood, or not enough
bicarbonate produced to alkalize.. Blood pH drops. Blood starts to absorb
Citrate (to alkalize) from Kidney, leaving less Cit for  urine.  Metabolic.

  *  Acidosis - acidic blood- . is bad for brain/heart. 

appendicitis 
Acidosis (AUA) can arise from a diet that is inordinately rich in foods with a
high potential renal acid load compared to low-acid (i.e.,  alkaline) foods.83
(high protein diet, forces kidney adaptation to handle acid load).  Foods
providing an acid load include meats, fish, poultry, cheese, eggs, and to a
lesser extent, grains.  Foods conferring an alkali load include nearly all
fruits and vegetables.  Milk and yogurt, as well as fats, are essentially
neutral for acid load.84 KCit therapy attempt to return kidney to normal
state, freeing Citrate to flow to urine.

Acid Load  - also increases UrCa excretion (depletes bones), esp sulfur amino
acids (mostly animal), such Methionine, Cysteine

**ALKALI THERAPY** - Use of one of : K+Citrate (not always tolerated, 1 mEq = 1080
g), Mg+Citrate (Magnesium), Na+Citrate (usu well tolerated but sodium).   Goal
is increase urinary citrate excretion (> 3 mmol/day).

-	Dose   large, up to  120 mEq/day  (Me:   40 mEq= 4 * 10mEq per pill).
-	Caution:   Western diet (protein) acid load to kidney.  Kidney adjusts.
	With Alkali therapy, acid-base balance roughly returns.  Kidney can give up
	its modifications to acid load.    BUT, balance not exact.  
-	See Coe:  How Citrate gets into Urine.

ALLOPURINOL -

-- Dosing issues, https://www.ncbi.nlm.nih.gov/pubmed/17897242

-- From Kaiser:
“Allopurinol is used to treat gout and certain types of kidney stones. It is
also used to prevent increased uric acid levels in patients receiving cancer
chemotherapy. These patients can have increased uric acid levels due to release
of uric acid from the dying cancer cells. Allopurinol works by reducing the
amount of uric acid made by the body. Increased uric acid levels can cause gout
and kidney problems.”

ANION GAP -- (mine = ?)

Usually in blood, but can be urine or any fluid.
Measures the excess of specific cations (Na+, K+ etc) over specific anions
(Cl-, HOCK.    K+ is lower and often ignored (?) HOCK- is bicarbonate or
“CO2”.   (details) Why positive, not zero?   AG measures presence of OTHER
(missing) cations, an indicator of disease?


APRT Deficiency (rare) -- Adenine (nucleobase)  normally converts to AMP.  But
APRT is genetic error, produces wrong enzyme, adenine converts to wrong
molecule which is toxic to kidney.  May not appear until adult.   15-20% do not
know they have it.   Effect varies even within same family.
(https://ghr.nlm.nih.gov/condition/adenine-phosphoribosyltransferase-deficiency)


-- B --

---
title: Template for .Rmd 
date: "`r paste('last updated', 
    format(lubridate::now(), '%H:%M, %d %B %Y'))`"
output: 
  html_document:
    toc: true 
    toc_depth: 2
    toc_float: true
  pdf_document: 
    latex_engine: xelatex
toc: TRUE 
toc_depth:  1 
fontsize: 10pt 
geometry: margin=0.5in,top=0.25in 
---

<!--

IF PANDOC fails?  [wants ulem.sty ] see ~/r_try_things_here/ tinytex .Rmd

Save as .Rmd, and knitr to html, works fine
rmarkdown::render(file, output_dir="~/Downloads/print_and_delete")

vim:linebreak:spell:nowrap:cul tw=78 fo=tqlnr foldcolumn=3 cc=+1
!pandoc % -t latex --toc -V linkcolor:blue -V fontsize=10pt -V geometry:margin=0.4in -o ~/Downloads/print_and_delete/out.pdf

# very complicated?   try --pdf-engine xelatex
!pandoc % -f markdown -t latex --pdf-engine xelatex --toc -V linkcolor:blue -V fontsize=10pt -V geometry:margin=0.4in -o ~/Downloads/print_and_delete/out.pdf

# want .tex output?
!pandoc % -f markdown -t latex --toc -V linkcolor:blue -V fontsize=10pt -V
geometry:margin=0.4in -o ~/Downloads/print_and_delete/out.tex

pandoc % \
    -f markdown \
    --include-in-header chapter_break.tex \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="DejaVu Serif" \
    -V monofont="DejaVu Sans Mono" \
		--pdf-engine=xelatex \
    -o ~/Downloads/print_and_delete/out.pdf
    

\usepackage option "normalem"
\input ulem.sty’
-->

#### /home/jim/documents/medical/kidney_glossary.md
## As of 28 DEC 2020


<!--

-	find URLS
\w\+:\/\/[^[:space:]]\+
 -->

####
 NIH glossary;   AUA 2014 Guidelines, www.kidney.org
* ANATOMY of KIDNEY- http://www.healthpages.org/anatomy-function/kidney/
* [CDC](https://www.cdc.gov/diabetes/programs/initiatives/kidney.html) (lot here)
* U of Chicago (Coe) http://kidneystones.uchicago.edu/
* OHSU text:   “Nephrology Secrets” | “Manual  of Nephrology”, Schier | WJ300 .M294
* “Renal and … Disorders”, 8th, Schier | WJ300, R391,1018
* Netter: Clinical Anatomy | QS 17
* Chapple, et al “Urodynamics Made Easy …” | WJ102.C467 u
* Smith’s  | WJ100 .S64 2013
* Medscape:  Nice overview of Hypocitraturia (http://bit.ly/2iLE7HD)


Heading Level 3, for letters. Normal text is Arial 9.  For
Single spacing, Shift-Enter.

Papers
Asplin, J.R. Urolithiasis (2016) 44: 33.
https://doi.org/10.1007/s00240-015-0846-5 (Litholink) he management of patients
with enteric hyperoxaluria.

-- A --

ACIDOSIS (vs. ALKALOSIS) -  Acidic blood. Normal Blood is basic pH- 7.35-7.45
(Urine s/d be slightly acidic, 6.5-7.0) https://en.wikipedia.org/wiki/Acidosis
Use  KCit, NaCit; Na Bicarbonate to lower blood acid.  Bicarbonate (HC03 -1  is
blood pH buffer.  Can add H or lose H) . 

  *  Metabolic Acidosis - Kidney not removing all acids from blood, or not enough
bicarbonate produced to alkalize.. Blood pH drops. Blood starts to absorb
Citrate (to alkalize) from Kidney, leaving less Cit for  urine.  Metabolic.

  *  Acidosis - acidic blood- . is bad for brain/heart. 

Acidosis (AUA) can arise from a diet that is inordinately rich in foods with a
high potential renal acid load compared to low-acid (i.e.,  alkaline) foods.83
(high protein diet, forces kidney adaptation to handle acid load).  Foods
providing an acid load include meats, fish, poultry, cheese, eggs, and to a
lesser extent, grains.  Foods conferring an alkali load include nearly all
fruits and vegetables.  Milk and yogurt, as well as fats, are essentially
neutral for acid load.84 KCit therapy attempt to return kidney to normal
state, freeing Citrate to flow to urine.

Acid Load  - also increases UrCa excretion (depletes bones), esp sulfur amino
acids (mostly animal), such Methionine, Cysteine

**ALKALI THERAPY** - Use of one of : K+Citrate (not always tolerated, 1 mEq = 1080
g), Mg+Citrate (Magnesium), Na+Citrate (usu well tolerated but sodium).   Goal
is increase urinary citrate excretion (> 3 mmol/day).

-	Dose   large, up to  120 mEq/day  (Me:   40 mEq= 4 * 10mEq per pill).
-	Caution:   Western diet (protein) acid load to kidney.  Kidney adjusts.
	With Alkali therapy, acid-base balance roughly returns.  Kidney can give up
	its modifications to acid load.    BUT, balance not exact.  
-	See Coe:  How Citrate gets into Urine.

ALLOPURINOL -
-- Dosing issues, https://www.ncbi.nlm.nih.gov/pubmed/17897242
-- From Kaiser:
“Allopurinol is used to treat gout and certain types of kidney stones. It is
also used to prevent increased uric acid levels in patients receiving cancer
chemotherapy. These patients can have increased uric acid levels due to release
of uric acid from the dying cancer cells. Allopurinol works by reducing the
amount of uric acid made by the body. Increased uric acid levels can cause gout
and kidney problems.”

ANION GAP -- (mine=?)  Usually in blood, but can be urine or any fluid.
Measures the excess of specific cations (Na+, K+ etc) over specific anions
(Cl-, HOCK.    K+ is lower and often ignored (?) HOCK- is bicarbonate or
“CO2”.   (details) Why positive, not zero?   AG measures presence of OTHER
(missing) cations, an indicator of disease?


APRT Deficiency (rare) -- Adenine (nucleobase)  normally converts to AMP.  But
APRT is genetic error, produces wrong enzyme, adenine converts to wrong
molecule which is toxic to kidney.  May not appear until adult.   15-20% do not
know they have it.   Effect varies even within same family.
(https://ghr.nlm.nih.gov/condition/adenine-phosphoribosyltransferase-deficiency)


-- B --

**BILE ACID MALABSORPTION** --
https://en.wikipedia.org/wiki/Bile_acid_malabsorption Effect can diarrhea.  Not
easy to test.

**B12** - not available in plant form;   best sources:  fish (clam, tuna, trout),
meat (beef liver), dairy also. Role?

BHP  -- Beign ….   Via UROFLOW + IVP can yield lots of info?
BLADDER --  volume ~ 400 ml (me:  pee ~ 100-200 ml?)
-	Chronic Residual Urine (?)  - reduced bladder function?
-	Acute Cystitis - Bladder can not stretch , involuntary pee   see Smith’s
BLOOD  - SERUM -
BUFFER - maintains pH by binding/releasing proton as needed.   Bicarbionate
(HC03 -1) Favorite buffer (for humans).  -- BiC- + H+  -> Carbonic Acid → CO2
(and reverse).

**BUN** (me = ?)-- protein metabolism.    Imperfect measure of filtration rate
because affected by GFR, protein intake, hydration, gastric bleeding and can be
fooled with too much water.
- Normal  BUN/Cr = 10/1;    obstruction : 20-40/1.

BUTYRATE - short-chain fatty acid, produced by gut bacteria   CLAIM:  in large
intestine, tightens protein chains that bind cells together, attracts mucus
coating (good), inhibits ‘leaky gut’ (thought disproven) .

-- C --

**CaOx - 2 crystal forms:**    CaOx mono (COM) and CaOx dihydrate (CO ), the
later worse because binds to epithelial cells.  Proteins act as ‘glue’ to hold
CaOx monohydrate (COM) crystals, once formed,  so COM aggregates into a stone.

(True?) -- ME: 2JAN2014: 50% Mono; 40% Dihydrate, 10% calcium phosphate
(hydroxy- and carbonate-) | 41 mg | 5-9 mm.
*	Stone Analysis:   Claim: If mostly monohydrate, suspect PH.
*	If mixed, suspect SH.

CHELATING - an agent (Ex: citrate) inhibits Ca crystal formation in kidney.   2
Cit bind 3 Ca(+2) atoms.  Several proteins also inhibit - at least 6 times, not
well understood.  

**CHRONIC KIDNEY DISEASE, CKD** (vs. ACUTE) - Ongoning, gradual
loss of kidney function.  (many causes - from diabetes to xxx prolonged urinary
obstruction)   DIET:   Less protein (esp non-dairy animal), less Na, less K.
Good news - loss can be controlled with proper care. About 15% US with CKD.
Most die WITH CKD, not from.
*	Stage I, GFR> 90, but kidney damage. 
*	Stage II, GFR 60-89, but kidney damage.
*	Stage III, GFR less than 60 for 3 months, even if no sign of kidney damage (protein, mcroalbum…).  
*	Stage IV, GFR less than 30? Nephrologist becomes primary doctor .
*	Stage V, GFR less than 15.  Dialysis or Transplant necessary for life.

-	Causes:  Diabetes (38%) | Hypertension (24%) | Glomerular Disease (15%) |
  Polycystic (5%) | Other (18%) -- Symptoms of decreasing KIdney Function:
* Acidosis (acid in blood, should be base) EDEMA - swelling  of tissues, esp
* ankles, due to fluid (Na) build up; can occur BEFORE proteinuria appears?
- ERYTHROPROTEIN - too few new RED blood cells.   Anemia Phosphate build up.

* Kidneys unable to remove all and Ca leaches from bones; Ca Phosphate forms.


(ToDo: rewrite)
**CITRATE**  (wiki: https://en.m.wikipedia.org/wiki/Citric_acid)  (see Coe:  urine
and citrate)

Citric acid is weak acid, stronger than acetic. pH is a measure of equilibrium
H+ concentration.  However, most common,  ie weak acids, not strong enough to
be fully dissociated, so H+ not quite as high as expected, giving higher PH.  

Citrate dissociates in 3 possible polyatomic  forms: 
- Citrate anion (-3)  is form with ability to sequester Ca. (2 Citrate
- molecules bind 3 Ca in a SALT)  Conc of this form varies with pH.

Citric Acid itself does NOT bind with Ca+2 and by itself is NOT useful to
reduce Ur Ox.

- Citrate vs Citric Acid - pH dependent! See Why Lemon/Lime Juice in the form
  of Citrate (-3), while Orange juice is more Citric Acid form, pH 6+ Citrate
  dominates

* https://www.physicsforums.com/threads/concentation-of-citric-acid-in-fruit-juice.428241/
* https://www.physicsforums.com/threads/ph-citric-acid.164118/

**Urine Citrate** - Regulated by Kidney.   To prevent Ca stones, risk is urine
citrate dependent (not urine pH)   Higher citrate, lower calcium in urine,
lower the risk.  ( But uric acid stones, the risk is pH dependent:  goal is
~pH=6.)   KIDNEY tries to balance URINE ACIDITY (explain) (normal urine
pH=5.5-7.0, better is 6.5-7.0)  

Kidney also produces or absorb citrate.  Per AUA, healthy urinary citrate >
640 mg/day (population mean)   Debate:  Is it Citrate per day, or
concentration?   pH role?   To know Citrate content in a fluid, , need to know
pH and total amount of citric acid.  

Do Not Believe diet soda citrate Label  (Coe).  Diet 7-up (10 mEq/L) and
Crystal Light Lemonade (21.7 mEq/L)...  are good sources of CITRATE!   1
KCitrate pill=10mEq

CaCitrate exists in 3 crystal forms (1 is rare) Avoid DIET drinks to
supplement Citrate.   Crystal Light Lemonade has 21.7 mEq Citrate/L (=2
KCitrate pills), Diet 7-Up = 10 mEq/L Reason:   Per NURSES STUDY, above age 40
GFR decreases ~ 1 mL/min per year, normal.    1 such DIET drink per day is no
problem.    But those who drank 2 such DIET drinks per day, lost on average 3
mL/min per year.  

Tamarind is excellent Citrate source, Tartaric Acid= sour taste,  
HCA = Citric + extra OH? (derivative of citric acid) , Citrate Lyase
(https://en.wikipedia.org/wiki/Tartaric_acid) (see:
http://www.news.pitt.edu/news/researchers-propose-new-treatment-prevent-kidney-stones)

Lemon Juice  in acidic solution is primarily citric acid, not in Citrate form
(Coe)   At higher pH( 6.5), Citrate form dominates Vitamin C, ascorbic acid,
has nothing to do with Citric Acid, though both are found in citrus fruits.
In blood, form of citric acid is CITRATE, 80-170 umol/L. (say ~120 umol/L =
0.12 mmol/L)   5-20% will wind up in urine.  Kidney will reabsorb rest.    In
blood, also have free Ca+2 (cations, and not bound to protein), ~ 1.0 mmol/L.
Also free Mg.    Both compete to bound with Oxalate.    CITRATE is stable
(here is where PTH comes in?)   Blood pH (7.35-7.45) is well-regulated,
homeostis.  In body, CITRATE affects LIPIDS, BRAIN, GLUCOSE, transport into
CELLS.    NaDC1?  NaDC2?  Reference
https://www.physicsforums.com/threads/ph-citric-acid.164118/ 

CITRATURIA
  -  presence of citrate in urine.   I have HYPOCITRATURIA (def:less than 320
     mg/day ).  Stone-formers are told to keep 500-800 mg/day.

  - CLAIM:   purpose of kidney Citrate  production is balance urine acidity.
    If low urine pH (acid), citrate levels are maintained and kidney produces
    less.   If high urine pH (base), kidney will increase citrate production.
    Urine pH usually slightly acidic (5.5-7.0; desired is 6.5-7.0)
    https://en.wikipedia.org/wiki/Urine#pH

COLLAGEN -- protein.   Tendons, bone-muscle, and Ligaments, bone-bone, are collagen.

**COLESTYRAMINE** (https://en.wikipedia.org/wiki/Colestyramine)
-	Colestyramine removes bile acids from the body by forming insoluble
	complexes with bile acids in the intestine, which are then excreted in the
	feces.  Normally bile acides reabsorbed near terminal portion of the small bowel **(ileum)** 

**CREATININE - Waste product in blood, kidney should remove.   Urinary
Creatinine excretion is relatively stable, day-to-day. ~8-20g/kg.  Product of
muscle breakdown.  Kidneys remove almost all creatinine from blood, without
any modification.   Rise in blood creatinine *may* be signal of reduced kidney
function (or ate more protein, intense exercise etc than usual).

-- D --

DIGESTION -- 
4-6 hours after eating  -- stomach empties
Additional 6-8 hours  (ie 10-16 hours after eating)   -- intestine processes, dumps into colon
1-3 days in Colon


TEST:    eat corn.  When do indigestible kernels appear in stool?
Moral?   If you get sick, probably what you ate a day or so ago, not  the most recent.
Diuretic - parsley!

-- E --

**EDEMA (“dropsy”)** -  fluid swelling, typically around ankles.   (Many
possible causes and many other uses for EDEMA.)   In case of kidney issues,
EDEMA will arise before protein appears in urine (proteinuria) and is due to
compromised kidney glomeruli or its capillaries??

**EGD** (no!(mistake) I will have 14 July 2017, with colonoscopy) wiki: https://is.gd/WyWgU6
Can rule out many things, but does not diagnose IBS Medline:
https://is.gd/VkQFSA Inspection of stomach to 2nd part of 4 of duodenum, which
itself is 1st of 3 parts to small intestine. (wiki: https://is.gd/kCOnyD)
Normal: The esophagus, stomach, and duodenum should be smooth and of normal
color.  Sounds like looking for irritation, ulcers, anything other than smooth
tissue.   This may include one of several issues from Crohn’s disease (an
autoimmune response, one of Inflamatory Bowel Diseases) to   ….     Symptoms of
IBD  (which I don’t have) can indicate one of several problems, which visual
inspection can detrmine (no blood test, for example).


ENDOCRINOLOGY -  (wiki) study of glands and their secretions, particularly the
*diseases* related to ETIOLOGY - underlying cause 

**ENTERIC** - relating to
intestines; passing through stomach to intestines; ex: enteric aspirin.

**ENTERIC HYPEROXALURIA**
Fat malabsorption promotes free fatty acids to bind with diet calcium, thus
reducing calcium available to precipitate diet oxalate. Delivery of
unabsorbed bile salts and fatty acids to the colon increases colonic
permeability, the site of oxalate hyper-absorption in enteric hyperoxaluria.
The combination of soluble oxalate in the intestinal lumen and increased
permeability of the colonic mucosa leads to hyperoxaluria. 

ENDOGENOUS Ox - Ox origin is inside body, e.g. synthesis, liver is main organ

Endourolologist - Urologist concentrating in urolithiasis, including
trans-ureter procedures  (vs laparoscopy?)

**ERYTHROPOIETIN** - too few new RED blood cells ⇒ anemia
EXOGENOUS - Ox origin is outside, e.g. food; Vit C breakdown is considered a 3rd source of Ox

-- F --

**FAT MALABSORPTION **- 
  -  Normal: fat is absorbed in small intestine, little reaches COLON.

  -  Abnormal:  Fat reaches COLON.   Since FAT tends to combine with Ca
     (why?), Ox remains free risking, absorption in colon.  Many possible reasons.
     Hard water (https://en.wikipedia.org/wiki/Hard_water) is rich in
     minerales like Mg, Ca.  Residue forms with Ca(‘goo’) when using hand soap
     (fatty acid).   Note:   Small intestine removes all from ~ 0.5 g/d,
     however normal feces up to 7 g fat.   see: see
     https://en.wikipedia.org/wiki/Fecal_fat_test.   

  -  Normally up to 7 grams of fat can be malabsorbed in people consuming 100
     grams of fat per day.  In patients with diarrhea, up to 12 grams of fat
     may be malabsorbed since the presence of diarrhea interferes with fat
     absorption, even when the diarrhea is not due to fat malabsorption.

see: https://en.wikipedia.org/wiki/Saponification
  -  Related (?)  Fatty Acid: Arachidonic Acid (20 chain) traps Ca+, Mg+ in
     intestine, leading to increased UrOx


FIBER  (or PLANT STRUCTURE?)   Acts as LAXATIVE to speed up excretion
(decrease transit time).  Unavailable to digestion via human intestinal
enzymes.  Source:  plant cell walls (97-98% of diet) or polysaccharides (2-3%,
food additives as pectin, gum) Polymers pass small intestine to colon.
Fermentable or non-Fermentable.      Fiber usuallly complex polysaccharides
(lignin proteins) or non-carbohydrate esters, even Ca+2 (?)   UK diet ~
20g/day mostly cerals.  African diet ~60-150g/day!


- SEEDS 
- BRAN - outer layer - mostly cellulose -indigestible fiber; also minerals, vit, protein
- GERM - embryo - rich in unsaturated fats, hence not very stable and
 usually removed in modern milling (roller pressure can melt fats and remove)
-  ENDOSPERM - starch cells
- RESISTIVE STARCH (wiki) Resistant to amylolytic degradation in
cooked/processed foods.  Not digested by human gut; increasingly found useful
to feed microbiome which produce host of beneficial effects.
African diet (beans, grains) 3-4 x Chinese or Indian diet, which in turn are
multiples of western diets.  Bacteria extract energy and nutrition from these
carbohydrates via fermentation.
- STARCH - glucose storage, branched molecule (amylose) or unbranched (amylopectin)
- LIGNAN - wood, bran, cereals - with structure - do not rot easily


FODMAPS --  (wiki: https://en.wikipedia.org/wiki/FODMAP) Fermentable
Olgasacchardies, Disaccharides , Monosaccharides, and polygols.    If excess
intake, small intestine unable to process and wind up in colon causing trouble
(?)   Many healthy foods have;   broccoli brussel sprouts raddico, avacado,
peach , mushroom, whole grain, legumes  (mimicks Irritable Bowel Syndrome?)
FREE RADICAL - very reactive; can introduce unintended reactions with DNA and
damage.   However, some forms are necessary for life and can kill bacteria.

(TODO:  Begin here)
FRUCTOSE - ½ glucose, ½ sucrose;  only carb that can increase Ur Ox, Ur Uric Acid, Ur Ca.  b/c only carb processed by LIVER, which controls Ox production.  (Be sure to get enough B6, Mg)   Main danger is high fructose syrup HFCS, but any risk from  too many apples or plain yogurt ?   In units of per 100 g,     Careful with apples & pears (raisins, oranges?)  (see:   2008 Taylor, Fructose Consumption)
apples have 10.4 g sugar (5.9 free fructose, 2.4 free glucose, 2.1 sucrose)
Pears 9.8 g sugar (6.2, 2.8, 0.8)
Onion 5.0 g         (2.0, 2.3, 0.7)
Sweet Potato   4.2  (0.7, 1.0, 0.7) 
Carrot             4.7 (0.6,1.0,0.7)
Honey          100.0 (50, 44, 1)
HFCS          100.0 (50,50,nil)
-- and UrCalcium spike, see Coe: http://bit.ly/2ixgvGt   Claims:  Glucose bad,
but Fructose is worst.   UrCal spikes AND UrVol decreases (double whammy).
During the spike, kidney can reabsorb Calcium as usual.   Forces bone to
release calcium to maintain balance.  No more than 10% added sugar.   In male,
at 2000 cal, this is 50 g added sugar per day (4 cal/g)

-- G --

**GFR** - 
See calculator:  https://www.kidney.org/professionals/KDOQI/gfr_calculator.
Exist models for plasma oxalate as function of eGFR, etc. (regressions)

GLOMERULUS - filter, entry to kidney tubular filtering system.   Sensitive to
blood pressure, scarring, inflammation;   supposed to block larger molecules
(blood cells, proteins) while smaller molecules pass.
https://en.wikipedia.org/wiki/Glomerulus_(kidney) Large surface area/thickness?
Once past Glomerulus, network of tubules, receptors re-capture anything useful
(nutrients, salts).  Filtered blood returns via Renal Vein, while waste
collects as urine.   Unfiltered blood arrives via Renal Artery.


        Water -                         0.28 nm
        DNA-diameter -                 2.5 nm
        Hemoglobin -                 7.0 nm
        E.Coli        -                 2000 nm
        Liver Cell -                 20,000 nm


GLYOXYLATE - precursor to OX, by adding Ca+      Amino acid HYDROXYPROLINE,
very abundant in meat diet (collagen) , catabolizes to Glyoxylate and
pyruvate. 

GOUT - uric acid excess/crystallization in blood. (FeOx insoluble)   Esp in
BEER, rich in Fe & Ox.   
GUT - Long path from mouth to anus.


-- H --
HEMOGLOBIN - normal 14.0 g - 18.0 g/dL (??)
HEMATOCRIT - percent of blood volume due to Red Blood Cells (normal: 40-54%)


HYDROXYPROLINE  protein, found in collagen, and then normally broken down by
liver chemicals.  If not, precursor to oxalate, PH. Meat diet is high in
Hydroxyproline.  https://clinicaltrials.gov/ct2/show/NCT0203854  (Mayo)

“The purpose of this study is to determine the contribution of hydroxyproline
metabolism to urinary oxalate and glycolate excretion in patients with primary
hyperoxaluria.  Oxalic acid (COOH)2 is an end product of metabolism that is
synthesized mainly in the liver. We have estimated that 10 - 20 mg is
synthesized in the body of healthy adults each day (1). The main precursor of
oxalate is glyoxylate (CHO•COOH). The bulk of the glyoxylate formed is
normally transaminated to glycine (NH2•CH2•COOH) by alanine: lyoxylate
aminotransferase (AGT) or reduced to glycolate (CHOH•COOH) by glyoxylate
reductase (GR). Less than 10% of the glyoxylate is oxidized to oxalate by
lactate dehydrogenase (LDH). In individuals with the disease, primary
hyperoxaluria, AGT, GR, or HOGA enzyme is deficient and the amount of oxalate
synthesized by the liver increases to 80 - 300 mg per day. The increased
oxalate excreted in urine can cause damage to kidney tissue. Calcium oxalate
stones may form in the kidney or calcium oxalate crystals may deposit in renal
tubules and the renal parenchyma (nephrocalcinosis). An increased rate of
oxalate synthesis could also contribute to idiopathic calcium oxalate stone
disease. Understanding the pathways of endogenous oxalate synthesis and
identifying strategies that decrease oxalate production could be beneficial
for individuals with these diseases.  Hydroxyproline is the primary source of
glyoxylate identified in the body (2). Daily collagen turnover of bone results
in the formation of 300 - 450 mg of hydroxyproline, which cannot be
re-utilized by the body and is broken down. This metabolism yields 180 - 250
mg of glyoxylate. Further hydroxyproline is obtained from the diet, primarily
from meat and gelatin-containing products. The bulk of the glyoxylate formed
is converted to glycine by the liver enzyme AGT, some to glycolate and a small
amount to oxalate. The proportion of these metabolites is not known with any
certainty. In this study, a quantitative estimate of the metabolites formed
will provide estimates of the contribution of hydroxyproline turnover to daily
oxalate production. These experiments will provide valuable information for
the future assessment of the contribution of hydroxyproline metabolism to
oxalate production in individuals with primary hyperoxaluria.”

HERNIA -Abdominal may be from past surgery, a sac forms between lining of
abdominal (aka Incisional or Ventral)

REF:
https://www.sages.org/publications/patient-information/patient-information-for-laparoscopic-ventral-hernia-repair-from-sages/

<!-- use backticks for force literal, such as < -->

HYPERCALCEMIA - High Serum Calcium.  Could be related to PTH glands or other factors,
including  excess D3 and Ca supplementation.(May 2020, I reduced D3 from >25k
IU/week to 15k IU/wk and Nov Litholink reduced serum Ca.)
REF:  https://www.mayoclinic.org/diseases-conditions/hypercalcemia/symptoms-causes/syc-20355523

HYPERCALCIURIA - (2nd most common)  Normal Ur Ca `< 200 mg/d -- moderate:
>200`; severe > 275. (me: 177, 206, 296-2019)   Causes:  Genetic, excess Ca
absorption intestine or kidney overload;  Renal, “leak of Ca?  Resorptive.
Coe: primary hyperparathyroidism (PHPT) and kidney unable to remove Ca.  Take
Thiazide.
-	Secondary Hypercalciuria, could be gland or ?? (see Coe)

HYPOCALCERIA  - low blood calcium (not me!)  Claim: With fat malabsorption,
the fat takes all dietary Ca to stool, too little for blood.
https://en.wikipedia.org/wiki/Hypocalcemia

HYPOCALCIURIA - low urine calcium (not me!) https://en.wikipedia.org/wiki/Hypocalciuria

HYPOCITRATURIA - less than 320 mg Ur citrate/d (Normal: 290-710).  Claim:  Ur Citrate
decreases stone risk by binding to Ca first (or inhibit Ca-Ox bind).   Citrate
useful to carry metals (Na, K, Ca).   LIVER usually absorbs Citrate (and little
reaches Ur?)   300 mg Citrate x 1 mole/192.19 g = 1.5 mmol.     
Good overview =
-	Medscape (http://bit.ly/2iLE7HD) (owned by WebMD) 
AUA:Urinary citrate is a
potent inhibitor of calcium stone formation.80 Although hypocitraturia is
variably defined, most healthy individuals excrete at least 600 mg daily in the
urine, and many believe this urinary level should constitute the minimum target
output for stone formers. Hypocitraturia is a common risk factor for stone
disease with an estimated prevalence of 20-60%.81, 82 -- Est.  40-60% stone
formers have this condition.  
-	Treatment for Idiopathic HypoCitraturia (me) =
mild metabolic alkalosis (in urine?) so kidney increases UrCitrate,   But keep
urine pH 6.5-7.0.   80-90% successfully raise UrCit this way.    lemons,
oranges, grapefruit, and lime (citrus)  and melon (non-citrus) good sources of
citrate that will raise Ur_Citrate.  
	-- Decrease UrCit:   strenuous exercise,
water pill, animal diet (b/c lowers blood pH, kidney must retain more Cit)


**HYPEROXALURIA** (found ~20%)-  excess Ur Ox.  Normal ~40 mg/d.  Est 60% Ox by
liver; 40% from diet (varies).   Note:  several papers mention that if UrOx is
high, look for Primary or Enteric factors even if not so obvious.  (check:
normal  urinary Ox : urinary calcium ~ 1:10 - true?) !  “Most patients with
severe secondary hyperoxaluria have gastrointestinal diseases that cause fat
malabsorption” [Mayo[1]]

1. Primary(1/85,000)  (> 100 mg/d, >1.0 mmol/1.73m3/d)  genetic (rare) - take B6 (pyridoxine) [‘extremely high’ - 87-231 mg/d]
   1. PH1 - test URINE GLYCOLATE (UrOx > 0.8 mmol/24 hours = 70 mg/24 hrs)  (affects young)

   2. PH2- test URINE GLYCERATE (affects later in life than  PH1) --
      deficiency of the enzyme glyoxylate reductase/hydroxypyruvate reductase
      (GR/HPR) (paper or paper)

   3. PH3 - ?
   4. Determination: Urine analysis, here;  Diagnostic path here

- (not due to diet); rare metabolic defect,  inherited, appears young; 3 or more types? I don’t have BUT …. “Primary hyperoxaluria should be suspected when urinary oxalate excretion exceeds 75 mg/day in adults without bowel dysfunction.”[5]
   * Type I
   * Type II
   * Type III (10% of PH), Ox overproduction (not diet)  UOx > 0.7 mmoL/1.73m^2 /24 hours  (BSA)
Suble genetic differences characterize PH.   Check:
   * Ur GLYCOLATE
   * L-glycerate
   * 4-hydro.... (HOG)
   * Di-hydro.. (DHG).

2. Enteric (~5%, >80 mg/d, or 0.7-1.0 mmol/1.73 m3/24 hours)) - GI problem: due
   to FAT MALABSORPTION and fat reaching colon (saponification of fatty acids
   with calcium) which eagerly binds with  Ca in colon, leaving free Ox to be
   absorbed; symptom chronic diarrhea.   Hard water (minerals) and soap (fatty
   acid) leaves residue hard to remove.   This residue in COLON may also damage
   COLON MUCOSA, again allowing increased OX to be absorbed.

ALSO, malabsorption fat (many possible causes):
	-	bacteria | fat malabsorption | chronic biliary or pancreas disorder |
		anything causing chronic diarrhea

Mechanism:    Normal digestion, fats, bile acids absorbed in small intestine.
Leaving Ca, Mg and Ox to bind and be excreted.    Anything goes wrong with
normal absorbtion and fat or bile or ... will continue to colon.   Ca will bind
to these, less chance to bind to Ox.    Also possible colon tissue more porous
to Ox, due to one of these conditions.  
Remark: castrated RATS have decreased UrOx; or with high dose Finasteride!

3. Diet (40-60 mg/d, 0.46-0.6mmol/1.73/d) - excess dietary Ox, low Ca
   consumption; lacking O. Formigenes; cell membrane Ox transport problem?
   [excess ascorbic acid >2 g/d increases Ox; 1 orange 70-100mg ascorbic; 1
   grapefruit, 88 mg;   (100% RDA = 60 mg?).  Often temporary, but still can
   lead to chronic kidney disease (anti-freeze! or very high consumption of
   star fruit) ref: http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4220346/ CASE
   STUDY: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5359106/

4. Idiopathic or Mild (40 - 60mg/d, 0.46-0.6 mmol/1.73/d) - spontaneous or
   unknown cause; might be diet or excess endogenous Ox by Liver; red blood
   cell transport; perhaps some genetic factor in one of these
   (“Differentiating between dietary and idiopathic hyperoxaluria can be
   difficult.”) Mayo: “increased kidney excretion of oxalate in the absence of
   identifiable factors...generally mild”
-- 13C can assist in intestinal absorption of Ox.
-- If not genetic, Liver Biopsy..    

Hyperoxaluria - higher in summer (diet)

-	"Enteric hyperoxaluria is further subdivided into excess ingestion of large
  loads of oxalate-rich foods and/or increased small bowel wall permeability
  to oxalate uptake. ~~Enteric hyperoxaluria leading to AON has numerous
  well-documented causes,~~ including consumption and juicing of oxalate-rich
  foods (spinach, parsley, peanuts, soy, and star fruit) in weight loss
  attempts, high intake of vitamin C supplementation, low vitamin B6 intake,
  toxic ingestions of ethylene glycol (antifreeze), and multiple causes of fat
  malabsorption (chronic pancreatitis, gastric bypass, medications inhibiting
  pancreatic lipase, and various causes of colitis including inflammatory
  bowel disease) [2, 5–9]." (source:
  https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6323504/) 


**HYPERURICOSURIA**  - urinary uric acid excretion >800 mg/day  (I did, pre allopuinol[2])
Cause: Too much diet purine, OR endogenous uric acid production (vs

HYPERURICEMIA - excess uric acid in BLOOD.  Increases risk b/c acts as ‘seed’
to CaOx xtals to form? (Claim:  plasma oxalate s/d be ZERO; > 30 is signal for
dialysis) Normal:   kidney should excrete all uric acid;   if load too high (meat
protein), kidney may not be able to eliminate quickly enough.

IDIOPATHIC X - have condition X, but w/o apparent
underlying ETIOLOGY (cause, origin, ‘reason’) (ex: Idiopathic HyperOxaluria)

-- K --

KIDNEY ANATOMY (Khan video)
Filters + Collects; maintains homeostasis (status quo) inlcuding blood pH, BP, waste (urea), blood osmolarity
-- Renal Cortex(shell), outer area of kidney, renal arttery splits into nephrons where wrap round, dip into Medula.   Renal  Vein also collects filtered blood from here.
-- Renal Medula (middle), middle area where neprhons dip down
-- Renal Calyx, just below Medula, first place urine appears
-- Renal Pelvis, center most area where all Calyx combine, urine flows to ureter
-- Hilum, opening from kidney center where ureter, renal vein, renal  artery enter/leave
See NEPHRON ANATOMY


**Kidney & Ultrasound**

  *  parenchymal echogenicity.  Echogenicity is ability to generate echo.
    Parenchymal refers to functional  part of an organ.  INCREASED parenchymal
    echogenicity may be indication of kidney disease (I have this)


**Kidney Biopsy** - invasive, useful to determine:   acute tubular injury,
tubular damage, atrophy, interstitual mononuclear cell inefficiency (?),
oxalate crystal deposition in tubules/ and/or interstitiute
REF:  KIReports

KETONE DIET.    Claim:  Switch from glucose (insulin) fuel to fat breakdown for
fuel (liver).   
-	Diet is minimal carbs,  enough protein only, 70% calories from "healthy"
	fats. These fats, also known as medium-chain Triglceries, do NOT need bile
	to break down; good for pancreas insufficiency.
-	Liver (lipase) will brake down triglerides to extract glycerol and convert to fuel
	for muscles (glycogen).   Advantages:   ketone fuel (water soluable) do not need protein to
	escort them around blood stream;  easily pass membranes to mitocondria.
	Less need for insulin at all.   Insulin (and related processes) associated with telling body to
	grow.  If body thinks less food around, it switches to preservation mode -
	keep every existing cell alive, etc.    Cancer can only use glucose, so
	ketone diet will 'starve' these cells.
-	Takes some effort to get Liver to transistion to fat breakdown
	(triglericides).
	Starvation will do it, but not pleasant.  
-	NOTE:  vigorous exercise actually temporarily raises glucose!    Walk
	around post-exercise will mop this up.

-- L --
LAB TESTS (BLOOD)
   * BUN, 15-25 mg/dl; if too high, kidneys not removing enough N from blood
   * Serum Creatinine, 0.5-1.3 mg/dl (not considered accurate kidney fct test), can rise quickly (2.0, 3.0 …) but not as meaningful as GFR
   * However, change in SerCreatinine may indicate change in GFR
   * Creatinine Clearance (24-hour urine) 90-130 ml/min (volume fo  BLOOD that is cleared of Creatinine per min) 
   * GFR (preferred) - 80-120 ml/min/1.73 m^2 (calculated)  (preferred to Blood Creatinine and does not require 24-hour urine); Stage 3 CKD less than 60 (lost ½ kidney function)
LACTOSE - composed of 2 simple sugars (galactose and glucose).    To separate hydrolyze or in small intestine exists lactase enyyzme (unless lactose-intoleratant?) .    Commercial lactose-free products: tablet with contain enzyme (ex: Beta-galactosidase) to be taken BEFORE milk.   Or, if lactose-free food, then done at factory via different process.
Claim:   milk (12 g Lactose) but yogurt (9 g) can’t be.   Ice cream 3g.     I don’t believe.
LARGE INTESTINE (or COLON + small pieces at beginning/end: CECUM and RECTUM) - 1.5 m long, food spends ~16 hours here,
   * PROXIMAL - first ⅔ of COLON
   * DISTAL - last ⅓ of COLON
   * Cecum is beginning of COLON, rich in bacteria.   (Appendex attaches here)
Over 99% of the bacteria in the gut flora are anaerobes,[4][5][6][7][8] but in the cecum, aerobic bacteria reach high densities.[4]


“LEAKY GUT” (discredited) - increased permeability of intenstine (beyond
normal).   Due to illness? toxins?  In this theory, responsible for many
illnesses (autism).

LEPTIN -Exercise decreases  this chemical.   A protein (‘sensor’, STAT3) is
sensitive to low leptin levels, triggering brain to ‘eat’, via dopamine.
LEPTIN considered a regulator of energy storage.

LIPOPROTEIN  Transport lipids, which are water insoluble.  HUGE.    Contain
LDLs, HDLs, Cholesterol etc.   However, higher fat contents, less dense is
lipoprotein (less dense cream rises to top of milk): Per Am Heart, keep Trig
<100 (<150 is low risk)


LIVER BIOPSY:
   1. Liver biopsy documenting alanine-glyoxylate aminotransferase (AGT)
      activity below the normal reference range confirming PH type 1 OR,
   2.  Liver biopsy documenting glyoxylate reductase/hydroxypyruvate reductase
       (GR/HPR) activity below the normal reference range confirming PH type 2


LOW-OXALATE DIET (LOX) - Variously mentioned as <40 mg, <50 mg, <75 mg per day.
LUMEN - open space in tubes, where linings are often complex, multi-structure.
INTRALUMIN


LYMPHATIC SYSTEM (vs. Vascular) - Clear liquid between cells.   Absorbed in small intestine, transmitted to veins in neck (bypass LIVER) and   distributed in blood.	Absorbs fat from intestine.
https://en.wikipedia.org/wiki/Lymphatic_system#Fat_absorption

-- M --
Magnesium (Mg++)  Role in stone prevention is DISUPUTED;   Normal urine, >= 70 mg/d of Mg.
here is one paper: https://www.ncbi.nlm.nih.gov/pubmed/16953377
Mg+2 - good at reducing Ox-2  absorption, but we need less of it then Ca, so Ca is usually first suggested.   Because Mg correlates to Ox in most foods, Mg supplements are recommended:  easily digested.  MgCitrate or supplemtns
Others say no clinical trials to support Mg supplements decrease risk  in otherwise healthy individuals.   HOWEVER,   people with diarera, bowel disease, fat malabsorption may need Mg to replace loss;( not for any stone prevention)
mEq (milliquivalents) - arcane measure - millimoles x VALANCE:    
10 mEq Potassium = 1080 mg
medullary nephrocalcinosis 
https://radiopaedia.org/articles/medullary-nephrocalcinosis
https://www.zocdoc.com/answers/17936/what-is-medullary-nephrocalcinosis-how-can-it-be-treated
MET- Medical Expulsive Therapy - Use  alpha-selective | alpha-blocker (ex: Tamsulosin) - relax ureter muscles (also relieves some BHP symptom ?)
-
MRI  measure kidney size/cysts or stones ?? (vs CT and all the other ways?)
NEPHRON ANATOMY-  (khan video)
--        basic plumbing/cleaning element of kidney (filter + collect), containing several tubing sections, including RENAL TUBULE where secretion and reabsorption occur;  ~0.8-1.5 MM nephrons per kidney; blood in; clean blood out; (100L/d/kidney)  rest passes on as urine; 
--  blood from renal artery flows into many arteriole arteries.   Each leads to glomerulus, where it winds itself into a strawberry-sized ball, and then continues as efferent artery.   At base of glomerulus  is Bowman's capsule or space where fluids collect (glucose, ions, white, red blood cells, water, amino acids) but not large protein molecules where are too large.   Bowman's capsule encapsulates glomerulus.
-- The interface between glomerular and Bowen is at least 3 layers which limit what can and can/not pass through.
-- Diameters of arteriole and efferent arteries affects amount of filtration.   Ideally arteriole wide, to let a lot of blood in, but efferent narrow forcing blood to slowly move through glomerulus and filter completely.
-- LOTS can go wrong!
-- proximal convoluted tubule, long winding tubing  leaving the glomerulus with water, Na, amino acids etc. from Bowen and reabsorbs %65 of fluids; then leaves renal cortex dives into Medulla for Loop of  Henle (video)


-- RENAL TUBULAR ACIDOSIS (RTA) - failure of kidney to remove blood  acid, or add enough alkali to blood,  so both blood and body accumulate acid; also reduces UrCit)   Since acid is NOT being eliminated, as normal,  the urine pH rises.  When the kidney can no longer lower urine pH below 5.3 the situation is RTA.   
-- Can live on total 300,000 nephrons (10%)   Claim:  Kidney can produce CITRATE, but if blood acidifies it will steal kidney CITRATE, leaving less for Urinary CITRATE
-- NEPHROTOXIN -- NSAIDS, COXIBS or heavy metals, or rhubarb! (details)   Measured by creatinine clearance (blood test).
NEPHROCALCINOSIS -  calcium deposits in renal parenchymal, several possible causes including hyperoxaluria (details)

NEPHROPATHY - kidney disease; do I have "secondary oxalate nephropathy"? Due to
oxalate deposition.
-	**AON: Acute oxalate nephropathy,** defined as acute kidney injury (AKI) due to biopsy-proven calcium oxalate deposition, Prognosis: Poor. ie AON can cause AKI.
-	**AKI: Acute kidney injury (aka acute kidney failure**
	(https://en.wikipedia.org/wiki/Acute_kidney_injury) rapid failure of kidney
	function (~ 7 days)
-	

NEPHROLITHIASIS - stone in kidney (vs ureter).  

NEPHROTIC SYNDROME -- high protein in urine, low serum protein; not same thing
as kidney failure.  one symptom:  foaming pee.  see
https://en.wikipedia.org/wiki/Nephrotic_syndrome

- O -


OSMOLES:   Once dissolved, # moles/L.    Example   1 mole NaCL  becomes 2
osmoles in water (both Na & Cl).    But 1 mole of glucose remains 1 osmole
because it does not dissociate.

OXALATE (Ox--) forms - Salt of Oxalic Acid, Ex: CaOx, MgOx;   Also Ester of
Oxalic Acid.  Oxalic acid is very reactive H2C2O4, removes rust.  Plants, no
kidneys,  use oxalate to store excess calcium from soil, water etc  as CaOx ,
esp. In older leaves, store as CaOx (salt), less bioavail?   Younger leaves
hold the Oxalic acid form, which has higher bioavailability in humans.
Oxalate 88 mg/1 mmoL   44 mg/f1 mEq.
- OXALATE Absorption - Theory?  Absorption to blood depends on Ox solubility of
  foods.    Foods high in Ox may not have same bioavailability.  Once Ox
  absorbed **90% of it will appear in urine 24-36 hours later.**
- OXALIC ACID (C2O4H2) dissociates into OX,  conjugation base( C2O4 -2)  and
  H+.  (pKc=1.27)  or 2 H+ (pKa=4.27) Relatively strong acid (?); simplest
  diCarboxylic acid (wiki: https://en.wikipedia.org/wiki/Carboxylic_acid) Known
  for transporting metals.   pKa for -2 to 10 (weak acids) strong acids pka
	less than -2
Case study:
http://www.revistanefrologia.com/en-publicacion-nefrologia-articulo-acute-renal-failure-due-oxalate-crystal-deposition-enteric-hyperoxaluria-X2013251411051070

- Oxalate measurement in urine:  several
  labs:http://ndt.oxfordjournals.org/content/early/2011/03/30/ndt.gfr147.full.pdf
  Ex: Oxalate Kit, Trinity Biotech, Berkeley, NJ;  591-D, 100 Assays;   need a
  spectrometer!  
- Ox measure in stool:   Ixion Biotech Inc (Alac hug, FL)
  more exact then PCR Ox test? (Didn't women at Allex..  say very difficult?).
- OXALATE catabolism - breakdown to smaller molecules
- Claim: Stone-formers either (1) produce more Ox, or  (2) absorb more food Ox,
  or (3) higher Ox interaction with food?  Active (small intestine) vs. Passive
  (gastro) Transport ???

“Sample” high Ox foods:
Almonds                        31% soluable
Black Beans                        5%
Cinnamon (1789 mg/f100 g)        6%
Turmeric (1969 mg/100g)                91%        


- Why no Mg, K, Na oxalate stones?  Because these are very soluble.  KOx, NaOx very
soluble); CaOx is not soluable (max is 5.0 - 6.7 g/L).  However, in stomach,
pH=2, CaOx is more soluble, so pass to intestines.  Mg(AN=12) is
567x more soluble.   
Ex: Milk (Ca) + Rubarb (v. high Ox) → gritty, CaOx xtals
in mouth.   Ca-Ox in intestine=good (goes to feces), Ca-Ox in urine (bad)
- FREE Oxalate is absorbed in LARGE COLON.
- “transient flood”  Even with adequate Calcium, 8% of Ox is absorbed?
  (CLARIFY!)   Of this, half is aborbed quickly, 1-2 hours, in small intestine.
  So if a meal contains 200 mg Ox (very high), expect 8 mg Ox (0.5 x 8%) will
  absorbed in first 1-2 hours.   This is too high for kidney.  (source:   Coe,
  quoting Holmes?) .    However,   200 mg Ox  spread throughout the day is much
  less harmful.


**OXALOSIS** - deposition of CaOx in kidney tissue (vs. nephrolithiasis CaOx
xtals in kidney), in extreme cases can deposit in eyes, bones, heart. (Source:
Goldfarb, in Ox & Hyperoxalia mtg, think this is PH1)


OXALATE HYPERABSORPTION - explain | where | cause.
One of several models:  (1) excess Ox absorption (2) Excess Ox production (3)
Excess retention of pre-cursor, but common xtals (4) Limited ability to inhibit
precursor xtal, etc etc 


OXALOBACTER  FORMIGENES  - Bacteria loves Oxalate, will reduce urinary Ox.
Claim:   ~100% of children have O.F.   but only 60-80% of adults do (b/c
antibiotics?)[3]    Paradox:  most Ox absorbed in small intestine (~2-6
hours), though can be absorbed in stomach or colon (enteric),  but OF is
present only  in colon! How does it intercept Ox?  Stool test?  PCR?

OMBS (Oxalate Metabolizing Bacteria Series), other bacteria? Note:  too much Ox
may actually  inhibit O. Formigenes.  Microbes in Urinary Tract (??) may form
“adaptive extra-renal pathway” to aid kidney eliminate Ox??

OXALATE BASELINE - Value? fast for 10-12 hours, eat HIGH Ox, monitor urine next
6-24 hours (normal Ur Ox < 40 mg/24 hours)

-- P --

**PANCREAS** (
Human pancreatic elastase 1 (E1) aids digestion (exocrine) by breaking down
fat in GI, specifically glycerol from triglicerides (main form of human fat);
Elastase remains undegraded during intestinal transit. Therefore, its
concentration in feces reflects exocrine pancreatic function. 

Actute pancreatitis:  
During an inflammation of the pancreas, E1 is released into the
**bloodstream**. Thus the quantification of pancreatic elastase 1 in **serum**
allows diagnosis or exclusion of acute pancreatitis.[12]

Note:  Dr Wei Wang said Elastase known for giving FALSE  results.
**My value = 29 ug/g (stool?), 14FEB2019**
-	200 µg elastase/g stool indicate normal exocrine pancreatic function
-	100-200 µg elastase/g stool suggest mild to moderate pancreatic insuffiency
-	100 µg elastase/g stool indicate exocrine pancreatic insufficiency
	(**EPI**).

Causes: 
-	Diagnosis/exclusion of exocrine pancreatic insufficiency caused by e.g.
	Chronic Pancreatitis, Cystic Fibrosis (error in CFTR gene => cloride flow
	across membranes (serious), Diabetes Mellitus, Cholelithiasis (Gallstones),
	“Failure to Thrive”, Pancreatic Cancer, Papillary Stenosis, tumor blocking
	in ducts.

Stool Fat 72-hour test: preparations:

* https://www.nationaljewish.org/treatment-programs/tests-procedures/gastroenterology/72-hour-fecal-fat-test
*	https://ltd.aruplab.com/tests/pub/2002356 (refrigerate)
*	https://www.healthline.com/health/fecal-fat#results
*	https://www.mayocliniclabs.com/test-catalog/Specimen/8310

EPI details:
"
The need for PERT in PEI without symptoms is a matter of debate, and randomized
clinical trials on this issue are lacking.
"
[ NIH: Dignose & Treat:  diagram] ( https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3831207/ )
https://en.wikipedia.org/wiki/Pancreatic_elastase
https://labtestsonline.org/tests/stool-elastase



[REF: ]( https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6212541/ )

>  "A significant proportion of patients with PEI demonstrate an inadequate
>  response to enteric-coated enzyme therapy alone[50]. One possible explanation
>  is reduced pancreatic bicarbonate secretion, impairing neutralization of
>  acidic chyme[51]. If the intra-duodenal pH is lower than 5.0, the enteric
>  coating will not dissolve on time and enzyme release will happen in the distal
>  small bowel[52].
>  
>  The use of acid suppression with enteric-coated PERT may increase gastric pH
>  and enhance PERT efficacy. In a prospective, open, comparative study, 21
>  patients with newly diagnosed PEI were treated with enteric-coated
>  mini-microspheres (40000 IU) three times a day, with the addition of
>  esomeprazole after 3 mo. 13C-MTG breath tests normalized in 57% of patients
>  with PERT monotherapy. In non-responders, the addition of esomeprazole
>  normalised fat digestion in an additional 29% of participants[50].
>  
>  Although data is of only moderate quality and large multicentre trials are
>  still required, the combined use of acid suppression and PERT is considered
>  appropriate when the response to PERT alone is suboptimal[6,25,37-39]. It
>  should be noted that there is limited evidence to support adjuvant acid
>  suppression in PEI caused by cystic fibrosis[53-56].
>  
>  If maldigestion does not respond to patient education, optimisation of PERT
>  dose and adjuvant acid suppression, then other causes, such as small
>  intestinal bacterial overgrowth, bile acid malabsorption, coeliac disease,
>  inflammatory bowel disease, and lactose intolerance should be investigated and
>  treated[6,37,39]."

**CHRONIC PANCREATITIS**
-	long-standing inflammation of the pancreas that alters the organ's normal
	structure and functions.[3] It can present as episodes of acute
	inflammation. Enzymes can even start working inside pancreas => harms
	cells. 
-	symptoms:  pain, diebetes I, fat in stool, wt loss
-	proximate cause:   ducts obstruct, calicification, swelling ...

Blood tests; The endoscopic retrograde cholangiopancreatography (**ERCP**) test
	or CT or NMR; less invasive:
[explaination & pictures](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3292642/)
	
**Radiological & tests** 
JR:  use this outine,  put in references to these procedures.

	- CT, can miss
CT: Note:  subtle abnormalities of early to moderate chronic pancreatitis are
beyond its resolution, and a normal finding on this study does not rule out
chronic pancreatitis.  

	endoscopic ultrasound (EUS, through mouth), biopsy, sound -	
**EUS**: https://pancreasfoundation.org/endoscopic-ultrasound-eus/
use sound, no radiation, through mouth, can take biopsy, very good for studying
pancreas, great for finding cancer. Requires general anesthesia.

	MRCP, form of MRI (magnetic resonance imaging).; last 20 years
-	MRCP(magnetic resonance cholangiopancreatography).  
now preferred to ERCP, non-invasive; last 20 years; shows flow in ducts.
Done:  winter 2019-2020. Repeat in 1 year.
[MRCP](https://en.wikipedia.org/wiki/Magnetic_resonance_cholangiopancreatography)

	ERCP - invasive, but can fix things, examine ducts, spot cancer.
-	**ERCP** (via throat, endoscopic retrograde cholangiopancreatography), very
	invasive, much more advanced procedure for GI doctors (often extra 1 year), now less done.
	Remove stones, put in stents, fix things.
https://www.niddk.nih.gov/health-information/diagnostic-tests/endoscopic-retrograde-cholangiopancreatography
-	https://en.wikipedia.org/wiki/Endoscopic_retrograde_cholangiopancreatography


	

**References:**

Panceatisis confirmation: (https://emedicine.medscape.com/article/181554-workup):
**EPI**:
https://pancreasfoundation.org/patient-information/ailments-pancreas/exocrine-pancreatic-insufficiency-epi/

-	https://en.wikipedia.org/wiki/Chronic_pancreatitis
-	https://emedicine.medscape.com/article/181554-overview#a5



**PATHOPHYSIOLOGY**	 - study of … disease and how it functions in body, i.e. study of abnormal systems

PDI (Percussion Diuresis Inversion) Claim:    Especially after SWL good way to eliminate ‘sand’   “Hang upsidedown”    Inclinded plane on back (like situps) or use chair, 10-15’, back on floor, feet raised on chair.     Hand over head.   Caution may raise BP
PHYSIOLOGICALLY - how organ works, its function, chemical and physical processes


POTASSIUM - Hypokalemia  (K+ too low);  Hyperkalemia (too high and needs to be monitored)
 -- K+ concentration higher INSIDE Cell wall;  Na+ concentration higher OUTSIDE cell wall.
-- An increase in SERUM Potassium ⇒ decreased kidney function.   (too high can trigger heart attack)


PROBIOTIC - contains LIVE bacteria


PREBIOTIC - nutrients for bacteria (but NO live) - garlic, onion, beta-carotene, lots of foods do.   CLAIM:  oligosaccharides (oligo = few), short chain simple sugars, only found in human (not cow) breast milk feed gut bacteria, not the baby.   Baby’s breath contains Hydrogen, an indicator than bacteria are eating (in colon).   Foods absorbed in short intestine, ie no bacteria, produce no hydrogen to exhale.

PHOSPHATE - kidneys should eliminate

**PROTEINURIA** - protein in urine;  several possible causes, including
compromised kidneys, diabetes … Normal kidneys readily re-absorb blood protein
and do not pass it to urine   MONITOR urine protein is key to manage GFR (?)

  * Albuminuria - common protein found in urine when kidneys fail to filter; a
large molecule should not be able to pass. No such thing as “micro”

    *  A1 represents normal to mildly increased urinary albumin/creatinine ratio
    (<30 mg/g or < 3 mg/mmmol); 

    * A2 represents moderately increased urinary albumin/creatinine ratio
    (30–300 mg/g or 3–30 mg/mmmol, previously known asmicroalbuminuria); and

    * A3 reflects severely increased urinary albumin/creatinine ratio >300
     mg/g or > 30 mg/mmol).[1]

**PURINES** - Considered a food source, associated with protein, esp animal,
that leads to higher serum uric acid (gout risk, i.e. crystaliziation) and
urinary uric acid.    Unknowns:  role of dairy in reducing?   Plants have
less, not zero purines.  Meat | Fish | eggs - esp. Sardines, anchovy.  TRUE?
increase UrCa, decrease Cit (both bad)


PHYTATE - Found in plants as  tight bonds to store  phosphorous (bran, beans,
nuts, cereals, seeds), varies with growing temp, fertilizer, grain;   Salt
form of PHYTIC Acid.   Urinary phytate reduces CaOx risk by binding to Ca.

In PLANTS, inhibits growth in seeds grain legume till just right T and
moisture; blocks Phosphate absorption; binds with Ca, Mg, Fe, Zn;  CLAIM:
people, esp developing countries where whole grain is dominate food, can have
depletion of minerals.

CLAIM: soaking, sprouting, fermenting will reduce phytic acid and therefore
increase digestion in human.

   * Humans have limited enzyme phytase, ie can not digest, i.e. so it is removed via feces.   Considered  “Anti-nutrient.”  Found in high fiber diets.   Claim: vegetarians have gut  bacteria can break down phytate.   In  farm animal fed grains, this leads to excess soil Phosphorus.   Ruminant animals can digest.   
   * To increase bioavail and absorption of PHYTATE in  intestine can cook|acid|ferment|sprout  (Role of bacteria?) 
   * In acid form, PHYTATE BINDS to Ca, Fe, Zinc and others, decreasing human absorption of these metals,  and can lead to deficiencies (ex: anemia)    (Ca+2 binding is pH dependent)   Some very high fiber African diets (mostly roots?) can yield excess phytate and nutritional problems.  .  Excess phytic acid ALSO inhibits enzymes (pepsin to digest protein, amylase to break starch to sugar, trypsin to digest protein). 
   * But PHYTATE also correlates to Ox in many foods.   In test-tube, PHYTATE inhibits Ca salt crystals.  Only 5% of PHYTATE reaches urine (“relatively non-absorbable).   But, once in urine, PHYTATE considered good, since will bind to Ca in urine  
   * PHYTATE or PHYTIC acid also plays role in intercellular; but source is NOT from diet and must be manufactured within cells.
   * Unclear!   For non-stone formers, what is PHYTATE benefit, even if they can break it down?  (into what?)   For stone-formers sounds like good AND bad.   In diet it correlates with Ox (BAD),  but if it reaches urine then PHYTATE is good, binds Ca.
   * Since PHYTATE corrolaes with OX, should I eat or not?       Some foods (soy,whole gains, beans, rice, cereals ) high in both OX and PHYTATE.   Does PHYTATE mitigate high OX?
   * Benefits: (confused?   anti-nutrient?)  But PHYTATE itself can also lead to reduced blood glucose, decreased triglycerides, cholesterol, acts as antioxidant, remove *excess* metals in body (Fe) and minerals related to kidney stones! (i.e. provides ‘chelating’) (GOOD).    In contaminated soil, phytate will remove harmful metals!

PHYTASE - an enzyme with can break PHYTATE bonds,  found in inactive form in plants with PHYTATE.  To activate, soak| sprout | ferment.    Humans with ‘healthy gut bacteria’  produce some phytase enzyme and possible to obtain nutrition from unsoaked grain.
POTENTIAL RENAL ACID LOAD (PRAL) - calc (http://mathsurvey.org/potential-renal-acid-load-calculation.html) if food will lead to acid or base
PURINES - source of urinary uric acid. 30% (estimate) of purines due to DIET[4]


**PTH** - Protein in blood from parathyroid gland, regulates
serum Ca and serum Phosphorous.   

**Hyperparathyroidism** is
excess of PTH, result of several possible factors including
Vitamin D, presence of disease etc.  Normal: tight balance, if
serum mineral is low, the gland releases PTH which directs gut
to absorb more mineral from food, or bone to leach more
minerals.(done in part with kidney also increasing calcitriol
vitamin D production.). Quickly readjusts to any deviations.

Abormal:  excessive PTH even if no mineral deficiency?

- can be primary (gland producing excess PTH, uneeded, can be
- fixed via surgery) or secondary (more complicated).
- elevated PTH leads to increased urine Phosphate.
- expect higher PTH would lead to **decreased** urCa, not the case in primary
  because urCa is effected by serum Ca conc (??).  The net is increased ur Ca.
- If urine has elevated phosphate and Calcium,  stones are soon to follow and
  usually how hyperthyroidism is found.
- Secondary,  can be low calcium, low vitamin D in diet or other. 
- CKD, Kidney no longer able to produce ample calcitriol (PTH continues high).
	
Ref:  (readable) (https://cjasn.asnjournals.org/content/10/7/1257)

[UT medical]
(http://www.utmedicalcenter.org/your-health/encyclopedia/test/003690/)

	-	[hyperparathryoid]https://en.wikipedia.org/wiki/Hyperparathyroidism
	-	[secondary](https://en.wikipedia.org/wiki/Secondary_hyperparathyroidism)
	[medline:] ( http://bit.ly/2uwpDMq  )

- May 2019 (Litholink)
	-	Serum P 3.7 (2.5-4 mg/dL)
	-	Serum Ca 9.4 (8.8 -10.2 mg/dL)
	-	UrCa 296 (less than 250 mg/day) and rising!
	-	UrP 1.222 (0.6 - 1.2 g/d)	
		
	-	In diagnosed primary PTHT: elevated PTH.  elevated serum
	-	Ca conc.  lower serum Ph conc.  wiki: test:  "intact" PTH
	-	(excludes pieces of the molecule) normal (10 to 55 pg/mL)
mL
	-	(July 2017) PTH, Intact        80 pg/mL        (15 - 75
	-	pg/mL)        H 2019:   PTH    84 pg/mL   high value could
	-	indicate Vit D problem or excess phosphorous (I am
	-	normal), due to chronic kidney disease.  (July 2017, Dr
	-	Vanek, OHSU says to increase Vitamin D to 4,000 IU per
	-	day!) Also many factors can raise PTH

	**2nd Hyperparathroid - Symptoms**
	*	low serum Ca (hypocalcemia - not me)
	*	H serum Phosphate
	*	H ALP
	*	H PTH
	
	**Tertiary Hyperparathryoid** chronic secondary
	hyperparathroid and gland no longer responds to changes in
	serum calcium. (bad news?

	**Parathryoid Adenoma** beign, almost always results in
	hyperparathryoid.  Confirm by scan.  Glad shouuld be in
	neck, but can migrate(?); so locating it is important.
	Surgery (only treatment) 95% success.


**SALT** of an acid - add a metal
Ex:  HCL, salts:  NaCL, KCl, CaCl
Other SALT examples:   acid + base;  metal + acid (Ca + oxalic acid), others


**SLC26**- family of proteins, transport in kidney; exchange Ox for sulfate|chloride

**SODIUM** - for kidney to remove excess Na, must also excrete Ca.   
1 tsp SALT = 2325 mg SODIUM
--- “Unfortunately, faced with a chronic excess of sodium to deal with, the
kidneys can get worn out; sodium levels in the blood then rise along with water
needed to dilute it, resulting in increased pressure on blood vessels and
excess fluid surrounding body tissues (read, swelling ….” (from Coe)

SUPERSATURATION - Unstable equilibrium in which concentrates exceeds solubility
but no precipitation occurs.  Key = crystallization is physical property and
urine must stay below SS level (Coe, basis of Litholink’s SS).  AUA Guideline
Statement 6:   “Urinary supersaturation of stone-forming salts is provided as
part of the 24-hour urine analysis panel from many commercially available
laboratories, or it can be calculated using a computer program. Supersaturation
can guide and monitor effectiveness of treatment and as such, is useful as part
of the initial 24-hour urine evaluation.46,47,55 “.

RANDALL’s PLAQUE - calcification (CaPhosphate) of subepithelial.

NEAR RENAL PAPILLA (termination of RENAL TUBUAL at connection to MINOR CALYX,
i.e base of Mendulla, aka Renal Pyramid.   Less than 2mm thick.   Pre-cursor to
stones?  KUB can NOT distinguish between a stone and RANDALL’s PLAQUE (paper)
or paper)  use ureteroscopy.    1-2 mm, calcium deposits;  aka interstitial
deposits (bet cells) of calcium.   Is it CaP or CaOx?? 

RENIN - If low Na (sweat, etc), kidney releases RENIN which triggers LIVER to
release Ang I, which triggers LUNGS to release Ang II which tirrigers ADRENAL
GLANDS (atop the kidney) Aldosterone….  to tell Kidney to retain Na and water
(increasing BP), half-life 20’.    ACE reduces secretion of Aldosterone. 

-- S --

SMALL INTESTINE (https://en.wikipedia.org/wiki/Small_intestine) aka small bowel
-	duodenum
-	jejunum, many things absorbed here. 
-	ileum, absorbs B12, bile acid, nutrients; next is large colon.

**STEATORRHEA** - https://en.wikipedia.org/wiki/Steatorrhea
-	excess fat in feces  (floats, smells, hard to flush, bulky); guideline > 6
  g/d stool fat

SUPERSATURATION (see Coe) - Concentration is above saturation level, but no
precipitation - unstable equilibrium.  Meaning max concentration before
precipitation, ie max equilibrium -- just as many molecules precipitate as
those return to solution per unit time.  Heat increases  solubility, for
example sugar in water.   Iif then cool SLOWLY , may remain in solution.
Shake it, crystals will form.

URINE, generally more stable (then sugar and water) and can remain SS for days!
BUT if making stones, we have SS urine and must lower the concentration.
Kidneys are water-efficient (ie reabsorb water) leaving urine potentially SS w/
salts.   Why?  Fresh water once rare than now and then much sodium in diet, so
less Calcium in urine. 

-- T --

Tamm-Horsfall protein (uromodulin) - low levels in urine may indicate stones.   Test?

-- U --

UUN24 - measure of urea in urine (normal: 7-20 g/d) see BUN.

UREA - Breakdown of proteins (nitrogen)

**URIC ACID** -  in Urine, relatively insoluble, end product of purine, in acid
(less than 5.5) will precipitate (uric acid stones)   BUT, even in alkaline
urine, excess uric acid can increase CaOx stone risk, providing ‘seed’ (process
involves several steps, monoSodium Urate (MSU) supersaturation.  Also, MSU
crystals in blood=GOUT).

-- Treatment for hyperuricemia : first raise urine pH with K+Cit- to 6.5-7.0,
which may also (slowly) dissolve uric acid stones.    If K+Cit- does not reduce
uric acid, then try Allopurinol.

-- Treatment for uric acid stones (uric acid lithiasis) - K+Cit- especially at
night to increase “alkalide tide”
(https://en.wikipedia.org/wiki/Alkaline_tide), blood pH rises for about 2 hours
after meal. (So kidney increases UrCit ??)  Stone formers have decreased
“alkaline tide” (?)


**URINE**-  pH should be 5.5-7.0   Acidic urine will reduce citrate (check?)
the natural stone inhibitor.   If sugar in blood, check for Diabetes.  To lower
urine pH:   grain, dairy, legumes, meat.   To raise urine pH:  fruit &
vegetables.   Urine is complex:   thousands of organic molecules.

**UREMIA** (“urine in the blood”) - originally referred to execess serum urea
(?) but now know that many other poisons in blood when kidneys compromised.  

**UROEPITHELIAL LINING** - Type of TRANSEPITHELIAL ("surrounds lumin") which
lines LUMEN of urinary track (renal pelvis, ureter, bladder, prostate) and is
approx 5 cells deep.  Can expand | contract. Barrier.

**Vitamin B6** - Rare, inherited disease in which body produces excess oxalate,
which binds with Ca in kidney tissue?? (oxalosis).   In some cases, B6 can
help.   Even in  a few non-inherited cases, claim B6 may work (note:  ‘in a
few’) However, B6 supplementation has risks.    Consult doctor.


**Vitamin D** - Aids Ca absorption from intestine.  When LOW, Ca absorption
~10-15% of Ca food.   When adequate, Ca absorption 30-40%.    When Blood Calcium
is LOW, PTH level rise and bones  leak Calcium. The PTH mechanism involves
kidneys releasing activated vitamin D, 1,25 dihydroxyvitamin D, or **calcitriol**.

Blood Test: 25(OH)D:___ ng/ml x 2.5 = __ nmol/L
Institute of Medicine    20 ng/ml MININUM - 50 ng/ml MAXIMUM
Others say range:        40-60 ng/ml
Claim:  2000 IU --->30 ng/dL.    4000 IU ---> 50 ng/dL.

Low D?   Symptoms include Bone Loss, Weaker Muscles, and  (discovered last 30
years) all kinds of other bad things (few clinical trials) 

Stone-formers:
CLAIM:   excess D will increase Ca absorption  MORE THAN non-stone formers.
(Better check this…. Not simple cause & effect)  Leaving less Ca in gut to
crystalize Ox. (So it too will be absorbed - colon?)   Avoid winter vacations
where sun exposure abruptly changes from  nil to every day; every hour.


=====
CT scan vs.  (readable)
http://www.controversies-and-consensus.com/lectures/moore.pdf 


Video
   * Kahn:  Kidney


Coe:
http://kidneystones.uchicago.edu/fluid-prescription/
   * Reread (revised)
   * KIDNEY STONE TYPES
   * ANALYSE EVERY KIDNEY STONE
   * KIDNEY STONE ANALYSIS - How Bad is It?
   * NEPHROCALCINOSIS
   * SUPERSATURATION
   * CLINICAL SUPERSATURATION



________________
[1] Mayo Clinic Communique, July/August 2013
[2] AUA, 2014 Guidelines #16, “allopurinol reduced the risk of recurrent calcium oxalate stones in the setting of hyperuricosuria (urinary uric acid excretion >800 mg/day) and normocalciuria.


[3]http://www.karger.com/Article/Abstract/80264 (Goldfarb - VA NY)  “There is evidence that the organism’s absence, perhaps sometimes due to courses of antibiotics, may be a cause of hyperoxaluria and stone formation. In early investigations, patients not colonized with the organism can be recolonized.”
[4]AUA, 2014, Guideline Statement 12: “... Nonetheless, if diet assessment suggests that purine intake is contributory to high urinary uric acid, patients may benefit from limiting high- and moderately-high purine containing foods. Although the reported purine content of foods varies, “high purine” foods are generally considered those containing more than 150 mg/3-ounce serving. These include specific fish and seafood(anchovies, sardines, herring, mackerel, scallops andmussels), water fowl, organ meats, glandular tissue, gravies and meat extracts. “Moderately-high” sources of purines include other shellfish and fish, game meats, mutton, beef, pork, poultry and meat-based soups and broths.96,97 Note that an individual may never or only rarely consume “high purine” foods but may habitually consume large portions of foods in the “moderately high” category. 


5] Guideline Statement #6 - 2014 AUA Guideline - Also, “ These patients should
be considered for referral for genetic testing and/or specialized urine
testing. REF<56>”



### Misc Notes
###  Mon  07 Dec 2020, notes from Oxalate & Hyperoxaluria Non-Profit group:
  - water & KCitrate is the standard.
  - PH1, some benefit from B6, others do not
  - FDA now considers UrOx a proxy for stones, stone burden.
  - PH1 kids are not in good shape;  solutions include kidney transplant and
  sometimes  BOTH kidney & liver transplant.
  - **Lumasiran** new medicine (2020) promises some hope for PH1.

**BILE ACID MALABSORPTION** --
https://en.wikipedia.org/wiki/Bile_acid_malabsorption Effect can diarrhea.  Not
easy to test.

**B12** - not available in plant form;   best sources:  fish (clam, tuna, trout),
meat (beef liver), dairy also. Role?

BHP  -- Beign ….   Via UROFLOW + IVP can yield lots of info?
BLADDER --  volume ~ 400 ml (me:  pee ~ 100-200 ml?)
-	Chronic Residual Urine (?)  - reduced bladder function?
-	Acute Cystitis - Bladder can not stretch , involuntary pee   see Smith’s
BLOOD  - SERUM -
BUFFER - maintains pH by binding/releasing proton as needed.   Bicarbionate
(HC03 -1) Favorite buffer (for humans).  -- BiC- + H+  -> Carbonic Acid → CO2
(and reverse).

**BUN** (me = ?)-- protein metabolism.    Imperfect measure of filtration rate
because affected by GFR, protein intake, hydration, gastric bleeding and can be
fooled with too much water.
- Normal  BUN/Cr = 10/1;    obstruction : 20-40/1.

BUTYRATE - short-chain fatty acid, produced by gut bacteria   CLAIM:  in large
intestine, tightens protein chains that bind cells together, attracts mucus
coating (good), inhibits ‘leaky gut’ (thought disproven) .

-- C --

**CaOx - 2 crystal forms:**    CaOx mono (COM) and CaOx dihydrate (CO ), the
later worse because binds to epithelial cells.  Proteins act as ‘glue’ to hold
CaOx monohydrate (COM) crystals, once formed,  so COM aggregates into a stone.

(True?) -- ME: 2JAN2014: 50% Mono; 40% Dihydrate, 10% calcium phosphate
(hydroxy- and carbonate-) | 41 mg | 5-9 mm.
*	Stone Analysis:   Claim: If mostly monohydrate, suspect PH.
*	If mixed, suspect SH.

CHELATING - an agent (Ex: citrate) inhibits Ca crystal formation in kidney.   2
Cit bind 3 Ca(+2) atoms.  Several proteins also inhibit - at least 6 times, not
well understood.  

**CHRONIC KIDNEY DISEASE, CKD** (vs. ACUTE) - Ongoning, gradual
loss of kidney function.  (many causes - from diabetes to xxx prolonged urinary
obstruction)   DIET:   Less protein (esp non-dairy animal), less Na, less K.
Good news - loss can be controlled with proper care. About 15% US with CKD.
Most die WITH CKD, not from.
*	Stage I, GFR> 90, but kidney damage. 
*	Stage II, GFR 60-89, but kidney damage.
*	Stage III, GFR less than 60 for 3 months, even if no sign of kidney damage (protein, mcroalbum…).  
*	Stage IV, GFR less than 30? Nephrologist becomes primary doctor .
*	Stage V, GFR less than 15.  Dialysis or Transplant necessary for life.

-	Causes:  Diabetes (38%) | Hypertension (24%) | Glomerular Disease (15%) |
  Polycystic (5%) | Other (18%) -- Symptoms of decreasing KIdney Function:
* Acidosis (acid in blood, should be base) EDEMA - swelling  of tissues, esp
* ankles, due to fluid (Na) build up; can occur BEFORE proteinuria appears?
- ERYTHROPROTEIN - too few new RED blood cells.   Anemia Phosphate build up.

* Kidneys unable to remove all and Ca leaches from bones; Ca Phosphate forms.


(ToDo: rewrite)
**CITRATE**  (wiki: https://en.m.wikipedia.org/wiki/Citric_acid)  (see Coe:  urine
and citrate)

Citric acid is weak acid, stronger than acetic. pH is a measure of equilibrium
H+ concentration.  However, most common,  ie weak acids, not strong enough to
be fully dissociated, so H+ not quite as high as expected, giving higher PH.  

Citrate dissociates in 3 possible polyatomic  forms: 
- Citrate anion (-3)  is form with ability to sequester Ca. (2 Citrate
- molecules bind 3 Ca in a SALT)  Conc of this form varies with pH.

Citric Acid itself does NOT bind with Ca+2 and by itself is NOT useful to
reduce Ur Ox.

- Citrate vs Citric Acid - pH dependent! See Why Lemon/Lime Juice in the form
  of Citrate (-3), while Orange juice is more Citric Acid form, pH 6+ Citrate
  dominates

* https://www.physicsforums.com/threads/concentation-of-citric-acid-in-fruit-juice.428241/
* https://www.physicsforums.com/threads/ph-citric-acid.164118/

**Urine Citrate** - Regulated by Kidney.   To prevent Ca stones, risk is urine
citrate dependent (not urine pH)   Higher citrate, lower calcium in urine,
lower the risk.  ( But uric acid stones, the risk is pH dependent:  goal is
~pH=6.)   KIDNEY tries to balance URINE ACIDITY (explain) (normal urine
pH=5.5-7.0, better is 6.5-7.0)  

Kidney also produces or absorb citrate.  Per AUA, healthy urinary citrate >
640 mg/day (population mean)   Debate:  Is it Citrate per day, or
concentration?   pH role?   To know Citrate content in a fluid, , need to know
pH and total amount of citric acid.  

Do Not Believe diet soda citrate Label  (Coe).  Diet 7-up (10 mEq/L) and
Crystal Light Lemonade (21.7 mEq/L)...  are good sources of CITRATE!   1
KCitrate pill=10mEq

CaCitrate exists in 3 crystal forms (1 is rare) Avoid DIET drinks to
supplement Citrate.   Crystal Light Lemonade has 21.7 mEq Citrate/L (=2
KCitrate pills), Diet 7-Up = 10 mEq/L Reason:   Per NURSES STUDY, above age 40
GFR decreases ~ 1 mL/min per year, normal.    1 such DIET drink per day is no
problem.    But those who drank 2 such DIET drinks per day, lost on average 3
mL/min per year.  

Tamarind is excellent Citrate source, Tartaric Acid= sour taste,  
HCA = Citric + extra OH? (derivative of citric acid) , Citrate Lyase
(https://en.wikipedia.org/wiki/Tartaric_acid) (see:
http://www.news.pitt.edu/news/researchers-propose-new-treatment-prevent-kidney-stones)

Lemon Juice  in acidic solution is primarily citric acid, not in Citrate form
(Coe)   At higher pH( 6.5), Citrate form dominates Vitamin C, ascorbic acid,
has nothing to do with Citric Acid, though both are found in citrus fruits.
In blood, form of citric acid is CITRATE, 80-170 umol/L. (say ~120 umol/L =
0.12 mmol/L)   5-20% will wind up in urine.  Kidney will reabsorb rest.    In
blood, also have free Ca+2 (cations, and not bound to protein), ~ 1.0 mmol/L.
Also free Mg.    Both compete to bound with Oxalate.    CITRATE is stable
(here is where PTH comes in?)   Blood pH (7.35-7.45) is well-regulated,
homeostis.  In body, CITRATE affects LIPIDS, BRAIN, GLUCOSE, transport into
CELLS.    NaDC1?  NaDC2?  Reference
https://www.physicsforums.com/threads/ph-citric-acid.164118/ 

CITRATURIA
  -  presence of citrate in urine.   I have HYPOCITRATURIA (def:less than 320
     mg/day ).  Stone-formers are told to keep 500-800 mg/day.

  - CLAIM:   purpose of kidney Citrate  production is balance urine acidity.
    If low urine pH (acid), citrate levels are maintained and kidney produces
    less.   If high urine pH (base), kidney will increase citrate production.
    Urine pH usually slightly acidic (5.5-7.0; desired is 6.5-7.0)
    https://en.wikipedia.org/wiki/Urine#pH

COLLAGEN -- protein.   Tendons, bone-muscle, and Ligaments, bone-bone, are collagen.

**COLESTYRAMINE** (https://en.wikipedia.org/wiki/Colestyramine)
-	Colestyramine removes bile acids from the body by forming insoluble
	complexes with bile acids in the intestine, which are then excreted in the
	feces.  Normally bile acides reabsorbed near terminal portion of the small bowel **(ileum)** 

**CREATININE - Waste product in blood, kidney should remove.   Urinary
Creatinine excretion is relatively stable, day-to-day. ~8-20g/kg.  Product of
muscle breakdown.  Kidneys remove almost all creatinine from blood, without
any modification.   Rise in blood creatinine *may* be signal of reduced kidney
function (or ate more protein, intense exercise etc than usual).

-- D --

DIGESTION -- 
4-6 hours after eating  -- stomach empties
Additional 6-8 hours  (ie 10-16 hours after eating)   -- intestine processes, dumps into colon
1-3 days in Colon


TEST:    eat corn.  When do indigestible kernels appear in stool?
Moral?   If you get sick, probably what you ate a day or so ago, not  the most recent.
Diuretic - parsley!

-- E --

**EDEMA (“dropsy”)** -  fluid swelling, typically around ankles.   (Many
possible causes and many other uses for EDEMA.)   In case of kidney issues,
EDEMA will arise before protein appears in urine (proteinuria) and is due to
compromised kidney glomeruli or its capillaries??

**EGD** (no!(mistake) I will have 14 July 2017, with colonoscopy) wiki: https://is.gd/WyWgU6
Can rule out many things, but does not diagnose IBS Medline:
https://is.gd/VkQFSA Inspection of stomach to 2nd part of 4 of duodenum, which
itself is 1st of 3 parts to small intestine. (wiki: https://is.gd/kCOnyD)
Normal: The esophagus, stomach, and duodenum should be smooth and of normal
color.  Sounds like looking for irritation, ulcers, anything other than smooth
tissue.   This may include one of several issues from Crohn’s disease (an
autoimmune response, one of Inflamatory Bowel Diseases) to   ….     Symptoms of
IBD  (which I don’t have) can indicate one of several problems, which visual
inspection can detrmine (no blood test, for example).


ENDOCRINOLOGY -  (wiki) study of glands and their secretions, particularly the
*diseases* related to ETIOLOGY - underlying cause 

**ENTERIC** - relating to
intestines; passing through stomach to intestines; ex: enteric aspirin.

**ENTERIC HYPEROXALURIA**
Fat malabsorption promotes free fatty acids to bind with diet calcium, thus
reducing calcium available to precipitate diet oxalate. Delivery of
unabsorbed bile salts and fatty acids to the colon increases colonic
permeability, the site of oxalate hyper-absorption in enteric hyperoxaluria.
The combination of soluble oxalate in the intestinal lumen and increased
permeability of the colonic mucosa leads to hyperoxaluria. 

ENDOGENOUS Ox - Ox origin is inside body, e.g. synthesis, liver is main organ

Endourolologist - Urologist concentrating in urolithiasis, including
trans-ureter procedures  (vs laparoscopy?)

**ERYTHROPOIETIN** - too few new RED blood cells ⇒ anemia
EXOGENOUS - Ox origin is outside, e.g. food; Vit C breakdown is considered a 3rd source of Ox

-- F --

**FAT MALABSORPTION **- 
  -  Normal: fat is absorbed in small intestine, little reaches COLON.

  -  Abnormal:  Fat reaches COLON.   Since FAT tends to combine with Ca
     (why?), Ox remains free risking, absorption in colon.  Many possible reasons.
     Hard water (https://en.wikipedia.org/wiki/Hard_water) is rich in
     minerales like Mg, Ca.  Residue forms with Ca(‘goo’) when using hand soap
     (fatty acid).   Note:   Small intestine removes all from ~ 0.5 g/d,
     however normal feces up to 7 g fat.   see: see
     https://en.wikipedia.org/wiki/Fecal_fat_test.   

  -  Normally up to 7 grams of fat can be malabsorbed in people consuming 100
     grams of fat per day.  In patients with diarrhea, up to 12 grams of fat
     may be malabsorbed since the presence of diarrhea interferes with fat
     absorption, even when the diarrhea is not due to fat malabsorption.

see: https://en.wikipedia.org/wiki/Saponification
  -  Related (?)  Fatty Acid: Arachidonic Acid (20 chain) traps Ca+, Mg+ in
     intestine, leading to increased UrOx


FIBER  (or PLANT STRUCTURE?)   Acts as LAXATIVE to speed up excretion
(decrease transit time).  Unavailable to digestion via human intestinal
enzymes.  Source:  plant cell walls (97-98% of diet) or polysaccharides (2-3%,
food additives as pectin, gum) Polymers pass small intestine to colon.
Fermentable or non-Fermentable.      Fiber usuallly complex polysaccharides
(lignin proteins) or non-carbohydrate esters, even Ca+2 (?)   UK diet ~
20g/day mostly cerals.  African diet ~60-150g/day!


- SEEDS 
- BRAN - outer layer - mostly cellulose -indigestible fiber; also minerals, vit, protein
- GERM - embryo - rich in unsaturated fats, hence not very stable and
 usually removed in modern milling (roller pressure can melt fats and remove)
-  ENDOSPERM - starch cells
- RESISTIVE STARCH (wiki) Resistant to amylolytic degradation in
cooked/processed foods.  Not digested by human gut; increasingly found useful
to feed microbiome which produce host of beneficial effects.
African diet (beans, grains) 3-4 x Chinese or Indian diet, which in turn are
multiples of western diets.  Bacteria extract energy and nutrition from these
carbohydrates via fermentation.
- STARCH - glucose storage, branched molecule (amylose) or unbranched (amylopectin)
- LIGNAN - wood, bran, cereals - with structure - do not rot easily


FODMAPS --  (wiki: https://en.wikipedia.org/wiki/FODMAP) Fermentable
Olgasacchardies, Disaccharides , Monosaccharides, and polygols.    If excess
intake, small intestine unable to process and wind up in colon causing trouble
(?)   Many healthy foods have;   broccoli brussel sprouts raddico, avacado,
peach , mushroom, whole grain, legumes  (mimicks Irritable Bowel Syndrome?)
FREE RADICAL - very reactive; can introduce unintended reactions with DNA and
damage.   However, some forms are necessary for life and can kill bacteria.

(TODO:  Begin here)
FRUCTOSE - ½ glucose, ½ sucrose;  only carb that can increase Ur Ox, Ur Uric Acid, Ur Ca.  b/c only carb processed by LIVER, which controls Ox production.  (Be sure to get enough B6, Mg)   Main danger is high fructose syrup HFCS, but any risk from  too many apples or plain yogurt ?   In units of per 100 g,     Careful with apples & pears (raisins, oranges?)  (see:   2008 Taylor, Fructose Consumption)
apples have 10.4 g sugar (5.9 free fructose, 2.4 free glucose, 2.1 sucrose)
Pears 9.8 g sugar (6.2, 2.8, 0.8)
Onion 5.0 g         (2.0, 2.3, 0.7)
Sweet Potato   4.2  (0.7, 1.0, 0.7) 
Carrot             4.7 (0.6,1.0,0.7)
Honey          100.0 (50, 44, 1)
HFCS          100.0 (50,50,nil)
-- and UrCalcium spike, see Coe: http://bit.ly/2ixgvGt   Claims:  Glucose bad,
but Fructose is worst.   UrCal spikes AND UrVol decreases (double whammy).
During the spike, kidney can reabsorb Calcium as usual.   Forces bone to
release calcium to maintain balance.  No more than 10% added sugar.   In male,
at 2000 cal, this is 50 g added sugar per day (4 cal/g)

-- G --

**GFR** - 
See calculator:  https://www.kidney.org/professionals/KDOQI/gfr_calculator.
Exist models for plasma oxalate as function of eGFR, etc. (regressions)

GLOMERULUS - filter, entry to kidney tubular filtering system.   Sensitive to
blood pressure, scarring, inflammation;   supposed to block larger molecules
(blood cells, proteins) while smaller molecules pass.
https://en.wikipedia.org/wiki/Glomerulus_(kidney) Large surface area/thickness?
Once past Glomerulus, network of tubules, receptors re-capture anything useful
(nutrients, salts).  Filtered blood returns via Renal Vein, while waste
collects as urine.   Unfiltered blood arrives via Renal Artery.


        Water -                         0.28 nm
        DNA-diameter -                 2.5 nm
        Hemoglobin -                 7.0 nm
        E.Coli        -                 2000 nm
        Liver Cell -                 20,000 nm


GLYOXYLATE - precursor to OX, by adding Ca+      Amino acid HYDROXYPROLINE,
very abundant in meat diet (collagen) , catabolizes to Glyoxylate and
pyruvate. 

GOUT - uric acid excess/crystallization in blood. (FeOx insoluble)   Esp in
BEER, rich in Fe & Ox.   
GUT - Long path from mouth to anus.


-- H --
HEMOGLOBIN - normal 14.0 g - 18.0 g/dL (??)
HEMATOCRIT - percent of blood volume due to Red Blood Cells (normal: 40-54%)


HYDROXYPROLINE  protein, found in collagen, and then normally broken down by
liver chemicals.  If not, precursor to oxalate, PH. Meat diet is high in
Hydroxyproline.  https://clinicaltrials.gov/ct2/show/NCT0203854  (Mayo)

“The purpose of this study is to determine the contribution of hydroxyproline
metabolism to urinary oxalate and glycolate excretion in patients with primary
hyperoxaluria.  Oxalic acid (COOH)2 is an end product of metabolism that is
synthesized mainly in the liver. We have estimated that 10 - 20 mg is
synthesized in the body of healthy adults each day (1). The main precursor of
oxalate is glyoxylate (CHO•COOH). The bulk of the glyoxylate formed is
normally transaminated to glycine (NH2•CH2•COOH) by alanine: lyoxylate
aminotransferase (AGT) or reduced to glycolate (CHOH•COOH) by glyoxylate
reductase (GR). Less than 10% of the glyoxylate is oxidized to oxalate by
lactate dehydrogenase (LDH). In individuals with the disease, primary
hyperoxaluria, AGT, GR, or HOGA enzyme is deficient and the amount of oxalate
synthesized by the liver increases to 80 - 300 mg per day. The increased
oxalate excreted in urine can cause damage to kidney tissue. Calcium oxalate
stones may form in the kidney or calcium oxalate crystals may deposit in renal
tubules and the renal parenchyma (nephrocalcinosis). An increased rate of
oxalate synthesis could also contribute to idiopathic calcium oxalate stone
disease. Understanding the pathways of endogenous oxalate synthesis and
identifying strategies that decrease oxalate production could be beneficial
for individuals with these diseases.  Hydroxyproline is the primary source of
glyoxylate identified in the body (2). Daily collagen turnover of bone results
in the formation of 300 - 450 mg of hydroxyproline, which cannot be
re-utilized by the body and is broken down. This metabolism yields 180 - 250
mg of glyoxylate. Further hydroxyproline is obtained from the diet, primarily
from meat and gelatin-containing products. The bulk of the glyoxylate formed
is converted to glycine by the liver enzyme AGT, some to glycolate and a small
amount to oxalate. The proportion of these metabolites is not known with any
certainty. In this study, a quantitative estimate of the metabolites formed
will provide estimates of the contribution of hydroxyproline turnover to daily
oxalate production. These experiments will provide valuable information for
the future assessment of the contribution of hydroxyproline metabolism to
oxalate production in individuals with primary hyperoxaluria.”

HERNIA -Abdominal may be from past surgery, a sac forms between lining of
abdominal (aka Incisional or Ventral)

REF:
https://www.sages.org/publications/patient-information/patient-information-for-laparoscopic-ventral-hernia-repair-from-sages/

<!-- use backticks for force literal, such as < -->

HYPERCALCEMIA - High Serum Calcium.  Could be related to PTH glands or other factors,
including  excess D3 and Ca supplementation.(May 2020, I reduced D3 from >25k
IU/week to 15k IU/wk and Nov Litholink reduced serum Ca.)
REF:  https://www.mayoclinic.org/diseases-conditions/hypercalcemia/symptoms-causes/syc-20355523

HYPERCALCIURIA - (2nd most common)  Normal Ur Ca `< 200 mg/d -- moderate:
>200`; severe > 275. (me: 177, 206, 296-2019)   Causes:  Genetic, excess Ca
absorption intestine or kidney overload;  Renal, “leak of Ca?  Resorptive.
Coe: primary hyperparathyroidism (PHPT) and kidney unable to remove Ca.  Take
Thiazide.
-	Secondary Hypercalciuria, could be gland or ?? (see Coe)


HYPOCITRATURIA - less than 320 mg Ur citrate/d (Normal: 290-710).  Claim:  Ur Citrate
decreases stone risk by binding to Ca first (or inhibit Ca-Ox bind).   Citrate
useful to carry metals (Na, K, Ca).   LIVER usually absorbs Citrate (and little
reaches Ur?)   300 mg Citrate x 1 mole/192.19 g = 1.5 mmol.     
Good overview =
-	Medscape (http://bit.ly/2iLE7HD) (owned by WebMD) 
AUA:Urinary citrate is a
potent inhibitor of calcium stone formation.80 Although hypocitraturia is
variably defined, most healthy individuals excrete at least 600 mg daily in the
urine, and many believe this urinary level should constitute the minimum target
output for stone formers. Hypocitraturia is a common risk factor for stone
disease with an estimated prevalence of 20-60%.81, 82 -- Est.  40-60% stone
formers have this condition.  
-	Treatment for Idiopathic HypoCitraturia (me) =
mild metabolic alkalosis (in urine?) so kidney increases UrCitrate,   But keep
urine pH 6.5-7.0.   80-90% successfully raise UrCit this way.    lemons,
oranges, grapefruit, and lime (citrus)  and melon (non-citrus) good sources of
citrate that will raise Ur_Citrate.  
	-- Decrease UrCit:   strenuous exercise,
water pill, animal diet (b/c lowers blood pH, kidney must retain more Cit)


**HYPEROXALURIA** (found ~20%)-  excess Ur Ox.  Normal ~40 mg/d.  Est 60% Ox by
liver; 40% from diet (varies).   Note:  several papers mention that if UrOx is
high, look for Primary or Enteric factors even if not so obvious.  (check:
normal  urinary Ox : urinary calcium ~ 1:10 - true?) !  “Most patients with
severe secondary hyperoxaluria have gastrointestinal diseases that cause fat
malabsorption” [Mayo[1]]

1. Primary(1/85,000)  (> 100 mg/d, >1.0 mmol/1.73m3/d)  genetic (rare) - take B6 (pyridoxine) [‘extremely high’ - 87-231 mg/d]
   1. PH1 - test URINE GLYCOLATE (UrOx > 0.8 mmol/24 hours = 70 mg/24 hrs)  (affects young)

   2. PH2- test URINE GLYCERATE (affects later in life than  PH1) --
      deficiency of the enzyme glyoxylate reductase/hydroxypyruvate reductase
      (GR/HPR) (paper or paper)

   3. PH3 - ?
   4. Determination: Urine analysis, here;  Diagnostic path here

- (not due to diet); rare metabolic defect,  inherited, appears young; 3 or more types? I don’t have BUT …. “Primary hyperoxaluria should be suspected when urinary oxalate excretion exceeds 75 mg/day in adults without bowel dysfunction.”[5]
   * Type I
   * Type II
   * Type III (10% of PH), Ox overproduction (not diet)  UOx > 0.7 mmoL/1.73m^2 /24 hours  (BSA)
Suble genetic differences characterize PH.   Check:
   * Ur GLYCOLATE
   * L-glycerate
   * 4-hydro.... (HOG)
   * Di-hydro.. (DHG).

2. Enteric (~5%, >80 mg/d, or 0.7-1.0 mmol/1.73 m3/24 hours)) - GI problem: due
   to FAT MALABSORPTION and fat reaching colon (saponification of fatty acids
   with calcium) which eagerly binds with  Ca in colon, leaving free Ox to be
   absorbed; symptom chronic diarrhea.   Hard water (minerals) and soap (fatty
   acid) leaves residue hard to remove.   This residue in COLON may also damage
   COLON MUCOSA, again allowing increased OX to be absorbed.

ALSO, malabsorption fat (many possible causes):
	-	bacteria | fat malabsorption | chronic biliary or pancreas disorder |
		anything causing chronic diarrhea

Mechanism:    Normal digestion, fats, bile acids absorbed in small intestine.
Leaving Ca, Mg and Ox to bind and be excreted.    Anything goes wrong with
normal absorbtion and fat or bile or ... will continue to colon.   Ca will bind
to these, less chance to bind to Ox.    Also possible colon tissue more porous
to Ox, due to one of these conditions.  
Remark: castrated RATS have decreased UrOx; or with high dose Finasteride!

3. Diet (40-60 mg/d, 0.46-0.6mmol/1.73/d) - excess dietary Ox, low Ca
   consumption; lacking O. Formigenes; cell membrane Ox transport problem?
   [excess ascorbic acid >2 g/d increases Ox; 1 orange 70-100mg ascorbic; 1
   grapefruit, 88 mg;   (100% RDA = 60 mg?).  Often temporary, but still can
   lead to chronic kidney disease (anti-freeze! or very high consumption of
   star fruit) ref: http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4220346/ CASE
   STUDY: https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5359106/

4. Idiopathic or Mild (40 - 60mg/d, 0.46-0.6 mmol/1.73/d) - spontaneous or
   unknown cause; might be diet or excess endogenous Ox by Liver; red blood
   cell transport; perhaps some genetic factor in one of these
   (“Differentiating between dietary and idiopathic hyperoxaluria can be
   difficult.”) Mayo: “increased kidney excretion of oxalate in the absence of
   identifiable factors...generally mild”
-- 13C can assist in intestinal absorption of Ox.
-- If not genetic, Liver Biopsy..    

Hyperoxaluria - higher in summer (diet)

-	"Enteric hyperoxaluria is further subdivided into excess ingestion of large
  loads of oxalate-rich foods and/or increased small bowel wall permeability
  to oxalate uptake. ~~Enteric hyperoxaluria leading to AON has numerous
  well-documented causes,~~ including consumption and juicing of oxalate-rich
  foods (spinach, parsley, peanuts, soy, and star fruit) in weight loss
  attempts, high intake of vitamin C supplementation, low vitamin B6 intake,
  toxic ingestions of ethylene glycol (antifreeze), and multiple causes of fat
  malabsorption (chronic pancreatitis, gastric bypass, medications inhibiting
  pancreatic lipase, and various causes of colitis including inflammatory
  bowel disease) [2, 5–9]." (source:
  https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6323504/) 


**HYPERURICOSURIA**  - urinary uric acid excretion >800 mg/day  (I did, pre allopuinol[2])
Cause: Too much diet purine, OR endogenous uric acid production (vs

HYPERURICEMIA - excess uric acid in BLOOD.  Increases risk b/c acts as ‘seed’
to CaOx xtals to form? (Claim:  plasma oxalate s/d be ZERO; > 30 is signal for
dialysis) Normal:   kidney should excrete all uric acid;   if load too high (meat
protein), kidney may not be able to eliminate quickly enough.

IDIOPATHIC X - have condition X, but w/o apparent
underlying ETIOLOGY (cause, origin, ‘reason’) (ex: Idiopathic HyperOxaluria)

-- K --

KIDNEY ANATOMY (Khan video)
Filters + Collects; maintains homeostasis (status quo) inlcuding blood pH, BP, waste (urea), blood osmolarity
-- Renal Cortex(shell), outer area of kidney, renal arttery splits into nephrons where wrap round, dip into Medula.   Renal  Vein also collects filtered blood from here.
-- Renal Medula (middle), middle area where neprhons dip down
-- Renal Calyx, just below Medula, first place urine appears
-- Renal Pelvis, center most area where all Calyx combine, urine flows to ureter
-- Hilum, opening from kidney center where ureter, renal vein, renal  artery enter/leave
See NEPHRON ANATOMY


**Kidney & Ultrasound**

  *  parenchymal echogenicity.  Echogenicity is ability to generate echo.
    Parenchymal refers to functional  part of an organ.  INCREASED parenchymal
    echogenicity may be indication of kidney disease (I have this)


**Kidney Biopsy** - invasive, useful to determine:   acute tubular injury,
tubular damage, atrophy, interstitual mononuclear cell inefficiency (?),
oxalate crystal deposition in tubules/ and/or interstitiute
REF:  KIReports

KETONE DIET.    Claim:  Switch from glucose (insulin) fuel to fat breakdown for
fuel (liver).   
-	Diet is minimal carbs,  enough protein only, 70% calories from "healthy"
	fats. These fats, also known as medium-chain Triglceries, do NOT need bile
	to break down; good for pancreas insufficiency.
-	Liver (lipase) will brake down triglerides to extract glycerol and convert to fuel
	for muscles (glycogen).   Advantages:   ketone fuel (water soluable) do not need protein to
	escort them around blood stream;  easily pass membranes to mitocondria.
	Less need for insulin at all.   Insulin (and related processes) associated with telling body to
	grow.  If body thinks less food around, it switches to preservation mode -
	keep every existing cell alive, etc.    Cancer can only use glucose, so
	ketone diet will 'starve' these cells.
-	Takes some effort to get Liver to transistion to fat breakdown
	(triglericides).
	Starvation will do it, but not pleasant.  
-	NOTE:  vigorous exercise actually temporarily raises glucose!    Walk
	around post-exercise will mop this up.

-- L --
LAB TESTS (BLOOD)
   * BUN, 15-25 mg/dl; if too high, kidneys not removing enough N from blood
   * Serum Creatinine, 0.5-1.3 mg/dl (not considered accurate kidney fct test), can rise quickly (2.0, 3.0 …) but not as meaningful as GFR
   * However, change in SerCreatinine may indicate change in GFR
   * Creatinine Clearance (24-hour urine) 90-130 ml/min (volume fo  BLOOD that is cleared of Creatinine per min) 
   * GFR (preferred) - 80-120 ml/min/1.73 m^2 (calculated)  (preferred to Blood Creatinine and does not require 24-hour urine); Stage 3 CKD less than 60 (lost ½ kidney function)
LACTOSE - composed of 2 simple sugars (galactose and glucose).    To separate hydrolyze or in small intestine exists lactase enyyzme (unless lactose-intoleratant?) .    Commercial lactose-free products: tablet with contain enzyme (ex: Beta-galactosidase) to be taken BEFORE milk.   Or, if lactose-free food, then done at factory via different process.
Claim:   milk (12 g Lactose) but yogurt (9 g) can’t be.   Ice cream 3g.     I don’t believe.
LARGE INTESTINE (or COLON + small pieces at beginning/end: CECUM and RECTUM) - 1.5 m long, food spends ~16 hours here,
   * PROXIMAL - first ⅔ of COLON
   * DISTAL - last ⅓ of COLON
   * Cecum is beginning of COLON, rich in bacteria.   (Appendex attaches here)
Over 99% of the bacteria in the gut flora are anaerobes,[4][5][6][7][8] but in the cecum, aerobic bacteria reach high densities.[4]


“LEAKY GUT” (discredited) - increased permeability of intenstine (beyond
normal).   Due to illness? toxins?  In this theory, responsible for many
illnesses (autism).

LEPTIN -Exercise decreases  this chemical.   A protein (‘sensor’, STAT3) is
sensitive to low leptin levels, triggering brain to ‘eat’, via dopamine.
LEPTIN considered a regulator of energy storage.

LIPOPROTEIN  Transport lipids, which are water insoluble.  HUGE.    Contain
LDLs, HDLs, Cholesterol etc.   However, higher fat contents, less dense is
lipoprotein (less dense cream rises to top of milk): Per Am Heart, keep Trig
<100 (<150 is low risk)


LIVER BIOPSY:
   1. Liver biopsy documenting alanine-glyoxylate aminotransferase (AGT)
      activity below the normal reference range confirming PH type 1 OR,
   2.  Liver biopsy documenting glyoxylate reductase/hydroxypyruvate reductase
       (GR/HPR) activity below the normal reference range confirming PH type 2


LOW-OXALATE DIET (LOX) - Variously mentioned as <40 mg, <50 mg, <75 mg per day.
LUMEN - open space in tubes, where linings are often complex, multi-structure.
INTRALUMIN


LYMPHATIC SYSTEM (vs. Vascular) - Clear liquid between cells.   Absorbed in small intestine, transmitted to veins in neck (bypass LIVER) and   distributed in blood.	Absorbs fat from intestine.
https://en.wikipedia.org/wiki/Lymphatic_system#Fat_absorption

-- M --
Magnesium (Mg++)  Role in stone prevention is DISUPUTED;   Normal urine, >= 70 mg/d of Mg.
here is one paper: https://www.ncbi.nlm.nih.gov/pubmed/16953377
Mg+2 - good at reducing Ox-2  absorption, but we need less of it then Ca, so Ca is usually first suggested.   Because Mg correlates to Ox in most foods, Mg supplements are recommended:  easily digested.  MgCitrate or supplemtns
Others say no clinical trials to support Mg supplements decrease risk  in otherwise healthy individuals.   HOWEVER,   people with diarera, bowel disease, fat malabsorption may need Mg to replace loss;( not for any stone prevention)
mEq (milliquivalents) - arcane measure - millimoles x VALANCE:    
10 mEq Potassium = 1080 mg
medullary nephrocalcinosis 
https://radiopaedia.org/articles/medullary-nephrocalcinosis
https://www.zocdoc.com/answers/17936/what-is-medullary-nephrocalcinosis-how-can-it-be-treated
MET- Medical Expulsive Therapy - Use  alpha-selective | alpha-blocker (ex: Tamsulosin) - relax ureter muscles (also relieves some BHP symptom ?)
-
MRI  measure kidney size/cysts or stones ?? (vs CT and all the other ways?)
NEPHRON ANATOMY-  (khan video)
--        basic plumbing/cleaning element of kidney (filter + collect), containing several tubing sections, including RENAL TUBULE where secretion and reabsorption occur;  ~0.8-1.5 MM nephrons per kidney; blood in; clean blood out; (100L/d/kidney)  rest passes on as urine; 
--  blood from renal artery flows into many arteriole arteries.   Each leads to glomerulus, where it winds itself into a strawberry-sized ball, and then continues as efferent artery.   At base of glomerulus  is Bowman's capsule or space where fluids collect (glucose, ions, white, red blood cells, water, amino acids) but not large protein molecules where are too large.   Bowman's capsule encapsulates glomerulus.
-- The interface between glomerular and Bowen is at least 3 layers which limit what can and can/not pass through.
-- Diameters of arteriole and efferent arteries affects amount of filtration.   Ideally arteriole wide, to let a lot of blood in, but efferent narrow forcing blood to slowly move through glomerulus and filter completely.
-- LOTS can go wrong!
-- proximal convoluted tubule, long winding tubing  leaving the glomerulus with water, Na, amino acids etc. from Bowen and reabsorbs %65 of fluids; then leaves renal cortex dives into Medulla for Loop of  Henle (video)


-- RENAL TUBULAR ACIDOSIS (RTA) - failure of kidney to remove blood  acid, or add enough alkali to blood,  so both blood and body accumulate acid; also reduces UrCit)   Since acid is NOT being eliminated, as normal,  the urine pH rises.  When the kidney can no longer lower urine pH below 5.3 the situation is RTA.   
-- Can live on total 300,000 nephrons (10%)   Claim:  Kidney can produce CITRATE, but if blood acidifies it will steal kidney CITRATE, leaving less for Urinary CITRATE
-- NEPHROTOXIN -- NSAIDS, COXIBS or heavy metals, or rhubarb! (details)   Measured by creatinine clearance (blood test).
NEPHROCALCINOSIS -  calcium deposits in renal parenchymal, several possible causes including hyperoxaluria (details)

NEPHROPATHY - kidney disease; do I have "secondary oxalate nephropathy"? Due to
oxalate deposition.
-	**AON: Acute oxalate nephropathy,** defined as acute kidney injury (AKI) due to biopsy-proven calcium oxalate deposition, Prognosis: Poor. ie AON can cause AKI.
-	**AKI: Acute kidney injury (aka acute kidney failure**
	(https://en.wikipedia.org/wiki/Acute_kidney_injury) rapid failure of kidney
	function (~ 7 days)
-	

NEPHROLITHIASIS - stone in kidney (vs ureter).  

NEPHROTIC SYNDROME -- high protein in urine, low serum protein; not same thing
as kidney failure.  one symptom:  foaming pee.  see
https://en.wikipedia.org/wiki/Nephrotic_syndrome

- O -


OSMOLES:   Once dissolved, # moles/L.    Example   1 mole NaCL  becomes 2
osmoles in water (both Na & Cl).    But 1 mole of glucose remains 1 osmole
because it does not dissociate.

OXALATE (Ox--) forms - Salt of Oxalic Acid, Ex: CaOx, MgOx;   Also Ester of
Oxalic Acid.  Oxalic acid is very reactive H2C2O4, removes rust.  Plants, no
kidneys,  use oxalate to store excess calcium from soil, water etc  as CaOx ,
esp. In older leaves, store as CaOx (salt), less bioavail?   Younger leaves
hold the Oxalic acid form, which has higher bioavailability in humans.
Oxalate 88 mg/1 mmoL   44 mg/f1 mEq.
- OXALATE Absorption - Theory?  Absorption to blood depends on Ox solubility of
  foods.    Foods high in Ox may not have same bioavailability.  Once Ox
  absorbed **90% of it will appear in urine 24-36 hours later.**
- OXALIC ACID (C2O4H2) dissociates into OX,  conjugation base( C2O4 -2)  and
  H+.  (pKc=1.27)  or 2 H+ (pKa=4.27) Relatively strong acid (?); simplest
  diCarboxylic acid (wiki: https://en.wikipedia.org/wiki/Carboxylic_acid) Known
  for transporting metals.   pKa for -2 to 10 (weak acids) strong acids pka
	less than -2
Case study:
http://www.revistanefrologia.com/en-publicacion-nefrologia-articulo-acute-renal-failure-due-oxalate-crystal-deposition-enteric-hyperoxaluria-X2013251411051070

- Oxalate measurement in urine:  several
  labs:http://ndt.oxfordjournals.org/content/early/2011/03/30/ndt.gfr147.full.pdf
  Ex: Oxalate Kit, Trinity Biotech, Berkeley, NJ;  591-D, 100 Assays;   need a
  spectrometer!  
- Ox measure in stool:   Ixion Biotech Inc (Alac hug, FL)
  more exact then PCR Ox test? (Didn't women at Allex..  say very difficult?).
- OXALATE catabolism - breakdown to smaller molecules
- Claim: Stone-formers either (1) produce more Ox, or  (2) absorb more food Ox,
  or (3) higher Ox interaction with food?  Active (small intestine) vs. Passive
  (gastro) Transport ???

“Sample” high Ox foods:
Almonds                        31% soluable
Black Beans                        5%
Cinnamon (1789 mg/f100 g)        6%
Turmeric (1969 mg/100g)                91%        


- Why no Mg, K, Na oxalate stones?  Because these are very soluble.  KOx, NaOx very
soluble); CaOx is not soluable (max is 5.0 - 6.7 g/L).  However, in stomach,
pH=2, CaOx is more soluble, so pass to intestines.  Mg(AN=12) is
567x more soluble.   
Ex: Milk (Ca) + Rubarb (v. high Ox) → gritty, CaOx xtals
in mouth.   Ca-Ox in intestine=good (goes to feces), Ca-Ox in urine (bad)
- FREE Oxalate is absorbed in LARGE COLON.
- “transient flood”  Even with adequate Calcium, 8% of Ox is absorbed?
  (CLARIFY!)   Of this, half is aborbed quickly, 1-2 hours, in small intestine.
  So if a meal contains 200 mg Ox (very high), expect 8 mg Ox (0.5 x 8%) will
  absorbed in first 1-2 hours.   This is too high for kidney.  (source:   Coe,
  quoting Holmes?) .    However,   200 mg Ox  spread throughout the day is much
  less harmful.


**OXALOSIS** - deposition of CaOx in kidney tissue (vs. nephrolithiasis CaOx
xtals in kidney), in extreme cases can deposit in eyes, bones, heart. (Source:
Goldfarb, in Ox & Hyperoxalia mtg, think this is PH1)


OXALATE HYPERABSORPTION - explain | where | cause.
One of several models:  (1) excess Ox absorption (2) Excess Ox production (3)
Excess retention of pre-cursor, but common xtals (4) Limited ability to inhibit
precursor xtal, etc etc 


OXALOBACTER  FORMIGENES  - Bacteria loves Oxalate, will reduce urinary Ox.
Claim:   ~100% of children have O.F.   but only 60-80% of adults do (b/c
antibiotics?)[3]    Paradox:  most Ox absorbed in small intestine (~2-6
hours), though can be absorbed in stomach or colon (enteric),  but OF is
present only  in colon! How does it intercept Ox?  Stool test?  PCR?

OMBS (Oxalate Metabolizing Bacteria Series), other bacteria? Note:  too much Ox
may actually  inhibit O. Formigenes.  Microbes in Urinary Tract (??) may form
“adaptive extra-renal pathway” to aid kidney eliminate Ox??

OXALATE BASELINE - Value? fast for 10-12 hours, eat HIGH Ox, monitor urine next
6-24 hours (normal Ur Ox < 40 mg/24 hours)

-- P --

**PANCREAS** (
Human pancreatic elastase 1 (E1) aids digestion (exocrine) by breaking down
fat in GI, specifically glycerol from triglicerides (main form of human fat);
Elastase remains undegraded during intestinal transit. Therefore, its
concentration in feces reflects exocrine pancreatic function. 

Actute pancreatitis:  
During an inflammation of the pancreas, E1 is released into the
**bloodstream**. Thus the quantification of pancreatic elastase 1 in **serum**
allows diagnosis or exclusion of acute pancreatitis.[12]

Note:  Dr Wei Wang said Elastase known for giving FALSE  results.
**My value = 29 ug/g (stool?), 14FEB2019**
-	200 µg elastase/g stool indicate normal exocrine pancreatic function
-	100-200 µg elastase/g stool suggest mild to moderate pancreatic insuffiency
-	100 µg elastase/g stool indicate exocrine pancreatic insufficiency
	(**EPI**).

Causes: 
-	Diagnosis/exclusion of exocrine pancreatic insufficiency caused by e.g.
	Chronic Pancreatitis, Cystic Fibrosis (error in CFTR gene => cloride flow
	across membranes (serious), Diabetes Mellitus, Cholelithiasis (Gallstones),
	“Failure to Thrive”, Pancreatic Cancer, Papillary Stenosis, tumor blocking
	in ducts.

Stool Fat 72-hour test: preparations:

* https://www.nationaljewish.org/treatment-programs/tests-procedures/gastroenterology/72-hour-fecal-fat-test
*	https://ltd.aruplab.com/tests/pub/2002356 (refrigerate)
*	https://www.healthline.com/health/fecal-fat#results
*	https://www.mayocliniclabs.com/test-catalog/Specimen/8310

EPI details:
"
The need for PERT in PEI without symptoms is a matter of debate, and randomized
clinical trials on this issue are lacking.
"
[ NIH: Dignose & Treat:  diagram] ( https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3831207/ )
https://en.wikipedia.org/wiki/Pancreatic_elastase
https://labtestsonline.org/tests/stool-elastase

**CHRONIC PANCREATITIS**
-	long-standing inflammation of the pancreas that alters the organ's normal
	structure and functions.[3] It can present as episodes of acute
	inflammation. Enzymes can even start working inside pancreas => harms
	cells. 
-	symptoms:  pain, diebetes I, fat in stool, wt loss
-	proximate cause:   ducts obstruct, calicification, swelling ...

Blood tests; The endoscopic retrograde cholangiopancreatography (**ERCP**) test
	or CT or NMR; less invasive:
[explaination & pictures](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3292642/)
	
**Radiological & tests** 
JR:  use this outine,  put in references to these procedures.

	- CT, can miss
CT: Note:  subtle abnormalities of early to moderate chronic pancreatitis are
beyond its resolution, and a normal finding on this study does not rule out
chronic pancreatitis.  

	endoscopic ultrasound (EUS, through mouth), biopsy, sound -	
**EUS**: https://pancreasfoundation.org/endoscopic-ultrasound-eus/
use sound, no radiation, through mouth, can take biopsy, very good for studying
pancreas, great for finding cancer. Requires general anesthesia.

	MRCP, form of MRI (magnetic resonance imaging).; last 20 years
-	MRCP(magnetic resonance cholangiopancreatography).  
now preferred to ERCP, non-invasive; last 20 years; shows flow in ducts.
Done:  winter 2019-2020. Repeat in 1 year.
[MRCP](https://en.wikipedia.org/wiki/Magnetic_resonance_cholangiopancreatography)

	ERCP - invasive, but can fix things, examine ducts, spot cancer.
-	**ERCP** (via throat, endoscopic retrograde cholangiopancreatography), very
	invasive, much more advanced procedure for GI doctors (often extra 1 year), now less done.
	Remove stones, put in stents, fix things.
https://www.niddk.nih.gov/health-information/diagnostic-tests/endoscopic-retrograde-cholangiopancreatography
-	https://en.wikipedia.org/wiki/Endoscopic_retrograde_cholangiopancreatography


	

**References:**

Panceatisis confirmation: (https://emedicine.medscape.com/article/181554-workup):
**EPI**:
https://pancreasfoundation.org/patient-information/ailments-pancreas/exocrine-pancreatic-insufficiency-epi/

-	https://en.wikipedia.org/wiki/Chronic_pancreatitis
-	https://emedicine.medscape.com/article/181554-overview#a5



**PATHOPHYSIOLOGY**	 - study of … disease and how it functions in body, i.e. study of abnormal systems

PDI (Percussion Diuresis Inversion) Claim:    Especially after SWL good way to eliminate ‘sand’   “Hang upsidedown”    Inclinded plane on back (like situps) or use chair, 10-15’, back on floor, feet raised on chair.     Hand over head.   Caution may raise BP
PHYSIOLOGICALLY - how organ works, its function, chemical and physical processes


POTASSIUM - Hypokalemia  (K+ too low);  Hyperkalemia (too high and needs to be monitored)
 -- K+ concentration higher INSIDE Cell wall;  Na+ concentration higher OUTSIDE cell wall.
-- An increase in SERUM Potassium ⇒ decreased kidney function.   (too high can trigger heart attack)


PROBIOTIC - contains LIVE bacteria


PREBIOTIC - nutrients for bacteria (but NO live) - garlic, onion, beta-carotene, lots of foods do.   CLAIM:  oligosaccharides (oligo = few), short chain simple sugars, only found in human (not cow) breast milk feed gut bacteria, not the baby.   Baby’s breath contains Hydrogen, an indicator than bacteria are eating (in colon).   Foods absorbed in short intestine, ie no bacteria, produce no hydrogen to exhale.

PHOSPHATE - kidneys should eliminate

**PROTEINURIA** - protein in urine;  several possible causes, including
compromised kidneys, diabetes … Normal kidneys readily re-absorb blood protein
and do not pass it to urine   MONITOR urine protein is key to manage GFR (?)

  * Albuminuria - common protein found in urine when kidneys fail to filter; a
large molecule should not be able to pass. No such thing as “micro”

    *  A1 represents normal to mildly increased urinary albumin/creatinine ratio
    (<30 mg/g or < 3 mg/mmmol); 

    * A2 represents moderately increased urinary albumin/creatinine ratio
    (30–300 mg/g or 3–30 mg/mmmol, previously known asmicroalbuminuria); and

    * A3 reflects severely increased urinary albumin/creatinine ratio >300
     mg/g or > 30 mg/mmol).[1]

**PURINES** - Considered a food source, associated with protein, esp animal,
that leads to higher serum uric acid (gout risk, i.e. crystaliziation) and
urinary uric acid.    Unknowns:  role of dairy in reducing?   Plants have
less, not zero purines.  Meat | Fish | eggs - esp. Sardines, anchovy.  TRUE?
increase UrCa, decrease Cit (both bad)


PHYTATE - Found in plants as  tight bonds to store  phosphorous (bran, beans,
nuts, cereals, seeds), varies with growing temp, fertilizer, grain;   Salt
form of PHYTIC Acid.   Urinary phytate reduces CaOx risk by binding to Ca.

In PLANTS, inhibits growth in seeds grain legume till just right T and
moisture; blocks Phosphate absorption; binds with Ca, Mg, Fe, Zn;  CLAIM:
people, esp developing countries where whole grain is dominate food, can have
depletion of minerals.

CLAIM: soaking, sprouting, fermenting will reduce phytic acid and therefore
increase digestion in human.

   * Humans have limited enzyme phytase, ie can not digest, i.e. so it is removed via feces.   Considered  “Anti-nutrient.”  Found in high fiber diets.   Claim: vegetarians have gut  bacteria can break down phytate.   In  farm animal fed grains, this leads to excess soil Phosphorus.   Ruminant animals can digest.   
   * To increase bioavail and absorption of PHYTATE in  intestine can cook|acid|ferment|sprout  (Role of bacteria?) 
   * In acid form, PHYTATE BINDS to Ca, Fe, Zinc and others, decreasing human absorption of these metals,  and can lead to deficiencies (ex: anemia)    (Ca+2 binding is pH dependent)   Some very high fiber African diets (mostly roots?) can yield excess phytate and nutritional problems.  .  Excess phytic acid ALSO inhibits enzymes (pepsin to digest protein, amylase to break starch to sugar, trypsin to digest protein). 
   * But PHYTATE also correlates to Ox in many foods.   In test-tube, PHYTATE inhibits Ca salt crystals.  Only 5% of PHYTATE reaches urine (“relatively non-absorbable).   But, once in urine, PHYTATE considered good, since will bind to Ca in urine  
   * PHYTATE or PHYTIC acid also plays role in intercellular; but source is NOT from diet and must be manufactured within cells.
   * Unclear!   For non-stone formers, what is PHYTATE benefit, even if they can break it down?  (into what?)   For stone-formers sounds like good AND bad.   In diet it correlates with Ox (BAD),  but if it reaches urine then PHYTATE is good, binds Ca.
   * Since PHYTATE corrolaes with OX, should I eat or not?       Some foods (soy,whole gains, beans, rice, cereals ) high in both OX and PHYTATE.   Does PHYTATE mitigate high OX?
   * Benefits: (confused?   anti-nutrient?)  But PHYTATE itself can also lead to reduced blood glucose, decreased triglycerides, cholesterol, acts as antioxidant, remove *excess* metals in body (Fe) and minerals related to kidney stones! (i.e. provides ‘chelating’) (GOOD).    In contaminated soil, phytate will remove harmful metals!

PHYTASE - an enzyme with can break PHYTATE bonds,  found in inactive form in plants with PHYTATE.  To activate, soak| sprout | ferment.    Humans with ‘healthy gut bacteria’  produce some phytase enzyme and possible to obtain nutrition from unsoaked grain.
POTENTIAL RENAL ACID LOAD (PRAL) - calc (http://mathsurvey.org/potential-renal-acid-load-calculation.html) if food will lead to acid or base
PURINES - source of urinary uric acid. 30% (estimate) of purines due to DIET[4]


**PTH** - Protein in blood from parathyroid gland, regulates
serum Ca and serum Phosphorous.   

**Hyperparathyroidism** is
excess of PTH, result of several possible factors including
Vitamin D, presence of disease etc.  Normal: tight balance, if
serum mineral is low, the gland releases PTH which directs gut
to absorb more mineral from food, or bone to leach more
minerals.(done in part with kidney also increasing calcitriol
vitamin D production.). Quickly readjusts to any deviations.

Abormal:  excessive PTH even if no mineral deficiency?

- can be primary (gland producing excess PTH, uneeded, can be
- fixed via surgery) or secondary (more complicated).
- elevated PTH leads to increased urine Phosphate.
- expect higher PTH would lead to **decreased** urCa, not the case in primary
  because urCa is effected by serum Ca conc (??).  The net is increased ur Ca.
- If urine has elevated phosphate and Calcium,  stones are soon to follow and
  usually how hyperthyroidism is found.
- Secondary,  can be low calcium, low vitamin D in diet or other. 
- CKD, Kidney no longer able to produce ample calcitriol (PTH continues high).
	
Ref:  (readable) (https://cjasn.asnjournals.org/content/10/7/1257)

[UT medical]
(http://www.utmedicalcenter.org/your-health/encyclopedia/test/003690/)

	-	[hyperparathryoid]https://en.wikipedia.org/wiki/Hyperparathyroidism
	-	[secondary](https://en.wikipedia.org/wiki/Secondary_hyperparathyroidism)
	[medline:] ( http://bit.ly/2uwpDMq  )

- May 2019 (Litholink)
	-	Serum P 3.7 (2.5-4 mg/dL)
	-	Serum Ca 9.4 (8.8 -10.2 mg/dL)
	-	UrCa 296 (less than 250 mg/day) and rising!
	-	UrP 1.222 (0.6 - 1.2 g/d)	
		
	-	In diagnosed primary PTHT: elevated PTH.  elevated serum
	-	Ca conc.  lower serum Ph conc.  wiki: test:  "intact" PTH
	-	(excludes pieces of the molecule) normal (10 to 55 pg/mL)
mL
	-	(July 2017) PTH, Intact        80 pg/mL        (15 - 75
	-	pg/mL)        H 2019:   PTH    84 pg/mL   high value could
	-	indicate Vit D problem or excess phosphorous (I am
	-	normal), due to chronic kidney disease.  (July 2017, Dr
	-	Vanek, OHSU says to increase Vitamin D to 4,000 IU per
	-	day!) Also many factors can raise PTH

	**2nd Hyperparathroid - Symptoms**
	*	low serum Ca (hypocalcemia - not me)
	*	H serum Phosphate
	*	H ALP
	*	H PTH
	
	**Tertiary Hyperparathryoid** chronic secondary
	hyperparathroid and gland no longer responds to changes in
	serum calcium. (bad news?

	**Parathryoid Adenoma** beign, almost always results in
	hyperparathryoid.  Confirm by scan.  Glad shouuld be in
	neck, but can migrate(?); so locating it is important.
	Surgery (only treatment) 95% success.


**SALT** of an acid - add a metal
Ex:  HCL, salts:  NaCL, KCl, CaCl
Other SALT examples:   acid + base;  metal + acid (Ca + oxalic acid), others


**SLC26**- family of proteins, transport in kidney; exchange Ox for sulfate|chloride

**SODIUM** - for kidney to remove excess Na, must also excrete Ca.   
1 tsp SALT = 2325 mg SODIUM
--- “Unfortunately, faced with a chronic excess of sodium to deal with, the
kidneys can get worn out; sodium levels in the blood then rise along with water
needed to dilute it, resulting in increased pressure on blood vessels and
excess fluid surrounding body tissues (read, swelling ….” (from Coe)

SUPERSATURATION - Unstable equilibrium in which concentrates exceeds solubility
but no precipitation occurs.  Key = crystallization is physical property and
urine must stay below SS level (Coe, basis of Litholink’s SS).  AUA Guideline
Statement 6:   “Urinary supersaturation of stone-forming salts is provided as
part of the 24-hour urine analysis panel from many commercially available
laboratories, or it can be calculated using a computer program. Supersaturation
can guide and monitor effectiveness of treatment and as such, is useful as part
of the initial 24-hour urine evaluation.46,47,55 “.

RANDALL’s PLAQUE - calcification (CaPhosphate) of subepithelial.

NEAR RENAL PAPILLA (termination of RENAL TUBUAL at connection to MINOR CALYX,
i.e base of Mendulla, aka Renal Pyramid.   Less than 2mm thick.   Pre-cursor to
stones?  KUB can NOT distinguish between a stone and RANDALL’s PLAQUE (paper)
or paper)  use ureteroscopy.    1-2 mm, calcium deposits;  aka interstitial
deposits (bet cells) of calcium.   Is it CaP or CaOx?? 

RENIN - If low Na (sweat, etc), kidney releases RENIN which triggers LIVER to
release Ang I, which triggers LUNGS to release Ang II which tirrigers ADRENAL
GLANDS (atop the kidney) Aldosterone….  to tell Kidney to retain Na and water
(increasing BP), half-life 20’.    ACE reduces secretion of Aldosterone. 

-- S --

SMALL INTESTINE (https://en.wikipedia.org/wiki/Small_intestine) aka small bowel
-	duodenum
-	jejunum, many things absorbed here. 
-	ileum, absorbs B12, bile acid, nutrients; next is large colon.

**STEATORRHEA** - https://en.wikipedia.org/wiki/Steatorrhea
-	excess fat in feces  (floats, smells, hard to flush, bulky); guideline > 6
  g/d stool fat

SUPERSATURATION (see Coe) - Concentration is above saturation level, but no
precipitation - unstable equilibrium.  Meaning max concentration before
precipitation, ie max equilibrium -- just as many molecules precipitate as
those return to solution per unit time.  Heat increases  solubility, for
example sugar in water.   Iif then cool SLOWLY , may remain in solution.
Shake it, crystals will form.

URINE, generally more stable (then sugar and water) and can remain SS for days!
BUT if making stones, we have SS urine and must lower the concentration.
Kidneys are water-efficient (ie reabsorb water) leaving urine potentially SS w/
salts.   Why?  Fresh water once rare than now and then much sodium in diet, so
less Calcium in urine. 

-- T --

Tamm-Horsfall protein (uromodulin) - low levels in urine may indicate stones.   Test?

-- U --

UUN24 - measure of urea in urine (normal: 7-20 g/d) see BUN.

UREA - Breakdown of proteins (nitrogen)

**URIC ACID** -  in Urine, relatively insoluble, end product of purine, in acid
(less than 5.5) will precipitate (uric acid stones)   BUT, even in alkaline
urine, excess uric acid can increase CaOx stone risk, providing ‘seed’ (process
involves several steps, monoSodium Urate (MSU) supersaturation.  Also, MSU
crystals in blood=GOUT).

-- Treatment for hyperuricemia : first raise urine pH with K+Cit- to 6.5-7.0,
which may also (slowly) dissolve uric acid stones.    If K+Cit- does not reduce
uric acid, then try Allopurinol.

-- Treatment for uric acid stones (uric acid lithiasis) - K+Cit- especially at
night to increase “alkalide tide”
(https://en.wikipedia.org/wiki/Alkaline_tide), blood pH rises for about 2 hours
after meal. (So kidney increases UrCit ??)  Stone formers have decreased
“alkaline tide” (?)


**URINE**-  pH should be 5.5-7.0   Acidic urine will reduce citrate (check?)
the natural stone inhibitor.   If sugar in blood, check for Diabetes.  To lower
urine pH:   grain, dairy, legumes, meat.   To raise urine pH:  fruit &
vegetables.   Urine is complex:   thousands of organic molecules.

**UREMIA** (“urine in the blood”) - originally referred to excess serum urea
(?) but now know that many other poisons in blood when kidneys compromised.  

**UROEPITHELIAL LINING** - Type of TRANSEPITHELIAL ("surrounds lumin") which
lines LUMEN of urinary track (renal pelvis, ureter, bladder, prostate) and is
approx 5 cells deep.  Can expand | contract. Barrier.

**Vitamin B6** - Rare, inherited disease in which body produces excess oxalate,
which binds with Ca in kidney tissue?? (oxalosis).   In some cases, B6 can
help.   Even in  a few non-inherited cases, claim B6 may work (note:  ‘in a
few’) However, B6 supplementation has risks.    Consult doctor.


**Vitamin D** - Aids Ca absorption from intestine.  When LOW, Ca absorption
~10-15% of Ca food.   When adequate, Ca absorption 30-40%.    When Blood Calcium
is LOW, PTH level rise and bones  leak Calcium. The PTH mechanism involves
kidneys releasing activated vitamin D, 1,25 dihydroxyvitamin D, or **calcitriol**.

Blood Test: 25(OH)D:___ ng/ml x 2.5 = __ nmol/L
Institute of Medicine    20 ng/ml MINIMUM - 50 ng/ml MAXIMUM
Others say range:        40-60 ng/ml
Claim:  2000 IU --->30 ng/dL.    4000 IU ---> 50 ng/dL.

Low D?   Symptoms include Bone Loss, Weaker Muscles, and  (discovered last 30
years) all kinds of other bad things (few clinical trials) 

Stone-formers:
CLAIM:   excess D will increase Ca absorption  MORE THAN non-stone formers.
(Better check this…. Not simple cause & effect)  Leaving less Ca in gut to
crystallize Ox. (So it too will be absorbed - colon?)   Avoid winter vacations
where sun exposure abruptly changes from  nil to every day; every hour.


=====
CT scan vs.  (readable)
http://www.controversies-and-consensus.com/lectures/moore.pdf 


Video
   * Kahn:  Kidney


Coe:
http://kidneystones.uchicago.edu/fluid-prescription/
   * Reread (revised)
   * KIDNEY STONE TYPES
   * ANALYSE EVERY KIDNEY STONE
   * KIDNEY STONE ANALYSIS - How Bad is It?
   * NEPHROCALCINOSIS
   * SUPERSATURATION
   * CLINICAL SUPERSATURATION



________________
[1] Mayo Clinic Communique, July/August 2013
[2] AUA, 2014 Guidelines #16, “allopurinol reduced the risk of recurrent calcium oxalate stones in the setting of hyperuricosuria (urinary uric acid excretion >800 mg/day) and normocalciuria.


[3]http://www.karger.com/Article/Abstract/80264 (Goldfarb - VA NY)  “There is evidence that the organism’s absence, perhaps sometimes due to courses of antibiotics, may be a cause of hyperoxaluria and stone formation. In early investigations, patients not colonized with the organism can be recolonized.”
[4]AUA, 2014, Guideline Statement 12: “... Nonetheless, if diet assessment suggests that purine intake is contributory to high urinary uric acid, patients may benefit from limiting high- and moderately-high purine containing foods. Although the reported purine content of foods varies, “high purine” foods are generally considered those containing more than 150 mg/3-ounce serving. These include specific fish and seafood(anchovies, sardines, herring, mackerel, scallops andmussels), water fowl, organ meats, glandular tissue, gravies and meat extracts. “Moderately-high” sources of purines include other shellfish and fish, game meats, mutton, beef, pork, poultry and meat-based soups and broths.96,97 Note that an individual may never or only rarely consume “high purine” foods but may habitually consume large portions of foods in the “moderately high” category. 


5] Guideline Statement #6 - 2014 AUA Guideline - Also, “ These patients should
be considered for referral for genetic testing and/or specialized urine
testing. REF<56>”



### Misc Notes
###  Mon  07 Dec 2020, notes from Oxalate & Hyperoxaluria Non-Profit group:
  - water & KCitrate is the standard.
  - PH1, some benefit from B6, others do not
  - FDA now considers UrOx a proxy for stones, stone burden.
  - PH1 kids are not in good shape;  solutions include kidney transplant and
  sometimes  BOTH kidney & liver transplant.
  - **Lumasiran** new medicine (2020) promises some hope for PH1.

