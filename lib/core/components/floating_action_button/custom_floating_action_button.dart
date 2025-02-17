import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "../../constants/ui_helper/duration_helper.dart";

final class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({required this.isScrolledDown, super.key, this.onPressed});
  final bool isScrolledDown;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) => AnimatedSlide(
    duration: DurationHelper.durationLow,
    offset: Offset.zero,
    // offset: kIsWeb || isScrolledDown ? Offset.zero : const Offset(1, 2),
    child: AnimatedScale(
      duration: DurationHelper.durationLow,
      scale: kIsWeb || isScrolledDown ? 1 : 0,
      child: FloatingActionButton(onPressed: onPressed, child: const Icon(Icons.add)),
    ),
  );
}
