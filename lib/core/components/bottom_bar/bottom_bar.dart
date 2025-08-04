import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "../../base/state/base_state.dart";
import "../button/elevated_buttons/footer_button.dart";
import "../helper_widgets/scrollable_widget.dart";

final class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({required this.isScrolledDown, required this.children, super.key, this.visible = true});
  final bool isScrolledDown;
  final bool visible;
  final List<FooterButton> children;

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

final class _BottomBarWidgetState extends BaseState<BottomBarWidget> {
  List<Widget> list = [];

  @override
  void initState() {
    list.addAll(widget.children);
    for (int i = 0; i < widget.children.length; i++) {
      if (i * 2 + 1 < list.length) {
        list.insert(i * 2 + 1, const VerticalDivider(width: 1, thickness: 1));
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) => widget.visible && widget.children.isNotEmpty
      ? Container(
          constraints: const BoxConstraints(maxHeight: kBottomNavigationBarHeight * 1.2),
          child: ScrollableWidget(
            isScrolledDown: kIsWeb ? true : widget.isScrolledDown,
            child: Container(
              color: theme.appBarTheme.systemOverlayStyle?.statusBarColor,
              // width: kIsWeb && context.isLandscape ? (width * 0.5) : null,
              // constraints: kIsWeb && context.isLandscape ? BoxConstraints(maxWidth: width * 0.5) : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                // RunTimeType kontrolü yapılıyor. Eğer FooterButton değilse Expanded ile sarılıyor. Vertical Divider'lar yüzünden yapılıyor.
                children: list.map((e) => e.runtimeType != FooterButton ? e : Expanded(child: e)).toList(),
              ),
            ),
          ),
        )
      : const SizedBox.shrink();
}
