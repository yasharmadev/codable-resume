# Editing this resume

Where to change what in `resume.typ`, and how to add/remove entries without breaking the syntax.

## File structure (top to bottom)

1. **Design system** — colors, spacing (optional to change).
2. **Page & typography** — margins, font size (optional).
3. **Section heading style** — `#show heading.where(...)` (optional).
4. **Your data** — name, contact, experience, education, skills, projects.
5. **Resume body** — layout that uses the data; edit only if you want structural changes.

Focus on the **“Your data”** section when updating your info.

---

## Header (name, tagline, contact)

```typst
#let name = "Alex Chen"
#let tagline = "Principal Engineer · 10+ Years Building Systems at Scale"
#let years-note = "Industry leader in distributed systems and platform engineering"
#let email = "alex.chen@email.com"
#let phone = "+1 (555) 123 4567"
#let website = "linkedin.com/in/alexchen"
#let location = "San Francisco Bay Area"
#let github = "github.com/alexchen"
```

- Edit the **strings** inside the quotes.
- To add a new contact field: add a line like `#let myfield = "value"` and then in the **Resume body** section, add `#myfield` (and a separator like `|` or `#h(0.8em)`) in the contact line where the header is built.

---

## Experience

Each job is a **dictionary** with: `title`, `company`, `dates`, `bullets`. `bullets` is an **array of strings**.

```typst
#let experience = (
  (
    title: "Principal Software Engineer",
    company: "Tech Corp",
    dates: "2021 – Present",
    bullets: (
      "First bullet.",
      "Second bullet.",
      "Third bullet.",
    ),
  ),
  (
    title: "Next role",
    ...
  ),
)
```

- **Add a job:** Copy a full `( title: "...", company: "...", dates: "...", bullets: ( "…", "…", ), ),` block and paste it before the closing `)` of `experience`. Keep a comma between blocks.
- **Remove a job:** Delete the whole `( ... ),` for that job. Ensure the last job has no trailing comma before `)`.
- **Add/remove bullets:** Edit the `bullets: ( "…", "…", )` list; comma between items, no comma after the last one.

---

## Education

Same idea: array of dictionaries with `degree`, `institution`, `dates`, and optional `note`.

```typst
#let education = (
  (degree: "M.S. Computer Science", institution: "Stanford University", dates: "2011 – 2013", note: "Thesis: Distributed Systems"),
  (degree: "B.S. ...", institution: "...", dates: "...", note: none),
)
```

- Use `note: none` if there’s no note.
- Add/remove entries by adding/removing lines; keep commas between entries.

---

## Skills

```typst
#let skills-heading = "Technical Leadership & Stack"
#let skills-languages = ("Rust", "Go", "TypeScript", "Python", "SQL")
#let skills-systems = ("Distributed Systems", "Event-Driven Architecture", ...)
#let skills-tools = ("AWS", "Kubernetes", ...)
```

- Change the **heading** string.
- Edit the **arrays**: add/remove items in the parentheses, comma-separated, e.g. `("A", "B", "C")`.
- In the resume, `skills-content` uses these; if you add a new category (e.g. `skills-frameworks`), add a corresponding line in `skills-content` that references it (see the existing pattern with `skills-languages`, `skills-systems`, `skills-tools`).

---

## Projects / talks (optional)

```typst
#let projects = (
  (name: "Talk or project name", link: "https://...", description: "Short description."),
  ...
)
```

- **Remove the section:** Set `#let projects = ()` (empty array).
- **Add an entry:** Add another `(name: "...", link: "...", description: "..."),`; commas between entries.

---

## Common mistakes

- **Missing comma** between array elements or dictionary entries → syntax error. Check between `),` and the next `(`.
- **Trailing comma** after the last element can be invalid in some places; if you get an error, remove the comma before `)`.
- **Unclosed quotes** → ensure every `"` has a matching `"`.
- **Wrong parentheses** → each `(` needs a `)`; count them if things break.

After editing, run:

```bash
typst compile resume.typ resume.pdf
```

If the compiler reports a line number, go to that line and check commas, quotes, and parentheses.

Next: [03 – Styling and layout](03-styling-and-layout.md) to change colors, spacing, and section style.
