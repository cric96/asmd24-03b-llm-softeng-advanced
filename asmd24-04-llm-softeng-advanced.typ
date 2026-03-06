#import "@preview/touying:0.6.1": *
#import "themes/theme.typ": *
#import "@preview/fontawesome:0.6.0": *
#import "@preview/ctheorems:1.1.3": *
#import "@preview/numbly:0.1.0": numbly
#import "utils.typ": *

// Pdfpc configuration
// typst query --root . ./example.typ --field value --one "<pdfpc-file>" > ./example.pdfpc
#let pdfpc-config = pdfpc.config(
    duration-minutes: 30,
    start-time: datetime(hour: 14, minute: 10, second: 0),
    end-time: datetime(hour: 14, minute: 40, second: 0),
    last-minutes: 5,
    note-font-size: 12,
    disable-markdown: false,
    default-transition: (
      type: "push",
      duration-seconds: 2,
      angle: ltr,
      alignment: "vertical",
      direction: "inward",
    ),
  )

// Theorems configuration by ctheorems
#show: thmrules.with(qed-symbol: $square$)
#let theorem = thmbox("theorem", "Theorem", fill: rgb("#eeffee"))
#let corollary = thmplain(
  "corollary",
  "Corollary",
  base: "theorem",
  titlefmt: strong
)
#let definition = thmbox("definition", "Definition", inset: (x: 1.2em, top: 1em))
#let example = thmplain("example", "Example").with(numbering: none)
#let proof = thmproof("proof", "Proof")

#show: theme.with(
  aspect-ratio: "4-3",
  footer: self => self.info.author + ", " + self.info.institution + " - " + self.info.date,
  config-common(
    // handout: true,
    preamble: pdfpc-config, 
  ),
  config-info(
    title: [Leveraging LLMs in Software Engineering],
    subtitle: [Current Trends and Future Directions],
    author: [Gianluca Aguzzi],
    date: datetime.today().display("[day] [month repr:long] [year]"),
    institution: [Università di Bologna],
    // logo: emoji.school,
  ),
)

#set text(font: "Source Sans Pro", weight: "regular", size: 20pt)
#show math.equation: set text(font: "Fira Math")
#show strong: set text(weight: "bold", fill: rgb("#005587"))
#show emph: set text(style: "italic", fill: rgb("#00a3e0"))
#set underline(stroke: 1.5pt + rgb("#005587"), offset: 2pt)

#title-slide()

== Today's Lesson: LLMs in Software Engineering

*Learning Objectives:*
- _Understand_ the impact of LLMs on modern software development.
- _Explore_ practical applications across the development lifecycle.
- _Examine_ ethical considerations and limitations.

*Key Applications We'll Cover:*
- AI-assisted software development
  - Code completion, generation, documentation, and review
- Vibe coding and "AI programming agents"
- Practical suggestions for integrating LLMs into your workflow

#v(1em)
#underline[*Note:*] This field is evolving rapidly—_concepts matter more than specific implementations_ #fa-lightbulb()

== Machine Learning for Software Engineering
#focus-slide()[
  #align(center)[
    #text(size: 28pt, weight: "bold")[Machine Learning for Software Engineering]
    
    #v(1em)
    
    #text(size: 20pt)[
      Application of machine learning #emph[techniques] and #emph[methodologies] to address challenges and solve problems in the field of software engineering
    ]
    
    #v(1em)
    
    #image("figures/pubblication-over-year.png", width: 70%)
  ]
]

== Machine Learning for Software Engineering

Machine Learning has been increasingly adopted in Software Engineering to improve productivity, quality, and maintainability. We can categorize its application by asking *Why* and *When* we use it.

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #underline[*Why?*]
    #v(0.5em)
    - *Automation:* automate repetitive tasks (e.g., code generation).
    - *Prediction:* predict software quality, bugs, and performance.
    - *Optimization:* optimize software development processes.
    - *Understanding:* understand software artifacts and processes.
    - *Personalization:* personalize software development tools.
  ],
  [
    #underline[*When?*]
    #v(0.5em)
    - *Requirement Engineering:* requirements elicitation and analysis.
    - *Design:* design patterns, architecture, and modeling.
    - *Implementation:* code generation, refactoring, and bug fixing.
    - _*Testing:*_ test case generation, fault prediction, ...
    - *Maintenance:* bug prediction, code review, ...
  ]
)

== Machine Learning for Software Engineering -- Overview

  #align(center)[
    #image("figures/distrubution.png", width: 90%)
  ]
_From: Machine Learning for Software Engineering: A Tertiary Study_


== Early approaches -- Supervised Learning

#example[
  #text(weight: "bold")[Coderf Summarization (CodeNN)#footnote(link("https://github.com/sriniiyer/codenn"))]
  
  #align(center)[
    #image("figures/codenn.png", width: 80%)
  ]
]

== Early approaches -- Supervised Learning

#example[
  #text(weight: "bold")[Malware Detection#footnote("Cui, Z., Xue, F., Cai, X., Cao, Y., Wang, G., & Chen, J. (2018). Detection of Malicious Code Variants Based on Deep Learning. IEEE Trans. Ind. Informatics, 14(7), 3187–3196. doi:10.1109/TII.2018.2822680")]
  
  #align(center)[
    #image("figures/malware-detection.png", width: 80%)
  ]
]

== Early approaches -- Supervised Learning

#example[
  #text(weight: "bold")[Code Review -- Deep Review#footnote("Li, H.-Y., Shi, S.-T., Thung, F., Huo, X., Xu, B., Li, M., & Lo, D. (2019). DeepReview: Automatic Code Review Using Deep Multi-instance Learning. In Q. Yang, Z.-H. Zhou, Z. Gong, M.-L. Zhang, & S.-J. Huang (Eds.), Advances in Knowledge Discovery and Data Mining - 23rd Pacific-Asia Conference, PAKDD 2019, Macau, China, April 14-17, 2019, Proceedings, Part II (pp. 318–330). doi:10.1007/978-3-030-16145-3_25")]
  
  #align(center)[
    #image("figures/deep-review.png", width: 60%)
  ]
]

== Early approaches -- Unsupervised Learning

#example[
  #text(weight: "bold")[Code Completion (kNN)#footnote("Bruch, M., Monperrus, M., & Mezini, M. (2009). Learning from examples to improve code completion systems. In H. van Vliet & V. Issarny (Eds.), Proceedings of the 7th joint meeting of the European Software Engineering Conference and the ACM SIGSOFT International Symposium on Foundations of Software Engineering, 2009, Amsterdam, The Netherlands, August 24-28, 2009 (pp. 213–222). doi:10.1145/1595696.1595728")]
  
  #align(center)[
    #image("figures/code-completions.png", width: 80%)
  ]
]

== Early approaches -- Pitfalls

While early machine learning approaches showed promise, they faced significant limitations that hindered their widespread adoption in software engineering.

#v(1em)
#underline[*Key Pitfalls:*] #fa-exclamation-circle()
#v(0.5em)
- *Data scarcity:* software engineering data is scarce and expensive to collect, posing challenges for training effective models.
- *Single-task models:* many models are designed for _specific_ tasks, limiting their broader _applicability_ and _reuse_.
- *Lack of generalization:* models often fail to _generalize_ across different software projects and domains.
- *Human-computer interaction:* Early models did not adequately consider human factors, impacting _usability_ and _adoption_ in software development practices.

== Towards LLM solutions

Large Language Models offer a paradigm shift, addressing many of the limitations of earlier approaches by providing general-purpose, context-aware capabilities.

#v(1em)
#underline[*Why LLMs?*]
#v(0.5em)
- *Code understanding*: LLMs, correctly trained, can understand code and its context.
- *Code-Language link*: LLMs can link code to natural language, improving _documentation_ and _understanding_.
- *Session support*: LLMs can support developers during coding sessions, providing _hints_ and _suggestions_.
- *Testing support*: LLMs can generate _test cases_ and _fault prediction_.
- *One-model-for-all*: LLMs can be used for _multiple_ tasks, reducing the need for _task-specific_ models.
- *Personalization*: LLMs can be personalized to the developer's _style_ and _needs_.
- *Human-level performance*: LLMs can achieve human-level performance in _specific_ tasks.

== Human-level performance
#align(center)[
  #image("figures/can-ai-code.png", width: 100%)
]
#link("https://huggingface.co/spaces/mike-ravkine/can-ai-code-results")
== LLM in SE -- Areas of Application

#v(1em)
#align(center)[_LLMs connect each phase of development, creating a more integrated workflow and improving collaboration between developers and AI systems._]
#v(1em)
#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #underline[*Requirement Engineering*]
    #v(0.5em)
    - *Ambiguity Resolution:* clarifying vague requirements with natural language understanding
    - *Requirement Classification:* automatically categorizing and prioritizing requirements
    - *Requirements Analysis:* identifying conflicts, gaps, and relationships between requirements
  ],
  [
    #underline[*Software Development*]
    #v(0.5em)
    - *Code Generation:* translating specifications into executable code
    - *Code Summarization:* creating human-readable explanations of complex code
    - *Code Completion:* intelligently suggesting code as developers type
  ]
)

== LLM in SE -- Areas of Application

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #underline[*Software Quality*]
    #v(0.5em)
    - *Test Generation:* creating comprehensive test suites from specifications or code
    - *Fault Prediction:* identifying areas of code with high risk of defects
    - *Bug Localization:* pinpointing exact locations of errors in large codebases
    - *API Documentation:* automatically generating clear and accurate documentation
  ],
  [
    #underline[*Software Maintenance*]
    #v(0.5em)
    - *Code Review:* automating review processes to identify issues early
    - *Bug Prediction:* forecasting future defects based on code patterns
    - *Refactoring:* suggesting structural improvements while preserving behavior
    - *Commit Classification:* organizing version history for better project management
  ]
)

== Copilot (Github)
#align(center)[
  #image("figures/copilot-logo.png", width: 20%)
  
  #link("https://github.com/features/copilot")
]
#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #underline[*Overview*]
    #v(0.5em)
    - Advanced AI coding assistant by GitHub/Microsoft
    - Released 2021, *1M+ active developers*
    - Uses a family of specialized language models
    - Trained on billions of lines of public code
  ],
  [
    #underline[*Key Features*]
    #v(0.5em)
    - Real-time code suggestions #fa-lightbulb()
    - Context-aware assistance
    - Multi-language support
    - IDE integration (VS Code, JetBrains)
  ]
)

== Copilot -- Report#footnote(link("https://github.blog/2022-09-07-research-quantifying-github-copilots-impact-on-developer-productivity-and-happiness/"))
#grid(
  columns: (35%, 55%),
  gutter: 1em,
  [#image("figures/copilot-report-1.png", width: 100%)],
  [#image("figures/copilot-report-2.png", width: 100%)]
)

== A Copilot is all you need -- Code Completion
#align(center)[
  #image("figures/code-completion.png", width: 100%)
]
== A Copilot is all you need -- Code Generation
#align(center)[
  #image("figures/code-generation.png", width: 100%)
]
== A Copilot is all you need -- Test generation
#align(center)[
  #image("figures/test-generation.png", width: 80%)
]
*Note!* #fa-exclamation-triangle(): Are we sure we want test generation to be demanded to Copilot?

== A Copilot is all you need -- API Documentation
#align(center)[
  #image("figures/documentation-generation.png", width: 100%)
]
== A Copilot is all you need -- Code Review 
#align(center)[
  #image("figures/code-review.png", width: 100%)
]
== Is it really what you need? Copilot Concerns -- Security #fa-exclamation-triangle() #footnote(link("https://blog.gitguardian.com/yes-github-copilot-can-leak-secrets/"))
#align(center)[
  #image("figures/copilot-concerns.png", width: 100%)
]

== Is it really what you need?  Copilot Concerns -- Code Quality #fa-exclamation-triangle() #footnote(link("https://www.gitclear.com/coding_on_copilot_data_shows_ais_downward_pressure_on_code_quality"))
#align(center)[
  #image("figures/problem-code-quality.png", width: 100%)
]


== How Copilot (Perhaps) Works: Understanding RAG Architecture

#align(center)[
  #image("figures/RAG-phases.png", width: 80%)
]
== RAG Architecture -- Data Indexing

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #underline[*Data Indexing Process*]
    #v(0.5em)
    - Parsing and chunking source code
    - Generating embeddings for code segments
    - Creating searchable vector database
    - Metadata extraction and annotation
    
    #v(0.5em)
    _Transforms raw code repositories into structured, searchable knowledge_
  ],
  [
    #underline[*Practical Considerations*]
    #v(0.5em)
    - Embedding dimensions (typically 768-1536)
    - Chunking strategies (function-level, file-level)
    - Storage options (in-memory vs. persistent)
    - Indexing methods (tree-based, graph-based)
    - Handling of comments and documentation
    - Versioning and incremental updates
  ]
)



#v(1em)
#underline[*Vector store:*]
#v(0.5em)
- *Vector Database:* Specialized storage optimized for similarity search
- *Indexing Strategies:* HNSW, IVF, etc. for efficient retrieval
- *Metadata Store:* Additional context about each code fragment
- *Update Mechanisms:* Keeping the index synchronized with codebase changes
== RAG Architecture -- Retrieval

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #underline[*Retrieval Process*]
    #v(0.5em)
    - Convert user query to embedding vector
    - Perform similarity search in vector space
    - Apply filters based on context/preferences
    - Rank results by relevance
    - Select top-k most relevant code examples
    
    #v(0.5em)
    _Finds the most relevant code snippets based on semantic similarity_
  ],
  [
    #underline[*Practical Techniques*]
    #v(0.5em)
    - Cosine similarity for semantic matching
    - Approximate nearest neighbor search
    - Top-k retrieval (typically k=3 to 10)
    - Re-ranking strategies for relevance
    - Hybrid retrieval (combining keyword and vector search)
    - Context window management (token limits)
    - Filtering by programming language or domain
  ]
)
== RAG Architecture -- Augmentation & Generation
#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #underline[*Context Augmentation*]
    #v(0.5em)
    - Enrich prompts with retrieved code examples
    - Include documentation and project conventions
    - Incorporate API usage examples and test cases
    
    #v(0.5em)
    _Enhances LLM knowledge with relevant context_
  ],
  [
    #underline[*Augmentation Strategies*]
    #v(0.5em)
    - Template-based prompt construction
    - Context prioritization and structured formatting
    - Documentation and error case integration
    - Dependency analysis and style pattern extraction
  ]
)

#v(1em)
#underline[*Generation Benefits:*]
#v(0.5em)
- *Grounded Responses:* Code generation based on real examples
- *Up-to-date Information:* Access to latest APIs and patterns
- *Project Consistency:* Alignment with existing codebase styles
- *Reduced Hallucination:* Minimizes fabricated or incorrect code
- *Context Awareness:* Understanding of project-specific requirements



== LLMs for Software Testing #footnote(link("https://arxiv.org/abs/2307.07221"))
#focus-slide()[
  #align(center)[
    #text(size: 28pt, weight: "bold")[LLMs for Software Testing]
    
    #v(1em)
    
    #text(size: 20pt)[
      Leveraging Large Language Models to enhance software testing processes and improve code quality.
    ]
  ]
]
== LLMs for Software Testing -- Overview

#align(center)[
  #image("figures/overview.png", width: 100%)
]

*Takeaways:*
- LLMs can be used for _multiple_ testing tasks.
- Currently, LLMs are used for _test case generation_ and _bug fix_.
- The image shows a strong focus on _unit testing_ applications.
- There's significant interest in using LLMs for _test oracle creation_ - determining expected outputs.
- Most research combines LLMs with _traditional testing frameworks_ rather than replacing them.

== LLMs for Software Testing -- Methods

#align(center)[
  #image("figures/how-llm-are-used.png", width: 100%)
]
*Key Findings:*
- *Prompt Engineering dominates* as the primary adaptation method:
  - Requires no model fine-tuning → lower computational cost
  - Offers flexibility across different LLM platforms
  - Enables rapid iteration of testing approaches

- *Learning approaches spectrum:*
  - *Zero-shot learning* (88%) is most prevalent
    - Advantages: Simplicity, minimal setup, immediate application
    - Limitations: Often lacks domain-specific precision, inconsistent results
  
  - *Few-shot learning* provides middle ground:
    - Balances implementation ease with improved performance
    - Critical for complex testing scenarios with specific patterns

== LLMs for Software Testing -- Methods

#align(center)[
  #image("figures/llm-usage.png", width: 100%)
]

*Modern solutions integrate LLMs in standard testing tools:*
- LLMs are used as _intelligent agents_ in the testing process.
- Examples include:
  - *Statistic analysis:* leveraging statistical methods to enhance testing.
  - *Program analysis:* using LLMs to analyze and improve code.
  - *Mutation testing:* generating and evaluating mutants to improve test quality.
  - *Syntactic repair:* automatically fixing syntax errors.
  - *Differential testing:* comparing outputs of different program versions.
  - *Reinforcement learning:* applying RL techniques to optimize testing strategies.
  - *Others:* various other innovative uses of LLMs in testing.

== Mutation testing
  #align(center)[
    #text(size: 28pt, weight: "bold")[Mutation Testing with LLMs]
    
    #v(1em)
    
    #text(size: 20pt)[
      Using LLMs to intelligently generate and evaluate code mutations to assess test suite quality
    ]
  ]
  
  #v(1em)
  
  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #underline[*Traditional Mutation Testing*]
      #v(0.5em)
      - Random code alterations
      - Computationally expensive
      - Many irrelevant mutations
      - Limited mutation operators
    ],
    [
      #underline[*LLM-Enhanced Mutation Testing*]
      #v(0.5em)
      - Semantically meaningful mutations
      - Context-aware code changes
      - Targeting edge cases and vulnerabilities
      - Higher-quality mutants with fewer resources
    ]
  )
  
== Mutation Testing -- Example
  #v(1em)
  
  *Original code:*
  ```python
  def divide(a, b):
      return a / b
  ```
  
  *LLM-generated intelligent mutations:*
  
  #grid(
    columns: (1fr, 1fr),
    gutter: 2em,
    [
      #underline[*Boundary case mutation*]
      ```python
      def divide(a, b):
          return a / (b + 0.0001)  # Avoid exact zero
      ```
    ],
    [
      #underline[*Error handling mutation*]
      ```python
      def divide(a, b):
          if b == 0: return float('inf')
          return a / b
      ```
    ]
  )
  
  #grid(
    columns: (1fr),
    gutter: 0.5em,
    [
      #underline[*Logic inversion mutation*]
      ```python
      def divide(a, b):
          return b / a  # Swap arguments
      ```
    ]
  )
  

== LLMs for Software Testing -- Input

#align(center)[
  #image("figures/input-llm.png", width: 50%)
]

*Takeaways:*
- *Code (68%)*: Majority of inputs are code snippets - core focus on code-related tasks
- *Bug descriptions (10%)*: Essential for understanding and fixing issues
- *Error information (6%)*: Critical for debugging and issue resolution
- *UI hierarchy files (5%)*: Useful for testing user interfaces and interactions


== Innovative Solutions for LLMs -- LLM-Agent models

#focus-slide()[
  #align(center)[
    #text(size: 28pt, weight: "bold")[LLM-Agent-Based Architectures]
    
    #v(1em)
    
    #text(size: 20pt)[
      Complex architectures that leverage LLMs to create autonomous agents that can interact with the _environment_ and other LLM-agents.
    ]
  ]
]

== LLM-Agent -- Overview

#align(center)[
  #image("figures/number-of-papers.png", width: 100%)
]

== LLM-Agent -- Why?
#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #underline[*Evolving Beyond Single LLMs*]
    #v(0.5em)
    - *Complex Problem Solving:* Break down software engineering tasks into manageable sub-tasks
    - *Specialized Expertise:* Different agents can be optimized for specific development phases
    - *Tool Integration:* Agents can leverage external tools (debuggers, profilers, version control)
    - *Autonomous Operation:* Reduced human intervention for repetitive or complex tasks
    - *Collaborative Development:* Multiple agents working together mimic team dynamics
  ],
  [
    #underline[*Benefits for Modern Software Engineering*]
    #v(0.5em)
    - *End-to-End Solutions:* Complete software development lifecycle coverage
    - *Reasoning & Planning:* Strategic approaches rather than just tactical responses
    - *Self-Improvement:* Agents can learn from feedback and outcomes
    - *System Integration:* Seamless connection with existing development workflows
    - *Scalability:* Handles growing complexity of modern software projects
  ]
)
== LLM-Agent -- Modules

#align(center)[
  #image("figures/overview-agents.png", width: 100%)
]


== AIder -- The AI Developer#footnote(link("https://aider.chat/"))
#align(center)[
  #image("figures/aider.png", width: 80%)
]

== Auto GPT

#align(center)[
  #image("figures/auto-gpt-loop.png", width: 90%)
]


== Meta GPT

#align(center)[
  #image("figures/meta-gpt-idea.png", width: 100%)
]


#align(right)[
  #link("https://github.com/Significant-Gravitas/AutoGPT")
]

== AgentVerse

#align(center)[
  #image("figures/agent-verse.png", width: 100%)
]

== ... And Many Others

#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 1em,
  [
    #align(center)[
      #image("figures/all-hands.png",  height: 50%)
      *All Hands*
    ]
    ],
    [
    #align(center)[
      #image("figures/lang-graph.png", height: 50%)
      *Lang Graph*
    ]
    ],
    [
    #align(center)[
      #image("figures/crewai.png", height: 50%)
      *Crew AI*
    ]
    ],
)
== Conclusion: The LLM Revolution in Software Engineering

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #underline[*Evolution*]
    #v(0.5em)
    - ML in SE has evolved from specialized models to general-purpose solutions
    - LLMs represent a *fundamental shift* in approach and capabilities
    - We've moved from task-specific to unified intelligence models
  ],
  [
    #underline[*Impact*]
    #v(0.5em)
    - Comprehensive application across the development lifecycle:
      - Requirements to maintenance
      - Coding to documentation
      - Testing to deployment
    - Breaking down silos between development phases
  ]
)

#v(1em)

#underline[*New Paradigms*]
#v(0.5em)
#grid(
  columns: (1.2fr, 1fr, 1fr, 1fr),
  gutter: 0.5em,
  [#align(center)[*One-model-for-all* ]],
  [#align(center)[*Personalization* ]],
  [#align(center)[*Task adaptation* ]],
  [#align(center)[*Agent autonomy*]]
)

#v(1em)
#align(center)[_LLMs aren't just tools; they're becoming collaborative partners in software engineering_]
