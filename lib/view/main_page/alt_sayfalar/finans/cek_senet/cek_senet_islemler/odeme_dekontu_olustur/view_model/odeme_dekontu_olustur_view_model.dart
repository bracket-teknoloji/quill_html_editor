import "package:mobx/mobx.dart";
import "package:picker/core/init/network/login/api_urls.dart";

import "../../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";

part "odeme_dekontu_olustur_view_model.g.dart";

class OdemeDekontuOlusturViewModel = _OdemeDekontuOlusturViewModelBase with _$OdemeDekontuOlusturViewModel;

abstract class _OdemeDekontuOlusturViewModelBase with Store, MobxNetworkMixin {
  _OdemeDekontuOlusturViewModelBase({required this.model});

  @observable
  late TahsilatRequestModel model;

  @computed
  String get aciklama => "${model.belgeNo} No. Senet Ode.";

  @action
  void setTarih(DateTime? tarih) => model = model.copyWith(tarih: tarih?.dateTimeWithoutTime);

  @action
  void setSerino(String? serino) => model = model.copyWith(dekontSeri: serino);

  @action
  void setOdemeHesabi(String? odemeHesabi) => model = model.copyWith(hesapKodu: odemeHesabi);

  @action
  void setProjeKodu(String? projeKodu) => model = model.copyWith(projeKodu: projeKodu);

  @action
  void setPlasiyerKodu(String? plasiyerKodu) => model = model.copyWith(plasiyerKodu: plasiyerKodu);

  @action
  void setAciklama(String? aciklama) => model = model.copyWith(aciklama: aciklama);

  Future<GenericResponseModel<NetworkManagerMixin>> postData() async =>
      await networkManager.dioPost<TahsilatRequestModel>(path: ApiUrls.saveDekont, bodyModel: TahsilatRequestModel(), showLoading: true, data: model.toJson());
}
