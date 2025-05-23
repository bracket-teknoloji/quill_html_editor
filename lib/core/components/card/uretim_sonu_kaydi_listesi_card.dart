import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../base/model/base_edit_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/enum/base_edit_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../layout/custom_layout_builder.dart";

final class UretimSonuKaydiListesiCard extends StatefulWidget {
  const UretimSonuKaydiListesiCard({required this.model, required this.onChanged, super.key});
  final KalemModel model;
  final Future<void> Function() onChanged;

  @override
  State<UretimSonuKaydiListesiCard> createState() => _UretimSonuKaydiListesiCardState();
}

final class _UretimSonuKaydiListesiCardState extends BaseState<UretimSonuKaydiListesiCard> {
  KalemModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      onTap: () async {
        bottomSheetDialogManager.showBottomSheetDialog(
          context,
          title: model.belgeNo ?? "",
          children: [
            BottomSheetModel(
              title: loc.generalStrings.view,
              iconWidget: Icons.preview_outlined,
              onTap: () {
                Get
                  ..back()
                  ..toNamed(
                    "mainPage/uretimSonuKaydiEdit",
                    arguments: BaseEditModel<KalemModel>(
                      model: KalemModel.forUretimSonuKaydiEdit(model),
                      baseEditEnum: BaseEditEnum.goruntule,
                    ),
                  );
              },
            ),
            BottomSheetModel(
              title: "Üretim Sonu Raporu",
              iconWidget: Icons.list_alt_outlined,
              onTap: () {
                Get
                  ..back()
                  ..toNamed("mainPage/uretimSonuRaporu", arguments: model);
              },
            ),
            BottomSheetModel(title: loc.generalStrings.print, iconWidget: Icons.print_outlined),
            BottomSheetModel(
              title: loc.generalStrings.delete,
              iconWidget: Icons.delete_outline_outlined,
              onTap: () async {
                Get.back();
                dialogManager.showAreYouSureDialog(onYes: widget.onChanged);
              },
            ),
          ],
        );
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(model.belgeNo ?? ""), Text(model.tarih.toDateString)],
      ),
      subtitle: model.kalemSayisi == 1
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.stokAdi ?? ""),
                Text(model.stokKodu ?? ""),
                if (model.kalemSayisi == 1)
                  CustomLayoutBuilder.divideInHalf(
                    children: [
                      if (model.cikisDepo != null) Text("Çıkış Depo: ${model.cikisDepo}"),
                      if (model.girisDepo != null) Text("Giriş Depo: ${model.girisDepo}"),
                      Text("Miktar: ${model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                      Text(
                        "${(yetkiController.uretimFireUygulamasi) ? "Hurda/Fire Mik" : "Miktar 2"}: ${model.miktar2.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                      ),
                    ],
                  ),
                Text(model.aciklama ?? ""),
              ],
            )
          : Text("Kalem Sayısı: ${model.kalemSayisi}"),
    ),
  );
}
