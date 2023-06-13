import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:picker/core/init/app_info/app_info.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/raporlar/cari_dovizli_ekstre/view/cari_dovizli_ekstre_view.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/raporlar/cari_ekstre/view/cari_ekstre_view.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/raporlar/cari_hareket_raporu/view/cari_hareket_raporu_view.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/raporlar/cari_stok_satis_ozeti/view/cari_stok_satis_ozeti_view.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/raporlar/doviz_bakiye_raporu/view/doviz_bakiye_raporu_view.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/raporlar/hareket_detayli_yapilandirma_raporu/view/hareket_detayli_yapilandirma_raporu_view.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/raporlar/stok_ekstre/view/stok_ekstre_view.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/raporlar/yaslandirma_raporu/view/yaslandirma_raporu_view.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_hareketleri/model/stok_hareketleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/temsilci_profil/view/temsilci_profil_view.dart";
import "package:picker/view/splash_auth/view/splash_auth_view.dart";

import "core/init/cache/cache_manager.dart";
import "core/init/theme/app_theme_dark.dart";
import "view/add_company/model/account_model.dart";
import "view/add_company/view/add_account_view.dart";
import "view/add_company/view/company_page.dart";
import "view/add_company/view/qr_view.dart";
import "view/auth/view/login_view.dart";
import 'view/auth/view/entry_company_view.dart';
import "view/main_page/alt_sayfalar/cari/base_cari_edit/view/base_cari_edit_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_hareket_yeni_kayit/view/cari_hareket_yeni_kayit_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_hareketleri/view/cari_hareketleri_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_listesi/view/cari_listesi_view.dart";
import "view/main_page/alt_sayfalar/stok/base_stok_edit/view/base_stok_edit_view.dart";
import 'view/main_page/alt_sayfalar/stok/stok_hareketleri/view/stok_hareketleri_view.dart';
import "view/main_page/alt_sayfalar/stok/stok_liste/view/stok_listesi_view.dart";
import "view/main_page/alt_sayfalar/stok/stok_yeni_kayit/view/stok_yeni_kayit_view.dart";
import "view/main_page/view/main_page_view.dart";

void main() async {
  await CacheManager.instance.initHiveBoxes();
  await AccountModel.instance.init();
  AppInfoModel().init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      defaultTransition: Transition.rightToLeft,
      popGesture: true,
      debugShowCheckedModeBanner: false,
      opaqueRoute: false,
      darkTheme: AppThemeDark.instance!.theme,
      themeMode: ThemeMode.dark,
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
            GetPage(name: "//cariStokSatisOzeti", page: () => CariStokSatisOzetiView(model: Get.arguments)),

            //* Stok
            GetPage(name: "/stokListesi", page: () => const StokListesiView()),
            GetPage(name: "/stokEdit", page: () => BaseStokEditingView(model: Get.arguments)),
            GetPage(
                name: "/stokHareketleri",
                page: () => StokHareketleriView(model: Get.arguments is StokHareketleriModel ? Get.arguments : null, stokKodu: Get.arguments is String ? Get.arguments : null)),
            GetPage(name: "/stokYeniKayit", page: () => StokYeniKayitView(model: Get.arguments)),
            //? GetPage(name: "/urunGrubunaGoreSatisGrafigi", page: () => StokYeniKayitView(model: Get.arguments)),

            //* Profil
            GetPage(name: "/temsilciProfil", page: () => const TemsilciProfilView()),
          ],
        ),
        GetPage(name: "/addCompany", page: () => const AccountsView()),
        GetPage(name: "/addAccount", page: () => const AddAccountView()),
        GetPage(name: "/qr", page: () => const QRScannerView()),
      ],
    );
  }
}
