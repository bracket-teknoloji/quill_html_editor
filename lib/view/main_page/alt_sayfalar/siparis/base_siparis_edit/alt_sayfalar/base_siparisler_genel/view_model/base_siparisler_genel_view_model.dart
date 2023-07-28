import 'package:mobx/mobx.dart';

import '../../../model/base_siparis_edit_model.dart';

part 'base_siparisler_genel_view_model.g.dart';

class BaseSiparislerGenelViewModel = _BaseSiparislerGenelViewModelBase with _$BaseSiparislerGenelViewModel;

abstract class _BaseSiparislerGenelViewModelBase with Store {
  @observable
  bool kdvDahil = BaseSiparisEditModel.instance.kdvDahil == "E" ? true : false;

  @action
  void changeKdvDahil(bool value) {
    kdvDahil = value;
    BaseSiparisEditModel.instance.kdvDahil = value ? "E" : "H";
  }
}
