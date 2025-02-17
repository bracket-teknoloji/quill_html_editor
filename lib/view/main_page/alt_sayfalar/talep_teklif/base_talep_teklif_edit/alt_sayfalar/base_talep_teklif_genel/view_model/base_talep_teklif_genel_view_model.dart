import "package:mobx/mobx.dart";

import "../../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../model/param_model.dart";
import "../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "base_talep_teklif_genel_view_model.g.dart";

final class BaseTalepTeklifGenelViewModel = _BaseTalepTeklifGenelViewModelBase with _$BaseTalepTeklifGenelViewModel;

abstract class _BaseTalepTeklifGenelViewModelBase with Store {
  final Map<String, int> belgeTipi = <String, int>{"Kapalı": 1, "Açık": 2, "İade": 3, "Zayi İade": 4, "İhracat": 5};

  @observable
  bool kdvDahil = BaseSiparisEditModel.instance.kdvDahil == "E" ? true : false;

  @observable
  BaseSiparisEditModel model = BaseSiparisEditModel.instance;

  @action
  void setCariAdi(String? value) {
    model = model.copyWith(cariAdi: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setCariKodu(String? value) {
    model = model.copyWith(cariKodu: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setTeslimCariAdi(String? value) {
    model = model.copyWith(teslimCariAdi: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setTeslimCariKodu(String? value) {
    model = model.copyWith(teslimCari: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setDepoKodu(DepoList? value) {
    model = model.copyWith(topluDepo: value?.depoKodu, depoTanimi: value?.depoTanimi);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void changeKdvDahil(bool value) {
    kdvDahil = value;
    BaseSiparisEditModel.instance.kdvDahil = value ? "E" : "H";
    BaseSiparisEditModel.instance.kdvDahilMi = value;
    BaseSiparisEditModel.instance.kalemlerOTVHesapla();
    BaseSiparisEditModel.setInstance(model);
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

  @action
  void setAciklama(int index, String? value) {
    switch (index) {
      case 1:
        model = model.copyWith(acik1: value);
      case 2:
        model = model.copyWith(acik2: value);
      case 3:
        model = model.copyWith(acik3: value);
      case 4:
        model = model.copyWith(acik4: value);
      case 5:
        model = model.copyWith(acik5: value);
      case 6:
        model = model.copyWith(acik6: value);
      case 7:
        model = model.copyWith(acik7: value);
      case 8:
        model = model.copyWith(acik8: value);
      case 9:
        model = model.copyWith(acik9: value);
      case 10:
        model = model.copyWith(acik10: value);
      case 11:
        model = model.copyWith(acik11: value);
      case 12:
        model = model.copyWith(acik12: value);
      case 13:
        model = model.copyWith(acik13: value);
      case 14:
        model = model.copyWith(acik14: value);
      case 15:
        model = model.copyWith(acik15: value);
      case 16:
        model = model.copyWith(acik16: value);
      default:
    }
    BaseSiparisEditModel.setInstance(model);
  }
}
