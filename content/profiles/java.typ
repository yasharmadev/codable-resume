// =============================================================================
// Profile: java — Senior Java Software Engineer / Tech Lead
// Tailored for Java-centric backend and platform engineering roles.
// =============================================================================

#import "../shared.typ": *

#let tagline = "Senior Java Software Engineer · Technical Lead (10+ yrs)"
#let years-note = "Java & Spring Boot backends, microservices, and high-availability enterprise systems"

#let summary = "Senior Java Software Engineer with over a decade of experience building and scaling high-availability backend systems across FinTech, E-commerce, and Healthcare. Deep expertise in Java and Spring Boot microservices, RESTful API design, database migrations, and resilient distributed architectures. Proven track record delivering mission-critical platform features with zero-downtime migrations and robust CI/CD practices."

#let experience = (
  (
    title: "Senior Technical Lead",
    company: "Infovision Labs India Private Limited (Project: Wayfair)",
    dates: "Mar 2026 – Present",
    bullets: (
      "Led delivery of 22+ initiatives across the Material Catalog and Catalog Foundations domains, driving feature development, legacy modernization, and platform hardening for enterprise-scale catalog systems.",
      "Spearheaded legacy modernization by migrating product-data GraphQL integrations off legacy systems (CDF2), reducing coupling and technical debt across Java-based catalog services.",
      "Built reusable automation tooling to accelerate migration, impact analysis, and dependency mapping across the catalog domain.",
      "Added traffic monitoring and test instrumentation before retiring unused database code, and contributed shared utilities and metrics analysis to support broader catalog decoupling.",
    ),
  ),
  (
    title: "Senior Software Engineer L3",
    company: "Canterr (Project: Wayfair)",
    dates: "Aug 2023 – Feb 2026",
    bullets: (
      "Spearheaded the Product Migration Team to execute a large-scale database migration for the Supplier Domain on a Java platform generating $12.5B+ in annual revenue and processing 40M+ annual orders, ensuring zero unplanned system downtime.",
      "Orchestrated complex Java code migrations using Feature Toggle strategies, reducing deployment risks and enabling incremental rollouts of critical backend features to production.",
      "Redesigned and decoupled legacy REST APIs in Java, significantly improving system modularity and accelerating subsequent development cycles by 50%.",
      "Championed end-to-end delivery of comprehensive back-end features—from architecture design to production deployment—achieving a 100% on-time release record for assigned technical sprints.",
    ),
  ),
  (
    title: "Software Engineer II",
    company: "ClearTax",
    dates: "Dec 2021 – June 2023",
    bullets: (
      "Engineered scalable REST APIs within a Spring Boot microservices architecture, driving core back-end development for a high-traffic Vendor Management microservice processing over 5 billion global B2B transactions annually.",
      "Developed and integrated the Accounts Payable module using Java and Spring Boot, empowering enterprise clients to track, manage, and process payable bills and invoices, reducing manual processing time by 30%.",
      "Owned the full service lifecycle from scratch to production-ready deployment with JUnit and Mockito test coverage, ensuring high availability across mission-critical FinTech SaaS applications.",
    ),
  ),
  (
    title: "Associate Consultant",
    company: "GlobalLogic India (Project: Adobe Commerce / Magento)",
    dates: "Mar 2021 – Dec 2021",
    bullets: (
      "Collaborated with cross-functional stakeholders to establish the foundational security team for Adobe Commerce, rapidly identifying and resolving critical platform vulnerabilities.",
      "Fortified the e-commerce platform by patching high-priority security bugs, improving system reliability for enterprise-level clients.",
    ),
  ),
  (
    title: "Software Development Engineer II",
    company: "Medlife (Now PharmEasy)",
    dates: "Jan 2019 – Mar 2021",
    bullets: (
      "Architected and implemented Microservice APIs using Java Spring Boot, handling complex health-diagnostic e-commerce transactions and data flows supporting 17 million+ monthly active users.",
      "Automated dynamic data reporting systems and integrated third-party LIS (Laboratory Information Systems), accelerating report generation and eliminating manual data entry overhead.",
      "Mentored junior developers on Java best practices and Agile delivery, accelerating sprint timelines and elevating code quality.",
    ),
  ),
  (
    title: "Software Developer",
    company: "Ailoitte Technologies / Arnit Retail / Nexia Digital",
    dates: "July 2016 – Jan 2019",
    bullets: (
      "Developed back-end RESTful APIs for scalable e-commerce and logistics applications using Java, PHP, and Node.js.",
      "Led front-end engineering initiatives at Arnit Retail, overseeing code quality and UI/UX improvements based on A/B testing results.",
      "Collaborated with clients at Nexia Digital to document, troubleshoot, and deliver custom technical solutions.",
    ),
  ),
)

#let skills-heading = "Core Technical Proficiencies"
#let skills-languages = ("Java (8/11/17)", "Python 3.x", "SQL", "JavaScript", "Node.js", "PHP")
#let skills-databases = ("MySQL", "PostgreSQL", "MongoDB", "Redis")
#let skills-frameworks = ("Spring Boot 2.7.x", "Spring MVC", "Hibernate", "JUnit", "Mockito", "Express.js")
#let skills-cloud = ("AWS (EC2, Lambda, API Gateway, S3, SQS, Route 53)", "Docker", "Apache Kafka", "Git")
#let skills-methods = ("Microservices Architecture", "RESTful API Design", "Feature Toggles", "Agile/Scrum")
#let skills-testing = ("JUnit", "Mockito", "PHPUnit", "Jenkins", "Buildkite", "GitHub Actions")

#let projects = ()

#let java = (
  name: name,
  tagline: tagline,
  years-note: years-note,
  email: email,
  phone: phone,
  phone-alt: phone-alt,
  website: website,
  location: location,
  summary: summary,
  show-photo: show-photo,
  photo-file: photo-file,
  experience: experience,
  education: education,
  skills-heading: skills-heading,
  skills-languages: skills-languages,
  skills-databases: skills-databases,
  skills-frameworks: skills-frameworks,
  skills-cloud: skills-cloud,
  skills-methods: skills-methods,
  skills-testing: skills-testing,
  skills-ai: skills-ai,
  projects: projects,
)
