import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
import "package:quill_html_editor/quill_html_editor.dart";


class BaseFaturaDigerView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseFaturaDigerView({super.key, required this.model});

  @override
  State<BaseFaturaDigerView> createState() =>
      _BaseFaturaDigerViewState();
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
    if (controller.isEnable) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
              padding: const EdgeInsets.only(left: 10, top: 5),
              hintTextPadding: EdgeInsets.zero,
              inputAction: InputAction.newline,
              textStyle: const TextStyle(color: Colors.white),
              backgroundColor: theme.colorScheme.background,
              onTextChanged: (text) =>
                  text != "" ? model.ekAciklama = text : null,
              onEditorCreated: () async {
                if (model.ekAciklama != null) {
                  await controller.insertText(model.ekAciklama ?? "");
                }
              },
              loadingBuilder: (context) {
                return const Center(
                    child: CircularProgressIndicator.adaptive());
              },
            ),
          ).paddingSymmetric(
              vertical: UIHelper.midSize, horizontal: UIHelper.lowSize),
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
            ).paddingSymmetric(
                vertical: UIHelper.midSize, horizontal: UIHelper.lowSize),
          ),
        ),
      ],
    );
    // return SingleChildScrollView(
    //   child: HtmlEditor(
    //       controller: _htmlController,
    //       callbacks: Callbacks(onInit: onPageLoad, onChangeContent: (value) => model.ekAciklama = value),
    //       otherOptions: OtherOptions(decoration: BoxDecoration(color: theme.colorScheme.background, borderRadius: const BorderRadius.all(Radius.circular(4)))),
    //       htmlEditorOptions:
    //           HtmlEditorOptions(hint: !enable ? "" : "Eklemek istediğiniz notları buraya yazınız.", disabled: !enable, spellCheck: true, shouldEnsureVisible: true, autoAdjustHeight: false),
    //       htmlToolbarOptions: const HtmlToolbarOptions(
    //         toolbarPosition: ToolbarPosition.aboveEditor,
    //         separatorWidget: SizedBox(width: 10),
    //         toolbarType: ToolbarType.nativeScrollable,
    //         renderBorder: true,
    //         defaultToolbarButtons: [
    //           StyleButtons(),
    //           FontButtons(superscript: false, subscript: false),
    //           ColorButtons(),
    //           InsertButtons(video: false, audio: false, hr: false, otherFile: false, picture: false),
    //         ],
    //       )).paddingAll(UIHelper.lowSize),
    // );
  }
}
