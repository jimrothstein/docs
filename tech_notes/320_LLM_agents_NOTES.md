---
name: 320_LLM_agents_NOTES.md
description: "This *.md:   operational notes, tools, websites   - no theory here."
---

THIS IS *.md file.

### LEARN (above average!)
Hadley - newsletter, using ellmer to explain agent, harness ...
Simon Willison writes how he uses LLM models; https://simonwillison.net/2026/Mar/30/mr-chatterbox/

### LLM

Short Definitions:

node:  allow js use outside browser
javascript:  Why?   designed for async http requests
openwebui.com: cloud, ui, to connect to local ollama.  Don't see benefit. 

self-attention:  I went to bank to get money.   Does bank refer to river or building?
transformer:   _He_ did something....           transformer can determine _he_ even if several paragraphs away.
attention matrix:  NxN matrix,    pairs various tokens
Compact:  [[compact ][~/code/docs/tech_notes/compact.md]]
Context:  context gets too big (https://papers.voltropy.com/LCM)
free tool: https://github.com/vava-nessa/free-coding-models?tab=readme-ov-file#-why-this-tool  

Tool:   When LLM needs external info (file system, web) provides agent with such a tool. Agent then runs the tool.

ACP (Agent Client Protocol) any IDE; write in buffer then send to agent - any Agent communication (if both support) www.agentclientprotocol.com

ADR (Architecture Decision Model) - a record of decsions made, as process evolves

artifact: A reminent that remains long after and yields insights into what we did; why; and how we did it.

Open Claw: can communicate via slack, signal .... executes based on information arriving. (pi )

          
Chris Brown: setup in R, ellmer, copilot, openRouter...
- https://www.seascapemodels.org/R-llm-workshop/
- https://www.seascapemodels.org/AI-assistants-for-scientific-coding/

- Large LLMs book (@ 2/1/2025): <https://luisdva.github.io/llmsr-book/before-start.html>
- ellmer <https://github.com/tidyverse/ellmer/>

Misc:
(ideas!) https://youtu.be/WNx-s-RxVxk?si=BpD36FsFY8Lq6juv (matt pocock)
Chat examples

- Shiny assistant <https://shiny.posit.co/blog/posts/shiny-assistant/>
- query chat <https://github.com/posit-dev/querychat  
  Given a db, write query in English; LLM adjusts shiny app to show graphs, data

- dev article <https://docs.continue.dev/customize/overview> 
- R, ollama, deepseek <https://drmowinckels.io/blog/2025/ollama/>


### OpenCode
Config:  allows agent info to be put into ~/.config/opencode/opencode.json (advanage:  no need to put in AGENTS.md each time)

  Organize + ai (knowledge graph, wiki, 
- video: create wiki & knowledge graph, rag https://www.youtube.com/watch?v=yYSTsKo8moU
- another LLM & wiki: https://www.youtube.com/watch?v=zVEb19AwkqM

### good projects
Builds LLMwiki https://pankajkr62.substack.com/p/how-i-built-a-zero-cost-100-local

  - Jon = interesting things with AGENTSkills (https://gilead-biostats.github.io/qcthat/dev/)
  - (Antigravity - awesom) https://www.youtube.com/watch?v=baGKgnbQUq8
  - Ask LLM to keep ~/NOTES.md  ("Oh, also, as you work, please keep working notes in ~/NOTES.md -- update them each new step you take, each investigation, and document your findings. Thank you!" 

*** Opencode has "subagents" - for specialized activites (General and explore)
    

HuggingFace
    video: https://youtu.be/QEaBAZQCtwE?si=KlY62cMeE63jtoNP
    datacamp:  https://www.youtube.com/watch?v=R8h_gpSpEVU
    create spaces: https://youtu.be/xqdTFyRdtjQ?t=156
    exBert (visualize ??) https://www.youtube.com/watch?v=Dtw1lcFg3Ss
    BERT: (article - I don't get it) https://arize.com/blog-course/unleashing-bert-transformer-model-nlp/

*** (KodeLab) https://www.youtube.com/watch?v=baGKgnbQUq8


AGENTS
* Think linearly; terrible at connecting "insights";  want AGENT to explore branches ("Graph of Thought") before it does anything

ORCHESTRATION
* Sync tools, results, 

MCP
* standardizes a protocol for all actions; replaces ad-hoc

GRAPH RAG
* reason *between* documents.  (RAG can not do this)
