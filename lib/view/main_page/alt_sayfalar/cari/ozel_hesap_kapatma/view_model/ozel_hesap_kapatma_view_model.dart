import "package:mobx/mobx.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/ozel_hesap_kapatma/model/ozel_hesap_kapatma_save_model.dart";

part "ozel_hesap_kapatma_view_model.g.dart";

class OzelHesapKapatmaViewModel = _OzelHesapKapatmaViewModelBase with _$OzelHesapKapatmaViewModel;

abstract class _OzelHesapKapatmaViewModelBase with Store, MobxNetworkMixin, ListableMixin<CariHareketleriModel> {
  @override
  @observable
  ObservableList<CariHareketleriModel>? observableList;

  @observable
  ObservableList<CariHareketleriModel> selectedList = ObservableList<CariHareketleriModel>();

  @observable
  CariHareketleriRequestModel cariHareketleriRequestModel = CariHareketleriRequestModel(
    ekranTipi: "D",
    siralama: "VADE_TARIHI_AZ",
    menuKodu: "CARI_OHKA",
    kapatilmis: "H",
  );

  @observable
  OzelHesapKapatmaSaveModel ozelHesapKapatmaSaveModel = OzelHesapKapatmaSaveModel();

  void setCari(CariListesiModel value) {
    cariHareketleriRequestModel.cariKodu = value.cariKodu;
    ozelHesapKapatmaSaveModel = ozelHesapKapatmaSaveModel.copyWith(
      cariKodu: value.cariKodu,
      kaynakInckeyno: value.ozelKapatmaIncKey,
    );
  }

  void setBA(String value) {
    cariHareketleriRequestModel.ba = value;
  }

  bool isSelected(CariHareketleriModel model) => selectedList.map((e) => e.inckeyno).contains(model.inckeyno);

  @action
  void checkSelectedList(bool value, CariHareketleriModel model) {
    if (value) {
      selectedList.add(model);
    } else {
      selectedList.remove(model);
    }
    ozelHesapKapatmaSaveModel = ozelHesapKapatmaSaveModel.copyWith(
      arrHedefInckeyno: selectedList.where((element) => element.inckeyno != null).map((e) => e.inckeyno!).toList(),
    );
  }

  @override
  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getCariHareketleri,
      bodyModel: CariHareketleriModel(),
      queryParameters: cariHareketleriRequestModel.toJson(),
    );
    if (result.isSuccess) {
      setObservableList(result.dataList);
    }
  }

  @override
  @action
  void setObservableList(List<CariHareketleriModel>? list) => observableList = list?.asObservable();

  Future<GenericResponseModel<OzelHesapKapatmaSaveModel>> postData() => networkManager.dioPost(
    path: ApiUrls.saveOzelHesapKapatma,
    bodyModel: OzelHesapKapatmaSaveModel(),
    showLoading: true,
    data: ozelHesapKapatmaSaveModel.toJson(),
  );
}
