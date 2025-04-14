import Firebase
import Flutter
import GoogleMaps
import UIKit
import PDFKit
import CoreGraphics
import ExternalAccessory

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    FirebaseApp.configure()  //add this before the code below
    let controller = window?.rootViewController as! FlutterViewController
    let sewooPrinter: SewooImpl = SewooImpl()
    SewooSetup.setUp(
      binaryMessenger: controller.binaryMessenger, api: sewooPrinter, messageChannelSuffix: "")

    GeneratedPluginRegistrant.register(with: self)
    GMSServices.provideAPIKey("AIzaSyDDAPReFfEFdFjBNnDnZcJJzsC84ChaVsY")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

class SewooImpl: Sewoo {
    
    let escpPrinter = ESCPOSPrinter()
    
    func openPort() -> Bool {
        var errCode: Int = 0
        errCode = escpPrinter.reopenPort("bluetooth", withPortParam: 9100)
        if errCode >= 0 {
            NSLog("Bağlandı")
        } else {
            NSLog("Bağlanamadı")
        }
        return errCode >= 0
    }
    
    func closePort() -> Bool {
        return true
    }
    
    func printText(text: String,
                   completion: @escaping (Result<Bool, any Error>) -> Void) {
        let barCodeData: String = "1234567890"
        NSLog("Pigeon iOS: \(text)")
        checkConnectedAccessories()
        escpPrinter.print("CODE128\r\n")
        escpPrinter.printBarCode(
            barCodeData, withSymbology: BCS_CODE128, withHeight: 70, withWidth: BCS_3WIDTH,
            withAlignment: ALIGNMENT_CENTER, withHRI: HRI_TEXT_BELOW)
        completion(.success(true))
    }
    
    func printImage(image: FlutterStandardTypedData,width: Int64,
                    height: Int64,  completion: @escaping (Result<Bool, Error>) -> Void) {
        
        let byteData = image.data
        
        if let img = UIImage(data: byteData) {
            escpPrinter.print(img, withAlignment: 1, withSize: Int32(width/height), withBrightness: 1)
            completion(.success(true))
        } else {
            // UIImage oluşturulamadı
            completion(.failure(NSError(domain: "ImageConversionError", code: 0, userInfo: nil)))
        }
    }
    
    func printPDF(
        pdfData: FlutterStandardTypedData,
        width: Int64,
        height: Int64,
        completion: @escaping (Result<Bool, any Error>) -> Void
    ) {
        
        if let img = pdfToImage(from: pdfData, pageNumber: 1) {
            escpPrinter
                .print(
                    img,
                    withAlignment: 3,
                    withSize: Int32(width/height),
                    withBrightness: 0
                )
            
            completion(.success(true))
        }
    }
    func pdfToImage(from pdfData: FlutterStandardTypedData, pageNumber: Int) -> UIImage? {
        guard let pdfDocument = PDFDocument(data: pdfData.data),
              let page = pdfDocument.page(at: pageNumber - 1) else {
            return nil
        }
        
        let pageSize = page.bounds(for: .mediaBox)
        let renderer = UIGraphicsImageRenderer(size: pageSize.size)
        
        let image = renderer.image { context in
            context.cgContext.translateBy(x: 0, y: pageSize.size.height)
            context.cgContext.scaleBy(x: 1, y: -1)
            page.draw(with: .mediaBox, to: context.cgContext) // Düzeltilmiş satır
        }
        
        return image
    }
    
    func checkConnectedAccessories() -> PrinterList? {
        guard let protocols = Bundle.main.infoDictionary?["UISupportedExternalAccessoryProtocols"] as? [String] else {
            print("UISupportedExternalAccessoryProtocols bulunamadı veya geçersiz.")
            return nil
        }
        let checkStatus = escpPrinter.checkStatus()
        let printerSts = escpPrinter.printerSts()
        let connectedAccessories = EAAccessoryManager.shared().connectedAccessories
        var matchingAccessories: PrinterList = PrinterList(printers: [])

        for accessory in connectedAccessories {
            for protocolString in accessory.protocolStrings {
                if protocols.contains(protocolString) {
                    matchingAccessories.printers
                        .append(
                            PrinterDetails(
                                connected: accessory.isConnected,
                                connectionID: Int64(accessory.connectionID),
                                name: accessory.name,
                                modelNumber: accessory.modelNumber,
                                serialNumber: accessory.serialNumber,
                                width: nil,
                                height: nil
                            )
                        )
                    break // Bir eşleşme bulunduğunda, aynı aksesuarı birden çok kez eklememek için döngüden çıkın
                }
            }
        }
        return matchingAccessories
    }
    
    func portController() -> Bool {
        return false
    }
}
