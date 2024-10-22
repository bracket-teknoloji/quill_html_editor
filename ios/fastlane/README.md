fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios toCrashlytics

```sh
[bundle exec] fastlane ios toCrashlytics
```

Upload symbols to Crashlytics

### ios toTestFlight

```sh
[bundle exec] fastlane ios toTestFlight
```

Upload to TestFlight

### ios increaseBuildNumber

```sh
[bundle exec] fastlane ios increaseBuildNumber
```

update build number

### ios prepare_for_build

```sh
[bundle exec] fastlane ios prepare_for_build
```

Push code and tag to remote for Codemagic build

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
