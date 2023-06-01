import 'package:mobx/mobx.dart';

import '../model/cari_hareketleri_model.dart';

part 'cari_hareketleri_view_model.g.dart';

class CariHareketleriViewModel = _CariHareketleriViewModelBase with _$CariHareketleriViewModel;

abstract class _CariHareketleriViewModelBase with Store {
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
  void changeSearchBar() {
    isSearchBarOpened = !isSearchBarOpened;
  }

  @computed
  double get borclarToplami {
    var data = cariHareketleriList?.where((element) => element.borc != null);
    if (data?.isNotEmpty ?? false) {
      return data!.map((e) => e.borc!).reduce((value, element) => value + element);
    } else {
      return 0.0;
    }
  }

  @computed
  double get alacaklarToplami {
    var data = cariHareketleriList?.where((element) => element.alacak != null);
    if (data?.isNotEmpty ?? false) {
      return data!.map((e) => e.alacak!).reduce((value, element) => value + element);
    } else {
      return 0.0;
    }
  }
}
