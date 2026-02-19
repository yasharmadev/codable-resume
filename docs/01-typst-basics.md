# Typst basics

A minimal overview of Typst syntax so you can read and edit `resume.typ` without getting lost.

## Two modes: markup and code

Typst has two main modes:

1. **Markup** (default) — plain text with simple formatting: `*bold*`, `_italic_`, `= Heading`, `- bullet`.
2. **Code** — start with `#` to write expressions: variables, function calls, loops.

Once you're in code (after a `#`), you stay in code until you open a content block `[ ... ]` or hit a new line in some contexts.

```typst
This is markup. *This is bold* and _this is italic_.

#let x = 42
#let greeting = [Hello, world!]
#greeting  // inserts the content "Hello, world!"
```

## Common markup

| You write | Result |
|-----------|--------|
| `*text*` | **Bold** |
| `_text_` | *Italic* |
| `= Section` | Level-1 heading |
| `== Subsection` | Level-2 heading |
| `- item` | Bullet list item |
| `#link(url)[click here]` | Hyperlink (code) |
| `\` | Line break |
| `#v(0.5em)` | Vertical space (code) |
| `#h(1em)` | Horizontal space (code) |

## Variables and content blocks

- **Define a variable:** `#let name = "Alex"`
- **Use it in markup:** `#name` inserts the value.
- **Content block:** `[ ... ]` wraps markup (and inline code) that produces “content” (text/layout). Use when a function expects content, e.g. `#text(14pt)[Hello]`.

```typst
#let title = "Principal Engineer"
#title
#text(weight: "bold")[#title]
```

## Strings and quotes

- Strings use **double quotes:** `"like this"`.
- Use `\` to escape: `"Say \"Hi\""`.
- Newlines: use `\n` in a string or break the string across lines with `""` (multi-line string).

## Comments

- Line comment: `// comment`
- Block comment: `/* comment */` or `/* multi-line comment */`

## Arrays and dictionaries

- **Array (tuple):** `(1, 2, "three")` — comma-separated, parentheses.
- **Dictionary:** `(key: "value", count: 42)` — key-value pairs.
- **Access:** `arr.at(0)`, `dict.key` or `dict.at("key")`.
- **Methods:** e.g. `array.join(", ")`, `array.len()`.

```typst
#let langs = ("Rust", "Go", "Python")
#langs.join(", ")
```

## Conditionals and loops (code)

- **If:** `#if condition { ... } else { ... }`
- **For:** `#for x in collection { ... }`
- **Equality:** `#if x == 10 { ... }`; check for “no value”: `#if x != none { ... }`

## What you’ll see in the resume

- `#let name = "..."` — variables at the top.
- `#let experience = ( (title: "...", company: "...", ...), ... )` — array of dictionaries.
- `#for job in experience [ ... ]` — loop over jobs.
- `#job.title`, `#job.dates` — field access.
- `= Experience` — heading.
- `#text(...)`, `#block(...)`, `#line(...)` — layout functions; details in [03 – Styling and layout](03-styling-and-layout.md).

Next: [02 – Editing this resume](02-editing-this-resume.md) to change content without breaking the file.
