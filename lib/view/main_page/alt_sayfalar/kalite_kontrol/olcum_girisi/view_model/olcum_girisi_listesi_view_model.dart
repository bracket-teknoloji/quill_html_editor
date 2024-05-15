import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/model/olcum_girisi_request_model.dart";

part "olcum_girisi_listesi_view_model.g.dart";

class OlcumGirisiViewModel = _OlcumGirisiViewModelBase with _$OlcumGirisiViewModel;

abstract class _OlcumGirisiViewModelBase with Store, MobxNetworkMixin {
  final List<EditTipiEnum> belgeTipiList = [
    EditTipiEnum.alisIrsaliye,
    EditTipiEnum.satisIrsaliye,
    EditTipiEnum.alisFatura,
    EditTipiEnum.satisFatura,
    EditTipiEnum.isEmri,
    EditTipiEnum.altIsEmri,
    EditTipiEnum.isEmriTakip,
    EditTipiEnum.uretimSonuKaydi,
  ];

  final List<String> durumList = [
    "Tümü",
    "Ölçüm Yapılanlar",
    "Ölçüm Yapılmayanlar",
  ];

  final Map<String, String> siralaMap = {
    "Tarih (Artan)": "TARIH_ASC",
    "Tarih (Azalan)": "TARIH_DESC",
    "Stok Kodu (A-Z)": "STOK_KODU_ASC",
    "Belge No (A-Z)": "BELGE_NO_ASC",
    "Belge No (Z-A)": "BELGE_NO_DESC",
    "Stok Kodu (Z-A)": "STOK_KODU_DESC",
    "Stok Adı (A-Z)": "STOK_ADI_ASC",
    "Stok Adı (Z-A)": "STOK_ADI_DESC",
  };

  @observable
  bool searchBar = false;

  @observable
  String? appBarTitle;

  @observable
  bool dahaVarMi = true;

  @observable
  OlcumGirisiRequestModel requestModel = OlcumGirisiRequestModel(durum: 0, sayfa: 1);

  // @observable
  // OlcumGirisiRequestModel

  @observable
  ObservableList<OlcumBelgeModel>? olcumList;

  @observable
  ObservableList<OlcumBelgeModel>? qrOlcumList;

  @computed
  List<OlcumBelgeModel>? get getList => olcumList?.toList();

  @action
  void setSearchBar() {
    searchBar = !searchBar;
    if (!searchBar) {
      setSearchText(null);
      resetSayfa();
    }
  }

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @action
  void setBastar(String? value) => requestModel = requestModel.copyWith(bastar: value);

  @action
  void setBittar(String? value) => requestModel = requestModel.copyWith(bittar: value);

  @action
  void setBelgeTipi(EditTipiEnum? value) {
    requestModel = requestModel.copyWith(belgeTipi: value?.rawValue);
    if (value != null) {
      CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(olcumGirisiBelgeTipi: value));
    }
  }

  @action
  void setSiralama(String? value) => requestModel = requestModel.copyWith(siralama: value);

  @action
  void setDurum(int? value) => requestModel = requestModel.copyWith(durum: value);

  @action
  void setQr(String? value) => requestModel = requestModel.copyWith(qrstring: value);

  @action
  void setOlcumList(List<OlcumBelgeModel>? list) => olcumList = list?.asObservable();

  @action
  void setQrOlcumList(List<OlcumBelgeModel>? list) => qrOlcumList = list?.asObservable();

  @action
  void addOlcumList(List<OlcumBelgeModel> list) => olcumList?.addAll(list);

  @action
  void setAppBarTitle(String? value) => appBarTitle = value;

  @action
  void increaseSayfa() => requestModel = requestModel.copyWith(sayfa: (requestModel.sayfa ?? 0) + 1);

  @action
  Future<void> resetSayfa() async {
    requestModel = requestModel.copyWith(sayfa: 1);
    setOlcumList(null);
    setDahaVarMi(true);
    await getData();
  }

  @action
  void setSearchText(String? value) => requestModel = requestModel.copyWith(searchText: value);

  @action
  Future<void> getData() async {
    // setOlcumList(null);
    final OlcumGirisiRequestModel olcumGirisiRequestModel = requestModel.qrstring != null ? OlcumGirisiRequestModel(qrstring: requestModel.qrstring, sayfa: 1) : requestModel;
    final result = await networkManager.dioGet(
      path: ApiUrls.getOlcumBelgeler,
      bodyModel: OlcumBelgeModel(),
      showLoading: requestModel.qrstring != null,
      data: olcumGirisiRequestModel.toJson(),
    );
    // if (result.success == true) {
    //   final List<OlcumBelgeModel> list = (result.data as List).map((e) => e as OlcumBelgeModel).toList();
    //   if (requestModel.sayfa == 1){
    //   setOlcumList(list);
    //   }
    //   if (list.length < parametreModel.sabitSayfalamaOgeSayisi){

    //   }
    // }
    if (result.data is List) {
      final List<OlcumBelgeModel> list = (result.data as List).map((e) => e as OlcumBelgeModel).toList();
      if (requestModel.qrstring != null) {
        setQrOlcumList(list);
        //?QR kod varsa işlem bittikten sonra sıfırlayacak.
        setQr(null);
        return;
      }
      if ((requestModel.sayfa ?? 0) < 2) {
        // paramData = result.paramData?.map((key, value) => MapEntry(key, double.tryParse((value as String).replaceAll(",", ".")) ?? value)).asObservable();
        if (olcumList.ext.isNullOrEmpty) {
          setOlcumList(list);
        } else {
          addOlcumList(list);
        }
      } else {
        addOlcumList(list);
      }
      if (list.length < parametreModel.sabitSayfalamaOgeSayisi) {
        setDahaVarMi(false);
      } else {
        setDahaVarMi(true);
        increaseSayfa();
      }
    }
  }
}
