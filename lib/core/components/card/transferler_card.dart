import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";

import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../base/model/base_edit_model.dart";
import "../../base/model/edit_fatura_model.dart";
import "../../base/model/print_model.dart";
import "../../base/state/base_state.dart";
import "../../base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/enum/base_edit_enum.dart";
import "../../constants/enum/edit_tipi_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../badge/colorful_badge.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";

final class TransferlerCard extends StatefulWidget {
  const TransferlerCard({required this.model, required this.editTipiEnum, super.key, this.onUpdated, this.showMiktar, this.showEkAciklama, this.showVade, this.onDeleted, this.index});
  final BaseSiparisEditModel model;
  final ValueChanged<bool>? onUpdated;
  final bool? showMiktar;
  final EditTipiEnum editTipiEnum;
  final bool? showVade;
  final bool? showEkAciklama;
  final Function? onDeleted;
  final int? index;

  @override
  State<TransferlerCard> createState() => TransferlerCardState();
}

final class TransferlerCardState extends BaseState<TransferlerCard> {
  ParamModel? get paramModel => CacheManager.getAnaVeri?.paramModel;

  TextStyle get greyTextStyle => TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.6));

  List<Widget> aciklamaList() => List.generate(16, (index) => aciklamaText(index + 1)).nonNulls.toList();

  Widget? aciklamaText(int? index) {
    if (widget.model.toJson()["ACIK$index"] != null && widget.showEkAciklama == true) {
      return Text("${paramModel?.toJson()["SatisEkAciklamaTanimi$index"] ?? "Açıklama $index"}: ${widget.model.toJson()["ACIK$index"]}", style: greyTextStyle);
    }
    return null;
  }

  BaseSiparisEditModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onLongPress: () async {
            await dialogManager.showTransferGridViewDialog(
              model: widget.model,
              onSelected: (value) {
                widget.onUpdated?.call(value);
              },
            );
          },
          onTap: () async => await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: model.belgeNo ?? "",
            children: [
              BottomSheetModel(
                title: loc.generalStrings.view,
                iconWidget: Icons.preview_outlined,
                onTap: () async {
                  Get.back();
                  await Get.toNamed("/mainPage/transferEdit", arguments: BaseEditModel(model: model, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: widget.editTipiEnum));
                },
              ),
              if ((widget.editTipiEnum.duzenlensinMi && !model.basariliMi) && (widget.model.aFaturaMi ? !widget.model.eBelgeMi : true))
                BottomSheetModel(
                  title: loc.generalStrings.edit,
                  iconWidget: Icons.edit_outlined,
                  onTap: () async {
                    Get.back();
                    final result = await Get.toNamed("/mainPage/transferEdit", arguments: BaseEditModel(model: model, baseEditEnum: BaseEditEnum.duzenle, editTipiEnum: widget.editTipiEnum));
                    if (result != null) {
                      if (widget.model.isNew == true) {
                        CacheManager.removeTransferEditList(model.belgeNo ?? "");
                      }
                      widget.onUpdated?.call(result);
                    }
                  },
                ),
              if ((widget.editTipiEnum.silinsinMi && widget.model.silinebilirMi) || model.efatOnayDurumKodu == "1")
                BottomSheetModel(
                  title: loc.generalStrings.delete,
                  iconWidget: Icons.delete_outline_outlined,
                  onTap: () async {
                    Get.back();
                    return dialogManager.showAreYouSureDialog(() async {
                      if (widget.model.isNew == true) {
                        try {
                          CacheManager.removeTransferEditList(model.belgeNo ?? "");
                          dialogManager.showSuccessSnackBar("Silindi");
                          widget.onDeleted?.call();
                          return;
                        } catch (e) {
                          dialogManager.showAlertDialog("Hata Oluştu.\n$e");
                        }
                        return;
                      }
                      final result = await networkManager.deleteFatura(EditFaturaModel.fromJson(widget.model.toJson()));
                      if (result.isSuccess) {
                        dialogManager.showSuccessSnackBar("Silindi");
                        widget.onDeleted?.call();
                      }
                    });
                  },
                ),
              if (widget.editTipiEnum.aciklamaDuzenlensinMi)
                BottomSheetModel(
                  title: "Açıklama Düzenle",
                  iconWidget: Icons.edit_note_outlined,
                  onTap: () async {
                    Get.back();
                    final result = await Get.toNamed(
                      widget.editTipiEnum.aciklamaDuzenleRoute,
                      arguments: widget.model,
                    );
                    if (result != null) {
                      widget.onUpdated?.call(result);
                    }
                  },
                ),
              if (widget.model.remoteTempBelgeEtiketi == null && widget.editTipiEnum.yazdirilsinMi)
                BottomSheetModel(
                  title: loc.generalStrings.print,
                  iconWidget: Icons.print_outlined,
                  onTap: () async {
                    Get.back();
                    final PrintModel printModel = PrintModel(
                      raporOzelKod: widget.editTipiEnum.getPrintValue,
                      etiketSayisi: 1,
                      dicParams: DicParams(belgeNo: widget.model.belgeNo ?? "", belgeTipi: widget.model.getEditTipiEnum?.rawValue, cariKodu: widget.model.cariKodu),
                    );
                    await bottomSheetDialogManager.showPrintBottomSheetDialog(context, printModel, true, true, editTipiEnum: widget.editTipiEnum);
                  },
                ),
              if (widget.model.remoteTempBelgeEtiketi == null)
                BottomSheetModel(
                  title: loc.generalStrings.actions,
                  iconWidget: Icons.list_alt_outlined,
                  onTap: () async {
                    Get.back();
                    await dialogManager.showTransferGridViewDialog(
                      model: widget.model,
                      onSelected: (value) {
                        widget.onUpdated?.call(value);
                      },
                    );
                  },
                ),
              if (widget.model.eBelgeCheckBoxMi)
                BottomSheetModel(
                  title: "E-Belge İşlemleri",
                  iconWidget: Icons.receipt_long_outlined,
                  onTap: () async {
                    Get.back();
                    // final result = await networkManager.getCariModel(CariRequestModel.fromBaseSiparisEditModel(model));
                    // final BaseSiparisEditModel newModel = widget.model.copyWith(
                    //   efaturaMi: result?.efaturaMi ?? false ? "E" : "H",
                    // );
                    final result = await dialogManager.showEBelgeGridViewDialog(
                      model: widget.model,
                      onSelected: (value) {
                        widget.onUpdated?.call(value);
                      },
                    );
                    if (result == true) {
                      widget.onUpdated?.call(true);
                    }
                  },
                ),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(model.belgeNo ?? ""),
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(text: model.tarih.toDateString),
                    TextSpan(text: "   ${model.kayittarihi.toTimeString}", style: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontSize: UIHelper.midSize)),
                  ],
                ),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  if (model.remoteTempBelgeEtiketi != null) ColorfulBadge(label: Text(model.remoteTempBelgeEtiketi ?? ""), badgeColorEnum: BadgeColorEnum.seri),
                  if (model.dovizAdi != null) ColorfulBadge(label: Text("Dövizli ${model.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli),
                  if (model.isNew == true) const ColorfulBadge(label: Text("Tamamlanmamış"), badgeColorEnum: BadgeColorEnum.tamamlanmamis),
                  if (model.faturalasanSayi != null) ColorfulBadge(label: Text("Fatura (${model.faturalasanSayi})"), badgeColorEnum: BadgeColorEnum.fatura),
                  if (model.tipi == 1) const ColorfulBadge(label: Text("Kapalı"), badgeColorEnum: BadgeColorEnum.kapali),
                  if (model.datOnayda == "E") const ColorfulBadge(label: Text("Onayda")),
                  if (model.irsaliyelestiMi) ColorfulBadge(label: Text("İrsaliye (${model.irslesenSayi ?? ""})"), badgeColorEnum: BadgeColorEnum.irsaliye),
                  if (model.efaturaMi == "E") const ColorfulBadge(label: Text("E-Fatura"), badgeColorEnum: BadgeColorEnum.eFatura),
                  if (model.earsivMi == "E") const ColorfulBadge(label: Text("E-Arşiv"), badgeColorEnum: BadgeColorEnum.eFatura),
                  if ((model.earsivDurumu == "HAT" || model.efaturaDurumu == "HAT") && (model.efaturaMi == "E" || model.earsivMi == "E"))
                    dialogInkWell(const ColorfulBadge(label: Text("Hata"), badgeColorEnum: BadgeColorEnum.hata)),
                  if (model.taslakMi) dialogInkWell(const ColorfulBadge(label: Text("Taslak"), badgeColorEnum: BadgeColorEnum.taslak)),
                  if ((model.earsivDurumu == "BEK" || model.efaturaDurumu == "BEK") && (model.efaturaMi == "E" || model.earsivMi == "E"))
                    dialogInkWell(const ColorfulBadge(label: Text("Uyarı"), badgeColorEnum: BadgeColorEnum.uyari)),
                  if (model.basariliMi) dialogInkWell(const ColorfulBadge(label: Text("Başarılı"), badgeColorEnum: BadgeColorEnum.basarili)),
                  if (model.efatOnayDurumKodu == "1") const ColorfulBadge(label: Text("Reddedildi"), badgeColorEnum: BadgeColorEnum.hata),
                ].map((e) => e.paddingOnly(right: UIHelper.lowSize)).toList(),
              ),
              if (model.cariAdi != null) Text(model.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize),
              if (model.resmiBelgeNo != null) Text("Resmi Belge No: ${model.resmiBelgeNo ?? ""}").paddingSymmetric(vertical: UIHelper.lowSize),
              CustomLayoutBuilder.divideInHalf(
                children: [
                  if (model.hedefDepo != null && model.topluDepo != null) Text("Toplu Depo: ${model.topluDepo} => ${model.hedefDepo}"),
                  Text("Tipi: ${model.lokalDat == "E" ? "Lokal Transfer" : ""}"),
                  Text("Kalem Adedi: ${model.kalemAdedi ?? ""}"),
                  if (model.cariKodu != null) Text("Cari Kodu: ${model.cariKodu ?? ""}"),
                  // Text("Plasiyer: ${model.plasiyerAciklama ?? ""}", overflow: TextOverflow.ellipsis, maxLines: 1),
                  if (widget.showVade == true) Text("Vade Günü: ${widget.model.vadeGunu ?? "0"}"),
                  if (model.dovizTutari != null && model.dovizAdi != null) Text("Döviz Toplamı: ${model.dovizTutari ?? ""} ${model.dovizAdi ?? ""}"),
                  Text("KDV: ${model.kdv.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                  Text("Ara Toplam: ${model.getAraToplam2.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                  Text("Genel Toplam: ${(model.genelToplam ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                ],
              ),
              if (widget.showMiktar == true)
                const Divider(
                  indent: 0,
                  endIndent: 0,
                ).paddingSymmetric(vertical: UIHelper.midSize),
              if (widget.showMiktar == true)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Text>[
                    Text("Miktar: ${widget.model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                  ],
                ),
              if (widget.showEkAciklama == true && aciklamaList().ext.isNotNullOrEmpty) ...[
                const Divider(
                  indent: 0,
                  endIndent: 0,
                ).paddingSymmetric(vertical: UIHelper.midSize),
                ...aciklamaList(),
              ],
              if (widget.model.aciklama case final value?) Text("Belge Açıklaması: $value", style: greyTextStyle),
            ],
          ),
        ),
      );

  InkWell dialogInkWell(ColorfulBadge badge) => InkWell(
        onTap: () {
          dialogManager.showColorfulSnackBar(
            model.eFaturaMi
                ? "Durum Kodu: ${model.efaturaGibDurumKodu ?? 0} ${model.efaturaDurumAciklama != null ? '\n${model.efaturaDurumAciklama}' : ""}"
                : "Durum Kodu: ${model.earsivGibDurumKodu ?? 0} ${model.earsivDurumAciklama != null ? '\n${model.earsivDurumAciklama!}' : ""}",
            badge.badgeColorEnum?.getColor ?? UIHelper.primaryColor,
          );
        },
        child: badge,
      );
}
