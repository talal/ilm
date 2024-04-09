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

[unreleased]: https://github.com/talal/ilm/compare/v0.1.3...HEAD

## [Unreleased]

### Added

- `date-format` field for specifying custom date format.

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
