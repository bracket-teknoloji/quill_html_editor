import "package:flutter/material.dart";

import "../../constants/ui_helper/duration_helper.dart";

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
    required this.isScrolledDown,
    this.onPressed,
  });
  final bool isScrolledDown;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: DurationHelper.durationLow,
      offset: isScrolledDown ? Offset.zero : const Offset(0, 2),
      child: AnimatedOpacity(
        duration: DurationHelper.durationLow,
        opacity: isScrolledDown ? 1 : 0,
        child: FloatingActionButton(
          onPressed: onPressed,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
