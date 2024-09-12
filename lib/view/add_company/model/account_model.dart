import "dart:convert";
import "dart:developer";
import "dart:io";

import "package:android_id/android_id.dart";
import "package:app_tracking_transparency/app_tracking_transparency.dart";
import "package:connectivity_plus/connectivity_plus.dart";
import "package:device_info_plus/device_info_plus.dart";
import "package:flutter/foundation.dart" hide Key;
import "package:hive_flutter/hive_flutter.dart";
import "package:json_annotation/json_annotation.dart";
import "package:kartal/kartal.dart";
import "package:location/location.dart";
import "package:package_info_plus/package_info_plus.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";

import "../../../core/base/model/base_network_mixin.dart";
import "../../../core/init/app_info/app_info.dart";
import "../../../core/init/cache/cache_manager.dart";
import "account_response_model.dart";

part "account_model.g.dart";

@HiveType(typeId: 73)
@JsonSerializable()
class AccountModel with NetworkManagerMixin {
  AccountModel.getValue() {
    init();
    // uyeEmail = CacheManager.getHesapBilgileri?.uyeEmail;
    // uyeSifre = CacheManager.getHesapBilgileri?.uyeSifre;
  }
  static AccountModel instance = AccountModel.getValue();

  static Future<void> setFromAccountResponseModel(AccountResponseModel? model) async {
    instance.uyeEmail = model?.email;
    instance.uyeSifre = model?.parola;
  }

  //setter for instance
  static void setInstance(AccountModel value) => instance = value;

  AccountModel();
  @HiveField(0)
  String? isim;
  @HiveField(1)
  String? admin;
  @HiveField(2)
  int? aktifIsletmeKodu;
  @HiveField(3)
  int? aktifSubeKodu;
  @HiveField(4)
  String? aktifVeritabani;
  @HiveField(5)
  String? cihazSistemVersiyonu;
  @HiveField(6)
  DateTime? apkDerlemeTarihi;
  @HiveField(7)
  String? cihazDili;
  @HiveField(8)
  String? gCid;
  @HiveField(9)
  String? cihazMarkasi;
  @HiveField(10)
  String? cihazKimligi;
  @HiveField(11)
  String? cihazModeli;
  @HiveField(12)
  String? gDsn;
  @HiveField(13)
  String? cihazTarihi;
  @HiveField(14)
  DateTime? cihazTarihiUtc;
  @HiveField(15)
  int? cihazTimeZoneDakika;
  @HiveField(16)
  String? fcmToken;
  @HiveField(17)
  String? uyeEmail;
  @HiveField(18)
  String? uyeSifre;
  @HiveField(19)
  DateTime? konumDate;
  @HiveField(20)
  String? konumTarihi;
  @HiveField(21)
  String? gKa;
  @HiveField(22)
  String? gBo;
  @HiveField(23)
  String? gEn;
  @HiveField(24)
  String? kullaniciAdi;
  @HiveField(25)
  String? kuruluHesaplar;
  @HiveField(26)
  String? localIp;
  @HiveField(27)
  String? ozelCihazKimligi;
  @HiveField(28)
  String? offline;
  @HiveField(29)
  String? simOperator;
  @HiveField(30)
  String? paketAdi;
  @JsonKey(defaultValue: {})
  @HiveField(31)
  Map<String, dynamic>? paramMap;
  @HiveField(32)
  String? platform;
  @HiveField(33)
  int? requestVersion;
  @HiveField(34)
  String? soyadi;
  @HiveField(35)
  String? serviceVersion;
  @HiveField(36)
  String? tzInfo;
  @HiveField(37)
  String? uygulamaDili;
  @HiveField(38)
  String? uygulamaGuncellemeTarihi;
  @HiveField(39)
  String? uygulamaSurumu;
  @HiveField(40)
  int? uygulamaSurumKodu;
  @HiveField(41)
  String? uzakErisim;
  @HiveField(42)
  String? wifidenBagli;
  @HiveField(43)
  String? qrData;
  @HiveField(44)
  bool? debugMu;
  @HiveField(45)
  String? adi;
  @HiveField(46)
  String? wifiAdi;
  @HiveField(47)
  String? debug;
  @HiveField(48)
  DateTime? girisTarihi;
  @HiveField(49)
  DateTime? sonKullanimTarihi;
  @HiveField(50)
  String? onayli;
  @HiveField(51)
  String? konumEnlem;
  @HiveField(52)
  String? konumBoylam;

  final Location location = Location();

  bool get adminMi => admin == "E";

  bool get demoMu => uyeEmail == "demo@netfect.com";

  Future<void> init() async {
    if (isDebug) {
      debugMu = isDebug;
    } else {
      debugMu = null;
    }
    debugMu = null;

    final AccountResponseModel? account = CacheManager.getAccounts(uyeEmail ?? "");
    uzakErisim = CacheManager.getUzaktanMi(account?.firmaKisaAdi) ? "E" : "H";

    //* Uygulama Bilgileri
    ///  [uygulamaSurumu = packageInfo.version;]
    //* olarak değiştirilecek fakat API bu uygulamanın sürümünü kabul etmediği için manuel verdim.
    uygulamaSurumKodu = 229;
    uygulamaSurumu = AppInfoModel.instance.version;
    requestVersion = 1;
    if (kIsWeb) {
      paketAdi = "com.bracket23.picker";
    } else {
      paketAdi = (await PackageInfo.fromPlatform()).packageName;
    }
    log(toJson().toString(), name: runtimeType.toString());
    //* Network Bilgileri (Connectivity Plus)
    offline = "H";
    // print(aesEncrypt("saldkfjas"));
    if (kIsWeb) {
      platform = "web";
    } else {
      platform = Platform.operatingSystem;
      final list = await NetworkInterface.list(
        includeLoopback: true,
        type: InternetAddressType.IPv4,
        includeLinkLocal: true,
      );
      for (final interface in list) {
        for (var i = 0; i < interface.addresses.length; i++) {
          if (interface.addresses[i].address != "") {
            localIp = interface.addresses[i].address;
          }
        }
      }
    }
    konumDate = DateTime.now();
    konumTarihi = getKonumTarihi;
    uygulamaGuncellemeTarihi = DateTime.now().toDateTimeString();
    if (kIsWeb) {
      wifidenBagli = "E";
    } else if ((await Connectivity().checkConnectivity()).firstOrNull == ConnectivityResult.wifi) {
      wifidenBagli = "E";
    } else {
      wifidenBagli = "H";
    }

    cihazTimeZoneDakika = DateTime.now().timeZoneOffset.inMinutes;
    //* Cihaz ve Sim Bilgileri
    uygulamaDili = "tr";
    // cihazDili = Get.locale?.languageCode ?? "tr";
    cihazDili = "tr";
    cihazSistemVersiyonu = "20";
    cihazTarihi = getKonumTarihi;
    cihazTarihiUtc = DateTime.now().toUtc();
    final deviceInfo = DeviceInfoPlugin();
    //!WEB
    if (kIsWeb) {
      platform = "web";
      if (kDebugMode) {
        cihazKimligi = "bty_debug";
      } else {
        cihazKimligi = CacheManager.instance.getWebCihazKimligi;
      }
    } //! ANDROID
    else if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      cihazSistemVersiyonu = androidInfo.version.sdkInt.toString();
      cihazMarkasi = androidInfo.brand;
      cihazModeli = androidInfo.model;
      //? Cihaz kimliği için android_id kullanıyoruz. Tarih: 28/09/2023 1.1.7 Sürümünde değiştirildi.
      //* eski hali --------> ozelCihazKimligi = androidInfo.id;
      const androidIdPlugin = AndroidId();
      final String? androidId = await androidIdPlugin.getId();
      ozelCihazKimligi = androidId;
      if (ozelCihazKimligi.ext.isNotNullOrNoEmpty) {
        cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
        log("ozelCihazKimligi: ${base64Encode(utf8.encode(ozelCihazKimligi!))}");
      } else {
        cihazKimligi = base64Encode(
          utf8.encode("$cihazMarkasi:$cihazModeli:${androidInfo.serialNumber}:"),
        );
      }
      // androidInfo.serialNumber;
    }
    //! IOS
    else if (Platform.isIOS) {
      // while (await AppTrackingTransparency.trackingAuthorizationStatus != TrackingStatus.authorized) {
      final iosInfo = await deviceInfo.iosInfo;
      cihazSistemVersiyonu = iosInfo.systemVersion.split(".").first;
      cihazMarkasi = iosInfo.name;
      cihazModeli = iosInfo.utsname.machine;
      ozelCihazKimligi = iosInfo.identifierForVendor;
      cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
      await Future.delayed(const Duration(seconds: 1));
      await AppTrackingTransparency.requestTrackingAuthorization();
      // }
    }
    //!DESKTOP
    else if (Platform.isWindows) {
      platform = Platform.operatingSystem;
      final desktopInfo = await deviceInfo.windowsInfo;
      cihazSistemVersiyonu = Platform.operatingSystemVersion;
      cihazMarkasi = desktopInfo.productName;
      cihazModeli = desktopInfo.productId;
      if (ozelCihazKimligi.ext.isNotNullOrNoEmpty) {
        cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
        log("ozelCihazKimligi: ${base64Encode(utf8.encode(ozelCihazKimligi!))}");
      } else {
        //* Bilgisayar adını gönderiyoruz. Bilgisayar adı aynı olduğunda ağda problem olacağı için böyle yapıyoruz.
        ozelCihazKimligi = base64Encode(utf8.encode("win_${desktopInfo.computerName}"));
        cihazKimligi = ozelCihazKimligi;
      }
    } else if (Platform.isMacOS) {
      platform = Platform.operatingSystem;
      final desktopInfo = await deviceInfo.macOsInfo;
      cihazSistemVersiyonu = Platform.operatingSystemVersion;
      cihazMarkasi = desktopInfo.computerName;
      cihazModeli = desktopInfo.model;
      if (ozelCihazKimligi.ext.isNotNullOrNoEmpty) {
        cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
        log("ozelCihazKimligi: ${base64Encode(utf8.encode(ozelCihazKimligi!))}");
      }
    } else if (Platform.isLinux) {
      platform = Platform.operatingSystem;
      final desktopInfo = await deviceInfo.linuxInfo;
      cihazSistemVersiyonu = Platform.operatingSystemVersion;
      cihazMarkasi = desktopInfo.name;
      cihazModeli = desktopInfo.prettyName;
      if (ozelCihazKimligi.ext.isNotNullOrNoEmpty) {
        cihazKimligi = base64Encode(utf8.encode(ozelCihazKimligi.toString()));
        log("ozelCihazKimligi: ${base64Encode(utf8.encode(ozelCihazKimligi!))}");
      } else {
        ozelCihazKimligi = base64Encode(utf8.encode("linux_${desktopInfo.name}"));
        cihazKimligi = ozelCihazKimligi;
      }
    }
    kuruluHesaplar = CacheManager.accountsBox.values.map((e) => (e as AccountResponseModel).email).join(";");
  }

  String get getKonumTarihi => DateTime.now().toDateTimeString() ?? "";

  bool get isDebug =>
      CacheManager.accountsBox.values.any(
        (element) => (element as AccountResponseModel?)?.email == "destek@netfect.com",
      ) ||
      kDebugMode;

  @override
  AccountModel fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AccountModelToJson(this);

  Future<String?> getLocation() async {
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return "Eğer konum işlemlerine ulaşmak isterseniz 'Uygulama Ayarları' üzerinden konumu aktifleştirmeniz gerekmektedir.";
      }
    }
    locationData = await location.getLocation();
    log(locationData.toString());
    return null;
    // instance.gk
  }
}
//   String aesEncrypt(String text) {
//     // final result = decrypt(
//     //   Uint8List.fromList(text.codeUnits),
//     //   Uint8List.fromList("{N???tF???ctBr@ck???t_123654**-/?Br@ck???tT???kn0l0ji=\$&()??}".codeUnits),
//     //   IV.fromLength(16).bytes,
//     // );
//     try {
//       final key = Key.fromUtf8("{N???tF???ctBr@ck???t_123654**-/?Br@ck???tT???kn0l0ji=\$&()??}");

//       final iv = IV.fromLength(16);

//       final encrypter = Encrypter(AES(key, mode: AESMode.cbc, padding: "PKCS7"));

//       final encrypted = encrypter.encrypt(text, iv: iv);

//       return encrypted.base64;
//     } on Exception catch (e) {
//       // TODO
//       return e.toString();
//     }
//   }

//   static Uint8List decrypt(Uint8List ciphertext, Uint8List key, Uint8List iv) {
//     final CBCBlockCipher cipher = CBCBlockCipher(AESEngine());
//     final ParametersWithIV<KeyParameter> params = ParametersWithIV<KeyParameter>(KeyParameter(key), iv);
//     final PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null> paddingParams = PaddedBlockCipherParameters<ParametersWithIV<KeyParameter>, Null>(params, null);
//     final PaddedBlockCipherImpl paddingCipher = PaddedBlockCipherImpl(PKCS7Padding(), cipher);
//     paddingCipher.init(false, paddingParams);
//     return paddingCipher.process(ciphertext);
//   }

//   static Uint8List generateKey(Uint8List salt, Uint8List passphrase) {
//     final KeyDerivator derivator = PBKDF2KeyDerivator(HMac(SHA1Digest(), 64));
//     final Pbkdf2Parameters params = Pbkdf2Parameters(salt, 5, 16);
//     derivator.init(params);
//     return derivator.process(passphrase);
//   }

//   String getAesKey() => (() {
//         int t;
//         final buf = List<int>.filled(61, 0);

//         t = -817074313;
//         buf[0] = t >> 5;
//         t = 504536449;
//         buf[1] = t >> 9;
//         t = -241918;
//         buf[2] = t >> 13;
//         t = -2053619;
//         buf[3] = t >> 14;
//         t = -343897;
//         buf[4] = t >> 12;
//         t = 1959542227;
//         buf[5] = t >> 24;
//         t = -1822352597;
//         buf[6] = t >> 10;
//         t = -61702648;
//         buf[7] = t >> 21;
//         t = -131138934;
//         buf[8] = t >> 20;
//         t = -43778766;
//         buf[9] = t >> 19;
//         t = -1218471685;
//         buf[10] = t >> 6;
//         t = -1169818100;
//         buf[11] = t >> 23;
//         t = 1394970807;
//         buf[12] = t >> 6;
//         t = 105700244;
//         buf[13] = t >> 3;
//         t = -207675268;
//         buf[14] = t >> 7;
//         t = 990694175;
//         buf[15] = t >> 3;
//         t = 1335555854;
//         buf[16] = t >> 14;
//         t = -940;
//         buf[17] = t >> 5;
//         t = -1024514;
//         buf[18] = t >> 13;
//         t = -170162;
//         buf[19] = t >> 11;
//         t = 839504750;
//         buf[20] = t >> 10;
//         t = 402403039;
//         buf[21] = t >> 22;
//         t = -2121385325;
//         buf[22] = t >> 19;
//         t = 91697754;
//         buf[23] = t >> 8;
//         t = 741561788;
//         buf[24] = t >> 16;
//         t = 1724206056;
//         buf[25] = t >> 21;
//         t = 1671651219;
//         buf[26] = t >> 12;
//         t = 437659142;
//         buf[27] = t >> 23;
//         t = 219829411;
//         buf[28] = t >> 9;
//         t = 1425737036;
//         buf[29] = t >> 5;
//         t = -869408486;
//         buf[30] = t >> 16;
//         t = -1037107022;
//         buf[31] = t >> 16;
//         t = 350289615;
//         buf[32] = t >> 10;
//         t = 2013583627;
//         buf[33] = t >> 2;
//         t = -1668771963;
//         buf[34] = t >> 22;
//         t = 570685603;
//         buf[35] = t >> 19;
//         t = -1704733839;
//         buf[36] = t >> 16;
//         t = -824735594;
//         buf[37] = t >> 17;
//         t = -14855;
//         buf[38] = t >> 9;
//         t = -256896;
//         buf[39] = t >> 11;
//         t = -42818;
//         buf[40] = t >> 9;
//         t = -640452821;
//         buf[41] = t >> 18;
//         t = -720900900;
//         buf[42] = t >> 22;
//         t = -937;
//         buf[43] = t >> 5;
//         t = -1050808720;
//         buf[44] = t >> 23;
//         t = -701528227;
//         buf[45] = t >> 23;
//         t = -1641635114;
//         buf[46] = t >> 1;
//         t = -815548650;
//         buf[47] = t >> 7;
//         t = -966389181;
//         buf[48] = t >> 13;
//         t = -604584708;
//         buf[49] = t >> 12;
//         t = 808109569;
//         buf[50] = t >> 5;
//         t = -912567662;
//         buf[51] = t >> 11;
//         t = -335226669;
//         buf[52] = t >> 1;
//         t = -1706076159;
//         buf[53] = t >> 14;
//         t = 1897990053;
//         buf[54] = t >> 19;
//         t = -527355389;
//         buf[55] = t >> 11;
//         t = -515617193;
//         buf[56] = t >> 19;
//         t = 449448516;
//         buf[57] = t >> 6;
//         t = -1611890403;
//         buf[58] = t >> 23;
//         t = -1516162058;
//         buf[59] = t >> 4;
//         t = -926598666;
//         buf[60] = t >> 2;
//         log(buf.toString());
//         return base64Encode(buf);
//       })();
// }
