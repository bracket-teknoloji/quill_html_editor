import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../base/state/base_state.dart";
import "../../../constants/ui_helper/ui_helper.dart";
import "../../helper_widgets/custom_label_widget.dart";

/// merhaba ben volkan konak
class SlideControllerWidget extends StatefulWidget {
  final String? title;
  final List<String> childrenTitleList;
  final List childrenValueList;
  final dynamic groupValue;
  final bool? scroll;
  final void Function(int? index) filterOnChanged;
  const SlideControllerWidget({super.key, required this.childrenTitleList, required this.filterOnChanged, required this.childrenValueList, required this.groupValue, this.title, this.scroll = true})
      : assert(childrenTitleList.length == childrenValueList.length);

  @override
  State<SlideControllerWidget> createState() => _SlideControllerWidgetState();
}

class _SlideControllerWidgetState extends BaseState<SlideControllerWidget> {
  late final ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.scroll ?? false) {
        await scrollController.animateTo(30, duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
        if (!scrollController.hasClients) {
          await scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => CustomWidgetWithLabel(
        text: widget.title,
        addPadding: false,
        child: SizedBox(
          height: UIHelper.midSize * 3,
          width: double.infinity,
          child: ListView.builder(
            controller: scrollController,
            scrollDirection: Axis.horizontal,
            itemExtent: widget.childrenTitleList.length < 3 ? width / widget.childrenTitleList.length : null,
            itemCount: widget.childrenTitleList.length,
            itemBuilder: (context, listTileIndex) => RadioMenuButton(
              style: ButtonStyle(
                // padding: MaterialStateProperty.all(EdgeInsets.zero),
                shape: WidgetStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(UIHelper.lowSize), side: BorderSide(color: theme.colorScheme.primary.withOpacity(0.2)))),
              ),
              value: widget.childrenValueList[listTileIndex],
              groupValue: widget.groupValue,
              onChanged: (index) => widget.filterOnChanged(listTileIndex),
              child: Text(widget.childrenTitleList[listTileIndex]),
            ).paddingOnly(right: UIHelper.lowSize),
          ),
        ),
      ).paddingAll(UIHelper.lowSize);
}
