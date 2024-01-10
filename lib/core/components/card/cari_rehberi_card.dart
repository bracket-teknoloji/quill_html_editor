import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../badge/colorful_badge.dart";

class CariRehberiCard extends StatefulWidget {
  final CariListesiModel model;
  final Function(CariListesiModel model)? onPressed;
  const CariRehberiCard({super.key, required this.model, this.onPressed});

  @override
  State<CariRehberiCard> createState() => _CariRehberiCardState();
}

class _CariRehberiCardState extends BaseState<CariRehberiCard> {
  CariListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          isThreeLine: true,
          contentPadding: UIHelper.midPadding,
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
              if (model.cariIl != null) Text("${model.cariIl}/${model.cariIlce}", style: TextStyle(color: theme.textTheme.bodySmall?.color?.withOpacity(0.5))) else const SizedBox(),
              Row(
                children: [
                  if (model.efaturaMi == true) const ColorfulBadge(label: Text("E-Fatura"), badgeColorEnum: BadgeColorEnum.eFatura) else const SizedBox(),
                  if (model.boylam != null && model.enlem != null) const ColorfulBadge(label: Text("Konum"), badgeColorEnum: BadgeColorEnum.konum) else const SizedBox(),
                  if (model.dovizli == true) ColorfulBadge(label: Text("Dövizli ${model.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli) else const SizedBox(),
                ].map((e) => e.paddingOnly(top: UIHelper.lowSize, right: UIHelper.lowSize)).toList(),
              ),
            ],
          ),
          trailing: Wrap(
            children: [
              Text(
                (model.bakiye == null
                        ? "0.00 $mainCurrency"
                        : "${model.bakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"
                            "\n")
                    .toString(),
                style: TextStyle(color: UIHelper.getColorWithValue(model.bakiye ?? 0.0)),
              ),
            ],
          ),
        ),
      );
}
