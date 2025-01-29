import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

part "transfer_mal_talebi_genel_view_model.g.dart";

final class TransferMalTalebiGenelViewModel = _TransferMalTalebiGenelViewModelBase with _$TransferMalTalebiGenelViewModel;

abstract class _TransferMalTalebiGenelViewModelBase with Store {
  @observable
  BaseSiparisEditModel model = BaseSiparisEditModel.instance;

  @action
  void setModel(BaseSiparisEditModel value) {
    model = value;
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setAciklama(String? value) => setModel(model.copyWith(aciklama: value));

  @action
  void setHedefSube(SubeList? value) => setModel(model.copyWith(hedefSube: value?.subeKodu));

  @action
  void setDepoKodu(DepoList? value) => setModel(model.copyWith(depoKodu: value?.depoKodu, depoTanimi: value?.depoTanimi));

  @action
  void setIsEmri(IsEmirleriModel? value) => setModel(model.copyWith(belgeNo: value?.isemriNo));
}
