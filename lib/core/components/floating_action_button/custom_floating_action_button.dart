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
  Widget build(BuildContext context) => AnimatedSlide(
        duration: DurationHelper.durationLow,
        offset: isScrolledDown ? Offset.zero : const Offset(1, 2),
        child: AnimatedScale(
          duration: DurationHelper.durationLow,
          scale: isScrolledDown ? 1 : 0,
          child: FloatingActionButton(
            onPressed: onPressed,
            child: const Icon(Icons.add),
          ),
        ),
      );
}
