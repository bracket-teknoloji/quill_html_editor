import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../cari_listesi/model/cari_detay_model.dart";

final class BaseCariEditIletisimView extends StatefulWidget {
  const BaseCariEditIletisimView({super.key});

  @override
  State<BaseCariEditIletisimView> createState() => _BaseCariEditIletisimViewState();
}

final class _BaseCariEditIletisimViewState extends State<BaseCariEditIletisimView> {
  final CariDetayModel _cariDetayModel = CariDetayModel.instance;
  @override
  Widget build(BuildContext context) {
    if (_cariDetayModel.irtibatList.ext.isNullOrEmpty) {
      return const Center(
        child: Text("İletişim bilgisi bulunamadı"),
      );
    }
    return ListView.builder(
      itemCount: _cariDetayModel.irtibatList?.length ?? 0,
      itemBuilder: (context, index) => Card(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_cariDetayModel.irtibatList?[index].yetkiliKisi ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
              Text(_cariDetayModel.irtibatList?[index].gorev ?? ""),
              Row(
                children: <Widget>[
                  Expanded(child: Text("Tel 1:", style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.slateGray.withValues(alpha: 0.5)))),
                  Expanded(flex: 3, child: Text(_cariDetayModel.irtibatList?[index].sabitTel1 ?? "")),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(child: Text("E-Posta:", style: TextStyle(fontWeight: FontWeight.bold, color: ColorPalette.slateGray.withValues(alpha: 0.5)))),
                  Expanded(flex: 3, child: Text(_cariDetayModel.irtibatList?[index].emailSplit?.replaceAll(";", "\n") ?? "")),
                ],
              ),
            ],
          ),
        ).paddingAll(UIHelper.lowSize),
      ),
    );
  }
}
