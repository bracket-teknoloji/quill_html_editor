import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/auth/model/companies.dart";
import "package:picker/view/auth/model/isletme_model.dart";

part "entry_company_view_model.g.dart";

class EntryCompanyViewModel = _EntryCompanyViewModelBase with _$EntryCompanyViewModel;

abstract class _EntryCompanyViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableMap<dynamic,dynamic> selected = {"Şirket": "", "İşletme": 0, "Şube": null}.asObservable();

  @observable
  ObservableMap<dynamic,dynamic> userData = {"Şirket": "", "İşletme": 0, "Şube": null}.asObservable();

  @observable
  List<CompanyModel>? sirketList;
  @observable
  List<IsletmeModel>? isletmeList;
  @observable
  List<IsletmeModel>? subeList;

  @action
  void setSirket(List<CompanyModel>? value) => sirketList = value;

  @action
  void setIsletme(List<IsletmeModel>? value) => isletmeList = value;

  @action
  void setSube(List<IsletmeModel>? value) => subeList = value;

  @action
  void selectedSirket(CompanyModel? value) {
    selected["Şirket"] = value?.company ?? "";
    selected["İşletme"] = null;
    selected["Şube"] = null;
    userData["Şirket"] = value?.company ?? "";
    userData["İşletme"] = null;
    userData["Şube"] = null;
    selected = selected;
    userData = userData;
  }

  @action
  void selectedIsletme(IsletmeModel? value) {
    selected["İşletme"] = value?.isletmeKodu ?? 0;
    selected["Şube"] = null;
    userData["İşletme"] = value?.isletmeAdi;
    userData["Şube"] = null;
    selected = selected;
    userData = userData;
  }

  @action
  void selectedSube(IsletmeModel? value) {
    selected["Şube"] = value?.subeKodu ?? 0;
    userData["Şube"] = value?.subeAdi;
    selected = selected;
    userData = userData;
  }

  @action
  Future<bool> getData({String? name}) async {
    final response = await networkManager.dioGet<CompanyModel>(path: ApiUrls.veriTabanlari, bodyModel: CompanyModel(), showError: true);
    if (response.success ?? false) {
      setSirket(response.data.map((e) => e as CompanyModel).toList().cast<CompanyModel>());
      return true;
    }
    return false;
  }

  @action
  Future<void> getSube() async {
    final response = await networkManager.dioGet<IsletmeModel>(
      path: ApiUrls.isletmelerSubeler,
      bodyModel: IsletmeModel(),
      queryParameters: {"Veritabani": selected["Şirket"]},
      showError: true,
    );
    if (response.success ?? false) {
      final List<IsletmeModel> isletmeModelList = response.data.map((e) => e as IsletmeModel).toList().cast<IsletmeModel>();
      // set isletmeList with unique isletmeAdi values
      final List<IsletmeModel> data = [];
      for (var element in isletmeModelList) {
        if (data.any((element) => element.isletmeKodu == element.isletmeKodu)) {
          continue;
        } else {
          data.add(element);
        }
      }
      setIsletme(data);
      setSube(isletmeModelList.map((e) => e..subeKodu ??= 0).toList().cast<IsletmeModel>());
      // for (IsletmeModel element in res) {
      //   element.subeKodu == null ? list.add(element..subeKodu = 0) : list.add(element);
      // }
      CacheManager.setSubeListesi(response.data);
    }
  }
}
