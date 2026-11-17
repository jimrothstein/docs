# Knowledge Base Index

## llm-agents — agent architecture, harness/tools, and protocols (MCP/ACP), compiled from the tech notes

| Article                                 | Summary                                                                                                                                                                    | Updated    |
| --------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| [LLM Agents: Harness, Tools, and MCP](llm-agents/llm-agent-architecture.md) | Agent vs workflow control (agent-agency), the harness/LLM split with its engine/brain metaphors, tool calling, agent concepts (RAG, graph, vector search, attention, Graph RAG), the MCP protocol stack (JSON-RPC 2.0 over stdio or Streamable HTTP), ACP, and open-weights vs "free" | 2026-11-08 |

## git — everyday git recipes: rebase/squash, recovery, diff, log, ignore-file hygiene

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [Git Commands](git/git-commands.md) | `git rebase main` (moves `dev` commits after `main` HEAD), interactive squash (earlier picks → `s`), amend + force push when already pushed, `git reset` ("NO, do not use") vs `restore`/`checkout <SHA> -- <file>` recovery, HEAD "goes where you go, like a shadow", reflog `HEAD@{n}`/`@{yesterday}`, revert (incl. `HEAD~2..HEAD`), `switch --detach`, merge `--no-ff --no-commit` + conflict markers, `gh repo delete/list`, check-ignore/.gitkeep/--skip-worktree, diff variants incl. local-vs-remote via fetch, pull-error recovery, log recipes and `origin..HEAD` notation | 2026-11-09 |

## tools — CLI cheat sheet, emacs notes, regex, zsh configuration

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [Simple CLI cheat sheet](tools/simple-cli-cheatsheet.md) | "Simplest possible command cheat sheet": pandoc md→pdf via typst (fallback-font error noted), `yt-dlp ytsearch10` recipe, Doom Emacs flyspell+aspell spelling, ex editor line commands, `xprop WM_CLASS` window-class discovery in i3, uv/venv project setup (positron tip), zathura keys, zsh list/loop one-liners | 2026-11-09 |
| [Emacs basics and learning resources](tools/emacs-basics.md) | GNU emacs working notes: help bindings (`M-x describe-bindings`/`describe-mode`, `^h v`/`^h a`/`^h f`), frames vs windows, eShell (`^x p e`) and command log mode, typst watch + quarto `C-c C-c m` rendering, elisp REPL/reading TODOs, curated learning links (Prot, Xahlee, eintr, SICP, LispBook) and videos | 2026-11-09 |
| [Regex notes (grep -P, R)](tools/regex-notes.md) | "regex is a string"; meta characters are engine-specific and must be escaped, character classes (`[0-9]+` repeats the class), R's double-backslash rule (compiler sees code first), Perl PCRE capture vs non-capture groups (`perl=T`), regex uses (find/validate/replace/split) | 2026-11-09 |
| [Zsh configuration notes](tools/zsh-notes.md) | Widgets/bindkey/zle (`zle -al` ~403 cmds, mapping via cat or C-v), glob vs extended-glob (`**/*(/)` dirs, `(DOL[1,6])` largest), grep-finds-words vs ls-glob-finds-filenames, parameter expansion (`${f##*.}`), permissions 700/644/600, printf %05d, zstyle/VCS_INFO, sudo vs su, find -delete-except recipes | 2026-11-09 |

## python — python data stack and the Positron editor

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [Python data packages](python/python-data-packages.md) | parquet as a storage method, polars "(like tibble)" spreadsheet view (apache arrow origin), legacy numpy (matrices, lin alg) and pandas | 2026-11-08 |
| [Positron setup and skills](python/positron-setup.md) | Config paths (`~/.positron/extensions/`, `~/.posit/{ai,assistant}/`, `~/.config/Positron/User/settings.json`) and posit-dev skills: user-level vs project-level SKILL.md locations, project overrides user | 2026-11-08 |

## hardware — e-reader selection and setup for math PDFs

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [E-reader selection and setup](hardware/ereader-selection.md) | Used monochrome e-ink decision record (researched 2026-10-19): BOOX Go 10.3 Gen 1 rank 1 (300 ppi, $150–260 used), why resolution beats reflow for math PDFs (reflow "garbles equations"), durability (batteries/USB-C fail), ruled-out devices, eBay checklist, Calibre/KOReader/Drive setup | 2026-11-09 |
| [Used ThinkPad laptop selection](hardware/laptop-selection.md) | Debian/R/Python/local-LLM buy (researched 2026-10-18, 2026-11-05): Ryzen 7 PRO 6850U > Ryzen 5 > Intel U > P-series, 32 GB soldered RAM trumps CPU tier, P14s vs T14s trade-offs, socketed-RAM route (L14 Gen 3/Framework 13), Intel TB4 gains vs Radeon 680M ~2x Iris Xe, ruled-out Dell/HP; eMMC vs SSD, T480 65W charger notes | 2026-11-09 |
| [Android devices, ADB, and phone buying](hardware/android-devices.md) | ADB recipes (`adb -d`, `--sync` push, fix `?` in filenames, 25 MB/s ~ 1.8 GB/min), MTP/PTP avoid, Dalvik/recovery/fastboot, OEM-unlock + bootloader/carrier/factory locks, retail demo units, phone history (Pixel 3a XL broken, OnePlus 8 $137, Redmi Note 14 $140), carrier/MintMobile/mp3 notes | 2026-11-09 |

## quarto — decorating quarto HTML output: SCSS, callouts, chunk classes, publishing

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [Quarto HTML decoration](quarto/quarto-html-decorate.md) | html-format YAML (embed-resources "all 1 file", katex, scss: custom.scss), _quarto.yml precedence over .qmd yaml "(check !!)", SCSS classes via fences/chunk options/spans, five callout types + collapse + content-visible, Bootstrap bg-* chunk classes, knitr col() colored spans, Posit Cloud publish via writeManifest(), pandoc CLI tricks, WebR | 2026-11-09 |

## typst — typst markup and scripting basics from the quarto/typst cheat notes

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [Typst basics](typst/typst-basics.md) | Typst in Quarto via `{=typst}` chunks (`quarto render 260_typst_cheat.qmd --to typst`), page/text setup ("New Computer Modern", 15pt, "gray is too light"), show rules (regex, heading colors, link underline, JetBrains Mono raw), string vs content, variable types, functions with default args, lists/enums/markers, blocks/boxes/shapes, `read()` | 2026-11-09 |
| [Typst-Quarto workflow](typst/typst-quarto-workflow.md) | Decision record (dated 2026-10-26, workflow "last update: 8/30/2026"): .qmd as single source of truth, "(7/26) Decision made NOT to use raw typst files" (embed `{=typst}` chunks), render matrix (.qmd→pdf/html via quarto, .typ via typst CLI / pandoc with cleanup pitfall, .md→pdf via read()+raw() wrapper 320_main.qmd), tech_notes directory layout incl. ~/code/publish-project | 2026-11-09 |
| [Typst diagrams and a computational graph](typst/typst-diagrams.md) | Fletcher package (`@preview/fletcher:0.5.8`): `node`/`edge` options, named nodes, edge labels/shifts, math-mode `#diagram` with edge decorations ("wave", "zigzag", "coil"), debug grid, `#v(1cm)`; Graphviz `{dot}` alternative; worked chain-rule example for f(x,y)=(x+y)y: ∂f/∂x = y, ∂f/∂y = u + y = x + 2y | 2026-11-09 |
| [Typst math and drawing basics](typst/typst-math-drawing.md) | Math equations: `#set math.equation(numbering: "(1)")`, symbol vs unicode forms of the same statement, `dots` sequences, `$A = U Sigma V$`; drawing: `rect`/`polygon` with `blue.lighten(80%)`, mixed relative/absolute point lengths, origin (0,0) upper left ("positive x is then down", sic); `#let` variable shown in text and a `#table`; pointers to material covered in the other typst articles | 2026-11-09 |
| [Typst math packages](typst/typst-math-packages.md) | noteworthy template (`#show: noteworthy.with(...)` watermark "DRAFT") + physica imports, `#definition[...]`/`#example[...]` environments, document setup, math odds and ends (`mat`/`vec`, `bb()`, `cal()`, `cases()`, `dif`, `gradient`, diverential `dv(f,x, eval:0)`), cetz-plot function plotting, Google Colab `ai.generate_text` → full typst document with `#block` takeaway box | 2026-11-09 |

## api — client-service interaction models

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [WebSocket vs REST](api/websocket-vs-rest.md) | Both use HTTP; websocket is "like 2-way telephone" (either side pushes), REST is stateless and the client must initiate | 2026-11-08 |
| [Google/YouTube API with OAuth2 and httr2](api/google-oauth-httr2.md) | Authorization code flow: accounts.google.com auth server, youtube + force-ssl scopes, Explorer GET vs curl equivalents, httr2 `oauth_client()` + `req_oauth_auth_code()` (localhost redirect, obo deprecated), curl one-liners (-w, -i, --head, -K config) | 2026-11-09 |
| [Exporting Reddit saved items](api/reddit-saved-backup.md) | No saved-item search, strict 1,000-item limit, private list; PRAW backup script (CSV), AI-agent routes (browser automation safer, credentials high-risk), Reddit Data Request takeout + OAuth extensions/web apps | 2026-11-09 |

## linux — Debian/Linux system administration notes

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [Debian/Linux administration notes](linux/debian-admin.md) | apt recipes, lightdm autologin, boot chain + GRUB2 recovery (`set root=(hd0,gpt2)`), mounts/lsblk/fat32 USB + dd, cron logging, capslock→escape via setxkbmap/xmodmap (keycodes 133/66/24), xev/xxd, WirePlumber-PipeWire-ALSA stack, PGP key signing, R install on Debian (gpg, not apt-key), stay with X11 | 2026-11-09 |

## latex — legacy LaTeX/PDF toolchain (pre-Quarto)

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [LaTeX/PDF toolchain notes](latex/latex-pdf-toolchain.md) | tlmgr + TinyTex troubleshooting (missing .sty, `fc-list : family`), ENGINE=software vs FORMAT=macros, tex's 320 primitives → LuaTex rewrite / LuaLatex macros, TikZ over pstricks (avoid postscript), pandoc drops latex for HTML ("must go with PDF") | 2026-11-09 |

## math — calculus, linear algebra, probability/statistics, and ML notes

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [Math and statistics notes](math/math-statistics-notes.md) | dy/dx as symbol (differential form/co-vector), tangent line/plane, basis change, bias vs noise, LLN/CLT, s² vs σ̂² (biased, N=1 → 0), Bayes P(A∩B)/P(B), entropy/surprise, likelihood village example (p_b = 0.60), logistic regression vs bookie, log-normal growth, tensors, Laplace/Gaussian integral, gradient example vec(-7,7), principal axes, regression/chi-square/correlation formulas, zero divisors + integral domains (ZZ_6 counter-example), measure-theory foundations (Radon-Nikodym, Lebesgue expectation, fat-Cantor/mixed/singular PDFs: "measurability is the only requirement"), bond duration | 2026-11-09 |
