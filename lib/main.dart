import "dart:developer";

import "package:app_tracking_transparency/app_tracking_transparency.dart";
import "package:easy_localization/easy_localization.dart";
import "package:firebase_app_check/firebase_app_check.dart";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

import "app/picker_app.dart";
import "core/init/app_info/app_info.dart";
import "core/init/cache/cache_manager.dart";
import "core/init/dependency_injection/network_dependency_injection.dart";
import "core/init/platform_implementations.dart"
    if (dart.library.js_interop) "package:picker/core/init/web/url_creator.dart";
import "firebase_options.dart";
// import "generated/codegen_loader.g.dart";
import "view/add_company/model/account_model.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.instance.initHiveBoxes();
  //* AccountModel'i splashAuthView'da init ediyoruz.
  // await AccountModel.instance.init();
  //* Firebase Crashlytics
  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) async {
    await firebaseInitialized();
    await EasyLocalization.ensureInitialized();
  });

  if (kIsWeb) {
    setUrl();
  } else {
    //* Screen Orientation
    await SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }
  runApp(const PickerApp());
  //* Network Dependency Injection (Uygulamanın internet bağlantısı olup olmadığını kontrol ediyoruz.)
  NetworkDependencyInjection.init();
}

Future<void> firebaseInitialized() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform, name: "flutter-picker");
  await FirebaseAppCheck.instance.activate(
    // webProvider: ReCaptchaV3Provider("recaptcha-v3-site-key"),
    appleProvider: AppleProvider.appAttest,
  );
  final FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission();
  await messaging.setAutoInitEnabled(true);
  AccountModel.instance.fcmToken = await messaging.getToken(
    vapidKey:
        !kIsWeb ? null : "BI5k1LDDt7zt4u57TwYvprSQ5p4KGOeMysQkIvi2yds00wuPaTNPg641os6uLOKxMmvGw14PekF92Jv-pl0qLvE",
  );
  log("fcmToken: ${AccountModel.instance.fcmToken}");
  if (kIsWeb || await AppTrackingTransparency.requestTrackingAuthorization() == TrackingStatus.authorized) {
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    // messaging.
    await FirebaseCrashlytics.instance.setUserIdentifier(AccountModel.instance.ozelCihazKimligi ?? "");
    FlutterError.onError = (errorDetails) => FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    PlatformDispatcher.instance.onError = (error, stack) {
      AccountModel.instance.toJson().forEach(
        (key, value) => value != null ? FirebaseCrashlytics.instance.setCustomKey(key, value) : null,
      );
      FirebaseCrashlytics.instance.setCustomKey("new version", AppInfoModel.instance.version ?? "");
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
