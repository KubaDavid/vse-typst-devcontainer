// Show/set rules for headings, captions, headers/footers.

// Sans-serif font for headings and title page.
// Liberation Sans is the primary choice; install font-liberation in Alpine.
// Falls back to available sans-serif fonts.
#let sans-font = ("Liberation Sans", "DejaVu Sans", "New Computer Modern")

// Apply all thesis styling rules.
#let apply-styles(body) = {
  // Headings: sans-serif
  show heading: set text(font: sans-font)

  // Level 1 headings: large, bold, with pagebreak
  show heading.where(level: 1): it => {
    pagebreak(weak: true)
    text(size: 24pt, weight: "bold", font: sans-font)[
      #if it.numbering != none {
        counter(heading).display(it.numbering)
        [. ]
      }
      #it.body
    ]
    v(20pt)
  }

  // APA7 figure captions: bold label, italic body
  show figure.caption: it => {
    set align(left)
    text(weight: "bold")[#it.supplement #context it.counter.display(it.numbering)]
    linebreak()
    text(style: "italic")[#it.body]
  }

  // Table captions on top
  show figure.where(kind: table): set figure.caption(position: top)

  // Extra spacing around figures and tables
  show figure: set block(above: 2em, below: 1.5em)

  // Compact lists
  set list(indent: 1em, spacing: 0.65em)
  set enum(indent: 1em, spacing: 0.65em)

  body
}

// Build the page header for body pages (one-sided).
#let make-header() = context {
  let here-page = here().position().page
  let chapters = query(heading.where(level: 1))
  let on-chapter-page = chapters.any(h => {
    h.location().position().page == here-page
  })

  if not on-chapter-page {
    let prev-chapters = query(heading.where(level: 1).before(here()))
    if prev-chapters.len() > 0 {
      let current = prev-chapters.last()
      set text(font: sans-font, size: 10pt)
      align(right)[
        #if current.numbering != none {
          counter(heading).at(current.location()).display(current.numbering)
          [. ]
        }
        #current.body
      ]
      v(-4pt)
      line(length: 100%, stroke: 0.5pt)
    }
  }
}

// Build the page footer with rule and page number.
#let make-footer() = context {
  line(length: 100%, stroke: 0.5pt)
  v(-4pt)
  align(right)[
    #counter(page).display()
  ]
}

// Code listing as a figure.
#let code-figure(
  source,
  caption: none,
  language: none,
  supplement: none,
) = figure(
  kind: "code",
  supplement: supplement,
  caption: caption,
  raw(source, lang: language, block: true),
)
