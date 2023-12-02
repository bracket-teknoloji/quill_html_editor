import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "base_talep_teklif_kalemler_view_model.g.dart";

class BaseTalepTeklifKalemlerViewModel = BaseTalepTeklifKalemlerViewModelBase with _$BaseTalepTeklifKalemlerViewModel;

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
  void updateKalemList() => kalemList = BaseSiparisEditModel.instance.kalemList?.asObservable();
}
