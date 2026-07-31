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
#let section-gap = 0.95em         // space above each section heading
#let section-content-top = 0.68em // space between the separator line and content
#let job-gap = 1.15em             // space between roles
#let bullet-gap = 0.62em          // space between bullets (must exceed line leading)
#let title-bullets-gap = 0.68em   // space between a role's title and its bullets
#let edu-gap = 0.72em             // space between education entries

// --- Page & base typography ---
#set page(
  paper: "us-letter",
  margin: (top: 0.55in, bottom: 0.55in, left: 0.6in, right: 0.6in),
  fill: white,
)
#set text(size: 10.5pt, fill: body-fill)
#set par(justify: false, leading: 0.58em)

// Section headings: light bar + bold title; thin rule under header; clear separation from content
#show heading.where(level: 1): it => {
  v(section-gap, weak: true)
  block(
    fill: section-header-bg,
    inset: (left: 0.6em, right: 0.6em, top: 0.3em, bottom: 0.3em),
    radius: 3pt,
    stroke: (left: 3pt + accent),
    below: 0.14em,
  )[
    #set text(size: 11pt, weight: "bold", fill: heading-fill)
    #it.body
  ]
  line(length: 100%, stroke: 0.5pt + rule-stroke)
  v(section-content-top, weak: true)
}

// --- Your data (edit these) ---
#let name = "Yash Sharma"
#let tagline = "Senior Technical Lead · Senior Software Engineer (10+ yrs)"
#let years-note = "Scaling high-availability enterprise systems across FinTech, E-commerce & Healthcare"
#let email = "yasharma9391@gmail.com"
#let phone = "+91-9910448265"
#let phone-alt = "+91-7795455436"
#let website = "linkedin.com/in/yasharmays"
#let location = "Bangalore, Karnataka, India"

// Professional summary paragraph (rendered under the header)
#let summary = "Innovative and resilient Senior Software Engineer with over a decade of experience designing and scaling high-availability enterprise applications across FinTech, E-commerce, and Healthcare domains. Demonstrated expertise in orchestrating cross-functional migrations, engineering resilient RESTful microservices, and leading agile development teams to accelerate product delivery. Adept at bridging the gap between complex business requirements and robust, scalable technical architectures."

// --- Profile photo toggle ---
// The plain build (resume.pdf) omits the photo. Compile with `--input photo=true`
// (see resume-photo.pdf) to render the photo header.
// To use a different photo, replace `profile_pic.jpg` below.
#let show-photo = sys.inputs.at("photo", default: "false") == "true"
#let photo-file = "profile_pic.jpg"

// Experience: senior / lead roles with leadership impact
#let experience = (
  (
    title: "Senior Technical Lead",
    company: "Infovision Labs India Private Limited (Project: Wayfair)",
    dates: "Mar 2026 – Present",
    bullets: (
      "Led delivery of 22+ initiatives across the Material Catalog and Catalog Foundations domains, driving feature development, legacy modernization, and platform hardening for enterprise-scale catalog systems.",
      "Spearheaded legacy modernization by migrating a batch of product-data GraphQL integrations off legacy systems (CDF2), reducing coupling and technical debt.",
      "Built reusable automation tooling to accelerate migration, impact analysis, and dependency mapping across the catalog domain.",
      "Added traffic monitoring and test instrumentation before retiring unused database code, and contributed shared utilities and metrics analysis to support broader catalog decoupling.",
    ),
  ),
  (
    title: "Senior Software Engineer L3",
    company: "Canterr (Project: Wayfair)",
    dates: "Aug 2023 – Feb 2026",
    bullets: (
      "Spearheaded the Product Migration Team to execute a large-scale database migration for the Supplier Domain, supporting a platform that generates $12.5B+ in annual revenue and processes 40M+ annual orders, ensuring a seamless structural transition with zero unplanned system downtime.",
      "Orchestrated complex code migrations by implementing robust Feature Toggle strategies, reducing deployment risks and enabling incremental rollouts of critical new features to production.",
      "Redesigned and decoupled legacy REST APIs, significantly improving system modularity and enabling the engineering team to accelerate subsequent development cycles by 50%.",
      "Championed the end-to-end delivery of comprehensive back-end features—from initial architecture design to production deployment—achieving a 100% on-time release record for assigned technical sprints.",
    ),
  ),
  (
    title: "Software Engineer II",
    company: "ClearTax",
    dates: "Dec 2021 – June 2023",
    bullets: (
      "Engineered scalable REST APIs within a Spring Boot microservices architecture, driving the core back-end development for a high-traffic Vendor Management microservice on a platform processing over 5 billion global B2B transactions annually.",
      "Developed and integrated the Accounts Payable module, empowering enterprise clients to systematically track, manage, and process payable bills and invoices, reducing manual processing time by 30%.",
      "Took full ownership of the service lifecycle from scratch to production-ready deployment, ensuring high availability and robust performance across mission-critical FinTech SaaS applications.",
    ),
  ),
  (
    title: "Associate Consultant",
    company: "GlobalLogic India (Project: Adobe Commerce / Magento)",
    dates: "Mar 2021 – Dec 2021",
    bullets: (
      "Collaborated directly with cross-functional stakeholders to establish the foundational security team for Adobe Commerce, taking responsibility for the rapid identification and resolution of critical platform vulnerabilities.",
      "Fortified the e-commerce platform by patching high-priority security bugs, significantly reducing potential exploit vectors and improving overall system reliability for enterprise-level clients.",
    ),
  ),
  (
    title: "Software Development Engineer II",
    company: "Medlife (Now PharmEasy)",
    dates: "Jan 2019 – Mar 2021",
    bullets: (
      "Architected and implemented comprehensive back-end features and Microservice APIs utilizing Node.js, PHP, and Java Spring Boot, efficiently handling complex health-diagnostic e-commerce transactions and data flows supporting a scale of 17 million+ monthly active users.",
      "Automated dynamic data reporting systems and seamlessly integrated third-party LIS (Laboratory Information Systems), accelerating report generation speeds and reducing manual data entry overhead by 100%.",
      "Mentored and managed a small team of software developers, establishing robust Agile development methodologies that accelerated sprint delivery timelines and elevated overall code quality.",
    ),
  ),
  (
    title: "Software Developer / Front-End Team Lead",
    company: "Ailoitte Technologies / Arnit Retail / Nexia Digital",
    dates: "July 2016 – Jan 2019",
    bullets: (
      "Developed responsive front-end user interfaces and comprehensive back-end RESTful APIs for scalable e-commerce and logistics applications utilizing PHP, Node.js, and modern JS frameworks.",
      "Led front-end engineering initiatives at Arnit Retail, overseeing code quality and successful implementation of UI/UX improvements based on A/B testing (Google Optimize) results.",
      "Collaborated directly with clients at Nexia Digital to accurately document, troubleshoot, and deliver custom technical solutions tailored to complex business requirements.",
    ),
  ),
)

// Education
#let education = (
  (degree: "M.Tech in Computer Science Engineering (CSE)", institution: "Sharda University, Greater Noida", dates: "2015", note: "78%"),
  (degree: "B.Tech in Information Technology (IT)", institution: "Lovely Professional University, Jalandhar", dates: "2012", note: "70%"),
)

// Skills: grouped by the categories from the CV
#let skills-heading = "Core Technical Proficiencies"
#let skills-languages = ("Java (8/11/17)", "Python 3.x", "Node.js", "PHP", "JavaScript", "HTML5", "CSS3")
#let skills-databases = ("MySQL", "PostgreSQL", "MongoDB", "Redis")
#let skills-frameworks = ("Spring Boot 2.7.x", "Express.js", "Symfony", "CodeIgniter", "Angular.js", "React.js")
#let skills-cloud = ("AWS (EC2, Lambda, API Gateway, S3, SQS, Route 53)", "Docker", "Apache Kafka", "Git")
#let skills-methods = ("Microservices Architecture", "RESTful API Design", "Agile/Scrum", "Retool")
#let skills-testing = ("PHPUnit", "JUnit", "Mockito", "Jenkins", "Buildkite", "GitHub Actions")

#let skills-content = [
  #text(weight: "bold", fill: heading-fill)[Languages] #text(fill: body-fill)[#skills-languages.join(" · ")]
  #v(0.25em)
  #text(weight: "bold", fill: heading-fill)[Databases] #text(fill: body-fill)[#skills-databases.join(" · ")]
  #v(0.25em)
  #text(weight: "bold", fill: heading-fill)[Frameworks & Libraries] #text(fill: body-fill)[#skills-frameworks.join(" · ")]
  #v(0.25em)
  #text(weight: "bold", fill: heading-fill)[Cloud & DevOps] #text(fill: body-fill)[#skills-cloud.join(" · ")]
  #v(0.25em)
  #text(weight: "bold", fill: heading-fill)[Methodologies & Tools] #text(fill: body-fill)[#skills-methods.join(" · ")]
  #v(0.25em)
  #text(weight: "bold", fill: heading-fill)[Testing & CI/CD] #text(fill: body-fill)[#skills-testing.join(" · ")]
]

// Optional: talks, OSS, or side projects (hidden — set entries to show)
#let projects = ()

// =============================================================================
// Resume body — structure (edit data above; adjust layout below if needed)
// =============================================================================

// Header: name + tagline + years note + contact
// Circular profile photo (clipped to a circle). Swap the file via `photo-file` above.
#let photo-content = box(
  width: 100%, height: 100%,
  radius: 50%, clip: true,
)[
  #image(photo-file, width: 100%, height: 100%, fit: "cover")
]

#let contact-line = text(size: 9.5pt, fill: body-fill)[
  #email #h(0.8em) #text(fill: rule-stroke)[|] #h(0.8em) #phone #h(0.6em) / #h(0.6em) #phone-alt #h(0.8em) #text(fill: rule-stroke)[|] #h(0.8em) #website #h(0.8em) #text(fill: rule-stroke)[|] #h(0.8em) #location
]

#let header-text-block(align-side) = {
  set align(align-side)
  text(size: 26pt, weight: "bold", fill: heading-fill)[#name]
  v(0.2em)
  text(size: 11pt, fill: accent)[#tagline]
  v(0.15em)
  text(size: 9.5pt, fill: muted-fill)[#years-note]
  v(0.45em)
  contact-line
}

#block(width: 100%)[
  #if show-photo [
    #grid(
      columns: (0.95in, 1fr),
      column-gutter: 1em,
      align: (left + horizon, left + horizon),
      box(width: 0.95in, height: 0.95in)[#photo-content],
      header-text-block(left),
    )
  ] else [
    #align(center)[#header-text-block(center)]
  ]
  #v(0.3em)
  #line(length: 100%, stroke: 0.75pt + rule-stroke)
]

= Professional Summary

#block[#text(fill: body-fill)[#summary]]

= Experience

#for (i, job) in experience.enumerate() [
  #block(above: if i == 0 { 0em } else { job-gap }, breakable: false)[
    #grid(
      columns: (1fr, auto),
      gutter: 1em,
      align: (left + horizon, right + horizon),
      [#text(weight: "bold", fill: heading-fill)[#job.title] #h(0.4em) #text(fill: muted-fill)[#job.company]],
      [#text(size: 9.5pt, fill: muted-fill)[#job.dates]],
    )
    #for (j, bullet) in job.bullets.enumerate() [
      #block(above: if j == 0 { title-bullets-gap } else { bullet-gap }, inset: (left: 1em))[
        #grid(
          columns: (auto, 1fr),
          gutter: 0.45em,
          align: (left + top, left + top),
          text(fill: accent)[#sym.triangle.filled.small.r],
          bullet,
        )
      ]
    ]
  ]
]

= Education

#for (k, edu) in education.enumerate() [
  #block(above: if k == 0 { 0em } else { edu-gap })[
    #grid(
      columns: (1fr, auto),
      gutter: 1em,
      align: (left + horizon, right + horizon),
      [#text(weight: "bold", fill: heading-fill)[#edu.degree], #h(0.2em) #text(fill: body-fill)[#edu.institution]],
      [#text(size: 9.5pt, fill: muted-fill)[#edu.dates#if edu.note != none [ #h(0.35em) #text(fill: rule-stroke)[|] #h(0.35em) #edu.note]]],
    )
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
