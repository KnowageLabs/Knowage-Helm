
# Change Log
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [Unreleased] - yyyy-mm-dd

Here we write upgrading notes for brands. It's a team effort to make them as
straightforward as possible.

### Added

### Changed

### Fixed

## [1.0.11] - 2023-10-17

### Added

- Add new config knowage.useProfileFactoryClass for debug only: disabled by default

### Changed

### Fixed

- Fix missing Python and R services when using the new knowage.python.deploy and knowage.r.deploy configurations

## [1.0.10] - 2023-10-16

### Added

### Changed

- JMX

### Fixed

## [1.0.9] - 2023-10-10

Here we would have the update steps for 1.0.9 for people to follow.

### Added

- TLS secrets for both KNOWAGE and the internal reverse proxy: the user can provides its own certificate creating or updating them before the deploy.
- OAuth2 sample configuration. More will be present on the README.

### Changed

- Ingress use HTTPS by default to call the internal reverse proxy and/or KNOWAGE.

### Fixed
