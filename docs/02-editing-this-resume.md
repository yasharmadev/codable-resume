# Editing this resume

Where to change what in `content/data.typ`, and how to add/remove entries without breaking the syntax.

## File structure

| File | Purpose |
|------|---------|
| **`content/data.typ`** | All resume content — name, contact, experience, education, skills, projects. **Edit this file** when updating your info. |
| **`assets/`** | Static files such as `profile_pic.jpg` (used by photo builds). |
| **`templates/modern.typ`** | Modern Professional layout (compact sans-serif, navy accent, ATS-friendly). Default. |
| **`templates/original.typ`** | Original Teal Classic layout (section bars, teal accent). |
| **`resume.typ`** | Default entry point (currently includes the Modern template). |

Focus on **`content/data.typ`** when updating your info — both variants read from it. Layout and styling live in the template files.

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
- In the resume templates, skills are rendered from the category arrays automatically. To add a new category, add a `#let skills-...` array in `content/data.typ` and a matching line in both `templates/modern.typ` and `templates/original.typ`.

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

After editing, build both templates for comparison:

```bash
npm run build
```

Or build a single variant:

```bash
npm run build:modern
npm run build:original
```

Outputs: `resume-modern.pdf`, `resume-original.pdf` (and photo variants).

Next: [03 – Styling and layout](03-styling-and-layout.md) to change colors, spacing, and section style.
