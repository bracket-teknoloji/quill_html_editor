import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/dependency_injection/di_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_link_listesi/model/payker_odeme_link_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_listesi/model/module_info_model.dart";

part "payker_odeme_link_listesi_view_model.g.dart";

class PaykerOdemeLinkListesiViewModel = _PaykerOdemeLinkListesiViewModelBase with _$PaykerOdemeLinkListesiViewModel;

abstract class _PaykerOdemeLinkListesiViewModelBase
    with Store, MobxNetworkMixin, ListableMixin<PaykerOdemeLinkListesiModel>, SearchableMixin {
  @override
  Future<void> getData() async {
    setObservableList(null);
    final result = await networkManager.dioPost<PaykerOdemeLinkListesiModel>(
      path: ApiUrls.getPaymentLinks,
      bodyModel: PaykerOdemeLinkListesiModel(),
    );
    setObservableList(result.dataList);
  }

  @override
  @observable
  ObservableList<PaykerOdemeLinkListesiModel>? observableList;

  @override
  @action
  void setObservableList(List<PaykerOdemeLinkListesiModel>? list) => observableList = list?.asObservable();

  @action
  Future<ModuleInfoModel?> checkPermissions() async {
    ModuleInfoModel? moduleInfo = DIManager.isRegistered<ModuleInfoModel>() ? DIManager.read<ModuleInfoModel>() : null;
    if (moduleInfo != null) {
      return moduleInfo;
    }
    moduleInfo = await networkManager.checkPaykerPermission() ?? CacheManager.instance.getModuleInfo();
    if (moduleInfo == null) {
      return null;
    }
    if (DIManager.isRegistered<ModuleInfoModel>()) {
      DIManager.reset<ModuleInfoModel>();
    }
    DIManager.lazyRegisterer<ModuleInfoModel>(moduleInfo);
    return moduleInfo;
  }

  @override
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      setSearchText(null);
      resetList();
    }
  }

  @computed
  ObservableList<PaykerOdemeLinkListesiModel>? get filteredList {
    if (searchText == null || searchText!.isEmpty) {
      return observableList;
    }
    return observableList
        ?.where(
          (item) => [
            item.tutar?.toString(),
            item.email,
            item.guid,
            item.unvan,
          ].nonNulls.toList().any((element) => element.toLowerCase().contains(searchText!.toLowerCase())),
        )
        .toList()
        .asObservable();
  }

  @override
  @observable
  bool isSearchBarOpen = false;

  @override
  @observable
  String? searchText = "";

  @override
  @action
  Future<void> resetList() async {
    super.resetList();
    await getData();
  }


  @action
  Future<bool> deleteLink(String id) async {
    final response = await networkManager.deletePaykerPaymentLink([id]);
    return response.isSuccess;
  }

  @override
  @action
  void setSearchText(String? value) => searchText = value;
}
