import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/view/talep_teklif_listesi_model.dart";

part "talep_teklif_listesi_view_model.g.dart";

class TalepTeklifListesiViewModel = _TalepTeklifListesiViewModelBase with _$TalepTeklifListesiViewModel;

abstract class _TalepTeklifListesiViewModelBase with Store, MobxNetworkMixin {
  @observable
  SiparislerRequestModel siparislerRequestModel = SiparislerRequestModel(sayfa: 1, faturalasmaGoster: true, ekranTipi: "L", iadeMi: false, cariKodu: "", siralama: "TARIH_ZA");

  @observable
  ObservableList<TalepTeklifListesiModel>? talepTeklifListesiModelList;

  @observable
  bool isScrolledDown = true;

  @observable
  bool dahaVarMi = true;

  @action
  void setIsScrolledDown(bool value) => isScrolledDown = value;

  @action
  void setPickerBelgeTuru(String value) => siparislerRequestModel = siparislerRequestModel.copyWith(pickerBelgeTuru: value);

  @action
  void setTalepTeklifiListesiModelList(List<TalepTeklifListesiModel> list) => talepTeklifListesiModelList = list.asObservable();

  @action
  void addTalepTeklifiListesiModelList(List<TalepTeklifListesiModel> list) => talepTeklifListesiModelList!.addAll(list);

  @action
  Future<void> resetPage() async {
    siparislerRequestModel = siparislerRequestModel.copyWith(sayfa: 1);
    talepTeklifListesiModelList = null;
    dahaVarMi = true;
    await getData();
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getFaturalar, bodyModel: TalepTeklifListesiModel(), queryParameters: siparislerRequestModel.toJson());
    if (result.data != null) {
      final List<TalepTeklifListesiModel> list = result.data.map<TalepTeklifListesiModel>((e) => e as TalepTeklifListesiModel).toList().cast<TalepTeklifListesiModel>();
      if (list.length < parametreModel.sabitSayfalamaOgeSayisi) {
        dahaVarMi = false;
      } else {
        dahaVarMi = true;
        siparislerRequestModel = siparislerRequestModel.copyWith(sayfa: (siparislerRequestModel.sayfa ?? 0) + 1);
      }
      if (talepTeklifListesiModelList == null) {
        setTalepTeklifiListesiModelList(list);
      } else {
        addTalepTeklifiListesiModelList(list);
      }
    }
  }
}
