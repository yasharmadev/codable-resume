// =============================================================================
// Profile: engineering-manager — Engineering Manager / Technical Lead
// Tailored for people-management and technical leadership roles.
// =============================================================================

#import "../shared.typ": *

#let tagline = "Engineering Manager · Technical Lead (10+ yrs)"
#let years-note = "Building high-performing teams, delivering at scale across FinTech, E-commerce & Healthcare"

#let summary = "Engineering leader with over a decade of experience building and mentoring high-performing engineering teams while delivering mission-critical enterprise systems. Proven ability to drive cross-functional initiatives, manage complex migrations with zero downtime, and align technical strategy with business outcomes. Combines hands-on technical depth with strong people management, agile delivery, and stakeholder communication skills."

#let experience = (
  (
    title: "Senior Technical Lead",
    company: "Infovision Labs India Private Limited (Project: Wayfair)",
    dates: "Mar 2026 – Present",
    bullets: (
      "Led delivery of 22+ initiatives across the Material Catalog and Catalog Foundations domains, coordinating engineers across feature development, legacy modernization, and platform hardening.",
      "Drove legacy modernization strategy by migrating product-data GraphQL integrations off legacy systems (CDF2), reducing coupling and technical debt while mentoring engineers through the transition.",
      "Built reusable automation tooling to accelerate migration, impact analysis, and dependency mapping—improving team velocity across the catalog domain.",
      "Established traffic monitoring and test instrumentation practices before retiring unused database code, setting standards for safe, incremental platform changes.",
    ),
  ),
  (
    title: "Senior Software Engineer L3",
    company: "Canterr (Project: Wayfair)",
    dates: "Aug 2023 – Feb 2026",
    bullets: (
      "Led the Product Migration Team through a large-scale database migration for the Supplier Domain ($12.5B+ annual revenue, 40M+ annual orders), ensuring zero unplanned system downtime.",
      "Managed complex code migrations using Feature Toggle strategies, reducing deployment risks and enabling safe, incremental rollouts across multiple engineering teams.",
      "Redesigned and decoupled legacy REST APIs, improving system modularity and accelerating team development cycles by 50%.",
      "Championed end-to-end delivery of back-end features—from architecture design to production—achieving a 100% on-time release record while coaching engineers on best practices.",
    ),
  ),
  (
    title: "Software Engineer II",
    company: "ClearTax",
    dates: "Dec 2021 – June 2023",
    bullets: (
      "Led back-end development for a high-traffic Vendor Management microservice on a platform processing over 5 billion global B2B transactions annually.",
      "Owned delivery of the Accounts Payable module end-to-end, empowering enterprise clients and reducing manual processing time by 30%.",
      "Managed the full service lifecycle from inception to production, ensuring high availability across mission-critical FinTech SaaS applications.",
    ),
  ),
  (
    title: "Associate Consultant",
    company: "GlobalLogic India (Project: Adobe Commerce / Magento)",
    dates: "Mar 2021 – Dec 2021",
    bullets: (
      "Helped establish the foundational security team for Adobe Commerce, coordinating with cross-functional stakeholders to identify and resolve critical platform vulnerabilities.",
      "Led patching of high-priority security bugs, significantly reducing exploit vectors and improving system reliability for enterprise clients.",
    ),
  ),
  (
    title: "Software Development Engineer II",
    company: "Medlife (Now PharmEasy)",
    dates: "Jan 2019 – Mar 2021",
    bullets: (
      "Managed a small team of software developers, establishing Agile development methodologies that accelerated sprint delivery and elevated code quality.",
      "Architected back-end features and Microservice APIs supporting 17 million+ monthly active users across health-diagnostic e-commerce.",
      "Automated dynamic data reporting and integrated third-party LIS systems, eliminating manual data entry overhead entirely.",
    ),
  ),
  (
    title: "Software Developer / Front-End Team Lead",
    company: "Ailoitte Technologies / Arnit Retail / Nexia Digital",
    dates: "July 2016 – Jan 2019",
    bullets: (
      "Led front-end engineering initiatives at Arnit Retail, overseeing code quality and UI/UX improvements based on A/B testing (Google Optimize) results.",
      "Managed client relationships at Nexia Digital, documenting requirements and delivering custom technical solutions.",
      "Developed full-stack features for e-commerce and logistics applications, mentoring junior developers on best practices.",
    ),
  ),
)

#let skills-heading = "Core Technical Proficiencies"
#let skills-languages = ("Java", "Python", "Node.js", "JavaScript", "PHP")
#let skills-databases = ("MySQL", "PostgreSQL", "MongoDB", "Redis")
#let skills-frameworks = ("Spring Boot", "Microservices", "RESTful APIs", "React.js", "Angular.js")
#let skills-cloud = ("AWS (EC2, Lambda, S3, SQS)", "Docker", "Apache Kafka", "CI/CD Pipelines")
#let skills-methods = ("Engineering Management", "Agile/Scrum", "Team Mentoring", "Stakeholder Management", "Technical Strategy")
#let skills-testing = ("JUnit", "Mockito", "Jenkins", "Buildkite", "GitHub Actions", "Feature Toggles")

#let projects = ()

#let engineering-manager = (
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
