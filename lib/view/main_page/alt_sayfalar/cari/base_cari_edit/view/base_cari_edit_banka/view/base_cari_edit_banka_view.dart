import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../../../../../core/base/state/base_state.dart';
import '../../../../../../../../core/constants/ui_helper/ui_helper.dart';
import '../../../../cari_listesi/model/cari_detay_model.dart';

class BaseCariEditBankaView extends StatefulWidget {
  const BaseCariEditBankaView({super.key});

  @override
  State<BaseCariEditBankaView> createState() => _BaseCariEditBankaViewState();
}

class _BaseCariEditBankaViewState extends BaseState<BaseCariEditBankaView> {
  CariDetayModel cariDetayModel = CariDetayModel.instance;
  @override
  Widget build(BuildContext context) {
    return cariDetayModel.bankaList == null || cariDetayModel.bankaList!.isEmpty
        ? const Center(
            child: Text("Banka bilgisi bulunamadı"),
          )
        : ListView.builder(
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
                              Clipboard.setData(ClipboardData(text: cariDetayModel.bankaList?[index].ibanno ?? ""));
                              dialogManager.showSnackBar("IBAN numarası kopyalandı.");
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
