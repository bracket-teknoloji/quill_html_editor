// an extension on a widget to add safe area
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/cache/cache_manager.dart";

extension WidgetExtension on Widget {
  Widget get withSafeArea => SafeArea(child: this);
  Widget get withSizedBox => SizedBox(width: (Get.width - UIHelper.midSize) * 0.45, child: this);
  Widget yetkiVarMi(bool yetki) => yetki ? this : const SizedBox();
}

extension RowExtension on Row {
  Row get withExpanded => Row(children: children.map((Widget e) => Expanded(child: e)).toList());
}

extension YetkiExtension2 on dynamic {
  Object? isDebug() => (CacheManager.getHesapBilgileri?.uyeEmail == "destek@netfect.com" || kDebugMode) ? this : null;
}
