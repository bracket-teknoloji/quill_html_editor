import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_tahsilati/model/save_cek_senet_model.dart";

part "cari_hesaba_cirola_view_model.g.dart";

class CariHesabaCirolaViewModel = _CariHesabaCirolaViewModelBase with _$CariHesabaCirolaViewModel;

abstract class _CariHesabaCirolaViewModelBase with Store, MobxNetworkMixin {
  @observable
  SaveCekSenetModel model = SaveCekSenetModel(islemKodu: 4, yeniKayit: true, tag: "CekSenetBordroModel", pickerTahsilatTuru: "CHC");

  @observable
  CariListesiModel? cariListesiModel;

  @action
  void setBelgeNo(String? value) => model = model.copyWith(belgeNo: value);

  @action
  void setIslemTarihi(DateTime? value) => model = model.copyWith(tarih: value.dateTimeWithoutTime);

  @action
  void setCariKodu(CariListesiModel? value) {
    model = model.copyWith(verilenKodu: value?.cariKodu);
    cariListesiModel = value;
  }

  @action
  void setProjekodu(String? value) => model = model.copyWith(projeKodu: value);

  @action
  void setPlasiyerKodu(String? value) => model = model.copyWith(plasiyerKodu: value);

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> saveData() async =>
      await networkManager.dioPost(path: ApiUrls.saveCekSenetler, showLoading: true, bodyModel: SaveCekSenetModel(), data: model.toJson());
}
