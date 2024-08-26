import "package:mobx/mobx.dart";
import "package:picker/view/main_page/model/grid_item_model.dart";

part "main_page_view_model.g.dart";

class MainPageViewModel = _MainPageViewModelBase with _$MainPageViewModel;

abstract class _MainPageViewModelBase with Store {
  @observable
  ObservableList<String> titleList = ObservableList.of(["Picker"]);

  @action
  void addTitle(String value) => titleList.add(value);

  @action
  void removeLastTitle() => titleList.removeAt(titleList.length - 1);

  @observable
  ObservableList<GridItemModel> items = <GridItemModel>[].asObservable();

  @action
  void setItems(List<GridItemModel> value) => items = value.asObservable();

  @observable
  ObservableList<ObservableList<GridItemModel>> lastItems = <ObservableList<GridItemModel>>[].asObservable();

  @action
  void addLastItem(ObservableList<GridItemModel> value) {
    lastItems.add(value);
  }

  @action
  void removeLastItem() {
    lastItems.removeAt(lastItems.length - 1);
    removeLastTitle();
  }
}
