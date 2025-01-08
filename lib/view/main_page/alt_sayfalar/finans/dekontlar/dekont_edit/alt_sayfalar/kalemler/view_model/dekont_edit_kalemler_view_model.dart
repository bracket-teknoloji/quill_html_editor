import "package:collection/collection.dart";
import "package:mobx/mobx.dart";

import "../../../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../model/dekont_islemler_request_model.dart";

part "dekont_edit_kalemler_view_model.g.dart";

final class DekontEditKalemlerViewModel = _DekontEditKalemlerViewModelBase with _$DekontEditKalemlerViewModel;

abstract class _DekontEditKalemlerViewModelBase with Store {
  @observable
  DekontIslemlerRequestModel dekontIslemlerRequestModel = SingletonDekontIslemlerRequestModel.instance;

  @action
  void setSingleton() => SingletonDekontIslemlerRequestModel.setInstance(dekontIslemlerRequestModel);

  @computed
  List<DekontKalemler>? get kalemler => dekontIslemlerRequestModel.kalemler;

  @computed
  double get toplamBorc => kalemler?.where((element) => element.ba == "B").map((element) => element.tutar ?? 0).sum ?? 0;

  @computed
  double get toplamAlacak => kalemler?.where((element) => element.ba == "A").map((element) => element.tutar ?? 0).sum ?? 0;

  @action
  void addKalemler(DekontKalemler? model) {
    dekontIslemlerRequestModel = dekontIslemlerRequestModel.copyWith(kalemler: [...kalemler ?? [], model].nullCheckWithGeneric.cast<DekontKalemler>());
    setSingleton();
  }

  @action
  void updateKalemler(int index, DekontKalemler model) {
    final List<DekontKalemler> list = (kalemler?..removeAt(index)) ?? [];
    dekontIslemlerRequestModel = dekontIslemlerRequestModel.copyWith(kalemler: null);
    dekontIslemlerRequestModel = dekontIslemlerRequestModel.copyWith(kalemler: [...list.nullCheckWithGeneric.cast<DekontKalemler>(), model]);
    setSingleton();
    dekontIslemlerRequestModel = SingletonDekontIslemlerRequestModel.instance;
  }

  @action
  void removeKalemler(int index) {
    final List<DekontKalemler> list = (kalemler?..removeAt(index)) ?? [];
    dekontIslemlerRequestModel = dekontIslemlerRequestModel.copyWith(kalemler: null);
    dekontIslemlerRequestModel = dekontIslemlerRequestModel.copyWith(kalemler: list.nullCheckWithGeneric.cast<DekontKalemler>());
    setSingleton();
    dekontIslemlerRequestModel = SingletonDekontIslemlerRequestModel.instance;
  }
}
