import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "package:picker/core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/color_palette.dart";
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
import "package:picker/view/main_page/model/param_model.dart";

class CekSenetListesiCard extends StatefulWidget {
  final CekSenetListesiModel model;
  final CekSenetListesiEnum cekSenetListesiEnum;
  const CekSenetListesiCard({super.key, required this.model, required this.cekSenetListesiEnum});

  @override
  State<CekSenetListesiCard> createState() => _CekSenetListesiCardState();
}

class _CekSenetListesiCardState extends BaseState<CekSenetListesiCard> {
  CekSenetListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: () async {
            await bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: model.belgeNo ?? "",
              children: [
                BottomSheetModel(title: "Görüntüle", iconWidget: Icons.preview_outlined),
                BottomSheetModel(title: "Sil", iconWidget: Icons.delete_outline_outlined).yetkiKontrol(widget.cekSenetListesiEnum.silebilirMi),
                BottomSheetModel(title: "İşlemler", iconWidget: Icons.list_alt_outlined),
                BottomSheetModel(title: "Hareketler", iconWidget: Icons.sync_alt_outlined, onTap: () => Get.toNamed("/mainPage/cekSenetHareketleri", arguments: model))
                    .yetkiKontrol(widget.cekSenetListesiEnum.hareketlerGorulebilirMi),
                BottomSheetModel(title: "Evraklar", iconWidget: Icons.description_outlined),
                BottomSheetModel(title: "Tahsilat Makbuzu", iconWidget: Icons.receipt_long_outlined, onTap: showTahsilatMakbuzu),
                BottomSheetModel(
                  title: "Cari İşlemleri",
                  iconWidget: Icons.person_outline_outlined,
                  onTap: () async {
                    Get.back();
                    final result = await networkManager.dioGet(
                      path: ApiUrls.getCariler,
                      bodyModel: CariListesiModel(),
                      showLoading: true,
                      queryParameters: {"filterText": "", "Kod": model.verenKodu, "EFaturaGoster": true, "KisitYok": true, "BelgeTuru": model.belgeTipi, "PlasiyerKisitiYok": true},
                    );

                    dialogManager.showCariGridViewDialog(result.data.first);
                  },
                ),
              ].nullCheckWithGeneric,
            );
          },
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model.belgeNo ?? ""),
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
                    Text("Tutar: ${model.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"),
                    Text("İşlem Tarihi: ${model.tarih.toDateString}"),
                    Text("Vade Tarihi: ${model.vadeTarihi.toDateString}"),
                    Text("Asıl/Ciro: ${model.ciroTipiString}"),
                    Text("Seri No: ${model.seriNo ?? ""}"),
                  ]
                      .map(
                        (e) => SizedBox(
                          width: constraints.maxWidth / 2,
                          child: e,
                        ),
                      )
                      .toList(),
                ),
              ),
              Text(model.aciklamalar, style: const TextStyle(color: ColorPalette.slateGray)),
            ],
          ),
        ),
      );

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
        pdfModel.dizaynId = result.first.id;
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
