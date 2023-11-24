#<span style="color: rgb(189, 61, 23)">Fastlane Integration</span>

This README provides information about the Fastlane lane `prepare_for_build`.

## Prerequisites
- Fastlane should be installed and up to date. If not, run `update_fastlane` to update Fastlane to the latest version.

## Description
The `prepare_for_build` lane is used to push code and tag to remote for Codemagic build.

## Steps
1. The latest build number will be incremented.
2. The latest version number will be incremented.
3. The build number will be incremented.
4. If the Git tag already exists, it will be deleted and recreated.
5. The Git tag will be added.
6. The code will be pushed to the remote repository.
7. The Git tag will be pushed to the remote repository.

## Usage
To use the `prepare_for_build` lane, follow these steps:
1. Open the terminal and navigate to the project directory.
2. Run the following command:
    ```
    fastlane prepare_for_build
    ```

Note: Make sure to replace `Runner.xcodeproj` with the correct path to your Xcode project.

## License
This Fastlane lane is licensed under the [MIT License](https://opensource.org/licenses/MIT).
