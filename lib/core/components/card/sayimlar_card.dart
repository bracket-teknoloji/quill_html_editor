import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/print_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";

class SayimlarCard extends StatefulWidget {
  final SayimListesiModel model;
  final Function(bool) onChanged;
  const SayimlarCard({super.key, required this.model, required this.onChanged});

  @override
  State<SayimlarCard> createState() => _SayimlarCardState();
}

class _SayimlarCardState extends BaseState<SayimlarCard> {
  SayimListesiModel get model => widget.model;

  @override
  Widget build(BuildContext context) => Card(
        color: model.miktarSifirdanBuyukMu ? ColorPalette.persianRed.withOpacity(0.5) : null,
        child: ListTile(
          onTap: bottomSheet,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.fisno ?? ""),
              Row(
                children: [
                  const ColorfulBadge(label: Text("Serbest"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.serbestMi),
                  const ColorfulBadge(label: Text("Filtre"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.filtreliMi),
                ].nullCheck.map((Widget e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
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
              Text("Miktar: ${model.miktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.miktar != null),
              Text("Depo Miktarı: ${model.depoMiktari?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.depoMiktari != null),
              Text("Fark: ${model.fark?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.miktar != null),
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
            await Get.toNamed("/mainPage/sayimEdit", arguments: widget.model);
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
            if (result.success == true) {
              Get.back();
              widget.onChanged(true);
            }
          },
        ).yetkiKontrol(widget.model.bitisTarihi != null && widget.model.serbestMi),
        BottomSheetModel(
          title: "Sayımı Bitir",
          iconWidget: Icons.stop_outlined,
          onTap: () async {
            final result = await networkManager.dioPost(
              path: ApiUrls.saveSayim,
              bodyModel: SayimListesiModel(),
              data: SayimFiltreModel(
                islemKodu: 5,
                belgeNo: widget.model.fisno,
              ).toJson(),
            );
            if (result.success == true) {
              Get.back();
              widget.onChanged(true);
            }
          },
        ).yetkiKontrol(widget.model.bitisTarihi == null && widget.model.serbestMi),
        BottomSheetModel(
          title: loc.generalStrings.delete,
          iconWidget: Icons.delete_outline_outlined,
          onTap: () async {
            final result = await networkManager.dioPost(
              path: ApiUrls.saveSayim,
              bodyModel: SayimListesiModel(),
              data: SayimFiltreModel(
                islemKodu: 3,
                belgeNo: widget.model.fisno,
              ).toJson(),
            );
            if (result.success == true) {
              Get.back();
              widget.onChanged(true);
            }
          },
        ).yetkiKontrol(yetkiController.sayimSil && widget.model.serbestMi),
        BottomSheetModel(
          title: "Depo Fark Raporu",
          iconWidget: Icons.filter_9_outlined,
        ).yetkiKontrol(yetkiController.sayimDepoFarkRaporu && widget.model.serbestMi),
        BottomSheetModel(
          title: "Sayım Raporu (PDF)",
          iconWidget: Icons.filter_9_outlined,
          onTap: () async {
            // final result = await bottomSheetDialogManager.showBottomSh
          },
        ).yetkiKontrol(yetkiController.sayimSayimRaporu),
        BottomSheetModel(
          title: loc.generalStrings.print,
          iconWidget: Icons.print_outlined,
          onTap: () async {
            await bottomSheetDialogManager.showPrintBottomSheetDialog(context, PrintModel(raporOzelKod: "Sayim"), true, true);
          },
        ).yetkiKontrol(yetkiController.yazdirmaSayim),
      ].whereType<BottomSheetModel>().toList(),
    );
  }
}
