import "package:mobx/mobx.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/doviz_kurlari_model.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/model/muhasebe_referans_model.dart";
import "../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../model/param_model.dart";
import "../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "nakit_odeme_view_model.g.dart";

final class NakitOdemeViewModel = _NakitOdemeViewModelBase with _$NakitOdemeViewModel;

abstract class _NakitOdemeViewModelBase with Store, MobxNetworkMixin {
  @observable
  double? cariBakiye;

  @observable
  TahsilatRequestModel model = TahsilatRequestModel(
    tahsilatmi: true,
    yeniKayit: true,
    gc: "G",
    tag: "TahsilatModel",
    pickerBelgeTuru: "NAT",
    hesapTipi: "C",
  );

  @observable
  ObservableList<DovizKurlariModel>? dovizKurlariListesi;

  @observable
  ObservableList<MuhasebeReferansModel>? muhaRefList;

  @observable
  KasaList? kasa;

  @observable
  bool? showReferansKodu = false;

  @computed
  String get formTipi => model.tahsilatmi == true ? "Tahsilat" : "Ödeme";

  @computed
  TahsilatRequestModel get getStokYeniKayitModel {
    const uuid = Uuid();
    return model.copyWith(guid: uuid.v4());
  }

  @computed
  String? get getCariBakiye => cariBakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.oran);

  @action
  void setCariBakiye(double? value) => cariBakiye = value;

  @action
  void setShowReferansKodu(bool? value) => showReferansKodu = value;

  @action
  void setDovizKurlariListesi(List<DovizKurlariModel>? value) {
    if (value != null) {
      dovizKurlariListesi = value.asObservable();
    }
  }

  @action
  void setTahsilatmi(bool? value) =>
      model = model.copyWith(
        tahsilatmi: value,
        gc: value == true ? "G" : "C",
        pickerBelgeTuru: value == true ? "NAT" : "NAO",
      );

  @action
  void setBelgeNo(String? value) => model = model.copyWith(belgeNo: value);

  @action
  void setTarih(DateTime? value) => model = model.copyWith(tarih: value.dateTimeWithoutTime);

  @action
  void setKasa(KasaList? value) {
    kasa = value;
    model = model.copyWith(kasaKodu: value?.kasaKodu);
  }

  @action
  void setAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  void setTutar(double? value) => model = model.copyWith(tutar: value);

  @action
  void setDovizTutari(double? value) => model = model.copyWith(dovizTutari: value);

  @action
  void setProjekodu(String? value) => model = model.copyWith(projeKodu: value);

  @action
  void setPlasiyerKodu(PlasiyerList? value) => model = model.copyWith(plasiyerKodu: value?.plasiyerKodu);

  @action
  void setKasaKodu(String? value) => model = model.copyWith(kasaKodu: value);

  @action
  void setDovizTipi(int? value) => model = model.copyWith(dovizTipi: value);

  @action
  void setCariKodu(String? value) => model = model.copyWith(cariKodu: value);

  @action
  void setHesapKodu(String? value) => model = model.copyWith(hesapKodu: value);

  @action
  void setHedefAciklama(String? value) => model = model.copyWith(hedefAciklama: value);

  @action
  void setMuhaRefList(List<MuhasebeReferansModel>? value) => muhaRefList = value?.asObservable();

  @action
  void setReferansKodu(String? value) => model = model.copyWith(refKod: value);

  @action
  Future<void> getSiradakiKod() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      queryParameters: {"Seri": model.belgeNo ?? "", "BelgeTipi": "TH", "EIrsaliye": "H"},
    );
    if (result.isSuccess) {
      setBelgeNo((result.dataList.firstOrNull as BaseSiparisEditModel).belgeNo);
    }
  }

  @action
  Future<KasaList?> getKasalar(String? kasaKodu) async {
    final result = await networkManager.dioGet<KasaList>(
      path: ApiUrls.getKasalar,
      bodyModel: KasaList(),
      showLoading: true,
      queryParameters: {"KisitYok": true, "KasaKodu": kasaKodu},
    );
    if (result.isSuccess) {
      return result.dataList.firstOrNull as KasaList;
    }
    return null;
  }

  @action
  Future<void> getMuhaRefList() async {
    final result = await networkManager.dioGet<MuhasebeReferansModel>(
      path: ApiUrls.getMuhaRefList,
      bodyModel: MuhasebeReferansModel(),
      showLoading: true,
    );
    if (result.isSuccess) {
      setMuhaRefList(result.dataList);
    }
  }

  @action
  Future<void> getDovizler() async {
    final result = await networkManager.dioGet<DovizKurlariModel>(
      path: ApiUrls.getDovizKurlari,
      bodyModel: DovizKurlariModel(),
      showLoading: true,
      queryParameters: {"EkranTipi": "D", "DovizKodu": model.dovizTipi, "tarih": model.tarih.toDateString},
    );
    if (result.isSuccess) {
      setDovizKurlariListesi(result.dataList);
    }
  }

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> postData() async => await networkManager.dioPost<DovizKurlariModel>(
    path: ApiUrls.saveTahsilat,
    bodyModel: DovizKurlariModel(),
    showLoading: true,
    data: getStokYeniKayitModel.toJson(),
  );
}
