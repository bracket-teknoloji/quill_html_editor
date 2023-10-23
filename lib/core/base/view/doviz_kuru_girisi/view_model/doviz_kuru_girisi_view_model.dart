import "package:mobx/mobx.dart";

import "../../../model/doviz_kurlari_model.dart";

part "doviz_kuru_girisi_view_model.g.dart";

class DovizKuruGirisiViewModel = _DovizKuruGirisiViewModelBase with _$DovizKuruGirisiViewModel;

abstract class _DovizKuruGirisiViewModelBase with Store {
  @observable
  DovizKurlariModel? dovizKurlariModel;

  @action
  void changeDovizKurlariModel(DovizKurlariModel? value) => dovizKurlariModel = value;

  @action
  void changeTarih(DateTime? value) => dovizKurlariModel = dovizKurlariModel?.copyWith(tarih: value);

  @action
  void changeDovizTipi(int? value) => dovizKurlariModel = dovizKurlariModel?.copyWith(dovizTipi: value);

  @action
  void changeAlis(double? value) => dovizKurlariModel = dovizKurlariModel?.copyWith(dovAlis: value);

  @action
  void changeSatis(double? value) => dovizKurlariModel = dovizKurlariModel?.copyWith(dovSatis: value);

  @action
  void changeEfektifAlis(double? value) => dovizKurlariModel = dovizKurlariModel?.copyWith(effAlis: value);

  @action
  void changeEfektifSatis(double? value) => dovizKurlariModel = dovizKurlariModel?.copyWith(effSatis: value);
}
