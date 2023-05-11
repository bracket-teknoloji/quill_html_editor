import 'package:mobx/mobx.dart';

part 'base_cari_genel_edit_view_model.g.dart';

class BaseCariGenelEditViewModel = _BaseCariGenelEditViewModelBase with _$BaseCariGenelEditViewModel;

abstract class _BaseCariGenelEditViewModelBase with Store {
  @observable
  bool isSahisFirmasi = false;

  @action
  void changeIsSahisFirmasi(bool value) {
    isSahisFirmasi = value;
  }
  @observable
  bool isDovizli = false;

  @action
  void changeIsDovizli(bool value) {
    isDovizli = value;
  }
}
