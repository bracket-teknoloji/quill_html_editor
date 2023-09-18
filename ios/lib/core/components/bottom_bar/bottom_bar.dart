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
  @override
  Widget build(BuildContext context) {
    // ignore: unnecessary_cast
    List<Widget> list = widget.children.map((e) => e as Widget).toList().cast<Widget>();
    for (int i = 0; i < widget.children.length; i++) {
      if (i * 2 + 1 < list.length) {
        list.insert(i * 2 + 1, const VerticalDivider(width: 1, thickness: 1));
      }
    }
    return ScrollableWidget(
      isScrolledDown: widget.isScrolledDown,
      child: Container(
        color: theme.primaryColor,
        height: context.isPortrait ? (height * 0.07) : (height * 0.1 < 60 ? 60 : height * 0.1),
        child: widget.visible && widget.children.isNotEmpty
            ? Row(
                children: list.map((e) => e.runtimeType != FooterButton ? e : Expanded(child: e)).toList(),
              )
            : null,
      ),
    );
  }
}
