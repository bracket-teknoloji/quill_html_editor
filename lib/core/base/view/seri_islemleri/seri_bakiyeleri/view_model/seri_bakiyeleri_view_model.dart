import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";

part "seri_bakiyeleri_view_model.g.dart";

class SeriBakiyeleriViewModel = _SeriBakiyeleriViewModelBase with _$SeriBakiyeleriViewModel;

abstract class _SeriBakiyeleriViewModelBase with Store, MobxNetworkMixin {
  final Map<String, String?> bakiyeDurumuMap = {
    "Bakiyeli": "B",
    "Artı": "A",
    "Eksi": "E",
    "Sıfır": "S",
    "Tümü": null,
  };
  @observable
  ObservableList<SeriList>? seriList;

  @observable
  SiparisEditRequestModel requestModel = SiparisEditRequestModel(ekranTipi: "L", filtreKodu: 2);

  @action
  void setSeriList(List<SeriList>? listOfSeri) => seriList = listOfSeri?.asObservable();

  @action
  void setStokKodu(String stokKodu) => requestModel = requestModel.copyWith(stokKodu: stokKodu, bakiyeDurumu: "B", kisitYok: null);

  @action
  void setBakiyeDurumu(String? bakiyeDurumu) => requestModel = requestModel.copyWith(bakiyeDurumu: bakiyeDurumu);

  @action
  Future<void> getData() async {
    setSeriList(null);
    final result = await networkManager.dioPost(path: ApiUrls.getSeriler, bodyModel: SeriList(), data: requestModel.toJson());
    if (result.data is List) {
      final List<SeriList> seriList = (result.data as List).map((e) => e as SeriList).toList();
      setSeriList(seriList);
    }
  }
}
