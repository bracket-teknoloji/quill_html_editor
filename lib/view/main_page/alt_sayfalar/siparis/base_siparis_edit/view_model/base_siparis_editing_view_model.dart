import "package:mobx/mobx.dart";
import "package:picker/core/init/cache/cache_manager.dart";

import "../../../../../../core/constants/static_variables/static_variables.dart";
import "../model/base_siparis_edit_model.dart";

part "base_siparis_editing_view_model.g.dart";

class BaseSiparisEditingViewModel = _BaseSiparisEditingViewModelBase with _$BaseSiparisEditingViewModel;

abstract class _BaseSiparisEditingViewModelBase with Store {
  @observable
  int pageIndex = 0;

  @observable
  bool isValid = (StaticVariables.instance.siparisGenelFormKey.currentState?.validate() ?? false);

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
    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(siparisYeniKaydaHazirla: yeniKaydaHazirlaMi));
  }
}
