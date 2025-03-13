import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_request_model.dart";

part "ozel_hesap_kapatma_view_model.g.dart";

class OzelHesapKapatmaViewModel = _OzelHesapKapatmaViewModelBase with _$OzelHesapKapatmaViewModel;

abstract class _OzelHesapKapatmaViewModelBase with Store, MobxNetworkMixin, ListableMixin<CariHareketleriModel> {
  @override
  @observable
  ObservableList<CariHareketleriModel>? observableList;

    @observable
  CariHareketleriRequestModel cariHareketleriRequestModel = CariHareketleriRequestModel(
    ekranTipi: "D",
    siralama: "VADE_TARIHI_AZ",
    menuKodu: "CARI_OHKA",
    kapatilmis: "H",

  );

  void setCariKodu(String value) {
    cariHareketleriRequestModel.cariKodu = value;
  }

  void setBA(String value) {
    cariHareketleriRequestModel.ba = value;
  }

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getCariHareketleri, bodyModel: CariHareketleriModel(), queryParameters: cariHareketleriRequestModel.toJson());
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }

  @override
  @action
  void setObservableList(List<CariHareketleriModel>? list) => observableList = list?.asObservable();
}
