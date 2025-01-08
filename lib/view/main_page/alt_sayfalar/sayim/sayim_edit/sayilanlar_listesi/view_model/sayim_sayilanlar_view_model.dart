import "package:mobx/mobx.dart";

import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/constants/static_variables/singleton_models.dart";
import "../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../sayim_listesi/model/sayim_kalem_request_model.dart";
import "../../../sayim_listesi/model/sayim_listesi_model.dart";
import "../model/sayilan_kalemler_request_model.dart";

part "sayim_sayilanlar_view_model.g.dart";

final class SayimSayilanlarViewModel = _SayimSayilanlarViewModelBase with _$SayimSayilanlarViewModel;

abstract class _SayimSayilanlarViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<SayimFiltreModel>? _sayimListesi;

  @observable
  SayilanKalemlerRequestModel requestModel = SayilanKalemlerRequestModel(
    kullaniciAdi: CacheManager.getAnaVeri!.userModel!.kuladi.toString(),
    belgeNo: SingletonModels.sayimListesi?.fisno,
    filtreKodu: 3,
    depoKodu: SingletonModels.sayimListesi?.depoKodu,
  );

  @observable
  String filterText = "";

  @computed
  ObservableList<SayimFiltreModel>? get sayimListesi => _sayimListesi?.where((element) => element.stokAdi?.toLowerCase().contains(filterText.toLowerCase()) == true).toList().asObservable();

  @action
  void setSayimListesi(List<SayimFiltreModel>? value) => _sayimListesi = value?.asObservable();

  @action
  void setFilterText(String? value) => filterText = value ?? "";

  @action
  Future<bool?> deleteItem(SayimFiltreModel model) async {
    final result =
        await networkManager.dioPost(path: ApiUrls.deleteSayimKalem, bodyModel: SayimFiltreModel(), showLoading: true, queryParameters: SayimKalemRequestModel.fromSayimFiltreModel(model).toJson());
    return result.isSuccess;
  }

  @action
  Future<void> getData() async {
    setSayimListesi(null);
    final result = await networkManager.dioGet(path: ApiUrls.getSayimKalemleri, bodyModel: SayimFiltreModel(), queryParameters: requestModel.toJson());
    if (result.isSuccess) {
      setSayimListesi(result.dataList);
    }
  }

  @action
  Future<SayimFiltreModel?> getSelectedItem(int? id) async {
    final result = await networkManager.dioGet(path: ApiUrls.getSayimKalemleri, bodyModel: SayimFiltreModel(), showLoading: true, queryParameters: requestModel.copyWith(id: id).toJson());
    if (result.isSuccess) {
      return result.dataList.firstOrNull;
    }
    return null;
  }
}
