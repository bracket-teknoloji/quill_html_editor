import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/belge_rehberi/model/belge_rehberi_model.dart";

final class BelgeRehberiCard extends StatelessWidget {
  const BelgeRehberiCard({required this.model, super.key});
  final BelgeRehberiModel model;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: () => Get.back(result: model),
          title: Text(model.belgeNo ?? ""),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Cari Kodu: ${model.cariKodu ?? ""}"),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  Text("Tarih: ${model.tarih.toDateString}"),
                  Text("Depo: ${model.depoKodu}-${model.depoTanimi}"),
                  Text("Kalem Adedi: ${model.kalemSayisi.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                ],
              ),
            ],
          ),
        ),
      );
}
