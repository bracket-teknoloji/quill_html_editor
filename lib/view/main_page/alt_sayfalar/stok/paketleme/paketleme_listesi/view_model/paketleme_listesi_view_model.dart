import "package:mobx/mobx.dart";

import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../../core/base/view_model/mobx_network_mixin.dart";
import "../../../../../../../core/base/view_model/searchable_mixin.dart";
import "../../../../../../../core/constants/enum/paket_islemler_enum.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../model/paketleme_edit_request_model.dart";
import "../model/paketleme_listesi_model.dart";
import "../model/paketleme_listesi_request_model.dart";

part "paketleme_listesi_view_model.g.dart";

final class PaketlemeListesiViewModel = _PaketlemeListesiViewModelBase with _$PaketlemeListesiViewModel;

abstract class _PaketlemeListesiViewModelBase
    with Store, MobxNetworkMixin, ListableMixin<PaketlemeListesiModel>, SearchableMixin {
  @override
  @observable
  ObservableList<PaketlemeListesiModel>? observableList;

  @override
  @observable
  String searchText = "";
  @override
  @observable
  bool isSearchBarOpen = false;

  @observable
  PaketlemeListesiRequestModel requestModel = PaketlemeListesiRequestModel(menuKodu: "STOK_PKET");

  @computed
  List<PaketlemeListesiModel>? get filteredPaketlemeListesi =>
      observableList
          ?.where((element) => element.kodu?.toLowerCase().contains(searchText.toLowerCase()) ?? false)
          .toList();

  @override
  @action
  void setObservableList(List<PaketlemeListesiModel>? value) => observableList = value?.asObservable();

  @override
  @action
  void setSearchText(String? value) => searchText = value ?? "";

  @override
  @action
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      setSearchText(null);
    }
  }

  @override
  @action
  Future<void> getData() async {
    setObservableList(null);
    final result = await networkManager.dioPost(
      path: ApiUrls.getPaketler,
      bodyModel: PaketlemeListesiModel(),
      data: requestModel.toJson(),
    );
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }

  @action
  Future<GenericResponseModel<PaketlemeListesiModel>> deleteItem(int? paketID) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.savePaket,
      bodyModel: PaketlemeListesiModel(),
      showLoading: true,
      data: PaketlemeEditRequestModel(islemKodu: PaketIslemlerEnum.paketSil.islemKodu, paketId: paketID).toJson(),
    );
    return result;
  }
}
