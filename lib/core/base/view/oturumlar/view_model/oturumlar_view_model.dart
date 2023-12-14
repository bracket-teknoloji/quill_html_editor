import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/add_company/model/account_model.dart";

part "oturumlar_view_model.g.dart";

class OturumlarViewModel = _OturumlarViewModelBase with _$OturumlarViewModel;

abstract class _OturumlarViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<AccountModel>? accountList;

  @observable
  String? searchValue;

  @observable
  bool isSearchBarOpen = false;

  @computed
  ObservableList<AccountModel>? get filteredList {
    if (searchValue == null || searchValue!.isEmpty) {
      return accountList;
    } else {
      return accountList
          ?.where(
            (element) => (element.adi?.contains(searchValue ?? "") ?? false) || (element.soyadi?.contains(searchValue ?? "") ?? false) || (element.kullaniciAdi?.contains(searchValue ?? "") ?? false),
          )
          .toList()
          .asObservable();
    }
  }

  @action
  void setIsSearchBarOpen() => isSearchBarOpen = !isSearchBarOpen;

  @action
  void setSearchValue(String? value) => searchValue = value;

  @action
  void setAccountList(List<AccountModel>? value) => accountList = value?.asObservable();

  @action
  Future<void> getData() async {
    accountList = null;
    final result = await networkManager.dioGet<AccountModel>(
      path: ApiUrls.getOturumlar,
      bodyModel: AccountModel(),
    );
    if (result.data != null) {
      final List<AccountModel> list = result.data.map((e) => e as AccountModel).toList().cast<AccountModel>();
      accountList = list.asObservable();
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
    if (result.success == true) {
      dialogManager.showSuccessSnackBar("Başarılı bir şekilde oturum kapatıldı.");
    }
  }
}
