import UIKit
import Flutter
import Firebase
import GoogleMaps



@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
FirebaseApp.configure() //add this before the code below

    GMSServices.provideAPIKey("AIzaSyA2mtSYQ-a6C3u_5fTr4xkMk6Ivv3qaDDo")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
