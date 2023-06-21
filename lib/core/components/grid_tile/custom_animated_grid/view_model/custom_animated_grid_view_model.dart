import 'package:mobx/mobx.dart';

import '../../../../../view/main_page/model/grid_item_model.dart';

part 'custom_animated_grid_view_model.g.dart';

class CustomAnimatedGridViewModel = _CustomAnimatedGridViewModelBase with _$CustomAnimatedGridViewModel;

abstract class _CustomAnimatedGridViewModelBase with Store {
  @observable
  ObservableList<GridItemModel>? gridItemModelList;

  @observable
  ObservableList<ObservableList<GridItemModel>> returnGridItemModel = <ObservableList<GridItemModel>>[].asObservable();

  @action
  void setGridItemModel(List<GridItemModel>? value) => gridItemModelList = value?.asObservable();

  @action
  void addReturnGridItemModel(List<GridItemModel>? value) => returnGridItemModel.add(value?.asObservable() ?? ObservableList.of([]));

  @action
  void deleteLastReturnGridItemModel() => returnGridItemModel.removeLast();
}
