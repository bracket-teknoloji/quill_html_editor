import "package:mobx/mobx.dart";

import "../../cari_listesi/model/cari_listesi_model.dart";
import "../model/cari_hareketleri_model.dart";

part "cari_hareketleri_view_model.g.dart";

class CariHareketleriViewModel = _CariHareketleriViewModelBase with _$CariHareketleriViewModel;

abstract class _CariHareketleriViewModelBase with Store {
  @observable
  CariListesiModel? cariListesiModel;
  @observable
  bool isScrollDown = true;

  @action
  void changeScrollDown(bool value) {
    isScrollDown = value;
  }

  @observable
  ObservableList<CariHareketleriModel>? cariHareketleriList;

  @action
  void setCariHareketleri(List<CariHareketleriModel>? value) {
    if (value == null) {
      cariHareketleriList = null;
    } else {
      cariHareketleriList = value.asObservable();
    }
  }

  @observable
  String siralama = "";

  @action
  void setSiralama(String value) {
    siralama = value;
  }

  @observable
  bool isSearchBarOpened = false;

  @action
  void setCariListesiModel(CariListesiModel? value) => cariListesiModel = value;

  @action
  void changeSearchBar() {
    isSearchBarOpened = !isSearchBarOpened;
  }

  @computed
  double get borclarToplami {
    final Iterable<CariHareketleriModel>? data = cariHareketleriList?.where((CariHareketleriModel element) => element.borc != null);
    if (data?.isNotEmpty ?? false) {
      if (cariListesiModel?.dovizKodu != null) {
        return data!.map((CariHareketleriModel e) => e.dovizTuru == cariListesiModel?.dovizKodu ? e.dovizBorc ?? 0 : 0.0).reduce((double value, double element) => value + element);
      } else {
        return data!.map((CariHareketleriModel e) => e.borc ?? 0).reduce((double value, double element) => value + element);
      }
    } else {
      return 0.0;
    }
  }

  @computed
  double get alacaklarToplami {
    final Iterable<CariHareketleriModel>? data = cariHareketleriList?.where((CariHareketleriModel element) => element.alacak != null);
    if (data?.isNotEmpty ?? false) {
      if (cariListesiModel?.dovizKodu != null) {
        return data!.map((CariHareketleriModel e) => e.dovizTuru == cariListesiModel?.dovizKodu ? e.dovizAlacak ?? 0 : 0.0).reduce((double value, double element) => value + element);
      } else {
        return data!.map((CariHareketleriModel e) => e.alacak ?? 0).reduce((double value, double element) => value + element);
      }
    } else {
      return 0.0;
    }
  }

  @computed
  double get toplamBakiye {
    final CariHareketleriModel? model =
        cariHareketleriList?.where((CariHareketleriModel element) => element.tarih == cariHareketleriList?.map((CariHareketleriModel e) => e.tarih).reduce((DateTime? value, DateTime? element) => value!.isAfter(element!) ? value : element)).firstOrNull;
    if (cariListesiModel?.dovizKodu != null) {
      return model?.dovYuruyenBakiye ?? 0.0;
    } else {
      return model?.yuruyenBakiye ?? 0.0;
    }
  }

  @computed
  double get dovizBorclarToplami {
    final Iterable<CariHareketleriModel>? data = cariHareketleriList?.where((CariHareketleriModel element) => element.dovizBorc != null);
    if (data?.isNotEmpty ?? false) {
      return data!.map((CariHareketleriModel e) => e.dovizBorc!).reduce((double value, double element) => value + element);
    } else {
      return 0.0;
    }
  }

  @computed
  double get dovizAlacaklarToplami {
    final Iterable<CariHareketleriModel>? data = cariHareketleriList?.where((CariHareketleriModel element) => element.dovizAlacak != null);
    if (data?.isNotEmpty ?? false) {
      return data!.map((CariHareketleriModel e) => e.dovizAlacak!).reduce((double value, double element) => value + element);
    } else {
      return 0.0;
    }
  }
}
