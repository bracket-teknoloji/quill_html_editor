import "package:flutter/material.dart";
import "../../base/state/base_state.dart";

class HeroWidget extends StatefulWidget {
  final Widget child;
  final dynamic tag;
  const HeroWidget({super.key, required this.child, this.tag});

  @override
  State<HeroWidget> createState() => _HeroWidgetState();
}

class _HeroWidgetState extends BaseState<HeroWidget> {
  @override
  Widget build(BuildContext context) => Column(
        children: [
          widget.child,
          const Text("Deneme"),
        ],
      );
}
