#let hamk_logo(width: 70%) = [
  #image("HAMK_Logo_text_large_FIN-400x152.png", width: width)
]

#let hamk_cover(title: "OPINNÄYTETYÖN NIMI", kind: "", program: "", date: datetime.today().display(), author: "", subtitle: "") = {
   place(center + horizon)[
    #stack(
      dir: ttb,
      spacing: 1cm,
    )[
      #v(8cm)
      // Main title, centered horizontally
      #align(center)[
        #text(22pt, upper(strong(title)))
      ]

      // Subtitle
      #v(1cm)
      #align(center)[
        #text(14pt, subtitle)
      ]

      // Push the lower block downward
      #v(3cm)

      // Bottom metadata
      #stack(
        dir: ttb,
        spacing: 0.2cm,
      )[
        #align(center)[#kind]
        #align(center)[#program]
        #align(center)[#date]
        #align(center)[#author]
      ]
    ]
  ]
  pagebreak()
}

#let hamk_abstract_fi(program: "Example", author: "Author", title: "Title", year: datetime.today().year(), abstract: "Abstract in Finnish") = {
  hamk_logo(width: 25%)
  grid(
    columns: (2.8fr, 1fr),
    block()[
      #program \
      Tekijä #author \
      Työn nimi #title \
      Ohjaaja \
    ],
    block()[
      Tiivistelmä \
      Vuosi #year
    ],
  )
  line(length: 100%)
  set par(spacing: 1.5em)
  [#abstract]
  pagebreak()
}

#let hamk_abstract_en(program_en: "Name of Degree Programme", author: "Firstname", title: "Name of the Thesis", year: datetime.today().year(), abstract: "Abstract in English") = {
  hamk_logo(width: 25%)
  grid(
    columns: (2.8fr, 1fr),
    block()[
      DP #program_en \
      Author #author \
      Subject #title \
      Supervisors \
    ],
    block()[
      Abstract \
      Year #year
    ],
  )
  line(length: 100%)
  set par(spacing: 1.5em)
  [#abstract]
  pagebreak()
}

#let hamk_outline() = {
  set heading(numbering: "1.")
  outline(title: [#stack()[#text(14pt, "Sisällys")]])

  outline(
  title: [Kuvat, taulukot ja kaavat],
    target: figure.where(kind: image).or(figure.where(kind: table)),
  )
}

#let hamk(
  title: "OPINNÄYTETYÖN NIMI",
  subtitle: "Mahdollinen alaotsikko",
  kind: "[Tutkinnon] opinnäytetyö",
  date: "hyväksymislukukausi vuosi",
  author: "Etunimi Sukunimi",
  program: "Koulutuksen nimi",
  year: datetime.today().display(),
  abstract: "Abstract Finnish",
  abstract_en: "Abstract English",
  doc,
) = {
  // A4 page with 2 cm margins
  set page(
    margin: (
      top: 2cm,
      bottom: 2cm,
      left: 3cm,
      right: 2cm,
    ),
  )

  set document(author: author, title: title)

  hamk_cover(title: title, author: author, subtitle: subtitle, kind: kind, program: program)
  place(center + horizon)[
    #show: hamk_logo(width: 40%)
  ]
  pagebreak()
  hamk_abstract_fi(program: program, author: author, title: title)
  hamk_abstract_en(author: author)

  hamk_outline()
  pagebreak()
  counter(page).update(1)

  // Main document body.
  set heading(numbering: "1.")
  set text(11pt)
  set par(spacing: 2em, leading: 0.8em)
  set block(spacing: 20pt, inset: (top: 3em, bottom: 2em))
  set page(
  numbering: (x, ..) => [#x],
  footer: [],
  header: context [
    #set align(right)
    #counter(page).display()
  ],
)
  doc
}
