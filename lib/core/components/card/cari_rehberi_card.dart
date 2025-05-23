import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/components/listener/mouse_right_click_listener.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../badge/colorful_badge.dart";

final class CariRehberiCard extends StatefulWidget {
  const CariRehberiCard({required this.model, required this.teslimCariMi, super.key, this.onPressed});
  final CariListesiModel model;
  final bool teslimCariMi;
  final Function(CariListesiModel model)? onPressed;

  @override
  State<CariRehberiCard> createState() => _CariRehberiCardState();
}

final class _CariRehberiCardState extends BaseState<CariRehberiCard> {
  CariListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => MouseRightClickListener(
    onRightClick: onLongPress,
    child: Card(
      child: ListTile(
        onTap: () async {
          if (widget.onPressed == null) {
            if (widget.model.kilitliMi) {
              dialogManager.showAlertDialog("Cari tüm işlemler için kilitli durumda.");
              return;
            }
            Get.back(result: widget.model);
          } else {
            widget.onPressed!(model);
          }
        },
        onLongPress: onLongPress,
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
            Text(
              "${model.cariKodu}",
              style: TextStyle(color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5)),
            ),
            if (model.cariIl != null)
              Text(
                "${model.cariIl ?? ""}/${model.cariIlce ?? ""}",
                style: TextStyle(color: theme.textTheme.bodySmall?.color?.withValues(alpha: 0.5)),
              )
            else
              const SizedBox.shrink(),
            Row(
              children: [
                if (model.efaturaMi == true)
                  const ColorfulBadge(label: Text("E-Fatura"), badgeColorEnum: BadgeColorEnum.fatura),
                if (model.dovizli == true)
                  ColorfulBadge(label: Text("Dövizli ${model.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli),
                if (model.boylam != null)
                  const ColorfulBadge(label: Text("Konum"), badgeColorEnum: BadgeColorEnum.konum),
                if (model.kilitliMi)
                  const ColorfulBadge(label: Text("Kilitli"), badgeColorEnum: BadgeColorEnum.kilitli),
              ].map((e) => e.paddingOnly(top: UIHelper.lowSize, right: UIHelper.lowSize)).toList(),
            ),
          ],
        ),
        trailing: bakiyeGorunsunMu(model)
            ? Wrap(
                children: [
                  Text(
                    (model.bakiye == null
                        ? "0.00 $mainCurrency"
                        : "${model.bakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"
                              "\n"),
                    style: TextStyle(color: UIHelper.getColorWithValue(model.bakiye ?? 0.0)),
                  ),
                ],
              )
            : null,
      ),
    ),
  );

  void onLongPress() => dialogManager.showCariGridViewDialog(model);

  bool bakiyeGorunsunMu(CariListesiModel model) {
    if (!yetkiController.adminMi && !yetkiController.cariListesi) return false;
    if (widget.teslimCariMi && yetkiController.cariTeslimCariRehberSadeceSecsin) return false;
    if (userModel.plasiyerKodu == null || userModel.plasiyerKodu != model.plasiyerKodu) return false;
    if (yetkiController.cariBakiyeGosterimTumuMu) return true;
    if (yetkiController.cariBakiyeGosterimKendiCarileriMi) return true;
    return false;
  }
}
