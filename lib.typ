// Color for raw text's box (inline and block).
#let raw-box-color = luma(240)

// Workaround for the lack of an `std` scope.
#let std-bibliography = bibliography

// This function gets your whole document as its `body` and formats
// it as a simple non-fiction paper.
#let paper(
  // The paper's title.
  title: [Paper Title],

  // The paper's short-title.
  // This will be displayed in the header.
  short-title: none,

  // The paper's author.
  author: "Author",

  // The paper's date of creation.
  // The value needs to be of the 'datetime' type.
  // More info: https://typst.app/docs/reference/foundations/datetime/ 
  // Example: datetime(year: 2024, month: 03, day: 17)
  date: none,

  // The paper's abstract. Can be omitted if you don't have one.
  abstract: none,

  // The paper's preface page. This will be displayed after the cover page. Can be omitted if you don't have one.
  preface: none,
  
  // The paper size to use.
  paper-size: "a4",

  // The result of a call to the `bibliography` function or `none`.
  bibliography: none,

  // The paper's content.
  body,
) = {
  // Set the document's metadata.
  set document(title: title, author: author)

  // Set the body font. TeX Gyre Pagella is a free alternative
  // to Palatino.
  // set text(font: "TeX Gyre Pagella")
  set text(font: "Linux Libertine", size: 12pt)
  

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
      #v(2em, weak: true)
      
      #box(width: 80%)[
        // Default leading is 0.65em.
        #par(leading: 0.78em, justify: true, linebreaks: "optimized", abstract)
      ]
      #v(2em, weak: true)

      #text(date.display("[month repr:long] [day padding:zero], [year repr:full]"))
  ]])

  // Display preface as the second page.
  page(preface)

  // Configure paragraph properties.
  set par(leading: 0.75em, first-line-indent: 12pt, justify: true)

  // Configure outline properties.
  set outline(indent: auto)
  
  // Start with a table of contents.
  outline(title: "Contents")
  pagebreak(weak: true)

  // Configure page properties.
  set page(
    numbering: "1",
    // The header always contains the paper's short-title if it is set.
    // Additionally the header also contains the top-level heading.
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

  // Display inline code in a small box that retains the correct baseline.
  show raw.where(block: false): box.with(
    fill: raw-box-color,
    inset: (x: 3pt, y: 0pt),
    outset: (y: 3pt),
    radius: 2pt,
  )

  // Add gray background to table header row.
  set table(fill: (_, y) => if y == 0 { gray.lighten(75%) })
  // Break large tables across pages.
  show figure.where(kind: table): set block(breakable: true)
  
  body

  // Display bibliography.
  if bibliography != none {
    show std-bibliography: set text(8pt)
    set std-bibliography(title: text(10pt)[Bibliography], style: "association-for-computing-machinery")
    bibliography
  }
  pagebreak(weak: true)

  // Indices.
  let display-index(kind, title) = {
    let target = figure.where(kind: kind)
    let elems = counter(target).get().at(0)
    if elems > 0 {
      outline(title: title, target: target)
    }
  }
  context {
    show outline: set heading(outlined: true)
    display-index(image, "Index of Figures")
    display-index(table, "Index of Tables")
    display-index(raw, "Index of Listings")
  }
}

// Arguments that can be given to `codly` function so that the code snippets are displayed in the same style as the other (non-codly) snippets.
#let codly-args = arguments(  
  display-name: false,
  display-icon: false,
  fill: raw-box-color.lighten(60%),
  zebra-color: raw-box-color.lighten(60%),
  breakable: false,
)
