import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../base/state/base_state.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../button/elevated_buttons/bottom_appbar_button.dart";

class AppBarPreferedSizedBottom extends StatefulWidget implements PreferredSizeWidget {
  final List<AppBarButton?> children;
  const AppBarPreferedSizedBottom({super.key, required this.children});

  @override
  State<AppBarPreferedSizedBottom> createState() => _AppBarPreferedSizedBottomState();

  @override
  Size get preferredSize => Size.fromHeight(Get.height * 0.07);
}

class _AppBarPreferedSizedBottomState extends BaseState<AppBarPreferedSizedBottom> {
  @override
  Widget build(BuildContext context) => SizedBox(
      height: height * 0.07,
      child: ListView(
        shrinkWrap: true,
        itemExtent: width * (1 / widget.children.nullCheck.length < 0.2 ? 0.2 : 1 / widget.children.nullCheck.length),
        scrollDirection: Axis.horizontal,
        children: widget.children.nullCheck.map((AppBarButton? e) => e?.paddingSymmetric(horizontal: UIHelper.midSize, vertical: UIHelper.lowSize)).toList().nullCheckWithGeneric,
      ),
    );
}
