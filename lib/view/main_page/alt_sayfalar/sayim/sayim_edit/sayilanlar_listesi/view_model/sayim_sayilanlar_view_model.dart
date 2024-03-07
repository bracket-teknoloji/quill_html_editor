import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/sayilanlar_listesi/model/sayilan_kalemler_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";

part "sayim_sayilanlar_view_model.g.dart";

class SayimSayilanlarViewModel = _SayimSayilanlarViewModelBase with _$SayimSayilanlarViewModel;

abstract class _SayimSayilanlarViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<SayimListesiModel>? _sayimListesi;

  @observable
  SayilanKalemlerRequestModel requestModel = SayilanKalemlerRequestModel(
    kullaniciAdi: CacheManager.getAnaVeri!.userModel!.kuladi.toString(),
    belgeNo: SingletonModels.sayimListesi?.fisno,
    filtreKodu: SingletonModels.sayimListesi?.filtre?.tipi,
    depoKodu: SingletonModels.sayimListesi?.depoKodu,
  );

  @observable
  String filterText = "";

  @computed
  ObservableList<SayimListesiModel>? get sayimListesi => _sayimListesi?.where((element) => element.stokAdi?.toLowerCase().contains(filterText.toLowerCase()) == true).toList().asObservable();

  @action
  void setSayimListesi(List<SayimListesiModel>? value) => _sayimListesi = value?.asObservable();

  @action
  void setFilterText(String? value) => filterText = value ?? "";

  @action
  Future<void> getData() async {
    setSayimListesi(null);
    final result = await networkManager.dioGet(path: ApiUrls.getSayimKalemleri, bodyModel: SayimListesiModel(), queryParameters: requestModel.toJson());
    if (result.success == true) {
      final List<SayimListesiModel> data = (result.data as List).map((e) => e as SayimListesiModel).toList();
      setSayimListesi(data);
    }
  }
}
