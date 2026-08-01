# Editing this resume

Where to change what, and how to work with multiple job-target profiles.

## File structure

| File | Purpose |
|------|---------|
| **`content/shared.typ`** | Shared identity — name, contact, education, photo settings, AI tools. Edit once; applies to all profiles. |
| **`content/profiles/tech-lead.typ`** | Generic Tech Lead profile (default). Tagline, summary, experience, skills. |
| **`content/profiles/java.typ`** | Senior Java Software Engineer / Tech Lead profile. |
| **`content/profiles/engineering-manager.typ`** | Engineering Manager profile. |
| **`content/data.typ`** | Profile selector — picks which profile to compile. Usually no edits needed. |
| **`assets/`** | Static files such as `profile_pic.jpg` (used by photo builds). |
| **`templates/modern.typ`** | Modern Professional layout (compact sans-serif, navy accent, ATS-friendly). Default. |
| **`templates/original.typ`** | Original Teal Classic layout (section bars, teal accent). |
| **`resume.typ`** | Default entry point (includes the Modern template). |

**Edit the profile file** that matches the job you're applying for. Shared fields (name, contact, education) live in `content/shared.typ`. Layout and styling live in the template files.

---

## Multi-profile workflow

Three profiles ship out of the box:

| Profile ID | File | Best for |
|------------|------|----------|
| `tech-lead` | `content/profiles/tech-lead.typ` | Generic Tech Lead / Senior SWE (default) |
| `java` | `content/profiles/java.typ` | Java / Spring Boot backend roles |
| `engineering-manager` | `content/profiles/engineering-manager.typ` | Engineering Manager / people-lead roles |

### Build a specific profile

```bash
# Modern template, plain
typst compile --root . --input profile=java templates/modern.typ resume-java-modern.pdf

# With photo
typst compile --root . --input profile=java --input photo=true templates/modern.typ resume-java-modern-photo.pdf

# Convenience scripts
npm run build:java
npm run build:engineering-manager
npm run build:tech-lead
```

Build everything (all profiles × templates × photo variants):

```bash
npm run build
```

### Watch mode per profile

```bash
npm run watch:java
npm run watch:engineering-manager
```

### Add a new profile

1. Create `content/profiles/<id>.typ` — import `../shared.typ`, define tagline/summary/experience/skills, export a dictionary (copy an existing profile as a template).
2. Add `#import "profiles/<id>.typ": <id>` and a registry entry in `content/data.typ`.
3. Add the profile ID to `PROFILES` in `scripts/build.sh` (optional, for full builds).

### Remove a profile

1. Delete `content/profiles/<id>.typ`.
2. Remove its import and registry entry from `content/data.typ`.
3. Remove from `PROFILES` in `scripts/build.sh` if listed.

Other profiles and templates keep working — profiles never import each other.

---

## Header (name, tagline, contact)

**Shared** (all profiles) — edit `content/shared.typ`:

```typst
#let name = "Alex Chen"
#let email = "alex.chen@email.com"
#let phone = "+1 (555) 123 4567"
...
```

**Per profile** — edit the profile file, e.g. `content/profiles/tech-lead.typ`:

```typst
#let tagline = "Principal Engineer · 10+ Years Building Systems at Scale"
#let years-note = "Industry leader in distributed systems and platform engineering"
```

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

Each profile has its own `experience` array — tailor bullets per job target.

---

## Education

Edit `content/shared.typ` (shared across all profiles):

```typst
#let education = (
  (degree: "M.S. Computer Science", institution: "Stanford University", dates: "2011 – 2013", note: "Thesis: Distributed Systems"),
  (degree: "B.S. ...", institution: "...", dates: "...", note: none),
)
```

- Use `note: none` if there's no note.
- Add/remove entries by adding/removing lines; keep commas between entries.

---

## Skills

Per profile file:

```typst
#let skills-heading = "Core Technical Proficiencies"
#let skills-languages = ("Java", "Python", "SQL")
#let skills-databases = ("PostgreSQL", "Redis")
#let skills-frameworks = ("Spring Boot", "Express.js")
#let skills-cloud = ("AWS", "Docker", "Kafka")
#let skills-methods = ("Microservices", "Agile/Scrum")
#let skills-testing = ("JUnit", "Jenkins", "GitHub Actions")
```

**AI Tools** (shared in `content/shared.typ`, rendered in all profiles):

```typst
#let skills-ai = ("Cursor", "GitHub Copilot", "Devin")
```

- Change the **heading** string per profile if needed.
- Edit the **arrays**: add/remove items in the parentheses, comma-separated.
- To add a new category, add a `#let skills-...` array in the profile and a matching line in both `templates/modern.typ` and `templates/original.typ`.

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
- **Wrong profile** → pass `--input profile=<id>` or use the matching npm script.

After editing, build:

```bash
npm run build
```

Or a single profile:

```bash
npm run build:java
```

Next: [03 – Styling and layout](03-styling-and-layout.md) to change colors, spacing, and section style.
