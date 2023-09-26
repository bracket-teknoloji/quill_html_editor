import "dart:io";
import "dart:ui";

import "package:app_tracking_transparency/app_tracking_transparency.dart";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:get/get.dart";
import "package:picker/core/base/view/cari_rehberi/view/cari_rehberi_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/view/kasa_dekontlar_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_listesi/view/kasa_listesi_view.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_widget_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/yazdir/view/stok_yazdir_view.dart";

import "core/base/view/doviz_kurlari/view/doviz_kurlari_view.dart";
import "core/base/view/kalem_ekle/model/kalem_ekle_model.dart";
import "core/base/view/kalem_ekle/view/kalem_ekle_view.dart";
import "core/base/view/qr/view/qr_view.dart";
import "core/base/view/stok_rehberi/view/stok_rehberi_view.dart";
import "core/base/view/yapilandirma_rehberi/view/yapilandirma_rehberi_view.dart";
import "core/constants/enum/siparis_tipi_enum.dart";
import "core/init/app_info/app_info.dart";
import "core/init/cache/cache_manager.dart";
import "core/init/dependency_injection/network_dependency_injection.dart";
import "core/init/theme/app_theme_dark.dart";
import "firebase_options.dart";
import "view/add_company/model/account_model.dart";
import "view/add_company/view/add_account_view.dart";
import "view/add_company/view/company_page.dart";
import "view/auth/login/view/login_view.dart";
import "view/auth/view/entry_company_view.dart";
import "view/main_page/alt_sayfalar/cari/base_cari_edit/view/base_cari_edit_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_hareket_yeni_kayit/view/cari_hareket_yeni_kayit_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_hareketleri/view/cari_hareketleri_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
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
import "view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "view/main_page/alt_sayfalar/siparis/base_siparis_edit/view/base_siparis_edit_view.dart";
import "view/main_page/alt_sayfalar/siparis/raporlar/siparis_karlilik_raporu/view/siparis_karlilik_raporu_view.dart";
import "view/main_page/alt_sayfalar/siparis/raporlar/siparis_musteri_siparisi_durum_raporu/view/siparis_durum_raporu_view.dart";
import "view/main_page/alt_sayfalar/siparis/raporlar/siparis_stok_ihtiyac_raporu/view/stok_ihtiyac_raporu_view.dart";
import "view/main_page/alt_sayfalar/siparis/raporlar/siparis_teslim_raporu/view/siparis_teslim_raporu_view.dart";
import "view/main_page/alt_sayfalar/siparis/siparisler/view/siparisler_view.dart";
import "view/main_page/alt_sayfalar/stok/base_stok_edit/view/base_stok_edit_view.dart";
import "view/main_page/alt_sayfalar/stok/fiyat_gecmisi/view/fiyat_gecmisi_view.dart";
import "view/main_page/alt_sayfalar/stok/fiyat_gor/view/fiyat_gor_view.dart";
import "view/main_page/alt_sayfalar/stok/raporlar/ambar_maliyet_raporu/view/ambar_maliyet_raporu_view.dart";
import "view/main_page/alt_sayfalar/stok/raporlar/lokal_depo_bakiye_raporu/view/lokal_depo_bakiye_raporu_view.dart";
import "view/main_page/alt_sayfalar/stok/raporlar/urun_grubuna_gore_satis_grafigi/view/urun_grubuna_gore_satis_grafigi_view.dart";
import "view/main_page/alt_sayfalar/stok/stok_hareketleri/view/stok_hareketleri_view.dart";
import "view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "view/main_page/alt_sayfalar/stok/stok_liste/view/stok_listesi_view.dart";
import "view/main_page/alt_sayfalar/stok/stok_yeni_kayit/view/stok_yeni_kayit_view.dart";
import "view/main_page/alt_sayfalar/temsilci_profil/view/temsilci_profil_view.dart";
import "view/main_page/model/param_model.dart";
import "view/main_page/view/main_page_view.dart";
import "view/splash_auth/view/splash_auth_view.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheManager.instance.initHiveBoxes();
  await AppInfoModel.instance.init();
  //* AccountModel'i splashAuthView'da init ediyoruz.
  // await AccountModel.instance.init();
  //* Firebase Crashlytics
  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((timeStamp) async => await firebaseInitialized());

  //* Screen Orientation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]).then((_) {
    runApp(const PickerApp());
    //* Network Dependency Injection (Uygulamanın internet bağlantısı olup olmadığını kontrol ediyoruz.)
    NetworkDependencyInjection.init();
  });
}

class PickerApp extends StatelessWidget {
  const PickerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Picker",
      defaultTransition: Transition.rightToLeft,
      popGesture: true,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale("en"),
      supportedLocales: const [Locale("tr"), Locale("en")],
      localizationsDelegates: const [GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate, GlobalMaterialLocalizations.delegate],
      scrollBehavior: const MaterialScrollBehavior().copyWith(dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse, PointerDeviceKind.stylus, PointerDeviceKind.unknown}),
      opaqueRoute: false,
      darkTheme: AppThemeDark.instance?.theme,
      themeMode: ThemeMode.dark,
      home: const SplashAuthView(),
      getPages: [
        GetPage(name: "/login", page: () => const LoginView()),
        GetPage(name: "/entryCompany", page: () => const EntryCompanyView()),
        GetPage(name: "/addCompany", page: () => const AccountsView()),
        GetPage(name: "/addAccount", page: () => const AddAccountView()),
        GetPage(name: "/qr", page: () => const QRScannerView()),
        GetPage(name: "/dovizKurlari", page: () => const DovizKurlariView()),
        GetPage(
            name: "/kalemEkle", page: () => KalemEkleView(stokListesiModel: Get.arguments is StokListesiModel ? Get.arguments : null, kalemModel: Get.arguments is KalemModel ? Get.arguments : null)),
        GetPage(
          name: "/mainPage",
          page: () => const MainPageView(),
          children: [
            //* Cari
            GetPage(name: "/cariListesi", page: () => CariListesiView(isGetData: Get.arguments)),
            GetPage(name: "/cariRehberi", page: () => CariRehberiView(cariKodu: Get.arguments)),
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

            //* Finans
            GetPage(name: "/kasaListesi", page: () => const KasaListesiView()),
            GetPage(name: "/kasaDekontlari", page: () => const KasaDekontlarView()),

            //* Sipariş
            GetPage(name: "/siparisMusteriSiparisi", page: () => SiparislerView(widgetModel: SiparislerWidgetModel(siparisTipiEnum: SiparisTipiEnum.musteri, isGetData: Get.arguments))),
            GetPage(name: "/siparisSaticiSiparisi", page: () => SiparislerView(widgetModel: SiparislerWidgetModel(siparisTipiEnum: SiparisTipiEnum.satici, isGetData: Get.arguments))),
            GetPage(name: "/siparisEdit", page: () => BaseSiparisEditingView(model: Get.arguments)),
            GetPage(name: "/siparisMusteriSiparisiDurumRaporu", page: () => const SiparisDurumRaporuView(siparisTipiEnum: SiparisTipiEnum.musteri)),
            GetPage(name: "/siparisSaticiSiparisiDurumRaporu", page: () => const SiparisDurumRaporuView(siparisTipiEnum: SiparisTipiEnum.satici)),
            GetPage(name: "/siparisStokIhtiyacRaporu", page: () => StokIhtiyacRaporuView(model: Get.arguments as BaseSiparisEditModel?)),
            GetPage(name: "/siparisMusteriSiparisiTeslimRaporu", page: () => SiparisTeslimRaporuView(siparisTipiEnum: SiparisTipiEnum.musteri, baseSiparisEditModel: Get.arguments)),
            GetPage(name: "/siparisSaticiSiparisiTeslimRaporu", page: () => SiparisTeslimRaporuView(siparisTipiEnum: SiparisTipiEnum.satici, baseSiparisEditModel: Get.arguments)),
            GetPage(name: "/siparisSiparisKarlilikRaporu", page: () => SiparisKarlilikRaporuView(model: Get.arguments)),

            // GetPage(name: "/siparisSaticiSiparisiDurumRaporu", page: page),
            // GetPage(name: "/siparisMusteriSiparisiTeslimRaporu", page: page),
            // GetPage(name: "/siparisSaticiSiparisiTeslimRaporu", page: page),

            //* Stok
            GetPage(
                name: "/stokListesi",
                page: () => StokListesiView(
                    isGetData: Get.arguments is bool ? Get.arguments : (Get.arguments is KalemEkleModel ? Get.arguments.getArguments : null),
                    searchText: Get.arguments is KalemEkleModel ? Get.arguments.searchText : null)),
            GetPage(name: "/stokFiyatGor", page: () => const FiyatGorView()),
            GetPage(name: "/stokYazdir", page: () => StokYazdirView(model: Get.arguments)),
            GetPage(name: "/stokFiyatGecmisi", page: () => const FiyatGecmisiView()),

            GetPage(name: "/stokEdit", page: () => BaseStokEditingView(model: Get.arguments)),
            GetPage(name: "/stokRehberi", page: () => StokRehberiView(searchText: Get.arguments)),
            GetPage(name: "/yapilandirmaRehberi", page: () => YapilandirmaRehberiView(model: Get.arguments)),
            GetPage(
              name: "/stokHareketleri",
              page: () => StokHareketleriView(
                  model: Get.arguments is StokListesiModel ? Get.arguments : null,
                  stokKodu: Get.arguments is String ? Get.arguments : null,
                  cariModel: Get.arguments is CariListesiModel ? Get.arguments : null),
            ),
            GetPage(name: "/StokYeniKayitView", page: () => StokYeniKayitView(model: Get.arguments)),

            //* Stok Raporları
            GetPage(name: "/stokAmbarMaliyetRaporu", page: () => AmbarMaliyetRaporuView(model: Get.arguments)),
            GetPage(name: "/stokLokalDepoBakiyeRaporu", page: () => LokalDepoBakiyeRaporuView(model: Get.arguments)),
            GetPage(name: "/urunGrubunaGoreSatisGrafigi", page: () => UrunGrubunaGoreSatisGrafigiView(model: Get.arguments is CariListesiModel ? Get.arguments : null)),

            //* Profil
            GetPage(name: "/temsilciProfil", page: () => const TemsilciProfilView()),

            //* Serbest Raporlar
            //*
            GetPage(
                name: "/serbestRaporlar",
                page: () => SerbestRaporlarView(
                    dizaynList: Get.arguments is NetFectDizaynList ? Get.arguments : null,
                    cariListesiModel: Get.arguments is CariListesiModel ? Get.arguments : null,
                    stokListesiModel: Get.arguments is StokListesiModel ? Get.arguments : null)),
          ],
        ),
      ],
    );
  }
}

Future<void> firebaseInitialized() async {
  if (kIsWeb|| Platform.isWindows || kDebugMode) return;
  if (!Platform.isWindows && (await AppTrackingTransparency.requestTrackingAuthorization() == TrackingStatus.authorized || !Platform.isIOS || !Platform.isMacOS)) {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();
    messaging.setForegroundNotificationPresentationOptions(sound: true, alert: true, badge: true);
    // FirebaseMessaging.onMessageOpenedApp.listen((event) => print(event.toMap().toString()));
    // messaging.getNotificationSettings().then((value) => print(value.authorizationStatus));
    // FirebaseMessaging.onBackgroundMessage((message) async => print(message));
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
