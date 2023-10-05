import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../view/main_page/alt_sayfalar/finans/banka/banka_islemleri/model/banka_islemleri_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/network/login/api_urls.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";

class BankaIslemleriCard extends StatefulWidget {
  final BankaIslemleriModel? bankaIslemleriModel;
  final ValueChanged? onDeleted;
  const BankaIslemleriCard({super.key, this.bankaIslemleriModel, this.onDeleted});

  @override
  State<BankaIslemleriCard> createState() => _BankaIslemleriCardState();
}

class _BankaIslemleriCardState extends BaseState<BankaIslemleriCard> {
  BankaIslemleriModel? get model => widget.bankaIslemleriModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await bottomSheetDialogManager.showBottomSheetDialog(context, title: model?.hesapAdi ?? "", children: [
          BottomSheetModel(title: "Sil", onTap: deleteData, iconWidget: Icons.delete_outline_outlined),
        ]);
      },
      child: Card(
          child: ListTile(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(model?.hesapAdi ?? "").yetkiVarMi(model?.hesapAdi != null),
                      Text(model?.tarih.toDateString ?? ""),
                    ],
                  ),
                  Text(model?.subeAdi ?? "", style: const TextStyle(color: Colors.grey)),
                  Text(model?.bankaAdi ?? "", style: const TextStyle(color: Colors.grey)),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hesap Kodu: ${model?.hesapAdi ?? ""}"),
                  Text("Belge No: ${model?.belgeno ?? ""}"),
                  Row(
                    children: [
                      Expanded(
                        child: Text.rich(TextSpan(children: [
                          const TextSpan(text: "Tür: "),
                          TextSpan(text: model?.hareketAciklama ?? "", style: TextStyle(color: model?.ba == "A" ? Colors.red : Colors.green)),
                        ])),
                      ),
                      Expanded(
                        child: Text.rich(TextSpan(children: [
                          const TextSpan(text: "Tutar: "),
                          TextSpan(text: "${model?.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: TextStyle(color: model?.ba == "A" ? Colors.red : Colors.green)),
                        ])),
                      ),
                    ],
                  ),
                  const Divider(indent: 0, endIndent: 0).paddingSymmetric(vertical: UIHelper.midSize),
                  Text("Açıklama: ${model?.aciklama}", overflow: TextOverflow.ellipsis, maxLines: 3),
                ],
              ))),
    );
  }

  void deleteData() async {
    Get.back();
    dialogManager.showAreYouSureDialog(() async {
      var result = await networkManager.dioPost<BankaIslemleriModel>(path: ApiUrls.deleteBankaHareket, bodyModel: BankaIslemleriModel(), data: {"INCKEYNO": model?.inckeyno}, showLoading: true);
      if (result.success == true) {
        widget.onDeleted?.call(model?.inckeyno);
      }
    }, title: "Bu kaydı sildiğinizde cari, kasa, banka, dekont gibi bağlantılı işlemler silinebilir. Onaylıyor musunuz?");
  }
}
