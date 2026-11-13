// ══════════ Tokens & Constants ══════════
#let _colors = (
  external-link: rgb("#993333"),
  fill: luma(250),
  stroke: luma(200),
)

#let _fonts = (
  serif: "Libertinus Serif",
  sans: "Lato",
  mono: ("IBM Plex Mono", "DejaVu Sans Mono"),
  math: "New Computer Modern Math",
)

#let _base-size = 12pt
// Round display/UI sizes to integer points while keeping them proportional to `_base-size`.
#let _pt-round(multiplier, base: _base-size) = calc.round((multiplier * base) / 1pt) * 1pt
#let _sizes = (
  h1: _pt-round(1.65),
  h2: _pt-round(1.25),
  h3: _base-size,
  body: _base-size,
  small: _pt-round(0.9), // used for captions and footnotes
  spacing: 1.1em,
)

// ══════════ Helper Functions ══════════
// Extract plain text from content or strings.
#let _plain-text(val) = {
  if type(val) == str {
    val
  } else if type(val) == content {
    let fields = val.fields()
    if "text" in fields {
      fields.text
    } else if "children" in fields {
      fields
        .children
        .map(c => {
          if type(c) == str {
            c
          } else if c.func() == [ ].func() {
            " "
          } else {
            _plain-text(c)
          }
        })
        .join()
    } else if "body" in fields {
      _plain-text(fields.body)
    } else if "child" in fields {
      _plain-text(fields.child)
    } else {
      ""
    }
  } else {
    ""
  }
}

// Numbering of the form "<chapter>.<n>", adapting to "1.1" or "A.1" automatically.
#let _chapter-num(n) = {
  let ch = query(heading.where(level: 1).before(here())).last(default: none)
  if ch != none and ch.numbering != none {
    numbering(ch.numbering, counter(heading).get().first(), n)
  } else {
    numbering("1", n)
  }
}

// Normalize `authors` (`none`, `str`, or `array`) into an array.
#let _normalize-authors(authors) = {
  if type(authors) == str {
    (authors,)
  } else if type(authors) == array {
    authors
  } else {
    ()
  }
}

// Render the footer content based on the footer style.
#let _render-footer(footer) = context {
  // Use counter parity for alternating alignment while respecting custom page numbering formats.
  let is-odd = calc.odd(counter(page).get().first())
  let aln = if is-odd { right } else { left }
  let i = text(number-type: "old-style", counter(page).display())

  // Only get chapter info if needed.
  let chapter = none
  let on-chapter-page = false

  if footer.ends-with("with-chapter") {
    // Are we on a page that starts a chapter?
    let target = heading.where(level: 1)
    let n = here().page()
    on-chapter-page = query(target).any(it => it.location().page() == n)

    // Find the chapter of the section we are currently in.
    if not on-chapter-page {
      let current = query(target.before(here())).last(default: none)
      if current != none and current.numbering != none {
        let title = {
          show linebreak: ""
          current.body
        }
        chapter = text(features: (c2sc: 1, smcp: 1), tracking: 0.08em, title)
      }
    }
  }

  let gap = 1em

  // Apply footer style.
  if footer == "page-number-alternate-with-chapter" {
    if chapter != none {
      if is-odd {
        align(aln)[#chapter #h(gap) #i]
      } else {
        align(aln)[#i #h(gap) #chapter]
      }
    } else {
      align(aln)[#i]
    }
  } else if footer == "page-number-left-with-chapter" {
    if chapter != none {
      align(left)[#i #h(gap) #chapter]
    } else {
      align(left)[#i]
    }
  } else if footer == "page-number-right-with-chapter" {
    if chapter != none {
      align(right)[#chapter #h(gap) #i]
    } else {
      align(right)[#i]
    }
  } else if footer == "page-number-center" {
    align(center)[#i]
  } else if footer == "page-number-left" {
    align(left)[#i]
  } else if footer == "page-number-right" {
    align(right)[#i]
  } else {
    // Fallback to default behavior.
    align(aln)[#i]
  }
}

// Format an outline entry's body, dot leader, and tabular lining page number.
#let _outline-inner(entry) = {
  let page = text(number-type: "lining", number-width: "tabular", entry.page())
  if entry.fill == none {
    [#entry.body()#h(1fr)#sym.wj#page]
  } else {
    [#entry.body() #box(width: 1fr, entry.fill) #sym.wj#page]
  }
}

////////////////////////////////////////////////////////////////////////////////////////////////////

#let _ilm-meta = state("ilm--meta", (:))

// ══════════ CAPS ══════════
// Overwrite the default `smallcaps` and `upper` functions with increased spacing between
// characters. Default tracking is 0pt.
#let smallcaps(body, all: false) = std.smallcaps(all: all, text(tracking: 0.05em, body))
#let upper(body) = std.upper(text(tracking: 0.05em, body))

// ══════════ Blockquote ══════════
#let blockquote(body) = {
  block(
    width: 100%,
    fill: _colors.fill,
    inset: (x: 2em, y: 1.5em),
    stroke: (y: 0.5pt + _colors.stroke),
    body,
  )
}

// ══════════ Cover Page ══════════
#let cover-page(
  title: auto,
  authors: auto,
  date: auto,
  date-format: auto,
  abstract: auto,
) = page(
  header: none,
  footer: none,
  context {
    let meta = _ilm-meta.get()
    let title = if title != auto { title } else { meta.at("title", default: [Your Title]) }
    let authors = if authors != auto {
      _normalize-authors(authors)
    } else {
      meta.at("authors", default: ("Author Name",))
    }
    let date = if date != auto { date } else { meta.at("date", default: none) }
    let date-format = if date-format != auto {
      date-format
    } else {
      meta.at("date-format", default: "[month repr:long] [day padding:zero], [year repr:full]")
    }
    let abstract = if abstract != auto { abstract } else { meta.at("abstract", default: none) }

    // Add cover bookmark without showing heading or listing it in the outline
    {
      show heading: none
      heading(level: 1, numbering: none, outlined: false, bookmarked: true, "Cover")
    }

    let v-space = v(2em, weak: true)
    align(
      left + horizon,
      block(width: 72%)[
        #let title-len = _plain-text(title).trim().len()
        #let title-size = if title-len < 35 {
          3.0 * _base-size
        } else if title-len < 60 {
          2.5 * _base-size
        } else if title-len < 100 {
          2.1 * _base-size
        } else {
          1.8 * _base-size
        }
        #show std.title: set text(size: title-size)
        #show std.title: set par(justify: false, leading: 0.65em)
        #std.title(title)

        #if authors.len() > 0 {
          v-space
          let author-count = authors.len()
          let author-size = if author-count == 1 {
            1.6em
          } else if author-count == 2 {
            1.4em
          } else if author-count == 3 {
            1.2em
          } else {
            1.1em
          }
          for (i, auth) in authors.enumerate() {
            text(author-size, auth)
            if i < author-count - 1 {
              linebreak()
            }
          }
        }

        #if abstract != none {
          v-space
          set par(leading: 0.78em, justify: true, linebreaks: "optimized")
          abstract
        }

        #if date != none {
          v-space
          text(date.display(date-format))
        }
      ],
    )
  },
)

// ══════════ List of Figures, Tables, Listings ══════════
#let list-of-figures = outline.with(
  title: [List of Figures],
  target: figure.where(kind: image),
)
#let list-of-tables = outline.with(
  title: [List of Tables],
  target: figure.where(kind: table),
)
#let list-of-listings = outline.with(
  title: [List of Listings],
  target: figure.where(kind: raw),
)

// ══════════ Appendix ══════════
#let appendix(body) = {
  counter(heading).update(0)
  set heading(numbering: "A.1")
  show heading.where(level: 1): set heading(supplement: [Appendix])
  body
}

////////////////////////////////////////////////////////////////////////////////////////////////////

// This function gets your whole document as its `body`.
#let ilm(
  // The title for your work.
  title: [Your Title],
  // Author(s) of your work. Can be `none`, a string, or an array of strings.
  authors: ("Author Name",),
  // The paper size to use.
  paper-size: "a4",
  // Date that will be displayed on cover page.
  // The value needs to be of the 'datetime' type.
  // More info: https://typst.app/docs/reference/foundations/datetime/
  // Example: datetime(year: 2024, month: 03, day: 17)
  date: datetime.today(),
  // Format in which the date will be displayed on cover page.
  // More info: https://typst.app/docs/reference/foundations/datetime/#format
  // The default format will display date as: MMMM DD, YYYY
  date-format: "[month repr:long] [day padding:zero], [year repr:full]",
  // An abstract for your work. Can be omitted if you don't have one.
  abstract: none,
  // Whether to start a chapter on a new page.
  chapter-pagebreak: true,
  // Whether to display a maroon circle next to external links.
  external-link-circle: true,
  // Footer style for page numbering.
  // Set to `none` to disable footer entirely.
  // Available styles:
  // - "page-number-alternate-with-chapter": alternating sides with chapter name (default)
  // - "page-number-left-with-chapter": left-aligned with chapter name
  // - "page-number-right-with-chapter": right-aligned with chapter name
  // - "page-number-center": centered page number only
  // - "page-number-left": left-aligned page number only
  // - "page-number-right": right-aligned page number only
  footer: "page-number-alternate-with-chapter",
  // The content of your work.
  body,
) = {
  // Normalize to array for simpler processing.
  let authors = _normalize-authors(authors)

  // Store metadata in state for other components that use it, e.g. cover-page, etc.
  _ilm-meta.update((
    title: title,
    authors: authors,
    date: date,
    date-format: date-format,
    abstract: abstract,
  ))

  // ══════════ Page Setup ══════════
  set document(
    title: title,
    ..if authors.len() > 0 {
      (author: authors.join(", "))
    } else {
      (:)
    },
  )

  set page(
    paper: paper-size,
    footer-descent: 1.25cm, // a4 paper has 2.5cm margins so footer sits 1.25cm above paper edge
    footer: if footer != none { _render-footer(footer) },
  )

  // ══════════ Typography ══════════
  set text(font: _fonts.serif, size: _sizes.body)

  set par(
    justify: true,
    linebreaks: "optimized",
    // 0.75em yields a baseline distance of ~= 16.8 pt (1.40x).
    leading: 0.75em, // spacing between lines (default: 0.65em)
    spacing: 1.5em, // spacing between paragraphs (default: 1.2em)
  )

  set underline(offset: 2pt)

  // ══════════ Headings ══════════
  show heading: set text(font: _fonts.sans, features: (liga: 0), hyphenate: false)
  show heading: set block(above: 1.8em, below: 1.3em)
  show heading: it => {
    if it.numbering == none { return it }
    let num = counter(heading).display()
    let prefix = if it.supplement == [Appendix] [Appendix #num:] else { num }
    grid(
      columns: (auto, 1fr),
      column-gutter: 0.5em,
      prefix, it.body,
    )
  }
  show heading.where(level: 1): set text(size: _sizes.h1)
  show heading.where(level: 2): set text(size: _sizes.h2)
  show heading.where(level: 3): set text(size: _sizes.h3)

  // ══════════ Lists ══════════
  set list(indent: 1em, spacing: _sizes.spacing, marker: ([•], [–], [‣]))
  set enum(indent: 1em, spacing: _sizes.spacing)
  set terms(spacing: _sizes.spacing, separator: [: ])

  // ══════════ Equations ══════════
  show math.equation: set text(font: _fonts.math)
  set math.equation(numbering: n => [(#_chapter-num(n))])

  // ══════════ Figures ══════════
  set figure(gap: 1.2em, numbering: _chapter-num)
  show figure: set block(spacing: 2em)
  show figure.caption: it => {
    set text(size: _sizes.small)
    if it.numbering != none {
      strong[#it.supplement #context it.counter.display(it.numbering)#it.separator]
    } else if it.supplement != none {
      strong[#it.supplement#it.separator]
    }
    it.body
  }

  // ══════════ Tables ══════════
  show table: set par(justify: false)
  show table: set text(hyphenate: false, number-type: "lining", number-width: "tabular")
  set table(
    inset: 7pt, // increase cell padding (default: 5pt)
    stroke: (0.5pt + _colors.stroke),
  )
  show table.cell.where(y: 0): smallcaps

  show figure.where(kind: table): set block(breakable: true)
  show figure.where(kind: table): set figure(gap: 0.75em)
  show figure.where(kind: table): set figure.caption(position: top)

  // ══════════ Code ══════════
  set raw(tab-size: 4)
  // Typst defaults raw elements to 0.8em of surrounding text; `1.25em` cancels that
  // built-in reduction so inline/block raw sizes below scale proportionally everywhere.
  show raw: set text(
    font: _fonts.mono,
    size: 1.25em,
    features: (
      calt: 1, // contextual alternates (ligatures)
      case: 1, // case-sensitive forms
    ),
  )

  // We use `highlight` instead of `box` so long snippets can wrap across line breaks
  // while retaining the exact same dimensions:
  // - `extent` extends the background horizontally on both sides without adding layout
  //   width, so `h(x-pad)` reserves matching horizontal space.
  // - `top-edge` and `bottom-edge` are measured from the baseline, so adding `y-pad`
  //   above cap-height (`measure(it).height`) and `-y-pad` below the baseline adds
  //   vertical padding.
  // 0.8em matches serif x-height parity (9.6pt at 12pt body).
  show raw.where(block: false): set text(size: 0.8em)
  show raw.where(block: false): it => context {
    let x-pad = 0.3125em // 3pt at 9.6pt inline raw size
    let y-pad = 0.3125em

    h(x-pad)
    highlight(
      fill: _colors.fill.darken(2%),
      top-edge: measure(it).height + y-pad,
      bottom-edge: -y-pad,
      extent: x-pad,
      radius: 2pt,
      it,
    )
    h(x-pad)
  }

  // Display block code with padding.
  show raw.where(block: true): set par(leading: 0.65em) // spacing between lines
  show raw.where(block: true): set text(size: 0.75em) // use slightly smaller size than inline code
  show raw.where(block: true): set block(
    width: 100%,
    breakable: true,
    inset: (left: 0.5em),
    spacing: 2em,
  )

  // Figure code listing styling (Editorial Top & Bottom Rules).
  show figure.where(kind: raw): it => block(
    width: 100%,
    breakable: true,
    {
      if it.has("caption") and it.caption != none {
        it.caption
        v(0.75em, weak: true) // use same caption gap as tables
      }
      line(length: 100%, stroke: 0.5pt + _colors.stroke)
      v(1em, weak: true)
      {
        show raw.where(block: true): set block(spacing: 0pt)
        it.body
      }
      v(1em, weak: true)
      line(length: 100%, stroke: 0.5pt + _colors.stroke)
    },
  )

  // ══════════ Outlines ══════════
  show outline: set heading(outlined: true)
  set outline.entry(fill: pad(left: 0.25em, right: 1em, repeat(gap: 0.5em)[.]))
  // Table of contents only: bold chapter entries without dot leaders, and appendix
  // entries labelled "Appendix A:" instead of a bare number.
  show outline.where(target: selector(heading)): it => {
    set heading(outlined: false, bookmarked: true)
    show outline.entry.where(level: 1): set outline.entry(fill: none)
    show outline.entry.where(level: 1): set block(above: 1.7em, sticky: true)
    show outline.entry.where(level: 1): set text(weight: "bold")
    show outline.entry: entry => {
      show linebreak: ""
      let inner = _outline-inner(entry)
      let body = if entry.prefix() == none {
        entry.indented(none, inner)
      } else if entry.element.supplement == [Appendix] {
        entry.indented(none, [Appendix ] + entry.prefix() + [: ] + inner)
      } else {
        entry.indented(entry.prefix(), inner, gap: 0.75em)
      }
      link(entry.element.location(), body)
    }
    it
  }

  // Separate figure outline entries by chapter (e.g. List of Figures, Tables, Listings).
  show outline.entry: entry => {
    if entry.element.func() != figure { return entry }
    context {
      show linebreak: ""
      let loc = entry.element.location()
      let prev = query(figure.where(kind: entry.element.kind).before(loc)).at(-2, default: none)
      if prev != none {
        let ch-between = query(heading.where(level: 1).after(prev.location()).before(loc))
        // Include body leading (0.75em) because `weak: true` collapses against it.
        if ch-between.len() > 0 {
          v(0.75em + _sizes.spacing, weak: true)
        }
      }
      link(loc, entry.indented(entry.prefix(), _outline-inner(entry)))
    }
  }

  // ══════════ Bibliography ══════════
  show bibliography: it => {
    pagebreak(weak: true)
    set par(leading: 0.65em)
    show link: l => if type(l.dest) == str {
      text(font: _fonts.mono, size: 0.8em, l)
    } else {
      l
    }
    it
  }

  // ══════════ Links ══════════
  // NOTE: put this after outline and bibliography so their links don't get the circle styling.
  // Show a small maroon circle next to external links.
  show link: it => {
    it
    // Only string destinations get a circle. Other destinations such as internal labels
    // or labels generated by third-party packages don't.
    if external-link-circle and type(it.dest) == str {
      sym.wj
      h(1.6pt)
      sym.wj
      super(box(height: 3.8pt, circle(radius: 1.2pt, stroke: 0.7pt + _colors.external-link)))
    }
  }

  // ══════════ Footnotes ══════════
  show footnote.entry: set text(size: _sizes.small)
  show footnote.entry: set par(leading: 0.55em)

  // ══════════ Main Body ══════════
  // Wrap `body` in curly braces so that it has its own context. This way show/set rules
  // will only apply to body.
  {
    // Configure heading numbering.
    set heading(numbering: "1.1")
    show heading.where(level: 1): set heading(supplement: [Chapter])

    // Start chapters on a new page and reset per-chapter counters.
    show heading.where(level: 1): it => {
      if it.numbering != none {
        if chapter-pagebreak {
          pagebreak(weak: true)
        }

        // Reset figure and equation numbering for each chapter.
        for kind in (image, table, raw) {
          counter(figure.where(kind: kind)).update(0)
        }
        counter(math.equation).update(0)
      }
      it
    }

    body
  }
}
