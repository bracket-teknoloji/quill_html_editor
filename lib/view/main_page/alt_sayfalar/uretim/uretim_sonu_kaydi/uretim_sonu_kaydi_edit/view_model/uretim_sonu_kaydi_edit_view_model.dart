import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/ek_alanlar_model.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/model/uretim_sonu_kaydi_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_listesi/model/uretim_sonu_kaydi_listesi_request_model.dart";
import "package:uuid/uuid.dart";

part "uretim_sonu_kaydi_edit_view_model.g.dart";

class UretimSonuKaydiEditViewModel = _UretimSonuKaydiEditViewModelBase with _$UretimSonuKaydiEditViewModel;

abstract class _UretimSonuKaydiEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  UretimSonuKaydiEditModel requestModel = UretimSonuKaydiEditModel(kalemList: [KalemModel()], ekAlanlar: EkAlanlar(), yeniKayit: true, guid: const Uuid().v4());

  @observable
  ObservableList<KalemModel>? kalemList;

  @computed
  UretimSonuKaydiListesiRequestModel get kalemlerRequestModel => UretimSonuKaydiListesiRequestModel(belgeNo: requestModel.belgeNo, ekranTipi: "D");

  @action
  void setBelgeNo(String? belgeNo) => requestModel = requestModel.copyWith(belgeNo: belgeNo);

  @action
  void setKalemList(List<KalemModel>? list) => kalemList = list?.asObservable();

  @action
  Future<void> getKalemler() async {
    final result = await networkManager.dioGet(path: ApiUrls.getUSKKalemleri, bodyModel: KalemModel(), showLoading: true, queryParameters: kalemlerRequestModel.toJson());
    if (result.isSuccess) setKalemList(result.dataList);
  }

  @action
  Future<void> getEkAlanlar() async {
    final result = await networkManager.dioGet(path: ApiUrls.getEkAlanlar, bodyModel: EkAlanlarModel(), showLoading: true, queryParameters: {"TabloAdi": "TBLSTOKURSEK"});
    if (result.isSuccess) setEkAlanlarList(result.dataList);
  }

  void setModel(KalemModel? firstOrNull) {}

  void setEkAlanlarList(List<dynamic> dataList) {}

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> saveUSK() async => networkManager.dioPost(path: ApiUrls.saveUSK, bodyModel: requestModel, showLoading: true);
}
