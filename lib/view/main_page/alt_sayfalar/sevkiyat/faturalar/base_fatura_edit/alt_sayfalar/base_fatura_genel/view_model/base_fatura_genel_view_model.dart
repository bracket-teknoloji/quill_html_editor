import "package:mobx/mobx.dart";

import "../../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../model/param_model.dart";
import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "base_fatura_genel_view_model.g.dart";

class BaseFaturaGenelViewModel = _BaseFaturaGenelViewModelBase with _$BaseFaturaGenelViewModel;

abstract class _BaseFaturaGenelViewModelBase with Store {
  final Map<String, int> belgeTipi = <String, int>{
    "Kapalı": 1,
    "Açık": 2,
    "İade": 3,
    "Zayi İade": 4,
    "İhracat": 5,
  };

  @observable
  bool kdvDahil = BaseSiparisEditModel.instance.kdvDahil == "E" ? true : false;
  @observable
  bool ebelgeCheckbox = BaseSiparisEditModel.instance.ebelgeCheckbox == "E" ? true : false;

  @observable
  BaseSiparisEditModel model = BaseSiparisEditModel.instance;

  @action
  void changeKdvDahil(bool value) {
    kdvDahil = value;
    BaseSiparisEditModel.instance.kdvDahil = value ? "E" : "H";
    BaseSiparisEditModel.instance.kdvDahilMi = value;
  }
  @action
  void changeEbelgeCheckBox(bool value) {
    ebelgeCheckbox = value;
    BaseSiparisEditModel.instance.ebelgeCheckbox = value ? "E" : "H";
  }

  @action
  void setBelgeTipi(int? value) {
    model = model.copyWith(belgeTipi: value, tipi: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setOzelKod2(String? value) {
    model = model.copyWith(ozelKod2: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setPlasiyer(PlasiyerList? value) {
    model = model.copyWith(plasiyerKodu: value?.plasiyerKodu, plasiyerAciklama: value?.plasiyerAciklama);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setProje(BaseProjeModel? value) {
    model = model.copyWith(projeAciklama: value?.projeAciklama, projeKodu: value?.projeKodu);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setTarih(DateTime? value) {
    model = model.copyWith(tarih: value.dateTimeWithoutTime);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setTopluDepoKodu(int? value) {
    model = model.copyWith(topluDepo: value);
    BaseSiparisEditModel.setInstance(model);
  }
}
