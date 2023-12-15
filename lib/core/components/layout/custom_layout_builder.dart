import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";

class CustomLayoutBuilder extends StatefulWidget {
  final List<Widget> children;
  final int splitCount;
  const CustomLayoutBuilder({super.key, required this.splitCount, required this.children});

  @override
  State<CustomLayoutBuilder> createState() => _CustomLayoutBuilderState();
}

class _CustomLayoutBuilderState extends BaseState<CustomLayoutBuilder> {
  List<Widget> get children => widget.children.where((element) => element is! SizedBox).toList().cast<Widget>();

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) {
          final double width = constraints.maxWidth;
          final double itemWidth = width / widget.splitCount;
          return Wrap(
            children: children
                .map(
                  (e) => SizedBox(
                    width: itemWidth,
                    child: e,
                  ),
                )
                .toList(),
          );
        },
      );
}
