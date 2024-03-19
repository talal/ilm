// Workaround for the lack of an `std` scope.
#let std-bibliography = bibliography

// This function gets your whole document as its `body` and formats it as a simple
// non-fiction paper.
#let ilm(
  // The title for your work.
  title: [Paper Title],

  // A short-title for your work. This will be displayed in the header of all pages.
  short-title: none,

  // Author's name.
  author: "Author",

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

  // The paper size to use.
  paper-size: "a4",

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
  set text(font: "Linux Libertine", size: 12pt)

  // Set raw text font.
  show raw: set text(font: "Cascadia Mono", size: 10pt)

  // Configure the page properties.
  set page(
    paper: paper-size,
    margin: (bottom: 1.75cm, top: 2.25cm),
  )

  // The first page.
  page(align(left + horizon)[#box(width: 90%)[
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
  ]])

  // Display preface as the second page.
  if preface != none {
    page(preface)
  }

  // Configure paragraph properties.
  set par(leading: 0.75em, justify: true, linebreaks: "optimized")

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
        if current.numbering != none {
          smallcaps(counter(target).display("1. ") + current.body)
        } else if current.body == [Bibliography] {
          smallcaps("Index")
        } else {
          smallcaps(current.body)
        }
        if short-title != none {
          h(1fr)
          smallcaps(short-title)
        }
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

  // Configure equation numbering and spacing.
  set math.equation(numbering: "(1)")

  // Configure raw text properties.
  let raw-box-color = luma(240)
  // Display inline code in a small box that retains the correct baseline.
  show raw.where(block: false): box.with(
    fill: raw-box-color,
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )
  // Display block code in a larger block with more padding.
  show raw.where(block: true): block.with(
    width: 100%,
    fill: raw-box-color.lighten(60%),
    inset: 6pt,
    radius: 4pt,
    stroke: raw-box-color,
  )

  // Add gray background to table header row.
  set table(fill: (_, y) => if y == 0 { gray.lighten(75%) })
  // Break large tables across pages.
  show figure.where(kind: table): set block(breakable: true)

  body

  // Display bibliography.
  if bibliography != none {
    show std-bibliography: set text(10pt)
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

#let horizontal-rule = {
  v(2%)
  line(start: (20%, 0%), end: (80%, 0%))
  v(2%)
}
