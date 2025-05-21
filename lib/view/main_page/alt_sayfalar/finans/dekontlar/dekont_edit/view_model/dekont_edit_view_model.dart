import "package:mobx/mobx.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../model/dekont_listesi_model.dart";
import "../model/dekont_duzenle_request_model.dart";
import "../model/dekont_islemler_model.dart";
import "../model/dekont_islemler_request_model.dart";

part "dekont_edit_view_model.g.dart";

final class DekontEditViewModel = _DekontEditViewModelBase with _$DekontEditViewModel;

abstract class _DekontEditViewModelBase with Store, MobxNetworkMixin {
  @observable
  int selectedTab = 0;

  @observable
  int kalemSayisi = 0;

  @observable
  bool islemTamamlandi = false;

  @action
  void setIslemTamamlandi(bool value) => islemTamamlandi = value;

  @action
  void setSelectedTab(int value) => selectedTab = value;

  @action
  void setKalemSayisi(int value) => kalemSayisi = value;

  @action
  Future<GenericResponseModel<DekontIslemlerModel>> postData() async {
    SingletonDekontIslemlerRequestModel.instance.guid = const Uuid().v4();
    SingletonDekontIslemlerRequestModel.instance.kalemler
        ?.map((e) => e.tarih = SingletonDekontIslemlerRequestModel.instance.tarih)
        .toList();
    return await networkManager.dioPost(
      path: ApiUrls.saveDekont,
      bodyModel: DekontIslemlerModel(),
      data: SingletonDekontIslemlerRequestModel.instance.toJson(),
      showLoading: true,
    );
  }

  @action
  Future<void> getData(DekontListesiModel model) async {
    final result = await networkManager.dioGet<DekontDuzenleRequestModel>(
      path: ApiUrls.getDekontHareketleri,
      bodyModel: DekontDuzenleRequestModel(),
      queryParameters: model.queryParam,
      showLoading: true,
    );
    if (result.isSuccess) {
      final List<DekontDuzenleRequestModel> list = result.dataList;
      SingletonDekontIslemlerRequestModel.setInstance(DekontIslemlerRequestModel.fromListOfDekontDuzenleModel(list));
      setKalemSayisi(list.length);
      setIslemTamamlandi(true);
      // kalemSayisi = SingletonDekontIslemlerRequestModel.instance.kalemler?.length ?? 0;
    }
  }
}
