

import "package:awesome_dialog/awesome_dialog.dart";
import "package:flutter/material.dart";

class BaseDialog {
  late BuildContext context;
  String? title;
      String? desc;
      DialogType? dialogType;
      IconData? btnOkIcon;
      IconData? btnCancelIcon;
      String? btnOkText;
      String? btnCancelText;
      void Function()? onOk;
      void Function()? onCancel;
      Color? btnOkColor;
      Color? btnCancelColor;
      ///! Eğer [Body] Girersen Title ve Desc Kullanılmaz
      Widget? body;

      }