import 'package:mobx/mobx.dart';
import 'package:picker/view/main_page/view/grid_items.dart';
part 'custom_animated_grid_view_model.g.dart';

class CustomAnimatedGridViewModel = _CustomAnimatedGridViewModelBase with _$CustomAnimatedGridViewModel;

abstract class _CustomAnimatedGridViewModelBase with Store {
  @observable
  ObservableList<GridItems>? gridItems;

  @action
  void setGridItems(List<GridItems>? value) => gridItems = value?.asObservable();
}