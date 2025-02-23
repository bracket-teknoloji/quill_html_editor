import "package:collection/collection.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/view/masraf_kodu/model/masraf_kodu_rehberi_model.dart";
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

  ProfilYetkiModel? get _yetkiModel => _userModel?.profilYetki;

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
  List<DepoList>? get yetkiliDepoList {
    if (_kullaniciYetkiModel?.sirketDepoYetkiTuru == "T" || adminMi) return _paramModel?.depoList;
    if (_isTrue(_kullaniciYetkiModel?.sirketDepoYetkiTuru == null)) {
      return _paramModel?.depoList;
    }
    return _paramModel?.depoList
        ?.where(
          (element) => _isTrue(
            _kullaniciYetkiModel?.sirketDepoYetkiTuru == null
                ? (_kullaniciYetkiModel?.sirketAktifDepolar?.contains(element.depoKodu) ??
                    _yetkiModel?.sirketAktifDepolar?.contains(element.depoKodu))
                : _yetkiModel?.sirketAktifDepolar?.contains(element.depoKodu),
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

  bool get alisTopluDepoKullan => _isTrue(_paramModel?.alisTopluDepoAktif);
  bool get satisTopluDepoKullan => _isTrue(_paramModel?.satisTopluDepoAktif);
  bool topluDepoKullan(EditTipiEnum? editTipi) =>
      editTipi?.satisMi == true ? satisTopluDepoKullan : alisTopluDepoKullan;
  bool projeYetkisiVarMi(String? projeKodu) => _isTrue(
    _yetkiModel?.sirketAktifProjeler == null || (_yetkiModel?.sirketAktifProjeler?.contains(projeKodu) ?? true),
  );
  bool genIsk1AktifMi(EditTipiEnum? editTipi) =>
      editTipi?.satisMi == true ? siparisSSGenIsk1AktifMi : siparisMSGenIsk1AktifMi;
  bool genIsk2AktifMi(EditTipiEnum? editTipi) =>
      editTipi?.satisMi == true ? siparisSSGenIsk2AktifMi : siparisMSGenIsk2AktifMi;
  bool genIsk3AktifMi(EditTipiEnum? editTipi) =>
      editTipi?.satisMi == true ? siparisSSGenIsk3AktifMi : siparisMSGenIsk3AktifMi;
  bool get genelDovizEkle => _isTrue(_yetkiModel?.genelDovizKurlariEkle);
  bool get genelDovizDuzenle => _isTrue(_yetkiModel?.genelDovizKurlariDuzelt);
  bool get genelDovizSil => _isTrue(_yetkiModel?.genelDovizKurlariSil);
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
        kontrolluBelgeAktarimAktif && (_yetkiModel?.sirketKontrolluAktarBelgeTipleri?.contains(belgeTuru) ?? false),
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
  bool get temsilciProfilKdvDahilMi => _isTrue(_yetkiModel?.temsilciProfilKdvDahil, skipAdmin: true);
  bool get temsilciProfilSatisPerformansiniGizle =>
      _isTrue(_yetkiModel?.temsilciProfilSatisPerformansiniGizle, skipAdmin: true);
  bool get temsilciProfilAylaraGoreSatisiGizle =>
      _isTrue(_yetkiModel?.temsilciProfilAylaraGoreSatisiGizle, skipAdmin: true);
  bool get temsilciProfilAylaraGoreTahsilatiGizle =>
      _isTrue(_yetkiModel?.temsilciProfilAylaraGoreTahsilatiGizle, skipAdmin: true);

  //! CARİ

  bool get cariListesi => _isTrue(_yetkiModel?.cariCariListesi);
  bool get cariRapStokSatisOzeti => _isTrue(_yetkiModel?.cariRapStokSatisOzeti);
  bool get cariListesiRiskGorebilir => _isTrue(_yetkiModel?.cariCariListesiRiskGorebilir);
  bool get cariToplamGorunmesin => _isTrue(_yetkiModel?.cariToplamGorunmesin, skipAdmin: true);

  //* Cari Kartı
  bool get cariKarti => _isTrue(_yetkiModel?.cariCariKarti);
  bool get cariKartiYeniKayit => _isTrue(_yetkiModel?.cariCariKartiKaydet);
  bool get cariKartiDuzenleme => _isTrue(_yetkiModel?.cariCariKartiDuzelt);
  bool get cariKartiSilme => _isTrue(_yetkiModel?.cariCariKartiSil);
  bool get cariKartiRotasUygulamasiAcikMi => _isTrue(_paramModel?.cariRotaUygulamasi == "E", skipAdmin: true);

  bool cariKartiDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.cariCariKartiDegismeyecekAlanlar?.contains(index), skipAdmin: true);

  //* Cari Hareketleri
  bool get cariHareketleri => _isTrue(_yetkiModel?.cariCariHareketleri);
  bool get cariHareketleriYeniKayit => _isTrue(_yetkiModel?.cariCariHarKaydet);
  bool get cariHareketleriDuzenleme => _isTrue(_yetkiModel?.cariCariHarDuzelt);
  bool get cariHareketleriSilme => _isTrue(_yetkiModel?.cariCariHarSil);
  bool get cariHareketleriHarDetayGorsun => _isTrue(_yetkiModel?.cariCariHareketleriHarDetayGorsun);
  bool get cariHareketleriPlasiyerKendiniGorsun => _isTrue(_yetkiModel?.stokCariHarPlasiyerKendiniGorsun);

  //* Cari Aktivite
  bool get cariAktivite => _isTrue(_yetkiModel?.cariAktivite);
  bool get cariAktiviteDetayliMi => _isTrue(_paramModel?.cariAktiviteUygulamasi == "D", skipAdmin: true);
  bool get cariAktiviteYeniKayit => _isTrue(_yetkiModel?.cariAktiviteEkle);
  bool get cariAktiviteDuzenleme => _isTrue(_yetkiModel?.cariAktiviteDuzelt);
  bool get cariAktiviteSilme => _isTrue(_yetkiModel?.cariAktiviteSil);
  bool get cariBakiyeGosterimTumuMu => _isTrue(_yetkiModel?.cariBakiyeGosterim == "T");
  bool get cariBakiyeGosterimKendiCarileriMi => _isTrue(_yetkiModel?.cariBakiyeGosterim == "K", skipAdmin: true);
  bool get cariAktiviteAtayabilir => _isTrue(_yetkiModel?.cariAktiviteAtayabilir);
  bool get cariAktiviteBitirmeyiGeriAl => _isTrue(_yetkiModel?.cariAktiviteBitirmeyiGeriAl);

  //! STOK

  bool get stokListesi => _isTrue(_yetkiModel?.stokStokListesi);
  bool get stokFiyatGorEkrani => _isTrue(_yetkiModel?.stokFiyatGorEkrani);
  bool stokFiyatGorEkraniGorunecekAlanlar(String value) =>
      _isTrue(_yetkiModel?.stokFiyatGorEkraniGorunecekAlanlar?.contains(value));
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
  bool get stokFiyatGoster => _isTrue(!_isTrue(_yetkiModel?.stokStokKartiFiyatlariGizle));
  bool get stokAlisFiyatGoster => _isTrue(!_isTrue(_yetkiModel?.stokStokKartiAlisFiyatiGizle));
  bool get stokSatisFiyatGoster => _isTrue(!_isTrue(_yetkiModel?.stokStokKartiSatisFiyatiGizle));
  bool get stokFiyatOzeti => _isTrue(_yetkiModel?.stokFiyatOzeti);

  bool stokListesiExtraAlanlar(String value) =>
      _isTrue(_yetkiModel?.stokStokListesiExtraAlanlar?.contains(value), skipAdmin: true);

  //* Seri İşlemleri
  bool get seriIslemleri => _isTrue(_paramModel?.seriUygulamasiAcik);
  // bool get seriIslemEkle => _isTrue(_yetkiModel?.kaydet)

  //* Stok Kartı
  bool get stokKarti => _isTrue(_yetkiModel?.stokStokKarti);
  bool get stokDepoBakiyeDurumu => _isTrue(
    _yetkiModel?.stokDepoBakiyeDurumu == null
        ? true
        : _yetkiModel?.stokDepoBakiyeDurumu == "E"
        ? true
        : false,
  );
  bool get stokKartiYeniKayit => _isTrue(_yetkiModel?.stokStokKartiKaydet);
  bool get stokKartiDuzenleme => _isTrue(_yetkiModel?.stokStokKartiDuzelt);
  bool get stokKartiSilme => _isTrue(_yetkiModel?.stokStokKartiSil);
  bool get stokSatisFiyatiGizle => _isTrue(_yetkiModel?.stokStokKartiSatisFiyatiGizle);

  //* Stok Hareketleri
  bool get stokHareketleriStokHareketleri => _isTrue(_yetkiModel?.stokStokHareketleri);
  bool get stokHareketleriStokYeniKayit => _isTrue(_yetkiModel?.stokStokHarKaydet);
  bool get stokHareketleriStokDuzenleme => _isTrue(_yetkiModel?.stokStokHarDuzelt);
  bool get stokHareketleriStokSilme => _isTrue(_yetkiModel?.stokStokHarSil);
  bool get stokHareketleriPlasiyerKendiniGorsun => _isTrue(_yetkiModel?.stokStokHarPlasiyerKendiniGorsun);
  bool get stokHareketDetayiniGizle => _isTrue(_yetkiModel?.stokHareketDetayiniGizle ?? false, skipAdmin: true);

  //* Stok Resim
  bool get stokResimGoster => _isTrue(_yetkiModel?.stokResimGoster);
  bool get stokResimEkle => _isTrue(_yetkiModel?.stokResimGosterEkle);
  bool get stokResimSil => _isTrue(_yetkiModel?.stokResimGosterSil);

  //* Stok Barkod
  bool get stokBarkodKontrol => _isTrue(_yetkiModel?.stokBarkodKontrol);
  bool get stokBarkodTanimla => _isTrue(_yetkiModel?.stokBarkodTanimlama);
  bool get stokBarkodKayitlari => _isTrue(_yetkiModel?.stokBarkodKayitlari);
  bool get stokBarkodEkle => _isTrue(_yetkiModel?.stokBarkodKayitlariEkle);
  bool get stokBarkodDuzenle => _isTrue(_yetkiModel?.stokBarkodKayitlariDuzelt);
  bool get stokBarkodSil => _isTrue(_yetkiModel?.stokBarkodKayitlariSil);
  bool get stokBarkodStokKartiGorunsun => _isTrue(_yetkiModel?.stokBarkodKayitlariGecerliOlcuBirimleri?.isNotEmpty);
  List<BarkodTipiEnum> get stokBarkodGecerliBarkodTipleri =>
      BarkodTipiEnum.values
          .where(
            (element) =>
                _yetkiModel?.stokBarkodKayitlariGecerliBarkodTipleri?.any(
                  (element2) => element2 == element.barkodTipi,
                ) ??
                adminMi,
          )
          .toList();

  bool stokBarkodGorunecekAlanlar(String value) => _isTrue(
    (_yetkiModel?.stokBarkodTanimlamaGorunecekAlanlar.ext.isNullOrEmpty ?? false) ||
        (_yetkiModel?.stokBarkodTanimlamaGorunecekAlanlar?.contains(value) ?? false),
  );

  //* Paketleme
  bool get stokPaketlemeSil => _isTrue(_yetkiModel?.stokPaketlemeSil);
  bool get stokPaketlemeEkle => _isTrue(_yetkiModel?.stokPaketlemeEkle);
  bool get stokPaketlemeCoklu => _isTrue(_yetkiModel?.stokPaketlemeCoklu);
  bool get stokPaketlemeDigerKulKayitGorebilir => _isTrue(_yetkiModel?.stokPaketlemeDigerKulKayitGorebilir == "E");
  bool get stokPaketlemeOnaySormasin => _isTrue(_yetkiModel?.stokPaketlemeOnaySormasin == "E", skipAdmin: true);

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
      _yetkiModel?.cariTeslimCariSatisBaglanmisCarilerSecilsin == "E";

  bool get cariTeslimCariRehberSadeceSecsin => _yetkiModel?.cariTeslimCariRehberSadeceSecsin == "E";

  //! Sipariş
  bool get siparisMSDurumRaporuFiyatGor => _isTrue(_yetkiModel?.siparisMusteriSiparisiDurumRaporuFiyatGor);
  bool get siparisSSDurumRaporuFiyatGor => _isTrue(_yetkiModel?.siparisSaticiSiparisiDurumRaporuFiyatGor);
  bool _musteriSiparisiMi(EditTipiEnum? editTipi) => editTipi?.musteriMi == true;
  bool get siparisKdvDahilMi {
    if (_yetkiModel?.siparisMusSipKdvDurumu == "D") return true;
    if (_yetkiModel?.siparisMusSipKdvDurumu == "H") return false;
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
  bool get msOnayIslemleri => _isTrue(_yetkiModel?.siparisMusSipOnayIslemleri);
  bool get ssOnayIslemleri => _isTrue(_yetkiModel?.siparisSaticiSipOnayIslemleri);

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
  String? get siparisMSOzelKod1Degeri => _yetkiModel?.siparisMusSipOzelKod1Degeri;
  String? get siparisMSOzelKod2Degeri => _yetkiModel?.siparisMusSipOzelKod2Degeri;
  bool get siparisMSFiyatDegistirilmesin =>
      _isTrue(_yetkiModel?.siparisMusteriSiparisiFiyatDegistirilmesin, skipAdmin: true);
  bool get satisOzelKod1AktifMi => _isTrue(_paramModel?.satisOzelKod1Aktif ?? false, skipAdmin: true);
  bool get satisOzelKod2AktifMi => _isTrue(_paramModel?.satisOzelKod2Aktif, skipAdmin: true);
  bool get siparisMSGenIsk1AktifMi => _isTrue(_paramModel?.satisGenIsk1Aktif, skipAdmin: true);
  bool get siparisMSGenIsk2AktifMi => _isTrue(_paramModel?.satisGenIsk2Aktif, skipAdmin: true);
  bool get siparisMSGenIsk3AktifMi => _isTrue(_paramModel?.satisGenIsk3Aktif, skipAdmin: true);
  bool get siparisMSDuzelt => _isTrue(_yetkiModel?.siparisMusteriSiparisiDuzelt);
  bool get siparisMSKaydet => _isTrue(_yetkiModel?.siparisMusteriSiparisiKaydet);
  bool get siparisMSSil => _isTrue(_yetkiModel?.siparisMusteriSiparisiSil);
  bool get siparisMSCariKoduDegistir => _isTrue(_yetkiModel?.siparisMusSipCariKoduDegistir);
  bool get siparisMSKapalilarListelenmesin => _isTrue(_yetkiModel?.siparisMusteriSiparisiKapalilarListelenmesin);
  bool get siparisMSBirim1denKaydet => _isTrue(_yetkiModel?.siparisMusSipBirim1DenKaydet);
  bool get siparisMSKapatmaIslemi => _isTrue(_yetkiModel?.siparisMusteriSiparisiKapatmaIslemi);
  bool get siparisMSOnayIslemleri => _isTrue(_yetkiModel?.siparisMusSipOnayIslemleri);
  bool get siparisMSSonFiyatGoster => _isTrue(_yetkiModel?.siparisMusteriSiparisiSonFiyatGoster);
  bool get siparisMSDigerSekmesiGoster => _isTrue(_yetkiModel?.siparisMusSipDigerSekmesiGoster);
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
      _isTrue(_yetkiModel?.siparisMusSipEkstraAlanlar?.contains(value), skipAdmin: true);

  // bool get siparisMSbelgeKopyala => _isTrue(_yetkiModel?.siparisMusSipBelge);
  ///? Eğer içeriyorsa boş geçilecek
  bool siparisMSBosGecilecekAlanMi(String alan) =>
      _isTrue(!(_yetkiModel?.siparisMusSipBosGecilmeyecekAlanlar?.contains(alan) ?? false));

  ///? Eğer içeriyorsa gizlenecek
  bool siparisMSGizlenecekAlanMi(String alan) =>
      _isTrue(!(_yetkiModel?.siparisMusteriSiparisiGizlenecekAlanlar?.contains(alan) ?? false));
  bool get siparisMSKontrolAciklamasiAktifMi =>
      _isTrue(_paramModel?.fatuKontrolAciklamasiAktif?.contains("MS"), skipAdmin: true);

  ///? Eğer içeriyorsa değiştirilemeyecek
  bool siparisMSDegismeyecekAlanMi(String alan) =>
      _isTrue(!(_yetkiModel?.siparisMusteriSiparisiDegismeyecekAlanlar?.contains(alan) ?? false));

  ///? Eğer içeriyorsa gösterilecek (Sipariş için)
  bool siparisMSAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.siparisMusteriSiparisiAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _yetkiModel?.siparisMusteriSiparisiAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.siparisMusteriSiparisiAciklamaAlanlari?.contains(index)) ??
            false,
  );

  ///? Eğer içeriyorsa gösterilecek (Kalemler İçin)
  bool siparisSatirAciklamaAlanlari(EditTipiEnum? editTipi, int? index) =>
      editTipi?.satisMi ?? false ? siparisMSSatirAciklamaAlanlari(index) : siparisMSSatirAciklamaAlanlari(index);

  bool siparisSSSatirAciklamaAlanlari(int? index) =>
      (_paramModel?.alisSatirdaAciklamalarAktif ?? false) &&
      (index == null
          ? _isTrue(_yetkiModel?.siparisSaticiSiparisiSatirAciklamaAlanlari?.ext.isNotNullOrEmpty)
          : _isTrue(_yetkiModel?.siparisSaticiSiparisiSatirAciklamaAlanlari?.contains(index) ?? false));

  bool siparisMSSatirAciklamaAlanlari(int? index) =>
      (_paramModel?.satisSatirdaAciklamalarAktif ?? false) &&
      (index == null
          ? _isTrue(_yetkiModel?.siparisMusteriSiparisiSatirAciklamaAlanlari?.ext.isNotNullOrEmpty)
          : _isTrue(_yetkiModel?.siparisMusteriSiparisiSatirAciklamaAlanlari?.contains(index) ?? false));

  //* Satıcı Siparişi

  bool get siparisSSFiyatDegistirilmesin =>
      _isTrue(_yetkiModel?.siparisSaticiSiparisiFiyatDegistirilmesin, skipAdmin: true);
  bool get siparisSSKdvDahilMi => _isTrue(_paramModel?.alisGenellikleKdvHaric, skipAdmin: true);
  bool get siparisSSGenIsk1AktifMi => _isTrue(_paramModel?.alisGenIsk1Aktif, skipAdmin: true);
  bool get siparisSSGenIsk2AktifMi => _isTrue(_paramModel?.alisGenIsk2Aktif, skipAdmin: true);
  bool get siparisSSGenIsk3AktifMi => _isTrue(_paramModel?.alisGenIsk3Aktif, skipAdmin: true);
  bool get siparisSSDuzelt => _isTrue(_yetkiModel?.siparisSaticiSiparisiDuzelt);
  bool get siparisSSKaydet => _isTrue(_yetkiModel?.siparisSaticiSiparisiKaydet);
  bool get siparisSSSil => _isTrue(_yetkiModel?.siparisSaticiSiparisiSil);
  bool get siparisSSKapalilarListelenmesin => _isTrue(_yetkiModel?.siparisSaticiSiparisiKapalilarListelenmesin);
  bool get siparisSSBirim1denKaydet => _isTrue(_yetkiModel?.siparisSaticiSipBirim1DenKaydet);
  bool get siparisSSDigerSekmesiGoster => _isTrue(_yetkiModel?.siparisSaticiSipDigerSekmesiGoster);
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
  bool get hizliTahsilatSil => _isTrue(_yetkiModel?.finansHizliTahsilatKayitlariSil);
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
  bool get kasaListesi => _isTrue(_yetkiModel?.finansKasaListesi);
  bool get finansKasaIslemleri => _isTrue(_yetkiModel?.finansKasaIslemleri);
  bool get finansKasaIslemleriSil => _isTrue(_yetkiModel?.finansKasaIslemleriSil);
  bool get tahsilatReferansKoduSorulsun => _isTrue(_paramModel?.muhFislerdeRefKodSorulsunGelir, skipAdmin: true);
  bool get odemeReferansKoduSorulsun => _isTrue(_paramModel?.muhFislerdeRefKodSorulsunGider, skipAdmin: true);

  //* Banka
  bool kayitliHesapTipiMi(int value) => _paramModel?.kayitliBankaHesapTipleri?.contains(value) ?? false;
  bool get bankaKayitSilinsinMi => _isTrue(_yetkiModel?.yoneticiBankaIslemleriSil);

  bool get musteriCekSil => _isTrue(_yetkiModel?.finansMcekSil);
  bool get musteriSenetSil => _isTrue(_yetkiModel?.finansMsenSil);
  bool get borcCekSil => _isTrue(_yetkiModel?.finansBcekSil);
  bool get borcSenetSil => _isTrue(_yetkiModel?.finansBsenSil);

  bool get bankaCariEftHavale => _isTrue(_yetkiModel?.yoneticiBankaIslemCariEft);

  bool get musteriCekCariHesabaCirola => _isTrue(_yetkiModel?.finansMcekCariyeCiro);
  bool get musteriSenetCariHesabaCirola => _isTrue(_yetkiModel?.finansMsenCariyeCiro);

  bool get musteriCekTahsilHesabinaCirola => _isTrue(_yetkiModel?.finansMcekTahsileCiro);
  bool get musteriSenetTahsilHesabinaCirola => _isTrue(_yetkiModel?.finansMsenTahsileCiro);

  bool get musteriCekTahsilDekontu => _isTrue(_yetkiModel?.finansMcekTahsilDekontu);
  bool get musteriSenetTahsilDekontu => _isTrue(_yetkiModel?.finansMsenTahsilDekontu);

  bool get musteriCekEkle => _isTrue(_yetkiModel?.finansMcekEkle);
  bool get musteriSenetEkle => _isTrue(_yetkiModel?.finansMsenEkle);
  bool get borcCekEkle => _isTrue(_yetkiModel?.finansBcekEkle);
  bool get borcSenetEkle => _isTrue(_yetkiModel?.finansBsenEkle);

  bool get musteriCekHareketler => _isTrue(_yetkiModel?.finansMcekHareketler);
  bool get musteriSenetHareketler => _isTrue(_yetkiModel?.finansMsenHareketler);
  bool get borcCekHareketler => _isTrue(_yetkiModel?.finansBcekHareketler);
  bool get borcSenetHareketler => _isTrue(_yetkiModel?.finansBsenHareketler);

  //! SEVKİYAT

  bool sevkiyatSatisFatBelgeTipleri(int? value) => _isTrue(_yetkiModel?.sevkiyatSatisFatBelgeTipleri?.contains(value));
  bool sevkiyatSatisIrsBelgeTipleri(int? value) =>
      _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiBelgeTipleri?.contains(value));

  bool get sevkiyatSatisFatFiyatDegistirilmesin =>
      _isTrue(_yetkiModel?.sevkiyatSatisFatFiyatDegistirilmesin, skipAdmin: true);
  bool get satisIrsFiyatGor => _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiFiyatGor);

  bool get satisCariDovizTipiniKullan => _isTrue(_paramModel?.satisCariDovizTipiniKullan);
  bool get alisCariDovizTipiniKullan => _isTrue(_paramModel?.alisCariDovizTipiniKullan);

  bool get satisFatEkle => _isTrue(_yetkiModel?.sevkiyatSatisFatKaydet);
  bool get satisFatDuzenle => _isTrue(_yetkiModel?.sevkiyatSatisFatDuzelt);
  bool get satisFatSil => _isTrue(_yetkiModel?.sevkiyatSatisFatSil);
  bool get satisFatBirim1denKaydet => _isTrue(_yetkiModel?.sevkiyatSatisFatBirim1DenKaydet, skipAdmin: true);

  bool get satisIrsEkle => _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiKayit);
  bool get satisIrsDuzenle => _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiDuzeltme);
  bool get satisIrsSil => _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiSilme);
  bool get satisIrsBirim1denKaydet => _isTrue(_yetkiModel?.sevkiyatSatisIrsBirim1DenKaydet, skipAdmin: true);

  bool satisIrsDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool satisFatDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.sevkiyatSatisFatDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool alisIrsDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.malKabulAlisIrsDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool alisFatDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.malKabulAlisFatDegismeyecekAlanlar?.contains(index), skipAdmin: true);

  bool satisIrsBosGecilmeyecekAlanlar(String? value) =>
      _isTrue(_yetkiModel?.sevkiyatSatisIrsBosGecilmeyecekAlanlar?.contains(value), skipAdmin: true);
  bool satisFatBosGecilmeyecekAlanlar(String? value) =>
      _isTrue(_yetkiModel?.sevkiyatSatisFatBosGecilmeyecekAlanlar?.contains(value), skipAdmin: true);
  bool alisIrsBosGecilmeyecekAlanlar(String? value) =>
      _isTrue(_yetkiModel?.malKabulAlisIrsBosGecilmeyecekAlanlar?.contains(value), skipAdmin: true);
  bool alisFatBosGecilmeyecekAlanlar(String? value) =>
      _isTrue(_yetkiModel?.malKabulAlisFatBosGecilmeyecekAlanlar?.contains(value), skipAdmin: true);

  bool satisIrsGizlenecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool satisFatGizlenecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.sevkiyatSatisFatGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool alisIrsGizlenecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.malKabulAlisIrsGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool alisFatGizlenecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.malKabulAlisFatGizlenecekAlanlar?.contains(index), skipAdmin: true);

  bool get satisFatDigerSekmesiGelsin => _isTrue(_yetkiModel?.sevkiyatSatisFatDigerSekmesiGoster);
  bool get satisIrsDigerSekmesiGelsin => _isTrue(_yetkiModel?.sevkiyatSatisIrsDigerSekmesiGoster);

  //! MAL KABUL
  String? get malKabulAlisIrsOzelKod1Degeri => _yetkiModel?.malKabulAlisIrsOzelKod1Degeri;
  String? get malKabulAlisIrsOzelKod2Degeri => _yetkiModel?.malKabulAlisIrsOzelKod2Degeri;
  bool malKabulAlisFatBelgeTipleri(int? value) =>
      _isTrue(_yetkiModel?.malKabulAlisFaturasiBelgeTipleri?.contains(value));
  bool malKabulAlisIrsBelgeTipleri(int? value) => _isTrue(_yetkiModel?.malKabulAlisIrsBelgeTipleri?.contains(value));

  bool get malKabulFiyatDegistirilmesin => _isTrue(_yetkiModel?.malKabulFiyatDegistirilmesin, skipAdmin: true);
  bool get alisIrsFiyatGor => _isTrue(_yetkiModel?.malKabulAlisIrsaliyesiFiyatGor);

  bool get alisFatEkle => _isTrue(_yetkiModel?.malKabulAlisFaturasiKaydet);
  bool get alisFatDuzenle => _isTrue(_yetkiModel?.malKabulAlisFaturasiDuzelt);
  bool get alisFatSil => _isTrue(_yetkiModel?.malKabulAlisFaturasiSil);
  bool get alisFatBirim1denKaydet => _isTrue(_yetkiModel?.malKabulAlisFatBirim1DenKaydet, skipAdmin: true);

  bool get alisIrsEkle => _isTrue(_yetkiModel?.malKabulSatinAlmaKaydet);
  bool get alisIrsDuzenle => _isTrue(_yetkiModel?.malKabulSatinAlmaDuzelt);
  bool get alisIrsSil => _isTrue(_yetkiModel?.malKabulSatinAlmaSil);
  bool get alisIrsBirim1denKaydet => _isTrue(_yetkiModel?.malKabulAlisIrsBirim1DenKaydet, skipAdmin: true);

  bool get alisFatDigerSekmesiGelsin => _isTrue(_yetkiModel?.malKabulAlisFatDigerSekmesiGoster);
  bool get alisIrsDigerSekmesiGelsin => _isTrue(_yetkiModel?.malKabulAlisFatDigerSekmesiGoster);
  // bool get satisFatEkle => _isTrue(_yetkiModel?.ekle);

  //! E-FATURA
  bool ebelgeOzelKod1AktifMi(bool satisMi) =>
      _isTrue(satisMi ? _paramModel?.satisOzelKod1Aktif : _paramModel?.alisOzelKod1Aktif, skipAdmin: true);
  bool ebelgeOzelKod2AktifMi(bool satisMi) =>
      _isTrue(satisMi ? _paramModel?.satisOzelKod2Aktif : _paramModel?.alisOzelKod2Aktif, skipAdmin: true);
  bool get ebelgeEFatura => _isTrue((_yetkiModel?.ebelgeEFat ?? false) && (_paramModel?.eFaturaAktif ?? false));
  bool get ebelgeEFaturaGelenKutusu => ebelgeEFatura && _isTrue(_yetkiModel?.ebelgeEFatGelenKutusu);
  bool get ebelgeEFaturaGidenKutusu => ebelgeEFatura && _isTrue(_yetkiModel?.ebelgeEFatSorgula);
  bool get ebelgeEFaturaGonder => ebelgeEFatura && _isTrue(_yetkiModel?.ebelgeEFatGonder);
  bool get ebelgeEFaturaSorgula => ebelgeEFatura && _isTrue(_yetkiModel?.ebelgeEFatSorgula);
  bool get ebelgeEFaturaGoruntule => ebelgeEFatura && _isTrue(_yetkiModel?.ebelgeEFatGoruntule);
  bool get ebelgeEFaturaTaslakSil => ebelgeEFatura && _isTrue(_yetkiModel?.ebelgeEFatTaslakSil);
  bool get eFaturaAktif => _isTrue(_paramModel?.eFaturaAktif, skipAdmin: true);
  bool get eFaturaSenaryoDegistir => ebelgeEFatura && _isTrue(_paramModel?.eFaturaSenaryoDegistir);
  bool eFaturaSerisindenMi(String belgeNo) => _isTrue(
    belgeNo.contains(_paramModel?.seriEFatura ?? "") ||
        (_paramModel?.arrEFatSeri?.any((element) => belgeNo.contains(element)) ?? false),
    skipAdmin: true,
  );

  bool get ebelgeEIrsaliye =>
      _isTrue((_yetkiModel?.ebelgeEIrsaliye ?? false) && (_paramModel?.eIrsaliyeAktif ?? false));
  bool get ebelgeEIrsaliyeGelenKutusu => ebelgeEIrsaliye && _isTrue(_yetkiModel?.ebelgeEIrsaliyeGelenKutusu);
  bool get ebelgeEIrsaliyeGidenKutusu => ebelgeEIrsaliye && _isTrue(_yetkiModel?.ebelgeEIrsaliyeGidenKutusu);
  bool get ebelgeEIrsaliyeGonder => ebelgeEIrsaliye && _isTrue(_yetkiModel?.ebelgeEIrsaliyeGonder);
  bool get ebelgeEIrsaliyeSorgula => ebelgeEIrsaliye && _isTrue(_yetkiModel?.ebelgeEIrsaliye);
  bool get ebelgeEIrsaliyeGoruntule => ebelgeEIrsaliye && _isTrue(_yetkiModel?.ebelgeEIrsaliyeGoruntule);
  bool get ebelgeEIrsaliyeTaslakSil => ebelgeEIrsaliye && _isTrue(_yetkiModel?.ebelgeEIrsaliyeTaslakSil);
  bool get eIrsaliyeAktif => ebelgeEIrsaliye && _isTrue(_paramModel?.eIrsaliyeAktif);
  bool eIrsaliyeSerisindenMi(String belgeNo) =>
      ebelgeEIrsaliye &&
      _isTrue(
        belgeNo.contains(_paramModel?.seriEIrsaliye ?? "") ||
            (_paramModel?.arrEIrsSeri?.any((element) => belgeNo.contains(element)) ?? false),
        skipAdmin: true,
      );

  bool get ebelgeEArsiv => _isTrue((_yetkiModel?.ebelgeEArsiv ?? false) && (_paramModel?.eArsivAktif ?? false));
  // bool get ebelgeEArsivGelenKutusu => _isTrue(_yetkiModel?.ebelgeEArsivGelenKutusu);
  bool get ebelgeEArsivGidenKutusu =>
      ebelgeEArsiv && _isTrue((_paramModel?.eIrsaliyeAktif ?? false) && (_yetkiModel?.ebelgeEArsivSorgula ?? false));
  bool get ebelgeEArsivGonder => ebelgeEArsiv && _isTrue(_yetkiModel?.ebelgeEArsivGonder);
  bool get ebelgeEArsivSorgula => ebelgeEArsiv && _isTrue(_yetkiModel?.ebelgeEArsivSorgula);
  bool get ebelgeEArsivGoruntule => ebelgeEArsiv && _isTrue(_yetkiModel?.ebelgeEArsivGoruntule);
  bool get ebelgeEArsivTaslakSil => ebelgeEArsiv && _isTrue(_yetkiModel?.ebelgeEArsivTaslakSil);
  bool get eArsivAktif => ebelgeEArsiv && _isTrue(_paramModel?.eArsivAktif);
  bool eArsivSerisindenMi(String belgeNo) =>
      ebelgeEArsiv &&
      _isTrue(
        belgeNo.contains(_paramModel?.seriEArsiv ?? "") ||
            (_paramModel?.arrEArSeri?.any((element) => belgeNo.contains(element)) ?? false),
        skipAdmin: true,
      );

  //! SAYIM
  bool get sayimEkle => _isTrue(_yetkiModel?.sayimSerbest);
  bool get sayimSil => _isTrue(_yetkiModel?.sayimSerbestSil);
  bool get sayimHemenKaydet => _isTrue(_yetkiModel?.sayimHemenKaydet);
  bool get sayimDepoFarkRaporu => _isTrue(_yetkiModel?.sayimDepoFarkRaporu);
  bool get sayimSayimRaporu => _isTrue(_yetkiModel?.sayimRaporu);
  bool sayimEkAlanlar(int? value) => _isTrue(_yetkiModel?.sayimEkAlanlar?.contains(value), skipAdmin: true);
  bool sayimGizlenecekAlanlar(String? value) =>
      _isTrue(_yetkiModel?.sayimGizlenecekAlanlar?.contains(value), skipAdmin: true);
  bool sayimDegistirilmeyecekAlanlar(String? value) =>
      _isTrue(_yetkiModel?.sayimDegismeyecekAlanlar?.contains(value), skipAdmin: true);
  int get sayimVarsayilanOlcuBirimi => _yetkiModel?.sayimVarsayilanOlcuBirimi ?? 1;

  //! TALEP TEKLİF
  String? get satisTeklifOzelKod1Degeri => _yetkiModel?.taltekStekOzelKod1Degeri;
  String? get satisTeklifOzelKod2Degeri => _yetkiModel?.taltekStekOzelKod2Degeri;
  String? get satisTalebiOzelKod1Degeri => _yetkiModel?.taltekStalOzelKod1Degeri;
  String? get satisTalebiOzelKod2Degeri => _yetkiModel?.taltekStalOzelKod2Degeri;

  String? talepTeklifEkAciklamaAdi(bool satisMi) =>
      satisMi ? _paramModel?.satisEkMaliyet2Adi : _paramModel?.alisEkMaliyet2Adi;
  int talTekSatirKademeliIskontoSayisi(String? belgeTuru) =>
      int.tryParse(
        _paramModel?.talTekParam?.firstWhereOrNull((element) => element.belgeTipi == belgeTuru)?.satirIskontoSayisi ??
            "",
      ) ??
      0;

  bool get satisTeklifiFiyatDegistirilmesin => _isTrue(_yetkiModel?.taltekStekFiyatDegistirilmesin, skipAdmin: true);
  bool get satisTalebiFiyatDegistirilmesin => _isTrue(_yetkiModel?.taltekStalFiyatDegistirilmesin, skipAdmin: true);

  bool get satisTeklifiSil => _isTrue(_yetkiModel?.taltekStekSil);
  bool get alisTalebiSil => _isTrue(_yetkiModel?.taltekAtalSil);
  bool get satisTalebiSil => _isTrue(_yetkiModel?.taltekStalSil);

  bool get satisTeklifiYazdir => _isTrue(_yetkiModel?.yazdirmaSatisTeklifi);
  bool get alisTalebiYazdir => _isTrue(_yetkiModel?.yazdirmaAtal);
  bool get satisTalebiYazdir => _isTrue(_yetkiModel?.yazdirmaSatisTalebi);

  bool get satisTeklifiDuzenle => _isTrue(_yetkiModel?.taltekStekDuzelt);
  bool get alisTalebiDuzenle => _isTrue(_yetkiModel?.taltekAtalDuzelt);
  bool get satisTalebiDuzenle => _isTrue(_yetkiModel?.taltekStalDuzelt);

  bool get satisTeklifiEkle => _isTrue(_yetkiModel?.taltekStekKaydet);
  bool get alisTalebiEkle => _isTrue(_yetkiModel?.taltekAtalKaydet);
  bool get satisTalebiEkle => _isTrue(_yetkiModel?.taltekStalKaydet);

  bool talepTeklifSatisTeklifiAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.taltekStekAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _yetkiModel?.taltekStekAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.taltekStekAciklamaAlanlari?.contains(index)) ??
            true,
  );
  bool talepTeklifAlisTalebiAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.taltekAtalAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _yetkiModel?.taltekAtalAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.taltekAtalAciklamaAlanlari?.contains(index)) ??
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

  bool get stekOnayIslemleri => _isTrue(_yetkiModel?.taltekStekOnayIslemleri ?? false);
  bool get stekKdvDahilMi {
    if (_yetkiModel?.taltekStekKdvDurumu == "D") return true;
    if (_yetkiModel?.taltekStekKdvDurumu == "H") return false;
    return !genellikleKdvHaricMi;
  }

  bool get stalOnayIslemleri => _isTrue(_yetkiModel?.taltekStalOnayIslemleri ?? false);

  bool get stalKdvDahilMi {
    if (_yetkiModel?.taltekStalKdvDurumu == "D") return true;
    if (_yetkiModel?.taltekStalKdvDurumu == "H") return false;
    return !genellikleKdvHaricMi;
  }

  bool get atalOnayIslemleri => _isTrue(_yetkiModel?.taltekAtalOnayIslemleri ?? false);

  // bool get satisTeklifiDigerSekmesiGelsin => _isTrue(_yetkiModel);

  //! Rehberden Stok Secilmesin
  bool get satisFatRehberdenStokSecilsin => _isTrue(!(_yetkiModel?.sevkiyatSatisFatStokRehberiAcilmasin ?? false));
  bool get satisIrsRehberdenStokSecilsin => _isTrue(!(_yetkiModel?.sevkiyatSatisIrsStokRehberiAcilmasin ?? false));
  bool get alisFatRehberdenStokSecilsin => _isTrue(!(_yetkiModel?.malKabulAlisFatStokRehberiAcilmasin ?? false));
  bool get alisIrsRehberdenStokSecilsin => _isTrue(!(_yetkiModel?.malKabulAlisIrsStokRehberiAcilmasin ?? false));
  bool get transferDatRehberdenStokSecilsin => _isTrue(!(_yetkiModel?.transferDatStokRehberiAcilmasin ?? false));
  bool get transferAGRehberdenStokSecilsin => _isTrue(!(_yetkiModel?.transferAgStokRehberiAcilmasin ?? false));
  bool get transferACRehberdenStokSecilsin => _isTrue(!(_yetkiModel?.transferAcStokRehberiAcilmasin ?? false));

  //! Kalem Klavye Açılmasın
  bool get satisFatKalemKlavyeAcilmasin => _isTrue(_yetkiModel?.sevkiyatSatisFatKlavyeEngelle, skipAdmin: true);
  bool get satisIrsKalemKlavyeAcilmasin => _isTrue(_yetkiModel?.sevkiyatSatisIrsKlavyeEngelle, skipAdmin: true);
  bool get alisFatKalemKlavyeAcilmasin => _isTrue(_yetkiModel?.malKabulAlisFatKlavyeEngelle, skipAdmin: true);
  bool get alisIrsKalemKlavyeAcilmasin => _isTrue(_yetkiModel?.malKabulAlisIrsKlavyeEngelle, skipAdmin: true);
  bool get transferDatKalemKlavyeAcilmasin => _isTrue(_yetkiModel?.transferDatKlavyeEngelle, skipAdmin: true);
  bool get transferAGKalemKlavyeAcilmasin => _isTrue(_yetkiModel?.transferAgKlavyeEngelle, skipAdmin: true);
  bool get transferACKalemKlavyeAcilmasin => _isTrue(_yetkiModel?.transferAcKlavyeEngelle, skipAdmin: true);

  //! Barkodlu Giriş
  bool get satisFatBarkodUrunGirisi => _isTrue(_yetkiModel?.sevkiyatSatisFatBarkodluGiris);
  bool get satisIrsBarkodUrunGirisi => _isTrue(_yetkiModel?.sevkiyatSatisIrsBarkodluGiris);
  bool get alisFatBarkodUrunGirisi => _isTrue(_yetkiModel?.malKabulAlisFatBarkodluGiris);
  bool get alisIrsBarkodUrunGirisi => _isTrue(_yetkiModel?.malKabulAlisIrsBarkodluGiris);
  bool get transferDatBarkodUrunGirisi => _isTrue(_yetkiModel?.transferDatBarkodluGiris);
  bool get transferAGBarkodUrunGirisi => _isTrue(_yetkiModel?.transferAgBarkodluGiris);
  bool get transferACBarkodUrunGirisi => _isTrue(_yetkiModel?.transferAcBarkodluGiris);

  //! Okutulan Ürün Otomatik Eklensin
  bool get satisFatBarkodUrunOtomatikEkle =>
      _isTrue(_yetkiModel?.sevkiyatSatisFaturasiKalemDetaySorulmasin, skipAdmin: true);
  bool get satisIrsBarkodUrunOtomatikEkle =>
      _isTrue(_yetkiModel?.sevkiyatSatisIrsKalemDetaySorulmasin, skipAdmin: true);
  bool get alisFatBarkodUrunOtomatikEkle => _isTrue(_yetkiModel?.malKabulAlisFatKalemDetaySorulmasin, skipAdmin: true);
  bool get alisIrsBarkodUrunOtomatikEkle => _isTrue(_yetkiModel?.malKabulAlisIrsKalemDetaySorulmasin, skipAdmin: true);
  bool get transferDatBarkodUrunOtomatikEkle => _isTrue(_yetkiModel?.transferDatKalemDetaySorulmasin, skipAdmin: true);
  bool get transferAGBarkodUrunOtomatikEkle => _isTrue(_yetkiModel?.transferAgKalemDetaySorulmasin, skipAdmin: true);
  bool get transferACBarkodUrunOtomatikEkle => _isTrue(_yetkiModel?.transferAcKalemDetaySorulmasin, skipAdmin: true);

  //! Kalem Düzeltilsin
  bool get satisFatKalemDuzeltilsin => _isTrue(!(_yetkiModel?.sevkiyatSatisFatKalemDuzeltilemesin ?? false));
  bool get satisIrsKalemDuzeltilsin => _isTrue(!(_yetkiModel?.sevkiyatSatisIrsKalemDuzeltilemesin ?? false));
  bool get alisFatKalemDuzeltilsin => _isTrue(!(_yetkiModel?.malKabulAlisFatKalemDuzeltilemesin ?? false));
  bool get alisIrsKalemDuzeltilsin => _isTrue(!(_yetkiModel?.malKabulAlisIrsKalemDuzeltilemesin ?? false));
  bool get transferDatKalemDuzeltilsin => _isTrue(!(_yetkiModel?.transferDatKalemDuzeltilemesin ?? false));
  bool get transferAGKalemDuzeltilsin => _isTrue(!(_yetkiModel?.transferAgKalemDuzeltilemesin ?? false));
  bool get transferACKalemDuzeltilsin => _isTrue(!(_yetkiModel?.transferAcKalemDuzeltilemesin ?? false));

  //! Barkod2 Sor
  bool get transferDATBarkod2Sor => _isTrue(_yetkiModel?.transferDatBarkod2Sor);

  //! FATURA
  String? get satisFaturaOzelKod1Degeri => _yetkiModel?.sevkiyatSatisFatOzelKod1Degeri;
  String? get satisFaturaOzelKod2Degeri => _yetkiModel?.sevkiyatSatisFatOzelKod2Degeri;
  String? get satisIrsaliyeOzelKod1Degeri => _yetkiModel?.sevkiyatSatisIrsOzelKod1Degeri;
  String? get satisIrsaliyeOzelKod2Degeri => _yetkiModel?.sevkiyatSatisIrsOzelKod2Degeri;
  bool get alistaSiparisKullan => _isTrue(_paramModel?.alistaSiparisKullan, skipAdmin: true);
  bool get satistaSiparisKullan => _isTrue(_paramModel?.satistaSiparisKullan, skipAdmin: true);

  bool get sevkiyatFiyatDegistirilmesin => _isTrue(_yetkiModel?.sevkiyatFiyatDegistirilmesin, skipAdmin: true);

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
    EditTipiEnum.satici => true,
    EditTipiEnum.depoTransferi || EditTipiEnum.olcumdenDepoTransferi => transferDatAciklamaAlanlari(index),
    _ => false,
  };

  bool get alisFaturaSiparisBaglantisi => _isTrue(
    _yetkiModel?.malKabulAlisFaturasiSipBagSecenegi == "E" || _yetkiModel?.malKabulAlisFaturasiSipBagSecenegi == "O",
  );
  bool get satisFaturaSiparisBaglantisi => _isTrue(
    _yetkiModel?.sevkiyatSatisFaturasiSipBagSecenegi == "E" || _yetkiModel?.sevkiyatSatisFaturasiSipBagSecenegi == "O",
  );
  bool get alisIrsaliyesiSiparisBaglantisi =>
      _isTrue(_yetkiModel?.malKabulAlisIrsSipBagSecenegi == "E" || _yetkiModel?.malKabulAlisIrsSipBagSecenegi == "O");
  bool get satisIrsaliyesiSiparisBaglantisi => _isTrue(
    _yetkiModel?.sevkiyatSatisIrsaliyesiSipBagSecenegi == "E" ||
        _yetkiModel?.sevkiyatSatisIrsaliyesiSipBagSecenegi == "O",
  );

  bool get alisFaturasiFaturaSiparisBaglantisiOpsiyonelMi =>
      _isTrue(_yetkiModel?.malKabulAlisFaturasiSipBagSecenegi == "O");
  bool get satisFaturasiFaturaSiparisBaglantisiOpsiyonelMi =>
      _isTrue(_yetkiModel?.sevkiyatSatisFaturasiSipBagSecenegi == "O");
  bool get alisIrsaliyesiFaturaSiparisBaglantisiOpsiyonelMi =>
      _isTrue(_yetkiModel?.malKabulAlisIrsSipBagSecenegi == "O");
  bool get satisIrsaliyesiFaturaSiparisBaglantisiOpsiyonelMi =>
      _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiSipBagSecenegi == "O");

  // Sipariş Bağlantısı çoklu seçim
  bool get alisFaturasiFaturaSiparisBaglantisiCokluSecim => _isTrue(_yetkiModel?.malKabulAlisFatSipBagCokluSecim);
  bool get satisFaturasiFaturaSiparisBaglantisiCokluSecim => _isTrue(_yetkiModel?.sevkiyatSatisFatSipBagCokluSecim);
  bool get alisIrsaliyesiFaturaSiparisBaglantisiCokluSecim => _isTrue(_yetkiModel?.malKabulAlisIrsSipBagCokluSecim);
  bool get satisIrsaliyesiFaturaSiparisBaglantisiCokluSecim => _isTrue(_yetkiModel?.sevkiyatSatisIrsSipBagCokluSecim);
  bool get transferDatSiparisBaglantisiCokluSecim => _isTrue(_yetkiModel?.transferDatSipBagCokluSecim);
  bool get transferAgSiparisBaglantisiCokluSecim => _isTrue(_yetkiModel?.transferAgSipBagCokluSecim);
  bool get transferAcSiparisBaglantisiCokluSecim => _isTrue(_yetkiModel?.transferAcSipBagCokluSecim);

  bool get alisFaturasiSiparisBaglantisiTamamiSeciliGelsin =>
      _isTrue(_yetkiModel?.malKabulAlisFatSipBagTumKalemlerSecilsin);
  bool get satisFaturasiSiparisBaglantisiTamamiSeciliGelsin =>
      _isTrue(_yetkiModel?.sevkiyatSatisFatSipBagTumKalemlerSecilsin);
  bool get alisIrsaliyesiSiparisBaglantisiTamamiSeciliGelsin =>
      _isTrue(_yetkiModel?.malKabulAlisIrsSipBagTumKalemlerSecilsin);
  bool get satisIrsaliyesiSiparisBaglantisiTamamiSeciliGelsin =>
      _isTrue(_yetkiModel?.sevkiyatSatisIrsSipBagTumKalemlerSecilsin);
  bool get transferDatSiparisBaglantisiTamamiSeciliGelsin => _isTrue(_yetkiModel?.transferDatSipBagTumKalemlerSecilsin);
  bool get transferAgSiparisBaglantisiTamamiSeciliGelsin => _isTrue(_yetkiModel?.transferAgSipBagTumKalemlerSecilsin);
  bool get transferAcSiparisBaglantisiTamamiSeciliGelsin => _isTrue(_yetkiModel?.transferAcSipBagTumKalemlerSecilsin);

  bool alisFaturaAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.malKabulAlisFatAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _yetkiModel?.malKabulAlisFatAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.malKabulAlisFatAciklamaAlanlari?.contains(index)) ??
            false,
  );
  bool alisIrsaliyeAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.malKabulAlisIrsAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _yetkiModel?.malKabulAlisIrsAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.malKabulAlisIrsAciklamaAlanlari?.contains(index)) ??
            false,
  );
  bool satisFaturaAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.sevkiyatSatisFatAciklamaAlanlari.ext.isNullOrEmpty ?? false
        ? false
        : (index < 1
                ? _yetkiModel?.sevkiyatSatisFatAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.sevkiyatSatisFatAciklamaAlanlari?.contains(index)) ??
            false,
  );
  bool satisIrsaliyeAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.sevkiyatSatisIrsaliyesiAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _yetkiModel?.sevkiyatSatisIrsaliyesiAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.sevkiyatSatisIrsaliyesiAciklamaAlanlari?.contains(index)) ??
            false,
  );

  bool get sevkiyatSatisFaturaAciklamaDuzenle => _isTrue(_yetkiModel?.sevkiyatSatisFatAciklamaDuzenle);
  bool get sevkiyatSatisIrsaliyesiAciklamaDuzenle => _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesiAciklamaDuzenle);
  bool get malKabulAlisFaturaAciklamaDuzenle => _isTrue(_yetkiModel?.malKabulAlisFatAciklamaDuzenle);
  bool get malKabulAlisIrsaliyesiAciklamaDuzenle => _isTrue(_yetkiModel?.malKabulAlisIrsAciklamaDuzenle);

  //! TRANSFER

  String? get transferAcVarsayilanCikisYeri => _yetkiModel?.transferAcVarsayilanCikisYeri;
  String? get transferACOzelKod1Degeri => _yetkiModel?.transferAcOzelKod1Degeri;
  String? get transferACOzelKod2Degeri => _yetkiModel?.transferAcOzelKod2Degeri;
  bool get transferIsEmriSorulsun => _isTrue(_paramModel?.satisSatirdaIsEmriSorulsun, skipAdmin: true);

  //* Görüntüle
  bool get transferDatGoruntule => _isTrue(_yetkiModel?.transferDat);
  bool get transferAGGoruntule => _isTrue(_yetkiModel?.transferAg);
  bool get transferACGoruntule => _isTrue(_yetkiModel?.transferAc);

  //* Ekle
  bool get transferDatEkle => _isTrue(_yetkiModel?.transferDatKaydet);
  bool get transferAGEkle => _isTrue(_yetkiModel?.transferAgKaydet);
  bool get transferACEkle => _isTrue(_yetkiModel?.transferAcKaydet);

  //* Düzenle
  bool get transferDatDuzenle => _isTrue(_yetkiModel?.transferDatDuzelt);
  bool get transferAGDuzenle => _isTrue(_yetkiModel?.transferAgDuzelt);
  bool get transferACDuzenle => _isTrue(_yetkiModel?.transferAcDuzelt);

  //* Sil
  bool get transferDatSil => _isTrue(_yetkiModel?.transferDatSil);
  bool get transferAGSil => _isTrue(_yetkiModel?.transferAgSil);
  bool get transferACSil => _isTrue(_yetkiModel?.transferAcSil);
  bool get transferMalTalebiSil => _isTrue(_yetkiModel?.transferDepoTalebi);

  //* Birim1den Kaydet
  bool get transferDatBirim1Kaydet => _isTrue(_yetkiModel?.transferDatBirim1DenKaydet, skipAdmin: true);
  bool get transferAGBirim1Kaydet => _isTrue(_yetkiModel?.transferAgBirim1DenKaydet, skipAdmin: true);
  bool get transferACBirim1Kaydet => _isTrue(_yetkiModel?.transferAcBirim1DenKaydet, skipAdmin: true);

  //* Fiyat Gör
  bool get transferDatFiyatGor => _isTrue(_yetkiModel?.transferDatFiyatGor);
  bool get transferAGFiyatGor => _isTrue(_yetkiModel?.transferAgFiyatGor);
  bool get transferACFiyatGor => _isTrue(_yetkiModel?.transferAcFiyatGor);

  bool get transferEkMaliyet1GizlenecekMi =>
      transferLokalDatGizlenecekAlanlar(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet1);
  bool get transferEkMaliyet2GizlenecekMi =>
      transferLokalDatGizlenecekAlanlar(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet2);
  bool get transferEkMaliyet3GizlenecekMi =>
      transferLokalDatGizlenecekAlanlar(ProfilResponseModel.faturaGizlenecekAlanEkMaliyet3);

  bool get transferDepoMalToplamaFazlaTeslimatYapabilir =>
      _isTrue(_yetkiModel?.transferDepoTalebiMalTopFazlaTeslimat == "E");

  bool transferDatAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.transferDatAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _yetkiModel?.transferDatAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.transferDatAciklamaAlanlari?.contains(index)) ??
            false,
  );

  bool transferAGAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.transferAgAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _yetkiModel?.transferAgAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.transferAgAciklamaAlanlari?.contains(index)) ??
            false,
  );

  bool transferACAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.transferAcAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _yetkiModel?.transferAcAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.transferAcAciklamaAlanlari?.contains(index)) ??
            false,
  );

  //* lokal DAT

  bool get transferDatDigerSekmesiGoster => _isTrue(_yetkiModel?.transferDatDigerSekmesiGoster);

  //TODO Sayfaya parametreleri ekle
  bool transferLokalDatDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.transferDatDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalDatBosGecilmeyecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.transferDatBosGecilmeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalDatGizlenecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.transferDatGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool get transferDatAciklamaDuzenle => _isTrue(_yetkiModel?.transferDatAciklamaDuzenle);

  String? get transferLokalDatHareketTuru => _yetkiModel?.transferDatVarsayilanHarTuru;
  bool get transferLokalDatHarTuruDegismesin =>
      _isTrue(_yetkiModel?.transferDatVarsayilanHarTuruDegistiremesin, skipAdmin: true);

  bool get transferLokalDatSiparisBaglantisi => _isTrue(
    _paramModel?.satisDatSiparisTakibi == "E" && _yetkiModel?.transferDatSipBagSecenegi != "H",
    skipAdmin: true,
  );
  bool get transferLokalDatSiparisBaglantisiOpsiyonelMi => _isTrue(_yetkiModel?.transferDatSipBagSecenegi == "O");

  DepoList? get transferLokalDatCikisDepo =>
      _paramModel?.depoList
          ?.where((element) => element.depoKodu == _yetkiModel?.transferDatVarsayilanCikisDepo)
          .firstOrNull;
  DepoList? get transferLokalDatGirisDepo =>
      _paramModel?.depoList
          ?.where((element) => element.depoKodu == _yetkiModel?.transferDatVarsayilanGirisDepo)
          .firstOrNull;

  bool get transferDatLokalDATSeciliGelmesin =>
      _isTrue(_yetkiModel?.transferDatLokalDatSeciliGelmesin, skipAdmin: true);
  bool get transferDatCarininDepoGetir => _isTrue(_yetkiModel?.transferDatDepoCaridenGelsin, skipAdmin: true);
  bool get transferDatEIrsaliyeIsaretleyemesin => _isTrue(_yetkiModel?.transferDatEIrsIsaretleyemesin);
  bool get transferDatOnay => _isTrue(_yetkiModel?.transferDatOnayIslemleri);
  // bool get transferDatKayittanSonraBasimYap => _isTrue(_yetkiModel?.transferkayit);

  //* Ambar Giriş Fişi

  MasrafKoduRehberiModel? get transferAgMasrafKodu =>
      _yetkiModel?.transferAgVarsayilanMasrafKodu != null
          ? MasrafKoduRehberiModel(
            masrafKodu: _yetkiModel?.transferAgVarsayilanMasrafKodu,
            masrafAdi: _yetkiModel?.transferAgVarsayilanMasrafKodu,
          )
          : null;
  bool transferLokalAgDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.transferAgDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAgBosGecilmeyecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.transferAgBosGecilmeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAgGizlenecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.transferAgGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAgAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.transferAgAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _yetkiModel?.transferAgAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.transferAgAciklamaAlanlari?.contains(index)) ??
            false,
  );
  bool get transferAgDigerSekmesiGoster => _isTrue(_yetkiModel?.transferAgDigerSekmesiGoster);
  // bool get transferAgDigerSekmesiGoster => _isTrue(_yetkiModel?.transferAg);
  bool get transferAgAciklamaDuzenle => _isTrue(_yetkiModel?.transferAgAciklamaDuzenle);

  bool get transferAgSiparisBaglantisi =>
      _isTrue(_yetkiModel?.transferAgSipBagSecenegi == "E" || _yetkiModel?.transferAgSipBagSecenegi == "O");
  bool get transferAgSiparisBaglantisiOpsiyonelMi => _isTrue(_yetkiModel?.transferAgSipBagSecenegi == "O");

  DepoList? get transferAgCikisDepo =>
      _paramModel?.depoList
          ?.where((element) => element.depoKodu == _yetkiModel?.transferDatVarsayilanCikisDepo)
          .firstOrNull;
  DepoList? get transferAgGirisDepo =>
      _paramModel?.depoList
          ?.where((element) => element.depoKodu == _yetkiModel?.transferDatVarsayilanGirisDepo)
          .firstOrNull;

  //* Ambar Çıkış Fişi

  MasrafKoduRehberiModel? get transferAcMasrafKodu =>
      _yetkiModel?.transferAcVarsayilanMasrafKodu != null
          ? MasrafKoduRehberiModel(
            masrafKodu: _yetkiModel?.transferAcVarsayilanMasrafKodu,
            masrafAdi: _yetkiModel?.transferAcVarsayilanMasrafKodu,
          )
          : null;
  bool transferLokalAcDegistirilmeyecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.transferAcDegismeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAcBosGecilmeyecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.transferAcBosGecilmeyecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAcGizlenecekAlanlar(String? index) =>
      _isTrue(_yetkiModel?.transferAcGizlenecekAlanlar?.contains(index), skipAdmin: true);
  bool transferLokalAcAciklamaAlanlari(int index) => _isTrue(
    _yetkiModel?.transferAcAciklamaAlanlari == null
        ? false
        : (index < 1
                ? _yetkiModel?.transferAcAciklamaAlanlari?.isNotEmpty
                : _yetkiModel?.transferAcAciklamaAlanlari?.contains(index)) ??
            false,
  );
  bool get transferAcDigerSekmesiGoster => _isTrue(_yetkiModel?.transferAcDigerSekmesiGoster);
  bool get transferAcAciklamaDuzenle => _isTrue(_yetkiModel?.transferAcAciklamaDuzenle);

  bool get transferAcSiparisBaglantisi =>
      _isTrue(_yetkiModel?.transferAcSipBagSecenegi == "E" || _yetkiModel?.transferAcSipBagSecenegi == "O");
  bool get transferAcSiparisBaglantisiOpsiyonelMi => _isTrue(_yetkiModel?.transferAcSipBagSecenegi == "O");

  DepoList? get transferAcVarsayilanDepo =>
      _paramModel?.depoList?.where((element) => element.depoKodu == _yetkiModel?.transferAcVarsayilanDepo).firstOrNull;

  bool get transferAcEIrsaliyeIsaretleyemesin => _isTrue(_yetkiModel?.transferAcEIrsIsaretleyemesin);

  //! Üretim

  //* Üretim Sonu Kaydı
  bool get uretimSonuKaydiEkle => _isTrue(_yetkiModel?.uretimUskKaydet);
  bool get uretimSonuKaydiDuzenle => _isTrue(_yetkiModel?.uretimUskDuzelt);
  bool get uretimSonuKaydiSil => _isTrue(_yetkiModel?.uretimUskSil);
  bool get uretimSonuKalemliYapi => _isTrue(_yetkiModel?.uretimUskKalemliYapi, skipAdmin: true);
  String? get uretimSonuDepoOnceligi => _yetkiModel?.uretimUskDepoOnceligi;

  bool uretimSonuGizlenecekAlanlar(String value) =>
      _isTrue(_yetkiModel?.uretimUskGizlenecekAlanlar?.contains(value), skipAdmin: true);
  bool uretimSonuDegismeyecekAlanlar(String value) =>
      _isTrue(_yetkiModel?.uretimUskDegismeyecekAlanlar?.contains(value), skipAdmin: true);
  bool uretimSonuBosGecilmeyecekAlanlar(String value) =>
      _isTrue(_yetkiModel?.uretimUskBosGecilmeyecekAlanlar?.contains(value), skipAdmin: true);

  //* İş Emirleri
  bool get uretimIsEmriEkle => _isTrue(_yetkiModel?.uretimIsEmriEkle);
  bool get uretimIsEmriDuzenle => _isTrue(_yetkiModel?.uretimIsEmriDuzelt);
  bool get uretimIsEmriSil => _isTrue(_yetkiModel?.uretimIsEmriSil);

  //! Yazdırma
  bool get yazdirmaStokEtiketi => _isTrue(_yetkiModel?.yazdirmaStokEtiketi);
  bool get yazdirmaMusSip => _isTrue(_yetkiModel?.yazdirmaMusSip);
  bool get yazdirmaSaticiSip => _isTrue(_yetkiModel?.yazdirmaSaticiSip);
  bool get yazdirmaAlisFat => _isTrue(_yetkiModel?.yazdirmaAlisFat);
  bool get yazdirmaSatisFat => _isTrue(_yetkiModel?.yazdirmaSatisFat);
  bool get yazdirmaAlisIrs => _isTrue(_yetkiModel?.yazdirmaAlisIrs);
  bool get yazdirmaSatisIrs => _isTrue(_yetkiModel?.yazdirmaSatisIrs);
  bool get yazdirmaSatisTeklifi => _isTrue(_yetkiModel?.yazdirmaSatisTeklifi);
  bool get yazdirmaSatisTalebi => _isTrue(_yetkiModel?.yazdirmaSatisTalebi);
  bool get yazdirmaDepoTransferi => _isTrue(_yetkiModel?.yazdirmaDat);
  bool get yazdirmaAmbarGirisi => _isTrue(_yetkiModel?.yazdirmaAmbarGiris);
  bool get yazdirmaAmbarCikisi => _isTrue(_yetkiModel?.yazdirmaAmbarCikis);
  bool get yazdirmaCariHareket => _isTrue(_yetkiModel?.yazdirmaCariHareket);
  bool get yazdirmaSayim => _isTrue(_yetkiModel?.yazdirmaSayim);
  bool get yazdirmaHucre => _isTrue(_yetkiModel?.yazdirmaHucreEtiketi);
  bool get yazdirmaPaketlemeEtiketi => _isTrue(_yetkiModel?.yazdirmaPaketlemeEtiketi);

  //! Otomatik PDF Gör
  bool get siparisMSOtomatikPDFGor => _isTrue(_yetkiModel?.siparisMusSipOtoPdfGor, skipAdmin: true);
  bool get siparisSSOtomatikPDFGor => _isTrue(_yetkiModel?.siparisSaticiSipOtoPdfGor, skipAdmin: true);
  bool get malKabulAlisIrsOtomatikPDFGor => _isTrue(_yetkiModel?.malKabulAlisIrsOtoPdfGor, skipAdmin: true);
  bool get sevkiyatSatisIrsOtomatikPDFGor => _isTrue(_yetkiModel?.sevkiyatSatisIrsOtoPdfGor, skipAdmin: true);
  bool get sevkiyatSatFatOtomatikPDFGor => _isTrue(_yetkiModel?.sevkiyatSatisFatOtoPdfGor, skipAdmin: true);
  bool get transferDatOtomatikPDFGor => _isTrue(_yetkiModel?.transferDatOtoPdfGor, skipAdmin: true);
  bool get transferAcOtomatikPDFGor => _isTrue(_yetkiModel?.transferAcOtoPdfGor, skipAdmin: true);
  bool get transferAgOtomatikPDFGor => _isTrue(_yetkiModel?.transferAgOtoPdfGor, skipAdmin: true);

  //! Kopyala
  bool get kopyalaMusSip => _isTrue(_yetkiModel?.siparisMusSipBelgeKopyala);
  bool get kopyalaAlisTalebi => _isTrue(_yetkiModel?.taltekAtalBelgeKopyala);
  bool get kopyalaAmbarGirisi => _isTrue(_yetkiModel?.transferAgBelgeKopyala);
  bool get kopyalaAmbarCikisi => _isTrue(_yetkiModel?.transferAcBelgeKopyala);

  //! Cari Kodu Değiştir
  bool get cariKoduDegistirMusSip => _isTrue(_yetkiModel?.siparisMusSipCariKoduDegistir);
  bool get cariKoduDegistirSaticiSip => _isTrue(_yetkiModel?.siparisSaticiSipCariKoduDegistir);
  bool get cariKoduDegistirAlisFat => _isTrue(_yetkiModel?.malKabulAlisFatCariKoduDegistir);
  bool get cariKoduDegistirSatisFat => _isTrue(_yetkiModel?.sevkiyatSatisFatCariKoduDegistir);
  bool get cariKoduDegistirAlisIrs => _isTrue(_yetkiModel?.malKabulAlisIrsCariKoduDegistir);
  bool get cariKoduDegistirSatisIrs => _isTrue(_yetkiModel?.sevkiyatSatisIrsCariKoduDegistir);
  bool get cariKoduDegistirSatisTeklifi => _isTrue(_yetkiModel?.taltekStekCariKoduDegistir);
  bool get cariKoduDegistirSatisTalebi => _isTrue(_yetkiModel?.taltekStalCariKoduDegistir);
  bool get cariKoduDegistirAlisTalebi => _isTrue(_yetkiModel?.taltekAtalCariKoduDegistir);

  //! Kapatma İşlemi
  bool get belgeKapatMusSip => _isTrue(_yetkiModel?.siparisMusteriSiparisiKapatmaIslemi);
  bool get belgeKapatSaticiSip => _isTrue(_yetkiModel?.siparisSaticiSiparisiKapatmaIslemi);

  //! Max Genel İskonto 1
  double? get msMaxGenelIskonto1 => _yetkiModel?.siparisMusSipMaxGenIsk1;
  double? get sfMaxGenelIskonto1 => _yetkiModel?.sevkiyatSatisFatMaxGenIsk1;
  double? get siMaxGenelIskonto1 => _yetkiModel?.sevkiyatSatisIrsMaxGenIsk1;

  //! Max Genel İskonto 2
  double? get msMaxGenelIskonto2 => _yetkiModel?.siparisMusSipMaxGenIsk2;
  double? get sfMaxGenelIskonto2 => _yetkiModel?.sevkiyatSatisFatMaxGenIsk2;
  double? get siMaxGenelIskonto2 => _yetkiModel?.sevkiyatSatisIrsMaxGenIsk2;

  //! Max Genel İskonto 3
  double? get msMaxGenelIskonto3 => _yetkiModel?.siparisMusSipMaxGenIsk3;
  double? get sfMaxGenelIskonto3 => _yetkiModel?.sevkiyatSatisFatMaxGenIsk3;
  double? get siMaxGenelIskonto3 => _yetkiModel?.sevkiyatSatisIrsMaxGenIsk3;

  //! Max Satır İskonto 1
  double? get msMaxSatirIskonto1 => _yetkiModel?.siparisMusSipMaxSatIsk1;
  double? get sfMaxSatirIskonto1 => _yetkiModel?.sevkiyatSatisFatMaxSatIsk1;
  double? get siMaxSatirIskonto1 => _yetkiModel?.sevkiyatSatisIrsMaxSatIsk1;

  //! Max Satır İskonto 2
  double? get msMaxSatirIskonto2 => _yetkiModel?.siparisMusSipMaxSatIsk2;
  double? get sfMaxSatirIskonto2 => _yetkiModel?.sevkiyatSatisFatMaxSatIsk2;
  double? get siMaxSatirIskonto2 => _yetkiModel?.sevkiyatSatisIrsMaxSatIsk2;

  //! Max Satır İskonto 3
  double? get msMaxSatirIskonto3 => _yetkiModel?.siparisMusSipMaxSatIsk3;
  double? get sfMaxSatirIskonto3 => _yetkiModel?.sevkiyatSatisFatMaxSatIsk3;
  double? get siMaxSatirIskonto3 => _yetkiModel?.sevkiyatSatisIrsMaxSatIsk3;

  //! Max Satır İskonto 4
  double? get msMaxSatirIskonto4 => _yetkiModel?.siparisMusSipMaxSatIsk4;
  double? get sfMaxSatirIskonto4 => _yetkiModel?.sevkiyatSatisFatMaxSatIsk4;
  double? get siMaxSatirIskonto4 => _yetkiModel?.sevkiyatSatisIrsMaxSatIsk4;

  //! Max Satır İskonto 5
  double? get msMaxSatirIskonto5 => _yetkiModel?.siparisMusSipMaxSatIsk5;
  double? get sfMaxSatirIskonto5 => _yetkiModel?.sevkiyatSatisFatMaxSatIsk5;
  double? get siMaxSatirIskonto5 => _yetkiModel?.sevkiyatSatisIrsMaxSatIsk5;

  //! Max Satır İskonto 6
  double? get msMaxSatirIskonto6 => _yetkiModel?.siparisMusSipMaxSatIsk6;
  double? get sfMaxSatirIskonto6 => _yetkiModel?.sevkiyatSatisFatMaxSatIsk6;
  double? get siMaxSatirIskonto6 => _yetkiModel?.sevkiyatSatisIrsMaxSatIsk6;

  //! Max İskonto Uygulaması
  bool get msMaxIskontoUygula => _isTrue(_yetkiModel?.siparisMusSipMaxIskUygulamasi);
  bool get sfMaxIskontoUygula => _isTrue(_yetkiModel?.sevkiyatSatisFatMaxIskUygulamasi);
  bool get siMaxIskontoUygula => _isTrue(_yetkiModel?.sevkiyatSatisIrsMaxIskUygulamasi);

  //! Sigma
  bool get sigmaOlcumGirisi => _isTrue(_yetkiModel?.sigmaOlcumGir);
  bool get sigmaOlcumKaydet => _isTrue(_yetkiModel?.sigmaOlcumGirKaydet);
  bool get sigmaOlcumDuzelt => _isTrue(_yetkiModel?.sigmaOlcumGirDuzelt);
  bool get sigmaOlcumGirSil => _isTrue(_yetkiModel?.sigmaOlcumGirSil);
  bool get sigmaTeknikResim => _isTrue(_yetkiModel?.sigmaTeknikResim);
  bool get sigmaKontrolPlani => _isTrue(_yetkiModel?.sigmaKontrolPlani);

  //! Hücre
  bool get hucreHareketleri => _isTrue(_yetkiModel?.hucreHareketleri);

  //! Görüntüle

  bool get siparisMSGoruntule => _isTrue(_yetkiModel?.siparisMusteriSiparisi);
  bool get siparisSSGoruntule => _isTrue(_yetkiModel?.siparisSaticiSiparisi);
  bool get satisFatGoruntule => _isTrue(_yetkiModel?.sevkiyatSatisFat);
  bool get satisIrsGoruntule => _isTrue(_yetkiModel?.sevkiyatSatisIrsaliyesi);
  bool get alisFatGoruntule => _isTrue(_yetkiModel?.malKabulAlisFaturasi);
  bool get alisIrsGoruntule => _isTrue(_yetkiModel?.malKabulSatinAlma);
  bool get satisTeklifiGoruntule => _isTrue(_yetkiModel?.taltekStek);
  bool get alisTalebiGoruntule => _isTrue(_yetkiModel?.taltekAtal);
  bool get satisTalebiGoruntule => _isTrue(_yetkiModel?.taltekStal);
  bool get cariKartiGoruntuleme => _isTrue(_yetkiModel?.cariCariKarti);
}
