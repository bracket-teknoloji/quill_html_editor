import "package:flutter/material.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../constants/extensions/number_extensions.dart";

part "kalem_ekle_view_model.g.dart";

class KalemEkleViewModel = _KalemEkleViewModelBase with _$KalemEkleViewModel;

abstract class _KalemEkleViewModelBase with Store {
  @observable
  StokListesiModel? model;

  @action
  void setModel(StokListesiModel? value) => model = value;

  @computed
  bool get dovizliMi => model?.dovizliMi ?? false;

  @computed
  List<String> get olcuBirimiMap =>[model?.olcuBirimi, model?.olcuBirimi2, model?.olcuBirimi3].nullCheck.cast<String>();

  @observable
  KalemModel kalemModel = KalemModel();
  @action
  void setKalemModel(KalemModel? value) => kalemModel = value ?? KalemModel();
  @action
  void setOlcuBirimi(MapEntry<String,int> value) => kalemModel = kalemModel.copyWith(olcuBirimKodu: value.value, olcuBirimAdi: value.key);
  @action
  void setProjeKodu(String value) => kalemModel = kalemModel.copyWith(projeKodu: value);
  @action
  void setDepoKodu(int value) => kalemModel = kalemModel.copyWith(depoKodu: value);
  @action
  void setKosul(String value) => kalemModel = kalemModel.copyWith(kosulKodu: value);
  @action
  void setMiktar(int value) => kalemModel = kalemModel.copyWith(miktar: value.toDouble());
  @action
  void setBrutFiyat(double value) => kalemModel = kalemModel.copyWith(brutFiyat: value);
  @action
  void setMFTutari(double value) => kalemModel = kalemModel.copyWith(malFazlasiMiktar: value);
  @action
  void setKdvOrani(double value) => kalemModel = kalemModel.copyWith(kdvOrani: value);
  @action
  void setIskonto1(double value) => kalemModel = kalemModel.copyWith(iskonto1: value);
  @action
  void setIskonto2(double value) => kalemModel = kalemModel.copyWith(iskonto2: value);
  @action
  void setIskonto3(double value) => kalemModel = kalemModel.copyWith(iskonto3: value);
  @action
  void setIskonto1OranMi() => kalemModel = kalemModel.copyWith(iskonto1OranMi: !(kalemModel.iskonto1OranMi ?? false));
  @action
  void increaseMiktar(TextEditingController controller) {
    kalemModel = kalemModel.copyWith(miktar: (kalemModel.miktar ?? 0) + 1);
    controller.text = (kalemModel.miktar ?? 0).toIntIfDouble.toString();
  }

  @action
  void decreaseMiktar(TextEditingController controller) {
    if ((kalemModel.miktar ?? 0) > 1) {
      kalemModel = kalemModel.copyWith(miktar: (kalemModel.miktar ?? 0) - 1);
      controller.text = (kalemModel.miktar ?? 0).toIntIfDouble.toString();
    }
  }

  @action
  void increaseMiktar2(TextEditingController controller) {
    kalemModel = kalemModel.copyWith(miktar2: (kalemModel.miktar2 ?? 0) + 1);
    controller.text = (kalemModel.miktar2 ?? 0).toIntIfDouble.toString();
  }

  @action
  void setMiktar2(int value) => kalemModel = kalemModel.copyWith(miktar2: value.toDouble());

  @action
  void decreaseMiktar2(TextEditingController controller) {
    if ((kalemModel.miktar2 ?? 0) > 0) {
      kalemModel = kalemModel.copyWith(miktar2: (kalemModel.miktar2 ?? 0) - 1, malfazIskAdedi: (kalemModel.miktar2 ?? 0) - 1);
      controller.text = (kalemModel.miktar2 ?? 0).toIntIfDouble.toString();
    }
  }

  @action
  void increaseMFMiktar(TextEditingController controller) {
    kalemModel = kalemModel.copyWith(malFazlasiMiktar: (kalemModel.malFazlasiMiktar ?? 0) + 1, malfazIskAdedi: (kalemModel.malFazlasiMiktar ?? 0) + 1);
    controller.text = (kalemModel.malFazlasiMiktar ?? 0).toIntIfDouble.toString();
  }

  @action
  void setMFMiktar(int value) => kalemModel = kalemModel.copyWith(malFazlasiMiktar: value.toDouble());

  @action
  void decreaseMFMiktar(TextEditingController controller) {
    if ((kalemModel.malFazlasiMiktar ?? 0) > 0) {
      kalemModel = kalemModel.copyWith(malFazlasiMiktar: (kalemModel.malFazlasiMiktar ?? 0) - 1);
      controller.text = (kalemModel.malFazlasiMiktar ?? 0).toIntIfDouble.toString();
    }
  }
}
