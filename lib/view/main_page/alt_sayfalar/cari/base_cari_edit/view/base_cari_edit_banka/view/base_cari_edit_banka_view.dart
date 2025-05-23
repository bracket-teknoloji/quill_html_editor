import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:get/get.dart";
import "package:share_plus/share_plus.dart";

import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../cari_listesi/model/cari_detay_model.dart";

final class BaseCariEditBankaView extends StatefulWidget {
  const BaseCariEditBankaView({super.key});

  @override
  State<BaseCariEditBankaView> createState() => _BaseCariEditBankaViewState();
}

final class _BaseCariEditBankaViewState extends BaseState<BaseCariEditBankaView> {
  CariDetayModel cariDetayModel = CariDetayModel.instance;
  @override
  Widget build(BuildContext context) => cariDetayModel.bankaList == null || cariDetayModel.bankaList!.isEmpty
      ? const Center(child: Text("Banka bilgisi bulunamadı"))
      : ListView.builder(
          itemCount: cariDetayModel.bankaList?.length,
          itemBuilder: (context, index) => Card(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(cariDetayModel.bankaList?[index].bankaAdi ?? ""),
                    Badge(label: Text(cariDetayModel.bankaList?[index].dovizAdi ?? mainCurrency)),
                  ],
                ),
                const Divider().paddingAll(UIHelper.lowSize),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const Text("IBAN").paddingOnly(right: UIHelper.midSize),
                            Text(cariDetayModel.bankaList?[index].ibanno ?? ""),
                          ],
                        ),
                        IconButton(
                          style: ButtonStyle(padding: WidgetStateProperty.all(EdgeInsets.zero)),
                          onPressed: () {
                            Clipboard.setData(ClipboardData(text: cariDetayModel.bankaList?[index].ibanno ?? ""));
                            dialogManager.showInfoSnackBar("IBAN numarası kopyalandı.");
                            Share.share(cariDetayModel.bankaList?[index].ibanno ?? "");
                          },
                          icon: const Icon(Icons.share_outlined),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text("IBAN").paddingOnly(right: UIHelper.midSize),
                        Text(cariDetayModel.bankaList?[index].subeAdi ?? ""),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        const Text("Şube").paddingOnly(right: UIHelper.midSize),
                        Text(cariDetayModel.bankaList?[index].bankahesno ?? ""),
                      ],
                    ),
                  ],
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        );
}
