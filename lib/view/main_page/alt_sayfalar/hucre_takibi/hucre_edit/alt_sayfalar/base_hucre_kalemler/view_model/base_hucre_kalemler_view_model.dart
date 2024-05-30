import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/model/hucre_transferi_model.dart";

part "base_hucre_kalemler_view_model.g.dart";

class BaseHucreKalemlerViewModel = _BaseHucreKalemlerViewModelBase with _$BaseHucreKalemlerViewModel;

abstract class _BaseHucreKalemlerViewModelBase with Store {
  @observable
  HucreTransferiModel model = SingletonModels.hucreTransferiModel;

  @action
  void setStok(BaseStokMixin? stok) {
    model = model.copyWith(stokKodu: stok?.stokKodu, stokAdi: stok?.stokAdi);
    SingletonModels.hucreTransferiModel = model;
  }

  @action
  void setHucre(String? hucre) {
    model = model.copyWith(hucreKodu: hucre);
    SingletonModels.hucreTransferiModel = model;
  }

  @action
  void setMiktar(double? miktar) {
    model = model.copyWith(miktar: miktar);
    SingletonModels.hucreTransferiModel = model;
  }
}
