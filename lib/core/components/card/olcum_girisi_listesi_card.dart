import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/model/olcum_girisi_listesi_model.dart";

class OlcumGirisiListesiCard extends StatefulWidget {
  final OlcumGirisiListesiModel model;
  const OlcumGirisiListesiCard({super.key, required this.model});

  @override
  State<OlcumGirisiListesiCard> createState() => _OlcumGirisiListesiCardState();
}

class _OlcumGirisiListesiCardState extends BaseState<OlcumGirisiListesiCard> {
  OlcumGirisiListesiModel get model => widget.model;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.belgeNo ?? ""),
              Text(model.tarih.toDateString),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ColorfulBadge(
                    label: Text("Ölçüm Miktarı: ${model.olcumAdedi.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.olcumAdedi != null),
                    badgeColorEnum: BadgeColorEnum.esYap,
                  ),
                ],
              ),
              Text("${model.stokAdi ?? model.yapacik ?? ""} - ${model.stokKodu ?? ""}"),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  Text("Sıra: ${model.sira.toStringIfNotNull ?? ""}").yetkiVarMi(model.sira != null),
                  Text("Miktar: ${model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.miktar != null),
                  Text("Kabul Miktarı: ${model.kabulAdet.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.kabulAdet != null),
                  Text("Ret Miktarı: ${model.retAdet.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.retAdet != null),
                  Text("Şartlı Miktar: ${model.sartliAdet.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.sartliAdet != null),
                  Text("Yapılandırma Kodu: ${model.yapkod}").yetkiVarMi(model.yapkod != null),
                ],
              ),
            ],
          ),
          onTap: () async => await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: widget.model.belgeNo ?? "Ölçüm Detayı",
            children: [
              BottomSheetModel(
                title: loc.generalStrings.view,
                iconWidget: Icons.preview_outlined,
                onTap: () {
                  Get.back();
                  return Get.toNamed("/mainPage/olcumDetay", arguments: widget.model);
                },
              ),
              // BottomSheetModel(title: loc.generalStrings.edit, iconWidget: Icons.edit_outlined),
            ],
          ),
        ),
      );
}
