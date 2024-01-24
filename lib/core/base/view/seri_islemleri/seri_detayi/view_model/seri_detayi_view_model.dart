import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";

part "seri_detayi_view_model.g.dart";

class SeriDetayiViewModel = _SeriDetayiViewModelBase with _$SeriDetayiViewModel;

abstract class _SeriDetayiViewModelBase with Store {
  @observable
  bool seriEtiketiYazdir = false;

  @observable
  SeriList seriModel = SeriList();

  @action
  void setSeriModel(SeriList model) => seriModel = model;

  @action
  void changeSeriEtiketYazdir() => seriEtiketiYazdir = !seriEtiketiYazdir;

  @action
  void setSeri1(String? value) => seriModel = seriModel.copyWith(seri1: value?.isNotEmpty ?? false ? value : null);

  @action
  void setSeri2(String? value) => seriModel = seriModel.copyWith(seri2: value?.isNotEmpty ?? false ? value : null);

  @action
  void setSeri3(String? value) => seriModel = seriModel.copyWith(seri3: value?.isNotEmpty ?? false ? value : null);

  @action
  void setSeri4(String? value) => seriModel = seriModel.copyWith(seri4: value?.isNotEmpty ?? false ? value : null);

  @action
  void setSonKullanmaTarihi(DateTime? datetime) => seriModel = seriModel.copyWith(sonKullanmaTarihi: datetime);

  @action
  void setMiktar(double miktar) => seriModel = seriModel.copyWith(miktar: miktar);

  @action
  void setAcik1(String? value) => seriModel = seriModel.copyWith(acik1: value?.isNotEmpty ?? false ? value : null);

  @action
  void setAcik2(String? value) => seriModel = seriModel.copyWith(acik2: value?.isNotEmpty ?? false ? value : null);

  @action
  void setAcik3(String? value) => seriModel = seriModel.copyWith(acik3: value?.isNotEmpty ?? false ? value : null);

  @action
  void setAcik4(String? value) => seriModel = seriModel.copyWith(acik4: value?.isNotEmpty ?? false ? value : null);
}
