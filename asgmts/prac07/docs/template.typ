#let project(
  title: "", authors: (), date: none, logo: "assets/espol_logo.png", body,
) = {
  // basic properties
  set document(author: authors.map(a => a.name), title: title)
  set page(paper: "us-letter", numbering: "1 ", number-align: end)
  set text(font: "New Computer Modern", lang: "es")

  // paragraphs
  set heading(numbering: "1.1.")
  set par(leading: 0.75em)

  // title page
  v(0.5fr)
  if logo != none {
    image("assets/espol_logo.png", width: 90%)
  }

  v(10em)

  text(weight: 500, "Escuela Superior Politécnica del Literal - PAO II 2024")
  v(1mm)
  text(1.1em, date)
  v(1.2em, weak: true)
  text(2em, weight: 700, title)

  v(0.5mm)
  text(weight: 500, "CCPG1036 - Análisis de Algoritmos")
  v(0.1mm)
  text(weight: 500, "Paralelo 2/102")
  v(0.1mm)
  text(weight: 500, "Grupo 5A")

  // authors
  pad(
    top: 0.7em, right: 20%, grid(
      columns: (1fr,) * calc.min(3, authors.len()), gutter: 1em, ..authors.map(author => align(start)[
        *#author.name* \
        #author.email \
        #author.affiliation
      ]),
    ),
  )

  v(2.4fr)
  pagebreak()

  // main body
  set par(justify: true, leading: 1.5em, spacing: 2em, first-line-indent: 2em)
  set text(hyphenate: false)

  body
}
