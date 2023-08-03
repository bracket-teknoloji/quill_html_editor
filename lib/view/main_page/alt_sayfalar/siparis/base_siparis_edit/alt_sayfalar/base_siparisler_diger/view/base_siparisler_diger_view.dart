import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart';

import '../../../../../../../../core/base/model/base_edit_model.dart';
import '../../../../siparisler/model/siparis_edit_reuqest_model.dart';
import '../view_model/base_siparisler_diger_view_model.dart';

class BaseSiparislerDigerView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseSiparislerDigerView({super.key, required this.model});

  @override
  State<BaseSiparislerDigerView> createState() => _BaseSiparislerDigerViewState();
}

class _BaseSiparislerDigerViewState extends BaseState<BaseSiparislerDigerView> {
  // late final QuillController _controller;
  late final HtmlEditorController _htmlController;
  BaseSiparislerDigerViewModel viewModel = BaseSiparislerDigerViewModel();
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  bool get enable => widget.model.enable;

  @override
  void initState() {
    _htmlController = HtmlEditorController();
    // _htmlController.setText(model.ekAciklama ?? "");    // final mdDocument = md.Document(
    //   encodeHtml: true,
    //   extensionSet: md.ExtensionSet.gitHubFlavored,

    //   you can add custom syntax.
    //   blockSyntaxes: [const EmbeddableTableSyntax()],
    // );
    // final mdToDelta = MarkdownToDelta(
    //   markdownDocument: mdDocument,
    //   customElementToBlockAttribute: {
    //     'h4': (element) => [const HeaderAttribute(level: 4)],
    //   },
    //   custom embed
    //   customElementToEmbeddable: {
    //     EmbeddableTable.tableType: EmbeddableTable.fromMdSyntax,
    //   },
    // );
    // String md.markdownToHtml(model.ekAciklama ?? "");
    // doc =
    // Map jsonData = {"insert": ""};
    // //html to delta
    // // jsonToHtml(jsonData);
    // log(jsonData["insert"]);
    // _controller = QuillController(document: Document.fromDelta(mdToDelta.convert(model.ekAciklama ?? "")), selection: const TextSelection.collapsed(offset: 0));
    // if (BaseSiparisEditModel.instance.ekAciklama == null) {
    // } else {
    //   var json = jsonDecode(r'{"insert":"hello\n"}');
    //   _controller = QuillController(document: Document.fromJson(json), selection: const TextSelection.collapsed(offset: 0));
    // }

    super.initState();
  }

  void jsonToHtml(Map<dynamic, dynamic> jsonData) {
    // markdownToHtml(BaseSiparisEditModel.instance.ekAciklama ?? "").split("\n").forEach((element) {
    //   jsonData["insert"] += BaseSiparisEditModel.instance.ekAciklama ?? "";
    //   jsonData["insert"] += "\n";
    // });
  }

  @override
  void dispose() {
    // print(_controller.document.toDelta());
    print(_htmlController.getText());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HtmlEditor(
          controller: _htmlController,
          callbacks: Callbacks(
            onInit: onPageLoad,
            onChangeContent: (value) => model.ekAciklama = value,
            onImageUpload: (p0) => print(p0),
          ),
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
    if (model.ekAciklama != null){
    _htmlController.setText(model.ekAciklama!);
    }
  }

  // Column quillEditor(bool isDarkMode) {
  //   return Column(
  //     children: [
  //       Expanded(
  //           child: Container(
  //                   decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 5, blurRadius: 7, offset: const Offset(0, 3))]),
  //                   child: QuillEditor.basic(controller: _controller, readOnly: !enable, keyboardAppearance: isDarkMode ? Brightness.dark : Brightness.light))
  //               .paddingAll(UIHelper.lowSize)),
  //       Visibility(
  //         visible: enable,
  //         child: QuillToolbar.basic(
  //           controller: _controller,
  //           multiRowsDisplay: true,
  //           sectionDividerColor: theme.colorScheme.primary,
  //           toolbarIconSize: kDefaultIconSize * 1.07,
  //           showDividers: true,
  //           iconTheme: QuillIconTheme(
  //               iconUnselectedColor: theme.colorScheme.primary, iconSelectedColor: UIHelper.primaryColor, borderRadius: 4, iconSelectedFillColor: theme.colorScheme.primary.withOpacity(0.1)),
  //           showFontFamily: false,
  //           color: theme.colorScheme.primary,
  //           showAlignmentButtons: false,
  //           showCenterAlignment: false,
  //           showLeftAlignment: false,
  //           showRightAlignment: false,
  //           showJustifyAlignment: false,
  //           showIndent: true,
  //           showCodeBlock: false,
  //           showDirection: false,
  //           showHeaderStyle: true,
  //           showInlineCode: false,
  //           showListCheck: true,
  //           showLink: false,
  //           showQuote: true,
  //           showSearchButton: false,
  //           showListNumbers: true,
  //           showListBullets: true,
  //           showSubscript: false,
  //           showSuperscript: false,
  //         ),
  //       )
  //     ],
  //   );
  // }
}
