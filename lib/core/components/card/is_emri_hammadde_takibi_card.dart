import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_hammade_takibi/model/is_emri_hammadde_takibi_listesi_model.dart";

import "../../base/state/base_state.dart";

final class IsEmriHammaddeTakibiCard extends StatefulWidget {
  const IsEmriHammaddeTakibiCard({required this.model, super.key});
  final IsEmriHammaddeTakibiListesiModel model;

  @override
  State<IsEmriHammaddeTakibiCard> createState() => _IsEmriHammaddeTakibiCardState();
}

final class _IsEmriHammaddeTakibiCardState extends BaseState<IsEmriHammaddeTakibiCard> {
  IsEmriHammaddeTakibiListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: () async {
            await Get.toNamed("mainPage/isEmriHammaddeTakibiDetay", arguments: model);
          },
          leading: CircleAvatar(
            child: Text(model.makineKodu ?? ""),
          ),
          title: Text("#${model.takipno ?? ""}"),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.stokAdi ?? ""),
              Text(model.stokKodu ?? ""),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  Text("YapKod: ${model.yapkod}").yetkiVarMi(model.yapacik != null),
                  Text("Yap.Açık.: ${model.yapacik}").yetkiVarMi(model.yapacik != null),
                ],
              ),
              Text("İş Emri No: ${model.isemrino}").yetkiVarMi(model.isemrino != null),
              Text("Miktar: ${model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.miktar != null),
            ],
          ),
        ),
      );
}
