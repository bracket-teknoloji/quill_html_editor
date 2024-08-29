import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_hareketleri/model/banka_hareketleri_model.dart";

part "hizli_tahsilat_kayitlari_view_model.g.dart";

class HizliTahsilatKayitlariViewModel = _HizliTahsilatKayitlariViewModelBase with _$HizliTahsilatKayitlariViewModel;

abstract class _HizliTahsilatKayitlariViewModelBase with Store, MobxNetworkMixin, ListableMixin<BankaHareketleriModel> {
  @override
  @observable
  ObservableList<BankaHareketleriModel>? observableList;

  @override
  @action
  void setObservableList(List<BankaHareketleriModel>? list) => observableList = list?.asObservable();

  @override
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getHizliTahsilatlar, bodyModel: BankaHareketleriModel());
    if (result.isSuccess) setObservableList(result.dataList);
  }
}
