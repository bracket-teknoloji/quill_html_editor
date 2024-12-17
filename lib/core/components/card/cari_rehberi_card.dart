import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../badge/colorful_badge.dart";

class CariRehberiCard extends StatefulWidget {
  const CariRehberiCard({super.key, required this.model, this.onPressed, required this.teslimCariMi});
  final CariListesiModel model;
  final bool teslimCariMi;
  final Function(CariListesiModel model)? onPressed;

  @override
  State<CariRehberiCard> createState() => _CariRehberiCardState();
}

class _CariRehberiCardState extends BaseState<CariRehberiCard> {
  CariListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: () => widget.onPressed != null ? widget.onPressed!(model) : Get.back(result: widget.model),
          onLongPress: () => dialogManager.showCariGridViewDialog(model),
          leading: CircleAvatar(
            backgroundColor: UIHelper.getColorWithValue(model.bakiye ?? 0.0),
            foregroundColor: Colors.white,
            child: Text(model.cariAdi?.substring(0, 1) ?? "", style: const TextStyle(color: Colors.white)),
          ),
          title: Text(model.cariAdi ?? ""),
          subtitle: Wrap(
            direction: Axis.vertical,
            alignment: WrapAlignment.spaceBetween,
            children: [
              Text("${model.cariKodu}", style: TextStyle(color: theme.textTheme.bodySmall?.color?.withOpacity(0.5))),
              if (model.cariIl != null) Text("${model.cariIl ?? ""}/${model.cariIlce ?? ""}", style: TextStyle(color: theme.textTheme.bodySmall?.color?.withOpacity(0.5))) else const SizedBox(),
              Row(
                children: [
                  const ColorfulBadge(label: Text("E-Fatura"), badgeColorEnum: BadgeColorEnum.fatura).yetkiVarMi(model.efaturaMi == true),
                  ColorfulBadge(label: Text("Dövizli ${model.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(model.dovizli == true),
                  const ColorfulBadge(label: Text("Konum"), badgeColorEnum: BadgeColorEnum.konum).yetkiVarMi(model.boylam != null),
                  const ColorfulBadge(label: Text("Kilitli"), badgeColorEnum: BadgeColorEnum.kilitli).yetkiVarMi(model.kilit == "E"),
                  // object.boylam != null && object.enlem != null ? const Badge(label: Text(("Konum"))) : const SizedBox(),
                  // object.dovizAdi != null ? Badge(label: Text(("Dövizli ${object.dovizAdi}"))) : const SizedBox(),
                ]
                    .map(
                      (e) => e is! SizedBox? ? e.paddingOnly(top: UIHelper.lowSize, right: UIHelper.lowSize) : null,
                    )
                    .toList()
                    .nullCheckWithGeneric,
              ),
            ],
          ),
          trailing: Wrap(
            children: [
              Text(
                (model.bakiye == null
                    ? "0.00 $mainCurrency"
                    : "${model.bakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"
                        "\n"),
                style: TextStyle(color: UIHelper.getColorWithValue(model.bakiye ?? 0.0)),
              ),
            ],
          ).yetkiVarMi(bakiyeGorunsunMu(model)),
        ),
      );

  bool bakiyeGorunsunMu(CariListesiModel model) {
    if (!yetkiController.adminMi && !yetkiController.cariListesi) return false;
    if (widget.teslimCariMi && yetkiController.cariTeslimCariRehberSadeceSecsin) return false;
    if (userModel.plasiyerKodu == null || userModel.plasiyerKodu != model.plasiyerKodu) return false;
    if (yetkiController.cariBakiyeGosterimTumuMu) return true;
    if (yetkiController.cariBakiyeGosterimKendiCarileriMi) return true;
    return false;
  }
}
