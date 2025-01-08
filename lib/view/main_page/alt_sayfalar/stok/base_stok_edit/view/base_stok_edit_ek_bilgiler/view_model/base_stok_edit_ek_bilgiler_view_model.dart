import "package:mobx/mobx.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

part "base_stok_edit_ek_bilgiler_view_model.g.dart";

final class BaseStokEditEkBilgilerViewModel = _BaseStokEditEkBilgilerViewModelBase with _$BaseStokEditEkBilgilerViewModel;

abstract class _BaseStokEditEkBilgilerViewModelBase with Store {
  @observable
  StokListesiModel stokListesiModel = StokListesiModel.instance;

  @action
  void set1s(String? value) {
    stokListesiModel = stokListesiModel.copyWith(kull1s: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set2s(String? value) {
    stokListesiModel = stokListesiModel.copyWith(kull2s: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set3s(String? value) {
    stokListesiModel = stokListesiModel.copyWith(kull3s: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set4s(String? value) {
    stokListesiModel = stokListesiModel.copyWith(kull4s: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set5s(String? value) {
    stokListesiModel = stokListesiModel.copyWith(kull5s: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set6s(String? value) {
    stokListesiModel = stokListesiModel.copyWith(kull6s: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set7s(String? value) {
    stokListesiModel = stokListesiModel.copyWith(kull7s: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set8s(String? value) {
    stokListesiModel = stokListesiModel.copyWith(kull8s: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set1n(double? value) {
    stokListesiModel = stokListesiModel.copyWith(kull1n: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set2n(double? value) {
    stokListesiModel = stokListesiModel.copyWith(kull2n: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set3n(double? value) {
    stokListesiModel = stokListesiModel.copyWith(kull3n: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set4n(double? value) {
    stokListesiModel = stokListesiModel.copyWith(kull4n: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set5n(double? value) {
    stokListesiModel = stokListesiModel.copyWith(kull5n: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set6n(double? value) {
    stokListesiModel = stokListesiModel.copyWith(kull6n: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set7n(double? value) {
    stokListesiModel = stokListesiModel.copyWith(kull7n: value);
    StokListesiModel.setInstance(stokListesiModel);
  }

  @action
  void set8n(double? value) {
    stokListesiModel = stokListesiModel.copyWith(kull8n: value);
    StokListesiModel.setInstance(stokListesiModel);
  }
}
