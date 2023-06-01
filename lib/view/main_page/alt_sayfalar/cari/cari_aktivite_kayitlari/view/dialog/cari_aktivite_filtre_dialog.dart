import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../core/base/helpers/helper.dart';
import '../../../../../../../core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart';
import '../../../../../../../core/components/textfield/custom_label_widget.dart';

class CariAktiviteFiltreDialogManager {
  static final BottomSheetDialogManager _bottomSheetDialogManager = BottomSheetDialogManager();
  static void showAktiviteDialog(BuildContext context) => _bottomSheetDialogManager.showBottomSheetDialog(context,
      title: "title",
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        const CustomWidgetWithLabel(
          text: "Cari",
          children: [TextField()],
        ),
        const CustomWidgetWithLabel(
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
