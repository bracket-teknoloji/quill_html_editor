import "package:flutter/material.dart";

import "../../constants/ui_helper/duration_helper.dart";

class ScrollableWidget extends StatefulWidget {
  final Widget child;
  final bool isScrolledDown;
  const ScrollableWidget(
      {super.key, required this.child, required this.isScrolledDown});

  @override
  State<ScrollableWidget> createState() => _ScrollableWidgetState();
}

class _ScrollableWidgetState extends State<ScrollableWidget> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: DurationHelper.durationLow,
      offset: widget.isScrolledDown ? Offset.zero : const Offset(0, 2),
      child: AnimatedOpacity(
        duration: DurationHelper.durationLow,
        opacity: widget.isScrolledDown ? 1 : 0,
        child: widget.child,
      ),
    );
  }
}
