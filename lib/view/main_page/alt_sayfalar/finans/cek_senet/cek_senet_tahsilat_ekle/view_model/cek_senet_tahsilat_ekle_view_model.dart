import "package:mobx/mobx.dart";

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
}
