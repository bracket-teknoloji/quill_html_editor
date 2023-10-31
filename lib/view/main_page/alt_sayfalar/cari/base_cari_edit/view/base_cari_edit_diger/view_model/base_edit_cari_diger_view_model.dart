import "package:mobx/mobx.dart";

import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "../../../../cari_listesi/model/cari_kosullar_model.dart";
import "../../../../cari_listesi/model/cari_listesi_model.dart";
import "../../../../cari_listesi/model/cari_save_request_model.dart";

part "base_edit_cari_diger_view_model.g.dart";

class BaseEditCariDigerViewModel = _BaseEditCariDigerViewModelBase with _$BaseEditCariDigerViewModel;

abstract class _BaseEditCariDigerViewModelBase with Store {
  final Map<String, String> kilitMap = <String, String>{"Kilitli Değil": "H", "Kilitli (Fatura)": "F", "Kilitli (Tüm İşlemler)": "T"};
  @observable
  CariSaveRequestModel? model;

  @action
  void changeModel(CariSaveRequestModel? value) {
    CariSaveRequestModel.setInstance(value);
  }

  @action
  void setModel(CariSaveRequestModel? value) {
    model = value;
    CariSaveRequestModel.setInstance(value);
  }

  @action
  void changeBagliCari(CariListesiModel? value) {
    model = model?.copyWith(bagliCari: value?.cariKodu, bagliCariAciklama: value?.cariAdi);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeGrupKodu(String? value) {
    model = model?.copyWith(grupKodu: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeMuhaseKodu(StokMuhasebeKoduModel? value) {
    model = model?.copyWith(muhasebeKodu: value?.hesapKodu, muhAdi: value?.adi);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKurFarkiBorc(StokMuhasebeKoduModel? value) {
    model = model?.copyWith(kurfarkiborcKodu: value?.hesapKodu, kurfarkiborcAdi: value?.adi);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKurFarkiAlacak(StokMuhasebeKoduModel? value) {
    model = model?.copyWith(kurfarkialacakKodu: value?.hesapKodu, kurfarkialacakAdi: value?.adi);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeAdi(String? value) {
    model = model?.copyWith(adi: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeBilgi(String? value) {
    model = model?.copyWith(bilgi: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKosul(CariKosullarModel? value) {
    model = model?.copyWith(kosulKodu: value?.kosulKodu, kosulKoduAciklama: value?.genelKosulAdi);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKilit(String? value) {
    model = model?.copyWith(kilit: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKod1(String? value) {
    model = model?.copyWith(kod1: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKod2(String? value) {
    model = model?.copyWith(kod2: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKod3(String? value) {
    model = model?.copyWith(kod3: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKod4(String? value) {
    model = model?.copyWith(kod4: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKod5(String? value) {
    model = model?.copyWith(kod5: value);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeSubeKodu(int? value) {
    model = model?.copyWith(subeKodu: value.toStringIfNotNull);
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeAciklama(int index, String? value) {
    switch (index) {
      case 1:
        model = model?.copyWith(aciklama1: value);
      case 2:
        model = model?.copyWith(aciklama2: value);
      case 3:
        model = model?.copyWith(aciklama3: value);
    }
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKullA(int index, String? value) {
    switch (index) {
      case 1:
        model = model?.copyWith(kull1s: value);
      case 2:
        model = model?.copyWith(kull2s: value);
      case 3:
        model = model?.copyWith(kull3s: value);
      case 4:
        model = model?.copyWith(kull4s: value);
      case 5:
        model = model?.copyWith(kull5s: value);
      case 6:
        model = model?.copyWith(kull6s: value);
      case 7:
        model = model?.copyWith(kull7s: value);
      case 8:
        model = model?.copyWith(kull8s: value);
    }
    CariSaveRequestModel.setInstance(model);
  }

  @action
  void changeKullN(int index, String? value) {
    final double? val = double.tryParse(value ?? "0");
    switch (index) {
      case 1:
        model = model?.copyWith(kull1n: val);
      case 2:
        model = model?.copyWith(kull2n: val);
      case 3:
        model = model?.copyWith(kull3n: val);
      case 4:
        model = model?.copyWith(kull4n: val);
      case 5:
        model = model?.copyWith(kull5n: val);
      case 6:
        model = model?.copyWith(kull6n: val);
      case 7:
        model = model?.copyWith(kull7n: val);
      case 8:
        model = model?.copyWith(kull8n: val);
    }
    CariSaveRequestModel.setInstance(model);
  }
}
