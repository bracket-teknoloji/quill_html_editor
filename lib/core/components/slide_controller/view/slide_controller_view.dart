import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

import "../../../base/state/base_state.dart";
import "../../helper_widgets/custom_label_widget.dart";

class SlideControllerWidget extends StatefulWidget {
  final String? title;
  final List<String> childrenTitleList;
  final List childrenValueList;
  final dynamic groupValue;
  final bool? scroll;
  final void Function(int? index) filterOnChanged;
  const SlideControllerWidget({super.key, required this.childrenTitleList, required this.filterOnChanged, required this.childrenValueList, required this.groupValue, this.title, this.scroll = true});

  @override
  State<SlideControllerWidget> createState() => _SlideControllerWidgetState();
}

class _SlideControllerWidgetState extends BaseState<SlideControllerWidget> {
  ScrollController? scrollController;

  @override
  void initState() {
    if (widget.childrenTitleList.length != widget.childrenValueList.length) {
      throw Exception("childrenTitleList ve childrenValueList uzunlukları eşit olmalıdır");
    }
    scrollController = ScrollController();
    Future.delayed(Duration.zero, () async {
      if (widget.scroll ?? false) {
        await scrollController?.animateTo(30, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        await scrollController?.animateTo((scrollController?.positions.isNotEmpty ?? false) ? (scrollController?.position.minScrollExtent ?? 0) : 0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
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
    return CustomWidgetWithLabel(
      text: widget.title,
      child: Column(
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
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(UIHelper.lowPadding),
                        ),
                        value: widget.childrenValueList[listTileIndex],
                        groupValue: widget.groupValue,
                        onChanged: (index) {
                          widget.filterOnChanged(listTileIndex);
                        },
                        child: Text(widget.childrenTitleList[listTileIndex]),
                      )))
        ],
      ),
    ).paddingSymmetric(vertical: UIHelper.lowSize);
  }
}
