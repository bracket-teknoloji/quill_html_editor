import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/alt_sayfalar/siparis/siparisler/model/kalem_list_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../base/model/base_edit_model.dart";
import "../../base/model/edit_fatura_model.dart";
import "../../base/model/print_model.dart";
import "../../base/state/base_state.dart";
import "../../base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/enum/base_edit_enum.dart";
import "../../constants/enum/edit_tipi_enum.dart";
import "../../constants/enum/talep_teklif_tipi_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/extensions/model_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/string_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../../init/network/login/api_urls.dart";
import "../badge/colorful_badge.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";

class TalepTeklifCard extends StatefulWidget {
  const TalepTeklifCard({
    super.key,
    required this.model,
    this.onDeleted,
    required this.talepTeklifEnum,
    this.index,
    this.isGetData,
    this.showEkAciklama,
    this.showMiktar,
    this.showVade,
    this.onUpdated,
    this.editTipiEnum,
  });

  ///Eğer Bu widget Cache'den çağırılıyorsa index verilmelidir.
  final int? index;
  final bool? isGetData;
  final BaseSiparisEditModel model;
  final Function? onDeleted;
  final ValueChanged<bool>? onUpdated;
  final bool? showEkAciklama;
  final bool? showMiktar;
  final bool? showVade;
  final TalepTeklifEnum talepTeklifEnum;
  final EditTipiEnum? editTipiEnum;

  @override
  State<TalepTeklifCard> createState() => _TalepTeklifCardState();
}

class _TalepTeklifCardState extends BaseState<TalepTeklifCard> {
  TextStyle get greyTextStyle => TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6));

  BaseSiparisEditModel get model => widget.model;

  List<Widget> aciklamaList() => List.generate(16, (index) => aciklamaText(index + 1)).whereType<Text>().toList();

  Widget aciklamaText(int? index) => Text(
        "${paramModel?.talTekParam?.firstWhereOrNull((element) => element.belgeTipi == widget.talepTeklifEnum.rawValue)?.toJson()["ACIKLAR$index"] ?? "Açıklama $index"}: ${widget.model.toJson()["ACIK$index"]}",
        style: greyTextStyle,
      ).yetkiVarMi(model.toJson()["ACIK$index"] != null && widget.showEkAciklama == true);

  ParamModel? get paramModel => CacheManager.getAnaVeri?.paramModel;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onLongPress: widget.model.remoteTempBelgeEtiketi == null ? () async => await gridDialog() : null,
          onTap: widget.isGetData == true
              ? () => Get.back(result: widget.model)
              : () async {
                  // var result =
                  await bottomSheetDialogManager.showBottomSheetDialog(
                    context,
                    title: widget.model.belgeNo ?? "",
                    children: [
                      BottomSheetModel(
                        title: loc(context).generalStrings.view,
                        iconWidget: Icons.preview_outlined,
                        onTap: () {
                          Get.back();
                          return Get.toNamed(
                            "mainPage/talTekEdit",
                            arguments: BaseEditModel(
                              model: widget.model,
                              baseEditEnum: BaseEditEnum.goruntule,
                              editTipiEnum: EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == widget.talepTeklifEnum.rawValue),
                            ),
                          );
                        },
                      ),
                      BottomSheetModel(
                        title: loc(context).generalStrings.edit,
                        iconWidget: Icons.edit_outlined,
                        onTap: () async {
                          Get.back();
                          final result = await Get.toNamed(
                            "mainPage/talTekEdit",
                            arguments: BaseEditModel(
                              model: widget.model,
                              baseEditEnum: BaseEditEnum.duzenle,
                              editTipiEnum: editTipiEnum,
                            ),
                          );
                          widget.onUpdated?.call(result ?? false);
                        },
                      ).yetkiKontrol(yetkiController.siparisDuzelt && widget.model.tipi != 1),
                      BottomSheetModel(
                        title: loc(context).generalStrings.delete,
                        iconWidget: Icons.delete_outline_outlined,
                        onTap: () {
                          Get.back();
                          return dialogManager.showAreYouSureDialog(() async {
                            // if (model.isNew == true) {
                            //   try {
                            //     CacheManager.removeSiparisEditList(widget.index!);
                            //     dialogManager.showSuccessSnackBar("Silindi");
                            //     widget.onDeleted?.call();
                            //   } catch (e) {
                            //     await dialogManager.showAlertDialog("Hata Oluştu.\n$e");
                            //   }
                            //   return;
                            // }
                            final result = await networkManager.deleteFatura(EditFaturaModel.fromSiparislerModel(model));
                            if (result.success == true) {
                              dialogManager.showSuccessSnackBar("Silindi");
                              widget.onDeleted?.call();
                            }
                          });
                        },
                      ).yetkiKontrol(widget.talepTeklifEnum.silinebilirMi && widget.model.tipi != 1),
                      BottomSheetModel(
                        title: "Açıklama Düzenle",
                        iconWidget: Icons.edit_note_outlined,
                        onTap: () async {
                          Get.back();
                          await Get.toNamed(
                            widget.talepTeklifEnum.aciklamaDuzenleRoute,
                            arguments: widget.model,
                          );
                          widget.onUpdated?.call(true);
                        },
                      ),
                      BottomSheetModel(
                        title: loc(context).generalStrings.print,
                        iconWidget: Icons.print_outlined,
                        onTap: () async {
                          Get.back();
                          final PrintModel printModel = PrintModel(
                            raporOzelKod: widget.talepTeklifEnum.getPrintValue,
                            etiketSayisi: 1,
                            dicParams: DicParams(belgeNo: widget.model.belgeNo, belgeTipi: widget.model.belgeTuru, cariKodu: widget.model.cariKodu),
                          );
                          await bottomSheetDialogManager.showPrintBottomSheetDialog(context, printModel, true, true, editTipiEnum: widget.editTipiEnum);
                        },
                      ),
                      BottomSheetModel(
                        title: loc(context).generalStrings.actions,
                        iconWidget: Icons.list_alt_outlined,
                        onTap: () async {
                          Get.back();
                          await gridDialog();
                        },
                      ).yetkiKontrol(model.remoteTempBelgeEtiketi == null),
                      BottomSheetModel(title: "Kontrol Edildi", iconWidget: Icons.check_box_outlined)
                          .yetkiKontrol(model.remoteTempBelgeEtiketi == null && yetkiController.siparisKontrolAciklamasiAktifMi && false),
                      BottomSheetModel(
                        title: "Cari İşlemleri",
                        iconWidget: Icons.person_outline_outlined,
                        onTap: () async {
                          Get.back();
                          dialogManager.showCariIslemleriGridViewDialog(
                            await getCari(),
                          );
                        },
                      ),
                    ].nullCheckWithGeneric,
                  );
                },
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.belgeNo ?? ""),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: widget.model.tarih.toDateString),
                    TextSpan(text: "   ${widget.model.kayittarihi.toTimeString}", style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6), fontSize: UIHelper.midSize)),
                  ],
                ),
              ),
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const ColorfulBadge(label: Text("Muhtelif"), badgeColorEnum: BadgeColorEnum.muhtelif).yetkiVarMi(model.muhtelifMi),
                  // ColorfulBadge(label: Text(model.remoteTempBelgeEtiketi ?? ""), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(model.remoteTempBelgeEtiketi != null),
                  ColorfulBadge(label: Text("Dövizli ${widget.model.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(model.dovizAdi != null),
                  ColorfulBadge(
                    label: const Text("Sipariş"),
                    badgeColorEnum: BadgeColorEnum.fatura,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showBelgeBaglantilariBottomSheetDialog(
                        context,
                        cariKodu: widget.model.cariKodu,
                        belgeNo: widget.model.belgeNo,
                        belgeTipi: widget.model.belgeTuru,
                        filterText: EditTipiEnum.values.where((element) => element.siparisMi).map((e) => e.rawValue).toList(),
                      );
                      await getBelgeBaglantilari(result);
                    },
                  ).yetkiVarMi(model.siparislestiMi),
                  ColorfulBadge(
                    label: const Text("İrsaliye"),
                    badgeColorEnum: BadgeColorEnum.irsaliye,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showBelgeBaglantilariBottomSheetDialog(
                        context,
                        cariKodu: widget.model.cariKodu,
                        belgeNo: widget.model.belgeNo,
                        belgeTipi: widget.model.belgeTuru,
                        filterText: EditTipiEnum.values.where((element) => element.irsaliyeMi).map((e) => e.rawValue).toList(),
                      );
                      await getBelgeBaglantilari(result);
                    },
                  ).yetkiVarMi(model.irsaliyelestiMi),
                  ColorfulBadge(
                    label: const Text("Fatura"),
                    badgeColorEnum: BadgeColorEnum.fatura,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showBelgeBaglantilariBottomSheetDialog(
                        context,
                        cariKodu: widget.model.cariKodu,
                        belgeNo: widget.model.belgeNo,
                        belgeTipi: widget.model.belgeTuru,
                        filterText: EditTipiEnum.values.where((element) => element.faturaMi).map((e) => e.rawValue).toList(),
                      );
                      await getBelgeBaglantilari(result);
                    },
                  ).yetkiVarMi(model.faturalastiMi),
                  const ColorfulBadge(label: Text("Kapalı"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.tipi == 1),
                  const ColorfulBadge(label: Text("Onayda")).yetkiVarMi(model.tipi == 3),
                ].nullCheck.map((e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
              ),
              Text(model.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize).yetkiVarMi(model.cariAdi != null),
              Text("Teslim Cari: ${widget.model.teslimCariAdi}").yetkiVarMi(widget.model.teslimCariAdi != null && widget.model.teslimCariAdi != widget.model.cariAdi),
              Text(
                "${(model.sonrakiRevizeNo ?? "").removeZerosFromStart} numaralı belgeye revize edildi.",
                style: TextStyle(color: theme.colorScheme.inversePrimary),
              ).paddingSymmetric(vertical: UIHelper.lowSize).yetkiVarMi(model.sonrakiRevizeNo != null),
              LayoutBuilder(
                builder: (context, constrains) => Wrap(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    // Text("Tipi: ${widget.model.tipi ? "Yurtiçi" : "Yurtdışı"}"),
                    Text("Kalem Adedi: ${widget.model.kalemAdedi ?? ""}"),
                    Text("Cari Kodu: ${widget.model.cariKodu ?? ""}"),
                    // Text("Koşul: ${widget.model.kosulKodu ?? ""}").yetkiVarMi(model.kosulKodu != null),
                    Text("Plasiyer: ${widget.model.plasiyerAciklama ?? ""}", overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text("Vade Günü: ${widget.model.vadeGunu ?? "0"}").yetkiVarMi(widget.showVade == true),
                    Text("Döviz Toplamı: ${widget.model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${widget.model.dovizAdi ?? ""}")
                        .yetkiVarMi(model.dovizTutari != null && widget.model.dovizAdi != null),
                    Text("KDV: ${widget.model.kdv.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                    // Text("Ara Toplam: ${widget.model.getAraToplam2.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                    Text("Genel Toplam: ${widget.model.genelToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                  ].whereType<Widget>().map((e) => e is SizedBox ? null : SizedBox(width: constrains.maxWidth / 2, child: e)).whereType<Widget>().toList(),
                ),
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("Tipi: ${widget.model.yurticiMi ? "Yurtiçi" : "Yurtdışı"}"),
              //         widget.model.kosulKodu != null ? Text("Koşul: ${widget.model.kosulKodu ?? ""}") : null,
              //         Text("Plasiyer: ${widget.model.plasiyerAciklama ?? ""}"),
              //         Text("Vade Günü: ${widget.model.vadeGunu ?? "0"}").yetkiVarMi(widget.showVade == true),
              //         Text("KDV: ${widget.model.kdv.commaSeparatedWithFixedDigits} $mainCurrency"),
              //         widget.model.dovizAdi != null ? Text("Döviz Toplamı: ${widget.model.dovizTutari ?? ""} ${widget.model.dovizAdi ?? ""}").yetkiVarMi(model.dovizTutari != null) : null,
              //       ].nullCheckWithGeneric,
              //     ),
              //     Column(
              //       mainAxisAlignment: MainAxisAlignment.start,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         Text("Kalem Adedi: ${widget.model.kalemAdedi ?? ""}"),
              //         Text("Ara Toplam: ${widget.model.getAraToplam2.commaSeparatedWithFixedDigits} $mainCurrency"),
              //         Text("Genel Toplam: ${widget.model.genelToplam?.commaSeparatedWithFixedDigits} $mainCurrency"),
              //       ].nullCheckWithGeneric,
              //     ),
              //   ].map((e) => Expanded(child: e)).toList(),
              // ),
              const Divider(
                indent: 0,
                endIndent: 0,
              ).paddingSymmetric(vertical: UIHelper.midSize).yetkiVarMi(widget.showMiktar == true),
              // Text("Miktar: ${widget.model.miktar?.commaSeparatedWithFixedDigits ?? ""}").yetkiVarMi(widget.showMiktar == true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Miktar: ${widget.model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}", style: greyTextStyle),
                  const Flexible(child: Text("|")),
                  Text("Teslim Miktar: ${((model.miktar ?? 0) - (model.kalanMiktar ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}", style: greyTextStyle),
                  const Flexible(child: Text("|")),
                  Text("Kalan Miktar: ${widget.model.kalanMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}", style: greyTextStyle),
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

  Future<void> gridDialog() async {
    await dialogManager.showTalepTeklifGridViewDialog(
      model: model,
      siparisTipi: editTipiEnum,
      onSelected: (value) {
        if (value) {
          widget.onUpdated?.call(value);
        }
      },
    );
  }

  EditTipiEnum? get editTipiEnum => EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == widget.talepTeklifEnum.rawValue);

  Future<CariListesiModel?> getCari() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getCariler,
      bodyModel: CariListesiModel(),
      showLoading: true,
      queryParameters: {
        "filterText": "",
        "Kod": widget.model.cariKodu,
        "EFaturaGoster": true,
        "KisitYok": true,
        "BelgeTuru": widget.model.belgeTuru,
        "PlasiyerKisitiYok": true,
      },
    );
    return result.data.first;
  }

  Future<void> getBelgeBaglantilari(KalemListModel? model) async {
    if (model is KalemListModel) {
      final BaseSiparisEditModel newModel = BaseSiparisEditModel(belgeTuru: model.belgeTipi, belgeNo: model.belgeNo, cariKodu: model.cariKodu);
      if (model.belgeTipi == "MS") {
        Get.toNamed("mainPage/siparisEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.musteri));
      } else if (model.belgeTipi == "SS") {
        Get.toNamed("mainPage/siparisEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.satici));
      } else if (model.belgeTipi == "SF") {
        Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.satisFatura));
      } else if (model.belgeTipi == "AF") {
        Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.alisFatura));
      } else if (model.belgeTipi == "SI") {
        Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.satisIrsaliye));
      } else if (model.belgeTipi == "AI") {
        Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: newModel, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.alisIrsaliye));
      }
      // else if (result.belgeTipi == "") {
      //   Get.toNamed("mainPage/faturaEdit", arguments: BaseEditModel(model: result, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.musteri));
      // } else if (result.belgeTipi == "IS") {
      //   Get.toNamed("mainPage/irsaliyeEdit", arguments: BaseEditModel(model: result, baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: EditTipiEnum.musteri));
      // }
    }
  }
}
