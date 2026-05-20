<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# Yes, please show me a side-by-side PC and PP mock table

Here is a simple side-by-side mock table showing how raw PK observations in **PC** can flow into derived NCA results in **PP**.[^11][^12]


| PC domain row | PP domain row |
| :-- | :-- |
| `USUBJID = 101` | `USUBJID = 101` | | `PCDTC = 2026-05-01T08:00`, `PCTPT = 0` | `PPTESTCD = CMAX` |
| `PCSTRESN = 0.0` | `PPORRES = 18.1` | | `PCDTC = 2026-05-01T09:00`, `PCTPT = 1` | `PPSTRESN = 18.1` |
| `PCSTRESN = 12.4` | `PPSTRESU = ng/mL` | | `PCDTC = 2026-05-01T10:00`, `PCTPT = 2` | `PPTESTCD = TMAX` |
| `PCSTRESN = 18.1` | `PPORRES = 2` | | `PCDTC = 2026-05-01T12:00`, `PCTPT = 4` | `PPTESTCD = AUCINF` | | `PCSTRESN = 9.6` | `PPORRES = 72.4` |

## How to read it

PC holds the individual concentration measurements collected over time, while PP holds the **derived** pharmacokinetic parameters calculated from those measurements.[^12][^11]
In this example, the PC rows at 0, 1, 2, and 4 hours form the concentration-time profile, and PP contains summary outputs like CMAX, TMAX, and AUCINF.[^11][^12]
The subject ID stays the same so the derived results can be traced back to the source observations.[^11]

## What aNCA is doing

aNCA uses the concentration-time data from PC to compute NCA metrics, then exports those metrics into CDISC-friendly parameter records in PP.[^13][^11]
That makes PP a downstream results dataset, not a duplicate of the raw concentration data.[^14][^12]
If needed, the mapping can also preserve traceability to the original records through study submission structure such as related-record links.[^15][^12]

Would you like me to turn this into a more CDISC-like mock table with common PP columns such as `PPTESTCD`, `PPTEST`, `PPORRES`, and `PPSTRESN`?
<span style="display:none">[^1][^10][^2][^3][^4][^5][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://www.youtube.com/watch?v=ztRbPKbHRdw

[^2]: https://www.instagram.com/reel/DR5ZdmVDpVv/?hl=en

[^3]: https://www.tiktok.com/@plusoneplanning/video/7475830360845339950

[^4]: https://support.microsoft.com/en-us/office/edit-with-copilot-in-excel-a2fd6fe4-97ac-416b-b89a-22f4d1357c7a

[^5]: https://kdigo.org/wp-content/uploads/2016/10/KDIGO-2012-AKI-Guideline-English.pdf

[^6]: https://www.youtube.com/watch?v=UsgXF5VH7RU

[^7]: https://www.facebook.com/groups/PcBuildersCommunity/posts/2790516144565082/

[^8]: https://www.youtube.com/watch?v=R0--_8ZjiOY

[^9]: https://www.accc.gov.au/system/files/ACCC+commissioned+report+-+The+impact+of+digital+platforms+on+news+and+journalistic+content,+Centre+for+Media+Transition+(2).pdf

[^10]: https://www.reddit.com/r/buildapc/comments/d3v317/does_anyone_use_a_side_table_to_put_their_pc_on/

[^11]: https://onlinehelp.certara.com/phoenix/8.3/topics/SDTM_example.htm

[^12]: https://www.cdisc.org/system/files/all/Education/PK_Webinar_Dec2014_CDISC_Published.pdf

[^13]: https://cran.r-project.org/web/packages/aNCA/refman/aNCA.html

[^14]: https://www.facebook.com/groups/295999457246765/posts/1103646186482084/

[^15]: https://onlinehelp.certara.com/phoenix/8.2/topics/cdiscnavigator.htm

