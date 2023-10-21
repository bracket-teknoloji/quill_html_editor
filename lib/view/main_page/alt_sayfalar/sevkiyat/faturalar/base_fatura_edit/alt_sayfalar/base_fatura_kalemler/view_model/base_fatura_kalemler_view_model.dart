import "package:mobx/mobx.dart";
import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "base_fatura_kalemler_view_model.g.dart";

class BaseFaturaKalemlerViewModel = BaseFaturaKalemlerViewModelBase with _$BaseFaturaKalemlerViewModel;

abstract class BaseFaturaKalemlerViewModelBase with Store {
  @observable
  ObservableList<KalemModel>? kalemList;

  @action
  void removeAtKalemList(int index) {
    kalemList?.removeAt(index);
    BaseSiparisEditModel.instance.kalemList = kalemList;
    BaseSiparisEditModel.instance.kalemler;
    updateKalemList();
  }

  @action
  void updateKalemList() => kalemList = BaseSiparisEditModel.instance.kalemList?.asObservable();
}
