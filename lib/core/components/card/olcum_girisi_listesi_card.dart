import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "../../../view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "../../base/state/base_state.dart";
import "../../base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/enum/edit_tipi_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../badge/colorful_badge.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../layout/custom_layout_builder.dart";

final class OlcumGirisiListesiCard extends StatefulWidget {
  const OlcumGirisiListesiCard({required this.model, required this.onTapped, super.key});
  final OlcumBelgeModel model;
  final Future Function(bool) onTapped;

  @override
  State<OlcumGirisiListesiCard> createState() => _OlcumGirisiListesiCardState();
}

final class _OlcumGirisiListesiCardState extends BaseState<OlcumGirisiListesiCard> {
  OlcumBelgeModel get model => widget.model;

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(model.belgeNo ?? ""), Text(model.tarih.toDateString)],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (model.olcumAdedi case (!= null && != 0 && != 0.0))
                ColorfulBadge(
                  label: Text("Ölçüm Miktarı: ${model.olcumAdedi.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                  badgeColorEnum: BadgeColorEnum.esYap,
                ),
            ],
          ),
          if (model.cariKodu != null) Text("${model.cariAdi ?? ""} - ${model.cariKodu ?? ""}"),
          if (model.stokKodu != null) Text("${model.stokAdi ?? model.yapacik ?? ""} - ${model.stokKodu ?? ""}"),
          CustomLayoutBuilder(
            splitCount: 2,
            children: [
              if (model.belgeSira != null) Text("Sıra: ${model.belgeSira.toStringIfNotNull ?? ""}"),
              if (model.miktar != null)
                Text("Miktar: ${model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
              if (model.kabulAdet != null)
                Text("Kabul Miktarı: ${model.kabulAdet.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
              if (model.kalemAdedi != null)
                Text("Kalem Miktarı: ${model.kalemAdedi.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
              if (model.retAdet != null)
                Text("Ret Miktarı: ${model.retAdet.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
              if (model.sartliAdet != null)
                Text("Şartlı Miktar: ${model.sartliAdet.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
              if (model.yapkod != null) Text("Yapılandırma Kodu: ${model.yapkod}"),
            ],
          ),
        ],
      ),
      onTap:
          () async => await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: widget.model.belgeNo ?? "Ölçüm Detayı",
            children: [
              BottomSheetModel(
                title: loc.generalStrings.view,
                iconWidget: Icons.preview_outlined,
                onTap: () async {
                  Get.back();
                  final OlcumBelgeModel result = widget.model;
                  if (widget.model.getEditTipiEnum.kalemSecilecekMi) {
                    final result2 = await Get.toNamed("/mainPage/olcumKalemSec", arguments: result);
                    if (result2 == true) {
                      widget.onTapped.call(true);
                    }
                    return;
                  }
                  final result2 = await Get.toNamed("/mainPage/olcumDetay", arguments: result);
                  if (result2 == true) {
                    widget.onTapped.call(true);
                  }
                },
              ),
              // BottomSheetModel(title: loc.generalStrings.edit, iconWidget: Icons.edit_outlined),
            ],
          ),
      onLongPress: () async {
        if (widget.model.getEditTipiEnum.kalemSecilecekMi && yetkiController.cariListesi) {
          dialogManager.showCariIslemleriGridViewDialog(
            await networkManager.getCariModel(CariRequestModel(kod: [widget.model.cariKodu ?? ""])),
          );
        } else if (yetkiController.stokListesi) {
          dialogManager.showStokGridViewDialog(
            await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: widget.model.stokKodu)),
          );
        }
      },
    ),
  );
}
