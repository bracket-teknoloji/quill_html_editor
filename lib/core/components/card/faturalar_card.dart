import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/listener/mouse_right_click_listener.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
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
import "../../constants/extensions/list_extensions.dart";
import "../../constants/extensions/model_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../badge/colorful_badge.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../layout/custom_layout_builder.dart";

final class FaturalarCard extends StatefulWidget {
  const FaturalarCard({required this.model, required this.editTipiEnum, super.key, this.onUpdated, this.showMiktar, this.showEkAciklama, this.showVade, this.onDeleted, this.index, this.isGetData});
  final BaseSiparisEditModel model;
  final ValueChanged<bool>? onUpdated;
  final bool? showMiktar;
  final EditTipiEnum editTipiEnum;
  final bool? showVade;
  final bool? showEkAciklama;
  final Function? onDeleted;
  final bool? isGetData;
  final int? index;

  @override
  State<FaturalarCard> createState() => _FaturalarCardState();
}

final class _FaturalarCardState extends BaseState<FaturalarCard> {
  ParamModel? get paramModel => CacheManager.getAnaVeri?.paramModel;

  TextStyle get greyTextStyle => TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6));

  List<Widget> aciklamaList() => List.generate(16, (index) => aciklamaText(index + 1)).nonNulls.toList();

  Widget? aciklamaText(int? index) {
    if (widget.model.toJson()["ACIK$index"] != null && widget.showEkAciklama == true) {
      return Text("${paramModel?.toJson()["SatisEkAciklamaTanimi$index"] ?? "Açıklama $index"}: ${widget.model.toJson()["ACIK$index"]}", style: greyTextStyle);
    }
    return null;
  }

  BaseSiparisEditModel get model => widget.model;
  @override
  Widget build(BuildContext context) => MouseRightClickListener(
        onRightClick: onLongPress,
        child: Card(
          child: ListTile(
            onLongPress: onLongPress,
            onTap: () async {
              if (widget.isGetData == true) {
                Get.back(result: model);
                return;
              }
              return await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: model.cariAdi ?? "",
                children: <BottomSheetModel?>[
                  BottomSheetModel(
                    title: loc.generalStrings.view,
                    iconWidget: Icons.preview_outlined,
                    onTap: () async {
                      Get.back();
                      await Get.toNamed("/mainPage/faturaEdit", arguments: BaseEditModel(model: model, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: widget.editTipiEnum));
                    },
                  ),
                  BottomSheetModel(
                    title: loc.generalStrings.edit,
                    iconWidget: Icons.edit_outlined,
                    onTap: () async {
                      Get.back();
                      final result = await Get.toNamed("/mainPage/faturaEdit", arguments: BaseEditModel(model: model, baseEditEnum: BaseEditEnum.duzenle, editTipiEnum: widget.editTipiEnum));
                      if (result == true) {
                        if (model.isNew == true) {
                          CacheManager.removeFaturaEditList(model.belgeNo ?? "");
                        }
                        widget.onUpdated?.call(result);
                      }
                    },
                  ).yetkiKontrol((widget.editTipiEnum.duzenlensinMi && !model.basariliMi && !model.taslakMi) && !model.eBelgeMi),
                  BottomSheetModel(
                    title: loc.generalStrings.delete,
                    iconWidget: Icons.delete_outline_outlined,
                    onTap: () async {
                      Get.back();
                      return dialogManager.showAreYouSureDialog(() async {
                        if (model.isNew == true) {
                          try {
                            CacheManager.removeFaturaEditList(model.belgeNo ?? "");
                            dialogManager.showSuccessSnackBar("Silindi");
                            widget.onDeleted?.call();
                            return;
                          } catch (e) {
                            dialogManager.showAlertDialog("Hata Oluştu.\n$e");
                          }
                          return;
                        }
                        final result = await networkManager.deleteFatura(EditFaturaModel.fromJson(model.toJson()));
                        if (result.isSuccess) {
                          dialogManager.showSuccessSnackBar("Silindi");
                          widget.onDeleted?.call();
                        }
                      });
                    },
                  ).yetkiKontrol((widget.editTipiEnum.silinsinMi && model.silinebilirMi) || model.efatOnayDurumKodu == "1"),
                  if (widget.editTipiEnum.aciklamaDuzenlensinMi)
                    BottomSheetModel(
                      title: "Açıklama Düzenle",
                      iconWidget: Icons.edit_note_outlined,
                      onTap: () async {
                        Get.back();
                        final result = await Get.toNamed(
                          widget.editTipiEnum.aciklamaDuzenleRoute,
                          arguments: model,
                        );
                        if (result != null) {
                          widget.onUpdated?.call(result);
                        }
                      },
                    ),
                  BottomSheetModel(
                    title: loc.generalStrings.print,
                    iconWidget: Icons.print_outlined,
                    onTap: () async {
                      Get.back();
                      final PrintModel printModel = PrintModel(
                        raporOzelKod: widget.editTipiEnum.getPrintValue,
                        etiketSayisi: 1,
                        dicParams: DicParams(belgeNo: model.belgeNo ?? "", belgeTipi: model.getEditTipiEnum?.rawValue, cariKodu: model.cariKodu),
                      );
                      await bottomSheetDialogManager.showPrintBottomSheetDialog(context, printModel, true, true, editTipiEnum: widget.editTipiEnum);
                    },
                  ).yetkiKontrol(model.remoteTempBelgeEtiketi == null),
                  BottomSheetModel(
                    title: loc.generalStrings.actions,
                    iconWidget: Icons.list_alt_outlined,
                    onTap: () async {
                      Get.back();
                      final result = await networkManager.getBaseSiparisEditModel(SiparisEditRequestModel.fromSiparislerModel(model));
                      await dialogManager.showFaturaGridViewDialog(
                        model: result,
                        onSelected: (value) {
                          widget.onUpdated?.call(value);
                        },
                      );
                    },
                  ).yetkiKontrol(model.remoteTempBelgeEtiketi == null),
                  BottomSheetModel(
                    title: "E-Belge İşlemleri",
                    iconWidget: Icons.receipt_long_outlined,
                    onTap: () async {
                      Get.back();
                      // final result = await networkManager.getCariModel(CariRequestModel.fromBaseSiparisEditModel(model));
                      // final BaseSiparisEditModel newModel = model.copyWith(
                      //   efaturaMi: result?.efaturaMi ?? false ? "E" : "H",
                      // );
                      final result = await dialogManager.showEBelgeGridViewDialog(
                        model: model,
                        onSelected: (value) {
                          widget.onUpdated?.call(value);
                        },
                      );
                      if (result == true) {
                        widget.onUpdated?.call(true);
                      }
                    },
                  ).yetkiKontrol(model.eBelgeIslemlerGorunsunMu),
                  BottomSheetModel(
                    title: "Cari İşlemleri",
                    iconWidget: Icons.person_outline_outlined,
                    onTap: () async {
                      Get.back();
                      final CariListesiModel? cariListesiModel = await networkManager.getCariModel(CariRequestModel.fromBaseSiparisEditModel(model));
                      dialogManager.showCariIslemleriGridViewDialog(
                        cariListesiModel,
                      );
                    },
                  ),
                ].nullCheckWithGeneric,
              );
            },
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(model.belgeNo ?? ""),
                Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      TextSpan(text: model.tarih.toDateString),
                      TextSpan(text: "   ${model.kayittarihi.toTimeString}", style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6), fontSize: UIHelper.midSize)),
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
                    if (model.irsaliyelestiMi) ColorfulBadge(label: Text("İrsaliye (${model.irslesenSayi ?? ""})"), badgeColorEnum: BadgeColorEnum.irsaliye),
                    if (model.faturalasmisAIrsMi || model.faturalasmisSIrsMi) const ColorfulBadge(label: Text("Faturalaşmış"), badgeColorEnum: BadgeColorEnum.taslak),
                    if (model.eFaturaMi) const ColorfulBadge(label: Text("E-Fatura"), badgeColorEnum: BadgeColorEnum.eFatura),
                    if (model.eIrsaliyeMi) const ColorfulBadge(label: Text("E-İrsaliye"), badgeColorEnum: BadgeColorEnum.eFatura),
                    if (model.eArsivMi) const ColorfulBadge(label: Text("E-Arşiv"), badgeColorEnum: BadgeColorEnum.eFatura),
                    if (model.hataliMi) dialogInkWell(const ColorfulBadge(label: Text("Hata"), badgeColorEnum: BadgeColorEnum.hata)),
                    if (model.taslakMi) dialogInkWell(const ColorfulBadge(label: Text("Taslak"), badgeColorEnum: BadgeColorEnum.taslak)),
                    if (model.uyariMi) dialogInkWell(const ColorfulBadge(label: Text("Uyarı"), badgeColorEnum: BadgeColorEnum.uyari)),
                    if (model.basariliMi) dialogInkWell(const ColorfulBadge(label: Text("Başarılı"), badgeColorEnum: BadgeColorEnum.basarili)),
                    if (model.efatOnayDurumKodu == "1") const ColorfulBadge(label: Text("Reddedildi"), badgeColorEnum: BadgeColorEnum.hata),
                    if (model.remoteTempBelgeEtiketi != null) ColorfulBadge(label: Text(model.remoteTempBelgeEtiketi ?? ""), badgeColorEnum: BadgeColorEnum.seri),
                    if (model.isNew == true) const ColorfulBadge(label: Text("Tamamlanmamış"), badgeColorEnum: BadgeColorEnum.tamamlanmamis),
                    if (model.faturalasanSayi != null) ColorfulBadge(label: Text("Fatura (${model.faturalasanSayi})"), badgeColorEnum: BadgeColorEnum.fatura),
                    if (model.tipi == 1) const ColorfulBadge(label: Text("Kapalı"), badgeColorEnum: BadgeColorEnum.kapali),
                    if (model.tipi == 3) const ColorfulBadge(label: Text("Onayda")),
                    if (model.dovizAdi != null) ColorfulBadge(label: Text("Dövizli ${model.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli),
                  ].map((e) => e.paddingOnly(right: UIHelper.lowSize)).toList(),
                ),
                Text(model.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize),
                Text("Cari Kodu: ${model.cariKodu ?? ""}"),
                if (model.teslimCari != null) Text("Teslim Cari: ${model.teslimCari}"),
                CustomLayoutBuilder.divideInHalf(
                  children: [
                    Text("Tipi: ${model.tipiName}", style: TextStyle(color: model.tipi != 2 ? UIHelper.primaryColor : null)),
                    Text("Kalem Adedi: ${model.kalemAdedi ?? ""}"),
                    if (model.kosulKodu != null) Text("Koşul: ${model.kosulKodu ?? ""}"),
                    Text("Plasiyer: ${model.plasiyerAciklama ?? ""}", overflow: TextOverflow.ellipsis, maxLines: 1),
                    if (widget.showVade == true) Text("Vade Günü: ${model.vadeGunu ?? "0"}"),
                    if (model.getEditTipiEnum?.fiyatGor == true) ...[
                      if (model.dovizTutari != null && model.dovizAdi != null) Text("Döviz Toplamı: ${model.dovizTutari ?? ""} ${model.dovizAdi ?? ""}"),
                      if (model.dovizTutari != null && model.dovizAdi != null) Text("Kur: ${model.dovizKuru.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                      Text("Ara Toplam: ${model.getAraToplam2.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                      Text("KDV: ${model.kdv.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                      if (model.otvTutari != null) Text("ÖTV Tutarı: ${model.otvTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                      Text("Genel Toplam: ${model.genelToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                    ],
                  ],
                ),
                if (widget.showMiktar == true) ...[
                  const Divider(
                    indent: 0,
                    endIndent: 0,
                  ).paddingSymmetric(vertical: UIHelper.midSize),
                  // Text("Miktar: ${model.miktar.commaSeparatedWithFixedDigits ?? ""}").yetkiVarMi(widget.showMiktar == true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Text>[
                      Text("Miktar: ${model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                    ],
                  ),
                ],
                if (widget.showEkAciklama == true && aciklamaList().ext.isNotNullOrEmpty)
                  const Divider(
                    indent: 0,
                    endIndent: 0,
                  ).paddingSymmetric(vertical: UIHelper.midSize),
                ...aciklamaList(),
              ],
            ),
          ),
        ),
      );

  Future<void> onLongPress() async {
    await dialogManager.showFaturaGridViewDialog(
      model: model,
      onSelected: (value) {
        widget.onUpdated?.call(value);
      },
    );
  }

  InkWell dialogInkWell(ColorfulBadge badge) => InkWell(
        onTap: () => dialogManager.showColorfulSnackBar(model.gibDurumKodu, badge.badgeColorEnum?.getColor ?? UIHelper.primaryColor),
        child: badge,
      );
}
