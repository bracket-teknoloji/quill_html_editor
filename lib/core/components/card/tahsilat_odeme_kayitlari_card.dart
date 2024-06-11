import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_hareketleri/model/cari_hareketleri_model.dart";
import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../view/main_page/alt_sayfalar/finans/kasa/kasa_islemleri/model/kasa_islemleri_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../base/state/base_state.dart";
import "../../base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/extensions/model_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/network/login/api_urls.dart";
import "../badge/colorful_badge.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";

class TahsilatOdemeKayitlariCard extends StatefulWidget {
  final CariHareketleriModel cariHareketleriModel;
  final ValueChanged update;
  const TahsilatOdemeKayitlariCard({super.key, required this.cariHareketleriModel, required this.update});

  @override
  State<TahsilatOdemeKayitlariCard> createState() => _TahsilatOdemeKayitlariCardState();
}

class _TahsilatOdemeKayitlariCardState extends BaseState<TahsilatOdemeKayitlariCard> {
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: () async => await onTap(widget.cariHareketleriModel),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(widget.cariHareketleriModel.tarih.toDateString).paddingOnly(right: UIHelper.lowSize),
                    Expanded(child: Text(widget.cariHareketleriModel.plasiyerAciklama ?? "", overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
              Text(
                "${widget.cariHareketleriModel.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                style: TextStyle(color: UIHelper.getColorWithValue(widget.cariHareketleriModel.tutar)),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const ColorfulBadge(label: Text("Tahsilat"), badgeColorEnum: BadgeColorEnum.basarili).yetkiVarMi(widget.cariHareketleriModel.alacakMi),
                  const ColorfulBadge(label: Text("Ödeme"), badgeColorEnum: BadgeColorEnum.uyari).yetkiVarMi(!widget.cariHareketleriModel.alacakMi),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text(widget.cariHareketleriModel.cariAdi ?? "", overflow: TextOverflow.ellipsis).paddingOnly(right: UIHelper.lowSize)),
                  Text("${widget.cariHareketleriModel.dovizBakiye.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${widget.cariHareketleriModel.dovizAdi ?? ""}")
                      .yetkiVarMi(widget.cariHareketleriModel.dovizliMi),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(widget.cariHareketleriModel.belgeNo ?? widget.cariHareketleriModel.hareketAciklama ?? ""),
                  ColorfulBadge(
                    label: Text(widget.cariHareketleriModel.hareketAciklama ?? ""),
                  ),
                ],
              ).paddingSymmetric(vertical: UIHelper.lowSize),

              Text(widget.cariHareketleriModel.aciklama ?? ""),
              // Text(widget.cariHareketleriModel.kasaAdi),
            ],
          ),
        ),
      );

  Future<void> onTap(CariHareketleriModel model) async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: model.cariAdi ?? "",
      children: [
        BottomSheetModel(
          title: "Hareket Detayı",
          iconWidget: Icons.preview_outlined,
          onTap: () async {
            Get.back();
            switch (widget.cariHareketleriModel.hareketAciklama) {
              // case "Müşteri Senedi":
              // case "Borç Senedi":
              // case "Müşteri Çeki":
              // Get.toNamed("/mainPage/cekSenetGoruntule", arguments: CekSenetListesiModel());
              case "Borç Çeki":
              case "Protestolu Senet":
              case "Karşılıksız Çek":
              case "Dekont":
                await getDekont();
              case "Kasa":
                Get.toNamed("/mainPage/kasaHareketDetayi", arguments: widget.cariHareketleriModel);
              default:
            }
            //   if (widget.cariHareketleriModel.hareketAciklama == "Dekont") {
            //   } else if (widget.cariHareketleriModel.hareketAciklama == "Çek") {}
            //   else if (widget.cariHareketleriModel.hareketAciklama)
          },
        ).yetkiKontrol(widget.cariHareketleriModel.hareketKodu != "K" && widget.cariHareketleriModel.refkey != null),
        BottomSheetModel(
          title: "Ödeme Makbuzu",
          iconWidget: Icons.receipt_long_outlined,
          onTap: () async => await showPdf("OdemeMakbuzu", model.inckeyno.toStringIfNotNull ?? ""),
        ).yetkiKontrol(
          !widget.cariHareketleriModel.alacakMi,
        ),
        BottomSheetModel(
          title: "Tahsilat Makbuzu",
          iconWidget: Icons.receipt_long_outlined,
          onTap: () async => await showPdf("TahsilatMakbuzu", model.inckeyno.toStringIfNotNull ?? ""),
        ).yetkiKontrol(
          widget.cariHareketleriModel.alacakMi,
        ),
        BottomSheetModel(
          title: loc.generalStrings.delete,
          iconWidget: Icons.delete_outline_outlined,
          onTap: () async => await deleteData(),
        ).yetkiKontrol(
          widget.cariHareketleriModel.hareketAciklama == "Kasa",
        ),
        BottomSheetModel(
          title: "Cari İşlemleri",
          iconWidget: Icons.edit_outlined,
          onTap: () async {
            Get.back();
            await dialogManager.showCariIslemleriGridViewDialog(
              await getCari(),
              onselected: (value) {
                if (value) {
                  widget.update.call(value);
                }
              },
            );
          },
        ),
      ].nullCheckWithGeneric,
    );
  }

  Future<CariListesiModel?> getCari() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getCariler,
      bodyModel: CariListesiModel(),
      showLoading: true,
      queryParameters: {
        "filterText": "",
        "Kod": widget.cariHareketleriModel.cariKodu,
        "EFaturaGoster": true,
        "KisitYok": true,
        "BelgeTuru": widget.cariHareketleriModel.belgeTipi,
        "PlasiyerKisitiYok": true,
      },
    );
    return result.data.first;
  }

  Future<void> hareketDetayi() async {}

  Future<void> getMusteriSenedi() async {}

  Future<void> getBorcSenedi() async {}

  Future<void> getMusteriCeki() async {}

  Future<void> getBorcCeki() async {}

  Future<void> getProtestoluSenet() async {}

  Future<void> getKarsiliksizCek() async {}

  Future<void> getDekont() async {
    await Get.toNamed("/mainPage/dekontGoruntuleRefKey", arguments: widget.cariHareketleriModel.refkey);
  }

  Future<void> showPdf(String ozelKod, String inckeyno) async {
    final PdfModel pdfModel = PdfModel(raporOzelKod: ozelKod, dicParams: DicParams());
    final result = parametreModel.netFectDizaynList?.where((element) => element.ozelKod == ozelKod).toList();
    NetFectDizaynList? dizaynList;
    if (result.ext.isNotNullOrEmpty) {
      Get.back();
      if (result!.length == 1) {
        pdfModel.dizaynId = result.firstOrNull?.id;
        pdfModel.etiketSayisi = result.firstOrNull?.kopyaSayisi;
        pdfModel.dicParams?.caharInckey = inckeyno;
        dizaynList = result.first;
      } else {
        dizaynList = await bottomSheetDialogManager.showBottomSheetDialog(
          context,
          title: "Dizayn Seçiniz",
          children: result.map((e) => BottomSheetModel(title: e.dizaynAdi ?? "", onTap: () => Get.back(result: e))).toList(),
        );
        if (dizaynList == null) return;
        pdfModel.dizaynId = dizaynList.id;
        pdfModel.etiketSayisi = dizaynList.kopyaSayisi;
        pdfModel.dicParams?.caharInckey = inckeyno;
        // pdfModel.dicParams?.belgeNo = dizaynList?.;
      }
      Get.to(() => PDFViewerView(title: dizaynList?.dizaynAdi ?? "", pdfData: pdfModel));
    }
  }

  Future<void> deleteData() async {
    Get.back();
    await dialogManager.showAreYouSureDialog(
      () async {
        final result = await networkManager.dioPost<KasaIslemleriModel>(
          path: ApiUrls.deleteKasaHareket,
          bodyModel: KasaIslemleriModel(),
          queryParameters: {"REFKEY": widget.cariHareketleriModel.refkey},
          showLoading: true,
        );
        if (result.isSuccess) {
          widget.update.call(widget.cariHareketleriModel.refkey);
          dialogManager.showSuccessSnackBar(result.message ?? "");
        }
      },
      title: "Bu kasa kaydını silmek istediğinizden emin misiniz?",
    );
  }
}
