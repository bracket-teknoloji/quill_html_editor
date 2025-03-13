import "package:mobx/mobx.dart";
import "package:picker/core/base/view_model/listable_mixin.dart";
import "package:picker/core/base/view_model/mobx_network_mixin.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

part "uretim_fire_bilgileri_view_model.g.dart";

final class UretimFireBilgileriViewModel = _UretimFireBilgileriViewModelBase with _$UretimFireBilgileriViewModel;

abstract class _UretimFireBilgileriViewModelBase with Store, MobxNetworkMixin, ListableMixin<KalemFireModel> {
  _UretimFireBilgileriViewModelBase(this.model);

  @observable
  late KalemModel model;

  @observable
  KalemFireModel fireModel = KalemFireModel();

  @action
  void addFireModel(KalemFireModel value) {
    if (model.fireListe?.any((element) => element.kodu == value.kodu) ?? false) {
      model = model.copyWith(
        fireListe:
            model.fireListe?.map((e) {
              if (e.kodu == value.kodu) {
                return e.copyWith(miktar: (e.miktar ?? 0) + (value.miktar ?? 0));
              }
              return e;
            }).toList(),
      );
    } else {
      model = model.copyWith(fireListe: [...(model.fireListe ?? <KalemFireModel>[]), value].toList());
    }
    clearFireModel();
  }

  @action
  void removeFireModel(KalemFireModel value) {
    model = model.copyWith(fireListe: model.fireListe?.where((element) => element.kodu != value.kodu).toList());
  }

  @action
  void setFireModel(KalemFireModel value) => fireModel = value;

  @action
  void clearFireModel() => fireModel = KalemFireModel();

  @action
  @override
  Future<void> getData() async => setObservableList(await networkManager.getKalemFireModel());

  @observable
  @override
  ObservableList<KalemFireModel>? observableList;

  @action
  @override
  void setObservableList(List<KalemFireModel>? list) => observableList = list?.asObservable();
}
