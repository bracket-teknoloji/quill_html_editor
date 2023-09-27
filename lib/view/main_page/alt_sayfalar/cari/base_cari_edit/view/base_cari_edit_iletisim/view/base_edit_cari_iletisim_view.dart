import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../cari_listesi/model/cari_detay_model.dart";

class BaseCariEditIletisimView extends StatefulWidget {
  const BaseCariEditIletisimView({super.key});

  @override
  State<BaseCariEditIletisimView> createState() => _BaseCariEditIletisimViewState();
}

class _BaseCariEditIletisimViewState extends State<BaseCariEditIletisimView> {
  final CariDetayModel _cariDetayModel = CariDetayModel.instance;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _cariDetayModel.irtibatList?.length ?? 0,
      itemBuilder: (context, index) {
        if (_cariDetayModel.irtibatList == null || _cariDetayModel.irtibatList!.isEmpty) {
          return const Center(
            child: Text("İletişim bilgisi bulunamadı"),
          );
        }
        return Card(
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(_cariDetayModel.irtibatList?[index].yetkiliKisi ?? "", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Text(_cariDetayModel.irtibatList?[index].gorev ?? ""),
                Row(
                  children: [
                    Expanded(flex: 1, child: Text("Tel 1:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.withOpacity(0.5)))),
                    Expanded(flex: 3, child: Text(_cariDetayModel.irtibatList?[index].sabitTel1 ?? "")),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(flex: 1, child: Text("E-Posta:", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey.withOpacity(0.5)))),
                    Expanded(flex: 3, child: Text(_cariDetayModel.irtibatList?[index].emailSplit?.replaceAll(";", "\n") ?? "")),
                  ],
                ),
              ],
            ),
          ).paddingAll(UIHelper.lowSize),
        );
      },
    );
  }
}
