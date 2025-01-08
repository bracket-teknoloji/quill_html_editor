import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/genel_pdf/view/genel_pdf_view.dart";
import "package:picker/core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/enum/depo_fark_raporu_filtre_enum.dart";
import "package:picker/core/constants/enum/dizayn_ozel_kod_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";

import "../../base/model/print_model.dart";

final class SayimlarCard extends StatefulWidget {
  const SayimlarCard({required this.model, required this.onChanged, super.key});
  final SayimListesiModel model;
  final Function(bool) onChanged;

  @override
  State<SayimlarCard> createState() => _SayimlarCardState();
}

final class _SayimlarCardState extends BaseState<SayimlarCard> {
  SayimListesiModel get model => widget.model;

  @override
  Widget build(BuildContext context) => Card(
        color: model.miktarSifirdanBuyukMu && model.serbestMi ? ColorPalette.persianRedWithOpacity : null,
        child: ListTile(
          onTap: bottomSheet,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.fisno ?? ""),
              Row(
                children: [
                  const ColorfulBadge(label: Text("Serbest"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.serbestMi),
                  const ColorfulBadge(label: Text("Filtre"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.filtreliMi),
                ].nullCheck.map((e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
              ),
            ],
          ),
          subtitle: CustomLayoutBuilder(
            splitCount: 2,
            children: [
              Text("Başlama Tarihi: ${model.baslangicTarihi?.toDateString ?? ""}").yetkiVarMi(model.baslangicTarihi != null),
              Text("Bitiş Tarihi: ${model.bitisTarihi?.toDateString ?? ""}").yetkiVarMi(model.bitisTarihi != null),
              Text("Depolar: ${model.depoList?.any((element) => element == -1) == true ? "Tümü" : model.depoList?.first}").yetkiVarMi(model.depoList != null),
              Text("Kullanıcı: ${model.kullanicilar}").yetkiVarMi(model.kullanicilar != null),
              Text("Miktar: ${model.miktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? 0}").yetkiVarMi(model.serbestMi),
              Text("Depo Miktarı: ${model.depoMiktari?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? 0}").yetkiVarMi(model.serbestMi),
              Text("Fark: ${model.fark.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.serbestMi),
            ],
          ),
        ),
      );

  Future<void> bottomSheet() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.options,
      children: [
        BottomSheetModel(
          title: "Sayıma Başla",
          iconWidget: Icons.play_arrow_outlined,
          onTap: () async {
            Get.back();
            final SayimListesiModel model = widget.model;
            if (model.depoList?.any((element) => !(yetkiController.yetkiliDepoList?.map((e) => e.depoKodu).contains(element) ?? false)) ?? false) {
              dialogManager.showAlertDialog("Gösterilecek depo yok. Sayım yönetiminden depoları kontrol edin veya profilinizdeki yetkili olduğunuz depoları kontrol edin.");
              return;
            }
            if (widget.model.tumDepolarMi) {
              final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, model.depoKodu);
              if (result != null) {
                model.depoKodu = result.depoKodu;
              }
            } else {
              model.depoKodu = model.depoList?.first;
            }
            await Get.toNamed("/mainPage/sayimEdit", arguments: model.copyWith());
          },
        ),
        BottomSheetModel(
          title: "Bitirmeyi Geri Al",
          iconWidget: Icons.play_arrow_outlined,
          onTap: () async {
            final result = await networkManager.dioPost(
              path: ApiUrls.saveSayim,
              bodyModel: SayimListesiModel(),
              data: SayimFiltreModel(
                islemKodu: 8,
                belgeNo: widget.model.fisno,
              ).toJson(),
            );
            if (result.isSuccess) {
              Get.back();
              widget.onChanged(true);
            }
          },
        ).yetkiKontrol(widget.model.bitisTarihi != null && widget.model.serbestMi),
        BottomSheetModel(
          title: "Sayımı Bitir",
          iconWidget: Icons.stop_outlined,
          onTap: () async {
            Get.back();
            dialogManager.showAreYouSureDialog(() async {
              final result = await networkManager.dioPost(
                path: ApiUrls.saveSayim,
                bodyModel: SayimListesiModel(),
                showLoading: true,
                data: SayimFiltreModel(
                  islemKodu: 5,
                  belgeNo: widget.model.fisno,
                ).toJson(),
              );
              if (result.isSuccess) {
                widget.onChanged(true);
              }
            });
          },
        ).yetkiKontrol(widget.model.baslangicTarihi != null && widget.model.bitisTarihi == null && widget.model.serbestMi),
        BottomSheetModel(
          title: loc.generalStrings.delete,
          iconWidget: Icons.delete_outline_outlined,
          onTap: () async {
            Get.back();
            dialogManager.showAreYouSureDialog(
              () async {
                final result = await networkManager.dioPost(
                  path: ApiUrls.saveSayim,
                  bodyModel: SayimListesiModel(),
                  data: SayimFiltreModel(
                    islemKodu: 3,
                    belgeNo: widget.model.fisno,
                  ).toJson(),
                );
                if (result.isSuccess) {
                  widget.onChanged(true);
                }
              },
              title: "Sayıma ait tüm bilgiler silinir. Bu işlem geri alınamaz. Kayıt silinsin mi?",
            );
          },
        ).yetkiKontrol(yetkiController.sayimSil && widget.model.serbestMi),
        BottomSheetModel(
          title: "Depo Fark Raporu",
          iconWidget: Icons.filter_9_outlined,
          onTap: () async {
            Get.back();
            await Get.toNamed("/mainPage/sayimDepoFarkRaporu", arguments: widget.model);
          },
        ).yetkiKontrol(yetkiController.sayimDepoFarkRaporu && widget.model.serbestMi),
        BottomSheetModel(
          title: "Sayım Raporu (PDF)",
          iconWidget: Icons.filter_9_outlined,
          onTap: () async {
            Get.back();
            final PdfModel pdfModel = PdfModel(
              etiketSayisi: 1,
              raporOzelKod: DizaynOzelKodEnum.sayim.ozelKodAdi,
              dicParams: DicParams(
                belgeNo: widget.model.fisno ?? "",
              ),
            );
            final sayimFiltre = await bottomSheetDialogManager.showSayimFiltresiBottomSheetDialog(
              context,
              "",
            );
            if (sayimFiltre == null) return;
            pdfModel.dicParams?.filtre = DepoFarkRaporuFiltreEnum.values.indexWhere((element) => element.filtreAdi == sayimFiltre.filtreAdi).toStringIfNotNull;
            // final result = await bottomSheetDialogManager.showDizaynBottomSheetDialog(context, groupValue);
            final dizayn = await bottomSheetDialogManager.showDizaynBottomSheetDialog(
              context,
              "",
              ozelKod: DizaynOzelKodEnum.sayim,
            );
            if (dizayn == null) return;
            pdfModel.dizaynId = dizayn.id;
            final result = await networkManager.getPDF(pdfModel);
            if (!result.isSuccess) return;
            Get.to(() => GenelPdfView(model: result.dataList.firstOrNull));
            // final result = await bottomSheetDialogManager.showBottomSh
          },
        ).yetkiKontrol(yetkiController.sayimSayimRaporu),
        BottomSheetModel(
          title: loc.generalStrings.print,
          iconWidget: Icons.print_outlined,
          onTap: () async {
            Get.back();
            await bottomSheetDialogManager.showPrintBottomSheetDialog(
              context,
              PrintModel(
                raporOzelKod: DizaynOzelKodEnum.sayim.ozelKodAdi,
                dicParams: DicParams(
                  belgeNo: widget.model.fisno ?? "",
                  belgeTipi: "SAYI",
                ),
              ),
              true,
              true,
            );
          },
        ).yetkiKontrol(yetkiController.yazdirmaSayim),
      ].whereType<BottomSheetModel>().toList(),
    );
  }
}
