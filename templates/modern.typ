// =============================================================================
// Modern Professional — tech-lead, ATS-friendly resume template
// Compile: typst compile --root . templates/modern.typ resume-modern.pdf
// =============================================================================

#import "/content/data.typ": *

// --- Design tokens ---
#let navy = rgb("#1f3a5f")       // accent: name rule, section headings, bullets
#let ink = rgb("#1a1a1a")        // titles
#let body-fill = rgb("#333333")  // body copy
#let muted = rgb("#5f6b7a")      // company, dates, notes
#let rule-col = rgb("#d0d5dd")   // thin section rules
#let skills-bg = rgb("#f8fafc")  // skills box background (matches original)

// --- Page & typography ---
#set page(
  paper: "us-letter",
  margin: (x: 0.55in, top: 0.5in, bottom: 0.5in),
  fill: white,
)
#set text(font: "Helvetica", size: 10pt, fill: body-fill)
#set par(justify: false, leading: 0.55em)

// --- Spacing scale (+20% on section separator padding vs prior) ---
#let section-gap = 0.94em        // gap before a section heading
#let heading-rule-before = 0.2em // title to underline
#let section-after = 0.5em       // underline to first content line
#let section-end-before = 0.5em  // content to closing underline
#let section-end-after = 0.98em  // closing underline to next section
#let role-gap = 0.95em           // gap between experience roles
#let bullet-gap = 0.5em          // gap between bullets within a role
#let title-bullet-gap = 0.55em   // role heading to first bullet
#let edu-entry-gap = 0.58em      // gap between education entries
#let skills-row-gap = 0.3em      // gap between rows inside skills box

// --- Section headings: navy uppercase + thin rule ---
#show heading.where(level: 1): it => {
  v(section-gap, weak: true)
  set text(size: 10.5pt, weight: "bold", fill: navy, tracking: 0.05em)
  upper(it.body)
  v(heading-rule-before)
  line(length: 100%, stroke: 0.8pt + rule-col)
  v(section-after, weak: true)
}

// Closing rule — marks the end of a section clearly
#let section-end = {
  v(section-end-before)
  line(length: 100%, stroke: 0.8pt + rule-col)
  v(section-end-after)
}

// --- Helpers ---
#let photo-path = "/" + photo-file
#let photo-box = box(width: 100%, height: 100%, radius: 50%, clip: true)[
  #image(photo-path, width: 100%, height: 100%, fit: "cover")
]

#let sep = text(fill: muted)[  ·  ]
#let contact-sep = [#h(0.3em)#text(fill: muted)[|]#h(0.3em)]

#let contact = {
  set text(size: 9pt, fill: muted)
  [#email#contact-sep#phone, #phone-alt#contact-sep#link("https://" + website)[#website]#contact-sep#location]
}

#let name-block = {
  text(size: 22pt, weight: "bold", fill: ink)[#name]
  v(-0.15em)
  text(size: 10.5pt, weight: "bold", fill: navy)[#tagline]
  v(-0.08em)
  text(size: 9pt, fill: muted)[#years-note]
  v(0.12em)
  contact
}

// Skills block — boxed layout like original, modern palette
#let skills-content = [
  #text(weight: "bold", fill: navy)[Languages] #text(fill: body-fill)[ #skills-languages.join(" · ")]
  #v(skills-row-gap)
  #text(weight: "bold", fill: navy)[Databases] #text(fill: body-fill)[ #skills-databases.join(" · ")]
  #v(skills-row-gap)
  #text(weight: "bold", fill: navy)[Frameworks & Libraries] #text(fill: body-fill)[ #skills-frameworks.join(" · ")]
  #v(skills-row-gap)
  #text(weight: "bold", fill: navy)[Cloud & DevOps] #text(fill: body-fill)[ #skills-cloud.join(" · ")]
  #v(skills-row-gap)
  #text(weight: "bold", fill: navy)[Methodologies & Tools] #text(fill: body-fill)[ #skills-methods.join(" · ")]
  #v(skills-row-gap)
  #text(weight: "bold", fill: navy)[Testing & CI/CD] #text(fill: body-fill)[ #skills-testing.join(" · ")]
]

// --- Header ---
#if show-photo {
  grid(
    columns: (0.94in, 1fr),
    column-gutter: 0.85em,
    align: (left + horizon, left + horizon),
    box(width: 0.94in, height: 0.94in)[#photo-box],
    name-block,
  )
} else {
  name-block
}
#v(0.2em)
#line(length: 100%, stroke: 1pt + navy)

= Professional Summary
#summary
#section-end

= Experience
#for (i, job) in experience.enumerate() {
  block(above: if i == 0 { 0.35em } else { role-gap }, breakable: false)[
    #grid(
      columns: (1fr, auto),
      gutter: 1em,
      align: (left + top, right + top),
      [#text(weight: "bold", size: 10.5pt, fill: ink)[#job.title]#text(fill: muted)[  —  #job.company]],
      text(size: 9pt, fill: muted)[#job.dates],
    )
    #for (bi, b) in job.bullets.enumerate() {
      block(above: if bi == 0 { title-bullet-gap } else { bullet-gap }, inset: (left: 0.9em))[
        #grid(
          columns: (0.95em, 1fr),
          align: (left + top, left + top),
          text(fill: navy)[•], b,
        )
      ]
    }
  ]
}
#section-end

= Education
#for (k, edu) in education.enumerate() {
  block(above: if k == 0 { 0.35em } else { edu-entry-gap })[
    #grid(
      columns: (1fr, auto),
      gutter: 1em,
      align: (left + top, right + top),
      [#text(weight: "bold", fill: ink)[#edu.degree]#text(fill: body-fill)[, #edu.institution]],
      text(size: 9pt, fill: muted)[#edu.dates#if edu.note != none [#sep#edu.note]],
    )
  ]
}
#section-end

= #skills-heading
#block(inset: (left: 0.5em), fill: skills-bg, radius: 4pt)[
  #pad(left: 0.6em, right: 0.6em, top: 0.5em, bottom: 0.5em)[
    #skills-content
  ]
]
#section-end

#if projects.len() > 0 {
  [= Selected Talks & Projects]
  for p in projects {
    block(above: 0.35em)[
      #link(p.link)[#text(weight: "bold", fill: navy)[#p.name]] — #text(fill: body-fill)[#p.description]
    ]
  }
  section-end
}
