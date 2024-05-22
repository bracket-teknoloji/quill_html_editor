import "package:collection/collection.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_hareketleri/model/hucre_hareketleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_hareketleri/model/hucre_hareketleri_request_model.dart";

part "hucre_hareketleri_view_model.g.dart";

class HucreHareketleriViewModel = _HucreHareketleriViewModelBase with _$HucreHareketleriViewModel;

abstract class _HucreHareketleriViewModelBase with Store, MobxNetworkMixin {
  @observable
  ObservableList<HucreHareketleriModel>? hucreHareketleriListesi;

  @observable
  HucreHareketleriRequestModel requestModel = HucreHareketleriRequestModel(ekranTipi: "L", filtreKodu: 2);

  @computed
  int get toplamGiris => hucreHareketleriListesi?.map((element) => (element.gc == "G" ? element.netMiktar : 0) ?? 0).sum ?? 0;

  @computed
  int get toplamCikis => hucreHareketleriListesi?.map((element) => (element.gc == "C" ? element.netMiktar : 0) ?? 0).sum ?? 0;

  @computed
  int get bakiye => toplamGiris - toplamCikis;

  @action
  void setStokKodu(String? value) => requestModel = requestModel.copyWith(stokKodu: value);

  @action
  void setHucreHareketleriListesi(List<HucreHareketleriModel>? value) => hucreHareketleriListesi = value?.asObservable();

  @action
  Future<void> getData() async {
    setHucreHareketleriListesi(null);
    final result = await networkManager.dioGet(path: ApiUrls.getHucreHareketleri, bodyModel: HucreHareketleriModel(), queryParameters: requestModel.toJson());
    if (result.success == true) {
      final List<HucreHareketleriModel> hucreHareketleriListesi = (result.data as List).map((e) => e as HucreHareketleriModel).toList();
      setHucreHareketleriListesi(hucreHareketleriListesi);
    }
  }
}
