// an extension on a widget to add safe area
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/cache/cache_manager.dart";

import "../ui_helper/duration_helper.dart";

extension WidgetExtension on Widget {
  Widget get withSafeArea {
    return SafeArea(
      child: this,
    );
  }
}

//an extension on a widget to wrap a sizedBox and height will be 0.5 of the screen height
extension WidgetExtension2 on Widget {
  Widget get withSizedBox {
    return SizedBox(
      width: (Get.width - UIHelper.midSize) * 0.45,
      child: this,
    );
  }
}

// an extension on a row widget to wrap all children with expanded
extension RowExtension on Row {
  Row get withExpanded {
    return Row(
      children: children.map((e) => Expanded(child: e)).toList(),
    );
  }
}

extension YetkiExtension on Widget {
  Widget yetkiVarMi(bool yetki) {
    return yetki ? this : const SizedBox();
  }
}

extension YetkiExtension2 on dynamic {
  Object? isDebug() {
    return (CacheManager.getHesapBilgileri?.uyeEmail == "destek@netfect.com" || kDebugMode) ? this : null;
  }
}

extension ScrollAnimated on Widget? {
  Widget scrollAnimated(bool isScrolledDown) {
    return AnimatedSlide(
      duration: DurationHelper.durationLow,
      offset: isScrolledDown ? Offset.zero : const Offset(0, 2),
      child: AnimatedOpacity(
        duration: DurationHelper.durationLow,
        opacity: isScrolledDown ? 1 : 0,
        child: this,
      ),
    );
  }
}
