import "package:flutter/material.dart";
import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../../core/init/cache/cache_manager.dart";

part "base_talep_teklif_toplamlar_view_model.g.dart";

class BaseTalepTeklifToplamlarViewModel = _BaseTalepTeklifToplamlarViewModelBase with _$BaseTalepTeklifToplamlarViewModel;

abstract class _BaseTalepTeklifToplamlarViewModelBase with Store {
  static ParamModel? get paramModel => CacheManager.getAnaVeri?.paramModel;
  @observable
  bool isGenIsk1T = false;

  @observable
  bool isGenIsk2T = false;

  @observable
  bool isGenIsk3T = false;

  @observable
  BaseSiparisEditModel model = BaseSiparisEditModel.instance;

  @action
  void setEkMal1(double? value) {
    model = model.copyWith(ekMaliyet1Tutari: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setTevkifat(double? value) {
    model = model.copyWith(ekMaliyet2Tutari: model.kdvTutari != 0 ? (-model.kdvTutari) * (value ?? 0) : 0);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setEkMal3(double? value) {
    model = model.copyWith(ekMaliyet3Tutari: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setVadeTarihi(DateTime value) {
    model = model.copyWith(vadeTarihi: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setIskTipi1(int? value) {
    model = model.copyWith(genisk1Tipi: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setIskTipi2(int? value) {
    model = model.copyWith(genisk2Tipi: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setIskTipi3(int? value) {
    model = model.copyWith(genisk3Tipi: value);
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setGenIsk1(double? value) {
    if (value == 0) {
      model = model.copyWith(genIsk1o: 0);
      return;
    }
    if (isGenIsk1T) {
      model = model.copyWith(genIsk1o: (value ?? 0) / (model.toplamAraToplam != 0 ? (model.toplamAraToplam) : 1) * 100);
    } else {
      model = model.copyWith(genIsk1o: value);
    }
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setGenIsk2(double? value) {
    if (value == 0) {
      model = model.copyWith(genIsk2o: 0);
      return;
    }
    if (isGenIsk2T) {
      model = model.copyWith(genIsk2o: (value ?? 0) / (model.toplamAraToplam != 0 ? (model.toplamAraToplam) - (model.genIsk1t ?? 0) : 1) * 100);
    } else {
      model = model.copyWith(genIsk2o: value);
    }
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setGenIsk3(double? value) {
    if (value == 0) {
      model = model.copyWith(genIsk3o: 0);
      return;
    }
    if (isGenIsk3T) {
      model = model.copyWith(genIsk3o: (value ?? 0) / (model.toplamAraToplam != 0 ? (model.toplamAraToplam) - (model.genIsk1t ?? 0) - (model.genIsk2t ?? 0) : 1) * 100);
    } else {
      model = model.copyWith(genIsk3o: value);
    }
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void changeGenIsk1O(TextEditingController controller) {
    isGenIsk1T = !isGenIsk1T;
    if (isGenIsk1T) {
      controller.text = (model.genIsk1t ?? 0).toIntIfDouble.toString();
    } else {
      controller.text = (model.genIsk1o ?? 0).toIntIfDouble.toString();
    }
    // model = model.copyWith(genisk1OranMi: isGenIsk1T);
  }

  @action
  void changeGenIsk2O(TextEditingController controller) {
    isGenIsk2T = !isGenIsk2T;
    if (isGenIsk2T) {
      controller.text = (model.genIsk2t ?? 0).toIntIfDouble.toString();
    } else {
      controller.text = (model.genIsk2o ?? 0).toIntIfDouble.toString();
    }
  }

  @action
  void changeGenIsk3O(TextEditingController controller) {
    isGenIsk3T = !isGenIsk3T;
    if (isGenIsk3T) {
      controller.text = (model.genIsk3t ?? 0).toIntIfDouble.toString();
    } else {
      controller.text = (model.genIsk3o ?? 0).toIntIfDouble.toString();
    }
  }

  Map<String, double> get tevkifatMap => <String, double>{
        "$getTevkifatPay/$getTevkifatPayda (Varsayılan)": getTevkifatOranlari,
        "1/10": 0.1,
        "2/10": 0.2,
        "3/10": 0.3,
        "4/10": 0.4,
        "5/10": 0.5,
        "6/10": 0.6,
        "7/10": 0.7,
        "8/10": 0.8,
        "9/10": 0.9,
      };
  int get getTevkifatPay => StaticVariables.instance.isMusteriSiparisleri ? (paramModel?.satisTevkifatPay ?? 0) : (paramModel?.alisTevkifatPay ?? 0);
  int get getTevkifatPayda => StaticVariables.instance.isMusteriSiparisleri ? (paramModel?.satisTevkifatPayda ?? 0) : (paramModel?.alisTevkifatPayda ?? 0);
  double get getTevkifatOranlari => getTevkifatPay / getTevkifatPayda;
}
