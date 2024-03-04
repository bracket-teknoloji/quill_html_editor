import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_grup_kodu_model.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";

part "sayim_listesi_view_model.g.dart";

class SayimListesiViewModel = _SayimListesiViewModelBase with _$SayimListesiViewModel;

abstract class _SayimListesiViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<SayimListesiModel>? sayimList;

  @observable
  ObservableList<BaseGrupKoduModel>? grupKoduList;

  @observable
  SayimFiltreModel filtreModel =  SayimFiltreModel(tipi: "2");

  @action
  void setSayimList(List<SayimListesiModel>? value) => sayimList = value?.asObservable();

  @action
  Future<void> getData() async {
    setSayimList(null);
    final result = await networkManager.dioGet(path: ApiUrls.getSayimlar, bodyModel: SayimListesiModel());
    if (result.data is List) {
      final List<SayimListesiModel> list = (result.data as List).map((e) => e as SayimListesiModel).toList();
      setSayimList(list);
    }
  }
  @action
  Future<bool> postData() async {
    final result = await networkManager.dioPost(path: ApiUrls.saveSayim, bodyModel: SayimListesiModel(), data: filtreModel.toJson(), showLoading: true);
    return result.success == true;
    
  }

  Future<void> getGrupKodlari() async {
    final result = await networkManager.getGrupKod(name: "STOK", grupNo: -1, kullanimda: true);
    if (result.ext.isNotNullOrEmpty) {
      grupKoduList = result.asObservable();
    }
  }

  List<BottomSheetModel>? bottomSheetChildren(int value) =>
      grupKoduList?.where((element) => element.grupNo == value).map((e) => BottomSheetModel(title: e.grupAdi ?? "", description: e.grupKodu, value: e, groupValue: e.grupKodu)).toList();
}
