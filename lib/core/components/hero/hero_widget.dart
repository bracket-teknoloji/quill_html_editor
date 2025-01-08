import "package:flutter/material.dart";

import "../../base/state/base_state.dart";

final class HeroWidget extends StatefulWidget {
  const HeroWidget({required this.child, super.key, this.tag});
  final Widget child;
  final dynamic tag;

  @override
  State<HeroWidget> createState() => _HeroWidgetState();
}

final class _HeroWidgetState extends BaseState<HeroWidget> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          widget.child,
          const Text("Deneme"),
        ],
      );
}
