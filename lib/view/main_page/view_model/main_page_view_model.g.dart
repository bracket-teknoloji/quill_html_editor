// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_page_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MainPageViewModel on _MainPageViewModelBase, Store {
  late final _$titleListAtom = Atom(
    name: '_MainPageViewModelBase.titleList',
    context: context,
  );

  @override
  ObservableList<String> get titleList {
    _$titleListAtom.reportRead();
    return super.titleList;
  }

  @override
  set titleList(ObservableList<String> value) {
    _$titleListAtom.reportWrite(value, super.titleList, () {
      super.titleList = value;
    });
  }

  late final _$itemsAtom = Atom(
    name: '_MainPageViewModelBase.items',
    context: context,
  );

  @override
  ObservableList<GridItemModel> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<GridItemModel> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$lastItemsAtom = Atom(
    name: '_MainPageViewModelBase.lastItems',
    context: context,
  );

  @override
  ObservableList<ObservableList<GridItemModel>> get lastItems {
    _$lastItemsAtom.reportRead();
    return super.lastItems;
  }

  @override
  set lastItems(ObservableList<ObservableList<GridItemModel>> value) {
    _$lastItemsAtom.reportWrite(value, super.lastItems, () {
      super.lastItems = value;
    });
  }

  late final _$_MainPageViewModelBaseActionController = ActionController(
    name: '_MainPageViewModelBase',
    context: context,
  );

  @override
  void addTitle(String value) {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
      name: '_MainPageViewModelBase.addTitle',
    );
    try {
      return super.addTitle(value);
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeLastTitle() {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
      name: '_MainPageViewModelBase.removeLastTitle',
    );
    try {
      return super.removeLastTitle();
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setItems(List<GridItemModel> value) {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
      name: '_MainPageViewModelBase.setItems',
    );
    try {
      return super.setItems(value);
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addLastItem(ObservableList<GridItemModel> value) {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
      name: '_MainPageViewModelBase.addLastItem',
    );
    try {
      return super.addLastItem(value);
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeLastItem(BuildContext context) {
    final _$actionInfo = _$_MainPageViewModelBaseActionController.startAction(
      name: '_MainPageViewModelBase.removeLastItem',
    );
    try {
      return super.removeLastItem(context);
    } finally {
      _$_MainPageViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titleList: ${titleList},
items: ${items},
lastItems: ${lastItems}
    ''';
  }
}
