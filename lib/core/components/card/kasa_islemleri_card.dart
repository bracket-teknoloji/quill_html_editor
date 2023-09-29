import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/model/kasa_islemleri_model.dart";

class KasaIslemleriCard extends StatefulWidget {
  final KasaIslemleriModel? kasaIslemleriModel;
  final ValueChanged? onDeleted;
  const KasaIslemleriCard({super.key, this.kasaIslemleriModel, this.onDeleted});

  @override
  State<KasaIslemleriCard> createState() => _KasaIslemleriCardState();
}

class _KasaIslemleriCardState extends BaseState<KasaIslemleriCard> {
  KasaIslemleriModel? get model => widget.kasaIslemleriModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        await bottomSheetDialogManager.showBottomSheetDialog(context, title: model?.aciklama ?? model?.cariAdi ?? "", children: [
          BottomSheetModel(title: "Sil", onTap: deleteData, iconWidget: Icons.delete_outline_outlined),
        ]);
      },
      child: Card(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Proje", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(model?.projeAdi ?? "", overflow: TextOverflow.ellipsis),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Plasiyer", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(model?.plasiyerAdi ?? "", overflow: TextOverflow.ellipsis),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Kasa", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(model?.kasaAdi ?? "", overflow: TextOverflow.ellipsis),
                ],
              )
            ].map((e) => Expanded(child: e)).toList(),
          ).paddingSymmetric(vertical: UIHelper.lowSize),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Açıklama", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(model?.aciklama ?? ""),
            ],
          )
        ].where((element) => element is! SizedBox).toList(),
      ).paddingAll(UIHelper.midSize).paddingOnly(top: UIHelper.lowSize, left: UIHelper.lowSize)),
    );
  }

  void deleteData() async {
    Get.back();
    var result = await networkManager.dioPost<KasaIslemleriModel>(path: ApiUrls.deleteKasaHareket, bodyModel: KasaIslemleriModel(), queryParameters: {"INCKEYNO": model?.inckeyno}, showLoading: true);
    if (result.success == true) {
      widget.onDeleted?.call(model?.inckeyno);
      dialogManager.showSuccessSnackBar(result.message ?? "");
    } else {
      dialogManager.showErrorSnackBar(result.message ?? "");
    }
  }
}
