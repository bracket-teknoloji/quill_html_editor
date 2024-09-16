import "package:mobx/mobx.dart";
import "../../../../../../../../core/constants/extensions/list_extensions.dart";

import "../../../model/base_siparis_edit_model.dart";

part "base_siparis_kalemler_view_model.g.dart";

class BaseSiparisKalemlerViewModel = _BaseSiparisKalemlerViewModelBase with _$BaseSiparisKalemlerViewModel;

abstract class _BaseSiparisKalemlerViewModelBase with Store {
  @observable
  ObservableList<KalemModel>? kalemList;

  @action
  void removeAtKalemList(int index) {
    kalemList?.removeAt(index);
    BaseSiparisEditModel.instance.kalemList = kalemList;
    updateKalemList();
  }

  @action
  void updateKalemList() {
    kalemList = BaseSiparisEditModel.instance.kalemList?.asObservable();
    kalemList = List.generate(
      BaseSiparisEditModel.instance.kalemList?.length ?? 0,
      (index) => BaseSiparisEditModel.instance.kalemList?[index]?..sira = index + 1,
    ).nullCheckWithGeneric.asObservable();
  }
}
