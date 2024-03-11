import "package:flutter/material.dart";

import "../../base/state/base_state.dart";

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
        builder: (context, constraints) => Column(
          children: columnItems,
        ),
      );

  double get rowValue => children.length / widget.splitCount;

  List<Widget> get columnItems {
    final List<Widget> list = <Widget>[];
    if (rowValue % 1 != 0) {
      int sayac = 0;
      while (sayac < children.length - 1) {
        list.add(Row(children: [children[sayac], widget.children[sayac + 1]].map((e) => Expanded(child: e)).toList()));
        sayac += 2;
      }
      list.add(widget.children.last);
    } else {
      int sayac = 0;
      while (sayac < children.length) {
        list.add(Row(children: [children[sayac], widget.children[sayac + 1]].map((e) => Expanded(child: e)).toList()));
        sayac += 2;
      }
    }
    return list;
  }
}
