// Main VŠE thesis template function.

#import "locale.typ": get-locale
#import "title-page.typ": make-title-page
#import "front-matter.typ": make-ai-declaration, make-acknowledgements, make-abstracts
#import "styles.typ": apply-styles, make-header, make-footer

#let vse-thesis(
  // Required
  title: none,
  author: none,
  submission-date: none,
  supervisor: none,
  study-program: none,

  // Optional with defaults
  thesis-type: "BP",
  language: "cze",
  consultant: none,
  specialization: none,

  // Front matter content
  acknowledgements: none,
  ai-declaration: none,
  abstract-cz: none,
  abstract-en: none,
  keywords-cz: none,
  keywords-en: none,

  // Optional sections
  abbreviations: none,
  show-list-of-figures: false,
  show-list-of-tables: false,
  show-list-of-code: false,

  // Bibliography
  bibliography-file: none,

  // Body
  body,
) = {
  let locale = get-locale(language)
  let lang-code = if language == "eng" { "en" } else if language == "slo" { "sk" } else { "cs" }

  // Document metadata
  set document(title: title, author: author)

  // Page setup
  set page(
    paper: "a4",
    margin: (top: 25mm, bottom: 25mm, right: 25mm, left: 30mm),
  )

  // Typography
  set text(
    size: 11pt,
    font: "New Computer Modern",
    lang: lang-code,
    hyphenate: true,
  )

  set par(
    justify: true,
    first-line-indent: 0pt,
    spacing: 11pt,
    leading: 0.66em,
  )

  // Heading numbering
  set heading(numbering: "1.1")

  // Links in blue
  show link: set text(fill: blue)

  // Apply heading, caption, and list styles
  show: apply-styles

  // === Title page ===
  make-title-page(
    title: title,
    author: author,
    submission-date: submission-date,
    supervisor: supervisor,
    consultant: consultant,
    study-program: study-program,
    specialization: specialization,
    thesis-type: thesis-type,
    language: language,
    locale: locale,
  )

  // === Front matter (plain footer, no header) ===
  set page(
    header: none,
    footer: make-footer(),
    numbering: "1",
  )

  make-ai-declaration(locale: locale, content: ai-declaration)
  make-acknowledgements(locale: locale, content: acknowledgements)
  make-abstracts(
    locale: locale,
    abstract-cz: abstract-cz,
    keywords-cz: keywords-cz,
    abstract-en: abstract-en,
    keywords-en: keywords-en,
  )

  // === Table of Contents ===
  pagebreak()
  outline(depth: 2)

  // === Optional lists ===
  if show-list-of-figures {
    pagebreak()
    outline(
      title: locale.at("list-of-figures"),
      target: figure.where(kind: image),
    )
  }

  if show-list-of-tables {
    pagebreak()
    outline(
      title: locale.at("list-of-tables"),
      target: figure.where(kind: table),
    )
  }

  if show-list-of-code {
    pagebreak()
    outline(
      title: locale.at("code-list"),
      target: figure.where(kind: "code"),
    )
  }

  // === Abbreviations ===
  if abbreviations != none {
    pagebreak()
    heading(level: 1, numbering: none, outlined: true)[#locale.at("abbreviations")]
    abbreviations
  }

  // === Body ===
  // Enable body headers/footers (continuous page numbering)
  set page(
    header: make-header(),
    footer: make-footer(),
    numbering: "1",
  )

  body

  // === Bibliography ===
  if bibliography-file != none {
    pagebreak()
    // Prepend "/src/" to resolve path from project root, not from this template file.
    let bib-path = if bibliography-file.starts-with("/") {
      bibliography-file
    } else {
      "/src/" + bibliography-file
    }
    bibliography(bib-path, style: "apa", title: locale.at("bibliography"))
  }
}
