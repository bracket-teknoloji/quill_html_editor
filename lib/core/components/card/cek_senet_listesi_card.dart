import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/enum/cek_senet_listesi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/delete_cek_senet_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../base/model/edit_fatura_model.dart";
import "../../base/state/base_state.dart";
import "../../base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../constants/color_palette.dart";
import "../badge/colorful_badge.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";

class CekSenetListesiCard extends StatefulWidget {
  final CekSenetListesiModel model;
  final CekSenetListesiEnum cekSenetListesiEnum;
  final ValueChanged<bool>? onUpdate;
  const CekSenetListesiCard({super.key, required this.model, required this.cekSenetListesiEnum, this.onUpdate});

  @override
  State<CekSenetListesiCard> createState() => _CekSenetListesiCardState();
}

class _CekSenetListesiCardState extends BaseState<CekSenetListesiCard> {
  CekSenetListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onLongPress: () async {
            final result = await dialogManager.showCekSenetGridViewDialog(model);
            if (result != null) {
              widget.onUpdate?.call(true);
            }
          },
          onTap: () async {
            final result = await bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: model.belgeNo ?? "",
              children: bottomSheetItems.where((element) => element?.onTap != null).toList().nullCheckWithGeneric,
            );
            if (result != null) {
              widget.onUpdate?.call(true);
            }
          },
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Wrap(
                    alignment: WrapAlignment.start,
                    runAlignment: WrapAlignment.start,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: UIHelper.lowSize,
                    children: [
                      Text(model.belgeNo ?? ""),
                      Icon(
                        Icons.camera_alt_outlined,
                        size: UIHelper.highSize,
                      ).yetkiVarMi((model.evrakSayisi ?? 0) > 0),
                    ],
                  ),
                  Text(model.yerAciklamaDurum, style: TextStyle(color: UIHelper.primaryColor, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(model.dovizKodu != null),
                ],
              ),
              Text(model.cariKodu ?? ""),
              LayoutBuilder(
                builder: (context, constraints) => Wrap(
                  children: [
                    Text("Döviz Tutarı: ${model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${model.dovizKodu}").yetkiVarMi(model.dovizTutari != null),
                    Text("Tutar: ${model.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"),
                    Text("İşlem Tarihi: ${model.tarih.toDateString}"),
                    Text("Vade Tarihi: ${model.vadeTarihi.toDateString}"),
                    Text("Asıl/Ciro: ${model.ciroTipiString}").yetkiVarMi(!widget.cekSenetListesiEnum.borcMu),
                    Text("Seri No: ${model.seriNo ?? ""}").yetkiVarMi(widget.cekSenetListesiEnum.cekMi),
                  ]
                      .map(
                        (e) => e is! SizedBox
                            ? SizedBox(
                                width: constraints.maxWidth / 2,
                                child: e,
                              )
                            : null,
                      )
                      .toList()
                      .nullCheckWithGeneric,
                ),
              ),
              Text("${model.getCekBankaAdi} ${model.getCekSubeAdi}").paddingSymmetric(vertical: UIHelper.lowSize).yetkiVarMi(model.getCekBankaAdi != null || model.getCekSubeAdi != null),
              Text(model.aciklamalar, style: const TextStyle(color: ColorPalette.slateGray)),
            ],
          ),
        ),
      );

  List<BottomSheetModel?> get bottomSheetItems => [
        BottomSheetModel(
          title: loc(context).generalStrings.view,
          iconWidget: Icons.preview_outlined,
          onTap: goruntuleCekSenet,
        ),
        BottomSheetModel(
          title: loc(context).generalStrings.delete,
          iconWidget: Icons.delete_outline_outlined,
          onTap: deleteCekSenet,
        ).yetkiKontrol(widget.cekSenetListesiEnum.silebilirMi),
        BottomSheetModel(
          title: loc(context).generalStrings.transactions,
          iconWidget: Icons.list_alt_outlined,
          onTap: () {
            Get.back();
            dialogManager.showCekSenetGridViewDialog(model);
          },
        ),
        BottomSheetModel(
          title: "Hareketler",
          iconWidget: Icons.sync_alt_outlined,
          onTap: hareketlerCekSenet,
        ).yetkiKontrol(widget.cekSenetListesiEnum.hareketlerGorulebilirMi),
        BottomSheetModel(
          title: "Evraklar",
          iconWidget: Icons.description_outlined,
          onTap: evraklarCekSenet,
        ),
        BottomSheetModel(title: "Tahsilat Makbuzu", iconWidget: Icons.receipt_long_outlined, onTap: showTahsilatMakbuzu),
        BottomSheetModel(
          title: "Cari İşlemleri",
          iconWidget: Icons.person_outline_outlined,
          onTap: cariIslemleri,
        ),
      ];

  Future<void> cariIslemleri() async {
    Get.back();
    final result = await networkManager.dioGet(
      path: ApiUrls.getCariler,
      bodyModel: CariListesiModel(),
      showLoading: true,
      queryParameters: {"filterText": "", "Kod": model.verenKodu, "EFaturaGoster": true, "KisitYok": true, "BelgeTuru": model.belgeTipi, "PlasiyerKisitiYok": true},
    );

    dialogManager.showCariGridViewDialog(result.data.first);
  }

  Future<void> evraklarCekSenet() async {
    Get.back();
    await Get.toNamed("/mainPage/cekSenetEvraklari", arguments: model);
    widget.onUpdate?.call(true);
  }

  Future<void> goruntuleCekSenet() async {
    Get.back();
    await Get.toNamed("/mainPage/cekSenetGoruntule", arguments: model);
  }

  void hareketlerCekSenet() {
    Get.back();
    Get.toNamed("/mainPage/cekSenetHareketleri", arguments: model);
  }

  Future<void> deleteCekSenet() async {
    Get.back();
    await dialogManager.showAreYouSureDialog(() async {
      final result = await networkManager.dioPost(
        path: ApiUrls.deleteCekSenet,
        bodyModel: const EditFaturaModel(),
        showLoading: true,
        data: DeleteCekSenetModel(belgeNo: model.belgeNo, belgeTipi: model.belgeTipi, islemKodu: 5, pickerTahsilatTuru: model.belgeTipi, tag: "CekSenetBordroModel").toJson(),
      );
      if (result.success ?? false) {
        dialogManager.showSuccessSnackBar(result.message ?? "Silme işlemi başarılı");
        widget.onUpdate?.call(result.success ?? false);
      }
    });
  }

  Future<void> showTahsilatMakbuzu() async {
    Get.back();
    final PdfModel pdfModel = PdfModel(raporOzelKod: "TahsilatMakbuzu", dicParams: DicParams());
    final anaVeri = CacheManager.getAnaVeri;
    final result = anaVeri?.paramModel?.netFectDizaynList?.where((element) => element.ozelKod == "TahsilatMakbuzu").toList();
    NetFectDizaynList? dizaynList;
    if (result.ext.isNotNullOrEmpty) {
      pdfModel.dicParams?.caharInckey = "0";
      pdfModel.dicParams?.kasaharInckey = "0";
      pdfModel.dicParams?.belgeNo = model.belgeNo;
      pdfModel.dicParams?.belgeTipi = model.belgeTipi;
      if (result!.length == 1) {
        pdfModel.dizaynId = result.firstOrNull?.id;
        dizaynList = result.first;
      } else {
        dizaynList = await bottomSheetDialogManager.showRadioBottomSheetDialog(
          context,
          title: "Dizayn Seçiniz",
          groupValue: pdfModel.dizaynId,
          children: result
              .map(
                (e) => BottomSheetModel(
                  title: e.dizaynAdi ?? "",
                  value: e,
                  groupValue: e.id,
                ),
              )
              .toList(),
        );
        pdfModel.dizaynId = dizaynList?.id;
      }
      if (dizaynList != null) {
        // Get.back();
        await Get.to(() => PDFViewerView(title: dizaynList?.dizaynAdi ?? "", pdfData: pdfModel));
      }
    } else {
      Get.back();
      dialogManager.showErrorSnackBar("Dizayn bulunamadı");
    }
  }
}
