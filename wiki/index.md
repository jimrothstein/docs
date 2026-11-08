# Knowledge Base Index

## llm-agents — agent architecture, harness/tools, and protocols (MCP/ACP), compiled from the tech notes

| Article                                 | Summary                                                                                                                                                                    | Updated    |
| --------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------- |
| LLM Agents: Harness, Tools, and MCP](llm-agents/llm-agent-architecture.md) | Agent vs workflow control (agent-agency), the harness/LLM split with its engine/brain metaphors, tool calling, agent concepts (RAG, graph, vector search, attention, Graph RAG), the MCP protocol stack (JSON-RPC 2.0 over stdio or Streamable HTTP), ACP, and open-weights vs "free" | 2026-11-08 |

## git — everyday git recipes: rebase/squash, recovery, diff, log, ignore-file hygiene

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [Git Commands](git/git-commands.md) | `git rebase main` (moves `dev` commits after `main` HEAD), interactive squash (earlier picks → `s`), amend + force push when already pushed, `git reset` ("NO, do not use") vs `restore`/`checkout <SHA> -- <file>` recovery, check-ignore/.gitkeep/--skip-worktree, diff variants including local-vs-remote via fetch, pull-error recovery, log recipes and `origin..HEAD` notation | 2026-11-08 |

## tools — plain-text CLI cheat sheet: pandoc, yt-dlp, emacs, ex, i3, uv/venv, zathura, zsh

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [Simple CLI cheat sheet](tools/simple-cli-cheatsheet.md) | "Simplest possible command cheat sheet": pandoc md→pdf via typst (fallback-font error noted), `yt-dlp ytsearch10` recipe, Doom Emacs flyspell+aspell spelling, ex editor line commands, `xprop WM_CLASS` window-class discovery in i3, uv/venv project setup (positron tip), zathura keys, zsh list/loop one-liners | 2026-11-08 |

## python — python data stack and the Positron editor

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [Python data packages](python/python-data-packages.md) | parquet as a storage method, polars "(like tibble)" spreadsheet view (apache arrow origin), legacy numpy (matrices, lin alg) and pandas | 2026-11-08 |
| [Positron setup and skills](python/positron-setup.md) | Config paths (`~/.positron/extensions/`, `~/.posit/{ai,assistant}/`, `~/.config/Positron/User/settings.json`) and posit-dev skills: user-level vs project-level SKILL.md locations, project overrides user | 2026-11-08 |

## api — client-service interaction models

| Article | Summary | Updated    |
| ------- | ------- | ---------- |
| [WebSocket vs REST](api/websocket-vs-rest.md) | Both use HTTP; websocket is "like 2-way telephone" (either side pushes), REST is stateless and the client must initiate | 2026-11-08 |
