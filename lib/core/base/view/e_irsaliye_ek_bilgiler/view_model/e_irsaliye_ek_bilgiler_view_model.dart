import "package:flutter/material.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/view/e_irsaliye_ek_bilgiler/model/e_irsaliye_bilgi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";

part "e_irsaliye_ek_bilgiler_view_model.g.dart";

class EIrsaliyeEkBilgilerViewModel = _EIrsaliyeEkBilgilerViewModelBase with _$EIrsaliyeEkBilgilerViewModel;

abstract class _EIrsaliyeEkBilgilerViewModelBase with Store {
  @observable
  EIrsaliyeBilgiModel model = EIrsaliyeBilgiModel();

  @action
  void setModel(EIrsaliyeBilgiModel model) => this.model = model;

  @action
  void setPlaka(String? plaka) => model = model.copyWith(plaka: plaka);

  @action
  void setSevkTarihi(DateTime? sevkTarihi) => model = model.copyWith(sevktar: sevkTarihi);

  @action
  void setSevkSaati(TimeOfDay? sevkSaati) => model = model.copyWith(sevktar: model.sevktar?.copyWith(hour: sevkSaati!.hour, minute: sevkSaati.minute));

  @action
  void setUnvan(CariListesiModel? model) => this.model = this.model.copyWith(
        tasiyiciUnvan: model?.cariAdi,
        tasiyiciIl: model?.cariIl,
        tasiyiciIlce: model?.cariIlce,
        tasiyiciUlke: model?.ulkeAdi,
        tasiyiciPostakodu: model?.postakodu,
        tasiyiciVkn: model?.vergiNumarasi,);

  @action
  void setVergiNo(String? vergiNo) => model = model.copyWith(tasiyiciVkn: vergiNo);

  @action
  void setIl(String? il) => model = model.copyWith(tasiyiciIl: il);

  @action
  void setIlce(String? ilce) => model = model.copyWith(tasiyiciIlce: ilce);

  @action
  void setUlke(String? ulke) => model = model.copyWith(tasiyiciUlke: ulke);

  @action
  void setPostaKodu(String? postaKodu) => model = model.copyWith(tasiyiciPostakodu: postaKodu);

  @action
  void setSofor1Adi(String? sofor1Adi) => model = model.copyWith(sofor1Adi: sofor1Adi);

  @action
  void setSofor1Soyadi(String? sofor1Soyadi) => model = model.copyWith(sofor1Soyadi: sofor1Soyadi);

  @action
  void setSofor1Aciklama(String? sofor1Aciklama) => model = model.copyWith(sofor1Aciklama: sofor1Aciklama);

  @action
  void setSofor1TcKimlikNo(String? sofor1TcKimlikNo) => model = model.copyWith(sofor1KimlikNo: sofor1TcKimlikNo);

  @action
  void setSofor2Adi(String? sofor2Adi) => model = model.copyWith(sofor2Adi: sofor2Adi);

  @action
  void setSofor2Soyadi(String? sofor2Soyadi) => model = model.copyWith(sofor2Soyadi: sofor2Soyadi);

  @action
  void setSofor2Aciklama(String? sofor2Aciklama) => model = model.copyWith(sofor2Aciklama: sofor2Aciklama);

  @action
  void setSofor2TcKimlikNo(String? sofor2TcKimlikNo) => model = model.copyWith(sofor2KimlikNo: sofor2TcKimlikNo);

  @action
  void setSofor3Adi(String? sofor3Adi) => model = model.copyWith(sofor3Adi: sofor3Adi);

  @action
  void setSofor3Soyadi(String? sofor3Soyadi) => model = model.copyWith(sofor3Soyadi: sofor3Soyadi);

  @action
  void setSofor3Aciklama(String? sofor3Aciklama) => model = model.copyWith(sofor3Aciklama: sofor3Aciklama);

  @action
  void setSofor3TcKimlikNo(String? sofor3TcKimlikNo) => model = model.copyWith(sofor3KimlikNo: sofor3TcKimlikNo);

  @action
  void setDorsePlaka1(String? dorsePlaka1) => model = model.copyWith(dorsePlaka1: dorsePlaka1);

  @action
  void setDorsePlaka2(String? dorsePlaka2) => model = model.copyWith(dorsePlaka2: dorsePlaka2);

  @action
  void setDorsePlaka3(String? dorsePlaka3) => model = model.copyWith(dorsePlaka3: dorsePlaka3);

}
