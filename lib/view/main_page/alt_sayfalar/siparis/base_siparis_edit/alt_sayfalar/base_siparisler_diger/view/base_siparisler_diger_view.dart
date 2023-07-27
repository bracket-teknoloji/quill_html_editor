import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';

class BaseSiparislerDigerView extends StatefulWidget {
  const BaseSiparislerDigerView({super.key});

  @override
  State<BaseSiparislerDigerView> createState() => _BaseSiparislerDigerViewState();
}

class _BaseSiparislerDigerViewState extends BaseState<BaseSiparislerDigerView> {
  late final QuillController _controller;

  @override
  void initState() {
    _controller = QuillController.basic();

    super.initState();
  }

  @override
  void dispose() {
    print(_controller.document.toPlainText());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Column(
      children: [
        Expanded(
            child: Container(
                    decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 5, blurRadius: 7, offset: const Offset(0, 3))]),
                    child: QuillEditor.basic(controller: _controller, readOnly: false, keyboardAppearance: isDarkMode ? Brightness.dark : Brightness.light))
                .paddingAll(UIHelper.lowSize)),
        QuillToolbar.basic(
          controller: _controller,
          multiRowsDisplay: true,
          sectionDividerColor: theme.colorScheme.primary,
          toolbarIconSize: kDefaultIconSize * 1.07,
          showDividers: true,
          dialogTheme: const QuillDialogTheme(dialogBackgroundColor: Colors.yellow),
          iconTheme: QuillIconTheme(
              iconUnselectedColor: theme.colorScheme.primary, iconSelectedColor: UIHelper.primaryColor, borderRadius: 4, iconSelectedFillColor: theme.colorScheme.primary.withOpacity(0.1)),
          showFontFamily: false,
          color: theme.colorScheme.primary,
          showAlignmentButtons: false,
          showCenterAlignment: false,
          showLeftAlignment: false,
          showRightAlignment: false,
          showJustifyAlignment: false,
          showIndent: true,
          showCodeBlock: false,
          showDirection: false,
          showHeaderStyle: true,
          showInlineCode: false,
          showListCheck: true,
          showLink: false,
          showQuote: true,
          showSearchButton: false,
          showListNumbers: true,
          showListBullets: true,
          showSubscript: false,
          showSuperscript: false,
        )
      ],
    );
  }
}
