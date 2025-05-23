import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../model/stok_detay_model.dart";

final class BaseStokEditFiyatListesiView extends StatefulWidget {
  const BaseStokEditFiyatListesiView({super.key});

  @override
  State<BaseStokEditFiyatListesiView> createState() => _BaseStokEditFiyatListesiViewState();
}

final class _BaseStokEditFiyatListesiViewState extends State<BaseStokEditFiyatListesiView> {
  StokDetayModel model = StokDetayModel.instance;
  @override
  Widget build(BuildContext context) => model.fiyatList.ext.isNotNullOrEmpty
      ? ListView.builder(
          itemCount: model.fiyatList?.length,
          itemBuilder: (context, index) => Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Visibility(
                  visible: model.fiyatList?[index].gecerli == "E",
                  child: const Badge(label: Text("Geçerli Fiyat")),
                ),
                Text("Yap. Kodu: ${model.fiyatList![index].stokKodu ?? ""}"),
                Row(
                  children: [
                    Expanded(child: Text("Alış-Satış: ${model.fiyatList![index].aS == "S" ? "Satış" : "Alış"}")),
                    Expanded(child: Text("Başlama: ${model.fiyatList![index].bastar!.toDateString}")),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Text("Bitiş: ${model.fiyatList![index].bittar ?? ""}")),
                    Expanded(
                      child: Text(
                        "Fiyat 1: ${model.fiyatList![index].fiyat1.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Fiyat 2: ${model.fiyatList![index].fiyat2.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "Fiyat 3: ${model.fiyatList![index].fiyat3.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
                      ),
                    ),
                  ],
                ),
                Text("Fiyat 4: ${model.fiyatList![index].fiyat4.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ).paddingAll(UIHelper.lowSize)
      : const Center(child: Text("Fiyat bilgisi bulunamadı"));
}
