import 'package:mobx/mobx.dart';

part 'checkbox_tile_view_model.g.dart';

// ignore: library_private_types_in_public_api
class CheckBoxTileViewModel = _CheckBoxTileViewModelBase with _$CheckBoxTileViewModel;

abstract class _CheckBoxTileViewModelBase with Store {
  @observable
  List<bool>? valueList;

  @action
  void changeValueList(List<bool> value) {
    valueList = value.asObservable();
  }
}
