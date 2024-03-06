import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

part "sayim_girisi_view_model.g.dart";

class SayimGirisiViewModel = _SayimGirisiViewModelBase with _$SayimGirisiViewModel;

abstract class _SayimGirisiViewModelBase with Store {
  @observable
  SayimFiltreModel filtreModel = SayimFiltreModel(islemKodu: 1);

  @observable
  StokListesiModel? stokModel;

  @action
  void setStokModel(StokListesiModel? model) {
    stokModel = model;
    filtreModel = filtreModel.copyWith(stokKodu: model?.stokKodu);
  }
}
