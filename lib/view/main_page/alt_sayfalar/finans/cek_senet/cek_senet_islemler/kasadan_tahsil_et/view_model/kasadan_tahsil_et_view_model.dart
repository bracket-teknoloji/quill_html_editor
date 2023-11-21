import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/enum/cek_senet_listesi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_tahsilati/model/save_cek_senet_model.dart";

part "kasadan_tahsil_et_view_model.g.dart";

class KasadanTahsilEtViewModel = _KasadanTahsilEtViewModelBase with _$KasadanTahsilEtViewModel;

abstract class _KasadanTahsilEtViewModelBase with Store, MobxNetworkMixin {
  _KasadanTahsilEtViewModelBase({required this.model});

  @observable
  late SaveCekSenetModel model;

  @computed
  String get aciklama => "${model.ceksenNo ?? ""} No.lu ${model.cekSenetListesiEnum?.title ?? ""} Ödemesi";

  @action
  void setTarih(DateTime value) => model = model.copyWith(tarih: value.dateTimeWithoutTime);

  @action
  void setKasaKodu(String? value) => model = model.copyWith(kasaKodu: value);

  @action
  void setMusteriCeki(String? value) => model = model.copyWith(ceksenNo: value);

  @action
  void setPlasiyerKodu(String? value) => model = model.copyWith(plasiyerKodu: value);

  @action
  void setProjeKodu(String? value) => model = model.copyWith(projeKodu: value);

  @action
  void setReferansKodu(String? value) => model = model.copyWith(refKod: value);

  @action
  void setKasaHarAciklama(String? value) => model = model.copyWith(aciklama: value);

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> postData() async =>
      await networkManager.dioPost(path: ApiUrls.saveTahsilat, bodyModel: SaveCekSenetModel(), data: model.toJson(), showLoading: true);
}
