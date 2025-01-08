import "package:flutter/material.dart";

import "../../../view/main_page/alt_sayfalar/hucre_takibi/hucre_edit/alt_sayfalar/hucre_takibi_stoklar/model/hucre_takibi_stoklar_model.dart";
import "../../base/state/base_state.dart";
import "../../base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../layout/custom_layout_builder.dart";

final class HucreAraCard extends StatefulWidget {
  const HucreAraCard({required this.model, super.key});
  final HucreTakibiStoklarModel model;

  @override
  State<HucreAraCard> createState() => _HucreAraCardState();
}

final class _HucreAraCardState extends BaseState<HucreAraCard> {
  HucreTakibiStoklarModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: () async {
            dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: model.stokKodu)));
          },
          title: Text(model.stokAdi ?? ""),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Eksiye Düşebilen Hücre", style: TextStyle(color: UIHelper.primaryColor)).yetkiVarMi(model.eksiyeDusebilir == true),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  Text("Hücre: ${model.hucreKodu}"),
                  Text("Stok Kodu: ${model.stokKodu}"),
                  Text("Depo: ${model.depoKodu}-${model.depoTanimi}"),
                ],
              ),
            ],
          ),
        ),
      );
}
