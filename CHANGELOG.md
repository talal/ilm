# Changelog

All notable changes to 'Ilm will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!---
The changes should be grouped using the following categories (in order of precedence):
- Added: for new features.
- Changed: for changes in existing functionality.
- Fixed: for any bug fixes.
- Deprecated: for soon-to-be removed features.
- Removed: for now removed features.
-->

[unreleased]: https://github.com/talal/ilm/compare/v1.4.1...HEAD

## [Unreleased]

## 1.4.1 - 2025-03-02

### Changed

- Minimum required compiler version to 0.13.0.

### Fixed

- Superfluous set rule.

## 1.4.0 - 2024-11-19

### Added

- `appendix` option for defining appendix.
- Documentation of template to template's `main.typ` file so that users of Typst's web app
  can see how the template works and how to customize it without leaving the web app, i.e.
  they don't have to read the README on GitHub.

## 1.3.1 - 2024-11-13

### Fixed

- Page numbering and chapter name in footer.

## 1.3.0 - 2024-11-02

### Fixed

- Use spacing attribute for paragraph spacing instead of block.

### Changed

- Minimum required compiler version to 0.12.0.

## 1.2.1 - 2024-08-06

### Fixed

- Avoid line break between link text and indicator (circle).

## 1.2.0 - 2024-08-01

### Added

- `external-link-circle` option for disabling circle next to external links.

## 1.1.3 - 2024-07-23

### Fixed

- Chapter page breaks when using headings inside of a page container.

## 1.1.2 - 2024-06-18

### Changed

- Improved template and `example.pdf`.

## 1.1.1 - 2024-05-04

### Added

- Language setting definition in template.

### Fixed

- Removed hardcoded heading for table of contents so that the heading is defined as per
  Typst's language settings.

## 1.1.0 - 2024-04-11

### Changed

- Use _Libertinus Serif_ font, if available, otherwise fall back to _Linux Libertine_.

## 1.0.0 - 2024-04-09

### Added

- `date-format` argument for specifying custom date format.
- `table-of-contents` argument for specifying custom `outline` function for the table of
  contents.

### Changed

- Use dictionary for `figure-index`, `table-index`, and `listing-index` arguments and add
  title field for specifying custom title.
- Create chapter page breaks inside `body` context.

## 0.1.3 - 2024-04-07

### Fixed

- Level 1 headings not being displayed on preface page due to page break inside heading
  `show` rule.

## 0.1.2 - 2024-03-25

### Fixed

- Check if a heading's `body` has a `text` field before using it.

## 0.1.1 - 2024-03-23

### Added

- Running footer demo in template and example.

### Changed

- Footer chapter size from `0.65em` to `0.68em`.
- Start bibliography on a new page regardless of whether `chapter-pagebreak` is set to
  `true` or not.

### Fixed

- Use kebab-case for variable and function names.
- Unnecessary `here()` parameter in `query()` usage.

## 0.1.0 - 2024-03-22

Initial Release.
