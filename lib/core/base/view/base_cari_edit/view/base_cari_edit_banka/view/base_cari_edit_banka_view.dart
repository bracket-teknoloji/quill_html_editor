import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/helpers/helper.dart';

import '../../../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_detay_model.dart';

class BaseCariEditBankaView extends StatefulWidget {
  const BaseCariEditBankaView({super.key});

  @override
  State<BaseCariEditBankaView> createState() => _BaseCariEditBankaViewState();
}

class _BaseCariEditBankaViewState extends State<BaseCariEditBankaView> {
  CariDetayModel cariDetayModel = CariDetayModel.instance;
  @override
  Widget build(BuildContext context) {
    print(cariDetayModel.bankaList?[0].toJson());
    return ListView.builder(
      itemCount: cariDetayModel.bankaList?.length,
      itemBuilder: (context, index) {
        return Card(
            child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text(cariDetayModel.bankaList?[index].bankaAdi ?? ""), Badge(label: Text(cariDetayModel.bankaList?[index].dovizAdi ?? "TL"))],
            ),
            const Divider().paddingAll(UIHelper.lowSize),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [const Text("IBAN").paddingOnly(right: UIHelper.midSize), Text(cariDetayModel.bankaList?[index].ibanno ?? "")],
                    ),
                    IconButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(EdgeInsets.zero),
                      ),
                      onPressed: () {
                        // copy to clipboard
                        Get.put(CariDetayModel.instance);
                      },
                      icon: const Icon(Icons.share_outlined),
                    )
                  ],
                ),
                Row(children: [const Text("IBAN").paddingOnly(right: UIHelper.midSize), Text(cariDetayModel.bankaList?[index].subeAdi ?? "")]),
                Row(children: [const Text("Şube").paddingOnly(right: UIHelper.midSize), Text(cariDetayModel.bankaList?[index].bankahesno ?? "")]),
              ],
            ),
          ],
        ).paddingAll(UIHelper.lowSize));
      },
    );
  }
}
