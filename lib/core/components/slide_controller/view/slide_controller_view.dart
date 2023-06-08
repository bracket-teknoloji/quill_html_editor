import 'package:flutter/material.dart';

class SlideControllerView extends StatefulWidget {
  final List<String> childrenTitleList;
  final List<bool> childrenValueList;
  final bool groupValue;
  final void Function(int? index) filterOnChanged;
  const SlideControllerView({super.key, required this.childrenTitleList, required this.filterOnChanged, required this.childrenValueList, required this.groupValue});

  @override
  State<SlideControllerView> createState() => _SlideControllerViewState();
}

class _SlideControllerViewState extends State<SlideControllerView> {
  ScrollController? scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.childrenTitleList.length,
                itemBuilder: (context, listTileIndex) => RadioMenuButton(
                      value: widget.childrenValueList[listTileIndex],
                      groupValue: widget.groupValue,
                      onChanged: (index) {
                        widget.filterOnChanged(listTileIndex);
                      },
                      child: Text(widget.childrenTitleList[listTileIndex]),
                    )))
      ],
    );
  }
}
