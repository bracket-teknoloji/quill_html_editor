
import 'package:mobx/mobx.dart';
part 'cari_aktivite_view_model.g.dart';

class CariAktiviteViewModel = _CariAktiviteViewModelBase with _$CariAktiviteViewModel;

abstract class _CariAktiviteViewModelBase with Store {
  @observable
  bool isSearch = false;

  @action
  void changeSearch() {
    isSearch = !isSearch;
  }
  
}