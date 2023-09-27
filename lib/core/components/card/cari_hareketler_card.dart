import "package:flutter/material.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:get/get.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../helper_widgets/custom_label_widget.dart";

class CariHareketlerCard extends StatefulWidget {
  final String? dovizTipi;
  final CariHareketleriModel cariHareketleriModel;
  final dynamic Function()? onTap;

  const CariHareketlerCard({super.key, this.onTap, required this.cariHareketleriModel, this.dovizTipi});

  @override
  State<CariHareketlerCard> createState() => _CariHareketlerCardState();
}

class _CariHareketlerCardState extends BaseState<CariHareketlerCard> {
  bool get dovizliMi => widget.cariHareketleriModel.dovizliMi || widget.dovizTipi != null;
  @override
  Widget build(BuildContext context) {
    return Slidable(
      enabled: widget.cariHareketleriModel.hareketAciklama != "Dekont",
      endActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              autoClose: true,
              onPressed: (context) {},
              icon: Icons.route_outlined,
              backgroundColor: theme.cardColor,
              foregroundColor: theme.colorScheme.primary,
              label: "Belgeye Git",
            ).yetkiVarMi(widget.cariHareketleriModel.hareketAciklama != "Dekont")
          ].whereType<SlidableAction>().toList()),
      child: Stack(
        alignment: Alignment.centerRight,
        fit: StackFit.passthrough,
        children: [
          Padding(
            padding: UIHelper.lowPaddingHorizontal,
            child: Card(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        ListTile(
                          horizontalTitleGap: 0,
                          onTap: widget.onTap ?? () {},
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text("${widget.cariHareketleriModel.tarih?.toDateString ?? ""} (${widget.cariHareketleriModel.hareketKodu ?? ""}) "),
                                      const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(widget.cariHareketleriModel.dovizliMi)
                                      // widget.cariHareketleriModel.dovizliMi ? const Badge(label: Text("Dövizli")) : Container(),
                                    ],
                                  ),
                                  Text(widget.cariHareketleriModel.hareketAciklama ?? "", style: TextStyle(color: UIHelper.primaryColor)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                      "${widget.cariHareketleriModel.alacak?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? widget.cariHareketleriModel.borc?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                                      style: theme.textTheme.bodySmall?.copyWith(fontSize: 12)),
                                  Visibility(
                                      visible: widget.cariHareketleriModel.dovizliMi,
                                      child: Text(
                                          "${widget.cariHareketleriModel.dovizBakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.cariHareketleriModel.dovizAdi ?? mainCurrency}",
                                          style: theme.textTheme.bodySmall?.copyWith(fontSize: 12)))
                                ],
                              ),
                            ],
                          ),
                          subtitle: Wrap(
                            runAlignment: WrapAlignment.spaceBetween,
                            children: [
                              CustomWidgetWithLabel(isVertical: true, isTitleSmall: true, text: "Belge No", child: Text(widget.cariHareketleriModel.belgeNo ?? "")),
                              CustomWidgetWithLabel(isVertical: true, isTitleSmall: true, text: "Vade Tarihi", child: Text(widget.cariHareketleriModel.vadeTarihi?.toDateString ?? "")),
                              CustomWidgetWithLabel(isVertical: true, isTitleSmall: true, text: "Plasiyer", child: Text(widget.cariHareketleriModel.plasiyerAciklama ?? "")),
                              CustomWidgetWithLabel(isVertical: true, isTitleSmall: true, text: "Şube", child: Text("${widget.cariHareketleriModel.subeKodu ?? 0}"))
                            ].map((e) => SizedBox(width: width * 0.33, child: e).paddingOnly(right: UIHelper.lowSize, bottom: UIHelper.lowSize)).toList(),
                          ),
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Açıklama
                            SizedBox(
                              width: width * 0.3,
                              child: Text((widget.cariHareketleriModel.aciklama ?? ""),
                                  overflow: TextOverflow.ellipsis, softWrap: true, maxLines: 2, style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey, fontStyle: FontStyle.italic)),
                            ),
                            //YuruyenBakiye
                            Container(
                              alignment: Alignment.centerRight,
                              child: Text("Bakiye : ${dovizCheck.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${widget.dovizTipi ?? mainCurrency}",
                                  style: theme.textTheme.bodySmall?.copyWith(color: UIHelper.getColorWithValue(dovizCheck))),
                            ),
                          ].map((e) => e.paddingSymmetric(vertical: UIHelper.midSize, horizontal: UIHelper.highSize)).toList(),
                        )
                      ],
                    ).paddingAll(UIHelper.lowSize),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Visibility(visible: widget.cariHareketleriModel.hareketAciklama != "Dekont", child: Icon(Icons.chevron_right_outlined, color: theme.colorScheme.primary)),
          ).paddingOnly(right: UIHelper.lowSize)
        ],
      ),
    );
  }

  double get dovizCheck {
    if (dovizliMi) {
      return (widget.cariHareketleriModel.dovYuruyenBakiye ?? widget.cariHareketleriModel.yuruyenBakiye ?? 0);
    } else {
      return (widget.cariHareketleriModel.yuruyenBakiye ?? 0);
    }
  }
}
