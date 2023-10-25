import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/model/e_belge_listesi_model.dart";

class EFaturaListesiCard extends StatefulWidget {
  final EBelgeListesiModel eBelgeListesiModel;
  const EFaturaListesiCard({super.key, required this.eBelgeListesiModel});

  @override
  State<EFaturaListesiCard> createState() => _EFaturaListesiCardState();
}

class _EFaturaListesiCardState extends BaseState<EFaturaListesiCard> {
  EBelgeListesiModel get model => widget.eBelgeListesiModel;
  @override
  Widget build(BuildContext context) => Card(
        color: model.faturaIslendi == "E" ? ColorPalette.mantis.withOpacity(0.5) : null,
        child: ListTile(
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
                ],
              ).paddingSymmetric(vertical: UIHelper.lowSize),
              Text(model.onayAciklama ?? model.cevapAciklama ?? ""),
              LayoutBuilder(
                builder: (context, constraints) => Wrap(
                  children: [
                    Text("Vergi No: ${model.vergiNo ?? ""}"),
                    Text("Kayıt Tarihi: ${model.kayittarihi.toDateString}"),
                    Text("Onay: ${model.onayAciklama}"),
                    Text("Senaryo: ${model.senaryo}"),
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
