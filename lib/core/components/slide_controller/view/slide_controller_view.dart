import 'package:flutter/material.dart';

import '../../../base/state/base_state.dart';

class SlideControllerView extends StatefulWidget {
  final List<String> childrenTitleList;
  final List childrenValueList;
  final dynamic groupValue;
  final void Function(int? index) filterOnChanged;
  const SlideControllerView({super.key, required this.childrenTitleList, required this.filterOnChanged, required this.childrenValueList, required this.groupValue});

  @override
  State<SlideControllerView> createState() => _SlideControllerViewState();
}

class _SlideControllerViewState extends BaseState<SlideControllerView> {
  ScrollController? scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    Future.delayed(Duration.zero, () async {
      await scrollController?.animateTo(30, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
      await scrollController?.animateTo(scrollController?.position.minScrollExtent ?? 0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
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
                itemExtent: widget.childrenTitleList.length < 3 ? width / widget.childrenTitleList.length : null,
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
