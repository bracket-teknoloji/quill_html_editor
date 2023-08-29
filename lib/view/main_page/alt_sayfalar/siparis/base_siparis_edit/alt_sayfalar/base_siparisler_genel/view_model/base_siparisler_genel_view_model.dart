import "package:mobx/mobx.dart";

import "../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../model/param_model.dart";
import "../../../model/base_siparis_edit_model.dart";

part "base_siparisler_genel_view_model.g.dart";

class BaseSiparislerGenelViewModel = _BaseSiparislerGenelViewModelBase with _$BaseSiparislerGenelViewModel;

abstract class _BaseSiparislerGenelViewModelBase with Store {
  @observable
  bool kdvDahil = BaseSiparisEditModel.instance.kdvDahil == "E" ? true : false;

  @observable
  BaseSiparisEditModel model = BaseSiparisEditModel.instance;

  @action
  void changeKdvDahil(bool value) {
    kdvDahil = value;
    BaseSiparisEditModel.instance.kdvDahil = value ? "E" : "H";
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

  // @action
  // void setCariKodu(String? value) {
  //   model = model.copyWith(cariKodu: value, cariModel: model.cariModel?..cariKodu = value);
  //   BaseSiparisEditModel.setInstance(model);
  // }
}
