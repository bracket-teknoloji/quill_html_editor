import "package:mobx/mobx.dart";
import "../../../../../../core/base/view_model/mobx_network_mixin.dart";

part "cari_listesi_view_model.g.dart";

class CariListesiViewModel = _CariListesiViewModelBase
    with _$CariListesiViewModel;

abstract class _CariListesiViewModelBase with Store, MobxNetworkMixin {
  final Map<String, String> siralaMap = {
    "Cari Adı (A-Z)": "AZ",
    "Cari Adı (Z-A)": "ZA",
    "Bakiye (0-9)": "BAKIYE_AZ",
    "Bakiye (9-0)": "BAKIYE_ZA",
    "Döviz Bakiye (0-9)": "DOVIZ_BAKIYE_AZ",
    "Döviz Bakiye (9-0)": "DOVIZ_BAKIYE_ZA",
    "Cari Kodu (A-Z)": "CARI_KODU_AZ",
    "Cari Kodu (Z-A)": "CARI_KODU_ZA",
    "Kayıt Tarihi (Artan)": "KAYITTAR_ASC",
    "Kayıt Tarihi (Azalan)": "KAYITTAR_DESC",
    "Konum (En Yakın)": "KONUM_AZ",
    "Konum (En Uzak)": "KONUM_ZA",
  };

  @observable
  bool dahaVarMi = true;
  @observable
  bool isScrolledDown = false;
  @observable
  int sayfa = 1;
  @observable
  bool searchBar = false;
  @observable
  String arama = "";
  @observable
  List? cariListesi;

  // @observable
  // CariRequestModel cariRequestModel = CariRequestModel(eFaturaGoster: true, siralama: "CARI_KODU_AZ", sayfa: 1);

  //* SAYFA
  @action
  void increaseSayfa() => sayfa++;

  @action
  void resetSayfa() => sayfa = 1;

  //* SEARCH BAR
  @action
  void changeSearchBar() => searchBar = !searchBar;

  //* ARAMA
  @action
  void changeArama(String value) => arama = value;

  //* CARİ LİSTESİ
  @action
  void changeCariListesi(List? value) {
    if (value == null) {
      cariListesi = null;
    } else {
      cariListesi = value.asObservable();
    }
  }

  @action
  void addCariListesi(List value) => cariListesi?.addAll(value);

  //* SCROLL
  @action
  void changeIsScrolledDown(bool value) => isScrolledDown = value;

  //* DAHA VAR MI
  @action
  void changeDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void changeSiralama(String value) {
    // cariRequestModel = cariRequestModel.copyWith();
  }

  @action
  Future<void> getData() async {
    // final response = await networkManager.dioGet<CariListesiModel>(path: ApiUrls.getCariler, queryParameters: queryParameters2, bodyModel: CariListesiModel());
  }
}
