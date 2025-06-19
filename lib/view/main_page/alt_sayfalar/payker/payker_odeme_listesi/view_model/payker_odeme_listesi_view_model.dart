import "package:flutter/widgets.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/base/view_model/scroll_controllable_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/dependency_injection/di_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_listesi/model/module_info_model.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_odeme_listesi/model/payker_odeme_listesi_model.dart";

part "payker_odeme_listesi_view_model.g.dart";

class PaykerOdemeListesiViewModel = _PaykerOdemeListesiViewModelBase with _$PaykerOdemeListesiViewModel;

abstract class _PaykerOdemeListesiViewModelBase
    with Store, MobxNetworkMixin, ListableMixin<PaykerOdemeListesiModel>, SearchableMixin, ScrollControllableMixin {
  @override
  @action
  void changeSearchBarStatus() {
    isSearchBarOpen = !isSearchBarOpen;
    if (!isSearchBarOpen) {
      setSearchText(null);
    }
  }

  @override
  @observable
  bool isSearchBarOpen = false;

  @override
  @observable
  ObservableList<PaykerOdemeListesiModel>? observableList;

  @override
  @observable
  String? searchText;

  @override
  @action
  void setObservableList(List<PaykerOdemeListesiModel>? list) => observableList = list?.asObservable();

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @computed
  ObservableList<PaykerOdemeListesiModel>? get filteredList => observableList
      ?.where(
        (element) => [
          element.kartIsim,
          element.kartNo,
          element.kartIsim,
          element.enrollmentId,
        ].nonNulls.toList().any((element) => element.toLowerCase().contains(searchText?.toLowerCase() ?? "")),
      )
      .toList()
      .asObservable();

  @override
  @action
  Future<void> getData() async {
    setObservableList(null);
    final result = await networkManager.dioGet(
      path: "${ApiUrls.getPayments}/120.0004",
      bodyModel: PaykerOdemeListesiModel(),
    );
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }

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
  @observable
  bool isScrollDown = true;

  @override
  @action
  Future<void> changeScrollStatus(ScrollPosition position) async {
    super.changeScrollStatus(position);
  }
}
