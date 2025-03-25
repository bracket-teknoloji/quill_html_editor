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
 
  let escpPrinter = ESCPOSPrinter()
    
    func openPort() -> Bool {
        var errCode: Int = 0
        errCode = escpPrinter.openPort("bluetooth", withPortParam: 9100)
        if(errCode >= 0)
        {
            NSLog("Bağlandı")
        }
        else
        {
            NSLog("Bağlanamadı")
        }
        return errCode >= 0
    }
    
    func closePort() -> Bool {
      return true
    }

  func printText(text: String, completion: @escaping (Result<Bool, any Error>) -> Void) {
    let barCodeData: String = "1234567890"
     NSLog("Pigeon iOS: \(text)")
  
    escpPrinter.print("CODE128\r\n")
    escpPrinter.printBarCode(
      barCodeData, withSymbology: BCS_CODE128, withHeight: 70, withWidth: BCS_3WIDTH,
      withAlignment: ALIGNMENT_CENTER, withHRI: HRI_TEXT_BELOW)
    completion(.success(true))
  }
    
    
  func printImage(image: [Int64], completion: @escaping (Result<Bool, Error>) -> Void) {
    let byteData = Data(bytes: image, count: image.count * MemoryLayout<Int64>.size)

      if UIImage(data: byteData) != nil {

      completion(.success(true))
    } else {
      // UIImage oluşturulamadı
      completion(.failure(NSError(domain: "ImageConversionError", code: 0, userInfo: nil)))
    }
  }
    
    func printPDF(
        pdfData: [Int64],
        width: Int64,
        height: Int64,
        completion: @escaping (Result<Bool, any Error>) -> Void
    ) {
        var byteData = Data()
            for int in pdfData {
                var value = int
                let byteArray = withUnsafeBytes(of: &value) { Data($0) }
                byteData.append(byteArray)
            }
        if let img = UIImage(data: byteData) {
            escpPrinter.print(img, withAlignment:1, withSize:1,withBrightness:1)
            
            completion(.success(true))
        }
    }
}
