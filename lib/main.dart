import "dart:developer";
import "dart:io";
import "dart:ui";

import "package:app_tracking_transparency/app_tracking_transparency.dart";
import "package:easy_localization/easy_localization.dart";
import "package:firebase_core/firebase_core.dart";
import "package:firebase_crashlytics/firebase_crashlytics.dart";
import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:get/get.dart";
import "package:picker/core/base/view/e_belge_gonder/view/e_belge_gonder_view.dart";
import "package:picker/core/base/view/e_irsaliye_ek_bilgiler/view/e_irsaliye_ek_bilgiler_view.dart";
import "package:picker/core/base/view/kalem_rehberi/view/kalem_rehberi_view.dart";
import "package:picker/core/base/view/oturumlar/view/oturumlar_view.dart";
import "package:picker/core/base/view/servis_islemleri/view/servis_islemleri_view.dart";
import "package:picker/core/base/view/siparis_rehberi/view/siparis_rehberi_view.dart";
import "package:picker/core/components/aciklama_duzenle/view/aciklama_duzenle_view.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/enum/cirola_enum.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/enum/talep_teklif_tipi_enum.dart";
import "package:picker/locale_delegate.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/view/cek_senet_evraklar_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_goruntule/view/cek_senet_goruntule_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_islemler/hesaba_cirola/view/hesaba_cirola_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_islemler/kasadan_tahsil_et/view/kasadan_tahsil_et_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_islemler/odeme_dekontu_olustur/view/odeme_dekontu_olustur_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/alt_sayfalar/dekont_goruntule/view/dekont_goruntule_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/alt_sayfalar/dekont_kalem_ekle/view/dekont_kalem_ekle_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/view/dekont_edit_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/ortalama_vade_tarihi_hesaplama/view/ortalama_vade_tarihi_hesaplama_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/tahsilat_odeme_kayitlari/view/tahsilat_odeme_kayitlari_view.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/base_talep_teklif_edit/view/base_talep_teklif_edit_view.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/view/talep_teklif_listesi_view.dart";

import "core/base/view/cari_rehberi/view/cari_rehberi_view.dart";
import "core/base/view/doviz_kurlari/view/doviz_kurlari_view.dart";
import "core/base/view/kalem_ekle/model/kalem_ekle_model.dart";
import "core/base/view/kalem_ekle/view/kalem_ekle_view.dart";
import "core/base/view/qr/view/qr_view.dart";
import "core/base/view/stok_rehberi/view/stok_rehberi_view.dart";
import "core/base/view/surum_yenilikleri/view/surum_yenilikleri_view.dart";
import "core/base/view/yapilandirma_rehberi/view/yapilandirma_rehberi_view.dart";
import "core/constants/enum/banka_muhtelif_islemler_enum.dart";
import "core/constants/enum/cek_senet_listesi_enum.dart";
import "core/constants/enum/e_belge_enum.dart";
import "core/constants/enum/hesaplar_arasi_enum.dart";
import "core/init/app_info/app_info.dart";
import "core/init/cache/cache_manager.dart";
import "core/init/dependency_injection/network_dependency_injection.dart";
import "core/init/theme/app_theme_dark.dart";
import "firebase_options.dart";
// import "generated/codegen_loader.g.dart";
import "view/add_company/model/account_model.dart";
import "view/add_company/view/add_account_view.dart";
import "view/add_company/view/company_page.dart";
import "view/auth/entry_company/view/entry_company_view.dart";
import "view/auth/login/view/login_view.dart";
import "view/main_page/alt_sayfalar/cari/base_cari_edit/view/base_cari_edit_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_hareket_yeni_kayit/view/cari_hareket_yeni_kayit_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_hareketleri/view/cari_hareketleri_view.dart";
import "view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "view/main_page/alt_sayfalar/cari/cari_listesi/view/cari_listesi_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/borc_alacak_dokumu_raporu/view/cari_borc_alacak_dokumu_raporu_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/cari_dovizli_ekstre/view/cari_dovizli_ekstre_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/cari_ekstre/view/cari_ekstre_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/cari_hareket_raporu/view/cari_hareket_raporu_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/cari_stok_satis_ozeti/view/cari_stok_satis_ozeti_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/doviz_bakiye_raporu/view/doviz_bakiye_raporu_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/hareket_detayli_yapilandirma_raporu/view/hareket_detayli_yapilandirma_raporu_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/stok_ekstre/view/stok_ekstre_view.dart";
import "view/main_page/alt_sayfalar/cari/raporlar/yaslandirma_raporu/view/yaslandirma_raporu_view.dart";
import "view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/view/e_belge_gelen_giden_kutusu_view.dart";
import "view/main_page/alt_sayfalar/e_belge/e_belge_pdf/view/e_belge_pdf_view.dart";
import "view/main_page/alt_sayfalar/finans/banka/banka_hareketleri/view/banka_hareketleri_view.dart";
import "view/main_page/alt_sayfalar/finans/banka/banka_islemleri/view/banka_islemleri_view.dart";
import "view/main_page/alt_sayfalar/finans/banka/banka_kasa_transferi/view/banka_kasa_transferi_view.dart";
import "view/main_page/alt_sayfalar/finans/banka/banka_listesi/view/banka_listesi_view.dart";
import "view/main_page/alt_sayfalar/finans/banka/banka_muhtelif_islemler/view/banka_muhtelif/banka_muhtelif_islemler_view.dart";
import "view/main_page/alt_sayfalar/finans/banka/cari_havale_eft/view/cari_havale_eft_view.dart";
import "view/main_page/alt_sayfalar/finans/banka/hesaplar_arasi/view/hesaplar_arasi_islem_view.dart";
import "view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_hareketleri/view/cek_senet_hareketleri_view.dart";
import "view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/view/cek_senet_listesi_view.dart";
import "view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_tahsilat_ekle/view/cek_senet_tahsilat_ekle_view.dart";
import "view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_tahsilati/view/cek_senet_tahsilati_view.dart";
import "view/main_page/alt_sayfalar/finans/dekontlar/view/dekontlar_view.dart";
import "view/main_page/alt_sayfalar/finans/hizli_islemler/kredi_karti_tahsilati/view/kredi_karti_tahsilati_view.dart";
import "view/main_page/alt_sayfalar/finans/hizli_islemler/muhtelif_odeme/view/muhtelif_odeme_view.dart";
import "view/main_page/alt_sayfalar/finans/hizli_islemler/nakit_odeme/view/nakit_odeme_view.dart";
import "view/main_page/alt_sayfalar/finans/kasa/kasa_hareket_detayi/view/kasa_hareket_detay_view.dart";
import "view/main_page/alt_sayfalar/finans/kasa/kasa_hareketleri/view/kasa_hareketleri_view.dart";
import "view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/view/kasa_islemleri_view.dart";
import "view/main_page/alt_sayfalar/finans/kasa/kasa_listesi/view/kasa_listesi_view.dart";
import "view/main_page/alt_sayfalar/finans/kasa/kasa_transferi/view/kasa_transferi_view.dart";
import "view/main_page/alt_sayfalar/finans/kasa/raporlar/kasa_ekstre_raporu/view/kasa_ekstre_raporu_view.dart";
import "view/main_page/alt_sayfalar/finans/raporlar/finans_aylik_mizan_raporu/view/aylik_mizan_raporu_view.dart";
import "view/main_page/alt_sayfalar/finans/raporlar/finans_finansal_durum_raporu/view/finansal_durum_raporu_view.dart";
import "view/main_page/alt_sayfalar/mal_kabul_sevkiyat/faturalar/base_fatura_edit/view/base_fatura_edit_view.dart";
import "view/main_page/alt_sayfalar/mal_kabul_sevkiyat/faturalar/view/faturalar_view.dart";
import "view/main_page/alt_sayfalar/serbest_raporlar/view/serbest_raporlar_view.dart";
import "view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "view/main_page/alt_sayfalar/siparis/base_siparis_edit/view/base_siparis_edit_view.dart";
import "view/main_page/alt_sayfalar/siparis/raporlar/siparis_karlilik_raporu/view/siparis_karlilik_raporu_view.dart";
import "view/main_page/alt_sayfalar/siparis/raporlar/siparis_musteri_siparisi_durum_raporu/view/siparis_durum_raporu_view.dart";
import "view/main_page/alt_sayfalar/siparis/raporlar/siparis_stok_ihtiyac_raporu/view/stok_ihtiyac_raporu_view.dart";
import "view/main_page/alt_sayfalar/siparis/raporlar/siparis_teslim_raporu/view/siparis_teslim_raporu_view.dart";
import "view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_widget_model.dart";
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
import "view/main_page/alt_sayfalar/stok/yazdir/view/stok_yazdir_view.dart";
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
  WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((Duration timeStamp) async {
    await firebaseInitialized();
    await EasyLocalization.ensureInitialized();
  });

  //* Screen Orientation
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp, DeviceOrientation.landscapeRight, DeviceOrientation.landscapeLeft]).then((_) {
    runApp(
      // EasyLocalization(
      //   supportedLocales: const [
      //     Locale("en"),
      //     Locale("tr"),
      //   ],
      //   path: "assets/translations",
      //   assetLoader: const CodegenLoader(),
      //   child: const PickerApp(),
      // ),
      const PickerApp(),
    );
    //* Network Dependency Injection (Uygulamanın internet bağlantısı olup olmadığını kontrol ediyoruz.)
    NetworkDependencyInjection.init();
  });
}

class PickerApp extends StatelessWidget {
  const PickerApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: "Picker",
        // defaultTransition: Transition.rightToLeft,
        popGesture: true,
        debugShowCheckedModeBanner: false,
        // locale: context.locale,
        locale: Get.deviceLocale,
        fallbackLocale: const Locale("en"),
        // supportedLocales: context.supportedLocales,
        // localizationsDelegates: context.localizationDelegates,
        supportedLocales: const <Locale>[Locale("tr"), Locale("en")],
        localizationsDelegates: const <LocalizationsDelegate>[
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          LocDelegate(),
        ],

        scrollBehavior: const MaterialScrollBehavior()
            .copyWith(dragDevices: <PointerDeviceKind>{PointerDeviceKind.touch, PointerDeviceKind.mouse, PointerDeviceKind.stylus, PointerDeviceKind.unknown, PointerDeviceKind.trackpad}),
        opaqueRoute: false,
        darkTheme: AppThemeDark.instance?.theme,
        themeMode: ThemeMode.dark,
        home: const SplashAuthView(),
        getPages: <GetPage>[
          GetPage(name: "/login", page: () => const LoginView()),
          GetPage(name: "/entryCompany", page: () => EntryCompanyView(isSplash: Get.arguments)),
          GetPage(name: "/addCompany", page: () => const AccountsView()),
          GetPage(name: "/addAccount", page: () => const AddAccountView()),
          GetPage(name: "/qr", page: () => const QRScannerView()),
          GetPage(name: "/dovizKurlari", page: () => const DovizKurlariView()),
          GetPage(name: "/oturumlar", page: () => const OturumlarView()),
          GetPage(name: "/servisIslemleri", page: () => const ServisIslemleriView()),
          GetPage(
            name: "/kalemEkle",
            page: () => KalemEkleView(stokListesiModel: Get.arguments is StokListesiModel ? Get.arguments : null, kalemModel: Get.arguments is KalemModel ? Get.arguments : null),
          ),
          GetPage(
            name: "/talepTeklifKalemEkle",
            page: () => KalemEkleView(
              stokListesiModel: Get.arguments is StokListesiModel ? Get.arguments : null,
              kalemModel: Get.arguments is KalemModel ? Get.arguments : null,
            ),
          ),
          GetPage(
            name: "/mainPage",
            page: () => const MainPageView(),
            children: <GetPage>[
              GetPage(name: "/surumYenilikleri", page: SurumYenilikleriView.new),
              GetPage(name: "/kalemRehberi", page: () => KalemRehberiView(model: Get.arguments)),
              GetPage(name: "/siparisRehberi", page: () => SiparisRehberiView(model: Get.arguments)),
              GetPage(name: "/eIrsaliyeEkBilgiler", page: () => EIrsaliyeEkBilgilerView(model: Get.arguments)),

              //* E-Fatura - E-Arşiv - E-İrsaliye
              GetPage(name: "/eBelgeGonder", page: () => EBelgeGonderView(model: Get.arguments)),

              //* Cari
              GetPage(name: "/cariListesi", page: () => CariListesiView(isGetData: Get.arguments)),
              GetPage(name: "/cariRehberi", page: () => CariRehberiView(cariRequestModel: Get.arguments)),
              GetPage(name: "/cariEdit", page: () => BaseCariEditingView(model: Get.arguments)),
              GetPage(name: "/cariHareketleri", page: () => CariHareketleriView(cari: Get.arguments)),
              GetPage(name: "/cariYeniKayit", page: () => CariYeniKayitView(model: Get.arguments)),

              //* Cari Raporları
              GetPage(name: "/cariEkstre", page: () => CariEkstreView(model: Get.arguments)),
              GetPage(name: "/cariDovizliEkstre", page: () => CariDovizliEkstreView(model: Get.arguments)),
              GetPage(name: "/cariStokEkstre", page: () => StokEkstreView(model: Get.arguments)),
              GetPage(name: "/cariBorcAlacakDokumu", page: () => CariBorcAlacakDokumuRaporuView(model: Get.arguments)),
              GetPage(name: "/cariYaslandirmaRaporu", page: () => YaslandirmaRaporuView(model: Get.arguments)),
              GetPage(name: "/cariDovizBakiyeRaporu", page: () => DovizBakiyeRaporuView(model: Get.arguments)),
              GetPage(name: "/cariHareketRaporu", page: () => CariHareketRaporuView(model: Get.arguments)),
              GetPage(name: "/cariHareketDetayliYaslandirmaRaporu", page: () => HareketDetayliYaslandirmaRaporuView(model: Get.arguments)),
              GetPage(name: "/cariStokSatisOzeti", page: () => CariStokSatisOzetiView(model: Get.arguments)),

              //* E-Belge
              GetPage(name: "/eBelgeGelenKutusu", page: () => const EBelgeGelenGidenKutusuView(eBelgeEnum: EBelgeEnum.gelen)),
              GetPage(name: "/eBelgeGidenKutusu", page: () => const EBelgeGelenGidenKutusuView(eBelgeEnum: EBelgeEnum.giden)),
              GetPage(name: "/eBelgePdf", page: () => EBelgePdfView(model: Get.arguments)),

              //* Finans

              // * * Banka
              GetPage(name: "/bankaListesi", page: BankaListesiView.new),
              GetPage(name: "/bankaIslemleri", page: BankaIslemleriView.new),
              GetPage(name: "/bankaHareketleri", page: () => BankaHareketleriView(model: Get.arguments)),
              GetPage(name: "/cariEFTHavale", page: () => CariHavaleEftView(cariListesiModel: Get.arguments)),
              GetPage(name: "/bankaKasaTransferi", page: BankaKasaTransferiView.new),
              GetPage(name: "/hesaplarArasiVirman", page: () => const HesaplarArasiIslemView(hesaplarArasiEnum: HesaplarArasiEnum.virman)),
              GetPage(name: "/hesaplarArasiEftHavale", page: () => const HesaplarArasiIslemView(hesaplarArasiEnum: HesaplarArasiEnum.eftHavale)),
              GetPage(name: "/bankaMuhtelifTahsilat", page: () => const BankaMuhtelifIslemlerView(bankaMuhtelifIslemlerEnum: BankaMuhtelifIslemlerEnum.tahsilat)),
              GetPage(name: "/bankaMuhtelifOdeme", page: () => const BankaMuhtelifIslemlerView(bankaMuhtelifIslemlerEnum: BankaMuhtelifIslemlerEnum.odeme)),

              //* * Kasa
              GetPage(name: "/kasaHareketleri", page: () => KasaHareketleriView(model: Get.arguments)),
              GetPage(name: "/kasaHareketDetayi", page: () => KasaHareketDetayiView(cariListesiModel: Get.arguments)),
              GetPage(name: "/kasaListesi", page: KasaListesiView.new),
              GetPage(name: "/kasaIslemleri", page: KasaIslemleriView.new),
              GetPage(name: "/kasaTransferi", page: KasaTransferiView.new),
              GetPage(name: "/kasaKasaEkstreRaporu", page: KasaEkstreRaporuView.new),

              //* * Dekontlar
              GetPage(name: "/dekontlarListesi", page: DekontlarView.new),
              GetPage(name: "/dekontEkle", page: () => const DekontEditView(baseEditEnum: BaseEditEnum.ekle)),
              GetPage(name: "/dekontDuzenle", page: () => DekontEditView(baseEditEnum: BaseEditEnum.duzenle, model: Get.arguments)),
              GetPage(name: "/dekontGoruntule", page: () => DekontGoruntuleView(model: Get.arguments)),
              GetPage(name: "/dekontGoruntuleRefKey", page: () => DekontGoruntuleView(refKey: Get.arguments)),
              GetPage(name: "/dekontKalemEkle", page: () => DekontKalemEkleView(model: Get.arguments, baseEditEnum: BaseEditEnum.ekle)),
              GetPage(name: "/dekontKalemEkleKisitli", page: () => DekontKalemEkleView(model: Get.arguments, baseEditEnum: BaseEditEnum.duzenle)),

              //* * Çek-Senet
              GetPage(name: "/musteriCekleri", page: () => const CekSenetListesiView(cekSenetListesiEnum: CekSenetListesiEnum.cekMusteri)),
              GetPage(name: "/musteriSenetleri", page: () => const CekSenetListesiView(cekSenetListesiEnum: CekSenetListesiEnum.senetMusteri)),
              GetPage(name: "/borcCekleri", page: () => const CekSenetListesiView(cekSenetListesiEnum: CekSenetListesiEnum.cekBorc)),
              GetPage(name: "/borcSenetleri", page: () => const CekSenetListesiView(cekSenetListesiEnum: CekSenetListesiEnum.senetBorc)),
              GetPage(name: "/cekSenetHareketleri", page: () => CekSenetHareketleriView(model: Get.arguments)),
              GetPage(name: "/cekBorcTahsilat", page: () => CekSenetTahsilatiView(cekSenetListesiEnum: CekSenetListesiEnum.cekBorc, cariListesiModel: Get.arguments)),
              GetPage(name: "/cekMusteriTahsilat", page: () => CekSenetTahsilatiView(cekSenetListesiEnum: CekSenetListesiEnum.cekMusteri, cariListesiModel: Get.arguments)),
              GetPage(name: "/senetBorcTahsilat", page: () => CekSenetTahsilatiView(cekSenetListesiEnum: CekSenetListesiEnum.senetBorc, cariListesiModel: Get.arguments)),
              GetPage(name: "/senetMusteriTahsilat", page: () => CekSenetTahsilatiView(cekSenetListesiEnum: CekSenetListesiEnum.senetMusteri, cariListesiModel: Get.arguments)),
              GetPage(name: "/cekMusteriTahsilatEkle", page: () => CekSenetTahsilatEkleView(model: Get.arguments, cekSenetListesiEnum: CekSenetListesiEnum.cekMusteri)),
              GetPage(name: "/senetMusteriTahsilatEkle", page: () => CekSenetTahsilatEkleView(model: Get.arguments, cekSenetListesiEnum: CekSenetListesiEnum.senetMusteri)),
              GetPage(name: "/cekBorcTahsilatEkle", page: () => CekSenetTahsilatEkleView(model: Get.arguments, cekSenetListesiEnum: CekSenetListesiEnum.cekBorc)),
              GetPage(name: "/senetBorcTahsilatEkle", page: () => CekSenetTahsilatEkleView(model: Get.arguments, cekSenetListesiEnum: CekSenetListesiEnum.senetBorc)),
              GetPage(name: "/cekSenetEvraklari", page: () => CekSenetEvraklarView(model: Get.arguments)),
              GetPage(name: "/cekSenetGoruntule", page: () => CekSenetGoruntuleView(model: Get.arguments)),
              GetPage(name: "/cariHesabaCirola", page: () => HesabaCirolaView(model: Get.arguments, cirolaEnum: CirolaEnum.cari)),
              GetPage(name: "/tahsilHesabaCirola", page: () => HesabaCirolaView(model: Get.arguments, cirolaEnum: CirolaEnum.tahsil)),
              GetPage(name: "/kasadanTahsilEt", page: () => KasadanTahsilEtView(model: Get.arguments)),
              GetPage(name: "/odemeDekontOlustur", page: () => OdemeDekontuOlusturView(model: Get.arguments)),

              //* * Ortalama Vade Tarihi Hesaplama
              GetPage(name: "/ortalamaVadeTarihiHesaplama", page: () => const OrtalamaVadeTarihiHesaplamaView()),

              //* * Tahsilat Ödeme Kayıtları
              GetPage(name: "/tahsilatOdemeKayitlari", page: TahsilatOdemeKayitlariView.new),

              //* * Hızlı İşlemler
              GetPage(name: "/krediKartiTahsilati", page: () => KrediKartiTahsilatiView(cariListesiModel: Get.arguments)),
              GetPage(name: "/nakitTahsilat", page: () => NakitOdemeView(tahsilatMi: true, cariListesiModel: Get.arguments)),
              GetPage(name: "/nakitOdeme", page: () => NakitOdemeView(cariListesiModel: Get.arguments)),
              GetPage(name: "/muhtelifTahsilat", page: () => const MuhtelifOdemeView(tahsilatMi: true)),
              GetPage(name: "/muhtelifOdeme", page: MuhtelifOdemeView.new),

              //* * Finans Raporları
              GetPage(name: "/finansFinansalDurumRaporu", page: FinansalDurumRaporuView.new),
              GetPage(name: "/finansAylikMizanRaporu", page: AylikMizanRaporuView.new),

              //* Sipariş
              GetPage(name: "/siparisMusteriSiparisi", page: () => SiparislerView(widgetModel: SiparislerWidgetModel(editTipiEnum: EditTipiEnum.musteri, isGetData: Get.arguments))),
              GetPage(name: "/siparisSaticiSiparisi", page: () => SiparislerView(widgetModel: SiparislerWidgetModel(editTipiEnum: EditTipiEnum.satici, isGetData: Get.arguments))),
              GetPage(name: "/siparisEdit", page: () => BaseSiparisEditingView(model: Get.arguments)),
              GetPage(name: "/siparisMusteriSiparisiDurumRaporu", page: () => const SiparisDurumRaporuView(editTipiEnum: EditTipiEnum.musteri)),
              GetPage(name: "/siparisSaticiSiparisiDurumRaporu", page: () => const SiparisDurumRaporuView(editTipiEnum: EditTipiEnum.satici)),
              GetPage(name: "/siparisStokIhtiyacRaporu", page: () => StokIhtiyacRaporuView(model: Get.arguments as BaseSiparisEditModel?)),
              GetPage(name: "/siparisMusteriSiparisiTeslimRaporu", page: () => SiparisTeslimRaporuView(editTipiEnum: EditTipiEnum.musteri, baseSiparisEditModel: Get.arguments)),
              GetPage(name: "/siparisSaticiSiparisiTeslimRaporu", page: () => SiparisTeslimRaporuView(editTipiEnum: EditTipiEnum.satici, baseSiparisEditModel: Get.arguments)),
              GetPage(name: "/siparisSiparisKarlilikRaporu", page: () => SiparisKarlilikRaporuView(model: Get.arguments)),

              //* Stok
              GetPage(
                name: "/stokListesi",
                page: () => StokListesiView(
                  isGetData: Get.arguments is bool ? Get.arguments : (Get.arguments is KalemEkleModel ? Get.arguments.getArguments : null),
                  searchText: Get.arguments is KalemEkleModel ? Get.arguments.searchText : null,
                ),
              ),
              GetPage(name: "/stokFiyatGor", page: FiyatGorView.new),
              GetPage(name: "/stokYazdir", page: () => StokYazdirView(model: Get.arguments)),
              GetPage(name: "/stokFiyatGecmisi", page: FiyatGecmisiView.new),

              GetPage(name: "/stokEdit", page: () => BaseStokEditingView(model: Get.arguments)),
              GetPage(name: "/stokRehberi", page: () => StokRehberiView(searchText: Get.arguments)),
              GetPage(name: "/talepTeklifStokRehberi", page: () => StokRehberiView(searchText: Get.arguments, isTalepTeklif: true)),
              GetPage(name: "/yapilandirmaRehberi", page: () => YapilandirmaRehberiView(model: Get.arguments)),
              GetPage(
                name: "/stokHareketleri",
                page: () => StokHareketleriView(
                  model: Get.arguments is StokListesiModel ? Get.arguments : null,
                  stokKodu: Get.arguments is String ? Get.arguments : null,
                  cariModel: Get.arguments is CariListesiModel ? Get.arguments : null,
                ),
              ),
              GetPage(name: "/stokYeniKayit", page: () => StokYeniKayitView(model: Get.arguments)),

              //* Stok Raporları
              GetPage(name: "/stokAmbarMaliyetRaporu", page: () => AmbarMaliyetRaporuView(model: Get.arguments)),
              GetPage(name: "/stokLokalDepoBakiyeRaporu", page: () => LokalDepoBakiyeRaporuView(model: Get.arguments)),
              GetPage(name: "/urunGrubunaGoreSatisGrafigi", page: () => UrunGrubunaGoreSatisGrafigiView(model: Get.arguments is CariListesiModel ? Get.arguments : null)),

              //! Faturalar
              GetPage(name: "/faturaEdit", page: () => BaseFaturaEditView(model: Get.arguments)),
              //* Mal Kabul
              GetPage(name: "/malKabulAlisFaturasi", page: () => const FaturalarView(editTipiEnum: EditTipiEnum.alisFatura)),
              GetPage(name: "/malKabulAlisIrsaliyesi", page: () => const FaturalarView(editTipiEnum: EditTipiEnum.alisIrsaliye)),

              //* Sevkiyat
              GetPage(name: "/sevkiyatSatisFaturasi", page: () => const FaturalarView(editTipiEnum: EditTipiEnum.satisFatura)),
              GetPage(name: "/sevkiyatSatisIrsaliyesi", page: () => const FaturalarView(editTipiEnum: EditTipiEnum.satisIrsaliye)),

              //* * Faturalar Açıklama Düzenleme
              GetPage(name: "/faturaAlisFaturasiAciklamaDuzenle", page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.alisFatura)),
              GetPage(name: "/faturaAlisIrsaliyesiAciklamaDuzenle", page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.alisIrsaliye)),
              GetPage(name: "/faturaSatisFaturasiAciklamaDuzenle", page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.satisFatura)),
              GetPage(name: "/faturaSatisIrsaliyesiAciklamaDuzenle", page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.satisIrsaliye)),

              //* Profil
              GetPage(name: "/temsilciProfil", page: TemsilciProfilView.new),

              //* Talep Teklif
              GetPage(name: "/talTekSatisTalep", page: () => const TalepTeklifListesiView(talepTeklifEnum: TalepTeklifEnum.satisTalep)),
              GetPage(name: "/talTekSatisTeklif", page: () => const TalepTeklifListesiView(talepTeklifEnum: TalepTeklifEnum.satisTeklif)),
              GetPage(name: "/talTekAlisTalep", page: () => const TalepTeklifListesiView(talepTeklifEnum: TalepTeklifEnum.alisTalep)),

              //* * Talep Teklif Edit
              GetPage(name: "/talTekEdit", page: () => BaseTalepTeklifEditingView(model: Get.arguments)),

              //* * Talep Açıklama Düzenleme
              GetPage(name: "/talTekSatisTalepAciklamaDuzenle", page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.satisTalebi)),
              GetPage(name: "/talTekSatisTeklifAciklamaDuzenle", page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.satisTeklifi)),
              GetPage(name: "/talTekAlisTalepAciklamaDuzenle", page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.alisTalebi)),

              //* Serbest Raporlar
              //*
              GetPage(
                name: "/serbestRaporlar",
                page: () => SerbestRaporlarView(
                  dizaynList: Get.arguments is NetFectDizaynList ? Get.arguments : null,
                  cariListesiModel: Get.arguments is CariListesiModel ? Get.arguments : null,
                  stokListesiModel: Get.arguments is StokListesiModel ? Get.arguments : null,
                ),
              ),
            ],
          ),
        ],
      );
}

Future<void> firebaseInitialized() async {
  if (kIsWeb) {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    final FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    AccountModel.instance.fcmToken = await FirebaseMessaging.instance.getToken(vapidKey: "BI5k1LDDt7zt4u57TwYvprSQ5p4KGOeMysQkIvi2yds00wuPaTNPg641os6uLOKxMmvGw14PekF92Jv-pl0qLvE");
    await messaging.setForegroundNotificationPresentationOptions(sound: true, alert: true, badge: true);
    log("fcmToken: ${AccountModel.instance.fcmToken}");
    // print token
    // FirebaseMessaging.onMessageOpenedApp.listen((event) => print(event.toMap().toString()));
    // messaging.getNotificationSettings().then((value) => print(value.authorizationStatus));
    // FirebaseMessaging.onSurfaceMessage((message) async => print(message));
    await FirebaseCrashlytics.instance.setUserIdentifier(AccountModel.instance.ozelCihazKimligi ?? "");
    FlutterError.onError = (FlutterErrorDetails errorDetails) => FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      AccountModel.instance.toJson().forEach((String key, value) => value != null ? FirebaseCrashlytics.instance.setCustomKey(key, value) : null);
      FirebaseCrashlytics.instance.setCustomKey("new version", AppInfoModel.instance.version ?? "");
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
  if (!Platform.isWindows && (await AppTrackingTransparency.requestTrackingAuthorization() == TrackingStatus.authorized || !Platform.isIOS || !Platform.isMacOS)) {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    final FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();
    await FirebaseMessaging.instance.setAutoInitEnabled(true);
    AccountModel.instance.fcmToken = await FirebaseMessaging.instance.getToken();
    await messaging.setForegroundNotificationPresentationOptions(sound: true, alert: true, badge: true);
    log("fcmToken: ${AccountModel.instance.fcmToken}");
    // print token
    // FirebaseMessaging.onMessageOpenedApp.listen((event) => print(event.toMap().toString()));
    // messaging.getNotificationSettings().then((value) => print(value.authorizationStatus));
    // FirebaseMessaging.onSurfaceMessage((message) async => print(message));
    await FirebaseCrashlytics.instance.setUserIdentifier(AccountModel.instance.ozelCihazKimligi ?? "");
    FlutterError.onError = (FlutterErrorDetails errorDetails) => FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
      AccountModel.instance.toJson().forEach((String key, value) => value != null ? FirebaseCrashlytics.instance.setCustomKey(key, value) : null);
      FirebaseCrashlytics.instance.setCustomKey("new version", AppInfoModel.instance.version ?? "");
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }
}
