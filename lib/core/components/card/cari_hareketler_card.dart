import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/extensions/date_time_extensions.dart";
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
    return Card(
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
                        widget.cariHareketleriModel.dovizliMi ? const Badge(label: Text("Dövizli")) : Container(),
                      ],
                    ),
                    Text(widget.cariHareketleriModel.hareketAciklama ?? "", style: TextStyle(color: UIHelper.primaryColor)),
                  ],
                ),
                Column(
                  children: [
                    Text("${widget.cariHareketleriModel.alacak?.commaSeparatedWithFixedDigits ?? widget.cariHareketleriModel.borc?.commaSeparatedWithFixedDigits} TL",
                        style: theme.textTheme.bodySmall?.copyWith(fontSize: 12)),
                    Visibility(
                        visible: widget.cariHareketleriModel.dovizliMi,
                        child: Text("${widget.cariHareketleriModel.dovizBakiye.commaSeparatedWithFixedDigits} ${widget.cariHareketleriModel.dovizAdi ?? "TL"}",
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
                width: width * 0.5,
                child: Text(widget.cariHareketleriModel.aciklama ?? "",
                    overflow: TextOverflow.ellipsis, softWrap: true, maxLines: 2, style: theme.textTheme.bodySmall?.copyWith(color: Colors.grey, fontStyle: FontStyle.italic)),
              ),
              //YuruyenBakiye
              Container(
                  alignment: Alignment.topRight,
                  width: width * 0.4,
                  child: Text("Bakiye : ${dovizCheck.commaSeparatedWithFixedDigits} ${widget.dovizTipi ?? "TL"}",
                      style: theme.textTheme.bodySmall?.copyWith(color: UIHelper.getColorWithValue(dovizCheck)))),
            ].map((e) => e.paddingAll(UIHelper.lowSize)).toList(),
          )
        ],
      ).paddingAll(UIHelper.lowSize),
    );
  }

  double get dovizCheck => dovizliMi ? widget.cariHareketleriModel.dovYuruyenBakiye ?? 0 : widget.cariHareketleriModel.yuruyenBakiye ?? 0;
}
