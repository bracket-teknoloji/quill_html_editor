import "package:mobx/mobx.dart";

import "../../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../cek_senet_tahsilati/model/save_cek_senet_model.dart";

part "hesaba_cirola_view_model.g.dart";

final class HesabaCirolaViewModel = _HesabaCirolaViewModelBase with _$HesabaCirolaViewModel;

abstract class _HesabaCirolaViewModelBase with Store, MobxNetworkMixin {
  @observable
  SaveCekSenetModel model = SaveCekSenetModel(islemKodu: 4, tag: "CekSenetBordroModel", pickerTahsilatTuru: "CHC");

  @observable
  CariListesiModel? cariListesiModel;

  @action
  void setBelgeNo(String? value) => model = model.copyWith(belgeNo: value);

  @action
  void setIslemTarihi(DateTime? value) => model = model.copyWith(tarih: value.dateTimeWithoutTime);

  //? Eğer Cari Hesabına ise bu
  @action
  void setCariKodu(CariListesiModel? value) {
    model = model.copyWith(verilenKodu: value?.cariKodu);
    cariListesiModel = value;
  }

  //? Eğer Tahsil Hesabına ise bu çalışacak. Sayfada enum ile parametreye bağlandı.
  @action
  void setTahsilHesabi(String? value) => model = model.copyWith(verilenKodu: value);

  @action
  void setProjekodu(String? value) => model = model.copyWith(projeKodu: value);

  @action
  void setPlasiyerKodu(String? value) => model = model.copyWith(plasiyerKodu: value);

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> saveData() async => await networkManager.dioPost(
    path: ApiUrls.saveCekSenetler,
    showLoading: true,
    bodyModel: SaveCekSenetModel(),
    data: model.toJson(),
  );
}
