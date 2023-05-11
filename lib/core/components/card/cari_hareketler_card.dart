import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/components/textfield/custom_label_widget.dart';
import 'package:picker/core/constants/extensions/date_time_extensions.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart';

import '../../base/state/base_state.dart';

class CariHareketlerCard extends StatefulWidget {
  final CariHareketleriModel cariHareketleriModel;
  final dynamic Function()? onTap;

  const CariHareketlerCard({super.key, this.onTap, required this.cariHareketleriModel});

  @override
  State<CariHareketlerCard> createState() => _CariHareketlerCardState();
}

class _CariHareketlerCardState extends BaseState<CariHareketlerCard> {
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
                        Text("${widget.cariHareketleriModel.tarih?.toDateString() ?? ""} (${widget.cariHareketleriModel.hareketKodu ?? ""}) "),
                        (widget.cariHareketleriModel.dovizBorc != null || widget.cariHareketleriModel.dovizAlacak != null) ? const Badge(label: Text("Dövizli")) : Container(),
                      ],
                    ),
                    Text(widget.cariHareketleriModel.hareketAciklama ?? "", style: TextStyle(color: UIHelper.primaryColor)),
                  ],
                ),
                Text("${widget.cariHareketleriModel.alacak?.dotSeparatedWithFixedDigits ?? widget.cariHareketleriModel.borc?.dotSeparatedWithFixedDigits} TL",
                    style: theme.textTheme.bodySmall?.copyWith(fontSize: 12)),
              ],
            ),
            subtitle: Wrap(
              runAlignment: WrapAlignment.spaceBetween,
              children: [
                CustomWidgetWithLabel(isVertical: true, isTitleSmall: true, text: "Belge No", children: [Text(widget.cariHareketleriModel.belgeNo ?? "")]),
                CustomWidgetWithLabel(isVertical: true, isTitleSmall: true, text: "Vade Tarihi", children: [Text(widget.cariHareketleriModel.vadeTarihi?.toDateString() ?? "")]),
                CustomWidgetWithLabel(isVertical: true, isTitleSmall: true, text: "Plasiyer", children: [Text(widget.cariHareketleriModel.plasiyerAciklama ?? "")]),
                CustomWidgetWithLabel(isVertical: true, isTitleSmall: true, text: "Şube", children: [Text("${widget.cariHareketleriModel.subeKodu ?? 0}")])
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
                  child: Text("Bakiye : ${widget.cariHareketleriModel.yuruyenBakiye?.dotSeparatedWithFixedDigits} TL",
                      style: theme.textTheme.bodySmall?.copyWith(color: widget.cariHareketleriModel.yuruyenBakiye! > 0 ? Colors.green : Colors.red))),
            ].map((e) => e.paddingAll(UIHelper.lowSize)).toList(),
          )
        ],
      ).paddingAll(UIHelper.lowSize),
    );
  }
}
