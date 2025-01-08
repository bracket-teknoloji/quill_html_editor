import "package:flutter/gestures.dart";
import "package:flutter/material.dart";

final class MouseRightClickListener extends StatelessWidget {
  const MouseRightClickListener({required this.child, required this.onRightClick, super.key});

  final Widget child;

  final Function onRightClick;

  @override
  Widget build(BuildContext context) => Listener(
        onPointerDown: (event) {
          if (event.kind == PointerDeviceKind.mouse && event.buttons == 2) {
            onRightClick();
          }
        },
        child: child,
      );
}
