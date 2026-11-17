---
Title: Used ThinkPad laptop selection (AMD vs Intel, Linux)
Topic: hardware
Updated: 2026-11-09
Sources: tech_notes (in-place notes; researched 2026-10-18 and 2026-11-05)
Raw: [2026_laptop_requirements.md](../../tech_notes/2026_laptop_requirements.md); [300_tech_notes.qmd](../../tech_notes/300_tech_notes.qmd) (T480 charger, eMMC/SSD)
---

# Used ThinkPad laptop selection (AMD vs Intel, Linux)

Decision record for a used 14-inch business-class laptop for Debian, R/Python coding, and light local-LLM use: prefer AMD Ryzen (sustained multicore + Radeon iGPU), prioritize 32 GB RAM over CPU tier, and treat the Lenovo model/generation as the fix for used-market scarcity because Dell "never made an AMD" Latitude/Precision. Research dates 2026-10-18 and 2026-11-05; prices are point-in-time eBay sightings.

## Requirements (from the source)

- Used (not new), eBay availability matters; 14" business-class, AMD, 32 GB RAM.
- Runs Linux well — the current HP runs Linux "but not very well" ("avoid HP").
- First choice was T14s / P14s Gen 3 AMD, but 32 GB units are scarce used.

## T14s Gen 3 ranking (best to last)

1. **AMD Ryzen 7 PRO 6850U** — "Best overall target: 8 cores / 16 threads, Radeon 680M, and LPDDR5-6400 memory".
2. **AMD Ryzen 5 PRO 6650U** — 6 cores / 12 threads, Radeon 660M, same LPDDR5-6400; value pick.
3. **Intel i7-1255U / i7-1265U** — 2 performance + 8 efficiency cores / 12 threads; single-core strengths.
4. **Intel i5-1235U / i5-1245U** — same layout, lower clocks; "competitive in everyday and single-core work".
5. **Intel P-series** (i7-1280P/1270P/1260P, i5-1250P/1240P) — conditional, not default.

This is "a buying-preference ranking at comparable RAM, condition, and price—not a claim that AMD wins every benchmark". RAM is soldered (8/16/32 GB, no slots) — "You cannot upgrade RAM later"; the SSD has a separate M.2 2280 slot. Preferred spec: Ryzen 7 PRO 6850U, 32 GB, 1920 × 1200 400-nit low-power IPS (100% sRGB vs the basic 300-nit 45% NTSC panel), 512 GB+ SSD. Preference order: "a Ryzen 5 / 32 GB over a Ryzen 7 / 16 GB if memory capacity is the limiting factor".

## P14s Gen 3 vs T14s Gen 3 (AMD)

Same Ryzen PRO 6000 U-series CPU and LPDDR5-6400 — the compromises are chassis, not platform: P14s ~17.9 mm thick / ~1.28–1.4 kg vs T14s ~16.6 mm / ~1.22 kg; battery 39.3 Wh or 52.5 Wh vs 57 Wh; two USB-C 3.2 Gen 2 ports, no USB4 (T14s has one USB4 + one USB-C 3.2 Gen 2). Not disadvantages: RAM (same soldered ceiling), coding performance, no NVIDIA GPU complication ("workstation" means certification, not a separate GPU). Verdict: favor T14s at identical price/RAM/condition; favor P14s if meaningfully cheaper or 32 GB vs 16 GB.

## Better used supply: same family, other models (seen Oct 2026)

| Model | CPU | Used eBay seen |
| :-- | :-- | :-- |
| T14 Gen 3 AMD (non-s) | Ryzen 7 PRO 6850U/6650U, soldered up to 32 GB | 32 GB units ~$500-630 |
| T14 Gen 4 AMD / T14s Gen 4 AMD | Ryzen 7 PRO 7840U (Zen4 + Radeon 780M, ~2x the 680M) | ~$439-795 for 32 GB |
| P14s Gen 4 AMD | Ryzen 7 PRO 7840U | ~$700+ |
| X13 Gen 3 AMD | Ryzen 6000, 13.3" | ~$310-599 |
| X13 Gen 4 AMD | Ryzen 7040 | ~$349+ |

Escalating to Gen 4 (7840U) is a spec upgrade for this use — much stronger iGPU / AVX-512 for light local LLM — not a compromise.

## Socketed RAM route (sidesteps the 32 GB scarcity)

- **ThinkPad L14 Gen 3 AMD**: 2x DDR4 SODIMM up to 64 GB, ~$200-320 — trade-off: Ryzen 5000 (Zen3), Vega iGPU, weaker for LLM.
- **Framework Laptop 13 AMD (7840U)**: 2x DDR5 SODIMM up to 64 GB, best-in-class Linux, repairable; 32 GB seen ~$700-900 — thin used pool, 61 Wh, no TrackPoint.
- **ThinkPad T480/T480s**: 2x SODIMM 32-64 GB, ~$150-300 — 8th-gen Intel, budget only.

Strategy: "buy a **16 GB** L14/Framework and add a 16 GB stick — much easier than finding factory 32 GB."

## Ruled out

- **Dell** — no AMD Latitude/Precision ever (AMD only in the 2025+ "Dell Pro" line, nothing used yet); Intel Latitudes have documented Linux defects (7430 UI lag, no S3 sleep).
- **HP EliteBook 845 G9/G10 AMD** — documented suspend / BIOS-update / Wi-Fi breakages; matches the existing doubt.
- **System76, Tuxedo, Slimbook, Star Labs, Purism** — new-only, no used market.

## Intel T14s Gen 3, on its own merits (researched 2026-11-05)

- Rank 1: **i7-1265U (vPro) / i7-1255U** — 2P+8E/12 threads, up to 4.7–4.8 GHz, Iris Xe 96 EU; Cinebench R23 SC 1820 (Latitude 9430); the i5-1235U T14s hit 1683 vs 1520 for the 6850U.
- Rank 2: **i5-1235U / i5-1245U** — "Sweet spot of the Intel lineup in this machine": R23 MC 9208 (−8% vs the 6850U's 10031); chassis taps both at ~33 W sustained; 80 EU iGPU (−20% vs i7-U).
- Rank 3: **i7-1260P / 1270P** — P-series throttles in thin 14" chassis: an X1 Carbon's 1260P sustained loop fell 1615 → 1063 (up to ~34% below burst).
- Rank 4: **i5-1240P / 1250P** — a T16's i5-1240P sustained R15 loop Ø1033 (919–1747), no sustained advantage.
- Rank 5: **i7-1280P** — rare (special-bid), same thermal ceiling; avoid paying a premium.

What you lose vs the 6850U: Radeon 680M (RDNA2, 12 CU) is "roughly **2× faster** than even the 96-EU Iris Xe" (the i5 80-EU unit ~2.4× behind) — the biggest loss for GPU offload (llama.cpp/openVINO/Vulkan); sustained multicore −8% with R15 loops sagging ~20% below burst (1261 vs 1587 for the i5; the 6850U loop Ø1600, 1589–1686); battery on the same 57 Wh pack: 12.0 h vs 9.6 h websurfing, 2.5 h vs 1.3 h under load; some Intel units ship DDR4-3200 instead of LPDDR5-6400; Alder Lake P+E scheduling wants a modern kernel (Debian 12 kernel 6.1+ is fine). Not a loss: AVX-512 (fused-off on Alder Lake; 6850U is Zen3+); Wi-Fi within 2%. What you gain: two full Thunderbolt 4 ports (TB4 ⊇ USB4; TB docks and a TB eGPU verified), higher single-core (+11–20% Cinebench R23 SC), Quick Sync (excellent VAAPI on Linux), much larger used supply.

Buying rules if Intel: prefer i7-1265U/1255U at comparable RAM/price; "Only buy LPDDR5-6400 listings" (verify the Memory field); skip the P-series unless the specific unit is cheaper or carries more RAM/screen.

## Practical tactics and recommended order

- eBay saved searches + alerts: `T14s Gen 4 AMD 32GB`, `T14 Gen 3 AMD 32GB`, `X13 Gen 3 AMD 32GB`, `Framework 13 AMD 7840U`; Lenovo Outlet / refurb resellers for factory 32 GB.
- Check the ArchWiki page for the exact model before buying ("that is where Linux evidence lives").

Recommended order: 1. T14 Gen 4 AMD 32 GB · 2. T14s Gen 4 AMD 32 GB · 3. T14 Gen 3 AMD 32 GB · 4. P14s Gen 4 AMD · 5. Fallback: L14 Gen 3 AMD or Framework 13 AMD with self-added RAM.

## Storage and charger notes (from 300_tech_notes)

- **eMMc** is on the motherboard (embedded) — slow but works: cheap, reliable; fine to boot. Check `/dev/mmcblk**`. SSD is much better, but more expensive.
- The T480 ("stolen May 2024", ran Linux Mint — "no more Chromebooks") charger: "Power, 65W, need brick or wall charger"; "cable must support 3 Amps"; buzz words "GaN, PD (Power Delivery), no need latest PPS"; name brands "Anker, Belkin, "Amazon Basics", **Beware off-brand**" — buy based on T480 compatibility ("go crazy trying to match standards," USB-C 3.1, 3.2, 4.0, "generatations", standard or not?).

## See Also

- [E-reader selection and setup](ereader-selection.md) — sibling hardware decision record (eBay tactics, used-market checks)
- [Android devices, ADB, and phone buying](android-devices.md)
