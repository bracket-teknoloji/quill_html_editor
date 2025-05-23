import "package:mobx/mobx.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";

import "../../../model/base_siparis_edit_model.dart";

part "base_siparis_kalemler_view_model.g.dart";

final class BaseSiparisKalemlerViewModel = _BaseSiparisKalemlerViewModelBase with _$BaseSiparisKalemlerViewModel;

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
    if (!(BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false)) {
      BaseSiparisEditModel.instance.kalemlerOTVHesapla();
    }
    kalemList = List.generate(
      BaseSiparisEditModel.instance.kalemList?.length ?? 0,
      (index) => BaseSiparisEditModel.instance.kalemList![index]..sira = index + 1,
    ).asObservable();
  }
}
