#import "../lib.typ": ilm

#show: ilm.with(
  title: [The Beauty of\ Sharing Knowledge],
  short-title: "Knowledge",
  author: "Max Mustermann",
  date: datetime(year: 2024, month: 03, day: 19),
  abstract: [
    ‘Ilm (Urdu: #text(lang: "ur")[عِلْم]) is the Urdu term for knowledge. In its general usage, 'ilm may refer to knowledge of any specific thing or proposition or any form of "learning". Subsequently, the term came to be used to refer to various categories of "sciences", especially when used in its plural form ('ulum).
  ],
  preface: [#align(center + bottom, text(0.85em)[
    #sym.copyright 2024 Wikipedia \
    The text of this document has been mostly borrowed from Wikipedia\
    which is available under a Creative Commons Attribution-ShareAlike License 4.0.

    For license details, see https://creativecommons.org/licenses/by-sa/4.0/.

    Find the template for this document at https://typst.app/universe/template/ilm/ \
    Suggestions and critique are welcome at https://github.com/talal/ilm/
  ])],
  bibliography: bibliography("refs.bib"),
  figure-index: true,
  table-index: true,
  listing-index: true
)

= Philosophy

#let wiki-url(stub) = {
  return link("https://en.wikipedia.org/wiki/"+stub, stub)
}

Philosophy (#text(lang: "el")[φιλοσοφία], 'love of wisdom', in #link("https://en.wikipedia.org/wiki/Ancient_Greek")[Ancient Greek]) is a systematic study of general and fundamental questions concerning topics like #wiki-url("existence"), #wiki-url("reason"), knowledge, value, mind, and #wiki-url("language"). It is a rational and critical inquiry that reflects on its own methods and assumptions.

== Plato
Plato is often misquoted as the author of #quote[I know that I know
nothing], however, this is a derivation @I_know_that_I_know_nothing from his original quote:

#quote(block: true, attribution: [Plato])[
  #set text(lang: "el")
  ... ἔοικα γοῦν τούτου γε σμικρῷ τινι αὐτῷ τούτῳ σοφώτερος εἶναι, ὅτι ἃ μὴ οἶδα οὐδὲ οἴομαι εἰδέναι.\
  #set text(lang: "en")
  ... I seem, then, in just this little thing to be wiser than this man at any rate, that what I do not know I do not think I know either.
]

= Physics
== SI Base Units
The SI base units are the standard units of measurement defined by the International System of Units (SI) for the seven base quantities of what is now known as the International System of Quantities: they are notably a basic set from which all other SI units can be derived.

#let unit(u) = math.display(math.upright(u))
#figure(
  caption: [The seven SI base units],
  table(
    columns: 3,
    table.header[Quantity][Symbol][Unit],
    [length], [$l$], [#unit("m")],
    [mass], [$m$], [#unit("kg")],
    [time], [$t$], [#unit("s")],
    [electric current], [$I$], [#unit("A")],
    [temperature], [$T$], [#unit("K")],
    [amount of substance], [$n$], [#unit("mol")],
    [luminous intensity], [$I_v$], [#unit("cd")],
  )
) <si-base-units>

=== 2019 Redefinition
#lorem(55)

= Rust
=== Hello World
@rust-hello-world shows a "Hello, World!" program in Rust. The `fn` keyword denotes a function, and the ```rust println!``` macro prints the message to standard output. Statements in Rust are separated by semicolons.

#figure(caption: [Rust "Hello, World!" program])[
```rust
fn main() {
    println!("Hello, World!");
}
```
] <rust-hello-world>

= Math
== Prime numbers

#rect(
  width: 100%,
  radius: 4pt,
  inset: 10pt,
  fill: purple.lighten(90%)
)[
  *Theorem* (Euclid): There are infinitely many primes.
]
_Proof_: Suppose to the contrary that $p_1, p_2, dots, p_n$ is a finite enumeration
of all primes. Set $P = p_1 p_2 dots p_n$. Since $P + 1$ is not in our list,
it cannot be prime. Thus, some prime factor $p_j$ divides $P + 1$.  Since
$p_j$ also divides $P$, it must divide the difference $(P + 1) - P = 1$, a
contradiction.

*Corollary 1*: There is no largest prime number.\
*Corollary 2*: There are infinitely many composite numbers.

#lorem(50)
