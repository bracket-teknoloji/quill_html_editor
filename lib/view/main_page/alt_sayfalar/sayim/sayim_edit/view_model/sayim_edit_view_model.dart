import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";

part "sayim_edit_view_model.g.dart";

class SayimEditViewModel = _SayimEditViewModelBase with _$SayimEditViewModel;

abstract class _SayimEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  int tabIndex = 0;

  @observable
  SiparislerRequestModel faturaRequestModel = SiparislerRequestModel();

  @computed
  bool get indexSifirMi => tabIndex == 0;

  @action
  void setTabIndex(int value) => tabIndex = value;

  @action
  Future<GenericResponseModel<NetworkManagerMixin>> sendData(int depoKodu) async =>
      await networkManager.dioPost(path: ApiUrls.saveSayim, bodyModel: SayimListesiModel(), data: SingletonModels.sayimListesi?.filtre?.copyWith(depoKodu: depoKodu).toJson(), showLoading: true);

  @action
  Future<bool> sayimiBitir() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveSayim,
      bodyModel: SayimListesiModel(),
      data: SayimFiltreModel(belgeNo: SingletonModels.sayimListesi?.filtre?.belgeNo, islemKodu: 5),
    );
    return result.isSucces;
  }

  Future<List<KalemModel>?> getKalemler(String hedefDepo) async {
    final sayimModel = SingletonModels.sayimListesi;
    faturaRequestModel = SiparislerRequestModel(
      depoKodu: sayimModel?.depoKodu.toStringIfNotNull,
      hedefDepoKodu: hedefDepo,
      belgeNo: sayimModel?.fisno,
      ekranTipi: null,
      filtreKodu: 5,
      pickerBelgeTuru: "",
      iadeMi: false,
    );
    final result = await networkManager.dioGet(
      path: ApiUrls.getFaturalar,
      bodyModel: BaseSiparisEditModel(),
      showLoading: true,
      queryParameters: faturaRequestModel.toJson(),
    );
    if (result.isSucces) {
      return result.dataList.first.kalemList;

    }
    return null;
  }
}
