import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../base/state/base_state.dart";
import "../button/elevated_buttons/footer_button.dart";
import "../helper_widgets/scrollable_widget.dart";

class BottomBarWidget extends StatefulWidget {
  final bool isScrolledDown;
  final bool visible;
  final List<FooterButton> children;
  const BottomBarWidget({super.key, required this.isScrolledDown, required this.children, this.visible = true});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends BaseState<BottomBarWidget> {
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
  Widget build(BuildContext context) => ScrollableWidget(
        isScrolledDown: widget.isScrolledDown,
        child: Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            color: theme.appBarTheme.systemOverlayStyle?.statusBarColor,
            height: context.isPortrait ? (height * 0.07) : (height * 0.1 < 60 ? 60 : height * 0.1),
            width: kIsWeb && context.isLandscape ? (width * 0.5) : null,
            child: widget.visible && widget.children.isNotEmpty
                ? Row(
                    // RunTimeType kontrolü yapılıyor. Eğer FooterButton değilse Expanded ile sarılıyor. Vertical Divider'lar yüzünden yapılıyor.
                    children: list.map((e) => e.runtimeType != FooterButton ? e : Expanded(child: e)).toList(),
                  )
                : null,
          ),
        ),
      );
}
