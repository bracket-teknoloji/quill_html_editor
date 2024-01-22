import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

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
                            "\n")
                    .toString(),
                style: TextStyle(color: UIHelper.getColorWithValue(model.bakiye ?? 0.0)),
              ),
            ],
          ),
        ),
      );
}
// if (index < (viewModel.cariListesi?.length ?? 0)) {
//                       final CariListesiModel object = viewModel.cariListesi?[index];
//                       return Card(
//                         child: Listener(
//                           onPointerDown: (event) {
//                             if (event.kind == PointerDeviceKind.mouse && event.buttons == 2) {
//                               showCariGrid(object);
//                             }
//                           },
//                           child: ListTile(
//                             onLongPress: () {
//                               showCariGrid(object);
//                             },
//                             onTap: () {
//                               if (widget.isGetData) {
//                                 Get.back(result: object);
//                               } else {
//                                 cariBottomSheet(context, object);
//                               }
//                             },
//                             isThreeLine: true,
//                             // contentPadding: UIHelper.midPadding,
//                             leading: CircleAvatar(
//                               backgroundColor: UIHelper.getColorWithValue(object.bakiye ?? 0.0),
//                               foregroundColor: Colors.white,
//                               child: Text(object.cariAdi?.substring(0, 1) ?? "", style: const TextStyle(color: Colors.white)),
//                             ),
//                             title: Text(object.cariAdi ?? ""),
//                             subtitle: Wrap(
//                               direction: Axis.vertical,
//                               alignment: WrapAlignment.spaceBetween,
//                               children: [
//                                 Text("${object.cariKodu}", style: TextStyle(color: theme.textTheme.bodySmall?.color?.withOpacity(0.5))),
//                                 if (object.cariIl != null)
//                                   Text("${object.cariIl ?? ""}/${object.cariIlce ?? ""}", style: TextStyle(color: theme.textTheme.bodySmall?.color?.withOpacity(0.5)))
//                                 else
//                                   const SizedBox(),
//                                 Row(
//                                   children: [
//                                     const ColorfulBadge(label: Text("E-Fatura"), badgeColorEnum: BadgeColorEnum.fatura).yetkiVarMi(object.efaturaMi == true),
//                                     ColorfulBadge(label: Text("Dövizli ${object.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(object.dovizli == true),
//                                     const ColorfulBadge(label: Text("Konum"), badgeColorEnum: BadgeColorEnum.konum).yetkiVarMi(object.boylam != null),
//                                     const ColorfulBadge(label: Text("Kilitli"), badgeColorEnum: BadgeColorEnum.kilitli).yetkiVarMi(object.kilit == "E"),
//                                     // object.boylam != null && object.enlem != null ? const Badge(label: Text(("Konum"))) : const SizedBox(),
//                                     // object.dovizAdi != null ? Badge(label: Text(("Dövizli ${object.dovizAdi}"))) : const SizedBox(),
//                                   ]
//                                       .map(
//                                         (e) => e is! SizedBox? ? e.paddingOnly(top: UIHelper.lowSize, right: UIHelper.lowSize) : null,
//                                       )
//                                       .toList()
//                                       .nullCheckWithGeneric,
//                                 ),
//                               ],
//                             ),
//                             trailing: Wrap(
//                               children: [
//                                 Text.rich(
//                                   TextSpan(
//                                     children: [
//                                       TextSpan(
//                                         text: object.bakiye == null ? "0,00 $mainCurrency\n" : "${object.bakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency\n",
//                                         style: TextStyle(color: UIHelper.getColorWithValue(object.bakiye ?? 0.0)),
//                                       ),
//                                       if (object.bakiye != null)
//                                         TextSpan(text: "${((object.bakiye ?? 0) > 0) ? "Tahsil Edilecek" : "Ödenecek"}\n", style: const TextStyle(fontStyle: FontStyle.italic))
//                                       else
//                                         null,
//                                       if (object.dovizli == true && object.dovBakiye != null)
//                                         TextSpan(
//                                           text: "${object.dovBakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} ${object.dovizAdi ?? ""}",
//                                           style: TextStyle(color: UIHelper.getColorWithValue(object.dovBakiye ?? 0.0)),
//                                         )
//                                       else
//                                         null,
//                                     ].nullCheckWithGeneric,
//                                   ),
//                                   textAlign: TextAlign.right,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     } else {
//                       return Observer(
//                         builder: (_) => Visibility(
//                           visible: viewModel.dahaVarMi,
//                           child: const Center(child: CircularProgressIndicator.adaptive()),
//                         ),
//                       );
//                     }