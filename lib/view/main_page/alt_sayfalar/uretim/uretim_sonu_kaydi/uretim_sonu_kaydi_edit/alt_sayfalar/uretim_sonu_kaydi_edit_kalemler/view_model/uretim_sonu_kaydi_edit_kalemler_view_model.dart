import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/searchable_mixin.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

import "../../../../../../../../../core/base/view_model/listable_mixin.dart";
import "../../../../../../../../../core/base/view_model/mobx_network_mixin.dart";

part "uretim_sonu_kaydi_edit_kalemler_view_model.g.dart";

final class UretimSonuKaydiEditKalemlerViewModel = _UretimSonuKaydiEditKalemlerViewModelBase
    with _$UretimSonuKaydiEditKalemlerViewModel;

abstract class _UretimSonuKaydiEditKalemlerViewModelBase
    with Store, MobxNetworkMixin, ListableMixin<KalemModel>, SearchableMixin {
  @observable
  @override
  ObservableList<KalemModel>? observableList;

  @action
  @override
  void changeSearchBarStatus() {}
  @observable
  @override
  bool isSearchBarOpen = false;

  @computed
  double? get toplamMiktar => observableList?.map((e) => e.miktar).sum;

  @computed
  double? get toplamMaliyetTutari => observableList?.map((e) => e.maliyetTutari).sum;

  @action
  @override
  void setObservableList(List<KalemModel>? list) => observableList = list?.asObservable();

  @action
  void addItem(KalemModel item) => setObservableList(observableList?.toList()?..add(item));
  @observable
  @override
  String? searchText;

  @action
  @override
  void setSearchText(String? value) => searchText = value;

  @action
  @override
  Future<void> getData() async {}
}
