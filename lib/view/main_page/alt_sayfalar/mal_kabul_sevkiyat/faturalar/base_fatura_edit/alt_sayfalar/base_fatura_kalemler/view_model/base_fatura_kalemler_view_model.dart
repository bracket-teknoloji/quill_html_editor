import "package:mobx/mobx.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";

import "../../../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "base_fatura_kalemler_view_model.g.dart";

final class BaseFaturaKalemlerViewModel = BaseFaturaKalemlerViewModelBase with _$BaseFaturaKalemlerViewModel;

abstract class BaseFaturaKalemlerViewModelBase with Store {
  @observable
  ObservableList<KalemModel>? kalemList = (BaseSiparisEditModel.instance.kalemList ?? []).asObservable();

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
    kalemList =
        List.generate(
          BaseSiparisEditModel.instance.kalemList?.length ?? 0,
          (index) => BaseSiparisEditModel.instance.kalemList?[index]?..sira = index + 1,
        ).nullCheckWithGeneric.asObservable();
  }
}
