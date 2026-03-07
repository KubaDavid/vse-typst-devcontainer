// Front matter pages: AI declaration, acknowledgements, abstracts.

#let make-ai-declaration(locale: (:), content: none) = {
  if content == none { return }
  pagebreak()
  v(1fr)
  heading(level: 2, numbering: none, outlined: false)[#locale.at("ai-declaration")]
  content
  v(1cm)
}

#let make-acknowledgements(locale: (:), content: none) = {
  if content == none { return }
  pagebreak()
  v(1fr)
  heading(level: 2, numbering: none, outlined: false)[#locale.at("acknowledgements")]
  content
  v(1cm)
}

#let make-abstracts(
  locale: (:),
  abstract-cz: none,
  keywords-cz: none,
  abstract-en: none,
  keywords-en: none,
) = {
  pagebreak()

  if abstract-cz != none {
    heading(level: 2, numbering: none, outlined: false)[#locale.at("abstract")]
    abstract-cz

    if keywords-cz != none {
      heading(level: 3, numbering: none, outlined: false)[#locale.at("keywords")]
      keywords-cz
    }
  }

  v(3em)

  if abstract-en != none {
    heading(level: 2, numbering: none, outlined: false)[#locale.at("abstract-en")]
    abstract-en

    if keywords-en != none {
      heading(level: 3, numbering: none, outlined: false)[#locale.at("keywords-en")]
      keywords-en
    }
  }
}
