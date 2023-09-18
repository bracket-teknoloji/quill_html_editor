//extension on a list for padding all items
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

extension ListExtension<T> on List<T> {
  List<Padding> get withPadding {
    return map((e) => Padding(
          padding: EdgeInsets.all(UIHelper.lowSize),
          child: e as Widget,
        )).toList();
  }
}

// an extension on a list of widget to add sized box between items
extension ListExtension2<T> on List<T> {
  List<Widget> get withSizedBox {
    return map((e) => SizedBox(
          width: (Get.width - UIHelper.midSize) * 0.45,
          child: e as Widget,
        )).toList();
  }
}

// an extension on a list or ObservableList to check is empty or null
extension ListExtension3<T> on List<T>? {
  bool get isEmptyOrNull {
    return this == null || this!.isEmpty;
  }
}

extension ListExtension4<T> on List? {
  List<T> cast(T model) {
    return this!.map((e) => e as T).toList().cast<T>();
  }
}

extension NotNullExtension<T> on List<T> {
  List<T> get nullCheck {
    return where((element) => element != null).toList().cast<T>();
  }
}

extension ListGenericNullCheck<T> on List<T?> {
  List<T> get nullCheckWithGeneric {
    return whereType<T>().toList();
  }
}
