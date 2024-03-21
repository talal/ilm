# ‘Ilm

> ‘Ilm (Urdu: عِلْم) is the Urdu term for knowledge. It is pronounced as ill-lm.

A versatile, clean and minimal template for non-fiction writing. The template is ideal for
[class notes](https://github.com/talal/ilm/blob/main/examples/lecture-notes), reports, and
[books](https://github.com/talal/ilm/blob/main/examples/book).

It contains a title page, a table of contents, and a chapter template.

Dynamic running headers contain the title of the chapter (top-level heading).

## Usage

You can use this template in the Typst web app by clicking "Start from template"
on the dashboard and searching for `ilm`.

Alternatively, you can use the CLI to kick this project off using the command

```sh
typst init @preview/ilm
```

Typst will create a new directory with all the files needed to get you started.

## Configuration

This template exports the `ilm` function with the following named arguments:

| Argument | Default Value | Type | Description |
| --- | --- | --- | --- |
| `title` | `Your Title` | [content] | The title for your work. |
| `author` | `Author` | [content] | A string to specify the author's name |
| `paper-size` | `a4` | [string] | Specify a [paper size string] to change the page size. |
| `date` | `none` | [datetime] | This date will be displayed on the cover page in the format: `MMMM DD, YYYY`. |
| `abstract` | `none` | [content] | A brief summary/description of your work. This is shown on the cover page. |
| `preface` | `none` | [content] | The preface for your work. The preface content is shown on its own separate page after the cover. |
| `bibliography` | `none` | [content] | The result of a call to the [bibliography function][bibliography] or none. Specifying this will configure numeric, IEEE-style citations. |
| `figure-index` | `false` | [bool] | Setting this to `true` will display a index of image figures at the end of the document. |
| `table-index` | `false` | [bool] | Setting this to `true` will display a index of table figures at the end of the document. |
| `listing-index` | `false` | [bool] | Setting this to `true` will display a index of listing (code block) figures at the end of the document. |

The function also accepts a single, positional argument for the body.

The template will initialize your package with a sample call to the `ilm`
function in a show rule. If you, however, want to change an existing project to
use this template, you can add a show rule like this at the top of your file:

```typ
#import "@preview/ilm:0.1.0": ilm

#show: ilm.with(
  title: [Your Title],
  author: "Max Mustermann",
  date: datetime(year: 2024, month: 03, day: 19),
  abstract: [],
  preface: [],
  bibliography: bibliography("refs.bib"),
  figure-index: true,
  table-index: true,
  listing-index: true
)

// Your content goes below.
```

[bibliography]: https://typst.app/docs/reference/model/bibliography/
[bool]: https://typst.app/docs/reference/foundations/bool/
[content]: https://typst.app/docs/reference/foundations/content/
[datetime]: https://typst.app/docs/reference/foundations/datetime/
[paper size string]: https://typst.app/docs/reference/layout/page#parameters-paper
[string]: https://typst.app/docs/reference/foundations/str/
