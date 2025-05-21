import "package:mobx/mobx.dart";

import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";

part "cari_virman_view_model.g.dart";

final class CariVirmanViewModel = _CariVirmanViewModelBase with _$CariVirmanViewModel;

abstract class _CariVirmanViewModelBase with Store, MobxNetworkMixin {
  @observable
  TahsilatRequestModel requestModel = TahsilatRequestModel(
    yeniKayit: true,
    islemModulu: "B",
    tag: "DekontModel",
    dekontIslemTuru: "DCV",
  );

  @computed
  DateTime? get vadeGunu =>
      requestModel.cariKodu == null && requestModel.vadeGunu != null
          ? null
          : DateTime.now().add(Duration(days: requestModel.vadeGunu ?? 0));

  @action
  void setTarih(DateTime? time) => requestModel = requestModel.copyWith(tarih: time);

  @action
  void setTahsilatBakiye(double? value) => requestModel = requestModel.copyWith(tahsilatBakiye: value ?? 2);

  @action
  void setOdemeBakiye(double? value) => requestModel = requestModel.copyWith(odemeBakiye: value ?? 2);

  @action
  void setSeri(String? seri) => requestModel = requestModel.copyWith(dekontSeri: seri);

  @action
  void setTahsilatCari(String? cariKodu) => requestModel = requestModel.copyWith(cariKodu: cariKodu);

  @action
  void setOdemeCari(String? cariKodu) => requestModel = requestModel.copyWith(hedefCariKodu: cariKodu);

  @action
  void setTutar(double? tutar) => requestModel = requestModel.copyWith(tutar: tutar);

  @action
  void setVadeGunu(int? vade) => requestModel = requestModel.copyWith(vadeGunu: vade);

  @action
  void setPlasiyer(String? plasiyer) => requestModel = requestModel.copyWith(plasiyerKodu: plasiyer);

  @action
  void setProjeKodu(String? proje) => requestModel = requestModel.copyWith(projeKodu: proje);

  @action
  void setAciklama(String? aciklama) => requestModel = requestModel.copyWith(aciklama: aciklama);

  @action
  void setHedefAciklama(String? aciklama) => requestModel = requestModel.copyWith(hedefAciklama: aciklama);

  @action
  Future<GenericResponseModel<TahsilatRequestModel>> sendData() async => await networkManager.dioPost(
    path: ApiUrls.saveDekont,
    bodyModel: TahsilatRequestModel(),
    showLoading: true,
    data: requestModel.toJson(),
  );
}
