import "package:mobx/mobx.dart";
import "package:picker/core/constants/static_variables/static_variables.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "base_talep_teklif_editing_view_model.g.dart";

class BaseTalepTeklifEditingViewModel = _BaseTalepTeklifEditingViewModelBase with _$BaseTalepTeklifEditingViewModel;

abstract class _BaseTalepTeklifEditingViewModelBase with Store {
  @computed
  BaseSiparisEditModel get baseSiparisEditModel => BaseSiparisEditModel.instance;

  @observable
  bool updateKalemler = false;

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
  bool isBaseSiparisEmpty = BaseSiparisEditModel.instance.isEmpty;

  @action
  void changeIsBaseSiparisEmpty(bool value) => isBaseSiparisEmpty = value;
  @action
  void changeFuture() {
    changeIsBaseSiparisEmpty(BaseSiparisEditModel.instance.isEmpty);
  }

  @observable
  bool yeniKaydaHazirlaMi = CacheManager.getProfilParametre.siparisYeniKaydaHazirla;

  @action
  void changeYeniKaydaHazirlaMi() {
    yeniKaydaHazirlaMi = !yeniKaydaHazirlaMi;
    CacheManager.setProfilParametre(
      CacheManager.getProfilParametre.copyWith(talepTeklifYeniKaydaHazirla: yeniKaydaHazirlaMi),
    );
  }
}
