import "package:collection/collection.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/view/masraf_kodu/model/masraf_kodu_rehberi_model.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "package:picker/view/main_page/model/user_model/kullanici_yetki_model.dart";

import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/model/main_page_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../../view/main_page/model/user_model/profil_yetki_model.dart";
import "../../../view/main_page/model/user_model/user_model.dart";
import "../../base/model/base_proje_model.dart";
import "../../init/cache/cache_manager.dart";
import "../enum/barkod_tipi_enum.dart";
import "../enum/edit_tipi_enum.dart";
import "yetki_model.dart";

final class YetkiController {
  factory YetkiController() => _singleton;

  YetkiController._internal();
  //* Singleton
  static final YetkiController _singleton = YetkiController._internal();

  MainPageModel? get _anaVeri => CacheManager.getAnaVeri;

  UserModel? get _userModel => _anaVeri?.userModel;

  ParamModel? get _paramModel => _anaVeri?.paramModel;

  ProfilYetkiModel? get _profilYetkiModel => _userModel?.profilYetki;

  KullaniciYetkiModel? get _kullaniciYetkiModel => _userModel?.kullaniciYetki;

  /// Verilen değer `null` ise `false` döndürür
  ///
  /// Eğer Admin ise `true` döndürür.
  /// Bunu yapma sebebim `null` gelen verilerin admin sebepli mi yoksa yetki sebepli mi olduğunu anlamak
  ///
  /// ! `EĞER ParamModel'den geliyorsa skipAdmin: true yapılmalı, YetkiModel'den geliyorsa skipAdmin: false kalmalı`
  // bool _isTrue(bool? value, {bool skipAdmin = false}) => (value ?? false) || (skipAdmin ? false : (userModel?.adminMi ?? false));
  // * Adminse artık her şeye erişiyor 1.3.0
  bool _isTrue(bool? value, {bool skipAdmin = false}) => (value ?? false) || (skipAdmin ? false : adminMi);

  //! GENEL

  bool get adminMi => _userModel?.admin ?? false;
  List<DepoList>? get _yetkiliDepoList {
    if (["T", null].contains(_kullaniciYetkiModel?.sirketDepoYetkiTuru) || adminMi) return _paramModel?.depoList;
    return _paramModel?.depoList
        ?.where(
          (element) => _isTrue(
            _kullaniciYetkiModel?.sirketDepoYetkiTuru == null
                ? (_kullaniciYetkiModel?.sirketAktifDepolar?.contains(element.depoKodu) ??
                    _profilYetkiModel?.sirketAktifDepolar?.contains(element.depoKodu))
                : _profilYetkiModel?.sirketAktifDepolar?.contains(element.depoKodu),
          ),
        )
        .toList();
  }

  List<DepoList>? get yetkiliDepoList {
    if (_kullaniciYetkiModel?.sirketDepoYetkiTuru == "T" || adminMi) return _paramModel?.depoList;
    return _yetkiliDepoList
        ?.where(
          (element) =>
              [AccountModel.instance.aktifSubeKodu, null].contains(element.subeKodu) &&
              _isTrue(_kullaniciYetkiModel?.sirketAktifDepolar?.contains(element.depoKodu)),
        )
        .toList();
  }

  List<DepoList>? get yetkiliDatDepoList {
    if (_kullaniciYetkiModel?.sirketDepoYetkiTuru == "T" || adminMi) return _paramModel?.depoList;
    return _paramModel?.depoList
        ?.where(
          (element) => _isTrue(
            (_kullaniciYetkiModel?.sirketDatYetkiliDepolar.ext.isNullOrEmpty ?? false) ||
                (_kullaniciYetkiModel?.sirketDatYetkiliDepolar?.contains(element.depoKodu) ?? false),
          ),
        )
        .toList();
  }

  // Future<BaseProjeModel?> get varsayilanProje async => (await NetworkManager().getProjeData())?.where((element) => element.projeKodu == _yetkiModel?.sirketProjeKodu).firstOrNull;
  PlasiyerList? get varsayilanPlasiyer =>
      _kullaniciYetkiModel?.varsayilanPlasiyerKodu != null &&
              _paramModel?.plasiyerList?.any(
                    (element) => element.plasiyerKodu == _kullaniciYetkiModel?.varsayilanPlasiyerKodu,
                  ) ==
                  true
          ? PlasiyerList(
            plasiyerKodu: _kullaniciYetkiModel?.varsayilanPlasiyerKodu,
            plasiyerAciklama:
                _kullaniciYetkiModel?.varsayilanPlasiyerTanimi ??
                _paramModel?.plasiyerList
                    ?.firstWhereOrNull(
                      (element) => element.plasiyerKodu == _kullaniciYetkiModel?.varsayilanPlasiyerKodu,
                    )
                    ?.plasiyerAciklama,
          )
          : null;
  BaseProjeModel? get varsayilanProje =>
      _kullaniciYetkiModel?.varsayilanProjeKodu != null
          ? BaseProjeModel(
            projeKodu: _kullaniciYetkiModel?.varsayilanProjeKodu,
            projeAciklama: _kullaniciYetkiModel?.varsayilanProjeTanimi,
          )
          : null;

  KasaList? get varsayilanNakitKasa => _paramModel?.kasaList?.firstWhereOrNull(
    (element) => element.kasaKodu == _kullaniciYetkiModel?.varsayilanNakitKasa,
  );
  KasaList? get varsayilanKrediKartiKasa => _paramModel?.kasaList?.firstWhereOrNull(
    (element) => element.kasaKodu == _kullaniciYetkiModel?.varsayilanKrediKartiKasa,
  );

  bool get alisTopluDepoKullan => _isTrue(_paramModel?.alisTopluDepoAktif);
  bool get satisTopluDepoKullan => _isTrue(_paramModel?.satisTopluDepoAktif);
  bool topluDepoKullan(EditTipiEnum? editTipi) =>
      editTipi?.satisMi == true ? satisTopluDepoKullan : alisTopluDepoKullan;
  bool projeYetkisiVarMi(String? projeKodu) => _isTrue(
    _profilYetkiModel?.sirketAktifProjeler == null ||
        (_profilYetkiModel?.sirketAktifProjeler?.contains(projeKodu) ?? true),
  );
  bool genIsk1AktifMi(EditTipiEnum? editTipi) =>
      editTipi?.satisMi == true ? siparisSSGenIsk1AktifMi : siparisMSGenIsk1AktifMi;
  bool genIsk2AktifMi(EditTipiEnum? editTipi) =>
      editTipi?.satisMi == true ? siparisSSGenIsk2AktifMi : siparisMSGenIsk2AktifMi;
  bool genIsk3AktifMi(EditTipiEnum? editTipi) =>
      editTipi?.satisMi == true ? siparisSSGenIsk3AktifMi : siparisMSGenIsk3AktifMi;
  bool get genelDovizEkle => _isTrue(_profilYetkiModel?.genelDovizKurlariEkle);
  bool get genelDovizDuzenle => _isTrue(_profilYetkiModel?.genelDovizKurlariDuzelt);
  bool get genelDovizSil => _isTrue(_profilYetkiModel?.genelDovizKurlariSil);
  bool muhRefSorulsun(EditTipiEnum? editTipi) {
    if (editTipi.talepTeklifMi) {
      return taltekMuhRefSorulsun;
    } else if (editTipi?.satisMi == true) {
      return satisMuhRefSorulsun;
    } else {
      return alisMuhRefSorulsun;
    }
  }

  //! Şirket

  bool kosulAktif(EditTipiEnum? editTipi) =>
      _isTrue(editTipi?.satisMi == true ? _paramModel?.satisKosulAktif : _paramModel?.alisKosulAktif, skipAdmin: true);

  bool get kontrolluBelgeAktarimAktif => _isTrue(_paramModel?.kontrolluBelgeAktarimAktif, skipAdmin: true);
  bool kontrolluAktarBelgeTipleri(String? belgeTuru) =>
      _isTrue(
        kontrolluBelgeAktarimAktif &&
            (_profilYetkiModel?.sirketKontrolluAktarBelgeTipleri?.contains(belgeTuru) ?? false),
      ) &&
      !adminMi;

  bool get satisMuhRefSorulsun => _isTrue(_paramModel?.satisMuhRefKodSorulsun, skipAdmin: true);
  bool get alisMuhRefSorulsun => _isTrue(_paramModel?.alisMuhRefKodSorulsun, skipAdmin: true);
  bool get taltekMuhRefSorulsun =>
      _isTrue(_paramModel?.talTekParam?.firstOrNull?.muhrefkodSorulsun == "E", skipAdmin: true);

  bool get alisMiktar1Gelsin => _isTrue(_paramModel?.alisMiktar1Gelsin, skipAdmin: true);
  bool get satisMiktar1Gelsin => _isTrue(_paramModel?.satisMiktar1Gelsin, skipAdmin: true);

  int get satisKademeliIskontoSayisi => _paramModel?.satisSatirKademeliIskontoSayisi ?? 0;
  int get alisKademeliIskontoSayisi => _paramModel?.alisSatirKademeliIskontoSayisi ?? 0;

  StokMuhasebeKoduModel? get varsayilanMuhRefKodu {
    if (_kullaniciYetkiModel?.varsayilanMuhasebeReferansKodu == null) return null;
    return StokMuhasebeKoduModel()
      ..hesapKodu = _kullaniciYetkiModel?.varsayilanMuhasebeReferansKodu
      ..hesapAdi = _kullaniciYetkiModel?.varsayilanMuhasebeReferansTanimi;
  }

  bool get projeUygulamasiAcikMi => _isTrue(_paramModel?.projeUygulamasiAcik, skipAdmin: true);
  bool get plasiyerUygulamasiAcikMi => _isTrue(_paramModel?.plasiyerUygulamasi, skipAdmin: true);
  bool get karmaKoliUygulamasiAcikMi => _isTrue(_paramModel?.karmaKoliUyg == "E", skipAdmin: true);
  bool get lokalDepoUygulamasiAcikMi => _isTrue(_paramModel?.lokalDepoUygulamasiAcik, skipAdmin: true);
  bool get seriUygulamasiAcikMi => _isTrue(_paramModel?.seriUygulamasiAcik, skipAdmin: true);

  bool get alisEkAlan1AktifMi => _isTrue(_paramModel?.alisEkAlan1Aktif, skipAdmin: true);
  bool get alisEkAlan2AktifMi => _isTrue(_paramModel?.alisSatirdaEkAlan2Aktif, skipAdmin: true);
  bool get satisEkAlan1AktifMi => _isTrue(_paramModel?.satisEkAlan1Aktif, skipAdmin: true);
  bool get satisEkAlan2AktifMi => _isTrue(_paramModel?.satisSatirdaEkAlan2Aktif, skipAdmin: true);

  //! TEMSİLCİ
  bool get temsilciProfilKdvDahilMi => _isTrue(_profilYetkiModel?.temsilciProfilKdvDahil, skipAdmin: true);
  bool get temsilciProfilSatisPerformansiniGizle =>
      _isTrue(_profilYetkiModel?.temsilciProfilSatisPerformansiniGizle, skipAdmin: true);
  bool get temsilciProfilAylaraGoreSatisiGizle =>
      _isTrue(_profilYetkiModel?.temsilciProfilAylaraGoreSatisiGizle, skipAdmin: true);
  bool get temsilciProfilAylaraGoreTahsilatiGizle =>
      _isTrue(_profilYetkiModel?.temsilciProfilAylaraGoreTahsilatiGizle, skipAdmin: true);

  //! CARİ

  bool get cariListesi => _isTrue(_profilYetkiModel?.cariCariListesi);
  bool get cariRapStokSatisOzeti => _isTrue(_profilYetkiModel?.cariRapStokSatisOzeti);
  bool get cariListesiRiskGorebilir => _isTrue(_profilYetkiModel?.cariCariListesiRiskGorebilir);
  bool get cariToplamGorunmesin => _isTrue(_profilYetkiModel?.cariToplamGorunmesin, skipAdmin: true);

  //* Cari Kartı
  bool get cariKarti => _isTrue(_profilYetkiModel?.cariCariKarti);
  bool get cariKartiYeniKayit => _isTrue(_profilYetkiModel?.cariCariKartiKaydet);
  bool get cariKartiDuzenleme => _isTrue(_profilYetkiModel?.cariCariKartiDuzelt);
  bool get cariKartiSilme => _isTrue(_profilYetkiModel?.cariCariKartiSil);
  bool get cariKartiRotasUygulamasiAcikMi => _isTrue(_paramModel?.cariRotaUygulamasi == "E", skipAdmin: true);

  bool cariKartiDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.cariCariKartiDegismeyecekAlanlar?.contains(index), skipAdmin: true);

  //* Cari Hareketleri
  bool get cariHareketleri => _isTrue(_profilYetkiModel?.cariCariHareketleri);
  bool get cariHareketleriYeniKayit => _isTrue(_profilYetkiModel?.cariCariHarKaydet);
  bool get cariHareketleriDuzenleme => _isTrue(_profilYetkiModel?.cariCariHarDuzelt);
  bool get cariHareketleriSilme => _isTrue(_profilYetkiModel?.cariCariHarSil);
  bool get cariHareketleriHarDetayGorsun => _isTrue(_profilYetkiModel?.cariCariHareketleriHarDetayGorsun);
  bool get cariHareketleriPlasiyerKendiniGorsun => _isTrue(_profilYetkiModel?.stokCariHarPlasiyerKendiniGorsun);

  //* Cari Aktivite
  bool get cariAktivite => _isTrue(_profilYetkiModel?.cariAktivite);
  bool get cariAktiviteDetayliMi => _isTrue(_paramModel?.cariAktiviteUygulamasi == "D", skipAdmin: true);
  bool get cariAktiviteYeniKayit => _isTrue(_profilYetkiModel?.cariAktiviteEkle);
  bool get cariAktiviteDuzenleme => _isTrue(_profilYetkiModel?.cariAktiviteDuzelt);
  bool get cariAktiviteSilme => _isTrue(_profilYetkiModel?.cariAktiviteSil);
  bool get cariBakiyeGosterimTumuMu => _isTrue(_profilYetkiModel?.cariBakiyeGosterim == "T");
  bool get cariBakiyeGosterimKendiCarileriMi => _isTrue(_profilYetkiModel?.cariBakiyeGosterim == "K", skipAdmin: true);
  bool get cariAktiviteAtayabilir => _isTrue(_profilYetkiModel?.cariAktiviteAtayabilir);
  bool get cariAktiviteBitirmeyiGeriAl => _isTrue(_profilYetkiModel?.cariAktiviteBitirmeyiGeriAl);

  //! STOK

  bool get stokListesi => _isTrue(_profilYetkiModel?.stokStokListesi);
  bool get stokFiyatGorEkrani => _isTrue(_profilYetkiModel?.stokFiyatGorEkrani);
  bool stokFiyatGorEkraniGorunecekAlanlar(String value) =>
      _isTrue(_profilYetkiModel?.stokFiyatGorEkraniGorunecekAlanlar?.contains(value));
  bool get _stokSatisFiyatGor => [
    "satis_doviz_fiyati",
    "satis_fiyat1",
    "satis_fiyat2",
    "satis_fiyat3",
    "satis_fiyat4",
  ].any(stokFiyatGorEkraniGorunecekAlanlar);
  bool get _stokAlisFiyatGor => [
    "alis_doviz_fiyati",
    "alis_fiyat1",
    "alis_fiyat2",
    "alis_fiyat3",
    "alis_fiyat4",
  ].any(stokFiyatGorEkraniGorunecekAlanlar);
  bool stokSatisTuruneGoreFiyatGor(EditTipiEnum? editTipi) =>
      editTipi?.satisMi == true ? _stokSatisFiyatGor : _stokAlisFiyatGor;
  bool get stokFiyatGoster => _isTrue(!_isTrue(_profilYetkiModel?.stokStokKartiFiyatlariGizle));
  bool get stokAlisFiyatGoster => _isTrue(!_isTrue(_profilYetkiModel?.stokStokKartiAlisFiyatiGizle));
  bool get stokSatisFiyatGoster => _isTrue(!_isTrue(_profilYetkiModel?.stokStokKartiSatisFiyatiGizle));
  bool get stokFiyatOzeti => _isTrue(_profilYetkiModel?.stokFiyatOzeti);

  bool stokListesiExtraAlanlar(String value) =>
      _isTrue(_profilYetkiModel?.stokStokListesiExtraAlanlar?.contains(value), skipAdmin: true);

  //* Seri İşlemleri
  bool get seriIslemleri => _isTrue(_paramModel?.seriUygulamasiAcik);
  // bool get seriIslemEkle => _isTrue(_yetkiModel?.kaydet)

  //* Stok Kartı
  bool get stokKarti => _isTrue(_profilYetkiModel?.stokStokKarti);
  bool get stokDepoBakiyeDurumu => _isTrue(
    _profilYetkiModel?.stokDepoBakiyeDurumu == null
        ? true
        : _profilYetkiModel?.stokDepoBakiyeDurumu == "E"
        ? true
        : false,
  );
  bool get stokKartiYeniKayit => _isTrue(_profilYetkiModel?.stokStokKartiKaydet);
  bool get stokKartiDuzenleme => _isTrue(_profilYetkiModel?.stokStokKartiDuzelt);
  bool get stokKartiSilme => _isTrue(_profilYetkiModel?.stokStokKartiSil);
  bool get stokSatisFiyatiGizle => _isTrue(_profilYetkiModel?.stokStokKartiSatisFiyatiGizle);

  //* Stok Hareketleri
  bool get stokHareketleriStokHareketleri => _isTrue(_profilYetkiModel?.stokStokHareketleri);
  bool get stokHareketleriStokYeniKayit => _isTrue(_profilYetkiModel?.stokStokHarKaydet);
  bool get stokHareketleriStokDuzenleme => _isTrue(_profilYetkiModel?.stokStokHarDuzelt);
  bool get stokHareketleriStokSilme => _isTrue(_profilYetkiModel?.stokStokHarSil);
  bool get stokHareketleriPlasiyerKendiniGorsun => _isTrue(_profilYetkiModel?.stokStokHarPlasiyerKendiniGorsun);
  bool get stokHareketDetayiniGizle => _isTrue(_profilYetkiModel?.stokHareketDetayiniGizle ?? false, skipAdmin: true);

  //* Stok Resim
  bool get stokResimGoster => _isTrue(_profilYetkiModel?.stokResimGoster);
  bool get stokResimEkle => _isTrue(_profilYetkiModel?.stokResimGosterEkle);
  bool get stokResimSil => _isTrue(_profilYetkiModel?.stokResimGosterSil);

  //* Stok Barkod
  bool get stokBarkodKontrol => _isTrue(_profilYetkiModel?.stokBarkodKontrol);
  bool get stokBarkodTanimla => _isTrue(_profilYetkiModel?.stokBarkodTanimlama);
  bool get stokBarkodKayitlari => _isTrue(_profilYetkiModel?.stokBarkodKayitlari);
  bool get stokBarkodEkle => _isTrue(_profilYetkiModel?.stokBarkodKayitlariEkle);
  bool get stokBarkodDuzenle => _isTrue(_profilYetkiModel?.stokBarkodKayitlariDuzelt);
  bool get stokBarkodSil => _isTrue(_profilYetkiModel?.stokBarkodKayitlariSil);
  bool get stokBarkodStokKartiGorunsun =>
      _isTrue(_profilYetkiModel?.stokBarkodKayitlariGecerliOlcuBirimleri?.isNotEmpty);
  List<BarkodTipiEnum> get stokBarkodGecerliBarkodTipleri =>
      BarkodTipiEnum.values
          .where(
            (element) =>
                _profilYetkiModel?.stokBarkodKayitlariGecerliBarkodTipleri?.any(
                  (element2) => element2 == element.barkodTipi,
                ) ??
                adminMi,
          )
          .toList();

  bool stokBarkodGorunecekAlanlar(String value) => _isTrue(
    (_profilYetkiModel?.stokBarkodTanimlamaGorunecekAlanlar.ext.isNullOrEmpty ?? false) ||
        (_profilYetkiModel?.stokBarkodTanimlamaGorunecekAlanlar?.contains(value) ?? false),
  );

  //* Paketleme
  bool get stokPaketlemeSil => _isTrue(_profilYetkiModel?.stokPaketlemeSil);
  bool get stokPaketlemeEkle => _isTrue(_profilYetkiModel?.stokPaketlemeEkle);
  bool get stokPaketlemeCoklu => _isTrue(_profilYetkiModel?.stokPaketlemeCoklu);
  bool get stokPaketlemeDigerKulKayitGorebilir =>
      _isTrue(_profilYetkiModel?.stokPaketlemeDigerKulKayitGorebilir == "E");
  bool get stokPaketlemeOnaySormasin => _isTrue(_profilYetkiModel?.stokPaketlemeOnaySormasin == "E", skipAdmin: true);

  bool get teslimCarideBaglanmisCarilerSecilsinMi {
    if (cariTeslimCariSatisBaglanmisCarilerSecilsinMi) {
      return true;
    }
    if (BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false) {
      return _paramModel?.satisTeslimCarideBaglanmisCarilerSecilsin ?? false;
    } else {
      return _paramModel?.alisTeslimCarideBaglanmisCarilerSecilsin ?? false;
    }
  }

  bool get cariTeslimCariSatisBaglanmisCarilerSecilsinMi =>
      _profilYetkiModel?.cariTeslimCariSatisBaglanmisCarilerSecilsin == "E";

  bool get cariTeslimCariRehberSadeceSecsin => _profilYetkiModel?.cariTeslimCariRehberSadeceSecsin == "E";

  //! Sipariş
  bool get siparisMSDurumRaporuFiyatGor => _isTrue(_profilYetkiModel?.siparisMusteriSiparisiDurumRaporuFiyatGor);
  bool get siparisSSDurumRaporuFiyatGor => _isTrue(_profilYetkiModel?.siparisSaticiSiparisiDurumRaporuFiyatGor);
  bool _musteriSiparisiMi(EditTipiEnum? editTipi) => editTipi?.musteriMi == true;
  bool get siparisKdvDahilMi {
    if (_profilYetkiModel?.siparisMusSipKdvDurumu == "D") return true;
    if (_profilYetkiModel?.siparisMusSipKdvDurumu == "H") return false;
    return !genellikleKdvHaricMi;
  }

  bool get genellikleKdvHaricMi {
    if (BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false) {
      return _paramModel?.satisGenellikleKdvHaric ?? false;
    } else {
      return _paramModel?.alisGenellikleKdvHaric ?? false;
    }
  }

  //* Genel Sipariş Yetkileri

  bool ekMaliyet2Aktif(EditTipiEnum? editTipi) => _isTrue(
    editTipi?.satisMi == true ? _paramModel?.satisEkMaliyet2Aktif : _paramModel?.alisEkMaliyet2Aktif,
    skipAdmin: true,
  );

  String? siparisSatisEkMaliyet2Adi(EditTipiEnum? editTipi) =>
      _paramModel?.listFatuEkMaliyet?.firstWhereOrNull((element) => element.belgeTipi == editTipi?.rawValue)?.adi ??
      (_musteriSiparisiMi(editTipi) ? _paramModel?.satisEkMaliyet2Adi : _paramModel?.alisEkMaliyet2Adi);
  int siparisSatirKademeliIskontoSayisi(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi)
          ? _paramModel?.satisSatirKademeliIskontoSayisi ?? 0
          : _paramModel?.alisSatirKademeliIskontoSayisi ?? 0;
  bool get msOnayIslemleri => _isTrue(_profilYetkiModel?.siparisMusSipOnayIslemleri);
  bool get ssOnayIslemleri => _isTrue(_profilYetkiModel?.siparisSaticiSipOnayIslemleri);

  bool siparisOnayIslemleri(String? belgeTuru) {
    if (belgeTuru == "MS") {
      return msOnayIslemleri;
    } else if (belgeTuru == "SS") {
      return ssOnayIslemleri;
    }
    return false;
  }

  bool siparisGenIsk1AktifMi(EditTipiEnum? editTipi) =>
      (_musteriSiparisiMi(editTipi) ? siparisMSGenIsk1AktifMi : siparisSSGenIsk1AktifMi) &&
      siparisMSDegismeyecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanGenIsk1);
  bool siparisGenIsk2AktifMi(EditTipiEnum? editTipi) =>
      (_musteriSiparisiMi(editTipi) ? siparisMSGenIsk2AktifMi : siparisSSGenIsk2AktifMi) &&
      siparisMSDegismeyecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanGenIsk2);
  bool siparisGenIsk3AktifMi(EditTipiEnum? editTipi) =>
      (_musteriSiparisiMi(editTipi) ? siparisMSGenIsk3AktifMi : siparisSSGenIsk3AktifMi) &&
      siparisMSDegismeyecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanGenIsk3);
  bool siparisDuzelt(EditTipiEnum? editTipi) => _musteriSiparisiMi(editTipi) ? siparisMSDuzelt : siparisSSDuzelt;
  bool siparisKaydet(EditTipiEnum? editTipi) => _musteriSiparisiMi(editTipi) ? siparisMSKaydet : siparisSSKaydet;
  bool siparisSil(EditTipiEnum? editTipi) => _musteriSiparisiMi(editTipi) ? siparisMSSil : siparisSSSil;
  bool siparisKapalilarListelenmesin(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi) ? siparisMSKapalilarListelenmesin : siparisSSKapalilarListelenmesin;
  bool siparisBirim1denKaydet(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi) ? siparisMSBirim1denKaydet : siparisSSBirim1denKaydet;
  bool siparisDigerSekmesiGoster(bool musteriMi) =>
      musteriMi ? siparisMSDigerSekmesiGoster : siparisSSDigerSekmesiGoster;
  bool siparisKosulAktifMi(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi) ? siparisMSKosulAktifMi : siparisSSKosulAktifMi;
  bool siparisKosulSatirdaSor(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi) ? (siparisMSKosulAktifMi && siparisMSKosulSatirdaSor) : siparisSSKosulAktifMi;
  bool siparisFarkliTeslimCariAktif(EditTipiEnum? editTipi) =>
      editTipi?.satisMi ?? false ? siparisMSFarkliTeslimCariAktif : siparisSSFarkliTeslimCariAktif;
  bool siparisMiktar2Sor(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi) ? siparisMSMiktar2Sor : siparisSSMiktar2Sor;
  bool siparisSatirdaKDVSor(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi) ? siparisMSsatirdaKDVSor : siparisSSsatirdaKDVSor;
  bool get siparisEkMaliyet1GizlenecekMi =>
      siparisMSGizlenecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet1);
  bool get siparisEkMaliyet2GizlenecekMi =>
      siparisMSGizlenecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet2);
  bool get siparisEkMaliyet3GizlenecekMi =>
      siparisMSGizlenecekAlanMi(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet3);
  bool siparisHizmetAktifMi(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi) ? siparisMSSatisHizmetAktifMi : siparisSSSatisHizmetAktifMi;
  bool siparisKontrolAciklamasiAktifMi(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi) ? siparisMSKontrolAciklamasiAktifMi : siparisSSKontrolAciklamasiAktifMi;
  bool siparisSatirdaEkAlan2AktifMi(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi) ? siparisMSSatirdaEkAlan2AktifMi : siparisSSSatirdaEkAlan2AktifMi;
  bool siparisEkAlan1AktifMi(EditTipiEnum? editTipi) => _musteriSiparisiMi(editTipi) ? siparisMSEkAlan1AktifMi : false;
  bool siparisSatirdaTeslimTarihiSor(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi) ? siparisMSsatirdaTeslimTarihiSor : siparisSSSatirdaTeslimTarihiSor;
  bool siparisFiyatDegistirilmesin(EditTipiEnum? editTipi) =>
      _musteriSiparisiMi(editTipi) ? siparisMSFiyatDegistirilmesin : siparisSSFiyatDegistirilmesin;

  //* Müşteri Siparişi
  //😳SatisSatirKademeliIskontoSayisi => 0 ise kademeli iskonto yok demektir. Kaç tane varsa o kadar genisk ve geniskTipi gelecek
  String? get siparisMSOzelKod1Degeri => _profilYetkiModel?.siparisMusSipOzelKod1Degeri;
  String? get siparisMSOzelKod2Degeri => _profilYetkiModel?.siparisMusSipOzelKod2Degeri;
  bool get siparisMSFiyatDegistirilmesin =>
      _isTrue(_profilYetkiModel?.siparisMusteriSiparisiFiyatDegistirilmesin, skipAdmin: true);
  bool get satisOzelKod1AktifMi => _isTrue(_paramModel?.satisOzelKod1Aktif ?? false, skipAdmin: true);
  bool get satisOzelKod2AktifMi => _isTrue(_paramModel?.satisOzelKod2Aktif, skipAdmin: true);
  bool get siparisMSGenIsk1AktifMi => _isTrue(_paramModel?.satisGenIsk1Aktif, skipAdmin: true);
  bool get siparisMSGenIsk2AktifMi => _isTrue(_paramModel?.satisGenIsk2Aktif, skipAdmin: true);
  bool get siparisMSGenIsk3AktifMi => _isTrue(_paramModel?.satisGenIsk3Aktif, skipAdmin: true);
  bool get siparisMSDuzelt => _isTrue(_profilYetkiModel?.siparisMusteriSiparisiDuzelt);
  bool get siparisMSKaydet => _isTrue(_profilYetkiModel?.siparisMusteriSiparisiKaydet);
  bool get siparisMSSil => _isTrue(_profilYetkiModel?.siparisMusteriSiparisiSil);
  bool get siparisMSCariKoduDegistir => _isTrue(_profilYetkiModel?.siparisMusSipCariKoduDegistir);
  bool get siparisMSKapalilarListelenmesin => _isTrue(_profilYetkiModel?.siparisMusteriSiparisiKapalilarListelenmesin);
  bool get siparisMSBirim1denKaydet => _isTrue(_profilYetkiModel?.siparisMusSipBirim1DenKaydet);
  bool get siparisMSKapatmaIslemi => _isTrue(_profilYetkiModel?.siparisMusteriSiparisiKapatmaIslemi);
  bool get siparisMSOnayIslemleri => _isTrue(_profilYetkiModel?.siparisMusSipOnayIslemleri);
  bool get siparisMSSonFiyatGoster => _isTrue(_profilYetkiModel?.siparisMusteriSiparisiSonFiyatGoster);
  bool get siparisMSDigerSekmesiGoster => _isTrue(_profilYetkiModel?.siparisMusSipDigerSekmesiGoster);
  bool get siparisMSKosulAktifMi => _isTrue(_paramModel?.satisKosulAktif, skipAdmin: true);
  bool get siparisMSKosulSatirdaSor => _isTrue(_paramModel?.satisKosulSatirdaSor, skipAdmin: true);
  bool get siparisMSFarkliTeslimCariAktif => _isTrue(_paramModel?.satisFarkliTeslimCariAktif, skipAdmin: true);
  bool get siparisMSMiktar2Sor => _isTrue(_paramModel?.satisMiktar2Sor, skipAdmin: true);
  bool siparisMSISk1YuzdeSor(EditTipiEnum? editTipi) =>
      _isTrue((_paramModel?.satisSatirIsk1YuzdeSor ?? false) && editTipi.musteriMi);
  bool get siparisMSsatirdaKDVSor => _isTrue(_paramModel?.satisSatirdaKdvSor, skipAdmin: true);
  bool get siparisMSSatisHizmetAktifMi => _isTrue(_paramModel?.satisHizmetAktif, skipAdmin: true);
  bool get siparisMSEkMaliyet2AktifMi => _isTrue(_paramModel?.satisEkMaliyet2Aktif, skipAdmin: true);
  bool get siparisMSEkAlan1AktifMi => _isTrue(_paramModel?.satisEkAlan1Aktif, skipAdmin: true);
  bool get siparisMSSatirdaEkAlan2AktifMi => _isTrue(_paramModel?.satisSatirdaEkAlan2Aktif, skipAdmin: true);
  bool get siparisMSSatirIsk1YuzdeSor => _isTrue(_paramModel?.satisSatirIsk1YuzdeSor, skipAdmin: true);
  bool get siparisMSsatirdaTeslimTarihiSor => _isTrue(_paramModel?.satisSatirdaTeslimTarihiSor, skipAdmin: true);

  bool siparisMSEkstraAlanlari(String value) =>
      _isTrue(_profilYetkiModel?.siparisMusSipEkstraAlanlar?.contains(value), skipAdmin: true);

  // bool get siparisMSbelgeKopyala => _isTrue(_yetkiModel?.siparisMusSipBelge);
  ///? Eğer içeriyorsa boş geçilecek
  bool siparisMSBosGecilecekAlanMi(String alan) =>
      _isTrue(!(_profilYetkiModel?.siparisMusSipBosGecilmeyecekAlanlar?.contains(alan) ?? false));

  ///? Eğer içeriyorsa gizlenecek
  bool siparisMSGizlenecekAlanMi(String alan) =>
      _isTrue(!(_profilYetkiModel?.siparisMusteriSiparisiGizlenecekAlanlar?.contains(alan) ?? false));
  bool get siparisMSKontrolAciklamasiAktifMi =>
      _isTrue(_paramModel?.fatuKontrolAciklamasiAktif?.contains("MS"), skipAdmin: true);

  ///? Eğer içeriyorsa değiştirilemeyecek
  bool siparisMSDegismeyecekAlanMi(String alan) =>
      _isTrue(!(_profilYetkiModel?.siparisMusteriSiparisiDegismeyecekAlanlar?.contains(alan) ?? false));

  ///? Eğer içeriyorsa gösterilecek (Sipariş için)
  bool siparisMSAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.siparisMusteriSiparisiAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.siparisMusteriSiparisiAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.siparisMusteriSiparisiAciklamaAlanlari?.contains(index)) ??
            false,
  );

  ///? Eğer içeriyorsa gösterilecek (Kalemler İçin)
  bool siparisSatirAciklamaAlanlari(EditTipiEnum? editTipi, int? index) =>
      editTipi?.satisMi ?? false ? siparisMSSatirAciklamaAlanlari(index) : siparisMSSatirAciklamaAlanlari(index);

  bool siparisSSSatirAciklamaAlanlari(int? index) =>
      (_paramModel?.alisSatirdaAciklamalarAktif ?? false) &&
      (index == null
          ? _isTrue(_profilYetkiModel?.siparisSaticiSiparisiSatirAciklamaAlanlari?.ext.isNotNullOrEmpty)
          : _isTrue(_profilYetkiModel?.siparisSaticiSiparisiSatirAciklamaAlanlari?.contains(index) ?? false));

  bool siparisMSSatirAciklamaAlanlari(int? index) =>
      (_paramModel?.satisSatirdaAciklamalarAktif ?? false) &&
      (index == null
          ? _isTrue(_profilYetkiModel?.siparisMusteriSiparisiSatirAciklamaAlanlari?.ext.isNotNullOrEmpty)
          : _isTrue(_profilYetkiModel?.siparisMusteriSiparisiSatirAciklamaAlanlari?.contains(index) ?? false));

  //* Satıcı Siparişi

  bool get siparisSSFiyatDegistirilmesin =>
      _isTrue(_profilYetkiModel?.siparisSaticiSiparisiFiyatDegistirilmesin, skipAdmin: true);
  bool get siparisSSKdvDahilMi => _isTrue(_paramModel?.alisGenellikleKdvHaric, skipAdmin: true);
  bool get siparisSSGenIsk1AktifMi => _isTrue(_paramModel?.alisGenIsk1Aktif, skipAdmin: true);
  bool get siparisSSGenIsk2AktifMi => _isTrue(_paramModel?.alisGenIsk2Aktif, skipAdmin: true);
  bool get siparisSSGenIsk3AktifMi => _isTrue(_paramModel?.alisGenIsk3Aktif, skipAdmin: true);
  bool get siparisSSDuzelt => _isTrue(_profilYetkiModel?.siparisSaticiSiparisiDuzelt);
  bool get siparisSSKaydet => _isTrue(_profilYetkiModel?.siparisSaticiSiparisiKaydet);
  bool get siparisSSSil => _isTrue(_profilYetkiModel?.siparisSaticiSiparisiSil);
  bool get siparisSSKapalilarListelenmesin => _isTrue(_profilYetkiModel?.siparisSaticiSiparisiKapalilarListelenmesin);
  bool get siparisSSBirim1denKaydet => _isTrue(_profilYetkiModel?.siparisSaticiSipBirim1DenKaydet);
  bool get siparisSSDigerSekmesiGoster => _isTrue(_profilYetkiModel?.siparisSaticiSipDigerSekmesiGoster);
  bool get siparisSSKosulAktifMi => _isTrue(_paramModel?.alisKosulAktif, skipAdmin: true);
  bool get siparisSSFarkliTeslimCariAktif => _isTrue(_paramModel?.alisFarkliTeslimCariAktif, skipAdmin: true);
  bool get siparisSSMiktar2Sor => _isTrue(_paramModel?.alisMiktar2Sor, skipAdmin: true);
  bool get siparisSSsatirdaKDVSor => _isTrue(_paramModel?.alisSatirdaKdvSor, skipAdmin: true);
  bool get siparisSSSatisHizmetAktifMi => _isTrue(_paramModel?.alisHizmetAktif, skipAdmin: true);
  bool get siparisSSKontrolAciklamasiAktifMi =>
      _isTrue(_paramModel?.fatuKontrolAciklamasiAktif?.contains("SS"), skipAdmin: true);
  bool get siparisSSSatirdaEkAlan2AktifMi => _isTrue(_paramModel?.alisSatirdaEkAlan2Aktif, skipAdmin: true);
  bool get siparisSSSatirdaTeslimTarihiSor => _isTrue(_paramModel?.alisSatirdaTeslimTarihiSor, skipAdmin: true);
  // bool get siparisSSISk1YuzdeSor => _isTrue(_paramModel?.alisSatirIsk1YuzdeSor);

  //! FİNANS
  bool get hizliTahsilatSil => _isTrue(_profilYetkiModel?.finansHizliTahsilatKayitlariSil);
  bool referansKoduSorulsun(bool tahsilatMi) => tahsilatMi ? tahsilatReferansKoduSorulsun : odemeReferansKoduSorulsun;
  bool referansKodu(String? hesapTipi) {
    if (hesapTipi == null) return false;
    if (!(_paramModel?.muhasebeEntegre ?? false)) return false;
    if (!(_paramModel?.muhFislerdeRefKodSorulsun ?? false)) return false;
    return switch (hesapTipi) {
      "A" => _isTrue(_paramModel?.muhFislerdeRefKodSorulsunAktif, skipAdmin: true),
      "P" => _isTrue(_paramModel?.muhFislerdeRefKodSorulsunPasif, skipAdmin: true),
      "G" => _isTrue(_paramModel?.muhFislerdeRefKodSorulsunGelir, skipAdmin: true),
      "I" => _isTrue(_paramModel?.muhFislerdeRefKodSorulsunGider, skipAdmin: true),
      "N" => _isTrue(_paramModel?.muhFislerdeRefKodSorulsunNazim, skipAdmin: true),
      _ => false,
    };
  }

  //* Kasa
  bool get kasaListesi => _isTrue(_profilYetkiModel?.finansKasaListesi);
  bool get finansKasaIslemleri => _isTrue(_profilYetkiModel?.finansKasaIslemleri);
  bool get finansKasaIslemleriSil => _isTrue(_profilYetkiModel?.finansKasaIslemleriSil);
  bool get tahsilatReferansKoduSorulsun => _isTrue(_paramModel?.muhFislerdeRefKodSorulsunGelir, skipAdmin: true);
  bool get odemeReferansKoduSorulsun => _isTrue(_paramModel?.muhFislerdeRefKodSorulsunGider, skipAdmin: true);

  //* Banka
  bool kayitliHesapTipiMi(int value) => _paramModel?.kayitliBankaHesapTipleri?.contains(value) ?? false;
  bool get bankaKayitSilinsinMi => _isTrue(_profilYetkiModel?.yoneticiBankaIslemleriSil);

  bool get musteriCekSil => _isTrue(_profilYetkiModel?.finansMcekSil);
  bool get musteriSenetSil => _isTrue(_profilYetkiModel?.finansMsenSil);
  bool get borcCekSil => _isTrue(_profilYetkiModel?.finansBcekSil);
  bool get borcSenetSil => _isTrue(_profilYetkiModel?.finansBsenSil);

  bool get bankaCariEftHavale => _isTrue(_profilYetkiModel?.yoneticiBankaIslemCariEft);

  bool get musteriCekCariHesabaCirola => _isTrue(_profilYetkiModel?.finansMcekCariyeCiro);
  bool get musteriSenetCariHesabaCirola => _isTrue(_profilYetkiModel?.finansMsenCariyeCiro);

  bool get musteriCekTahsilHesabinaCirola => _isTrue(_profilYetkiModel?.finansMcekTahsileCiro);
  bool get musteriSenetTahsilHesabinaCirola => _isTrue(_profilYetkiModel?.finansMsenTahsileCiro);

  bool get musteriCekTahsilDekontu => _isTrue(_profilYetkiModel?.finansMcekTahsilDekontu);
  bool get musteriSenetTahsilDekontu => _isTrue(_profilYetkiModel?.finansMsenTahsilDekontu);

  bool get musteriCekEkle => _isTrue(_profilYetkiModel?.finansMcekEkle);
  bool get musteriSenetEkle => _isTrue(_profilYetkiModel?.finansMsenEkle);
  bool get borcCekEkle => _isTrue(_profilYetkiModel?.finansBcekEkle);
  bool get borcSenetEkle => _isTrue(_profilYetkiModel?.finansBsenEkle);

  bool get musteriCekHareketler => _isTrue(_profilYetkiModel?.finansMcekHareketler);
  bool get musteriSenetHareketler => _isTrue(_profilYetkiModel?.finansMsenHareketler);
  bool get borcCekHareketler => _isTrue(_profilYetkiModel?.finansBcekHareketler);
  bool get borcSenetHareketler => _isTrue(_profilYetkiModel?.finansBsenHareketler);

  //! SEVKİYAT

  bool sevkiyatSatisFatBelgeTipleri(int? value) =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisFatBelgeTipleri?.contains(value));
  bool sevkiyatSatisIrsBelgeTipleri(int? value) =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisIrsaliyesiBelgeTipleri?.contains(value));

  bool get sevkiyatSatisFatFiyatDegistirilmesin =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisFatFiyatDegistirilmesin, skipAdmin: true);
  bool get satisIrsFiyatGor => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsaliyesiFiyatGor);

  bool get satisCariDovizTipiniKullan => _isTrue(_paramModel?.satisCariDovizTipiniKullan);
  bool get alisCariDovizTipiniKullan => _isTrue(_paramModel?.alisCariDovizTipiniKullan);

  bool get satisFatEkle => _isTrue(_profilYetkiModel?.sevkiyatSatisFatKaydet);
  bool get satisFatDuzenle => _isTrue(_profilYetkiModel?.sevkiyatSatisFatDuzelt);
  bool get satisFatSil => _isTrue(_profilYetkiModel?.sevkiyatSatisFatSil);
  bool get satisFatBirim1denKaydet => _isTrue(_profilYetkiModel?.sevkiyatSatisFatBirim1DenKaydet, skipAdmin: true);

  bool get satisIrsEkle => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsaliyesiKayit);
  bool get satisIrsDuzenle => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsaliyesiDuzeltme);
  bool get satisIrsSil => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsaliyesiSilme);
  bool get satisIrsBirim1denKaydet => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsBirim1DenKaydet, skipAdmin: true);

  bool satisIrsDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisIrsaliyesiDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool satisFatDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisFatDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool alisIrsDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.malKabulAlisIrsDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool alisFatDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.malKabulAlisFatDegismeyecekAlanlar?.contains(index), skipAdmin: true);

  bool satisIrsBosGecilmeyecekAlanlar(String? value) =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisIrsBosGecilmeyecekAlanlar?.contains(value), skipAdmin: true);
  bool satisFatBosGecilmeyecekAlanlar(String? value) =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisFatBosGecilmeyecekAlanlar?.contains(value), skipAdmin: true);
  bool alisIrsBosGecilmeyecekAlanlar(String? value) =>
      _isTrue(_profilYetkiModel?.malKabulAlisIrsBosGecilmeyecekAlanlar?.contains(value), skipAdmin: true);
  bool alisFatBosGecilmeyecekAlanlar(String? value) =>
      _isTrue(_profilYetkiModel?.malKabulAlisFatBosGecilmeyecekAlanlar?.contains(value), skipAdmin: true);

  bool satisIrsGizlenecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisIrsaliyesiGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool satisFatGizlenecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisFatGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool alisIrsGizlenecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.malKabulAlisIrsGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool alisFatGizlenecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.malKabulAlisFatGizlenecekAlanlar?.contains(index), skipAdmin: true);

  bool get satisFatDigerSekmesiGelsin => _isTrue(_profilYetkiModel?.sevkiyatSatisFatDigerSekmesiGoster);
  bool get satisIrsDigerSekmesiGelsin => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsDigerSekmesiGoster);

  //! MAL KABUL
  String? get malKabulAlisIrsOzelKod1Degeri => _profilYetkiModel?.malKabulAlisIrsOzelKod1Degeri;
  String? get malKabulAlisIrsOzelKod2Degeri => _profilYetkiModel?.malKabulAlisIrsOzelKod2Degeri;
  bool malKabulAlisFatBelgeTipleri(int? value) =>
      _isTrue(_profilYetkiModel?.malKabulAlisFaturasiBelgeTipleri?.contains(value));
  bool malKabulAlisIrsBelgeTipleri(int? value) =>
      _isTrue(_profilYetkiModel?.malKabulAlisIrsBelgeTipleri?.contains(value));

  bool get malKabulFiyatDegistirilmesin => _isTrue(_profilYetkiModel?.malKabulFiyatDegistirilmesin, skipAdmin: true);
  bool get alisIrsFiyatGor => _isTrue(_profilYetkiModel?.malKabulAlisIrsaliyesiFiyatGor);

  bool get alisFatEkle => _isTrue(_profilYetkiModel?.malKabulAlisFaturasiKaydet);
  bool get alisFatDuzenle => _isTrue(_profilYetkiModel?.malKabulAlisFaturasiDuzelt);
  bool get alisFatSil => _isTrue(_profilYetkiModel?.malKabulAlisFaturasiSil);
  bool get alisFatBirim1denKaydet => _isTrue(_profilYetkiModel?.malKabulAlisFatBirim1DenKaydet, skipAdmin: true);

  bool get alisIrsEkle => _isTrue(_profilYetkiModel?.malKabulSatinAlmaKaydet);
  bool get alisIrsDuzenle => _isTrue(_profilYetkiModel?.malKabulSatinAlmaDuzelt);
  bool get alisIrsSil => _isTrue(_profilYetkiModel?.malKabulSatinAlmaSil);
  bool get alisIrsBirim1denKaydet => _isTrue(_profilYetkiModel?.malKabulAlisIrsBirim1DenKaydet, skipAdmin: true);

  bool get alisFatDigerSekmesiGelsin => _isTrue(_profilYetkiModel?.malKabulAlisFatDigerSekmesiGoster);
  bool get alisIrsDigerSekmesiGelsin => _isTrue(_profilYetkiModel?.malKabulAlisFatDigerSekmesiGoster);
  // bool get satisFatEkle => _isTrue(_yetkiModel?.ekle);

  //! E-FATURA
  bool ebelgeOzelKod1AktifMi(bool satisMi) =>
      _isTrue(satisMi ? _paramModel?.satisOzelKod1Aktif : _paramModel?.alisOzelKod1Aktif, skipAdmin: true);
  bool ebelgeOzelKod2AktifMi(bool satisMi) =>
      _isTrue(satisMi ? _paramModel?.satisOzelKod2Aktif : _paramModel?.alisOzelKod2Aktif, skipAdmin: true);
  bool get ebelgeEFatura => _isTrue((_profilYetkiModel?.ebelgeEFat ?? false) && (_paramModel?.eFaturaAktif ?? false));
  bool get ebelgeEFaturaGelenKutusu => ebelgeEFatura && _isTrue(_profilYetkiModel?.ebelgeEFatGelenKutusu);
  bool get ebelgeEFaturaGidenKutusu => ebelgeEFatura && _isTrue(_profilYetkiModel?.ebelgeEFatSorgula);
  bool get ebelgeEFaturaGonder => ebelgeEFatura && _isTrue(_profilYetkiModel?.ebelgeEFatGonder);
  bool get ebelgeEFaturaSorgula => ebelgeEFatura && _isTrue(_profilYetkiModel?.ebelgeEFatSorgula);
  bool get ebelgeEFaturaGoruntule => ebelgeEFatura && _isTrue(_profilYetkiModel?.ebelgeEFatGoruntule);
  bool get ebelgeEFaturaTaslakSil => ebelgeEFatura && _isTrue(_profilYetkiModel?.ebelgeEFatTaslakSil);
  bool get eFaturaAktif => _isTrue(_paramModel?.eFaturaAktif, skipAdmin: true);
  bool get eFaturaSenaryoDegistir => ebelgeEFatura && _isTrue(_paramModel?.eFaturaSenaryoDegistir);
  bool eFaturaSerisindenMi(String belgeNo) => _isTrue(
    belgeNo.contains(_paramModel?.seriEFatura ?? "") ||
        (_paramModel?.arrEFatSeri?.any((element) => belgeNo.contains(element)) ?? false),
    skipAdmin: true,
  );

  bool get ebelgeEIrsaliye =>
      _isTrue((_profilYetkiModel?.ebelgeEIrsaliye ?? false) && (_paramModel?.eIrsaliyeAktif ?? false));
  bool get ebelgeEIrsaliyeGelenKutusu => ebelgeEIrsaliye && _isTrue(_profilYetkiModel?.ebelgeEIrsaliyeGelenKutusu);
  bool get ebelgeEIrsaliyeGidenKutusu => ebelgeEIrsaliye && _isTrue(_profilYetkiModel?.ebelgeEIrsaliyeGidenKutusu);
  bool get ebelgeEIrsaliyeGonder => ebelgeEIrsaliye && _isTrue(_profilYetkiModel?.ebelgeEIrsaliyeGonder);
  bool get ebelgeEIrsaliyeSorgula => ebelgeEIrsaliye && _isTrue(_profilYetkiModel?.ebelgeEIrsaliye);
  bool get ebelgeEIrsaliyeGoruntule => ebelgeEIrsaliye && _isTrue(_profilYetkiModel?.ebelgeEIrsaliyeGoruntule);
  bool get ebelgeEIrsaliyeTaslakSil => ebelgeEIrsaliye && _isTrue(_profilYetkiModel?.ebelgeEIrsaliyeTaslakSil);
  bool get eIrsaliyeAktif => ebelgeEIrsaliye && _isTrue(_paramModel?.eIrsaliyeAktif);
  bool eIrsaliyeSerisindenMi(String belgeNo) =>
      ebelgeEIrsaliye &&
      _isTrue(
        belgeNo.contains(_paramModel?.seriEIrsaliye ?? "") ||
            (_paramModel?.arrEIrsSeri?.any((element) => belgeNo.contains(element)) ?? false),
        skipAdmin: true,
      );

  bool get ebelgeEArsiv => _isTrue((_profilYetkiModel?.ebelgeEArsiv ?? false) && (_paramModel?.eArsivAktif ?? false));
  // bool get ebelgeEArsivGelenKutusu => _isTrue(_yetkiModel?.ebelgeEArsivGelenKutusu);
  bool get ebelgeEArsivGidenKutusu =>
      ebelgeEArsiv &&
      _isTrue((_paramModel?.eIrsaliyeAktif ?? false) && (_profilYetkiModel?.ebelgeEArsivSorgula ?? false));
  bool get ebelgeEArsivGonder => ebelgeEArsiv && _isTrue(_profilYetkiModel?.ebelgeEArsivGonder);
  bool get ebelgeEArsivSorgula => ebelgeEArsiv && _isTrue(_profilYetkiModel?.ebelgeEArsivSorgula);
  bool get ebelgeEArsivGoruntule => ebelgeEArsiv && _isTrue(_profilYetkiModel?.ebelgeEArsivGoruntule);
  bool get ebelgeEArsivTaslakSil => ebelgeEArsiv && _isTrue(_profilYetkiModel?.ebelgeEArsivTaslakSil);
  bool get eArsivAktif => ebelgeEArsiv && _isTrue(_paramModel?.eArsivAktif);
  bool eArsivSerisindenMi(String belgeNo) =>
      ebelgeEArsiv &&
      _isTrue(
        belgeNo.contains(_paramModel?.seriEArsiv ?? "") ||
            (_paramModel?.arrEArSeri?.any((element) => belgeNo.contains(element)) ?? false),
        skipAdmin: true,
      );

  //! SAYIM
  bool get sayimEkle => _isTrue(_profilYetkiModel?.sayimSerbest);
  bool get sayimSil => _isTrue(_profilYetkiModel?.sayimSerbestSil);
  bool get sayimHemenKaydet => _isTrue(_profilYetkiModel?.sayimHemenKaydet);
  bool get sayimDepoFarkRaporu => _isTrue(_profilYetkiModel?.sayimDepoFarkRaporu);
  bool get sayimSayimRaporu => _isTrue(_profilYetkiModel?.sayimRaporu);
  bool sayimEkAlanlar(int? value) => _isTrue(_profilYetkiModel?.sayimEkAlanlar?.contains(value), skipAdmin: true);
  bool sayimGizlenecekAlanlar(String? value) =>
      _isTrue(_profilYetkiModel?.sayimGizlenecekAlanlar?.contains(value), skipAdmin: true);
  bool sayimDegistirilmeyecekAlanlar(String? value) =>
      _isTrue(_profilYetkiModel?.sayimDegismeyecekAlanlar?.contains(value), skipAdmin: true);
  int get sayimVarsayilanOlcuBirimi => _profilYetkiModel?.sayimVarsayilanOlcuBirimi ?? 1;

  //! TALEP TEKLİF
  String? get satisTeklifOzelKod1Degeri => _profilYetkiModel?.taltekStekOzelKod1Degeri;
  String? get satisTeklifOzelKod2Degeri => _profilYetkiModel?.taltekStekOzelKod2Degeri;
  String? get satisTalebiOzelKod1Degeri => _profilYetkiModel?.taltekStalOzelKod1Degeri;
  String? get satisTalebiOzelKod2Degeri => _profilYetkiModel?.taltekStalOzelKod2Degeri;

  String? talepTeklifEkAciklamaAdi(bool satisMi) =>
      satisMi ? _paramModel?.satisEkMaliyet2Adi : _paramModel?.alisEkMaliyet2Adi;
  int talTekSatirKademeliIskontoSayisi(String? belgeTuru) =>
      int.tryParse(
        _paramModel?.talTekParam?.firstWhereOrNull((element) => element.belgeTipi == belgeTuru)?.satirIskontoSayisi ??
            "",
      ) ??
      0;

  bool get satisTeklifiFiyatDegistirilmesin =>
      _isTrue(_profilYetkiModel?.taltekStekFiyatDegistirilmesin, skipAdmin: true);
  bool get satisTalebiFiyatDegistirilmesin =>
      _isTrue(_profilYetkiModel?.taltekStalFiyatDegistirilmesin, skipAdmin: true);

  bool get satisTeklifiSil => _isTrue(_profilYetkiModel?.taltekStekSil);
  bool get alisTalebiSil => _isTrue(_profilYetkiModel?.taltekAtalSil);
  bool get satisTalebiSil => _isTrue(_profilYetkiModel?.taltekStalSil);

  bool get satisTeklifiYazdir => _isTrue(_profilYetkiModel?.yazdirmaSatisTeklifi);
  bool get alisTalebiYazdir => _isTrue(_profilYetkiModel?.yazdirmaAtal);
  bool get satisTalebiYazdir => _isTrue(_profilYetkiModel?.yazdirmaSatisTalebi);

  bool get satisTeklifiDuzenle => _isTrue(_profilYetkiModel?.taltekStekDuzelt);
  bool get alisTalebiDuzenle => _isTrue(_profilYetkiModel?.taltekAtalDuzelt);
  bool get satisTalebiDuzenle => _isTrue(_profilYetkiModel?.taltekStalDuzelt);

  bool get satisTeklifiEkle => _isTrue(_profilYetkiModel?.taltekStekKaydet);
  bool get alisTalebiEkle => _isTrue(_profilYetkiModel?.taltekAtalKaydet);
  bool get satisTalebiEkle => _isTrue(_profilYetkiModel?.taltekStalKaydet);

  bool talepTeklifSatisTeklifiAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.taltekStekAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.taltekStekAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.taltekStekAciklamaAlanlari?.contains(index)) ??
            true,
  );
  bool talepTeklifAlisTalebiAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.taltekAtalAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.taltekAtalAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.taltekAtalAciklamaAlanlari?.contains(index)) ??
            false,
  );

  bool talepTeklifSatisTalebiAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.taltekStalAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.taltekStalAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.taltekStalAciklamaAlanlari?.contains(index)) ??
            false,
  );

  bool taltekOnayIslemleri(String? belgeTuru) {
    if (belgeTuru == "STEK") {
      return stekOnayIslemleri;
    } else if (belgeTuru == "STAL") {
      return stalOnayIslemleri;
    } else if (belgeTuru == "ATAL") {
      return atalOnayIslemleri;
    }
    return false;
  }

  // bool get stekDigersSekmesiGelsin => _isTrue(_yetkiModel?.diger);

  bool get stekOnayIslemleri => _isTrue(_profilYetkiModel?.taltekStekOnayIslemleri ?? false);
  bool get stekKdvDahilMi {
    if (_profilYetkiModel?.taltekStekKdvDurumu == "D") return true;
    if (_profilYetkiModel?.taltekStekKdvDurumu == "H") return false;
    return !genellikleKdvHaricMi;
  }

  bool get stalOnayIslemleri => _isTrue(_profilYetkiModel?.taltekStalOnayIslemleri ?? false);

  bool get stalKdvDahilMi {
    if (_profilYetkiModel?.taltekStalKdvDurumu == "D") return true;
    if (_profilYetkiModel?.taltekStalKdvDurumu == "H") return false;
    return !genellikleKdvHaricMi;
  }

  bool get atalOnayIslemleri => _isTrue(_profilYetkiModel?.taltekAtalOnayIslemleri ?? false);

  // bool get satisTeklifiDigerSekmesiGelsin => _isTrue(_yetkiModel);

  //! Rehberden Stok Secilmesin
  bool get satisFatRehberdenStokSecilsin =>
      _isTrue(!(_profilYetkiModel?.sevkiyatSatisFatStokRehberiAcilmasin ?? false));
  bool get satisIrsRehberdenStokSecilsin =>
      _isTrue(!(_profilYetkiModel?.sevkiyatSatisIrsStokRehberiAcilmasin ?? false));
  bool get alisFatRehberdenStokSecilsin => _isTrue(!(_profilYetkiModel?.malKabulAlisFatStokRehberiAcilmasin ?? false));
  bool get alisIrsRehberdenStokSecilsin => _isTrue(!(_profilYetkiModel?.malKabulAlisIrsStokRehberiAcilmasin ?? false));
  bool get transferDatRehberdenStokSecilsin => _isTrue(!(_profilYetkiModel?.transferDatStokRehberiAcilmasin ?? false));
  bool get transferAGRehberdenStokSecilsin => _isTrue(!(_profilYetkiModel?.transferAgStokRehberiAcilmasin ?? false));
  bool get transferACRehberdenStokSecilsin => _isTrue(!(_profilYetkiModel?.transferAcStokRehberiAcilmasin ?? false));

  //! Kalem Klavye Açılmasın
  bool get satisFatKalemKlavyeAcilmasin => _isTrue(_profilYetkiModel?.sevkiyatSatisFatKlavyeEngelle, skipAdmin: true);
  bool get satisIrsKalemKlavyeAcilmasin => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsKlavyeEngelle, skipAdmin: true);
  bool get alisFatKalemKlavyeAcilmasin => _isTrue(_profilYetkiModel?.malKabulAlisFatKlavyeEngelle, skipAdmin: true);
  bool get alisIrsKalemKlavyeAcilmasin => _isTrue(_profilYetkiModel?.malKabulAlisIrsKlavyeEngelle, skipAdmin: true);
  bool get transferDatKalemKlavyeAcilmasin => _isTrue(_profilYetkiModel?.transferDatKlavyeEngelle, skipAdmin: true);
  bool get transferAGKalemKlavyeAcilmasin => _isTrue(_profilYetkiModel?.transferAgKlavyeEngelle, skipAdmin: true);
  bool get transferACKalemKlavyeAcilmasin => _isTrue(_profilYetkiModel?.transferAcKlavyeEngelle, skipAdmin: true);

  //! Barkodlu Giriş
  bool get satisFatBarkodUrunGirisi => _isTrue(_profilYetkiModel?.sevkiyatSatisFatBarkodluGiris);
  bool get satisIrsBarkodUrunGirisi => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsBarkodluGiris);
  bool get alisFatBarkodUrunGirisi => _isTrue(_profilYetkiModel?.malKabulAlisFatBarkodluGiris);
  bool get alisIrsBarkodUrunGirisi => _isTrue(_profilYetkiModel?.malKabulAlisIrsBarkodluGiris);
  bool get transferDatBarkodUrunGirisi => _isTrue(_profilYetkiModel?.transferDatBarkodluGiris);
  bool get transferAGBarkodUrunGirisi => _isTrue(_profilYetkiModel?.transferAgBarkodluGiris);
  bool get transferACBarkodUrunGirisi => _isTrue(_profilYetkiModel?.transferAcBarkodluGiris);

  //! Okutulan Ürün Otomatik Eklensin
  bool get satisFatBarkodUrunOtomatikEkle =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisFaturasiKalemDetaySorulmasin, skipAdmin: true);
  bool get satisIrsBarkodUrunOtomatikEkle =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisIrsKalemDetaySorulmasin, skipAdmin: true);
  bool get alisFatBarkodUrunOtomatikEkle =>
      _isTrue(_profilYetkiModel?.malKabulAlisFatKalemDetaySorulmasin, skipAdmin: true);
  bool get alisIrsBarkodUrunOtomatikEkle =>
      _isTrue(_profilYetkiModel?.malKabulAlisIrsKalemDetaySorulmasin, skipAdmin: true);
  bool get transferDatBarkodUrunOtomatikEkle =>
      _isTrue(_profilYetkiModel?.transferDatKalemDetaySorulmasin, skipAdmin: true);
  bool get transferAGBarkodUrunOtomatikEkle =>
      _isTrue(_profilYetkiModel?.transferAgKalemDetaySorulmasin, skipAdmin: true);
  bool get transferACBarkodUrunOtomatikEkle =>
      _isTrue(_profilYetkiModel?.transferAcKalemDetaySorulmasin, skipAdmin: true);

  //! Kalem Düzeltilsin
  bool get satisFatKalemDuzeltilsin => _isTrue(!(_profilYetkiModel?.sevkiyatSatisFatKalemDuzeltilemesin ?? false));
  bool get satisIrsKalemDuzeltilsin => _isTrue(!(_profilYetkiModel?.sevkiyatSatisIrsKalemDuzeltilemesin ?? false));
  bool get alisFatKalemDuzeltilsin => _isTrue(!(_profilYetkiModel?.malKabulAlisFatKalemDuzeltilemesin ?? false));
  bool get alisIrsKalemDuzeltilsin => _isTrue(!(_profilYetkiModel?.malKabulAlisIrsKalemDuzeltilemesin ?? false));
  bool get transferDatKalemDuzeltilsin => _isTrue(!(_profilYetkiModel?.transferDatKalemDuzeltilemesin ?? false));
  bool get transferAGKalemDuzeltilsin => _isTrue(!(_profilYetkiModel?.transferAgKalemDuzeltilemesin ?? false));
  bool get transferACKalemDuzeltilsin => _isTrue(!(_profilYetkiModel?.transferAcKalemDuzeltilemesin ?? false));

  //! Barkod2 Sor
  bool get transferDATBarkod2Sor => _isTrue(_profilYetkiModel?.transferDatBarkod2Sor);

  //! FATURA
  String? get satisFaturaOzelKod1Degeri => _profilYetkiModel?.sevkiyatSatisFatOzelKod1Degeri;
  String? get satisFaturaOzelKod2Degeri => _profilYetkiModel?.sevkiyatSatisFatOzelKod2Degeri;
  String? get satisIrsaliyeOzelKod1Degeri => _profilYetkiModel?.sevkiyatSatisIrsOzelKod1Degeri;
  String? get satisIrsaliyeOzelKod2Degeri => _profilYetkiModel?.sevkiyatSatisIrsOzelKod2Degeri;
  bool get alistaSiparisKullan => _isTrue(_paramModel?.alistaSiparisKullan, skipAdmin: true);
  bool get satistaSiparisKullan => _isTrue(_paramModel?.satistaSiparisKullan, skipAdmin: true);

  bool get sevkiyatFiyatDegistirilmesin => _isTrue(_profilYetkiModel?.sevkiyatFiyatDegistirilmesin, skipAdmin: true);

  bool faturaAciklamaAlanlari(EditTipiEnum? editTipi, int index) => switch (editTipi) {
    EditTipiEnum.satisFatura => satisFaturaAciklamaAlanlari(index),
    EditTipiEnum.satisIrsaliye => satisIrsaliyeAciklamaAlanlari(index),
    EditTipiEnum.alisFatura => alisFaturaAciklamaAlanlari(index),
    EditTipiEnum.alisIrsaliye => alisIrsaliyeAciklamaAlanlari(index),
    EditTipiEnum.musteri => siparisMSAciklamaAlanlari(index),
    EditTipiEnum.ambarGirisi => transferLokalAgAciklamaAlanlari(index),
    EditTipiEnum.ambarCikisi => transferLokalAcAciklamaAlanlari(index),
    EditTipiEnum.satisTeklifi => talepTeklifSatisTeklifiAciklamaAlanlari(index),
    EditTipiEnum.alisTalebi => talepTeklifAlisTalebiAciklamaAlanlari(index),
    EditTipiEnum.satisTalebi => talepTeklifSatisTalebiAciklamaAlanlari(index),
    EditTipiEnum.satici => true,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => transferDatAciklamaAlanlari(index),
    _ => false,
  };

  bool get alisFaturaSiparisBaglantisi => _isTrue(
    _profilYetkiModel?.malKabulAlisFaturasiSipBagSecenegi == "E" ||
        _profilYetkiModel?.malKabulAlisFaturasiSipBagSecenegi == "O",
  );
  bool get satisFaturaSiparisBaglantisi => _isTrue(
    _profilYetkiModel?.sevkiyatSatisFaturasiSipBagSecenegi == "E" ||
        _profilYetkiModel?.sevkiyatSatisFaturasiSipBagSecenegi == "O",
  );
  bool get alisIrsaliyesiSiparisBaglantisi => _isTrue(
    _profilYetkiModel?.malKabulAlisIrsSipBagSecenegi == "E" || _profilYetkiModel?.malKabulAlisIrsSipBagSecenegi == "O",
  );
  bool get satisIrsaliyesiSiparisBaglantisi => _isTrue(
    _profilYetkiModel?.sevkiyatSatisIrsaliyesiSipBagSecenegi == "E" ||
        _profilYetkiModel?.sevkiyatSatisIrsaliyesiSipBagSecenegi == "O",
  );

  bool get alisFaturasiFaturaSiparisBaglantisiOpsiyonelMi =>
      _isTrue(_profilYetkiModel?.malKabulAlisFaturasiSipBagSecenegi == "O");
  bool get satisFaturasiFaturaSiparisBaglantisiOpsiyonelMi =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisFaturasiSipBagSecenegi == "O");
  bool get alisIrsaliyesiFaturaSiparisBaglantisiOpsiyonelMi =>
      _isTrue(_profilYetkiModel?.malKabulAlisIrsSipBagSecenegi == "O");
  bool get satisIrsaliyesiFaturaSiparisBaglantisiOpsiyonelMi =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisIrsaliyesiSipBagSecenegi == "O");

  // Sipariş Bağlantısı çoklu seçim
  bool get alisFaturasiFaturaSiparisBaglantisiCokluSecim => _isTrue(_profilYetkiModel?.malKabulAlisFatSipBagCokluSecim);
  bool get satisFaturasiFaturaSiparisBaglantisiCokluSecim =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisFatSipBagCokluSecim);
  bool get alisIrsaliyesiFaturaSiparisBaglantisiCokluSecim =>
      _isTrue(_profilYetkiModel?.malKabulAlisIrsSipBagCokluSecim);
  bool get satisIrsaliyesiFaturaSiparisBaglantisiCokluSecim =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisIrsSipBagCokluSecim);
  bool get transferDatSiparisBaglantisiCokluSecim => _isTrue(_profilYetkiModel?.transferDatSipBagCokluSecim);
  bool get transferAgSiparisBaglantisiCokluSecim => _isTrue(_profilYetkiModel?.transferAgSipBagCokluSecim);
  bool get transferAcSiparisBaglantisiCokluSecim => _isTrue(_profilYetkiModel?.transferAcSipBagCokluSecim);

  bool get alisFaturasiSiparisBaglantisiTamamiSeciliGelsin =>
      _isTrue(_profilYetkiModel?.malKabulAlisFatSipBagTumKalemlerSecilsin);
  bool get satisFaturasiSiparisBaglantisiTamamiSeciliGelsin =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisFatSipBagTumKalemlerSecilsin);
  bool get alisIrsaliyesiSiparisBaglantisiTamamiSeciliGelsin =>
      _isTrue(_profilYetkiModel?.malKabulAlisIrsSipBagTumKalemlerSecilsin);
  bool get satisIrsaliyesiSiparisBaglantisiTamamiSeciliGelsin =>
      _isTrue(_profilYetkiModel?.sevkiyatSatisIrsSipBagTumKalemlerSecilsin);
  bool get transferDatSiparisBaglantisiTamamiSeciliGelsin =>
      _isTrue(_profilYetkiModel?.transferDatSipBagTumKalemlerSecilsin);
  bool get transferAgSiparisBaglantisiTamamiSeciliGelsin =>
      _isTrue(_profilYetkiModel?.transferAgSipBagTumKalemlerSecilsin);
  bool get transferAcSiparisBaglantisiTamamiSeciliGelsin =>
      _isTrue(_profilYetkiModel?.transferAcSipBagTumKalemlerSecilsin);

  bool alisFaturaAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.malKabulAlisFatAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.malKabulAlisFatAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.malKabulAlisFatAciklamaAlanlari?.contains(index)) ??
            false,
  );
  bool alisIrsaliyeAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.malKabulAlisIrsAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.malKabulAlisIrsAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.malKabulAlisIrsAciklamaAlanlari?.contains(index)) ??
            false,
  );
  bool satisFaturaAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.sevkiyatSatisFatAciklamaAlanlari.ext.isNullOrEmpty ?? false
        ? false
        : (index < 1
                ? _profilYetkiModel?.sevkiyatSatisFatAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.sevkiyatSatisFatAciklamaAlanlari?.contains(index)) ??
            false,
  );
  bool satisIrsaliyeAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.sevkiyatSatisIrsaliyesiAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.sevkiyatSatisIrsaliyesiAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.sevkiyatSatisIrsaliyesiAciklamaAlanlari?.contains(index)) ??
            false,
  );

  bool get sevkiyatSatisFaturaAciklamaDuzenle => _isTrue(_profilYetkiModel?.sevkiyatSatisFatAciklamaDuzenle);
  bool get sevkiyatSatisIrsaliyesiAciklamaDuzenle => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsaliyesiAciklamaDuzenle);
  bool get malKabulAlisFaturaAciklamaDuzenle => _isTrue(_profilYetkiModel?.malKabulAlisFatAciklamaDuzenle);
  bool get malKabulAlisIrsaliyesiAciklamaDuzenle => _isTrue(_profilYetkiModel?.malKabulAlisIrsAciklamaDuzenle);

  //! TRANSFER

  String? get transferAcVarsayilanCikisYeri => _profilYetkiModel?.transferAcVarsayilanCikisYeri;
  String? get transferACOzelKod1Degeri => _profilYetkiModel?.transferAcOzelKod1Degeri;
  String? get transferACOzelKod2Degeri => _profilYetkiModel?.transferAcOzelKod2Degeri;
  bool get transferIsEmriSorulsun => _isTrue(_paramModel?.satisSatirdaIsEmriSorulsun, skipAdmin: true);

  //* Görüntüle
  bool get transferDatGoruntule => _isTrue(_profilYetkiModel?.transferDat);
  bool get transferAGGoruntule => _isTrue(_profilYetkiModel?.transferAg);
  bool get transferACGoruntule => _isTrue(_profilYetkiModel?.transferAc);

  //* Ekle
  bool get transferDatEkle => _isTrue(_profilYetkiModel?.transferDatKaydet);
  bool get transferAGEkle => _isTrue(_profilYetkiModel?.transferAgKaydet);
  bool get transferACEkle => _isTrue(_profilYetkiModel?.transferAcKaydet);

  //* Düzenle
  bool get transferDatDuzenle => _isTrue(_profilYetkiModel?.transferDatDuzelt);
  bool get transferAGDuzenle => _isTrue(_profilYetkiModel?.transferAgDuzelt);
  bool get transferACDuzenle => _isTrue(_profilYetkiModel?.transferAcDuzelt);

  //* Sil
  bool get transferDatSil => _isTrue(_profilYetkiModel?.transferDatSil);
  bool get transferAGSil => _isTrue(_profilYetkiModel?.transferAgSil);
  bool get transferACSil => _isTrue(_profilYetkiModel?.transferAcSil);
  bool get transferMalTalebiSil => _isTrue(_profilYetkiModel?.transferDepoTalebi);

  //* Birim1den Kaydet
  bool get transferDatBirim1Kaydet => _isTrue(_profilYetkiModel?.transferDatBirim1DenKaydet, skipAdmin: true);
  bool get transferAGBirim1Kaydet => _isTrue(_profilYetkiModel?.transferAgBirim1DenKaydet, skipAdmin: true);
  bool get transferACBirim1Kaydet => _isTrue(_profilYetkiModel?.transferAcBirim1DenKaydet, skipAdmin: true);

  //* Fiyat Gör
  bool get transferDatFiyatGor => _isTrue(_profilYetkiModel?.transferDatFiyatGor);
  bool get transferAGFiyatGor => _isTrue(_profilYetkiModel?.transferAgFiyatGor);
  bool get transferACFiyatGor => _isTrue(_profilYetkiModel?.transferAcFiyatGor);

  bool get transferEkMaliyet1GizlenecekMi =>
      transferLokalDatGizlenecekAlanlar(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet1);
  bool get transferEkMaliyet2GizlenecekMi =>
      transferLokalDatGizlenecekAlanlar(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet2);
  bool get transferEkMaliyet3GizlenecekMi =>
      transferLokalDatGizlenecekAlanlar(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet3);

  bool get transferDepoMalToplamaFazlaTeslimatYapabilir =>
      _isTrue(_profilYetkiModel?.transferDepoTalebiMalTopFazlaTeslimat == "E");

  bool transferDatAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.transferDatAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.transferDatAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.transferDatAciklamaAlanlari?.contains(index)) ??
            false,
  );

  bool transferAGAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.transferAgAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.transferAgAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.transferAgAciklamaAlanlari?.contains(index)) ??
            false,
  );

  bool transferACAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.transferAcAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.transferAcAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.transferAcAciklamaAlanlari?.contains(index)) ??
            false,
  );

  //* lokal DAT

  bool get transferDatDigerSekmesiGoster => _isTrue(_profilYetkiModel?.transferDatDigerSekmesiGoster);

  //TODO Sayfaya parametreleri ekle
  bool transferLokalDatDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.transferDatDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalDatBosGecilmeyecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.transferDatBosGecilmeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalDatGizlenecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.transferDatGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool get transferDatAciklamaDuzenle => _isTrue(_profilYetkiModel?.transferDatAciklamaDuzenle);

  String? get transferLokalDatHareketTuru => _profilYetkiModel?.transferDatVarsayilanHarTuru;
  bool get transferLokalDatHarTuruDegismesin =>
      _isTrue(_profilYetkiModel?.transferDatVarsayilanHarTuruDegistiremesin, skipAdmin: true);

  bool get transferLokalDatSiparisBaglantisi => _isTrue(
    _paramModel?.satisDatSiparisTakibi == "E" && _profilYetkiModel?.transferDatSipBagSecenegi != "H",
    skipAdmin: true,
  );
  bool get transferLokalDatSiparisBaglantisiOpsiyonelMi => _isTrue(_profilYetkiModel?.transferDatSipBagSecenegi == "O");

  DepoList? get transferLokalDatCikisDepo =>
      _paramModel?.depoList
          ?.where((element) => element.depoKodu == _profilYetkiModel?.transferDatVarsayilanCikisDepo)
          .firstOrNull;
  DepoList? get transferLokalDatGirisDepo =>
      _paramModel?.depoList
          ?.where((element) => element.depoKodu == _profilYetkiModel?.transferDatVarsayilanGirisDepo)
          .firstOrNull;

  bool get transferDatLokalDATSeciliGelmesin =>
      _isTrue(_profilYetkiModel?.transferDatLokalDatSeciliGelmesin, skipAdmin: true);
  bool get transferDatCarininDepoGetir => _isTrue(_profilYetkiModel?.transferDatDepoCaridenGelsin, skipAdmin: true);
  bool get transferDatEIrsaliyeIsaretleyemesin => _isTrue(_profilYetkiModel?.transferDatEIrsIsaretleyemesin);
  bool get transferDatOnay => _isTrue(_profilYetkiModel?.transferDatOnayIslemleri);
  // bool get transferDatKayittanSonraBasimYap => _isTrue(_yetkiModel?.transferkayit);

  //* Ambar Giriş Fişi

  MasrafKoduRehberiModel? get transferAgMasrafKodu =>
      _profilYetkiModel?.transferAgVarsayilanMasrafKodu != null
          ? MasrafKoduRehberiModel(
            masrafKodu: _profilYetkiModel?.transferAgVarsayilanMasrafKodu,
            masrafAdi: _profilYetkiModel?.transferAgVarsayilanMasrafKodu,
          )
          : null;
  bool transferLokalAgDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.transferAgDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAgBosGecilmeyecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.transferAgBosGecilmeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAgGizlenecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.transferAgGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAgAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.transferAgAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.transferAgAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.transferAgAciklamaAlanlari?.contains(index)) ??
            false,
  );
  bool get transferAgDigerSekmesiGoster => _isTrue(_profilYetkiModel?.transferAgDigerSekmesiGoster);
  // bool get transferAgDigerSekmesiGoster => _isTrue(_yetkiModel?.transferAg);
  bool get transferAgAciklamaDuzenle => _isTrue(_profilYetkiModel?.transferAgAciklamaDuzenle);

  bool get transferAgSiparisBaglantisi =>
      _isTrue(_profilYetkiModel?.transferAgSipBagSecenegi == "E" || _profilYetkiModel?.transferAgSipBagSecenegi == "O");
  bool get transferAgSiparisBaglantisiOpsiyonelMi => _isTrue(_profilYetkiModel?.transferAgSipBagSecenegi == "O");

  DepoList? get transferAgCikisDepo =>
      _paramModel?.depoList
          ?.where((element) => element.depoKodu == _profilYetkiModel?.transferDatVarsayilanCikisDepo)
          .firstOrNull;
  DepoList? get transferAgGirisDepo =>
      _paramModel?.depoList
          ?.where((element) => element.depoKodu == _profilYetkiModel?.transferDatVarsayilanGirisDepo)
          .firstOrNull;

  //* Ambar Çıkış Fişi

  MasrafKoduRehberiModel? get transferAcMasrafKodu =>
      _profilYetkiModel?.transferAcVarsayilanMasrafKodu != null
          ? MasrafKoduRehberiModel(
            masrafKodu: _profilYetkiModel?.transferAcVarsayilanMasrafKodu,
            masrafAdi: _profilYetkiModel?.transferAcVarsayilanMasrafKodu,
          )
          : null;
  bool transferLokalAcDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.transferAcDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAcBosGecilmeyecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.transferAcBosGecilmeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAcGizlenecekAlanlar(String? index) =>
      _isTrue(_profilYetkiModel?.transferAcGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAcAciklamaAlanlari(int index) => _isTrue(
    _profilYetkiModel?.transferAcAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _profilYetkiModel?.transferAcAciklamaAlanlari?.isNotEmpty
                : _profilYetkiModel?.transferAcAciklamaAlanlari?.contains(index)) ??
            false,
  );
  bool get transferAcDigerSekmesiGoster => _isTrue(_profilYetkiModel?.transferAcDigerSekmesiGoster);
  bool get transferAcAciklamaDuzenle => _isTrue(_profilYetkiModel?.transferAcAciklamaDuzenle);

  bool get transferAcSiparisBaglantisi =>
      _isTrue(_profilYetkiModel?.transferAcSipBagSecenegi == "E" || _profilYetkiModel?.transferAcSipBagSecenegi == "O");
  bool get transferAcSiparisBaglantisiOpsiyonelMi => _isTrue(_profilYetkiModel?.transferAcSipBagSecenegi == "O");

  DepoList? get transferAcVarsayilanDepo =>
      _paramModel?.depoList
          ?.where((element) => element.depoKodu == _profilYetkiModel?.transferAcVarsayilanDepo)
          .firstOrNull;

  bool get transferAcEIrsaliyeIsaretleyemesin => _isTrue(_profilYetkiModel?.transferAcEIrsIsaretleyemesin);

  //! Üretim

  //* Üretim Sonu Kaydı
  bool get uretimSonuKaydiEkle => _isTrue(_profilYetkiModel?.uretimUskKaydet);
  bool get uretimSonuKaydiDuzenle => _isTrue(_profilYetkiModel?.uretimUskDuzelt);
  bool get uretimSonuKaydiSil => _isTrue(_profilYetkiModel?.uretimUskSil);
  bool get uretimSonuKalemliYapi => _isTrue(_profilYetkiModel?.uretimUskKalemliYapi, skipAdmin: true);
  String? get uretimSonuDepoOnceligi => _profilYetkiModel?.uretimUskDepoOnceligi;
  bool get uretimFireUygulamasi => _isTrue(_paramModel?.uretimFireUyg, skipAdmin: true);
  bool get uretimFireDetayUygulamasi => _isTrue(_paramModel?.uretimFireDetayUyg) && uretimFireUygulamasi;

  bool uretimSonuGizlenecekAlanlar(String value) =>
      _isTrue(_profilYetkiModel?.uretimUskGizlenecekAlanlar?.contains(value), skipAdmin: true);
  bool uretimSonuDegismeyecekAlanlar(String value) =>
      _isTrue(_profilYetkiModel?.uretimUskDegismeyecekAlanlar?.contains(value), skipAdmin: true);
  bool uretimSonuBosGecilmeyecekAlanlar(String value) =>
      _isTrue(_profilYetkiModel?.uretimUskBosGecilmeyecekAlanlar?.contains(value), skipAdmin: true);

  //* İş Emirleri
  bool get uretimIsEmriEkle => _isTrue(_profilYetkiModel?.uretimIsEmriEkle);
  bool get uretimIsEmriDuzenle => _isTrue(_profilYetkiModel?.uretimIsEmriDuzelt);
  bool get uretimIsEmriSil => _isTrue(_profilYetkiModel?.uretimIsEmriSil);

  //! Yazdırma
  bool get yazdirmaStokEtiketi => _isTrue(_profilYetkiModel?.yazdirmaStokEtiketi);
  bool get yazdirmaMusSip => _isTrue(_profilYetkiModel?.yazdirmaMusSip);
  bool get yazdirmaSaticiSip => _isTrue(_profilYetkiModel?.yazdirmaSaticiSip);
  bool get yazdirmaAlisFat => _isTrue(_profilYetkiModel?.yazdirmaAlisFat);
  bool get yazdirmaSatisFat => _isTrue(_profilYetkiModel?.yazdirmaSatisFat);
  bool get yazdirmaAlisIrs => _isTrue(_profilYetkiModel?.yazdirmaAlisIrs);
  bool get yazdirmaSatisIrs => _isTrue(_profilYetkiModel?.yazdirmaSatisIrs);
  bool get yazdirmaSatisTeklifi => _isTrue(_profilYetkiModel?.yazdirmaSatisTeklifi);
  bool get yazdirmaSatisTalebi => _isTrue(_profilYetkiModel?.yazdirmaSatisTalebi);
  bool get yazdirmaDepoTransferi => _isTrue(_profilYetkiModel?.yazdirmaDat);
  bool get yazdirmaAmbarGirisi => _isTrue(_profilYetkiModel?.yazdirmaAmbarGiris);
  bool get yazdirmaAmbarCikisi => _isTrue(_profilYetkiModel?.yazdirmaAmbarCikis);
  bool get yazdirmaCariHareket => _isTrue(_profilYetkiModel?.yazdirmaCariHareket);
  bool get yazdirmaSayim => _isTrue(_profilYetkiModel?.yazdirmaSayim);
  bool get yazdirmaHucre => _isTrue(_profilYetkiModel?.yazdirmaHucreEtiketi);
  bool get yazdirmaPaketlemeEtiketi => _isTrue(_profilYetkiModel?.yazdirmaPaketlemeEtiketi);

  //! Otomatik PDF Gör
  bool get siparisMSOtomatikPDFGor => _isTrue(_profilYetkiModel?.siparisMusSipOtoPdfGor, skipAdmin: true);
  bool get siparisSSOtomatikPDFGor => _isTrue(_profilYetkiModel?.siparisSaticiSipOtoPdfGor, skipAdmin: true);
  bool get malKabulAlisIrsOtomatikPDFGor => _isTrue(_profilYetkiModel?.malKabulAlisIrsOtoPdfGor, skipAdmin: true);
  bool get sevkiyatSatisIrsOtomatikPDFGor => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsOtoPdfGor, skipAdmin: true);
  bool get sevkiyatSatFatOtomatikPDFGor => _isTrue(_profilYetkiModel?.sevkiyatSatisFatOtoPdfGor, skipAdmin: true);
  bool get transferDatOtomatikPDFGor => _isTrue(_profilYetkiModel?.transferDatOtoPdfGor, skipAdmin: true);
  bool get transferAcOtomatikPDFGor => _isTrue(_profilYetkiModel?.transferAcOtoPdfGor, skipAdmin: true);
  bool get transferAgOtomatikPDFGor => _isTrue(_profilYetkiModel?.transferAgOtoPdfGor, skipAdmin: true);

  //! Kopyala
  bool get kopyalaMusSip => _isTrue(_profilYetkiModel?.siparisMusSipBelgeKopyala);
  bool get kopyalaAlisTalebi => _isTrue(_profilYetkiModel?.taltekAtalBelgeKopyala);
  bool get kopyalaAmbarGirisi => _isTrue(_profilYetkiModel?.transferAgBelgeKopyala);
  bool get kopyalaAmbarCikisi => _isTrue(_profilYetkiModel?.transferAcBelgeKopyala);

  //! Cari Kodu Değiştir
  bool get cariKoduDegistirMusSip => _isTrue(_profilYetkiModel?.siparisMusSipCariKoduDegistir);
  bool get cariKoduDegistirSaticiSip => _isTrue(_profilYetkiModel?.siparisSaticiSipCariKoduDegistir);
  bool get cariKoduDegistirAlisFat => _isTrue(_profilYetkiModel?.malKabulAlisFatCariKoduDegistir);
  bool get cariKoduDegistirSatisFat => _isTrue(_profilYetkiModel?.sevkiyatSatisFatCariKoduDegistir);
  bool get cariKoduDegistirAlisIrs => _isTrue(_profilYetkiModel?.malKabulAlisIrsCariKoduDegistir);
  bool get cariKoduDegistirSatisIrs => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsCariKoduDegistir);
  bool get cariKoduDegistirSatisTeklifi => _isTrue(_profilYetkiModel?.taltekStekCariKoduDegistir);
  bool get cariKoduDegistirSatisTalebi => _isTrue(_profilYetkiModel?.taltekStalCariKoduDegistir);
  bool get cariKoduDegistirAlisTalebi => _isTrue(_profilYetkiModel?.taltekAtalCariKoduDegistir);

  //! Kapatma İşlemi
  bool get belgeKapatMusSip => _isTrue(_profilYetkiModel?.siparisMusteriSiparisiKapatmaIslemi);
  bool get belgeKapatSaticiSip => _isTrue(_profilYetkiModel?.siparisSaticiSiparisiKapatmaIslemi);

  //! Max Genel İskonto 1
  double? get msMaxGenelIskonto1 => _profilYetkiModel?.siparisMusSipMaxGenIsk1;
  double? get sfMaxGenelIskonto1 => _profilYetkiModel?.sevkiyatSatisFatMaxGenIsk1;
  double? get siMaxGenelIskonto1 => _profilYetkiModel?.sevkiyatSatisIrsMaxGenIsk1;

  //! Max Genel İskonto 2
  double? get msMaxGenelIskonto2 => _profilYetkiModel?.siparisMusSipMaxGenIsk2;
  double? get sfMaxGenelIskonto2 => _profilYetkiModel?.sevkiyatSatisFatMaxGenIsk2;
  double? get siMaxGenelIskonto2 => _profilYetkiModel?.sevkiyatSatisIrsMaxGenIsk2;

  //! Max Genel İskonto 3
  double? get msMaxGenelIskonto3 => _profilYetkiModel?.siparisMusSipMaxGenIsk3;
  double? get sfMaxGenelIskonto3 => _profilYetkiModel?.sevkiyatSatisFatMaxGenIsk3;
  double? get siMaxGenelIskonto3 => _profilYetkiModel?.sevkiyatSatisIrsMaxGenIsk3;

  //! Max Satır İskonto 1
  double? get msMaxSatirIskonto1 => _profilYetkiModel?.siparisMusSipMaxSatIsk1;
  double? get sfMaxSatirIskonto1 => _profilYetkiModel?.sevkiyatSatisFatMaxSatIsk1;
  double? get siMaxSatirIskonto1 => _profilYetkiModel?.sevkiyatSatisIrsMaxSatIsk1;

  //! Max Satır İskonto 2
  double? get msMaxSatirIskonto2 => _profilYetkiModel?.siparisMusSipMaxSatIsk2;
  double? get sfMaxSatirIskonto2 => _profilYetkiModel?.sevkiyatSatisFatMaxSatIsk2;
  double? get siMaxSatirIskonto2 => _profilYetkiModel?.sevkiyatSatisIrsMaxSatIsk2;

  //! Max Satır İskonto 3
  double? get msMaxSatirIskonto3 => _profilYetkiModel?.siparisMusSipMaxSatIsk3;
  double? get sfMaxSatirIskonto3 => _profilYetkiModel?.sevkiyatSatisFatMaxSatIsk3;
  double? get siMaxSatirIskonto3 => _profilYetkiModel?.sevkiyatSatisIrsMaxSatIsk3;

  //! Max Satır İskonto 4
  double? get msMaxSatirIskonto4 => _profilYetkiModel?.siparisMusSipMaxSatIsk4;
  double? get sfMaxSatirIskonto4 => _profilYetkiModel?.sevkiyatSatisFatMaxSatIsk4;
  double? get siMaxSatirIskonto4 => _profilYetkiModel?.sevkiyatSatisIrsMaxSatIsk4;

  //! Max Satır İskonto 5
  double? get msMaxSatirIskonto5 => _profilYetkiModel?.siparisMusSipMaxSatIsk5;
  double? get sfMaxSatirIskonto5 => _profilYetkiModel?.sevkiyatSatisFatMaxSatIsk5;
  double? get siMaxSatirIskonto5 => _profilYetkiModel?.sevkiyatSatisIrsMaxSatIsk5;

  //! Max Satır İskonto 6
  double? get msMaxSatirIskonto6 => _profilYetkiModel?.siparisMusSipMaxSatIsk6;
  double? get sfMaxSatirIskonto6 => _profilYetkiModel?.sevkiyatSatisFatMaxSatIsk6;
  double? get siMaxSatirIskonto6 => _profilYetkiModel?.sevkiyatSatisIrsMaxSatIsk6;

  //! Max İskonto Uygulaması
  bool get msMaxIskontoUygula => _isTrue(_profilYetkiModel?.siparisMusSipMaxIskUygulamasi);
  bool get sfMaxIskontoUygula => _isTrue(_profilYetkiModel?.sevkiyatSatisFatMaxIskUygulamasi);
  bool get siMaxIskontoUygula => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsMaxIskUygulamasi);

  //! Sigma
  bool get sigmaOlcumGirisi => _isTrue(_profilYetkiModel?.sigmaOlcumGir);
  bool get sigmaOlcumKaydet => _isTrue(_profilYetkiModel?.sigmaOlcumGirKaydet);
  bool get sigmaOlcumDuzelt => _isTrue(_profilYetkiModel?.sigmaOlcumGirDuzelt);
  bool get sigmaOlcumGirSil => _isTrue(_profilYetkiModel?.sigmaOlcumGirSil);
  bool get sigmaTeknikResim => _isTrue(_profilYetkiModel?.sigmaTeknikResim);
  bool get sigmaKontrolPlani => _isTrue(_profilYetkiModel?.sigmaKontrolPlani);

  //! Hücre
  bool get hucreHareketleri => _isTrue(_profilYetkiModel?.hucreHareketleri);

  //! Görüntüle

  bool get siparisMSGoruntule => _isTrue(_profilYetkiModel?.siparisMusteriSiparisi);
  bool get siparisSSGoruntule => _isTrue(_profilYetkiModel?.siparisSaticiSiparisi);
  bool get satisFatGoruntule => _isTrue(_profilYetkiModel?.sevkiyatSatisFat);
  bool get satisIrsGoruntule => _isTrue(_profilYetkiModel?.sevkiyatSatisIrsaliyesi);
  bool get alisFatGoruntule => _isTrue(_profilYetkiModel?.malKabulAlisFaturasi);
  bool get alisIrsGoruntule => _isTrue(_profilYetkiModel?.malKabulSatinAlma);
  bool get satisTeklifiGoruntule => _isTrue(_profilYetkiModel?.taltekStek);
  bool get alisTalebiGoruntule => _isTrue(_profilYetkiModel?.taltekAtal);
  bool get satisTalebiGoruntule => _isTrue(_profilYetkiModel?.taltekStal);
  bool get cariKartiGoruntuleme => _isTrue(_profilYetkiModel?.cariCariKarti);

  bool ozelKod1TablodanMi(EditTipiEnum? editTipi) {
    if (!editTipi.talepTeklifMi) {
      return _isTrue(
        (editTipi?.satisMi ?? false) ? _paramModel?.satisOzelKod1Tablodan : _paramModel?.alisOzelKod1Tablodan,
        skipAdmin: true,
      );
    }
    return _isTrue(_paramModel?.talTekParam?.firstOrNull?.ozelKod1Tablodan == "E", skipAdmin: true);
  }

  String? get satisFatTekrarEdenBarkod => _profilYetkiModel?.sevkiyatSatisFaturasiTekrarEdenBarkod;
  String? get satisIrsTekrarEdenBarkod => _profilYetkiModel?.sevkiyatSatisIrsTekrarEdenBarkod;
  String? get alisFatTekrarEdenBarkod => _profilYetkiModel?.malKabulAlisFatTekrarEdenBarkod;
  String? get alisIrsTekrarEdenBarkod => _profilYetkiModel?.malKabulAlisIrsTekrarEdenBarkod;
  String? get transferAGTekrarEdenBarkod => _profilYetkiModel?.transferAgTekrarEdenBarkod;
  String? get transferACTekrarEdenBarkod => _profilYetkiModel?.transferAcTekrarEdenBarkod;
  String? get transferDatTekrarEdenBarkod => _profilYetkiModel?.transferDatTekrarEdenBarkod;
  String? get siparisMSTekrarEdenBarkod => _profilYetkiModel?.siparisMusSipTekrarEdenBarkod;
  String? get siparisSSTekrarEdenBarkod => _profilYetkiModel?.siparisSatSipTekrarEdenBarkod;

  String? get transferDATVarsayilanOzelKod1 => _profilYetkiModel?.transferDatOzelKod1Degeri;
  String? get transferDATVarsayilanOzelKod2 => _profilYetkiModel?.transferDatOzelKod2Degeri;

  //! Belge Kontrol
  bool get genelBelgeKontrolEkle => _isTrue(_profilYetkiModel?.genelBelgeKontrolEkle);
  bool get genelBelgeKontrolSil => _isTrue(_profilYetkiModel?.genelBelgeKontrolSil);
  bool get genelBelgeKontrolBarkodOkutulsun => _isTrue(_profilYetkiModel?.genelBelgeKontrolBarkodOkutsun == "E");
  List<EditTipiEnum> get genelBelgeKontrolBelgeTipleri =>
      [EditTipiEnum.satisIrsaliye, EditTipiEnum.satisFatura, EditTipiEnum.depoTransferi]
          .where((element) => _isTrue(_profilYetkiModel?.genelBelgeKontrolBelgeTipleri?.contains(element.rawValue)))
          .toList();

  bool get ozelHesapKapatmaIslemi => _isTrue(_profilYetkiModel?.cariOzelHesapKapatma);
  bool get ozelHesapKapatmaIslemiSil => _isTrue(_profilYetkiModel?.cariOzelHesapKapatmaSil);

  bool get _alisSatirdaVade => _isTrue(_paramModel?.alisSatirBazindaVade, skipAdmin: true);
  bool get _satisSatirdaVade => _isTrue(_paramModel?.satisSatirBazindaVade, skipAdmin: true);
  bool satirdaVade(EditTipiEnum editTipi) {
    if (editTipi.faturaMi || editTipi.irsaliyeMi || editTipi.siparisMi) {
      return editTipi.satisMi ? _satisSatirdaVade : _alisSatirdaVade;
    }
    return false;
  }

  bool get _satisAciklamaAlaniGorunsun => _isTrue(_paramModel?.satisAciklamaAlaniGorunsun, skipAdmin: true);

  bool get _alisAciklamaAlaniGorunsun => _isTrue(_paramModel?.alisAciklamaAlaniGorunsun, skipAdmin: true);

  bool aciklamaAlaniGorunsun(EditTipiEnum? editTipi) {
    if (editTipi == null) return false;
    return editTipi.satisMi ? _satisAciklamaAlaniGorunsun : _alisAciklamaAlaniGorunsun;
  }
}
