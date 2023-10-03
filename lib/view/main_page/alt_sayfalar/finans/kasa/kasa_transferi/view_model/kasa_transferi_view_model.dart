import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_yeni_kayit/model/stok_yeni_kayit_model.dart";
import "package:picker/view/main_page/model/param_model.dart";
import "package:uuid/uuid.dart";

part "kasa_transferi_view_model.g.dart";

class KasaTransferiViewModel = _KasaTransferiViewModelBase with _$KasaTransferiViewModel;

abstract class _KasaTransferiViewModelBase with Store, MobxNetworkMixin {
  @observable
  StokYeniKayitModel model = StokYeniKayitModel(tahsilatmi: true, yeniKayit: true, tag: "TahsilatModel", pickerBelgeTuru: "KAT", hesapTipi: "T");

  @observable
  KasaList? girisKasa;

  @observable
  KasaList? cikisKasa;

  @computed
  String get aciklamaString => "Transfer ${girisKasa?.kasaTanimi ?? ""} => ${cikisKasa?.kasaTanimi ?? ""}";

  @computed
  StokYeniKayitModel get getStokYeniKayitModel {
    var uuid = const Uuid();
    return model.copyWith(guid: uuid.v4());
  }

  @action
  void setBelgeNo(String? value) => model = model.copyWith(belgeNo: value);

  @action
  void setTarih(DateTime? value) => model = model.copyWith(tarih: value);

  @action
  Future<void> setGirisKasa(KasaList value) async {
    girisKasa = value;
    if (value.dovizli == "E") {
      girisKasa = await getKasalar(value.kasaKodu);
    }
    model = model.copyWith(gc: value.dovizAdi, hesapKodu: value.kasaKodu, dovizTipi: value.dovizTipi);
  }

  @action
  Future<void> setCikisKasa(KasaList value) async {
    cikisKasa = value;
    if (value.dovizli == "E") {
      cikisKasa = await getKasalar(value.kasaKodu);
    }
    model = model.copyWith(gc: value.dovizAdi, kasaKodu: value.kasaKodu, dovizTipi: value.dovizTipi);
  }

  @action
  void setAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  void setTutar(double? value) => model = model.copyWith(tutar: value);

  @action
  void setProjekodu(String? value) => model = model.copyWith(projeKodu: value);

  @action
  void setPlasiyerKodu(PlasiyerList? value) => model = model.copyWith(plasiyerKodu: value?.plasiyerKodu);

  @action
  void setDovizTipi(int? value) => model = model.copyWith(dovizTipi: value);

  @action
  Future<void> getSiradakiKod() async {
    var result = await networkManager.dioGet<BaseSiparisEditModel>(
        path: ApiUrls.getSiradakiBelgeNo, bodyModel: BaseSiparisEditModel(), showLoading: true, queryParameters: {"Seri": model.belgeNo ?? "", "BelgeTipi": "TH", "EIrsaliye": "H"});
    if (result.data is List) {
      setBelgeNo((result.data.first as BaseSiparisEditModel).belgeNo);
    }
  }

  @action
  Future<KasaList?> getKasalar(String? kasaKodu) async {
    var result = await networkManager.dioGet<KasaList>(path: ApiUrls.getKasalar, bodyModel: KasaList(), showLoading: true, queryParameters: {"KisitYok": true, "KasaKodu": kasaKodu});
    if (result.data is List) {
      return result.data.first as KasaList;
    }
    return null;
  }
}
