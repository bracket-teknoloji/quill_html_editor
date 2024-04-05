import "package:mobx/mobx.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_operator_model.dart";

part "operator_ekle_view_model.g.dart";

class OperatorEkleViewModel = _OperatorEkleViewModelBase with _$OperatorEkleViewModel;

abstract class _OperatorEkleViewModelBase with Store {
  @observable
  OlcumOperatorModel model = OlcumOperatorModel(
    durum: "A",
    isletmeKodu: CacheManager.getIsletmeSube["İşletme"],
  );
}
