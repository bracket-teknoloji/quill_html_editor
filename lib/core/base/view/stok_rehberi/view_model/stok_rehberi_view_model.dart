import "package:mobx/mobx.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_bottom_sheet_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../model/base_grup_kodu_model.dart";

part "stok_rehberi_view_model.g.dart";

class StokRehberiViewModel = _StokRehberiViewModelBase with _$StokRehberiViewModel;

abstract class _StokRehberiViewModelBase with Store {
  @observable
  bool dahaVarMi = true;

  @action
  void setDahaVarMi(bool value) => dahaVarMi = value;

  @observable
  bool isScrolledDown = true;

  @action
  void changeIsScrolledDown(bool value) => isScrolledDown = value;

  @action
  void changeArrKod1(List<BaseGrupKoduModel> value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrKod1: value);

  @action
  void changeArrKod2(List<BaseGrupKoduModel> value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrKod2: value);

  @action
  void changeArrKod3(List<BaseGrupKoduModel> value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrKod3: value);

  @action
  void changeArrKod4(List<BaseGrupKoduModel> value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrKod4: value);

  @action
  void changeArrKod5(List<BaseGrupKoduModel> value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrKod5: value);

  @observable
  List<StokListesiModel>? stokListesi;

  @action
  void setStokListesi(List? value) {
    if (value == null) {
      stokListesi = null;
      return;
    }
    if (stokListesi == null) {
      stokListesi = value.map((e) => e as StokListesiModel).toList();
    } else {
      stokListesi = stokListesi! + value.map((e) => e as StokListesiModel).toList();
    }
  }

  BaseSiparisEditModel get baseSiparisEditModel => BaseSiparisEditModel.instance;

  @observable
  StokBottomSheetModel stokBottomSheetModel = StokBottomSheetModel(
    sayfa: 1,
    siralama: "AZ",
    belgeNo: BaseSiparisEditModel.instance.belgeNo,
    belgeTarihi: BaseSiparisEditModel.instance.tarih.toDateString,
    belgeTipi: BaseSiparisEditModel.instance.getEditTipiEnum?.rawValue,
    ekranTipi: "R",
    resimGoster: "E",
    faturaTipi: 2,
    okutuldu: true,
    cariKodu: BaseSiparisEditModel.instance.cariKodu,
    menuKodu: "STOK_SREH",
  );

  @action
  void increaseSayfa() => stokBottomSheetModel = stokBottomSheetModel.copyWith(sayfa: stokBottomSheetModel.sayfa! + 1);
  @action
  void resetSayfa() => stokBottomSheetModel = stokBottomSheetModel.copyWith(sayfa: 1);
  @action
  void setSiralama(String value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(siralama: value);
  @action
  void setSearchText(String value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(searchText: value);
  @action
  void setGrupKodu(List<BaseGrupKoduModel> value) => stokBottomSheetModel = stokBottomSheetModel.copyWith(arrGrupKodu: value);
  @action
  void setSelectedStokModel(String? value) {
    stokBottomSheetModel = stokBottomSheetModel.copyWith(stokKodu: value, kisitYok: value != null);
  }

  @action
  void resetPage() {
    setStokListesi(null);
    resetSayfa();
  }

  final Map<String, String> siralamaMap = {
    "Stok Adı (A-Z)": "AZ",
    "Stok Adı (Z-A)": "ZA",
    "Stok Kodu (A-Z)": "KOD_AZ",
    "Stok Kodu (Z-A)": "KOD_ZA",
    "Bakiye (Artan)": "BAKIYE_AZ",
    "Bakiye (Azalan)": "BAKIYE_ZA",
  };
}
