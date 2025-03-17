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
    let controller = window?.rootViewController as! FlutterViewController
    let sewooPrinter: SewooPrinter = SewooPrinter()
    SewooSetup.setUp(
      binaryMessenger: controller.binaryMessenger, api: sewooPrinter, messageChannelSuffix: "")

    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyDDAPReFfEFdFjBNnDnZcJJzsC84ChaVsY")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

class SewooPrinter: Sewoo {
    
    let eplPrinter = EPLPrinter()
    
    var media_type:Int32 = LK_EPL_BLACKMARK
    
  func printText(text: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
    NSLog("Pigeon iOS: \(text)")
      eplPrinter.openPort("bluetooth", withPortParam: 9100)
      eplPrinter.setupPrinter("104", withHeight:"152", withMedia:media_type, withGapHeight:"3", withOffset:"0", withDensity:8, withSpeed:6, withRotate180:0, withCutMode:0)

      eplPrinter.printDeviceFont(400, withY:400, withRotation:0, withFontNumber:3, withHoriExpand:1, withVertExpand:1, withReverse:0, withData: text)
      eplPrinter.endPage(1)
      eplPrinter.closePort()
      completion(.success(true))
  }
    func printImage(image: [Int64], completion: @escaping (Result<Bool, Error>) -> Void) {
        let byteData = Data(bytes: image, count: image.count * MemoryLayout<Int64>.size)

            if let uiImage = UIImage(data: byteData) {
                eplPrinter.openPort("bluetooth", withPortParam: 9100)
                eplPrinter.setupPrinter("104", withHeight:"152", withMedia:media_type, withGapHeight:"3", withOffset:"0", withDensity:8, withSpeed:6, withRotate180:0, withCutMode:0)

                eplPrinter.print(
                        uiImage,
                        withPrintX:0,
                        withPrintY:0,
                        withBrightness:1
                    )
                eplPrinter.endPage(1)
                completion(.success(true))
            } else {
                // UIImage oluşturulamadı
                completion(.failure(NSError(domain: "ImageConversionError", code: 0, userInfo: nil)))
            }
    }
}
