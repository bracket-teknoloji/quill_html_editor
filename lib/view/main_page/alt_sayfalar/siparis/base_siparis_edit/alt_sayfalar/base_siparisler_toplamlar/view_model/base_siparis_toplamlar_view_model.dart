import "package:flutter/material.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";

import "../../../model/base_siparis_edit_model.dart";

part "base_siparis_toplamlar_view_model.g.dart";

class BaseSiparisToplamlarViewModel = _BaseSiparisToplamlarViewModelBase with _$BaseSiparisToplamlarViewModel;

abstract class _BaseSiparisToplamlarViewModelBase with Store {
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
    model = model.copyWith(ekMaliyet2Tutari: value);
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
      model = model.copyWith(genIsk1T: 0, genIsk1O: 0);
      return;
    }
    if (isGenIsk1T) {
      model = model.copyWith(genIsk1T: value, genIsk1O: ((value ?? 0) / (model.getAraToplam != 0 ? model.getAraToplam : 1) * 100));
    } else {
      model = model.copyWith(
        genIsk1O: value,
        genIsk1T: ((value ?? 0) * (model.genelIskonto1 ?? 0) / 100),
      );
    }
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setGenIsk2(double? value) {
    if (value == 0) {
      model = model.copyWith(genIsk2T: 0, genIsk2O: 0);
      return;
    }
    if (isGenIsk2T) {
      model = model.copyWith(genIsk2T: value, genIsk2O: ((value ?? 0) / (model.getAraToplam != 0 ? model.getAraToplam : 1) * 100));
    } else {
      model = model.copyWith(
        genIsk2O: value,
        genIsk2T: ((value ?? 0) * (model.genelIskonto2 ?? 0) / 100),
      );
    }
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void setGenIsk3(double? value) {
    if (value == 0) {
      model = model.copyWith(genIsk3T: 0, genIsk3O: 0);
      return;
    }
    if (isGenIsk3T) {
      model = model.copyWith(genIsk3T: value, genIsk3O: ((value ?? 0) / (model.getAraToplam != 0 ? model.getAraToplam : 1) * 100));
    } else {
      model = model.copyWith(
        genIsk3O: value,
        genIsk3T: ((value ?? 0) * (model.genelIskonto3 ?? 0) / 100),
      );
    }
    BaseSiparisEditModel.setInstance(model);
  }

  @action
  void changeGenIsk1O(TextEditingController controller) {
    isGenIsk1T = !isGenIsk1T;
    if (isGenIsk1T) {
      controller.text = (model.genIsk1T ?? 0).toIntIfDouble.toString();
    } else {
      controller.text = (model.genIsk1O ?? 0).toIntIfDouble.toString();
    }
    // model = model.copyWith(genisk1OranMi: isGenIsk1T);
  }

  @action
  void changeGenIsk2O(TextEditingController controller) {
    isGenIsk2T = !isGenIsk2T;
    if (isGenIsk2T) {
      controller.text = (model.genIsk2T ?? 0).toIntIfDouble.toString();
    } else {
      controller.text = (model.genIsk2O ?? 0).toIntIfDouble.toString();
    }
  }

  @action
  void changeGenIsk3O(TextEditingController controller) {
    isGenIsk3T = !isGenIsk3T;
    if (isGenIsk3T) {
      controller.text = (model.genIsk3T ?? 0).toIntIfDouble.toString();
    } else {
      controller.text = (model.genIsk3O ?? 0).toIntIfDouble.toString();
    }
  }

  Map<String, double> tevkifatMap = {
    "9/10 (Varsayılan)": 0.9,
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
}
