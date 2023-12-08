import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

class CustomLayoutBuilder extends StatefulWidget {
  final List<Widget> children;
  final int splitCount;
  const CustomLayoutBuilder({super.key, required this.children, required this.splitCount});

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
                  ).paddingOnly(),
                )
                .toList(),
          );
        },
      ).paddingSymmetric(horizontal: UIHelper.lowSize);
}
