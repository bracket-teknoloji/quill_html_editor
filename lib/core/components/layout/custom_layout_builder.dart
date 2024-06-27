import "package:flutter/material.dart";

import "../../base/state/base_state.dart";

class CustomLayoutBuilder extends StatefulWidget {
  final List<Widget> children;
  final int splitCount;
  final bool? lastItemExpanded;
  const CustomLayoutBuilder({super.key, required this.splitCount, required this.children, this.lastItemExpanded});
  const CustomLayoutBuilder.divideInHalf({super.key,required this.children, this.lastItemExpanded}) : splitCount = 2;

  @override
  State<CustomLayoutBuilder> createState() => _CustomLayoutBuilderState();
}

class _CustomLayoutBuilderState extends BaseState<CustomLayoutBuilder> {
  List<Widget> get children => widget.children.where((element) => element is! SizedBox).toList().cast<Widget>();

  @override
  Widget build(BuildContext context) => Column(
        children: columnItems,
      );

  int get rowValue => children.length % widget.splitCount;

  List<Widget> get columnItems {
    final List<Widget> list = <Widget>[];
    if (rowValue != 0) {
      int sayac = 0;
      while (sayac < children.length - 1) {
        final List<Widget> rowChildren = [];
        for (int i = 0; i < widget.splitCount; i++) {
          rowChildren.add(children[sayac]);
          sayac++;
        }
        list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rowChildren.map((e) => Expanded(child: e)).toList(),
          ),
        );
      }
      if (widget.lastItemExpanded == true) {
        list.add(children.last);
      } else {
        list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: children.last),
            ],
          ),
        );
      }
    } else {
      int sayac = 0;
      while (sayac < children.length) {
        final List<Widget> rowChildren = [];
        for (int i = 0; i < widget.splitCount; i++) {
          rowChildren.add(children[sayac]);
          sayac++;
        }
        list.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: rowChildren.map((e) => Expanded(child: e)).toList(),
          ),
        );
      }
    }
    return list;
  }
}
