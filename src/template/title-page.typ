// Title page layout for VŠE thesis.

#import "styles.typ": sans-font

#let make-title-page(
  title: none,
  author: none,
  submission-date: none,
  supervisor: none,
  consultant: none,
  study-program: none,
  specialization: none,
  thesis-type: "BP",
  language: "cze",
  locale: (:),
) = {
  let thesis-type-text = if thesis-type == "DP" {
    locale.at("thesis-type-dp")
  } else {
    locale.at("thesis-type-bp")
  }

  let logo-path = if language == "eng" {
    "/src/img/FIS_2_logo_2_rgb_EN.pdf"
  } else {
    "/src/img/FIS_2_logo_2_rgb_CZ.pdf"
  }

  page(numbering: none, header: none, footer: none, margin: (top: 25mm, bottom: 25mm, left: 30mm, right: 25mm))[
    #set text(font: sans-font)
    #align(center)[
      #text(size: 24pt)[
        #locale.at("university") \
        #locale.at("faculty")
      ]

      #v(1fr)

      #image(logo-path, width: 50%)

      #v(2fr)

      #text(size: 20pt, weight: "bold")[#title]

      #v(8mm)

      #text(size: 14pt)[#thesis-type-text]

      #v(8mm)

      #text(size: 12pt)[
        #grid(
          columns: (auto, auto),
          column-gutter: 0.8em,
          align: (right, left),
          [#locale.at("study-program"):], [#study-program],
          ..if specialization != none {
            (
              v(2mm), v(2mm),
              [#locale.at("specialization"):], [#specialization],
            )
          },
        )
      ]

      #v(8fr)

      #text(size: 12pt)[
        #grid(
          columns: (auto, auto),
          column-gutter: 0.8em,
          align: (right, left),
          [#locale.at("author"):], [#author],
          v(2mm), v(2mm),
          [#locale.at("supervisor"):], [#supervisor],
          ..if consultant != none {
            (
              v(2mm), v(2mm),
              [#locale.at("consultant"):], [#consultant],
            )
          },
        )
      ]

      #v(8mm)

      #text(size: 12pt)[#locale.at("city"), #submission-date]
    ]
  ]
}
