import "package:mobx/mobx.dart";

import "../../../../../../core/init/cache/cache_manager.dart";
import "../../olcum_ekle/model/olcum_operator_model.dart";

part "operator_ekle_view_model.g.dart";

final class OperatorEkleViewModel = _OperatorEkleViewModelBase with _$OperatorEkleViewModel;

abstract class _OperatorEkleViewModelBase with Store {
  @observable
  OlcumOperatorModel model = OlcumOperatorModel(
    durum: "A",
    isletmeKodu: CacheManager.getIsletmeSube["İşletme"],
  );
}
