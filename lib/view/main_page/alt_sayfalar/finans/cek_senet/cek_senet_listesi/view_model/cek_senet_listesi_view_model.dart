import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_request_model.dart";

part "cek_senet_listesi_view_model.g.dart";

class CekSenetListesiViewModel = _CekSenetListesiViewModelBase with _$CekSenetListesiViewModel;

abstract class _CekSenetListesiViewModelBase with Store, MobxNetworkMixin {
  final Map<String, String> siralaMap = {
    "Vade Tarihi (Artan)": "VADE_TARIHI_AZ",
    "Vade Tarihi (Azalan)": "VADE_TARIHI_ZA",
    "Belge No (Artan)": "BELGE_NO_AZ",
    "Belge No (Azalan)": "BELGE_NO_ZA",
  };

  final Map<String, String?> yeriMap = {
    "Portföy": "P",
    "Ciro": "C",
    "Tahsilat": "T",
    "Teminat": "E",
    "İade": "I",
    "Tümü": null,
  };

  final Map<String, String?> durumuMap = {
    "Beklemede": "B",
    "Ödendi": "O",
    "Karşılıksız": "P",
    "Tümü": null,
  };

  final Map<String, String?> donemTipiMap = {
    "Tümü": null,
    "Bugüne Kadar": "BUK",
    "Bugün": "BUGUN",
    "Bu Haftaya Kadar": "BHK",
    "Bu Hafta": "BU_HAFTA",
    "Bu Aya Kadar": "BAK",
    "Bu Ay": "BU_AY",
    "Gelecek Hafta": "GELECEK_HAFTA",
    "Gelecek Ay": "GELECEK_AY",
    "Gelecek 3 Ay": "GELECEK_3_AY",
  };

  @observable
  bool searchBar = false;

  @observable
  bool isScrollDown = true;

  @observable
  ObservableList<CekSenetListesiModel>? cekSenetListesiListesi;

  @observable
  CekSenetListesiRequestModel cekSenetListesiRequestModel = CekSenetListesiRequestModel(ekranTipi: "L", sirala: "VADE_TARIHI_AZ", durum: "B", yer: "P");

  @computed
  double get toplamTutar => cekSenetListesiListesi?.fold(0, (previousValue, element) => (previousValue ?? 0) + (element.tutar ?? 0)) ?? 0;

  @action
  void setSearchBar() => searchBar = !searchBar;

  @action
  void setIsScrolledDown(bool value) => isScrollDown = value;

  @action
  void setSearchText(String? value) => cekSenetListesiRequestModel = cekSenetListesiRequestModel.copyWith(searchText: value);

  @action
  void setYeri(String? value) {
    cekSenetListesiRequestModel = cekSenetListesiRequestModel.copyWith(yer: value);
    if (value != "C" && value != "T" || value != "E") {
      setVerilenCari(null);
    }
  }

  @action
  void setVerenCari(String? value) => cekSenetListesiRequestModel = cekSenetListesiRequestModel.copyWith(verenKodu: value);

  @action
  void setVerilenCari(String? value) => cekSenetListesiRequestModel = cekSenetListesiRequestModel.copyWith(verilenKodu: value);

  @action
  void setBanka(String? value) => cekSenetListesiRequestModel = cekSenetListesiRequestModel.copyWith(verilenKodu: value);

  @action
  void setVadeTarihi(String? value) => cekSenetListesiRequestModel = cekSenetListesiRequestModel.copyWith(donemTipi: value);

  @action
  void setDurumu(String? value) => cekSenetListesiRequestModel = cekSenetListesiRequestModel.copyWith(durum: value);

  @action
  void setSirala(String value) => cekSenetListesiRequestModel = cekSenetListesiRequestModel.copyWith(sirala: value);

  @action
  void setBelgeTipi(String value) => cekSenetListesiRequestModel = cekSenetListesiRequestModel.copyWith(tipi: value);

  @action
  void setCekSenetListesiListesi(List<CekSenetListesiModel>? value) => cekSenetListesiListesi = value?.asObservable();

  @action
  Future<void> getData() async {
    setCekSenetListesiListesi(null);
    final result = await networkManager.dioGet<CekSenetListesiModel>(path: ApiUrls.getCekSenetler, bodyModel: CekSenetListesiModel(), queryParameters: cekSenetListesiRequestModel.toJson());
    if (result.success ?? false) {
      setCekSenetListesiListesi(result.data.map((e) => e as CekSenetListesiModel).toList().cast<CekSenetListesiModel>());
    }
    setIsScrolledDown(false);
  }
}
