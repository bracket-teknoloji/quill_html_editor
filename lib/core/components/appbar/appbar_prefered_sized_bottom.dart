import "package:flutter/material.dart";
import "package:picker/app/picker_app_imports.dart";

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
        width: (kIsWeb && context.isLandscape) ? width * 0.6 : null,
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
