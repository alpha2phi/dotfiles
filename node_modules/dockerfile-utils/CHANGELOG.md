# Changelog
All notable changes to this project will be documented in this file.

## [0.2.0] - 2021-01-19
### Added
- support the `--chmod` flag for ADD instructions ([#85](https://github.com/rcjsuen/dockerfile-utils/issues/85))
- support the `--chmod` flag for COPY instructions ([#86](https://github.com/rcjsuen/dockerfile-utils/issues/86))

## [0.1.1] - 2020-12-24
### Added
- instructions with only an escape character as its argument should be flagged as not having any arguments ([#83](https://github.com/rcjsuen/dockerfile-utils/issues/83))

### Fixed
- images on Docker Hub are not being updated ([#81](https://github.com/rcjsuen/dockerfile-utils/issues/81))

## [0.1.0] - 2020-07-11
### Added
- ARG and ENV instructions that span multiple lines with just a comment are now flagged as an error ([#78](https://github.com/rcjsuen/dockerfile-utils/issues/78))
- use DiagnosticTag to indicate if a Diagnostic is informing the user about a deprecation or not([#80](https://github.com/rcjsuen/dockerfile-utils/issues/80))

### Fixed
- correct ranges of linting errors if the error is on a multiline argument that is preceded by the escape character ([#77](https://github.com/rcjsuen/dockerfile-utils/issues/77))
- fix linting error caused by whitespace followed after the escape character ([#79](https://github.com/rcjsuen/dockerfile-utils/issues/79))

## [0.0.16] - 2020-04-02
### Added
- RUN instructions with only flags and no arguments will now be raised as an error ([#76](https://github.com/rcjsuen/dockerfile-utils/issues/76))

## [0.0.15] - 2020-03-08
### Fixed
- multiline instructions with empty newlines will no longer throw an error during validation ([#71](https://github.com/rcjsuen/dockerfile-utils/issues/71))
- instruction keywords that span multiple lines will no longer be raised as an error ([#72](https://github.com/rcjsuen/dockerfile-utils/issues/72))
- embedded comments with an empty continuation line will no longer be raised as an error ([#73](https://github.com/rcjsuen/dockerfile-utils/issues/73))
- arguments that follow a non-leading `#` comment marker will no longer be dropped during validation ([#75](https://github.com/rcjsuen/dockerfile-utils/issues/75))
- fix parsing of embedded comments in multiline instructions that have a trailing escape character ([#74](https://github.com/rcjsuen/dockerfile-utils/issues/74))

## [0.0.14] - 2020-02-11
### Added
- add validation of FROM's `--platform` flag introduced in Docker CE 18.04 ([#68](https://github.com/rcjsuen/dockerfile-utils/issues/68))
  - `ValidationCode.UNKNOWN_FROM_FLAG`
- warn if two escape parser directives are defined ([#70](https://github.com/rcjsuen/dockerfile-utils/issues/70))

### Fixed
- do not append newline when printing out the output of `dockerfile-utils format` to the console ([#63](https://github.com/rcjsuen/dockerfile-utils/issues/63))
- allow paths to be quoted in WORKDIRs ([#67](https://github.com/rcjsuen/dockerfile-utils/issues/67))
- do not calculate edits for lines that are already formatted correctly ([#66](https://github.com/rcjsuen/dockerfile-utils/issues/66))
- allow an instruction with an argument on the last line to be parsed if it has no leading whitespace and has a length of one ([#69](https://github.com/rcjsuen/dockerfile-utils/issues/69))

## [0.0.13] - 2019-05-22
### Added
- allow Bash syntax for variable modifiers in RUNs ([#56](https://github.com/rcjsuen/dockerfile-utils/issues/56))
- warn if FROM has a variable for an image and it references nothing ([#59](https://github.com/rcjsuen/dockerfile-utils/issues/59))

### Fixed
- allow quoted ARG variables in EXPOSE ([#58](https://github.com/rcjsuen/dockerfile-utils/issues/58))
- allow ENV variables that reference ARG variables in EXPOSE ([#57](https://github.com/rcjsuen/dockerfile-utils/issues/57))
- do not validate variable substitutions if found in RUN ([#60](https://github.com/rcjsuen/dockerfile-utils/issues/60))

## [0.0.12] - 2018-12-20
### Fixed
- ignore variables when validating directories for ARGs and COPYs ([#54](https://github.com/rcjsuen/dockerfile-utils/issues/54))

## [0.0.11] - 2018-08-19
### Added
- optionally flag WORKDIR instructions that do not point to an absolute path ([#47](https://github.com/rcjsuen/dockerfile-utils/issues/47))
  - `ValidationCode.WORKDIR_IS_NOT_ABSOLUTE`
  - `ValidatorSettings.instructionWorkdirRelative`
- add support for SCTP in EXPOSE instruction ([#52](https://github.com/rcjsuen/dockerfile-utils/issues/52))

### Fixed
- fix incorrect validation of ENV and LABEL instructions with many quoted properties on mulitple lines ([#50](https://github.com/rcjsuen/dockerfile-utils/issues/50))

## [0.0.10] - 2018-06-27
### Added
- flag FROM instructions that refer to an invalid image digest in a private registry with a port as an error ([#42](https://github.com/rcjsuen/dockerfile-utils/issues/42))
- flag variables that have an invalid modifier set ([#38](https://github.com/rcjsuen/dockerfile-utils/issues/38))
- warn if ARG instruction does not define a name for the variable ([#45](https://github.com/rcjsuen/dockerfile-utils/issues/45))
- flag incorrectly quoted arguments for ARG, ENV, and LABEL ([#40](https://github.com/rcjsuen/dockerfile-utils/issues/40))

### Changed
- [upgraded the dependency of Mocha](https://github.com/mochajs/mocha/issues/2791) from 3.x to 5.x
  - versions prior to 4.x of Mocha dependended on Growl 1.9.2 which contained a [security vulnerability](https://github.com/tj/node-growl/issues/60)
  - as Mocha is a `devDependencies` module, there is no reason to believe that the `dockerfile-utils` module itself was affected by this vulnerability

### Fixed
- fix incorrect validation warning in ARG, ENV, and LABEL instructions caused by quotes being used in variable replacements ([#36](https://github.com/rcjsuen/dockerfile-utils/issues/36))
- fix incorrect validation of tagged images caused by FROM referencing images in a private registry ([#39](https://github.com/rcjsuen/dockerfile-utils/issues/39))
- allow variables to be used in a FROM's base image argument ([#43](https://github.com/rcjsuen/dockerfile-utils/issues/43))
- handle ARG instructions with escaped newlines that lead to an EOF comment ([#44](https://github.com/rcjsuen/dockerfile-utils/issues/44))

## [0.0.9] - 2018-04-16
### Fixed
- do not flag FROM instructions that use variables with an error ([#35](https://github.com/rcjsuen/dockerfile-utils/issues/35))

## [0.0.8] - 2018-04-08
### Added
- warn if hyphens are being parsed as a unit of time in HEALTHCHECK duration flags ([#24](https://github.com/rcjsuen/dockerfile-utils/issues/24))
- warn if two or more decimals found in a unit of time in HEALTHCHECK duration flags ([#25](https://github.com/rcjsuen/dockerfile-utils/issues/25))
- warn if two hyphens are found in HEALTHCHECK duration flags ([#26](https://github.com/rcjsuen/dockerfile-utils/issues/26))
- warn if instruction is written in JSON form incorrectly with single quotes ([#28](https://github.com/rcjsuen/dockerfile-utils/issues/28))
  - `ValidationCode.JSON_IN_SINGLE_QUOTES`
  - `ValidatorSettings.instructionJSONInSingleQuotes`

### Fixed
- fix incorrect validation error if a COPY uses JSON arguments and its last string argument is correctly defined as a folder ([#29](https://github.com/rcjsuen/dockerfile-utils/issues/29))
- fix incorrect validation error if an ADD uses JSON arguments and its last string argument is correctly defined as a folder ([#30](https://github.com/rcjsuen/dockerfile-utils/issues/30))
- skip validation of content after a JSON's closing bracket ([#33](https://github.com/rcjsuen/dockerfile-utils/issues/33))
- fix validation of number of arguments for ADD and COPY instructions written in JSON ([#34](https://github.com/rcjsuen/dockerfile-utils/issues/34))

## [0.0.7] - 2018-03-01
### Fixed
- use a non-zero range for the diagnostic if FROM's base image's digest is the empty string ([#21](https://github.com/rcjsuen/dockerfile-utils/issues/21))
- ignore multiple CMD, ENTRYPOINT, and HEALTHCHECK instructions in a Dockerfile if there is only ever one in a build stage ([#22](https://github.com/rcjsuen/dockerfile-utils/issues/22))
- handle invalid decimal values without a leading zero for duration flags ([#23](https://github.com/rcjsuen/dockerfile-utils/issues/23))

## [0.0.6] - 2018-02-11
### Added
- create a Docker image for running the CLI ([#10](https://github.com/rcjsuen/dockerfile-utils/issues/10))
- create tags for the Docker image that corresponds to the Git commit's SHA hash ([#16](https://github.com/rcjsuen/dockerfile-utils/issues/16))
- warn if COPY has more than two arguments and its last argument is not a directory ([#14](https://github.com/rcjsuen/dockerfile-utils/issues/14))
  - `ValidationCode.INVALID_DESTINATION`
- warn if ADD has more than two arguments and its last argument is not a directory ([#17](https://github.com/rcjsuen/dockerfile-utils/issues/17))
  - `ValidationCode.INVALID_DESTINATION`
- flag durations that include a hyphen as an error ([#18](https://github.com/rcjsuen/dockerfile-utils/issues/18))
- warn if FROM's base image's digest is invalid ([#15](https://github.com/rcjsuen/dockerfile-utils/issues/15))
  - `ValidationCode.INVALID_REFERENCE_FORMAT`
- warn if FROM's base image's tag is invalid ([#20](https://github.com/rcjsuen/dockerfile-utils/issues/20))
  - `ValidationCode.INVALID_REFERENCE_FORMAT`

### Fixed
- warn if STOPSIGNAL uses invalid variables for its argument ([#11](https://github.com/rcjsuen/dockerfile-utils/issues/11))
- allow decimal values for duration flags ([#19](https://github.com/rcjsuen/dockerfile-utils/issues/19))

## [0.0.5] - 2018-01-18
### Added
- warn if COPY's --from flag is invalid ([#9](https://github.com/rcjsuen/dockerfile-utils/issues/9))
  - `ValidationCode.FLAG_INVALID_FROM_VALUE`

### Fixed
- correct import error in the CLI linter ([#8](https://github.com/rcjsuen/dockerfile-utils/issues/8))

## [0.0.4] - 2018-01-17
### Added
- expose ValidationCode enum as an API that may change ([#7](https://github.com/rcjsuen/dockerfile-utils/issues/7))

## [0.0.3] - 2018-01-17
### Added
- create TypeScript typings ([#5](https://github.com/rcjsuen/dockerfile-utils/issues/5))
- add the main field to package.json ([#6](https://github.com/rcjsuen/dockerfile-utils/issues/6))

## [0.0.2] - 2018-01-17
### Fixed
- include final character of the file when printing errors in the linter ([#4](https://github.com/rcjsuen/dockerfile-utils/issues/4))
- change linter to ignore EXPOSE instructions that use ARG variables without a default value ([#3](https://github.com/rcjsuen/dockerfile-utils/issues/3))

## 0.0.1 - 2017-12-22
### Added
- create formatter for Dockerfiles
- create linter for Dockerfiles

[Unreleased]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.2.0...HEAD
[0.2.0]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.16...v0.1.0
[0.0.16]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.15...v0.0.16
[0.0.15]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.14...v0.0.15
[0.0.14]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.13...v0.0.14
[0.0.13]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.12...v0.0.13
[0.0.12]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.11...v0.0.12
[0.0.11]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.10...v0.0.11
[0.0.10]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.9...v0.0.10
[0.0.9]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.8...v0.0.9
[0.0.8]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.7...v0.0.8
[0.0.7]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.6...v0.0.7
[0.0.6]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.5...v0.0.6
[0.0.5]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.4...v0.0.5
[0.0.4]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.3...v0.0.4
[0.0.3]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.0.1...v0.0.2
