import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../view/main_page/alt_sayfalar/stok/fiyat_gecmisi/model/fiyat_gecmisi_response_model.dart";
import "../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/text_style_helper.dart";
import "../../constants/ui_helper/ui_helper.dart";

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
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
            onTap: () {
              widget.onTap?.call();
              dialogManager.showStokGridViewDialog(StokListesiModel()..stokKodu = widget.model?.stokKodu ?? "");
            },
            onLongPress: () {},
            trailing: IconButton(
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
            title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.model?.stokAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize),
                Visibility(visible: widget.model?.dovizAdi != null, child: Badge(label: Text("Dövizli ${widget.model?.dovizAdi}"))),
                Wrap(
                  direction: Axis.horizontal,
                  children: [
                    Wrap(
                      direction: Axis.vertical,
                      children: [
                        const Text("Stok Kodu", style: TextStyleHelper.captionWhite),
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
                        const Text("Fiyat Tarihi", style: TextStyleHelper.captionWhite),
                        Text(widget.model?.tarih?.toDateString ?? ""),
                      ],
                    ),
                  ].map((e) => SizedBox(width: width * 0.25, child: e)).toList(),
                )
              ],
            )));
  }
}
