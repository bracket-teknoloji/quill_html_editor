import 'package:mobx/mobx.dart';

part 'switch_tile_view_model.g.dart';

class DialogSwitchTileViewModel = DialogSwitchTileViewModelBase with _$DialogSwitchTileViewModel;

abstract class DialogSwitchTileViewModelBase with Store {
  @observable
  bool value = false;

  @action
  void changeValue(bool? value) {
    value = value;
  }
}
