import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";

import "../../../../../view/add_company/model/account_model.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../view_model/mobx_network_mixin.dart";

part "oturumlar_view_model.g.dart";

class OturumlarViewModel = _OturumlarViewModelBase with _$OturumlarViewModel;

abstract class _OturumlarViewModelBase with Store, MobxNetworkMixin, ListableMixin<AccountModel>, SearchableMixin {
  @override
  @observable
  ObservableList<AccountModel>? observableList;

  @override
  @observable
  String? searchText;

  @override
  @observable
  bool isSearchBarOpen = false;

  @computed
  ObservableList<AccountModel>? get filteredList {
    if (searchText == null || searchText!.isEmpty) {
      return observableList;
    } else {
      return observableList
          ?.where(
            (element) => (element.adi?.contains(searchText ?? "") ?? false) || (element.soyadi?.contains(searchText ?? "") ?? false) || (element.kullaniciAdi?.contains(searchText ?? "") ?? false),
          )
          .toList()
          .asObservable();
    }
  }

  @override
  @action
  void changeSearchBarStatus() => isSearchBarOpen = !isSearchBarOpen;

  @override
  @action
  void setSearchText(String? value) => searchText = value;

  @override
  @action
  void setObservableList(List<AccountModel>? value) => observableList = value?.asObservable();

  @override
  @action
  Future<void> getData() async {
    observableList = null;
    final result = await networkManager.dioGet<AccountModel>(
      path: ApiUrls.getOturumlar,
      bodyModel: AccountModel(),
    );
    if (result.isSuccess) {
      final List<AccountModel> list = result.dataList;
      observableList = list.asObservable();
    }
  }

  @action
  Future<void> logout(AccountModel user) async {
    final result = await networkManager.dioPost(
      path: ApiUrls.logoutUser,
      bodyModel: AccountModel(),
      showLoading: true,
      queryParameters: {
        "BaskaKullanici": user.kullaniciAdi,
      },
      data: user.toJson(),
    );
    if (result.isSuccess) {
      dialogManager.showSuccessSnackBar("Başarılı bir şekilde oturum kapatıldı.");
    }
  }
}
