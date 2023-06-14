import 'package:mobx/mobx.dart';
import 'package:picker/view/main_page/view/grid_items.dart';

part 'custom_animated_grid_view_model.g.dart';

class CustomAnimatedGridViewModel = _CustomAnimatedGridViewModelBase with _$CustomAnimatedGridViewModel;

abstract class _CustomAnimatedGridViewModelBase with Store {
  @observable
  ObservableList<GridItems>? gridItems;

  @observable
  ObservableList<ObservableList<GridItems>> returnGridItems = <ObservableList<GridItems>>[].asObservable();

  @action
  void setGridItems(List<GridItems>? value) => gridItems = value?.asObservable();

  @action
  void addReturnGridItems(List<GridItems>? value) => returnGridItems.add(value?.asObservable() ?? ObservableList.of([]));

  @action
  void deleteLastReturnGridItems() => returnGridItems.removeLast();
}
