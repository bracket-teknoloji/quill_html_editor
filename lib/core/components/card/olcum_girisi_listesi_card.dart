import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";

class OlcumGirisiListesiCard extends StatefulWidget {
  final OlcumBelgeModel model;
  final Future Function(bool) onTapped;
  const OlcumGirisiListesiCard({super.key, required this.model, required this.onTapped});

  @override
  State<OlcumGirisiListesiCard> createState() => _OlcumGirisiListesiCardState();
}

class _OlcumGirisiListesiCardState extends BaseState<OlcumGirisiListesiCard> {
  OlcumBelgeModel get model => widget.model;

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
              Text("${model.cariAdi ?? ""} - ${model.cariKodu ?? ""}").yetkiVarMi(model.cariKodu != null),
              Text("${model.stokAdi ?? model.yapacik ?? ""} - ${model.stokKodu ?? ""}").yetkiVarMi(model.stokKodu != null),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  Text("Sıra: ${model.sira.toStringIfNotNull ?? ""}").yetkiVarMi(model.sira != null),
                  Text("Miktar: ${model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.miktar != null),
                  Text("Kabul Miktarı: ${model.kabulAdet.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.kabulAdet != null),
                  Text("Kalem Miktarı: ${model.kalemAdedi.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.kalemAdedi != null),
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
            if (widget.model.getEditTipiEnum.kalemSecilecekMi) {
              dialogManager.showCariIslemleriGridViewDialog(await networkManager.getCariModel(CariRequestModel(kod: [widget.model.cariKodu ?? ""])));
            } else {
              dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: widget.model.stokKodu)));
            }
          },
        ),
      );
}
