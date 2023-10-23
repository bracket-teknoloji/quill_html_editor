import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:quill_html_editor/quill_html_editor.dart";

import "../../../../../../../../core/base/model/base_edit_model.dart";
// import "package:get/get.dart";
// import "package:html_editor_enhanced/html_editor.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../siparisler/model/siparis_edit_request_model.dart";
// import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../model/base_siparis_edit_model.dart";
import "../view_model/base_siparisler_diger_view_model.dart";

class BaseSiparislerDigerView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseSiparislerDigerView({super.key, required this.model});

  @override
  State<BaseSiparislerDigerView> createState() => _BaseSiparislerDigerViewState();
}

class _BaseSiparislerDigerViewState extends BaseState<BaseSiparislerDigerView> {
  // late final HtmlEditorController _htmlController;
  BaseSiparislerDigerViewModel viewModel = BaseSiparislerDigerViewModel();
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  bool get enable => widget.model.enable;
  late final QuillEditorController controller;

  @override
  void initState() {
    // _htmlController = HtmlEditorController();
    controller = QuillEditorController();
    super.initState();
  }

  @override
  void dispose() {
    if (controller.isEnable) {
      controller.dispose();
    }
    // _htmlController.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Expanded(
            child: Card(
              elevation: UIHelper.highSize,
              child: QuillHtmlEditor(
                hintText: "Buraya notlarınızı yazabilirsiniz.",
                controller: controller,
                isEnabled: enable,
                minHeight: height,
                hintTextAlign: TextAlign.start,
                padding: EdgeInsets.only(left: UIHelper.midSize, top: UIHelper.lowSize),
                hintTextPadding: EdgeInsets.zero,
                inputAction: InputAction.newline,
                textStyle: const TextStyle(color: Colors.white),
                backgroundColor: theme.colorScheme.background,
                onTextChanged: (text) => text != "" ? model.ekAciklama = text : null,
                onEditorCreated: () async {
                  if (model.ekAciklama != null) {
                    await controller.insertText(model.ekAciklama ?? "");
                  }
                },
                loadingBuilder: (context) => const Center(child: CircularProgressIndicator.adaptive()),
              ),
            ).paddingSymmetric(vertical: UIHelper.midSize, horizontal: UIHelper.lowSize),
          ),
          SafeArea(
            child: Visibility(
              visible: enable,
              child: Card(
                child: ToolBar.scroll(
                  toolBarColor: Colors.transparent,
                  iconColor: Colors.white,
                  activeIconColor: UIHelper.primaryColor,
                  padding: UIHelper.midPadding,
                  iconSize: 20,
                  controller: controller,
                  toolBarConfig: const [
                    ToolBarStyle.align,
                    ToolBarStyle.bold,
                    ToolBarStyle.italic,
                    ToolBarStyle.underline,
                    ToolBarStyle.color,
                    ToolBarStyle.listBullet,
                    ToolBarStyle.background,
                    ToolBarStyle.headerOne,
                    ToolBarStyle.headerTwo,
                    ToolBarStyle.undo,
                    ToolBarStyle.redo,
                    ToolBarStyle.blockQuote,
                    ToolBarStyle.link,
                    ToolBarStyle.image,
                  ],
                ),
              ).paddingSymmetric(vertical: UIHelper.midSize, horizontal: UIHelper.lowSize),
            ),
          ),
        ],
      );
}
