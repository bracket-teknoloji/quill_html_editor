import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../base/state/base_state.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../button/elevated_buttons/bottom_appbar_button.dart";

class AppBarPreferedSizedBottom extends StatefulWidget implements PreferredSizeWidget {

  const AppBarPreferedSizedBottom({required this.children, super.key}) : filter = null;
  const AppBarPreferedSizedBottom.forStokFilter({required this.children, required this.filter, super.key});
  final List<AppBarButton?> children;
  final Widget? filter;

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
              child: LayoutBuilder(
                builder: (context, constraints) => ListView(
                  shrinkWrap: true,
                  itemExtent: constraints.maxWidth / widget.children.length,
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
            ),
            widget.filter,
          ].nullCheckWithGeneric,
        ),
      );
}
