import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_islemleri/model/banka_islemleri_model.dart";

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
        await bottomSheetDialogManager.showBottomSheetDialog(context, title: model?.aciklama ?? model?.cariAdi ?? "", children: [
          BottomSheetModel(title: "Sil", onTap: deleteData, iconWidget: Icons.delete_outline_outlined),
        ]);
      },
      child: Card(
          child: ListTile(
              title: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(model?.tarih.toDateString ?? ""),
                      Text(
                        "${model?.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} $mainCurrency",
                        style: TextStyle(color: model?.gc == "G" ? Colors.green : Colors.red),
                      )
                    ],
                  ),
                  Text(model?.cariAdi ?? "").yetkiVarMi(model?.cariAdi != null),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(model?.belgeNo ?? ""),
                      ColorfulBadge(label: Text(model?.tipAciklama ?? ""), badgeColorEnum: BadgeColorEnum.tipAciklama),
                    ],
                  ),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Proje", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(model?.projeAdi ?? "", overflow: TextOverflow.ellipsis),
                        ],
                      ).yetkiVarMi(model?.projeAdi != null && parametreModel.projeUygulamasiAcik == true),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Plasiyer", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(model?.plasiyerAdi ?? "", overflow: TextOverflow.ellipsis),
                        ],
                      ).yetkiVarMi(parametreModel.plasiyerUygulamasi == true && model?.plasiyerAdi != null),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Kasa", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(model?.kasaAdi ?? "", overflow: TextOverflow.ellipsis),
                        ],
                      ).yetkiVarMi(model?.kasaAdi != null),
                    ].map((e) => e is! SizedBox ? Expanded(child: e) : null).toList().nullCheckWithGeneric,
                  ).paddingSymmetric(vertical: UIHelper.lowSize),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Açıklama", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(model?.aciklama ?? ""),
                    ].where((element) => element is! SizedBox).toList(),
                  )
                ],
              ))),
    );
  }

  void deleteData() async {
    Get.back();
    var result =
        await networkManager.dioPost<BankaIslemleriModel>(path: ApiUrls.deleteKasaHareket, bodyModel: BankaIslemleriModel(), queryParameters: {"INCKEYNO": model?.inckeyno}, showLoading: true);
    if (result.success == true) {
      widget.onDeleted?.call(model?.inckeyno);
      dialogManager.showSuccessSnackBar(result.message ?? "");
    } else {
      dialogManager.showErrorSnackBar(result.message ?? "");
    }
  }
}
