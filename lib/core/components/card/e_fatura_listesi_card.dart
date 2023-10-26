import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/enum/e_belge_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";

class EFaturaListesiCard extends StatefulWidget {
  final EBelgeListesiModel eBelgeListesiModel;
  final EBelgeEnum eBelgeEnum;
  const EFaturaListesiCard({super.key, required this.eBelgeListesiModel, required this.eBelgeEnum});

  @override
  State<EFaturaListesiCard> createState() => _EFaturaListesiCardState();
}

class _EFaturaListesiCardState extends BaseState<EFaturaListesiCard> {
  EBelgeListesiModel get model => widget.eBelgeListesiModel;
  @override
  Widget build(BuildContext context) => Card(
        color: model.faturaIslendi == "E" ? ColorPalette.mantis.withOpacity(0.5) : null,
        child: ListTile(
          onTap: () async {
            await bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: model.cariAdi ?? "",
              children: [
                BottomSheetModel(
                  title: "E-Belge Görüntüle",
                  iconWidget: Icons.picture_as_pdf_outlined,
                  onTap: () {
                    Get.back();
                    Get.toNamed("/mainPage/eBelgePdf", arguments: model);
                  },
                ),
                BottomSheetModel(
                  title: "Cari İşlemleri",
                  iconWidget: Icons.person_outline_outlined,
                  onTap: () async {
                    Get.back();
                    dialogManager.showCariGridViewDialog(CariListesiModel(cariKodu: model.cariKodu));
                  },
                ),
              ].nullCheckWithGeneric,
            );
          },
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Text(model.belgeNo ?? model.resmiBelgeNo ?? "")),
              Text(model.tarih.toDateString),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.cariAdi ?? ""),
              Row(
                children: [
                  const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(model.dovizAdi != null),
                  const ColorfulBadge(label: Text("Taslak"), badgeColorEnum: BadgeColorEnum.hata).yetkiVarMi(model.taslak == "E"),
                  const ColorfulBadge(label: Text("Reddedildi"), badgeColorEnum: BadgeColorEnum.hata).yetkiVarMi(model.onayDurumKodu == "1"),
                  const ColorfulBadge(label: Text("Başarılı"), badgeColorEnum: BadgeColorEnum.basarili).yetkiVarMi(model.basariylaGonderildi == "E"),
                ],
              ).paddingSymmetric(vertical: UIHelper.lowSize),
              Text(model.onayAciklama ?? model.cevapAciklama ?? ""),
              LayoutBuilder(
                builder: (context, constraints) => Wrap(
                  children: [
                    Text("Vergi No: ${model.vergiNo ?? ""}"),
                    Text("Kayıt Tarihi: ${model.kayittarihi.toDateString}"),
                    Text("Onay: ${model.onayAciklama ?? ""}"),
                    InkWell(onTap: () => dialogManager.showInfoSnackBar(model.cevapKodu.toStringIfNotNull ?? ""), child: Text("Senaryo: ${model.senaryo ?? ""}")),
                    Text("Tipi: ${model.faturaTipi}"),
                    Text("Genel Toplam: ${model.genelToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"),
                  ].map((e) => SizedBox(width: constraints.maxWidth / 2, child: e)).toList(),
                ),
              ),
              Text("Kontrol: ${model.kontrolEdildi == "E" ? model.kontrolAciklama : "Hayır"}").paddingSymmetric(vertical: UIHelper.lowSize),
            ],
          ),
        ),
      );
}
