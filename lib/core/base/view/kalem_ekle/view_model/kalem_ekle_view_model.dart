import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart';
import '../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';
import '../../../../constants/extensions/number_extensions.dart';

part 'kalem_ekle_view_model.g.dart';

class KalemEkleViewModel = _KalemEkleViewModelBase with _$KalemEkleViewModel;

abstract class _KalemEkleViewModelBase with Store {
  @observable
  StokListesiModel? model;

  @action
  void setModel(StokListesiModel? value) => model = value;

  @computed
  bool get dovizliMi => model?.dovizliMi ?? false;

  @observable
  KalemModel kalemModel = KalemModel(miktar: 0, miktar2: 0);

  @action
  void increaseMiktar(TextEditingController controller) {
    kalemModel.miktar = (kalemModel.miktar! + 1);
    controller.text = (kalemModel.miktar)!.toIntIfDouble.toString();
  }

  @action
  void setMiktar(int value) {
    kalemModel.miktar = value.toDouble();
  }

  @action
  void decreaseMiktar(TextEditingController controller) {
    if (kalemModel.miktar! > 0) kalemModel.miktar = (kalemModel.miktar! - 1);
    controller.text = (kalemModel.miktar)!.toIntIfDouble.toString();
  }

  @action
  void increaseMiktar2(TextEditingController controller) {
    kalemModel.miktar2 = kalemModel.miktar2! + 1;
    controller.text = (kalemModel.miktar2)!.toIntIfDouble.toString();
  }

  @action
  void setMiktar2(int value) {
    kalemModel.miktar2 = value.toDouble();
  }

  @action
  void decreaseMiktar2(TextEditingController controller) {
    if (kalemModel.miktar2! > 0) kalemModel.miktar2 = kalemModel.miktar2! - 1;
    controller.text = (kalemModel.miktar2)!.toIntIfDouble.toString();
  }
}
