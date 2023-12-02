import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/model/talep_teklif_listesi_model.dart";
import "package:quill_html_editor/quill_html_editor.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";

class BaseTalepTeklifDigerView extends StatefulWidget {
  final BaseEditModel<TalepTeklifListesiModel> model;
  const BaseTalepTeklifDigerView({super.key, required this.model});

  @override
  State<BaseTalepTeklifDigerView> createState() => _BaseTalepTeklifDigerViewState();
}

class _BaseTalepTeklifDigerViewState extends BaseState<BaseTalepTeklifDigerView> {
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
    if (controller.isEnable) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
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
                textStyle: TextStyle(color: theme.colorScheme.onSurface),
                backgroundColor: theme.colorScheme.background,
                onTextChanged: (String text) => text != "" ? model.ekAciklama = text : null,
                onEditorCreated: () async {
                  if (model.ekAciklama != null) {
                    await controller.insertText(model.ekAciklama ?? "");
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
