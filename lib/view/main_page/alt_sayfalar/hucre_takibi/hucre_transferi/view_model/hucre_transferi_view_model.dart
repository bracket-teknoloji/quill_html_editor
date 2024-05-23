import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/model/hucre_transferi_model.dart";

part "hucre_transferi_view_model.g.dart";

class HucreTransferiViewModel = _HucreTransferiViewModelBase with _$HucreTransferiViewModel;

abstract class _HucreTransferiViewModelBase with Store {
  @observable
  HucreTransferiModel model = HucreTransferiModel();

  @observable
  bool isStok = true;

  @computed
  List<bool> get isStokList => [isStok, !isStok];

  @action
  void setIsStok(bool value) => isStok = value;

  @action
  void setDepoKodu(int? value) => model = model.copyWith(depoKodu: value);

  @action
  void setStokKodu(String? value) => model = model.copyWith(stokKodu: value);

  @action
  void setHucreKodu(String? value) => model = model.copyWith(hucreKodu: value);

  @action
  void setHedefHucre(String? value) => model = model.copyWith(hedefHucre: value);
}
