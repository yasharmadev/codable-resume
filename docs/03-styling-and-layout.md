# Styling and layout

How the resume’s look is controlled: colors, spacing, section headings, and the main layout building blocks. All of this is done in Typst (no CSS).

## Design variables (top of `resume.typ`)

```typst
#let accent = rgb("#0d9488")
#let heading-fill = rgb("#0f172a")
#let body-fill = rgb("#334155")
#let muted-fill = rgb("#64748b")
#let rule-stroke = rgb("#e2e8f0")
#let section-gap = 0.55em
#let block-gap = 0.4em
```

- **accent** — teal used for tagline, bullet markers, links, section rule.
- **heading-fill** — dark color for name and section titles.
- **body-fill** — main text.
- **muted-fill** — secondary text (company, dates, notes).
- **rule-stroke** — thin lines (e.g. under header).
- **section-gap** — space above section headings.
- **block-gap** — space between experience blocks.

Change a color by editing the hex, e.g. `rgb("#0369a1")` for blue. Change spacing by editing the `em` values.

---

## Page and base text

```typst
#set page(
  paper: "us-letter",
  margin: (top: 0.55in, bottom: 0.55in, left: 0.6in, right: 0.6in),
  fill: white,
)
#set text(size: 10.5pt, fill: body-fill)
#set par(justify: false, leading: 0.7em)
```

- **paper:** e.g. `"a4"` or `"us-letter"`.
- **margin:** adjust `top`, `bottom`, `left`, `right` (in `in`, `cm`, or `pt`).
- **fill:** page background (e.g. `white` or a color).
- **text:** default font size and color for the document.
- **par:** `leading` = line spacing; `justify: true` would justify paragraphs.

---

## Section headings: `#show` rule

```typst
#show heading.where(level: 1): it => {
  set text(size: 10.5pt, weight: "bold", fill: heading-fill)
  block(above: section-gap, below: 0.25em)[
    #it.body
    #v(0.2em)
    #line(length: 100%, stroke: 2pt + accent)
  ]
  v(0.35em)
}
```

- **`#show heading.where(level: 1): it => { ... }`** — “for every level-1 heading (`= Title`), render it with this custom layout.”
- **`it.body`** — the heading text.
- **`#line(...)`** — the rule under the heading; `stroke: 2pt + accent` sets thickness and color.
- You can change the text size, weight, color, space above/below, and the line.

---

## Useful layout functions (used in the resume)

| Function | Typical use |
|----------|-------------|
| `#block(above: 0.5em)[...]` | Vertical space and grouping. |
| `#block(inset: (left: 1em), fill: rgb("#f8fafc"), radius: 4pt)[...]` | Padding, background, rounded corners (e.g. skills box). |
| `#v(0.5em)` | Vertical space. |
| `#h(1em)` | Horizontal space. |
| `#line(length: 100%, stroke: 0.75pt + rule-stroke)` | Horizontal rule. |
| `#grid(columns: (1fr, auto), gutter: 1em, align: (left, right), [...], [...])` | Two columns (e.g. title+company left, dates right). |
| `#align(center)[...]` | Center content (e.g. header). |
| `#text(size: 11pt, weight: "bold", fill: accent)[...]` | Styled text. |
| `#link(url)[#strong(name)]` | Link with bold label. |
| `#pad(left: 0.6em, right: 0.6em, top: 0.45em, bottom: 0.45em)[...]` | Padding around content. |

---

## Changing the skills box

The skills section uses a light box:

```typst
#block(inset: (left: 0.5em), fill: rgb("#f8fafc"), radius: 4pt)[
  #pad(left: 0.6em, right: 0.6em, top: 0.45em, bottom: 0.45em)[
    #skills-content
  ]
]
```

- **fill:** change `#f8fafc` to another hex for a different background.
- **radius:** larger value = more rounded corners.
- **inset** / **pad:** adjust for spacing inside the box.

---

## Where to look in the official docs

- [Page setup](https://typst.app/docs/guides/page-setup/)
- [Styling](https://typst.app/docs/reference/styling/) — `#set` and `#show`
- [Layout](https://typst.app/docs/reference/layout/) — `block`, `grid`, `align`, `pad`, `line`
- [Text](https://typst.app/docs/reference/text/) — `text`, `strong`
- [Visualize](https://typst.app/docs/reference/visualize/) — `rgb`, colors

Experiment in small steps: change one color or one spacing value, run `typst compile resume.typ resume.pdf`, and check the PDF.
