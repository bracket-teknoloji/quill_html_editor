import "package:mobx/mobx.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/model/hucre_transferi_model.dart";

part "base_hucre_kalemler_view_model.g.dart";

class BaseHucreKalemlerViewModel = _BaseHucreKalemlerViewModelBase with _$BaseHucreKalemlerViewModel;

abstract class _BaseHucreKalemlerViewModelBase with Store {
  @observable
  HucreTransferiModel model = SingletonModels.hucreTransferiModel;
}
