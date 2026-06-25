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

- blog, articles, https://sebastianraschka.com/ 
- Hadley's blog
- LLM are stateless (no memory)
- human -> LLM is HTTP request/response
- Tool -> LLM can not reply with weather,  LLM looks for tool, which runs on user's machine
- Which tool?  JSON will list tool LLM should  use.
- JSON is message transfer
- HARNESS (ex: ellmer) - bounds, not the "driver", just limits, actually calls the tool
- AGENT is wrapper around all of this, loop
- LLM is "engine", HARNESS is rest of car, control speed, direction, memory, dashboard"
- LLM is brain, HARNESS is rest of body. Brain says "run", harness controls muscles, lungs, ....

https://cameronrwolfe.substack.com/p/agentic-rl


### ML BASICS

** Peng tidyverse 2021 Ch5 models
** LEARNING: SmolML (uses Karpathy) from scratch in python, no pytorch :  https://github.com/rodmarkun/SmolML?tab=readme-ov-file :read:
** Geeks4Geeks : many tutorials https://www.geeksforgeeks.org/machine-learning/machine-learning/
** Kaggle: ** guide https://www.kaggle.com/learn/intro-to-machine-learning, 
https://www.kaggle.com/code/dansbecker/how-models-work
** Karpathy https://www.youtube.com/watch?v=VMj-3S1tku0&list=PLAqhIrjkxbuWI23v9cThsA9GvCAUhRvKZ&index=1
** Rebecca Carter, very clear:  tidymodel intro (https://rebeccabarter.com/blog/2020-03-25_machine_learning#what-is-tidymodels)


** TODO Mnielson [ [neural][ http://neuralnetworksanddeeplearning.com/chap1.html]] :read:
** TODO Clark models               :read: 
** TODO Patterns Hardt & Recht :read:
** Kim, S.... https://skim.math.msstate.edu/LectureNotes/Machine_Learning_Lecture.pdf (python - see Ch2, good, but also need numerical examples ) :read: 

** Mohamed AAZI - good, but lost the lin  :read:
** Geeks4Geeks : scikit  :read:
** Bagging:  Classifer (0,1)  Bootstramp original sample; but each with only 1 or 2 features (sampled) from all features (ex: ageron, 05-decison-trees)


#### from scratch
python, multiple lessons, build each piece, tokenizer, transformer, harness .... https://github.com/rohitg00/ai-engineering-from-scratch


  Cameron Wolfe:explains  https://cameronrwolfe.substack.com/p/ai-agents
** Video lectures:  AI, ML  probability, linear algebra!  https://www.youtube.com/watch?v=YIJrRfj37Cc&list=PLE0hRHRkCk4N-nYlVGSE8cwyzxQomm2Pa 

** Tom Yeh, [[https://www.youtube.com/playlist?list=PL0cq-CiC5Qhs9HcDnJpWuoDMrV0iPJ_-X][ai by hand videos]]

** HuggingFace
video: https://youtu.be/QEaBAZQCtwE?si=KlY62cMeE63jtoNP
datacamp:  https://www.youtube.com/watch?v=R8h_gpSpEVU
exBert (visualize ??) https://www.youtube.com/watch?v=Dtw1lcFg3Ss
BERT: (article - I don't get it) https://arize.com/blog-course/unleashing-bert-transformer-model-nlp/

** Columbia (backprop) https://www.youtube.com/watch?v=sIX_9n-1UbM   


Why do we measure?   Suppose we sum over all elments of (0,1) - too big; uncountable.   Choose a measure where singletons have measure zero!

**For LLM, AGENTS see:  LLM_NOTES.md**

Misc:
(ideas!) https://youtu.be/WNx-s-RxVxk?si=BpD36FsFY8Lq6juv (matt pocock)

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
