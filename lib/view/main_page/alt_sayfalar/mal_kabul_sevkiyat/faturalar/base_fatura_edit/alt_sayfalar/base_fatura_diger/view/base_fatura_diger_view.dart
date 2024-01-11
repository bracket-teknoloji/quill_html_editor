import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:quill_html_editor/quill_html_editor.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";

class BaseFaturaDigerView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseFaturaDigerView({super.key, required this.model});

  @override
  State<BaseFaturaDigerView> createState() => _BaseFaturaDigerViewState();
}

class _BaseFaturaDigerViewState extends BaseState<BaseFaturaDigerView> {
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  bool get enable => widget.model.enable;
  late final QuillEditorController controller;

  @override
  void initState() {
    controller = QuillEditorController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          Expanded(
            child: Card(
              elevation: UIHelper.highSize,
              child: QuillHtmlEditor(
                hintText: "Buraya notlarınızı yazabilirsiniz...",
                hintTextStyle: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.5), fontSize: 16),
                text: model.ekAciklama ?? "",
                controller: controller,
                isEnabled: enable,
                minHeight: height,
                hintTextAlign: TextAlign.start,
                padding: EdgeInsets.only(left: UIHelper.midSize, top: UIHelper.lowSize),
                inputAction: InputAction.newline,
                textStyle: TextStyle(color: theme.colorScheme.onSurface),
                backgroundColor: theme.colorScheme.background,
                onTextChanged: (String text) => model.ekAciklama = text != "" ? text : null,
                onEditorCreated: () async {
                  if (model.ekAciklama != null) {
                    await controller.insertText(model.ekAciklama ?? "");
                  } else {
                    await controller.insertText("");
                  }
                },
                loadingBuilder: (BuildContext context) => const Center(child: CircularProgressIndicator.adaptive()),
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
                  toolBarConfig: const <ToolBarStyle>[
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
