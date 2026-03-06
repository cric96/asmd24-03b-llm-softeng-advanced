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

#grid(
  columns: (1fr, 1fr),
  gutter: 2em,
  [
    #underline[*Why ML in SE?*]
    #v(0.5em)
    - *Automation:* repetitive tasks (e.g., code generation)
    - *Prediction:* bugs, quality, and performance
    - *Understanding:* software artifacts and processes
    - *Personalization:* development tools
  ],
  [
    #underline[*When?*]
    #v(0.5em)
    - *Requirements:* elicitation and analysis
    - *Implementation:* generation, refactoring, bug fixing
    - *Testing:* test case generation, fault prediction
    - *Maintenance:* bug prediction, code review
  ]
)

#v(0.5em)
#underline[*Early Pitfalls* #fa-exclamation-circle()]
#v(0.3em)
#grid(
  columns: (1fr, 1fr, 1fr, 1fr),
  gutter: 0.5em,
  [#align(center)[_Data scarcity_]],
  [#align(center)[_Single-task models_]],
  [#align(center)[_Poor generalization_]],
  [#align(center)[_Limited HCI_]]
)

#v(0.5em)
#underline[*Why LLMs overcome these limits?*]
#v(0.3em)
#grid(
  columns: (1fr, 1fr, 1fr),
  gutter: 0.5em,
  [#align(center)[*One-model-for-all*]],
  [#align(center)[*Context-aware*]],
  [#align(center)[*Human-level performance*]]
)
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
