// =============================================================================
// Senior Engineer / Industry Leader Resume — 10+ years
// Edit the data below, then run: typst compile resume.typ resume.pdf
// =============================================================================

// --- Design system (colors, spacing) ---
#let accent = rgb("#0d9488")
#let heading-fill = rgb("#0f172a")
#let body-fill = rgb("#334155")
#let muted-fill = rgb("#64748b")
#let rule-stroke = rgb("#e2e8f0")
#let section-header-bg = rgb("#f1f5f9")
#let section-gap = 0.45em
#let section-sep-gap = 0.4em
#let block-gap = 0.38em
#let section-content-top = 0.32em

// --- Page & base typography ---
#set page(
  paper: "us-letter",
  margin: (top: 0.55in, bottom: 0.55in, left: 0.6in, right: 0.6in),
  fill: white,
)
#set text(size: 10.5pt, fill: body-fill)
#set par(justify: false, leading: 0.7em)

// Section headings: light bar + bold title; thin rule under header; clear separation from content
#show heading.where(level: 1): it => {
  [
    #v(section-gap)
    #block(
      fill: section-header-bg,
      inset: (left: 0.6em, right: 0.6em, top: 0.3em, bottom: 0.3em),
      radius: 3pt,
      stroke: (left: 3pt + accent),
    )[
      #set text(size: 11pt, weight: "bold", fill: heading-fill)
      #it.body
    ]
    #line(length: 100%, stroke: 0.5pt + rule-stroke)
    #v(section-content-top)
  ]
}

// --- Your data (edit these) ---
#let name = "Alex Chen"
#let tagline = "Principal Engineer · 10+ Years Building Systems at Scale"
#let years-note = "Industry leader in distributed systems and platform engineering"
#let email = "alex.chen@email.com"
#let phone = "+1 (555) 123 4567"
#let website = "linkedin.com/in/alexchen"
#let location = "San Francisco Bay Area"
#let github = "github.com/alexchen"

// Experience: senior / principal / staff roles with leadership impact
#let experience = (
  (
    title: "Principal Software Engineer",
    company: "Tech Corp",
    dates: "2021 – Present",
    bullets: (
      "Drive technical strategy for platform serving 50M+ users; own roadmap for reliability and scale.",
      "Lead cross-org initiative on observability; reduced P99 latency by 35% and incident MTTR by 50%.",
      "Mentor 6 senior engineers; established design-review and on-call practices adopted org-wide.",
    ),
  ),
  (
    title: "Staff Software Engineer",
    company: "Scale Systems Inc.",
    dates: "2018 – 2021",
    bullets: (
      "Architected and shipped event-driven platform processing 10B+ events/day with sub-second SLA.",
      "Championed migration from monolith to microservices; cut deployment time from hours to minutes.",
      "Built and led platform guild; set standards for APIs, testing, and production readiness.",
    ),
  ),
  (
    title: "Senior Software Engineer",
    company: "DataFlow Labs",
    dates: "2015 – 2018",
    bullets: (
      "Designed and implemented real-time data pipelines and APIs used by 5+ product teams.",
      "Introduced Kafka and stream processing; improved data freshness from batch to real-time.",
      "Mentored 3 engineers; contributed to hiring and leveling criteria for backend roles.",
    ),
  ),
  (
    title: "Software Engineer",
    company: "StartupXYZ",
    dates: "2013 – 2015",
    bullets: (
      "Built core backend services and APIs; improved system reliability and developer velocity.",
      "Collaborated with product and design on specs; owned production operations and on-call.",
    ),
  ),
)

// Education
#let education = (
  (degree: "M.S. Computer Science", institution: "Stanford University", dates: "2011 – 2013", note: "Thesis: Distributed Systems"),
  (degree: "B.S. Computer Science", institution: "UC Berkeley", dates: "2007 – 2011", note: "Minor in Mathematics"),
)

// Skills: senior / principal breadth
#let skills-heading = "Technical Leadership & Stack"
#let skills-languages = ("Rust", "Go", "TypeScript", "Python", "SQL")
#let skills-systems = ("Distributed Systems", "Event-Driven Architecture", "API Design", "Observability", "Incident Management")
#let skills-tools = ("AWS", "Kubernetes", "Terraform", "Kafka", "PostgreSQL", "Datadog", "Git")

#let skills-content = [
  #text(weight: "bold", fill: heading-fill)[Languages] #text(fill: body-fill)[#skills-languages.join(" · ")]
  #v(0.25em)
  #text(weight: "bold", fill: heading-fill)[Systems & domains] #text(fill: body-fill)[#skills-systems.join(" · ")]
  #v(0.25em)
  #text(weight: "bold", fill: heading-fill)[Tools & platforms] #text(fill: body-fill)[#skills-tools.join(" · ")]
]

// Optional: talks, OSS, or side projects
#let projects = (
  (
    name: "Observability at Scale (Conference Talk)",
    link: "https://example.com/talk",
    description: "Best practices for metrics, tracing, and SLOs in microservices.",
  ),
  (
    name: "open-source/event-schema",
    link: "https://github.com/alexchen/event-schema",
    description: "Schema registry and validation library; 500+ GitHub stars.",
  ),
)

// =============================================================================
// Resume body — structure (edit data above; adjust layout below if needed)
// =============================================================================

// Header: name + tagline + years note + contact
#block(width: 100%)[
  #align(center)[
    #text(size: 26pt, weight: "bold", fill: heading-fill)[#name]
    #v(0.2em)
    #text(size: 11pt, fill: accent)[#tagline]
    #v(0.15em)
    #text(size: 9.5pt, fill: muted-fill)[#years-note]
    #v(0.45em)
    #text(size: 9.5pt, fill: body-fill)[
      #email #h(0.8em) #text(fill: rule-stroke)[|] #h(0.8em) #phone #h(0.8em) #text(fill: rule-stroke)[|] #h(0.8em) #website #h(0.8em) #text(fill: rule-stroke)[|] #h(0.8em) #location #h(0.8em) #text(fill: rule-stroke)[|] #h(0.8em) #github
    ]
  ]
  #v(0.3em)
  #line(length: 100%, stroke: 0.75pt + rule-stroke)
]

#v(section-gap)

= Experience

#for job in experience [
  #block(above: block-gap)[
    #grid(
      columns: (1fr, auto),
      gutter: 1em,
      align: (left, right),
      [#text(weight: "bold", fill: heading-fill)[#job.title] #text(fill: muted-fill)[#job.company]],
      [#text(size: 9.5pt, fill: muted-fill)[#job.dates]],
    )
    #v(0.2em)
    #for bullet in job.bullets [
      #block(inset: (left: 1em))[
        #text(fill: accent)[#sym.triangle.filled.small.r] #h(0.35em) #bullet
      ]
    ]
  ]
]

= Education

#for edu in education [
  #block(above: 0.3em)[
    #text(weight: "bold", fill: heading-fill)[#edu.degree] — #text(fill: body-fill)[#edu.institution] #h(1em) #text(size: 9.5pt, fill: muted-fill)[#edu.dates]
    #if edu.note != none [#v(0.08em); #text(size: 9.5pt, fill: muted-fill)[#edu.note]]
  ]
]

= #skills-heading

#block(inset: (left: 0.5em), fill: rgb("#f8fafc"), radius: 4pt)[
  #pad(left: 0.6em, right: 0.6em, top: 0.45em, bottom: 0.45em)[
    #skills-content
  ]
]

#if projects.len() > 0 [
  = Selected Talks & Projects

  #for proj in projects [
    #block(above: 0.3em)[
      #link(proj.link)[#text(weight: "bold", fill: accent)[#proj.name]] — #text(fill: body-fill)[#proj.description]
    ]
  ]
]
