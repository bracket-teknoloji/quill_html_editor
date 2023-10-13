import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/model/kasa_islemleri_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/network/login/api_urls.dart";
import "../badge/colorful_badge.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";

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
        await bottomSheetDialogManager.showBottomSheetDialog(context, title: model?.aciklama ?? model?.cariAdi ?? model?.kasaAdi ?? "", children: [
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
                      Text(model?.tarih.toDateString ?? ""),
                      Row(
                        children: [
                          Text(model?.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari) ?? "", style: const TextStyle(color: Colors.grey))
                              .paddingOnly(right: UIHelper.lowSize)
                              .yetkiVarMi(model?.dovizTutari != null && model?.dovizTutari != 0),
                          Text(
                            "${model?.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} $mainCurrency",
                            style: TextStyle(color: model?.gc == "G" ? Colors.green : Colors.red),
                          ),
                        ],
                      )
                    ],
                  ),
                  Text(model?.cariAdi ?? "").yetkiVarMi(model?.cariAdi != null),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(model?.belgeNo ?? ""),
                      ColorfulBadge(label: Text(model?.tipAciklama ?? ""), badgeColorEnum: BadgeColorEnum.cari),
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
                      ).yetkiVarMi(model?.projeAdi != null && yetkiController.projeUygulamasiAcikMi),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Plasiyer", style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(model?.plasiyerAdi ?? "", overflow: TextOverflow.ellipsis),
                        ],
                      ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi && model?.plasiyerAdi != null),
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
    await dialogManager.showAreYouSureDialog(
      () async {
        var result =
            await networkManager.dioPost<KasaIslemleriModel>(path: ApiUrls.deleteKasaHareket, bodyModel: KasaIslemleriModel(), queryParameters: {"INCKEYNO": model?.inckeyno}, showLoading: true);
        if (result.success == true) {
          widget.onDeleted?.call(model?.inckeyno);
          dialogManager.showSuccessSnackBar(result.message ?? "");
        } else {
          dialogManager.showErrorSnackBar(result.message ?? "");
        }
      },
      title: "Bu kasa kaydını silmek istediğinizden emin misiniz?",
    );
  }
}
