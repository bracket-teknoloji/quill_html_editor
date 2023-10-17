import "package:mobx/mobx.dart";

import "../../../../../../../../core/base/model/base_bottom_sheet_response_model.dart";
import "../../../../../../model/param_model.dart";
import "../../../../cari_listesi/model/cari_listesi_model.dart";

part "base_cari_genel_edit_view_model.g.dart";

class BaseCariGenelEditViewModel = _BaseCariGenelEditViewModelBase
    with _$BaseCariGenelEditViewModel;

abstract class _BaseCariGenelEditViewModelBase with Store {
  @observable
  bool isSahisFirmasi = false;

  @action
  void changeIsSahisFirmasi(bool value) => isSahisFirmasi = value;

  @observable
  bool isDovizli = false;

  @action
  void changeIsDovizli(bool value) => isDovizli = value;

  @observable
  CariListesiModel? model;

  @action
  void changeModel(CariListesiModel? value) {
    value?.subeKodu ??= -1;
    value?.kilit ??= "H";
    CariListesiModel.setInstance(value);
  }

  @action
  void setModel(CariListesiModel? value) {
    model = value;
    CariListesiModel.setInstance(value);
  }

  @action
  void changeSiradakiKod(String? value) {
    model = model?.copyWith(cariKodu: value);
    changeModel(model?.copyWith(cariKodu: value));
  }

  @action
  void changeKodu(String value) {
    model = model?.copyWith(kodu: value);
    changeModel(model?.copyWith(kodu: value));
  }

  @action
  void changeCariTipi(BaseBottomSheetResponseModel value) {
    // model = model?.copyWith.cariTip(value.value);
    // model = model?.copyWith.cariTipAciklama(value.title);
    CariListesiModel.instance;
    model = model?.copyWith(cariTip: value.value, cariTipAciklama: value.title);
    changeModel(
        model?.copyWith(cariTip: value.value, cariTipAciklama: value.title));
  }

  @action
  void changePlasiyer(PlasiyerList? value) {
    model = model?.copyWith(
        plasiyerKodu: value?.plasiyerKodu,
        plasiyerAciklama: value?.plasiyerAciklama);
    changeModel(model?.copyWith(
        plasiyerKodu: value?.plasiyerKodu,
        plasiyerAciklama: value?.plasiyerAciklama));
  }

  @action
  void changeOdemeTipi(String? value) {
    model = model?.copyWith(odemeTipi: value);
    changeModel(model?.copyWith(odemeTipi: value));
  }

  @action
  void changeUlke(BaseBottomSheetResponseModel? value) {
    model = model?.copyWith(ulkeKodu: value?.value, ulkeAdi: value?.title);
    changeModel(model?.copyWith(ulkeAdi: value?.title, ulkeKodu: value?.value));
  }

  @action
  void changeAdi(String value) {
    model = model?.copyWith(cariAdi: value);
    changeModel(model?.copyWith(cariAdi: value));
  }
}
