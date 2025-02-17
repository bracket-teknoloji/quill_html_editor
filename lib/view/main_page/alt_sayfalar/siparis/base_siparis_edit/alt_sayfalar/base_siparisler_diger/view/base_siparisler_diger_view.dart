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

final class BaseSiparislerDigerView extends StatefulWidget {
  const BaseSiparislerDigerView({required this.model, super.key});
  final BaseEditModel<SiparisEditRequestModel> model;

  @override
  State<BaseSiparislerDigerView> createState() => _BaseSiparislerDigerViewState();
}

final class _BaseSiparislerDigerViewState extends BaseState<BaseSiparislerDigerView> {
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
            hintText: "Buraya notlarınızı yazabilirsiniz...",
            hintTextStyle: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.5), fontSize: 16),
            text: model.ekAciklama ?? "",
            controller: controller,
            isEnabled: enable,
            minHeight: height,
            padding: const EdgeInsets.only(left: UIHelper.midSize, top: UIHelper.lowSize),
            textStyle: TextStyle(color: theme.colorScheme.onSurface),
            backgroundColor: theme.colorScheme.surface,
            onTextChanged: (text) => model.ekAciklama = text != "" ? text : null,
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
              iconColor: theme.colorScheme.onSurface,
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
