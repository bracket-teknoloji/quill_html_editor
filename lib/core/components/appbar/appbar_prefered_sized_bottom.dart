import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../base/state/base_state.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../button/elevated_buttons/bottom_appbar_button.dart";

class AppBarPreferedSizedBottom extends StatefulWidget implements PreferredSizeWidget {
  final List<AppBarButton?> children;
  final Widget? filter;

  const AppBarPreferedSizedBottom({super.key, required this.children}) : filter = null;
  const AppBarPreferedSizedBottom.forStokFilter({super.key, required this.children, required this.filter});

  @override
  State<AppBarPreferedSizedBottom> createState() => _AppBarPreferedSizedBottomState();

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);

  double get toolbarHeight => kToolbarHeight * (filter is! SizedBox && filter != null ? 3 : 1);
}

class _AppBarPreferedSizedBottomState extends BaseState<AppBarPreferedSizedBottom> {
  @override
  Widget build(BuildContext context) => SizedBox(
        height: widget.toolbarHeight,
        child: Column(
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                itemExtent: width * (1 / widget.children.nullCheck.length < 0.2 ? 0.2 : 1 / widget.children.nullCheck.length),
                scrollDirection: Axis.horizontal,
                children: widget.children.nullCheck
                    .map(
                      (e) => e?.paddingSymmetric(
                        horizontal: UIHelper.lowSize,
                        vertical: UIHelper.lowSize,
                      ),
                    )
                    .toList()
                    .nullCheckWithGeneric,
              ),
            ),
            widget.filter,
          ].nullCheckWithGeneric,
        ),
      );
}
