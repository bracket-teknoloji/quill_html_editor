import "package:mobx/mobx.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";
import "../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../view_model/mobx_network_mixin.dart";

part "kalem_rehberi_view_model.g.dart";

final class KalemRehberiViewModel = _KalemRehberiViewModelBase with _$KalemRehberiViewModel;

abstract class _KalemRehberiViewModelBase with Store, MobxNetworkMixin {
  final Map<String, String> _siralaMap = {
    "Stok Adı (A-Z)": "STOK_ADI_AZ",
    "Stok Adı (Z-A)": "STOK_ADI_ZA",
    "Stok Kodu (A-Z)": "STOK_KODU_AZ",
    "Stok Kodu (Z-A)": "STOK_KODU_ZA",
    "Tarih (Önce Eski)": "TARIH_AZ",
    "Tarih (Önce Yeni)": "TARIH_ZA",
    "Teslim Tarihi (Önce Eski)": "TESLIM_TARIHI_AZ",
    "Teslim Tarihi (Önce Yeni)": "TESLIM_TARIHI_ZA",
  };

  List<BottomSheetModel> get siralaList => _siralaMap.entries.map((e) => BottomSheetModel(title: e.key, value: e.value, groupValue: e.value)).toList();

  @observable
  SiparislerRequestModel? model;

  @observable
  ObservableList<KalemModel>? kalemList;

  @observable
  ObservableList<KalemModel> selectedKalemList = <KalemModel>[].asObservable();

  @action
  void setModel(BaseSiparisEditModel value) => model = SiparislerRequestModel.fromBaseSiparisEditModel(value);

  @action
  void setRequestModel(SiparislerRequestModel value) => model = value;

  @action
  void setKalemList(List<KalemModel>? value) => kalemList = value?.asObservable();

  @action
  void addSelectedKalem(KalemModel value) => selectedKalemList.add(value);

  @action
  void removeSelectedKalem(KalemModel value) => selectedKalemList.removeWhere((element) => element.belgeNo == value.belgeNo);

  @action
  void addAllSelectedKalem() => selectedKalemList = kalemList?.asObservable() ?? <KalemModel>[].asObservable();

  @action
  void removeAllSelectedKalem() => selectedKalemList.clear();

  @action
  void setSiralama(String? value) => model = model?.copyWith(siralama: value);

  @action
  Future<void> resetPage() async {
    setKalemList(null);
    await getData();
  }

  @action
  Future<void> getData() async {
    final result = await networkManager.dioGet(path: ApiUrls.getFaturaKalemleri, bodyModel: KalemModel(), queryParameters: model?.toJson());
    if (result.isSuccess) {
      setKalemList(result.dataList);
    }
  }
}
