import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart';
import 'package:picker/core/components/textfield/custom_textfield.dart';

class CariAktiviteFiltreDialogManager {
  static final BottomSheetDialogManager _bottomSheetDialogManager = BottomSheetDialogManager();
  static void showAktiviteDialog(BuildContext context) => _bottomSheetDialogManager.showBottomSheetDialog(context,
      title: "title",
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const CustomTextField(
          text: "Cari",
          children: [TextField()],
        ),
        const CustomTextField(
          text: "Kullanıcı",
          children: [TextField()],
        ),
        SizedBox(
          height: Get.height * 0.1,
          child: Row(
            children: [
              Expanded(flex: 1, child: ElevatedButton(onPressed: () => () {}, child: const Text("İptal"))).paddingOnly(right: UIHelper.lowSize),
              Expanded(flex: 1, child: ElevatedButton(onPressed: () => () {}, child: const Text("Filtrele"))),
            ],
          ),
        )
      ]).paddingAll(UIHelper.lowSize));
}
