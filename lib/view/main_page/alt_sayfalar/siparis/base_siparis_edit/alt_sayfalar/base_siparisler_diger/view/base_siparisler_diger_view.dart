import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:html_editor_enhanced/html_editor.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../siparisler/model/siparis_edit_reuqest_model.dart";
import "../view_model/base_siparisler_diger_view_model.dart";

class BaseSiparislerDigerView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseSiparislerDigerView({super.key, required this.model});

  @override
  State<BaseSiparislerDigerView> createState() => _BaseSiparislerDigerViewState();
}

class _BaseSiparislerDigerViewState extends BaseState<BaseSiparislerDigerView> {
  late final HtmlEditorController _htmlController;
  BaseSiparislerDigerViewModel viewModel = BaseSiparislerDigerViewModel();
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  bool get enable => widget.model.enable;

  @override
  void initState() {
    _htmlController = HtmlEditorController();
    super.initState();
  }

  @override
  void dispose() {
    _htmlController.disable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HtmlEditor(
          controller: _htmlController,
          callbacks: Callbacks(onInit: onPageLoad, onChangeContent: (value) => model.ekAciklama = value),
          otherOptions: OtherOptions(decoration: BoxDecoration(color: theme.colorScheme.background, borderRadius: const BorderRadius.all(Radius.circular(4)))),
          htmlEditorOptions:
              HtmlEditorOptions(hint: !enable ? "" : "Eklemek istediğiniz notları buraya yazınız.", disabled: !enable, spellCheck: true, shouldEnsureVisible: true, autoAdjustHeight: false),
          htmlToolbarOptions: const HtmlToolbarOptions(
            toolbarPosition: ToolbarPosition.aboveEditor,
            separatorWidget: SizedBox(width: 10),
            toolbarType: ToolbarType.nativeScrollable,
            renderBorder: true,
            defaultToolbarButtons: [
              StyleButtons(),
              FontButtons(superscript: false, subscript: false),
              ColorButtons(),
              InsertButtons(video: false, audio: false, hr: false, otherFile: false, picture: false),
            ],
          )).paddingAll(UIHelper.lowSize),
    );
  }

  void onPageLoad() {
    _htmlController.setFullScreen();
    if (model.ekAciklama != null) {
      _htmlController.setText(model.ekAciklama!);
    }
  }
}
