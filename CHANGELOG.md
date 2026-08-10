# Changelog

All notable changes to 'Ilm will be documented in this file.

The format is based on [Common Changelog](https://common-changelog.org/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!--
Guiding principles:
- Changelogs are for humans
- Communicate the impact of changes
- Sort content by importance
- Skip content that isn't important

The category must be one of (in order):
- Changed: for changes in existing functionality
- Added: for new functionality
- Removed: for removed functionality
- Fixed: for bug fixes
-->

## Unreleased

### Changed

- Do not justify and hyphenate text in tables

## [2.1.1] - 2026-06-03

### Fixed

- Add link circle decoration for string destinations only

## [2.1.0] - 2026-05-16

### Added

- Use `datetime.today()` as default value for `date` option

### Removed

- **Breaking:** remove deprecated options

### Fixed

- Fix paragraph set rule for abstract block on cover page
- Fix raw-text customization

## [2.0.0] - 2026-04-13

### Added

- Allow customizing page numbering in footer
- Allow disabling and customising cover page
- Improve raw-text customization options
- Allow multiple authors on cover page

### Fixed

- Fix type conflict when there are multiple authors ([#31](https://github.com/talal/ilm/pull/31) (DavisYe)

## [1.4.2] - 2025-11-20

### Changed

- Bump minimum compiler version to 0.14.0

### Added

- Add `raw-text` option

## [1.4.1] - 2025-03-02

### Fixed

- Remove superfluous set rule

## [1.4.0] - 2024-11-19

### Changed

- Use template as documentation

### Added

- Add support for appendix

## [1.3.1] - 2024-11-13

### Fixed

- Fix page numbering and chapter name in footer

## [1.3.0] - 2024-11-03

### Changed

- Use Typst 0.12 spacing attribute ([#15](https://github.com/talal/ilm/pull/15) (Pi-Cla)

## [1.2.1] - 2024-08-06

### Fixed

- Avoid linebreak before link indicators ([#13](https://github.com/talal/ilm/pull/13) (wisp3rwind)

## [1.2.0] - 2024-08-01

### Added

- Add `external-link-circle` option for disabling link styling

## [1.1.3] - 2024-07-23

### Fixed

- Fix chapter page breaks inside page container

## [1.1.2] - 2024-06-18

### Fixed

- Improve example in template
- Fix typos ([#8](https://github.com/talal/ilm/pull/8) (Youwen Wu)

## [1.1.1] - 2024-05-04

### Changed

- Use Noto Nastaliq Urdu for Urdu words in template

### Added

- Document language setting definition

### Removed

- Remove hardcoded heading for table of contents

## [1.1.0] - 2024-04-11

### Changed

- Use Libertinus Serif as default font, if available

## [1.0.0] - 2024-04-09

### Changed

- Use dictionary for `figure-index`, `table-index`, and `listing-index` options
- Use body's own context for chapter breaks
- Use chapter page breaks in template

### Added

- Add `table-of-contents` option for specifying custom `outline` function
- Add `date-format` option

## [0.1.3] - 2024-04-07

### Changed

- Improve template

### Fixed

- Fix level-1 headings on preface page

## [0.1.2] - 2024-03-25

### Fixed

- Check if a heading's `body` has a `text` field

## [0.1.1] - 2024-03-25

### Changed

- Always start bibliography on new page
- Increase chapter heading size in footer

### Added

- Add running footer demo to template

### Removed

- Remove unnecessary `here()` calls

## [0.1.0] - 2024-03-22

_Initial release._

[2.2.0]: https://github.com/talal/ilm/releases/tag/v2.2.0
[2.1.1]: https://github.com/talal/ilm/releases/tag/v2.1.1
[2.1.0]: https://github.com/talal/ilm/releases/tag/v2.1.0
[2.0.0]: https://github.com/talal/ilm/releases/tag/v2.0.0
[1.4.2]: https://github.com/talal/ilm/releases/tag/v1.4.2
[1.4.1]: https://github.com/talal/ilm/releases/tag/v1.4.1
[1.4.0]: https://github.com/talal/ilm/releases/tag/v1.4.0
[1.3.1]: https://github.com/talal/ilm/releases/tag/v1.3.1
[1.3.0]: https://github.com/talal/ilm/releases/tag/v1.3.0
[1.2.1]: https://github.com/talal/ilm/releases/tag/v1.2.1
[1.2.0]: https://github.com/talal/ilm/releases/tag/v1.2.0
[1.1.3]: https://github.com/talal/ilm/releases/tag/v1.1.3
[1.1.2]: https://github.com/talal/ilm/releases/tag/v1.1.2
[1.1.1]: https://github.com/talal/ilm/releases/tag/v1.1.1
[1.1.0]: https://github.com/talal/ilm/releases/tag/v1.1.0
[1.0.0]: https://github.com/talal/ilm/releases/tag/v1.0.0
[0.1.3]: https://github.com/talal/ilm/releases/tag/v0.1.3
[0.1.2]: https://github.com/talal/ilm/releases/tag/v0.1.2
[0.1.1]: https://github.com/talal/ilm/releases/tag/v0.1.1
[0.1.0]: https://github.com/talal/ilm/releases/tag/v0.1.0
