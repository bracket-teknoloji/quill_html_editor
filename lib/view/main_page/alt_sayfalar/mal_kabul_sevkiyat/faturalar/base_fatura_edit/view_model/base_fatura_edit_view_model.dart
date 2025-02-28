import "dart:convert";

import "package:mobx/mobx.dart";

import "../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "base_fatura_edit_view_model.g.dart";

final class BaseFaturaEditViewModel = _BaseFaturaEditViewModelBase with _$BaseFaturaEditViewModel;

abstract class _BaseFaturaEditViewModelBase with Store {
  @observable
  BaseSiparisEditModel baseSiparisEditModel = BaseSiparisEditModel.instance;

  @action
  void setCariKodu(CariListesiModel? value) {
    baseSiparisEditModel = baseSiparisEditModel.copyWith(
      cariKodu: value?.cariKodu,
      cariAdi: value?.cariAdi,
      belgeTipi: int.tryParse(value?.odemeTipi ?? "0"),
    );
    BaseSiparisEditModel.setInstance(baseSiparisEditModel);
  }

  @action
  void setBelgeNo(List<BaseSiparisEditModel>? value) {
    baseSiparisEditModel = baseSiparisEditModel.copyWith(arrBelgeNo: jsonEncode(value?.map((e) => e.belgeNo).toList()));
    BaseSiparisEditModel.setInstance(baseSiparisEditModel);
  }

  @action
  void setKalemList(List<KalemModel>? value) {
    baseSiparisEditModel = baseSiparisEditModel.copyWith(kalemList: value);
    BaseSiparisEditModel.setInstance(baseSiparisEditModel);
  }

  @observable
  bool updateKalemler = true;

  @action
  void changeUpdateKalemler() => updateKalemler = !updateKalemler;
  @observable
  int pageIndex = 0;

  @observable
  bool isValid = StaticVariables.instance.siparisGenelFormKey.currentState?.validate() ?? false;

  @action
  void changeIsValid() => isValid = StaticVariables.instance.siparisGenelFormKey.currentState?.validate() ?? false;

  @action
  void changePageIndex(int value) => pageIndex = value;
  @observable
  bool isLastPage = false;

  @action
  void changeIsLastPage(bool value) => isLastPage = value;

  @computed
  int get getKalemCount => BaseSiparisEditModel.instance.getKalemSayisi;

  @observable
  bool showLoading = BaseSiparisEditModel.instance.isEmpty;

  @action
  void setLoading(bool value) => showLoading = value;
  @action
  void changeFuture() {
    setLoading(BaseSiparisEditModel.instance.isEmpty);
  }

  @observable
  bool yeniKaydaHazirlaMi = CacheManager.getProfilParametre.siparisYeniKaydaHazirla;

  @action
  void changeYeniKaydaHazirlaMi() {
    yeniKaydaHazirlaMi = !yeniKaydaHazirlaMi;
    CacheManager.setProfilParametre(
      CacheManager.getProfilParametre.copyWith(faturaYeniKaydaHazirla: yeniKaydaHazirlaMi),
    );
  }
}
