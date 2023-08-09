import 'package:mobx/mobx.dart';

import '../../../model/base_siparis_edit_model.dart';

part 'base_siparis_kalemler_view_model.g.dart';

class BaseSiparisKalemlerViewModel = _BaseSiparisKalemlerViewModelBase with _$BaseSiparisKalemlerViewModel;

abstract class _BaseSiparisKalemlerViewModelBase with Store {
  @observable
  ObservableList<KalemModel>? kalemList;

  @action
  void removeAtKalemList(int index) {
    kalemList?.removeAt(index);
    BaseSiparisEditModel.instance.kalemler = kalemList;
  }

  @action
  void updateKalemList(List<KalemModel>? list)=> kalemList = list?.asObservable();
}
