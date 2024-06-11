import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/model/kasa_islemleri_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../base/state/base_state.dart";
import "../../base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../constants/color_palette.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/extensions/model_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
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
  bool get isCari => model?.tip == "C";
  bool get isTahsilat => isCari && model?.gc == "G";
  bool get isOdeme => isCari && model?.gc == "C";
  @override
  Widget build(BuildContext context) => InkWell(
        onTap: () async {
          await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: model?.aciklama ?? model?.cariAdi ?? model?.kasaAdi ?? "",
            children: [
              BottomSheetModel(title: "Tahsilat Makbuzu", onTap: () async => showMakbuz(true), iconWidget: Icons.receipt_long_outlined).yetkiKontrol(isTahsilat),
              BottomSheetModel(title: "Ödeme Makbuzu", onTap: () async => showMakbuz(false), iconWidget: Icons.delete_outline_outlined).yetkiKontrol(isOdeme),
              BottomSheetModel(title: loc.generalStrings.delete, onTap: deleteData, iconWidget: Icons.delete_outline_outlined),
            ].nullCheckWithGeneric,
          );
        },
        child: Card(
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text(model?.tarih.toDateString ?? ""), bakiyeText],
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
                ),
              ],
            ),
          ),
        ),
      );

  Future<void> deleteData() async {
    Get.back();
    await dialogManager.showAreYouSureDialog(
      () async {
        final result =
            await networkManager.dioPost<KasaIslemleriModel>(path: ApiUrls.deleteKasaHareket, bodyModel: KasaIslemleriModel(), queryParameters: {"INCKEYNO": model?.inckeyno}, showLoading: true);
        if (result.isSuccess) {
          widget.onDeleted?.call(model?.inckeyno);
          dialogManager.showSuccessSnackBar(result.message ?? "");
        } else {
          dialogManager.showErrorSnackBar(result.message ?? "");
        }
      },
      title: "Bu kasa kaydını silmek istediğinizden emin misiniz?",
    );
  }

  Future<void> showMakbuz(bool tahsilatMi) async {
    Get.back();
    final PdfModel pdfModel = PdfModel(raporOzelKod: tahsilatMi ? "TahsilatMakbuzu" : "OdemeMakbuzu", dicParams: DicParams());
    final anaVeri = CacheManager.getAnaVeri;
    final result = anaVeri?.paramModel?.netFectDizaynList?.where((element) => element.ozelKod == (tahsilatMi ? "TahsilatMakbuzu" : "OdemeMakbuzu")).toList();
    NetFectDizaynList? dizaynList;
    if (result.ext.isNotNullOrEmpty) {
      pdfModel.dicParams?.caharInckey = model?.caharInckeyno.toStringIfNotNull;
      pdfModel.dicParams?.kasaharInckey = model?.inckeyno.toStringIfNotNull;
      pdfModel.dicParams?.belgeNo = model?.belgeNo;
      if (result!.length == 1) {
        pdfModel.dizaynId = result.firstOrNull?.id;
        dizaynList = result.first;
      } else {
        dizaynList = await bottomSheetDialogManager.showDizaynBottomSheetDialog(context, pdfModel.dizaynId);
        pdfModel.dizaynId = dizaynList?.id;
      }
      if (dizaynList != null) {
        Get.back();
        await Get.to(() => PDFViewerView(title: dizaynList?.dizaynAdi ?? "", pdfData: pdfModel));
      }
    } else {
      Get.back();
      dialogManager.showErrorSnackBar("Dizayn bulunamadı");
    }
  }

  RichText get bakiyeText {
    final bool dovizliMi = model?.dovizAdi != null;
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: dovizliMi
                ? (model?.tutar != 0 ? " ${model?.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} $mainCurrency" : "")
                : (model?.dovizTutari != 0 ? " ${model?.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} ${model?.dovizAdi ?? ""}" : ""),
            style: const TextStyle(color: ColorPalette.slateGray, fontSize: UIHelper.midSize),
          ),
          TextSpan(
            text: dovizliMi
                ? (model?.dovizTutari != 0 ? " ${model?.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} ${model?.dovizAdi ?? ""}" : "")
                : (model?.tutar != 0 ? " ${model?.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} $mainCurrency" : ""),
            style: TextStyle(color: model?.gc == "G" ? ColorPalette.mantis : ColorPalette.persianRed),
          ),
        ],
      ),
    );
  }
}
