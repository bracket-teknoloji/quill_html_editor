part of "picker_app_imports.dart";

final class PickerApp extends StatelessWidget {
  const PickerApp({super.key});

  bool isDarkMode(BuildContext context) =>
      CacheManager.getProfilParametre.temaModu == ThemeMode.dark ||
      (CacheManager.getProfilParametre.temaModu == ThemeMode.system &&
          MediaQuery.platformBrightnessOf(context) == Brightness.dark);

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: (isDarkMode(context) ? Assets.background.bg1 : Assets.background.bg2).provider(),
        repeat: ImageRepeat.repeat,
        // colorFilter: ColorFilter.mode((isDarkMode(context) ? AppThemeLight.instance?.colorManager.surface : AppThemeLight.instance?.colorManager.surface) ?? Colors.white, BlendMode.overlay),
      ),
    ),
    alignment: Alignment.center,
    child: ClipRRect(
      borderRadius: !context.isPhone && context.isLandscape
          ? const BorderRadius.only(
              topLeft: Radius.circular(UIHelper.highSize),
              topRight: Radius.circular(UIHelper.highSize),
            )
          : BorderRadius.zero,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: !context.isPhone && context.isLandscape ? getWidth(context) : double.infinity,
        ),
        child: const PickerMaterialApp(),
      ),
    ),
  );
}

final class PickerMaterialApp extends StatelessWidget {
  const PickerMaterialApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    title: "Picker",
    popGesture: true,
    debugShowCheckedModeBanner: false,
    locale: Get.deviceLocale,
    fallbackLocale: const Locale("en"),
    supportedLocales: const <Locale>[Locale("tr"), Locale("en")],
    localizationsDelegates: const <LocalizationsDelegate>[
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      SfGlobalLocalizations.delegate,
      LocDelegate(),
    ],
    scrollBehavior: const MaterialScrollBehavior().copyWith(
      dragDevices: <PointerDeviceKind>{
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.unknown,
        PointerDeviceKind.trackpad,
      },
    ),
    opaqueRoute: false,
    color: UIHelper.primaryColor,
    theme: AppThemeLight.instance?.theme,
    darkTheme: AppThemeDark.instance?.theme,
    themeMode: CacheManager.getProfilParametre.temaModu,
    // initialRoute: "/",
    // onUnknownRoute: (settings) => GetPageRoute(
    //   settings: const RouteSettings(name: "/"),
    //   page: SplashAuthView.new,
    // ),
    getPages: <GetPage>[
      GetPage(name: "/", page: SplashAuthView.new),
      GetPage(name: "/login", page: () => const LoginView()),
      GetPage(
        name: "/entryCompany",
        page: () => EntryCompanyView(isSplash: Get.arguments),
      ),
      GetPage(name: "/addCompany", page: () => const AccountsView()),
      GetPage(name: "/addAccount", page: () => const AddAccountView()),
      GetPage(name: "/qr", page: () => const QRScannerView()),
      GetPage(name: "/dovizKurlari", page: () => const DovizKurlariView()),
      GetPage(name: "/oturumlar", page: () => const OturumlarView()),
      GetPage(name: "/kullaniciHaritasi", page: () => const KullaniciHaritasiView()),
      GetPage(name: "/servisIslemleri", page: () => const ServisIslemleriView()),
      GetPage(
        name: "/kalemEkle",
        page: () => KalemEkleView(
          stokListesiModel: Get.arguments is StokListesiModel ? Get.arguments : null,
          kalemModel: Get.arguments is KalemModel ? Get.arguments : null,
        ),
      ),
      GetPage(
        name: "/talepTeklifKalemEkle",
        page: () => KalemEkleView(
          stokListesiModel: Get.arguments is StokListesiModel ? Get.arguments : null,
          kalemModel: Get.arguments is KalemModel ? Get.arguments : null,
        ),
      ),
      //* Seri İşlemleri
      GetPage(
        name: "/seriListesi",
        page: () => SeriListesiView(kalemModel: Get.arguments),
      ),
      GetPage(
        name: "/seriListesiOzel",
        page: () => SeriListesiView.goruntule(kalemModel: Get.arguments),
      ),
      GetPage(name: "/kayitliYazicilar", page: YaziciListesiView.new),
      GetPage(name: "/yaziciRehberi", page: YaziciRehberiView.new),
      GetPage(name: "/yaziciEkle", page: YaziciEditView.ekle),
      GetPage(name: "/yaziciDuzenle", page: YaziciEditView.duzenle),
      GetPage(
        name: "/seriDetayi",
        page: () => SeriDetayiView(seriDetayiModel: Get.arguments),
      ),
      GetPage(
        name: "/seriHareketleri",
        page: () => SeriHareketleriView(model: Get.arguments),
      ),
      GetPage(
        name: "/seriGirisi",
        page: () => SeriGirisiView(seriHareketleriModel: Get.arguments),
      ),
      GetPage(
        name: "/seriBakiyeleri",
        page: () => SeriBakiyeleriView(stokModel: Get.arguments),
      ),
      GetPage(
        name: "/seriRehberi",
        page: () => SeriRehberiView(stokModel: Get.arguments),
      ),
      GetPage(
        name: "/seriRehberiUSK",
        page: () => SeriRehberiView.usk(stokModel: Get.arguments),
      ),
      GetPage(
        name: "/evraklar",
        page: () => EvraklarView(model: Get.arguments),
      ),
      GetPage(
        name: "/imagePicker",
        page: () => ImagePickerView(requestModel: Get.arguments),
      ),
      GetPage(name: "/surumYenilikleri", page: SurumYenilikleriView.new),
      GetPage(
        name: "/mainPage",
        arguments: Get.arguments,
        page: () => const MainPageView(),
        popGesture: false,
        children: <GetPage>[
          GetPage(name: "/belgeKontrol", page: BelgeKontrolView.new),
          GetPage(name: "/belgeEkle", page: () => const BelgeKontrolEditView.add()),
          GetPage(name: "/belgeDuzenle", page: () => const BelgeKontrolEditView.edit()),
          GetPage(
            name: "/belgeKalemler",
            page: () => BelgeKontrolKalemlerView(belgeKontrolModel: Get.arguments),
          ),
          GetPage(
            name: "/belgeKalemlerEdit",
            page: () => BelgeKontrolKalemEditView(belgeKontrolModel: Get.arguments),
          ),
          GetPage(
            name: "/genelRehber",
            page: () => GenelRehberView(model: Get.arguments),
          ),
          GetPage(
            name: "/kalemRehberi",
            page: () => KalemRehberiView(model: Get.arguments),
          ),
          GetPage(
            name: "/siparisRehberi",
            page: () => SiparisRehberiView(model: Get.arguments),
          ),
          GetPage(
            name: "/eIrsaliyeEkBilgiler",
            page: () => EIrsaliyeEkBilgilerView(model: Get.arguments),
          ),

          //* E-Fatura - E-Arşiv - E-İrsaliye
          GetPage(
            name: "/eBelgeGonder",
            page: () => EBelgeGonderView(model: Get.arguments),
            popGesture: false,
          ),

          //* Cari
          GetPage(
            name: "/cariListesi",
            page: () => CariListesiView(isGetData: Get.arguments),
          ),
          GetPage(
            name: "/cariListesiOzel",
            page: () => CariListesiView(isGetData: true, cariRequestModel: Get.arguments),
          ),
          GetPage(
            name: "/cariRehberi",
            page: () => CariRehberiView(cariRequestModel: Get.arguments),
          ),
          GetPage(name: "/MuhtelifCariEkle", page: MuhtelifCariEkleView.new),
          GetPage(
            name: "/cariEdit",
            page: () => BaseCariEditingView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariHareketleri",
            page: () => CariHareketleriView(cari: Get.arguments),
          ),
          GetPage(
            name: "/cariYeniKayit",
            page: () => CariYeniKayitView(model: Get.arguments),
          ),
          GetPage(name: "/cariHaritasi", page: CariHaritasiView.new),
          GetPage(
            name: "/cariHaritasiOzel",
            page: () => CariHaritasiView(isGetData: true, konum: Get.arguments),
          ),
          GetPage(
            name: "/cariHaritasiGoruntule",
            page: () => CariHaritasiView(isGetData: false, model: Get.arguments),
          ),
          GetPage(
            name: "/cariAktivite",
            page: () => CariAktiviteView(cariModel: Get.arguments),
          ),
          GetPage(
            name: "/cariAktiviteEdit",
            page: () => CariAktiviteEditView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariAktiviteDetayiEdit",
            page: () => CariAktiviteDetayiEditView(model: Get.arguments),
          ),

          //* Cari Raporları
          GetPage(
            name: "/cariEkstre",
            page: () => CariEkstreView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariDovizliEkstre",
            page: () => CariDovizliEkstreView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariStokEkstre",
            page: () => StokEkstreView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariBorcAlacakDokumu",
            page: () => CariBorcAlacakDokumuRaporuView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariDovizliBorcAlacakDokumu",
            page: () => CariBorcAlacakDokumuRaporuView.dovizli(model: Get.arguments),
          ),
          GetPage(
            name: "/cariYaslandirmaRaporu",
            page: () => YaslandirmaRaporuView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariDovizBakiyeRaporu",
            page: () => DovizBakiyeRaporuView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariHareketRaporu",
            page: () => CariHareketRaporuView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariHareketDetayliYaslandirmaRaporu",
            page: () => HareketDetayliYaslandirmaRaporuView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariStokSatisOzeti",
            page: () => CariStokSatisOzetiView(model: Get.arguments),
          ),

          //* E-Belge
          GetPage(
            name: "/eBelgeGelenKutusu",
            page: () => const EBelgeGelenGidenKutusuView(eBelgeEnum: EBelgeEnum.gelen),
          ),
          GetPage(
            name: "/eBelgeGidenKutusu",
            page: () => const EBelgeGelenGidenKutusuView(eBelgeEnum: EBelgeEnum.giden),
          ),
          GetPage(
            name: "/eBelgePdf",
            page: () => EBelgePdfView(model: Get.arguments),
          ),

          //* Finans

          // * * Banka
          GetPage(name: "/bankaListesi", page: BankaListesiView.new),
          GetPage(
            name: "/bankaListesiOzel",
            page: () => BankaListesiView(isGetData: true, requestModel: Get.arguments),
          ),
          GetPage(name: "/bankaIslemleri", page: BankaIslemleriView.new),
          GetPage(
            name: "/bankaHareketleri",
            page: () => BankaHareketleriView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariEFTHavale",
            page: () => CariHavaleEftView(cariListesiModel: Get.arguments),
          ),
          GetPage(
            name: "/ozelHesapKapatma",
            page: () => OzelHesapKapatmaView(cariModel: Get.arguments),
          ),
          GetPage(name: "/bankaKasaTransferi", page: BankaKasaTransferiView.new),
          GetPage(
            name: "/hesaplarArasiVirman",
            page: () => const HesaplarArasiIslemView(hesaplarArasiEnum: HesaplarArasiEnum.virman),
          ),
          GetPage(
            name: "/cariVirman",
            page: () => CariVirmanView(model: Get.arguments),
          ),
          GetPage(
            name: "/hesaplarArasiEftHavale",
            page: () => const HesaplarArasiIslemView(hesaplarArasiEnum: HesaplarArasiEnum.eftHavale),
          ),
          GetPage(
            name: "/bankaMuhtelifTahsilat",
            page: () => const BankaMuhtelifIslemlerView(bankaMuhtelifIslemlerEnum: BankaMuhtelifIslemlerEnum.tahsilat),
          ),
          GetPage(
            name: "/bankaMuhtelifOdeme",
            page: () => const BankaMuhtelifIslemlerView(bankaMuhtelifIslemlerEnum: BankaMuhtelifIslemlerEnum.odeme),
          ),
          GetPage(
            name: "/masrafKoduRehberi",
            page: () => MasrafKoduRehberiView(tipi: Get.arguments),
          ),

          //* * Kasa
          GetPage(
            name: "/kasaHareketleri",
            page: () => KasaHareketleriView(model: Get.arguments),
          ),
          GetPage(
            name: "/kasaHareketDetayi",
            page: () => KasaHareketDetayiView(cariListesiModel: Get.arguments),
          ),
          GetPage(name: "/kasaListesi", page: KasaListesiView.new),
          GetPage(name: "/kasaIslemleri", page: KasaIslemleriView.new),
          GetPage(name: "/kasaTransferi", page: KasaTransferiView.new),
          GetPage(name: "/kasaKasaEkstreRaporu", page: KasaEkstreRaporuView.new),

          //* * Dekontlar
          GetPage(name: "/dekontlarListesi", page: DekontlarView.new),
          GetPage(
            name: "/dekontEkle",
            page: () => const DekontEditView(baseEditEnum: BaseEditEnum.ekle),
          ),
          GetPage(
            name: "/dekontEBelgedenEkle",
            page: () => DekontEditView(baseEditEnum: BaseEditEnum.taslak, eBelgeModel: Get.arguments),
          ),
          GetPage(
            name: "/dekontDuzenle",
            page: () => DekontEditView(baseEditEnum: BaseEditEnum.duzenle, model: Get.arguments),
          ),
          GetPage(
            name: "/dekontGoruntule",
            page: () => DekontGoruntuleView(model: Get.arguments),
          ),
          GetPage(
            name: "/dekontGoruntuleRefKey",
            page: () => DekontGoruntuleView(refKey: Get.arguments),
          ),
          GetPage(
            name: "/dekontKalemEkle",
            page: () => DekontKalemEkleView(model: Get.arguments, baseEditEnum: BaseEditEnum.ekle),
          ),
          GetPage(
            name: "/dekontKalemEkleKisitli",
            page: () => DekontKalemEkleView(model: Get.arguments, baseEditEnum: BaseEditEnum.duzenle),
          ),

          //* * Çek-Senet
          GetPage(
            name: "/musteriCekleri",
            page: () => const CekSenetListesiView(cekSenetListesiEnum: CekSenetListesiEnum.cekMusteri),
          ),
          GetPage(
            name: "/musteriSenetleri",
            page: () => const CekSenetListesiView(cekSenetListesiEnum: CekSenetListesiEnum.senetMusteri),
          ),
          GetPage(
            name: "/borcCekleri",
            page: () => const CekSenetListesiView(cekSenetListesiEnum: CekSenetListesiEnum.cekBorc),
          ),
          GetPage(
            name: "/borcSenetleri",
            page: () => const CekSenetListesiView(cekSenetListesiEnum: CekSenetListesiEnum.senetBorc),
          ),
          GetPage(
            name: "/cekSenetHareketleri",
            page: () => CekSenetHareketleriView(model: Get.arguments),
          ),
          GetPage(
            name: "/cekBorcTahsilat",
            page: () => CekSenetTahsilatiView(
              cekSenetListesiEnum: CekSenetListesiEnum.cekBorc,
              cariListesiModel: Get.arguments,
            ),
          ),
          GetPage(
            name: "/cekMusteriTahsilat",
            page: () => CekSenetTahsilatiView(
              cekSenetListesiEnum: CekSenetListesiEnum.cekMusteri,
              cariListesiModel: Get.arguments,
            ),
          ),
          GetPage(
            name: "/senetBorcTahsilat",
            page: () => CekSenetTahsilatiView(
              cekSenetListesiEnum: CekSenetListesiEnum.senetBorc,
              cariListesiModel: Get.arguments,
            ),
          ),
          GetPage(
            name: "/senetMusteriTahsilat",
            page: () => CekSenetTahsilatiView(
              cekSenetListesiEnum: CekSenetListesiEnum.senetMusteri,
              cariListesiModel: Get.arguments,
            ),
          ),
          GetPage(
            name: "/cekMusteriTahsilatEkle",
            page: () =>
                CekSenetTahsilatEkleView(model: Get.arguments, cekSenetListesiEnum: CekSenetListesiEnum.cekMusteri),
          ),
          GetPage(
            name: "/senetMusteriTahsilatEkle",
            page: () =>
                CekSenetTahsilatEkleView(model: Get.arguments, cekSenetListesiEnum: CekSenetListesiEnum.senetMusteri),
          ),
          GetPage(
            name: "/cekBorcTahsilatEkle",
            page: () =>
                CekSenetTahsilatEkleView(model: Get.arguments, cekSenetListesiEnum: CekSenetListesiEnum.cekBorc),
          ),
          GetPage(
            name: "/senetBorcTahsilatEkle",
            page: () =>
                CekSenetTahsilatEkleView(model: Get.arguments, cekSenetListesiEnum: CekSenetListesiEnum.senetBorc),
          ),
          GetPage(
            name: "/cekSenetEvraklari",
            page: () => CekSenetEvraklarView(model: Get.arguments),
          ),
          GetPage(
            name: "/cekSenetGoruntule",
            page: () => CekSenetGoruntuleView(model: Get.arguments),
          ),
          GetPage(
            name: "/cariHesabaCirola",
            page: () => HesabaCirolaView(model: Get.arguments, cirolaEnum: CirolaEnum.cari),
          ),
          GetPage(
            name: "/tahsilHesabaCirola",
            page: () => HesabaCirolaView(model: Get.arguments, cirolaEnum: CirolaEnum.tahsil),
          ),
          GetPage(
            name: "/kasadanTahsilEt",
            page: () => KasadanTahsilEtView(model: Get.arguments),
          ),
          GetPage(
            name: "/odemeDekontOlustur",
            page: () => OdemeDekontuOlusturView(model: Get.arguments),
          ),
          GetPage(
            name: "/tahsilDekontuOlustur",
            page: () => OdemeDekontuOlusturView(model: Get.arguments),
          ),

          //* * Ortalama Vade Tarihi Hesaplama
          GetPage(name: "/ortalamaVadeTarihiHesaplama", page: () => const OrtalamaVadeTarihiHesaplamaView()),

          //* * Tahsilat Ödeme Kayıtları
          GetPage(name: "/tahsilatOdemeKayitlari", page: TahsilatOdemeKayitlariView.new),

          //* * Hızlı Tahsilat Kayıtları
          GetPage(name: "/hizliTahsilatKayitlari", page: HizliTahsilatKayitlariView.new),

          //* * Hızlı İşlemler
          GetPage(
            name: "/krediKartiTahsilati",
            page: () => KrediKartiTahsilatiView(cariListesiModel: Get.arguments),
          ),
          GetPage(
            name: "/nakitTahsilat",
            page: () => NakitOdemeView(tahsilatMi: true, cariListesiModel: Get.arguments),
          ),
          GetPage(
            name: "/nakitOdeme",
            page: () => NakitOdemeView(cariListesiModel: Get.arguments),
          ),
          GetPage(name: "/muhtelifTahsilat", page: () => const MuhtelifOdemeView(tahsilatMi: true)),
          GetPage(name: "/muhtelifOdeme", page: MuhtelifOdemeView.new),

          //* * Finans Raporları
          GetPage(name: "/finansOzetRaporu", page: FinansOzetRaporView.new),
          GetPage(name: "/finansFinansalDurumRaporu", page: FinansalDurumRaporuView.new),
          GetPage(name: "/finansAylikMizanRaporu", page: AylikMizanRaporuView.new),

          //* Sayım
          GetPage(name: "/sayimListesi", page: SayimListesiView.new),
          GetPage(
            name: "/sayimEdit",
            page: () => SayimEditView(model: Get.arguments),
          ),
          GetPage(
            name: "/sayimDepoFarkRaporu",
            page: () => DepoFarkRaporuView(model: Get.arguments),
          ),

          //* Sipariş
          GetPage(
            name: "/siparisMusteriSiparisi",
            page: () => SiparislerView(
              widgetModel: SiparislerWidgetModel(editTipiEnum: EditTipiEnum.musteri, isGetData: Get.arguments),
            ),
          ),
          GetPage(
            name: "/siparisSaticiSiparisi",
            page: () => SiparislerView(
              widgetModel: SiparislerWidgetModel(editTipiEnum: EditTipiEnum.satici, isGetData: Get.arguments),
            ),
          ),
          GetPage(
            name: "/siparisEdit",
            page: () => BaseSiparisEditingView(model: Get.arguments),
          ),
          GetPage(
            name: "/siparisMusteriSiparisiDurumRaporu",
            page: () => const SiparisDurumRaporuView(editTipiEnum: EditTipiEnum.musteri),
          ),
          GetPage(
            name: "/siparisSaticiSiparisiDurumRaporu",
            page: () => const SiparisDurumRaporuView(editTipiEnum: EditTipiEnum.satici),
          ),
          GetPage(
            name: "/siparisStokIhtiyacRaporu",
            page: () => StokIhtiyacRaporuView(model: Get.arguments as BaseSiparisEditModel?),
          ),
          GetPage(
            name: "/siparisMusteriSiparisiTeslimRaporu",
            page: () =>
                SiparisTeslimRaporuView(editTipiEnum: EditTipiEnum.musteri, baseSiparisEditModel: Get.arguments),
          ),
          GetPage(
            name: "/siparisSaticiSiparisiTeslimRaporu",
            page: () => SiparisTeslimRaporuView(editTipiEnum: EditTipiEnum.satici, baseSiparisEditModel: Get.arguments),
          ),
          GetPage(
            name: "/siparisSiparisKarlilikRaporu",
            page: () => SiparisKarlilikRaporuView(model: Get.arguments),
          ),

          //* Stok
          GetPage(
            name: "/stokListesi",
            page: () => StokListesiView(
              isGetData: Get.arguments is bool
                  ? Get.arguments
                  : (Get.arguments is KalemEkleModel ? Get.arguments.getArguments : null),
              searchText: Get.arguments is KalemEkleModel ? Get.arguments.searchText : null,
            ),
          ),
          GetPage(
            name: "/stokDetayliArama",
            page: () => StokDetayliAramaView(aramaList: Get.arguments),
          ),
          GetPage(
            name: "/stokListesiOzel",
            page: () => StokListesiView(isGetData: true, requestModel: Get.arguments),
          ),
          GetPage(
            name: "/stokFiyatGor",
            page: () => FiyatGorView(model: Get.arguments),
          ),
          GetPage(
            name: "/stokYazdir",
            page: () => StokYazdirView(model: Get.arguments),
          ),
          GetPage(name: "/stokBarkodTanimla", page: BarkodTanimlaView.new),
          GetPage(
            name: "/barkodEdit",
            page: () => BarkodTanimlaEditView(model: Get.arguments),
          ),
          GetPage(
            name: "/hucreYazdir",
            page: () => StokYazdirView(hucreModel: Get.arguments),
          ),
          GetPage(
            name: "/depoBakiyeDurumu",
            page: () => DepoBakiyeDurumuView(model: Get.arguments),
          ),
          GetPage(name: "/stokFiyatGecmisi", page: FiyatGecmisiView.new),

          GetPage(
            name: "/stokEdit",
            page: () => BaseStokEditingView(model: Get.arguments),
          ),
          GetPage(
            name: "/stokRehberi",
            page: () => StokRehberiView(searchText: Get.arguments),
          ),
          GetPage(
            name: "/talepTeklifStokRehberi",
            page: () => StokRehberiView(searchText: Get.arguments, isTalepTeklif: true),
          ),
          GetPage(
            name: "/depoTalepStokRehberi",
            page: () => StokRehberiView(searchText: Get.arguments, isDepoTalep: true),
          ),
          GetPage(
            name: "/yapilandirmaRehberi",
            page: () => YapilandirmaRehberiView(model: Get.arguments),
          ),
          GetPage(
            name: "/stokHareketleri",
            page: () => StokHareketleriView(
              model: Get.arguments is StokListesiModel ? Get.arguments : null,
              stokKodu: Get.arguments is String ? Get.arguments : null,
              cariModel: Get.arguments is CariListesiModel ? Get.arguments : null,
            ),
          ),
          GetPage(
            name: "/stokCariHareketleri",
            page: () {
              if (Get.arguments is List) {
                final stokModel = Get.arguments[0] as StokListesiModel;
                final cariModel = Get.arguments[1] as CariListesiModel;
                return StokHareketleriView(model: stokModel, cariModel: cariModel);
              }
              return StokHareketleriView(
                model: Get.arguments is StokListesiModel ? Get.arguments : null,
                cariModel: Get.arguments is CariListesiModel ? Get.arguments : null,
              );
            },
          ),
          GetPage(
            name: "/stokYeniKayit",
            page: () => StokYeniKayitView(model: Get.arguments),
          ),
          GetPage(
            name: "/fiyatOzeti",
            page: () => FiyatOzetiView(model: Get.arguments),
          ),
          GetPage(name: "/paketleme", page: PaketlemeListesiView.new),
          GetPage(
            name: "/paketIcerigi",
            page: () => PaketIcerigiView(model: Get.arguments),
          ),

          //* Stok Raporları
          GetPage(
            name: "/stokAmbarMaliyetRaporu",
            page: () => AmbarMaliyetRaporuView(model: Get.arguments),
          ),
          GetPage(
            name: "/stokLokalDepoBakiyeRaporu",
            page: () => LokalDepoBakiyeRaporuView(model: Get.arguments),
          ),
          GetPage(
            name: "/urunGrubunaGoreSatisGrafigi",
            page: () =>
                UrunGrubunaGoreSatisGrafigiView(model: Get.arguments is CariListesiModel ? Get.arguments : null),
          ),

          //! Faturalar
          GetPage(
            name: "/faturaEdit",
            page: () => BaseFaturaEditView(model: Get.arguments),
          ),
          //* Mal Kabul
          GetPage(
            name: "/malKabulAlisFaturasi",
            page: () => FaturalarView(editTipiEnum: EditTipiEnum.alisFatura, isGetData: Get.arguments),
          ),
          GetPage(
            name: "/malKabulAlisIrsaliyesi",
            page: () => FaturalarView(editTipiEnum: EditTipiEnum.alisIrsaliye, isGetData: Get.arguments),
          ),
          GetPage(
            name: "/sevkiyatAlisFaturaKalemRaporu",
            page: () => const MalKabulSevkiyatKalemRaporuView(editTipiEnum: EditTipiEnum.alisFatura),
          ),
          GetPage(
            name: "/sevkiyatAlisIrsaliyeKalemRaporu",
            page: () => const MalKabulSevkiyatKalemRaporuView(editTipiEnum: EditTipiEnum.alisIrsaliye),
          ),

          //* Sevkiyat
          GetPage(
            name: "/sevkiyatSatisFaturasi",
            page: () => FaturalarView(editTipiEnum: EditTipiEnum.satisFatura, isGetData: Get.arguments),
          ),
          GetPage(
            name: "/sevkiyatSatisFaturasiOzel",
            page: () =>
                FaturalarView(editTipiEnum: EditTipiEnum.satisFatura, isGetData: true, isFromRapor: Get.arguments),
          ),
          GetPage(name: "/malToplama", page: MalToplamaView.new),
          GetPage(
            name: "/sevkiyatSatisIrsaliyesi",
            page: () => FaturalarView(editTipiEnum: EditTipiEnum.satisIrsaliye, isGetData: Get.arguments),
          ),
          GetPage(
            name: "/sevkiyatSatisFaturaKalemRaporu",
            page: () => const MalKabulSevkiyatKalemRaporuView(editTipiEnum: EditTipiEnum.satisFatura),
          ),
          GetPage(
            name: "/sevkiyatSatisIrsaliyeKalemRaporu",
            page: () => const MalKabulSevkiyatKalemRaporuView(editTipiEnum: EditTipiEnum.satisIrsaliye),
          ),
          GetPage(name: "/faturaKarlilikRaporu", page: () => const FaturaKarlilikRaporuView()),

          //* * Faturalar Açıklama Düzenleme
          GetPage(
            name: "/faturaAlisFaturasiAciklamaDuzenle",
            page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.alisFatura),
          ),
          GetPage(
            name: "/faturaAlisIrsaliyesiAciklamaDuzenle",
            page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.alisIrsaliye),
          ),
          GetPage(
            name: "/faturaSatisFaturasiAciklamaDuzenle",
            page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.satisFatura),
          ),
          GetPage(
            name: "/faturaSatisIrsaliyesiAciklamaDuzenle",
            page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.satisIrsaliye),
          ),

          //* * İrsaliye Faturalaştırma
          GetPage(
            name: "/irsaliyeFaturalastir",
            page: () => IrsaliyeFaturalastirView(model: Get.arguments),
          ),

          //* Profil
          GetPage(name: "/temsilciProfil", page: TemsilciProfilView.new),

          //* Talep Teklif
          GetPage(
            name: "/talTekSatisTalep",
            page: () => TalepTeklifListesiView(talepTeklifEnum: TalepTeklifEnum.satisTalep, isGetData: Get.arguments),
          ),
          GetPage(
            name: "/talTekSatisTeklif",
            page: () => TalepTeklifListesiView(talepTeklifEnum: TalepTeklifEnum.satisTeklif, isGetData: Get.arguments),
          ),
          GetPage(
            name: "/talTekAlisTalep",
            page: () => TalepTeklifListesiView(talepTeklifEnum: TalepTeklifEnum.alisTalep, isGetData: Get.arguments),
          ),

          //* * Talep Teklif Edit
          GetPage(
            name: "/talTekEdit",
            page: () => BaseTalepTeklifEditingView(model: Get.arguments),
          ),

          //* * Talep Açıklama Düzenleme
          GetPage(
            name: "/talTekSatisTalepAciklamaDuzenle",
            page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.satisTalebi),
          ),
          GetPage(
            name: "/talTekSatisTeklifAciklamaDuzenle",
            page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.satisTeklifi),
          ),
          GetPage(
            name: "/talTekAlisTalepAciklamaDuzenle",
            page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.alisTalebi),
          ),

          //* Transfer
          GetPage(
            name: "/transferDepo",
            page: () => TransferlerView(editTipiEnum: EditTipiEnum.depoTransferi, isGetData: Get.arguments ?? false),
          ),
          GetPage(
            name: "/transferAmbarGiris",
            page: () => TransferlerView(editTipiEnum: EditTipiEnum.ambarGirisi, isGetData: Get.arguments ?? false),
          ),
          GetPage(
            name: "/transferAmbarCikis",
            page: () => TransferlerView(editTipiEnum: EditTipiEnum.ambarCikisi, isGetData: Get.arguments ?? false),
          ),
          GetPage(name: "/transferMalTalebi", page: () => const TransferMalTalebiListesiView(talepMi: true)),
          GetPage(name: "/transferMalToplama", page: () => const TransferMalTalebiListesiView(talepMi: false)),
          GetPage(
            name: "/transferTalepToplananlar",
            page: () => DepoTalepToplananlarView(model: Get.arguments),
          ),

          //* * Transfer Açıklama Düzenleme
          GetPage(
            name: "/transferDepoAciklamaDuzenle",
            page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.depoTransferi),
          ),
          GetPage(
            name: "/transferAmbarGirisiAciklamaDuzenle",
            page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.ambarGirisi),
          ),
          GetPage(
            name: "/transferAmbarCikisiAciklamaDuzenle",
            page: () => AciklamaDuzenleView(model: Get.arguments, editEnum: EditTipiEnum.ambarCikisi),
          ),

          //* * Transfer Edit
          GetPage(
            name: "/transferEdit",
            page: () => BaseTransferEditingView(model: Get.arguments),
          ),
          GetPage(
            name: "/transferMalToplamaEdit",
            page: () => DepoTalepMalToplamaView(model: Get.arguments),
          ),
          GetPage(
            name: "/transferMalTalebiEdit",
            page: () => TransferMalTalebiEditView(model: Get.arguments),
          ),

          //* * Depo Mal Talebi
          GetPage(
            name: "/depoMalTalebiKalemEkle",
            page: () => DepoTalepKalemDetayView(model: Get.arguments, isTalep: true),
          ),
          GetPage(
            name: "/depoMalToplamaKalemEkle",
            page: () => DepoTalepKalemDetayView(model: Get.arguments, isTalep: false),
          ),

          //* Üretim

          //* * Üretim Sonu Kaydı
          GetPage(name: "/uretimSonuKaydi", page: UretimSonuKaydiListesiView.new),
          GetPage(
            name: "/uretimSonuKaydiEdit",
            page: () => UretimSonuKaydiEditView(model: Get.arguments),
          ),
          GetPage(
            name: "/uretimFireBilgileri",
            page: () => UretimFireBilgileriView(model: Get.arguments),
          ),
          GetPage(
            name: "/uretimSonuKaydiKalemEdit",
            page: () => UretimSonuKaydiKalemEkleView(model: Get.arguments),
          ),
          GetPage(
            name: "/uretimSonuRaporu",
            page: () => UretimSonuRaporuView(model: Get.arguments),
          ),
          GetPage(
            name: "/uskSeriListesi",
            page: () => UretimSonuKaydiSeriListesi(model: Get.arguments),
          ),

          //* * İş Emirleri
          GetPage(
            name: "/isEmriRehberiOzel",
            page: () => IsEmriRehberiView(isGetData: true, stokKodu: Get.arguments),
          ),
          GetPage(name: "/isEmriRehberi", page: IsEmriRehberiView.new),
          GetPage(
            name: "/isEmriEdit",
            page: () => IsEmriEditView(model: Get.arguments),
          ),
          GetPage(name: "/isEmriHammaddeTakibi", page: IsEmriHammaddeTakibiView.new),
          GetPage(
            name: "/isEmriHammaddeTakibiDetay",
            page: () => IsEmriHammaddeTakibiDetayView(model: Get.arguments),
          ),

          //* Kalite-Kontrol
          GetPage(name: "/olcumGirisi", page: OlcumGirisiListesiView.new),
          GetPage(
            name: "/olcumKalemSec",
            page: () => OlcumKalemSecView(model: Get.arguments),
          ),
          GetPage(
            name: "/olcumDetay",
            page: () => OlcumBelgeEditView(model: Get.arguments),
          ),
          GetPage(
            name: "/prosesEkle",
            page: () => ProsesEkleView(model: Get.arguments),
          ),
          GetPage(
            name: "/olcumEkle",
            page: () => OlcumEkleView(model: Get.arguments, baseEditEnum: BaseEditEnum.ekle),
          ),
          GetPage(
            name: "/olcumGoruntule",
            page: () => OlcumEkleView(model: Get.arguments, baseEditEnum: BaseEditEnum.goruntule),
          ),
          GetPage(
            name: "/olcumDuzenle",
            page: () => OlcumEkleView(model: Get.arguments, baseEditEnum: BaseEditEnum.duzenle),
          ),

          //* Hücre Takibi
          GetPage(name: "/hucreListesi", page: HucreListesiView.new),
          GetPage(
            name: "/hucreListesiOzel",
            page: () => HucreListesiView(depoKodu: Get.arguments),
          ),
          GetPage(name: "/hucreTransferi", page: HucreTransferiView.new),
          GetPage(
            name: "/hucreHareketleri",
            page: () => HucreHareketleriView(model: Get.arguments),
          ),
          GetPage(
            name: "/hucredekiStoklar",
            page: () => HucredekiStoklarView(model: Get.arguments),
          ),
          GetPage(name: "/hucreTakibiStoklar", page: HucreTakibiStoklarView.new),
          GetPage(name: "/hucreAra", page: HucreAraView.new),
          GetPage(
            name: "/hucreEditYerlestir",
            page: () => const BaseHucreEditView(islemTuru: HucreTakibiIslemTuruEnum.hucreYerlestir),
          ),
          GetPage(
            name: "/hucreEditBosalt",
            page: () => const BaseHucreEditView(islemTuru: HucreTakibiIslemTuruEnum.hucreBosalt),
          ),
          GetPage(
            name: "/belgeRehberi",
            page: () => BelgeRehberiView(model: Get.arguments),
          ),

          //* Payker
          GetPage(name: "/paykerTahsilat", page: PaykerTahsilatView.new),
          GetPage(name: "/paykerOdemeListesiOzel", page: () => PaykerOdemeListesiView(isGetData: Get.arguments)),

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

    builder: (context, child) {
      if (child != null) {
        if (context.isLandscape) {
          if (context.device.isIOSDevice) return SafeArea(top: false, bottom: false, child: child);
          if (kIsWeb) {
            return SizedBox(
              width: (kIsWeb && (Get.context?.isLandscape ?? false)) ? getWidth(context) : null,
              child: child,
            );
          }
        }
        return child;
      }
      return const SizedBox.shrink();
    },
  );
}

double getWidth(BuildContext context) => MediaQuery.of(context).size.width * 0.8;
