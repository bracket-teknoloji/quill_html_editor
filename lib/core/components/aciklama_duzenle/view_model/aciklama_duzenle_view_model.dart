import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "aciklama_duzenle_view_model.g.dart";

class AciklamaDuzenleViewModel = AciklamaDuzenleViewModelBase with _$AciklamaDuzenleViewModel;

abstract class AciklamaDuzenleViewModelBase with Store, MobxNetworkMixin {
  @observable
  BaseSiparisEditModel? editModel;

  @action
  void setAciklama1(String value) => editModel = editModel?.copyWith(acik1: value, ekAcik1: value);

  @action
  void setAciklama2(String value) => editModel = editModel?.copyWith(acik2: value, ekAcik2: value);

  @action
  void setAciklama3(String value) => editModel = editModel?.copyWith(acik3: value, ekAcik3: value);

  @action
  void setAciklama4(String value) => editModel = editModel?.copyWith(acik4: value, ekAcik4: value);

  @action
  void setAciklama5(String value) => editModel = editModel?.copyWith(acik5: value, ekAcik5: value);

  @action
  void setAciklama6(String value) => editModel = editModel?.copyWith(acik6: value, ekAcik6: value);

  @action
  void setAciklama7(String value) => editModel = editModel?.copyWith(acik7: value, ekAcik7: value);

  @action
  void setAciklama8(String value) => editModel = editModel?.copyWith(acik8: value, ekAcik8: value);

  @action
  void setAciklama9(String value) => editModel = editModel?.copyWith(acik9: value, ekAcik9: value);

  @action
  void setAciklama10(String value) => editModel = editModel?.copyWith(acik10: value, ekAcik10: value);

  @action
  void setAciklama11(String value) => editModel = editModel?.copyWith(acik11: value, ekAcik11: value);

  @action
  void setAciklama12(String value) => editModel = editModel?.copyWith(acik12: value, ekAcik12: value);

  @action
  void setAciklama13(String value) => editModel = editModel?.copyWith(acik13: value, ekAcik13: value);

  @action
  void setAciklama14(String value) => editModel = editModel?.copyWith(acik14: value, ekAcik14: value);

  @action
  void setAciklama15(String value) => editModel = editModel?.copyWith(acik15: value, ekAcik15: value);

  @action
  void setAciklama16(String value) => editModel = editModel?.copyWith(acik16: value, ekAcik16: value);

  @action
  void setTalepTeklifListesiModel(BaseSiparisEditModel value) => editModel = value;

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> postData() async =>
      await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.saveFatura, bodyModel: BaseSiparisEditModel(), data: editModel?.toJson(), showLoading: true);
}
