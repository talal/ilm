# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.4.2] - 2025-11-20

### Added
- Add raw-text option

### Changed
- Bump minimum compiler version to 0.14.0
- Revert "feat: use content type for author option"
- Use content type for author option

### Fixed
- Fix author option type

## [1.4.1] - 2025-03-02

### Changed
- Release v1.4.1
- Format using typstyle

### Removed
- Remove superflous set rule

## [1.4.0] - 2024-11-19

### Added
- Add support for appendix

### Changed
- Release v1.4.0
- Use template file as documentation

## [1.3.1] - 2024-11-13

### Changed
- Ignore formatting commit in blame view
- Format with typstyle using `--column=90`

### Fixed
- Page numbering and chapter name in footer

## [1.3.0] - 2024-11-02

### Changed
- Release v1.3.0
- Ignore formatting commit in blame view
- Format with typstyle
- Merge pull request #15 from Pi-Cla/par-spacing
- Use Typst 0.12 spacing attribute

## [1.2.1] - 2024-08-06

### Changed
- Release v1.2.1
- Merge pull request #13 from wisp3rwind/main
- Avoid linebreak before link indicators

## [1.2.0] - 2024-08-01

### Added
- Add `external-link-circle` option for disabling link styling

## [1.1.3] - 2024-07-23

### Fixed
- Chapter page breaks inside page container

## [1.1.2] - 2024-06-18

### Changed
- Fix typos
- Update default value for `table-of-contents`

### Fixed
- Improve example

## [1.1.1] - 2024-05-04

### Added
- Add 'class' and 'lecture' to keywords

### Changed
- Release v1.1.1
- Document language setting definition
- Update
- Update
- Update 'ilm definition
- Use Noto Nastaliq Urdu

### Fixed
- Fix heading level
- Fix typo in description

### Removed
- Remove hardcoded heading for table of contents

## [1.1.0] - 2024-04-11

### Changed
- Use Libertinus Serif if available

## [1.0.0] - 2024-04-09

### Added
- Add `table-of-contents` field for specifying custom `outline` function
- Add `date-format` field

### Changed
- Release v1.0.0
- Update index args and enable chapter page breaks
- Document new arguments
- Use dict for `figure-index`, `table-index`, and `listing-index` args
- Use body's own context for chapter breaks

## [0.1.3] - 2024-04-07

### Changed
- Minor improvements

### Fixed
- Fix level-1 headings on preface page

## [0.1.2] - 2024-03-25

### Changed
- Release v0.1.2
- Check if a heading's `body` has a `text` field

## [0.1.1] - 2024-03-25

### Added
- Add running footer demo

### Changed
- Release v0.1.1
- Always start bibliography on new page
- Use kebab-case
- Increase footer chapter heading size
- Word wrap comments
- Format markdown

### Removed
- Remove unnecessary `here()`

## [0.1.0] - 2024-03-22

### Added
- Add changelog
- Add minimum compiler version
- Add example.pdf
- Add `chapter-pagebreak` parameter
- Add blockquote function
- Add `.bib.original` files
- Add accents to علم
- Add circle superscript for external links
- Add gitignore
- Add helper function for horizontal-rule

### Changed
- Clean up
- Use `block` instead of `box` on cover
- Update
- Update
- Increase smallcaps spacing
- Define colors as vars
- Improve table
- Improve paragraph spacing
- Improve link accent
- Use `upper()` instead of `smallcaps()` for footer
- Increase character spacing for `smallcaps()` and `upper()`
- Increase spacing between page number and chapter
- Put current chapter in footer instead of header
- Change table header fill to `luma(235)`
- Change inline code fill to `luma(245)`
- Clean up
- Improve chapter display in header
- Start chapters on a new page
- Do not hyphenate headings
- Improve comments
- Do not number preface headings
- Show link accent on preface page
- Increase table cell's padding
- Configure heading properties before outline
- Decrease code block padding
- Use same paragraph properties for preface page
- Use Iosevka as raw text font
- Change raw text to 9pt
- Improve wording
- Document date format
- Minor improvements
- Minor tweaks
- Use title in header if short-title is not set
- Improve external link accent padding
- Improve external link accent padding
- Package for Typst Universe
- Use defaults for code block with slight padding
- Clean up
- Use "Cascadia Mono" for raw text
- Wrap optional content rendering in `if` checks
- Use full width and padding for code blocks
- Clean up whitespace
- Use `context` instead of `locate`
- Init

### Fixed
- Fix page breaks
- Fix ilm definition
- Fix bibliography text
- Fix external link accent
- Fix indices display
- Fix page break

### Removed
- Remove (short-) title from the header
- Remove `lorem()` from code snippet
- Remove par indent

[1.4.2]: https://github.com///compare/v1.4.1...v1.4.2
[1.4.1]: https://github.com///compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com///compare/v1.3.1...v1.4.0
[1.3.1]: https://github.com///compare/v1.3.0...v1.3.1
[1.3.0]: https://github.com///compare/v1.2.1...v1.3.0
[1.2.1]: https://github.com///compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com///compare/v1.1.3...v1.2.0
[1.1.3]: https://github.com///compare/v1.1.2...v1.1.3
[1.1.2]: https://github.com///compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com///compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com///compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com///compare/v0.1.3...v1.0.0
[0.1.3]: https://github.com///compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com///compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com///compare/v0.1.0...v0.1.1

<!-- generated by git-cliff -->
