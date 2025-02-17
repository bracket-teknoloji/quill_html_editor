import "package:mobx/mobx.dart";
import "package:picker/core/base/view/genel_rehber/model/genel_rehber_model.dart";

import "../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../model/param_model.dart";
import "../../../model/base_siparis_edit_model.dart";

part "base_siparisler_genel_view_model.g.dart";

final class BaseSiparislerGenelViewModel = _BaseSiparislerGenelViewModelBase with _$BaseSiparislerGenelViewModel;

abstract class _BaseSiparislerGenelViewModelBase with Store {
  @observable
  bool kdvDahil = BaseSiparisEditModel.instance.kdvDahilMi ?? false;

  @observable
  BaseSiparisEditModel model = BaseSiparisEditModel.instance;

  @action
  void changeKdvDahil(bool value) {
    kdvDahil = value;
    BaseSiparisEditModel.instance.kdvDahil = value ? "E" : "H";
    BaseSiparisEditModel.instance.kdvDahilMi = value;
    BaseSiparisEditModel.instance.kalemlerOTVHesapla();
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setProjeKodu(BaseProjeModel? value) {
    model = model.copyWith(projeKodu: value?.projeKodu, projeAciklama: value?.projeAciklama);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setKosulKodu(String? value) {
    model = model.copyWith(kosulKodu: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setOzelKod1(String? value) {
    model = model.copyWith(ozelKod1: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setOzelKod2(String? value) {
    model = model.copyWith(ozelKod2: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setOdemeKodu(String? value) {
    model = model.copyWith(odemeKodu: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setPlasiyer(PlasiyerList? value) {
    model = model.copyWith(plasiyerKodu: value?.plasiyerKodu, plasiyerAciklama: value?.plasiyerAciklama);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setTopluDepoKodu(int? value) {
    model = model.copyWith(topluDepo: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setAciklama(int index, GenelRehberModel? value) {
    if (value?.adi == value?.kodu) {
      value?.adi = null;
    }
    switch (index) {
      case 1:
        model = model.copyWith(acik1: value?.kodu, aciklama1Adi: value?.adi);
      case 2:
        model = model.copyWith(acik2: value?.kodu, aciklama2Adi: value?.adi);
      case 3:
        model = model.copyWith(acik3: value?.kodu, aciklama3Adi: value?.adi);
      case 4:
        model = model.copyWith(acik4: value?.kodu, aciklama4Adi: value?.adi);
      case 5:
        model = model.copyWith(acik5: value?.kodu, aciklama5Adi: value?.adi);
      case 6:
        model = model.copyWith(acik6: value?.kodu, aciklama6Adi: value?.adi);
      case 7:
        model = model.copyWith(acik7: value?.kodu, aciklama7Adi: value?.adi);
      case 8:
        model = model.copyWith(acik8: value?.kodu, aciklama8Adi: value?.adi);
      case 9:
        model = model.copyWith(acik9: value?.kodu, aciklama9Adi: value?.adi);
      case 10:
        model = model.copyWith(acik10: value?.kodu, aciklama10Adi: value?.adi);
      case 11:
        model = model.copyWith(acik11: value?.kodu, aciklama11Adi: value?.adi);
      case 12:
        model = model.copyWith(acik12: value?.kodu, aciklama12Adi: value?.adi);
      case 13:
        model = model.copyWith(acik13: value?.kodu, aciklama13Adi: value?.adi);
      case 14:
        model = model.copyWith(acik14: value?.kodu, aciklama14Adi: value?.adi);
      case 15:
        model = model.copyWith(acik15: value?.kodu, aciklama15Adi: value?.adi);
      case 16:
        model = model.copyWith(acik16: value?.kodu, aciklama16Adi: value?.adi);
      default:
    }
    BaseSiparisEditModel.setInstance(model);
  }
}
