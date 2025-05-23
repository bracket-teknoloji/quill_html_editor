import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";

import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/constants/enum/grup_kodu_enums.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../model/sayim_listesi_model.dart";

part "sayim_listesi_view_model.g.dart";

final class SayimListesiViewModel = _SayimListesiViewModelBase with _$SayimListesiViewModel;

abstract class _SayimListesiViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<SayimListesiModel>? sayimList;

  @observable
  ObservableList<BaseGrupKoduModel>? grupKoduList;

  @observable
  SayimFiltreModel filtreModel = SayimFiltreModel(tipi: "S", islemKodu: 2);

  @action
  void setSayimList(List<SayimListesiModel>? value) => sayimList = value?.asObservable();

  @action
  Future<void> getData() async {
    setSayimList(null);
    final result = await networkManager.dioGet(path: ApiUrls.getSayimlar, bodyModel: SayimListesiModel());
    if (result.isSuccess) {
      setSayimList(result.dataList);
    }
  }

  @action
  Future<bool> postData() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveSayim,
      bodyModel: SayimListesiModel(),
      data: filtreModel.toJson(),
      showLoading: true,
    );
    return result.isSuccess;
  }

  Future<void> getGrupKodlari() async {
    final result = await networkManager.getGrupKod(name: GrupKoduEnum.stok, grupNo: -1, kullanimda: true);
    if (result.ext.isNotNullOrEmpty) {
      grupKoduList = result.asObservable();
    }
  }

  List<BottomSheetModel<BaseGrupKoduModel>>? bottomSheetChildren<T>(int value) => grupKoduList
      ?.where((element) => element.grupNo == value)
      .map(
        (e) => BottomSheetModel<BaseGrupKoduModel>(
          title: e.grupAdi ?? "",
          description: e.grupKodu,
          value: e,
          groupValue: e.grupKodu,
        ),
      )
      .toList();
}
