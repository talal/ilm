# Changelog

All notable changes to 'Ilm will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-02-04

### Changed
- Bump to v2.0.0
- Allow customizing page numbering in footer by @talal
- Allow disabling and customising cover page by @talal
- Improve raw-text customization options by @talal
- Allow multiple authors on cover page by @talal
- Merge pull request #32 from DavisYe/fix/issue-31 by @talal in [#32](https://github.com/talal/ilm/pull/32)
- Use git-cliff for changelog by @talal

### Fixed
- Table rendering for Typst Universe by @talal
- Fix type conflict when there are multiple authors. #31 by @DavisYe

### New Contributors
* @talal made their first contribution
* @DavisYe made their first contribution

## [1.4.2] - 2025-11-20

### Added
- Add raw-text option by @talal

### Changed
- Bump minimum compiler version to 0.14.0 by @talal
- Revert "feat: use content type for author option" by @talal
- Use content type for author option by @talal

### Fixed
- Fix author option type by @talal

## [1.4.1] - 2025-03-02

### Changed
- Release v1.4.1 by @talal
- Format using typstyle by @talal

### Removed
- Remove superflous set rule by @talal

## [1.4.0] - 2024-11-19

### Added
- Add support for appendix by @talal

### Changed
- Release v1.4.0 by @talal
- Use template file as documentation by @talal

## [1.3.1] - 2024-11-13

### Changed
- Ignore formatting commit in blame view by @talal
- Format with typstyle using `--column=90` by @talal

### Fixed
- Page numbering and chapter name in footer by @talal

## [1.3.0] - 2024-11-02

### Changed
- Release v1.3.0 by @talal
- Ignore formatting commit in blame view by @talal
- Format with typstyle by @talal
- Merge pull request #15 from Pi-Cla/par-spacing by @talal in [#15](https://github.com/talal/ilm/pull/15)
- Use Typst 0.12 spacing attribute

### New Contributors
* @ made their first contribution

## [1.2.1] - 2024-08-06

### Changed
- Release v1.2.1 by @talal
- Merge pull request #13 from wisp3rwind/main by @talal in [#13](https://github.com/talal/ilm/pull/13)
- Avoid linebreak before link indicators by @wisp3rwind

### New Contributors
* @wisp3rwind made their first contribution

## [1.2.0] - 2024-08-01

### Added
- Add `external-link-circle` option for disabling link styling by @talal

## [1.1.3] - 2024-07-23

### Fixed
- Chapter page breaks inside page container by @talal

## [1.1.2] - 2024-06-18

### Changed
- Fix typos by @youwen5 in [#8](https://github.com/talal/ilm/pull/8)
- Update default value for `table-of-contents` by @talal

### Fixed
- Improve example by @talal

### New Contributors
* @youwen5 made their first contribution in [#8](https://github.com/talal/ilm/pull/8)

## [1.1.1] - 2024-05-04

### Added
- Add 'class' and 'lecture' to keywords by @talal

### Changed
- Release v1.1.1 by @talal
- Document language setting definition by @talal
- Update by @talal
- Update by @talal
- Update 'ilm definition by @talal
- Use Noto Nastaliq Urdu by @talal

### Fixed
- Fix heading level by @talal
- Fix typo in description by @talal

### Removed
- Remove hardcoded heading for table of contents by @talal

## [1.1.0] - 2024-04-11

### Changed
- Use Libertinus Serif if available by @talal

## [1.0.0] - 2024-04-09

### Added
- Add `table-of-contents` field for specifying custom `outline` function by @talal
- Add `date-format` field by @talal

### Changed
- Release v1.0.0 by @talal
- Update index args and enable chapter page breaks by @talal
- Document new arguments by @talal
- Use dict for `figure-index`, `table-index`, and `listing-index` args by @talal
- Use body's own context for chapter breaks by @talal

## [0.1.3] - 2024-04-07

### Changed
- Minor improvements by @talal

### Fixed
- Fix level-1 headings on preface page by @talal

## [0.1.2] - 2024-03-25

### Changed
- Release v0.1.2 by @talal
- Check if a heading's `body` has a `text` field by @talal

## [0.1.1] - 2024-03-25

### Added
- Add running footer demo by @talal

### Changed
- Release v0.1.1 by @talal
- Always start bibliography on new page by @talal
- Use kebab-case by @talal
- Increase footer chapter heading size by @talal
- Word wrap comments by @talal
- Format markdown by @talal

### Removed
- Remove unnecessary `here()` by @talal

## [0.1.0] - 2024-03-22

### Added
- Add changelog by @talal
- Add minimum compiler version by @talal
- Add example.pdf by @talal
- Add `chapter-pagebreak` parameter by @talal
- Add blockquote function by @talal
- Add `.bib.original` files by @talal
- Add accents to علم by @talal
- Add circle superscript for external links by @talal
- Add gitignore by @talal
- Add helper function for horizontal-rule by @talal

### Changed
- Clean up by @talal
- Use `block` instead of `box` on cover by @talal
- Update by @talal
- Update by @talal
- Increase smallcaps spacing by @talal
- Define colors as vars by @talal
- Improve table by @talal
- Improve paragraph spacing by @talal
- Improve link accent by @talal
- Use `upper()` instead of `smallcaps()` for footer by @talal
- Increase character spacing for `smallcaps()` and `upper()` by @talal
- Increase spacing between page number and chapter by @talal
- Put current chapter in footer instead of header by @talal
- Change table header fill to `luma(235)` by @talal
- Change inline code fill to `luma(245)` by @talal
- Clean up by @talal
- Improve chapter display in header by @talal
- Start chapters on a new page by @talal
- Do not hyphenate headings by @talal
- Improve comments by @talal
- Do not number preface headings by @talal
- Show link accent on preface page by @talal
- Increase table cell's padding by @talal
- Configure heading properties before outline by @talal
- Decrease code block padding by @talal
- Use same paragraph properties for preface page by @talal
- Use Iosevka as raw text font by @talal
- Change raw text to 9pt by @talal
- Improve wording by @talal
- Document date format by @talal
- Minor improvements by @talal
- Minor tweaks by @talal
- Use title in header if short-title is not set by @talal
- Improve external link accent padding by @talal
- Improve external link accent padding by @talal
- Package for Typst Universe by @talal
- Use defaults for code block with slight padding by @talal
- Clean up by @talal
- Use "Cascadia Mono" for raw text by @talal
- Wrap optional content rendering in `if` checks by @talal
- Use full width and padding for code blocks by @talal
- Clean up whitespace by @talal
- Use `context` instead of `locate` by @talal
- Init by @talal

### Fixed
- Fix page breaks by @talal
- Fix ilm definition by @talal
- Fix bibliography text by @talal
- Fix external link accent by @talal
- Fix indices display by @talal
- Fix page break by @talal

### Removed
- Remove (short-) title from the header by @talal
- Remove `lorem()` from code snippet by @talal
- Remove par indent by @talal

### New Contributors
* @talal made their first contribution

[2.0.0]: https://github.com/talal/ilm/compare/v1.4.2...2.0.0
[1.4.2]: https://github.com/talal/ilm/compare/v1.4.1...v1.4.2
[1.4.1]: https://github.com/talal/ilm/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/talal/ilm/compare/v1.3.1...v1.4.0
[1.3.1]: https://github.com/talal/ilm/compare/v1.3.0...v1.3.1
[1.3.0]: https://github.com/talal/ilm/compare/v1.2.1...v1.3.0
[1.2.1]: https://github.com/talal/ilm/compare/v1.2.0...v1.2.1
[1.2.0]: https://github.com/talal/ilm/compare/v1.1.3...v1.2.0
[1.1.3]: https://github.com/talal/ilm/compare/v1.1.2...v1.1.3
[1.1.2]: https://github.com/talal/ilm/compare/v1.1.1...v1.1.2
[1.1.1]: https://github.com/talal/ilm/compare/v1.1.0...v1.1.1
[1.1.0]: https://github.com/talal/ilm/compare/v1.0.0...v1.1.0
[1.0.0]: https://github.com/talal/ilm/compare/v0.1.3...v1.0.0
[0.1.3]: https://github.com/talal/ilm/compare/v0.1.2...v0.1.3
[0.1.2]: https://github.com/talal/ilm/compare/v0.1.1...v0.1.2
[0.1.1]: https://github.com/talal/ilm/compare/v0.1.0...v0.1.1

<!-- generated by git-cliff -->
