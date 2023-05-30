import 'package:mobx/mobx.dart';

import '../../../../../../../../core/init/cache/cache_manager.dart';
import '../../../../../../model/main_page_model.dart';
import '../../../../../../model/param_model.dart';

part 'base_stok_edit_fiyat_view_model.g.dart';

class BaseStokEditFiyatViewModel = _BaseStokEditFiyatViewModelBase with _$BaseStokEditFiyatViewModel;

abstract class _BaseStokEditFiyatViewModelBase with Store {
  MainPageModel? get mainPageModel => CacheManager.getAnaVeri();
  @computed
  Map<int, String> get dovizList {
    Map<int, String> map = {};
    for (DovizList element in mainPageModel?.paramModel?.dovizList ?? []) {
      map[element.dovizTipi ?? 0] = element.isim ?? "";
    }
    return map;
  }

  @observable
  ObservableList<double>? kdvOraniList;

  @action
  void setKdvOraniList(List<double> value) => kdvOraniList = value.asObservable();
}
