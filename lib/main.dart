import "dart:io";
import "dart:ui";

import "package:firebase_core/firebase_core.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/fiyat_gecmisi/view/fiyat_gecmisi_view.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/fiyat_gor/view/fiyat_gor_view.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

import "core/init/app_info/app_info.dart";
import "core/init/cache/cache_manager.dart";
import "core/init/dependency_injection/network_dependency_injection.dart";
import "core/init/theme/app_theme_dark.dart";
import "firebase_options.dart";
import "view/add_company/model/account_model.dart";
import "view/add_company/view/add_account_view.dart";
import "view/add_company/view/company_page.dart";
import "view/add_company/view/qr_view.dart";
import 'view/auth/view/entry_company_view.dart';
import "view/auth/view/login_view.dart";
import "view/main_page/alt_sayfalar/cari/base_cari_edit/view/base_cari_edit_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_hareket_yeni_kayit/view/cari_hareket_yeni_kayit_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_hareketleri/view/cari_hareketleri_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_listesi/view/cari_listesi_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/cari_dovizli_ekstre/view/cari_dovizli_ekstre_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/cari_ekstre/view/cari_ekstre_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/cari_hareket_raporu/view/cari_hareket_raporu_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/cari_stok_satis_ozeti/view/cari_stok_satis_ozeti_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/doviz_bakiye_raporu/view/doviz_bakiye_raporu_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/hareket_detayli_yapilandirma_raporu/view/hareket_detayli_yapilandirma_raporu_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/stok_ekstre/view/stok_ekstre_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/yaslandirma_raporu/view/yaslandirma_raporu_view.dart";
import "view/main_page/alt_sayfalar/serbest_raporlar/view/serbest_raporlar_view.dart";
import "view/main_page/alt_sayfalar/stok/base_stok_edit/view/base_stok_edit_view.dart";
import "view/main_page/alt_sayfalar/stok/raporlar/ambar_maliyet_raporu/view/ambar_maliyet_raporu_view.dart";
import "view/main_page/alt_sayfalar/stok/raporlar/lokal_depo_bakiye_raporu/view/lokal_depo_bakiye_raporu_view.dart";
import "view/main_page/alt_sayfalar/stok/raporlar/urun_grubuna_gore_satis_grafigi/view/urun_grubuna_gore_satis_grafigi_view.dart";
import 'view/main_page/alt_sayfalar/stok/stok_hareketleri/view/stok_hareketleri_view.dart';
import "view/main_page/alt_sayfalar/stok/stok_liste/view/stok_listesi_view.dart";
import "view/main_page/alt_sayfalar/stok/stok_yeni_kayit/view/stok_yeni_kayit_view.dart";
import "view/main_page/alt_sayfalar/temsilci_profil/view/temsilci_profil_view.dart";
import "view/main_page/view/main_page_view.dart";
import "view/splash_auth/view/splash_auth_view.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.instance.initHiveBoxes();
  await AppInfoModel.instance.init();
  //* AccountModel'i splashAuthView'da init ediyoruz.
    // await AccountModel.instance.init();
  //* Firebase Crashlytics
  await firebaseInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.landscapeLeft,
  ]).then((_) async {
    runApp(const MyApp());
    NetworkDependencyInjection.init();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      color: Colors.amber,
      popGesture: true,
      debugShowCheckedModeBanner: false,
      opaqueRoute: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse, PointerDeviceKind.stylus, PointerDeviceKind.unknown}),
      darkTheme: AppThemeDark.instance?.theme,
      themeMode: ThemeMode.dark,
      locale: Get.deviceLocale,
      title: "Picker",
      home: const SplashAuthView(),
      getPages: [
        GetPage(name: "/login", page: () => const LoginView()),
        GetPage(name: "/entryCompany", page: () => const EntryCompanyView()),
        GetPage(
          name: "/mainPage",
          page: () => const MainPageView(),
          children: [
            //* Cari
            GetPage(name: "/cariListesi", page: () => CariListesiView(isGetData: Get.arguments)),
            // GetPage(name: "/cariAktivite", page: () => const CariAktiviteView()),
            GetPage(name: "/cariEdit", page: () => BaseCariEditingView(model: Get.arguments)),
            GetPage(name: "/cariHareketleri", page: () => CariHareketleriView(cari: Get.arguments)),
            GetPage(name: "/cariYeniKayit", page: () => CariYeniKayitView(model: Get.arguments)),

            //* Cari Raporları
            GetPage(name: "/cariEkstre", page: () => CariEkstreView(model: Get.arguments)),
            GetPage(name: "/cariDovizliEkstre", page: () => CariDovizliEkstreView(model: Get.arguments)),
            GetPage(name: "/cariStokEkstre", page: () => StokEkstreView(model: Get.arguments)),
            GetPage(name: "/cariYaslandirmaRaporu", page: () => YaslandirmaRaporuView(model: Get.arguments)),
            GetPage(name: "/cariDovizBakiyeRaporu", page: () => DovizBakiyeRaporuView(model: Get.arguments)),
            GetPage(name: "/cariHareketRaporu", page: () => CariHareketRaporuView(model: Get.arguments)),
            GetPage(name: "/cariHareketDetayliYaslandirmaRaporu", page: () => HareketDetayliYaslandirmaRaporuView(model: Get.arguments)),
            GetPage(name: "/cariStokSatisOzeti", page: () => CariStokSatisOzetiView(model: Get.arguments)),

            //* Stok
            GetPage(name: "/stokListesi", page: () => StokListesiView(isGetData: Get.arguments)),
            GetPage(name: "/stokFiyatGor", page: () => const FiyatGorView()),
            GetPage(name: "/stokFiyatGecmisi", page: () => const FiyatGecmisiView()),

            GetPage(name: "/stokEdit", page: () => BaseStokEditingView(model: Get.arguments)),
            GetPage(
              name: "/stokHareketleri",
              page: () => StokHareketleriView(
                  model: Get.arguments is StokListesiModel ? Get.arguments : null,
                  stokKodu: Get.arguments is String ? Get.arguments : null,
                  cariModel: Get.arguments is CariListesiModel ? Get.arguments : null),
            ),
            // page: () => StokHareketleriView(model: Get.arguments is StokHareketleriModel ? Get.arguments : null, stokKodu: Get.arguments is String ? Get.arguments : null)),
            GetPage(name: "/stokYeniKayit", page: () => StokYeniKayitView(model: Get.arguments)),

            //* Stok Raporları
            GetPage(name: "/stokAmbarMaliyetRaporu", page: () => AmbarMaliyetRaporuView(model: Get.arguments)),
            GetPage(name: "/stokLokalDepoBakiyeRaporu", page: () => LokalDepoBakiyeRaporuView(model: Get.arguments)),
            GetPage(name: "/urunGrubunaGoreSatisGrafigi", page: () => UrunGrubunaGoreSatisGrafigiView(model: Get.arguments)),

            //* Profil
            GetPage(name: "/temsilciProfil", page: () => const TemsilciProfilView()),

            //* Serbest Raporlar
            //*
            GetPage(name: "/serbestRaporlar", page: () => SerbestRaporlarView(dizaynList: Get.arguments)),
          ],
        ),
        GetPage(name: "/addCompany", page: () => const AccountsView()),
        GetPage(name: "/addAccount", page: () => const AddAccountView()),
        GetPage(name: "/qr", page: () => const QRScannerView()),
      ],
    );
  }
}

Future<void> firebaseInitialized() async {
  if (kIsWeb) return;
  if (!Platform.isWindows) {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    FirebaseCrashlytics.instance.setUserIdentifier(AccountModel.instance.ozelCihazKimligi ?? "");
    FlutterError.onError = (errorDetails) => FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    PlatformDispatcher.instance.onError = (error, stack) {
      AccountModel.instance.toJson().forEach((key, value) => value != null ? FirebaseCrashlytics.instance.setCustomKey(key, value) : null);
      FirebaseCrashlytics.instance.setCustomKey("new version", AppInfoModel.instance.version ?? "");
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
