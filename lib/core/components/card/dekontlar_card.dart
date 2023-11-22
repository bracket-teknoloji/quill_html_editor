import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/model/dekont_listesi_model.dart";

class DekontlarCard extends StatefulWidget {
  final DekontListesiModel model;
  final ValueChanged<bool> onSelected;
  const DekontlarCard({super.key, required this.model, required this.onSelected});

  @override
  State<DekontlarCard> createState() => _DekontlarCardState();
}

class _DekontlarCardState extends BaseState<DekontlarCard> {
  DekontListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: () async => dekontBottomSheet(model),
          title: Row(
            children: [
              Text(model.title),
              const Spacer(),
              Text(model.tarih.toDateString),
            ],
          ),
          subtitle: LayoutBuilder(
            builder: (context, constraints) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.seriAdi ?? ""),
                Wrap(
                  children: [
                    Text("Tutar:\n${(model.borcToplami ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                    Text("Kalem Sayısı:\n${model.kalemSayisi ?? "0"}"),
                  ].map((e) => SizedBox(width: constraints.maxWidth / 2, child: e)).toList(),
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> dekontBottomSheet(DekontListesiModel? model) async => await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: model?.title ?? "",
        children: [
          BottomSheetModel(title: "Görüntüle", iconWidget: Icons.preview_outlined),
          BottomSheetModel(title: "Düzelt", iconWidget: Icons.edit_outlined),
          BottomSheetModel(title: "Sil", iconWidget: Icons.delete_outline, onTap: deleteDekont),
        ],
      );

  Future<void> deleteDekont() async {
    Get.back();
    dialogManager.showAreYouSureDialog(() async {
      final result = await networkManager.dioPost(path: ApiUrls.deleteDekont, showLoading: true, bodyModel: DekontListesiModel(), queryParameters: {"DekontNo": model.dekontNo, "Seri": model.seri});
      if (result.success ?? false) {
        dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
        widget.onSelected.call(true);
      }
    });
  }
}
