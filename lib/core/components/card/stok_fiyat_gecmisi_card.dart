import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../view/main_page/alt_sayfalar/stok/fiyat_gecmisi/model/fiyat_gecmisi_response_model.dart";
import "../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/color_palette.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/text_style_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../badge/colorful_badge.dart";

class StokFiyatGecmisiCard extends StatefulWidget {
  final FiyatGecmisiResponseModel? model;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function()? onPrint;
  const StokFiyatGecmisiCard({super.key, this.model, this.onTap, this.onLongPress, this.onPrint});

  @override
  State<StokFiyatGecmisiCard> createState() => StokFiyatGecmisiCardState();
}

class StokFiyatGecmisiCardState extends BaseState<StokFiyatGecmisiCard> {
  @override
  Widget build(BuildContext context) => Card(
        color: widget.model?.yazdirildi == "E" ? ColorPalette.mantis.withOpacity(0.4) : null,
        child: ListTile(
          onTap: () {
            widget.onTap?.call();
            dialogManager.showStokGridViewDialog(StokListesiModel()..stokKodu = widget.model?.stokKodu ?? "");
          },
          onLongPress: () {},
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: width * 0.6, child: Text(widget.model?.stokAdi ?? "", overflow: TextOverflow.ellipsis)),
              IconButton(
                icon: Icon(Icons.print_outlined, color: UIHelper.primaryColor),
                onPressed: () async {
                  widget.onPrint?.call();
                  // var result = await Get.toNamed("/qr");
                  // if (result != null) {
                  //   controller.text = result.toString();
                  // }
                  // getData();
                },
              ),
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ColorfulBadge(label: Text("Dövizli ${widget.model?.dovizAdi}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(widget.model?.dovizAdi != null),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text("Stok Kodu", style: TextStyleHelper.captionWhite),
                      Text(widget.model?.stokKodu ?? ""),
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text("Satış Fiyatı (${widget.model?.fiyatSirasi})", style: TextStyleHelper.captionWhite),
                      Text("${widget.model?.fiyat?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} ${widget.model?.dovizAdi ?? mainCurrency}"),
                    ],
                  ),
                  Wrap(
                    direction: Axis.vertical,
                    children: [
                      Text("Fiyat Tarihi", style: TextStyleHelper.captionWhite),
                      Text(widget.model?.tarih?.toDateString ?? ""),
                    ],
                  ),
                ].map((e) => SizedBox(width: width * 0.4, child: e).paddingOnly(bottom: UIHelper.lowSize)).toList(),
              ),
            ],
          ),
        ),
      );
}
