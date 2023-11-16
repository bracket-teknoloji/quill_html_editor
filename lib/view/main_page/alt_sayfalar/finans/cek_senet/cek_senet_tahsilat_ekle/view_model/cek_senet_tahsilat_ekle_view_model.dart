import "package:mobx/mobx.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../cek_senet_tahsilati/model/save_cek_senet_model.dart";

part "cek_senet_tahsilat_ekle_view_model.g.dart";

class CekSenetTahsilatEkleViewModel = _CekSenetTahsilatEkleViewModelBase with _$CekSenetTahsilatEkleViewModel;

abstract class _CekSenetTahsilatEkleViewModelBase with Store {
  @observable
  CekSenetkalemlerModel model = CekSenetkalemlerModel();

  @action
  void setCiroTipi(String? value) => model = model.copyWith(ciroTipi: value);

  @action
  void setVadeTarihi(DateTime? value) => model = model.copyWith(vadeTarihi: value.dateTimeWithoutTime);

  @action
  void setDovizTipi(String? value) => model = model.copyWith();

  @action
  void setTutar(double? value) => model = model.copyWith(tutar: value);

  @action
  void setSeriNo(String? value) => model = model.copyWith(seriNo: value);

  @action
  void setBanka(String? value) => model = model.copyWith(cekBanka: value);

  @action
  void setSube(String? value) => model = model.copyWith(cekSube: value);

  @action
  void setHesapNo(String? value) => model = model.copyWith(hesapNo: value);

  @action
  void setPlasiyer(PlasiyerList? value) => model = model.copyWith(plasiyerKodu: value?.plasiyerKodu, plasiyerAdi: value?.plasiyerAciklama);

  // @action
  // void setIBAN(String? value) => model = model.copyWith(iban: value)

  @action
  void setIl(String? value) => model = model.copyWith(sehir: value);

  @action
  void setIlce(String? value) => model = model.copyWith(ilce: value);

  @action
  void setRaporKodu(String? value) => model = model.copyWith(raporKodu: value);

  @action
  void setCariRaporKodu(String? value) => model = model.copyWith(cariRaporKodu: value);

}
