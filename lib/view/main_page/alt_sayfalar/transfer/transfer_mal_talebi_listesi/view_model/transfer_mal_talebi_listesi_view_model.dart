import "package:mobx/mobx.dart";
import "package:picker/app/picker_app_imports.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/constants/enum/depo_mal_toplama_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_listesi/model/transfer_mal_talebi_listesi_request_model.dart";

part "transfer_mal_talebi_listesi_view_model.g.dart";

final class TransferMalTalebiListesiViewModel = _TransferMalTalebiListesiViewModelBase
    with _$TransferMalTalebiListesiViewModel;

abstract class _TransferMalTalebiListesiViewModelBase
    with Store, MobxNetworkMixin, ListableMixin<BaseSiparisEditModel>, SearchableMixin {
  @observable
  @override
  ObservableList<BaseSiparisEditModel>? observableList;

  @observable
  TransferMalTalebiListesiRequestModel requestModel = const TransferMalTalebiListesiRequestModel(filtreler: [5]);
  @observable
  @override
  bool isSearchBarOpen = false;

  @observable
  @override
  String? searchText;

  @observable
  DepoMalToplamaEnum selectedDepoMalToplamaEnum = DepoMalToplamaEnum.tumu;

  @computed
  List<BaseSiparisEditModel>? get filteredObservableList {
    if (searchText case (null || "")) return observableList;
    return observableList?.where((element) => element.id.toStringIfNotNull?.contains(searchText!) ?? false).toList();
  }

  @action
  @override
  Future<void> getData() async {
    final result = await networkManager.dioPost(
      path: ApiUrls.getDepoTalepleri,
      bodyModel: BaseSiparisEditModel(),
      data: requestModel.toJson(),
    );
    setObservableList(result.dataList);
  }

  @action
  Future<void> setSelectedDepoMalToplamaEnum(DepoMalToplamaEnum value) async {
    selectedDepoMalToplamaEnum = value;
    requestModel = requestModel.copyWith(durum: value.durumKodu);
    super.resetList();
    await getData();
  }

  @action
  @override
  Future<void> resetList() async {
    super.resetList();
    setSearchText(null);
    await getData();
  }

  @action
  @override
  void setObservableList(List<BaseSiparisEditModel>? list) => observableList = list?.asObservable();

  @override
  void changeSearchBarStatus() => isSearchBarOpen = !isSearchBarOpen;
  @override
  void setSearchText(String? value) => searchText = value;

  Future<bool> deleteMalTalebi(int id) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveDepoTalep,
      bodyModel: BaseSiparisEditModel(),
      data: {"ID": id, "ISLEM_KODU": 3},
    );
    return result.isSuccess;
  }

  Future<bool> talebiAc(int id) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveDepoTalep,
      bodyModel: BaseSiparisEditModel(),
      data: {"ID": id, "ISLEM_KODU": 9},
    );
    return result.isSuccess;
  }

  Future<bool> talebiKapat(int id) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.saveDepoTalep,
      bodyModel: BaseSiparisEditModel(),
      data: {"ID": id, "ISLEM_KODU": 10},
    );
    return result.isSuccess;
  }
}
