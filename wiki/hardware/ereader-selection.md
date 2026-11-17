---
Title: E-reader selection and setup (e-ink, math PDFs)
Topic: hardware
Updated: 2026-11-09
Sources: tech_notes (in-place notes; findings researched 2026-10-19, revised 2026-10-19)
Raw: [2026_eReader_requirements.md](../../tech_notes/2026_eReader_requirements.md)
---

# E-reader selection and setup (e-ink, math PDFs)

A decision record plus the durable reasoning behind it: for reading technical/math PDFs on a used, monochrome, distraction-free e-ink device, resolution (300 ppi) is what buys readability, because reflow garbles equations and fixed-layout PDFs cannot change font size. Findings researched 2026-10-19; prices are point-in-time.

## Requirements (from the source)

- Distraction-free reading; documents come from laptop (USB) or Google Drive; "mostly technical documents, such as pdf, mathematics, engineering".
- Prefer Android, but non-Android acceptable with benefit; easy font/margin changes with quick response; well-documented controls.
- "I will buy used, from ebay.com or equivalent." — "So, I am price sensitive"
- No need: writing or drawing, games, music, color, web surfing. Optional: front light ("do not see need to read in dark").
- Desired: works with calibre; KOReader-fast response; 10" or 10.3" or close; lasts 3-4 years of cared-for use.

## Bottom line ranking (used, monochrome, research date 2026-10-19)

| Rank | Device (year) | Screen | Key facts | Target used price |
| :-- | :-- | :-- | :-- | :-- |
| 1 | BOOX Go 10.3 Gen 1 (2024) | 10.3" Carta 1200, 300 ppi, mono, no front light | Android 12; 4.6 mm, 375 g; no microSD (64 GB fixed) | $150–260 (auctions seen at $82–90; many listings ask $300+, near the $359.99 new price) |
| 2 | BOOX Note Air3 B/W (2023) | 10.3" Carta 1200, 227 ppi, mono, front light | Android 12; adds microSD; 227 ppi makes subscripts softer | $200–280 |
| 3 | BOOX Go 10.3 Gen II (2026) | 10.3-inch Carta 1200, 300 ppi, mono | Android 15; front light only on the "Lumi" variant | $280–380 used/open-box |
| 4 | BOOX Note Air2 Plus (2022) / Note Air2 (2021) | 10.3", 227 ppi, mono, front light | Android 11; Swappa avg sale $309 (Air2 Plus); eBay asking ~$187 (Air2 64 GB) | $150–250 |
| 5 | BOOX Tab Ultra (2022) | 10.3", 227 ppi, mono, front light | Fastest refresh (BSR GPU); Swappa avg sale $256 | $180–260 |

Note3/Note5/Note Air (2020–21) are deprioritized: 5–6 years old, Android 10–11, "battery is the usual failure point on used e-ink" ($120–220 but poor odds of 3–4 remaining years). The stylus does not affect the ranking: "every device above has **finger touch**".

## Why resolution beats reflow for math PDFs

Fixed-layout PDFs **cannot** change font size. The real controls: crop margins (BOOX NeoReader Format panel), zoom + split-column/article mode (NeoReader Navigation panel), reflow (KOReader or NeoReader's) — but reflow "garbles equations and figures" in math PDFs. KOReader adds arbitrary margins, external fonts, per-document settings, and an e-ink-tuned dark mode. Consequence: "Cropping the margin gives you maybe 10–15% more text size; 300 ppi gives you legible subscripts at any size" — which is why the 300 ppi Go 10.3 leads and 227 ppi devices render hard-to-read subscripts.

## Durability notes

- "Age is the main risk, not the screen" — batteries and USB-C ports are what fail; Boox reports no battery-cycle data.
- Buy 2023 or newer (Android 12+) to keep hardware and app support inside the 3–4 year horizon; Android 10/11 ages out of new app support sooner.
- Boox has no consumer repair program in most markets — buy from the official BOOX eBay store (refurbished with warranty) or a return-accepting seller.

## Stylus

Almost no benefit for a reader: highlighting PDF text, dragging the crop-margin box, tapping tiny footnote/citation links, keeping smudges off. Replacement BOOX Pen2 Pro is ~$80 (eraser + magnetic); stock Pen Plus has no eraser.

## Ruled out (with reasons)

- All color / Kaleido 3 models (Note Air6/5/4/3 C, Tab Ultra C/Pro): "no color" is a requirement; color drops contrast ~10–15% versus Carta, renders color at only 150 ppi, costs $100–200 more used or new.
- Kindle Scribe / Scribe Colorsoft: no Android, no Google Drive app, no real file manager/grouping.
- Kobo Elipsa 2E: "Best Calibre integration of any e-reader", but no Drive app, no arbitrary file grouping, 227 ppi, no PDF reflow/font control; "used ~$299 is worse value than a used Boox".
- PocketBook InkPad X / X Pro: 227 ppi; X Pro's Android 8.1 too old; InkPad X not Android.
- Supernote A5 X2 Manta, reMarkable 2 / Paper Pro: writing-first workflows, no Calibre; Paper Pro is 11.8" and color.
- BOOX Tab X / Tab X C (13.3"): too big and heavy. Anything new: buyer is used-only and price sensitive.

## eBay buying checklist (from the source)

- Search the **Sold** filter (last 90 days) for `BOOX Go 10.3`, `BOOX Note Air3` (verify B/W, not "C"), `BOOX Note Air2 Plus`, `BOOX Tab Ultra`.
- Skip every "C" (color) listing; exclude units with screen cracks or case separation.
- Cap ~$250 for a Go 10.3 Gen 1, ~$200 for a 227 ppi Note Air2 / Tab Ultra; above ~$300 used, weigh a new/refurb Go 10.3 Gen II instead.
- Ask about battery life, ghosting/afterimages, dead pixels, USB-C wear, case separation, folio included.
- Set saved-search alerts: "Boox 10.3 prices swing by $200 week to week." eBay pricing is erratic — sellers frequently ask more than Boox's own new price.

## Practical setup (Calibre, Drive, grouping)

1. Transfer: Calibre over USB (Android via MTP) or wirelessly via Calibre's content server / Calibre-Web.
2. Browse on device: KOReader (Play Store / F-Droid) — browses Calibre-Web through OPDS, reads PDF/EPUB/DjVu, handles crop, reflow, margins, collections.
3. Grouping ("math, calculus, LLM, mcp, health, …"): Calibre tags/series → KOReader collections, or plain folders shown by the BOOX Library app.
4. Google Drive app for on-demand download; FolderSync / Syncthing for a synced library folder.
5. Zotero has an Android app and runs on BOOX ("impossible on Kobo/Kindle/Supernote/reMarkable").

## Open decision (as of 2026-10-19)

Buy a 2024 Go 10.3 Gen 1 at ~$200–250, or a 2026 Gen II used/open-box at ~$300–380 for longer remaining life and Android 15. Also: only the Go 10.3 family has 300 ppi mono; every other 10.3" mono is 227 ppi.

The source also cites an earlier wish list, `000_eBook_reader.md` (a source-internal reference, not in the registered raw dir).

## See Also

- [Used ThinkPad laptop selection](laptop-selection.md) — sibling hardware decision record (eBay tactics, used-market checks)
