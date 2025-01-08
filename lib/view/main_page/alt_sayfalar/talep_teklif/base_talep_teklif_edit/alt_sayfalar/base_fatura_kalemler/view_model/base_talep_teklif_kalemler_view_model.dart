import "package:mobx/mobx.dart";

import "../../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "base_talep_teklif_kalemler_view_model.g.dart";

final class BaseTalepTeklifKalemlerViewModel = BaseTalepTeklifKalemlerViewModelBase with _$BaseTalepTeklifKalemlerViewModel;

abstract class BaseTalepTeklifKalemlerViewModelBase with Store {
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
    kalemList = List.generate(
      BaseSiparisEditModel.instance.kalemList?.length ?? 0,
      (index) => BaseSiparisEditModel.instance.kalemList?[index]?..sira = index + 1,
    ).nullCheckWithGeneric.asObservable();
  }
}
