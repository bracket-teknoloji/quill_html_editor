import "package:mobx/mobx.dart";

import "../model/save_cek_senet_model.dart";

part "cek_senet_tahsilati_view_model.g.dart";

class CekSenetTahsilatiViewModel = _CekSenetTahsilatiViewModelBase with _$CekSenetTahsilatiViewModel;

abstract class _CekSenetTahsilatiViewModelBase with Store {
  @observable
  SaveCekSenetModel model = SaveCekSenetModel();

  @action
  void setGirisTarihi(DateTime? value) => model = model.copyWith(tarih: value);

  @action
  void setCariKodu(String? value) => model = model.copyWith(cariKodu: value);

  @action
  void setPlasiyerKodu(String? value) => model = model.copyWith(plasiyerKodu: value);
}
