import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

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
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../badge/colorful_badge.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";

class TransferlerCard extends StatefulWidget {
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

class TransferlerCardState extends BaseState<TransferlerCard> {
  ParamModel? get paramModel => CacheManager.getAnaVeri?.paramModel;

  TextStyle get greyTextStyle => TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6));

  List<Widget> aciklamaList() => List.generate(16, (index) => aciklamaText(index + 1)).whereType<Text>().toList();

  Widget aciklamaText(int? index) => Text("${paramModel?.toJson()["SatisEkAciklamaTanimi$index"] ?? "Açıklama $index"}: ${widget.model.toJson()["ACIK$index"]}", style: greyTextStyle)
      .yetkiVarMi(widget.model.toJson()["ACIK$index"] != null && widget.showEkAciklama == true);

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
            children: <BottomSheetModel?>[
              BottomSheetModel(
                title: loc.generalStrings.view,
                iconWidget: Icons.preview_outlined,
                onTap: () async {
                  Get.back();
                  await Get.toNamed("/mainPage/transferEdit", arguments: BaseEditModel(model: model, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: widget.editTipiEnum));
                },
              ),
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
              ).yetkiKontrol((widget.editTipiEnum.duzenlensinMi && !model.basariliMi) && (widget.model.aFaturaMi ? !widget.model.eBelgeMi : true)),
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
              ).yetkiKontrol((widget.editTipiEnum.silinsinMi && widget.model.silinebilirMi) || model.efatOnayDurumKodu == "1"),
              if (widget.editTipiEnum.aciklamaDuzenlensinMi)BottomSheetModel(
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
              ).yetkiKontrol(widget.model.remoteTempBelgeEtiketi == null && widget.editTipiEnum.yazdirilsinMi),
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
              ).yetkiKontrol(widget.model.remoteTempBelgeEtiketi == null),
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
              ).yetkiKontrol(widget.model.ebelgeCheckbox == "E"),
            ].nullCheckWithGeneric,
          ),
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
                  ColorfulBadge(label: Text(model.remoteTempBelgeEtiketi ?? ""), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(model.remoteTempBelgeEtiketi != null),
                  ColorfulBadge(label: Text("Dövizli ${model.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(model.dovizAdi != null),
                  const ColorfulBadge(label: Text("Tamamlanmamış"), badgeColorEnum: BadgeColorEnum.tamamlanmamis).yetkiVarMi(model.isNew == true),
                  ColorfulBadge(label: Text("Fatura (${model.faturalasanSayi})"), badgeColorEnum: BadgeColorEnum.fatura).yetkiVarMi(model.faturalasanSayi != null),
                  const ColorfulBadge(label: Text("Kapalı"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.tipi == 1),
                  const ColorfulBadge(label: Text("Onayda")).yetkiVarMi(model.datOnayda == "E"),
                  ColorfulBadge(label: Text("İrsaliye (${model.irslesenSayi ?? ""})"), badgeColorEnum: BadgeColorEnum.irsaliye).yetkiVarMi(model.irsaliyelesti == "E"),
                  const ColorfulBadge(label: Text("E-Fatura"), badgeColorEnum: BadgeColorEnum.eFatura).yetkiVarMi(model.efaturaMi == "E"),
                  const ColorfulBadge(label: Text("E-Arşiv"), badgeColorEnum: BadgeColorEnum.eFatura).yetkiVarMi(model.earsivMi == "E"),
                  dialogInkWell(const ColorfulBadge(label: Text("Hata"), badgeColorEnum: BadgeColorEnum.hata))
                      .yetkiVarMi((model.earsivDurumu == "HAT" || model.efaturaDurumu == "HAT") && (model.efaturaMi == "E" || model.earsivMi == "E")),
                  dialogInkWell(const ColorfulBadge(label: Text("Taslak"), badgeColorEnum: BadgeColorEnum.taslak)).yetkiVarMi(model.taslakMi),
                  dialogInkWell(const ColorfulBadge(label: Text("Uyarı"), badgeColorEnum: BadgeColorEnum.uyari))
                      .yetkiVarMi((model.earsivDurumu == "BEK" || model.efaturaDurumu == "BEK") && (model.efaturaMi == "E" || model.earsivMi == "E")),
                  dialogInkWell(const ColorfulBadge(label: Text("Başarılı"), badgeColorEnum: BadgeColorEnum.basarili)).yetkiVarMi(model.basariliMi),
                  const ColorfulBadge(label: Text("Reddedildi"), badgeColorEnum: BadgeColorEnum.hata).yetkiVarMi(model.efatOnayDurumKodu == "1"),
                ].nullCheck.map((e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
              ),
              Text(model.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize).yetkiVarMi(model.cariAdi != null),
              Text("Resmi Belge No: ${model.resmiBelgeNo ?? ""}").paddingSymmetric(vertical: UIHelper.lowSize).yetkiVarMi(model.resmiBelgeNo != null),
              LayoutBuilder(
                builder: (context, constraints) => Wrap(
                  // mainAxisAlignment: MainAxisAlignment.start,

                  children: <Widget>[
                    Text("Toplu Depo: ${model.topluDepo} => ${model.hedefDepo}").yetkiVarMi(model.hedefDepo != null && model.topluDepo != null),
                    Text("Tipi: ${model.lokalDat == "E" ? "Lokal Transfer" : ""}"),
                    Text("Kalem Adedi: ${model.kalemAdedi ?? ""}"),
                    Text("Cari Kodu: ${model.cariKodu ?? ""}").yetkiVarMi(model.cariKodu != null),
                    // Text("Plasiyer: ${model.plasiyerAciklama ?? ""}", overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text("Vade Günü: ${widget.model.vadeGunu ?? "0"}").yetkiVarMi(widget.showVade == true),
                    Text("Döviz Toplamı: ${model.dovizTutari ?? ""} ${model.dovizAdi ?? ""}").yetkiVarMi(model.dovizTutari != null && model.dovizAdi != null),
                    Text("KDV: ${model.kdv.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                    Text("Ara Toplam: ${model.getAraToplam2.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                    Text("Genel Toplam: ${(model.genelToplam ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                  ].map((e) => e is SizedBox ? null : SizedBox(width: constraints.maxWidth / 2, child: e)).whereType<Widget>().toList(),
                ),
              ),
              const Divider(
                indent: 0,
                endIndent: 0,
              ).paddingSymmetric(vertical: UIHelper.midSize).yetkiVarMi(widget.showMiktar == true),
              // Text("Miktar: ${widget.model.miktar.commaSeparatedWithFixedDigits ?? ""}").yetkiVarMi(widget.showMiktar == true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Text>[
                  Text("Miktar: ${widget.model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                ].map((e) => e is SizedBox ? null : e).whereType<Widget>().toList(),
              ).yetkiVarMi(widget.showMiktar == true),
              const Divider(
                indent: 0,
                endIndent: 0,
              ).paddingSymmetric(vertical: UIHelper.midSize).yetkiVarMi(widget.showEkAciklama == true && aciklamaList().ext.isNotNullOrEmpty),
              ...aciklamaList(),
            ],
          ),
        ),
      );

  InkWell dialogInkWell(ColorfulBadge badge) => InkWell(
        onTap: () {
          dialogManager.showColorfulSnackBar(
            model.eFaturaMi
                ? "Durum Kodu: ${model.efaturaGibDurumKodu ?? 0} ${model.efaturaDurumAciklama != null ? '\n${model.efaturaDurumAciklama}' : ""}"
                : "Durum Kodu: ${model.earsivGibDurumKodu ?? 0} ${model.earsivDurumAciklama != null ? '\n${model.earsivDurumAciklama}' : ""}",
            badge.badgeColorEnum.getColor,
          );
        },
        child: badge,
      );
}
