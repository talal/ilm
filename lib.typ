// Workaround for the lack of an `std` scope.
#let std-bibliography = bibliography

// This function gets your whole document as its `body` and formats it as a simple
// non-fiction paper.
#let ilm(
  // The title for your work.
  title: [Your Title],

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

  // Configure page size and margins.
  set page(
    paper: paper-size,
    margin: (bottom: 1.75cm, top: 2.25cm),
  )

  // Cover page.
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
        // Display date as MMMM DD, YYYY
        text(date.display("[month repr:long] [day padding:zero], [year repr:full]"))
      }
  ]))

  // Configure paragraph properties.
  set par(leading: 0.75em, justify: true, linebreaks: "optimized")

  // Configure heading properties.
  set heading(numbering: "1.")
  show heading: it => {
    // Do not hyphenate headings.
    set text(hyphenate: false)
    // Start new chapters on a new page.
    if it.level == 1 { pagebreak() }
    it
    v(2%, weak: true)
  }

  // Show a small maroon circle next to external links.
  show link: it => {
    // Workaround for ctheorems package so that its labels keep the default link styling.
    if type(it.dest) == label { return it }
    it
    h(1.5pt)
    super(box(height: 3.5pt, circle(radius: 1.25pt, stroke: 0.75pt + rgb("#993333"))))
  }

  // Display preface as the second page.
  if preface != none {
    // Do not number headings on the preface page.
    set heading(numbering: none)
    page(preface)
  }

  // Indent nested entires in the outline.
  set outline(indent: auto)

  // Display table of contents.
  outline(title: "Contents")
  pagebreak(weak: true)

  // Configure page numbering and header.
  set page(
    numbering: "1",
    // The header displays the chapter (top-level heading) on the left or right side depending on
    // whether the page is even or odd respectively.
    header: context {
      // Get current page number.
      let i = counter(page).at(here()).first()

      // Are we on a page that starts a chapter?
      let target = heading.where(level: 1)
      let all = query(target, here())
      if all.any(it => it.location().page() == i) {
        return
      }

      // Find the chapter of the section we are currently in.
      let before = query(target.before(here()))
      if before.len() > 0 {
        let current = before.last()
        if current.numbering != none {
          let aln = if calc.odd(i) { right } else { left }
          align(aln)[#smallcaps(counter(target).display("1. ") + current.body)]
        }
      }
    },
  )

  // Configure equation numbering.
  set math.equation(numbering: "(1)")

  // Display inline code in a small box that retains the correct baseline.
  show raw.where(block: false): box.with(
    fill: luma(245),
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  // Display block code with padding.
  show raw.where(block: true): block.with(
    inset: (x: 5pt),
  )

  // Break large tables across pages.
  show figure.where(kind: table): set block(breakable: true)
  set table(
    // Add gray background to table header row.
    fill: (_, y) => if y == 0 { gray.lighten(75%) },
    // Increase the table cell's padding
    inset: 6pt, // default is 5pt
  )

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

// This function formats its `body` (content) into a blockquote.
#let blockquote(body) = {
  block(
    width: 100%,
    fill: luma(250),
    inset: 2em,
    stroke: (y: 0.5pt + luma(200)),
    body
  )
}
