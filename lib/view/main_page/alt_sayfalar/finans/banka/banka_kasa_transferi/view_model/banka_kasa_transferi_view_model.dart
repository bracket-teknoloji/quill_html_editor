import "dart:convert";

import "package:mobx/mobx.dart";
import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/doviz_kurlari_model.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "package:picker/core/base/model/tahsilat_request_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "banka_kasa_transferi_view_model.g.dart";

class BankaKasaTransferiViewModel = _BankaKasaTransferiViewModelBase with _$BankaKasaTransferiViewModel;

abstract class _BankaKasaTransferiViewModelBase with Store, MobxNetworkMixin {
  @observable
  TahsilatRequestModel model = TahsilatRequestModel(tahsilatmi: true, yeniKayit: true, tag: "TahsilatModel", pickerBelgeTuru: "BKT", hesapTipi: "B", tarih: DateTime.now(), gc: "G");

  @observable
  bool bankaDovizliMi = false;

  @observable
  BankaListesiRequestModel bankaListesiRequestModel = BankaListesiRequestModel(belgeTipi: "BKT", ekranTipi: "R", menuKodu: "YONE_BHRE", arrHesapTipi: jsonEncode([0, 7, 14]));

  @observable
  ObservableList<DovizKurlariModel>? dovizKurlariListesi;

  @computed
  String get bankaHarAciklama => "NAKİT ${model.gc == "G" ? "YATIRILAN" : "ÇEKİLEN"} (${model.kasaKodu ?? ""})";

  @action
  void setBankaDovizliMi(bool value) => bankaDovizliMi = value;

  @action
  void setGc(String? value) => model = model.copyWith(gc: value);

  @action
  void setBelgeNo(String? value) => model = model.copyWith(belgeNo: value);

  @action
  void setTarih(DateTime? value) => model = model.copyWith(tarih: value.dateTimeWithoutTime);

  @action
  void setHesapKodu(BankaListesiModel? value) {
    model = model.copyWith(
      hesapKodu: value?.hesapKodu,
      dovizTipi: value?.dovizTipi,
    );
    setBankaDovizliMi(value?.dovizAdi != null);
  }

  @action
  void setGuid(String? value) => model = model.copyWith(guid: value);

  @action
  void setKasaKodu(String? value) => model = model.copyWith(kasaKodu: value);

  @action
  void setTutar(double? value) => model = model.copyWith(tutar: value);

  @action
  void setDovizTipi(int? value) => model = model.copyWith(dovizTipi: value);

  @action
  void setDovizTutari(double? value) => model = model.copyWith(dovizTutari: value);

  @action
  void setPlasiyerKodu(String? value) => model = model.copyWith(plasiyerKodu: value);

  @action
  void setProjeKodu(String? value) => model = model.copyWith(projeKodu: value);

  @action
  void setVadeGunu(int? value) => model = model.copyWith(vadeGunu: value);

  @action
  void setAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  void setHedefAciklama(String? value) => model = model.copyWith(hedefAciklama: value);

  @action
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) => dovizKurlariListesi = value?.asObservable();

  @action
  Future<void> getSiradakiKod() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      queryParameters: {"Seri": model.belgeNo ?? "", "BelgeTipi": "TH", "EIrsaliye": "H"},
    );
    if (result.data is List) {
      setBelgeNo((result.data.first as BaseSiparisEditModel).belgeNo);
    }
  }

  @action
  Future<void> getDovizler() async {
    if (model.dovizTipi == 0) {
      setDovizKurlariListesi(null);
      return;
    }
    final result = await networkManager.dioGet<DovizKurlariModel>(
      path: ApiUrls.getDovizKurlari,
      bodyModel: DovizKurlariModel(),
      showLoading: true,
      queryParameters: {"EkranTipi": "D", "DovizKodu": model.dovizTipi, "tarih": model.tarih.toDateString},
    );
    if (result.data is List) {
      setDovizKurlariListesi(result.data.cast<DovizKurlariModel>());
    }
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>?> saveTahsilat() async =>
      await networkManager.dioPost<BankaListesiModel>(path: ApiUrls.saveTahsilat, bodyModel: BankaListesiModel(), data: model.toJson(), showLoading: true);
}
