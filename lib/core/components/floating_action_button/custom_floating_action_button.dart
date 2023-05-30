import 'package:flutter/material.dart';

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
    const duration = Duration(milliseconds: 300);
    return AnimatedSlide(
      duration: duration,
      offset: isScrolledDown ? Offset.zero : const Offset(0, 2),
      child: AnimatedOpacity(
        duration: duration,
        opacity: isScrolledDown ? 1 : 0,
        child: FloatingActionButton(
          onPressed: onPressed,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
