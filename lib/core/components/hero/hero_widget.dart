import "package:flutter/material.dart";

import "../../base/state/base_state.dart";

final class HeroWidget<T> extends StatefulWidget {
  const HeroWidget({required this.child, required this.tag, super.key});
  final Widget child;
  final T tag;

  @override
  State<HeroWidget> createState() => _HeroWidgetState();
}

final class _HeroWidgetState extends BaseState<HeroWidget> {
  @override
  Widget build(BuildContext context) => Column(children: [widget.child, const Text("Deneme")]);
}
