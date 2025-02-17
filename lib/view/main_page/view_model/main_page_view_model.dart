import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:mobx/mobx.dart";

import "../model/grid_item_model.dart";
import "../model/menu_item/menu_item_constants.dart";

part "main_page_view_model.g.dart";

final class MainPageViewModel = _MainPageViewModelBase with _$MainPageViewModel;

abstract class _MainPageViewModelBase with Store {
  @observable
  ObservableList<String> titleList = ObservableList.of([if (kIsWeb) "Picker Web Beta", if (!kIsWeb) "Picker"]);

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
  void removeLastItem(BuildContext context) {
    lastItems.removeAt(lastItems.length - 1);
    removeLastTitle();
    if (lastItems.isEmpty) {
      titleList.add("Picker");
      setItems(MenuItemConstants.getList());
    }
  }
}
