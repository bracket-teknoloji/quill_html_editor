import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "transfer_mal_talebi_kalemler_view_model.g.dart";

final class TransferMalTalebiKalemlerViewModel = _TransferMalTalebiKalemlerViewModelBase
    with _$TransferMalTalebiKalemlerViewModel;

abstract class _TransferMalTalebiKalemlerViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<KalemModel> kalemList = ObservableList<KalemModel>();

  @action
  void setKalemList(List<KalemModel> value) {
    kalemList = value.asObservable();
    BaseSiparisEditModel.instance.kalemler = value;
  }

  @action
  void addKalem(KalemModel value) => setKalemList([...kalemList, value]);

  @action
  Future<bool> removeKalem(KalemModel value) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveDepoTalep,
      bodyModel: KalemModel(),
      showLoading: true,
      data: {"ID": value.id, "ISLEM_KODU": 6},
    );
    if (result.isSuccess) setKalemList(kalemList.where((element) => element.id != value.id).toList());
    return result.isSuccess;
  }

  @action
  void updateKalem(KalemModel value) {
    final index = kalemList.indexWhere((element) => element.id == value.id);
    if (index != -1) {
      setKalemList(kalemList..[index] = value);
    }
  }

  @action
  Future<bool> saveKalem(KalemModel model) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveDepoTalep,
      bodyModel: KalemModel(),
      showLoading: true,
      data: model.copyWith(islemKodu: 4, talepId: BaseSiparisEditModel.instance.id).toJson(),
    );
    if (result.isSuccess) setKalemList([...kalemList, model.copyWith(id: result.paramData?["OLUSAN_ID"])]);
    return result.isSuccess;
  }
}
