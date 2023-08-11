// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {
	func betaLane() {
	desc("Push a new beta build to TestFlight")
		print("betaLane")	
		incrementBuildNumber(xcodeproj: "Runner.xcodeproj")
		build_app(
			skip_build_archive: true,
			archive_path: "../build/ios/archive/Runner.xcarchive");
		uploadToTestflight(username: "bracket.teknoloji.apple@gmail.com")
	}
}
