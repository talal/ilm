// Workaround for the lack of an `std` scope.
#let std-bibliography = bibliography

// This function gets your whole document as its `body` and formats it as a simple
// non-fiction paper.
#let ilm(
  // The title for your work.
  title: [Your Title],

  // A short-title for your work. This will be displayed in the header of all pages.
  short-title: none,

  // Author's name.
  author: "Author",

  // The paper size to use.
  paper-size: "a4",

  // Date that will be displayed on cover page.
  // The value needs to be of the 'datetime' type.
  // More info: https://typst.app/docs/reference/foundations/datetime/
  // Example: datetime(year: 2024, month: 03, day: 17)
  date: none,

  // An abstract for your work. Can be omitted if you don't have one.
  abstract: none,

  // The contents for the preface page. This will be displayed after the cover page.
  // Can be omitted if you don't have one.
  preface: none,

  // The result of a call to the `bibliography` function or `none`.
  bibliography: none,

  // Whether to display an index of figures (images).
  figure-index: false,

  // Whether to display an index of tables
  table-index: false,

  // Whether to display an index of listings (code blocks).
  listing-index: false,

  // The content of your work.
  body,
) = {
  // Set the document's metadata.
  set document(title: title, author: author)

  // Set the body font.
  // Default is Linux Libertine at 11pt
  set text(font: "Linux Libertine", size: 12pt)

  // Set raw text font.
  // Default is Fira Mono at 8.8pt
  show raw: set text(font: ("Iosevka", "Fira Mono"), size: 9pt)

  // Configure the page properties.
  set page(
    paper: paper-size,
    margin: (bottom: 1.75cm, top: 2.25cm),
  )

  // The first page.
  page(align(left + horizon, box(width: 90%)[
      #text(3em)[*#title*]

      #v(2em, weak: true)
      #text(1.6em, author)

      #if abstract != none {
        v(2em, weak: true)
        box(width: 80%)[
          // Default leading is 0.65em.
          #par(leading: 0.78em, justify: true, linebreaks: "optimized", abstract)
        ]
      }

      #if date != none {
        v(2em, weak: true)
        text(date.display("[month repr:long] [day padding:zero], [year repr:full]"))
      }
  ]))

  // Configure paragraph properties.
  set par(leading: 0.75em, justify: true, linebreaks: "optimized")

  // Display preface as the second page.
  if preface != none {
    page(preface)
  }

  // Configure outline properties.
  set outline(indent: auto)

  // Start with a table of contents.
  outline(title: "Contents")
  pagebreak(weak: true)

  // Configure page properties.
  set page(
    numbering: "1",
    // The header always displays the top-level heading and additionally the short-title
    // (if set).
    header: context {
      let target = heading.where(level: 1)
      // Find the top-level heading of the section we are currently in.
      let before = query(target.before(here()))
      if before.len() > 0 {
        let current = before.last()
        let left-side = current.body
        if current.numbering != none {
          left-side = counter(target).display("1. ") + current.body
        } else if current.body == [Bibliography] {
          left-side = "Index"
        }
        let right-side = title
        if short-title != none {
          right-side = short-title
        }
        smallcaps(left-side) + h(1fr) + smallcaps(right-side)
        v(-20%)
        line(length: 100%, stroke: 0.5pt)
      }
    },
  )

  // Configure heading properties.
  set heading(numbering: "1.")
  show heading: it => {
    it
    v(2%, weak: true)
  }

  // Configure equation numbering.
  set math.equation(numbering: "(1)")

  // Show a small maroon circle next to external links.
  show link: it => {
    // Workaround for ctheorems package so that its labels keep the default link styling.
    if type(it.dest) == label {
      return it
    }
    it
    h(1.5pt)
    super(box(height: 3.5pt, circle(radius: 1.25pt, stroke: 0.75pt + rgb("#993333"))))
  }

  // Display inline code in a small box that retains the correct baseline.
  show raw.where(block: false): box.with(
    fill: luma(240).lighten(30%),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  // Display block code with padding.
  show raw.where(block: true): block.with(
    inset: (x: 5pt),
  )

  // Add gray background to table header row.
  set table(fill: (_, y) => if y == 0 { gray.lighten(75%) })
  // Break large tables across pages.
  show figure.where(kind: table): set block(breakable: true)

  body

  // Display bibliography.
  if bibliography != none {
    show std-bibliography: set text(0.85em)
    // Use default paragraph properties for bibliography.
    show std-bibliography: set par(leading: 0.65em, justify: false, linebreaks: auto)
    bibliography
  }

  // Display indices of figures, tables, and listings.
  let fig-t(kind) = figure.where(kind: kind)
  let hasFig(kind) = counter(fig-t(kind)).get().at(0) > 0
  if figure-index or table-index or listing-index {
    show outline: set heading(outlined: true)
    context {
      let imgs = figure-index and hasFig(image)
      let tbls = table-index and hasFig(table)
      let lsts = listing-index and hasFig(raw)
      if imgs or tbls or lsts {
        pagebreak(weak: true)
      }

      if imgs { outline(title: "Index of Figures", target: fig-t(image)) }
      if tbls { outline(title: "Index of Tables", target: fig-t(table)) }
      if lsts { outline(title: "Index of Listings", target: fig-t(raw)) }
    }
  }
}
