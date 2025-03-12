import Firebase
import Flutter
import GoogleMaps
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()  //add this before the code below
    GeneratedPluginRegistrant.register(with: self)
    let controller = window?.rootViewController as! FlutterViewController
    SewooSetup.setUp(
      binaryMessenger: controller.binaryMessenger, api: SewooPrinter(),
      messageChannelSuffix: "SEWOO")
    let sewooPrinter: SewooPrinter = SewooPrinter()
    sewooPrinter.printText(text: "deneme") { result in
      print(result)
    }
    GMSServices.provideAPIKey("AIzaSyDDAPReFfEFdFjBNnDnZcJJzsC84ChaVsY")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

class SewooPrinter: Sewoo {
  func printText(text: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
    print(text)
    completion(.success(true))

  }

}
