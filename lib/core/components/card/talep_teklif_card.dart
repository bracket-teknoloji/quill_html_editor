import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/delete_fatura_model.dart";
import "package:picker/core/base/model/print_model.dart";
import "package:picker/core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "package:picker/core/constants/enum/talep_teklif_tipi_enum.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/model/talep_teklif_listesi_model.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/enum/badge_color_enum.dart";
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
  });

  ///Eğer Bu widget Cache'den çağırılıyorsa index verilmelidir.
  final int? index;
  final bool? isGetData;
  final TalepTeklifListesiModel model;
  final Function? onDeleted;
  final ValueChanged<bool>? onUpdated;
  final bool? showEkAciklama;
  final bool? showMiktar;
  final bool? showVade;
  final TalepTeklifEnum talepTeklifEnum;

  @override
  State<TalepTeklifCard> createState() => _TalepTeklifCardState();
}

class _TalepTeklifCardState extends BaseState<TalepTeklifCard> {
  TextStyle get greyTextStyle => TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6));

  List<Widget> aciklamaList() => List.generate(16, (index) => aciklamaText(index + 1)).whereType<Text>().toList();

  Widget aciklamaText(int? index) => Text(
        "${paramModel?.talTekParam?.firstWhere((element) => element.belgeTipi == widget.talepTeklifEnum.rawValue).toJson()["ACIKLAR$index"] ?? "Açıklama $index"}: ${widget.model.toJson()["ACIK$index"]}",
        style: greyTextStyle,
      ).yetkiVarMi(widget.model.toJson()["ACIK$index"] != null && widget.showEkAciklama == true);

  ParamModel? get paramModel => CacheManager.getAnaVeri?.paramModel;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          // contentPadding: EdgeInsets.zero,
          // onLongPress: widget.model.remoteTempBelgeEtiketi == null
          //     ? () async {
          //         await dialogManager.showSiparisGridViewDialog(
          //           model: widget.model,
          //           onSelected: (value) {
          //             widget.onUpdated?.call(value);
          //           },
          //         );
          //       }
          //     : null,
          onTap: widget.isGetData == true
              ? () => Get.back(result: widget.model)
              : () async {
                  // var result =
                  await bottomSheetDialogManager.showBottomSheetDialog(
                    context,
                    title: widget.model.belgeNo ?? "",
                    children: [
                      BottomSheetModel(
                        title: "Görüntüle",
                        iconWidget: Icons.preview_outlined,
                        onTap: () {
                          // Get.back();
                          // return Get.toNamed(
                          //   "mainPage/siparisEdit",
                          //   arguments: BaseEditModel(model: SiparisEditRequestModel.fromSiparislerModel(widget.model), baseEditEnum: BaseEditEnum.goruntule, talep: widget.talep),
                          // );
                        },
                      ),
                      BottomSheetModel(
                        title: "Düzenle",
                        iconWidget: Icons.edit_outlined,
                        onTap: () async {
                          // if (widget.model.isNew == true) {
                          //   BaseSiparisEditModel.setInstance(widget.model);
                          // }
                          // Get.back();
                          // await Get.toNamed(
                          //   "mainPage/siparisEdit",
                          //   arguments: BaseEditModel(
                          //     model: SiparisEditRequestModel.fromSiparislerModel(widget.model),
                          //     baseEditEnum: BaseEditEnum.duzenle,
                          //     // talep: widget.talep,
                          //   ),
                          // );
                          // widget.onUpdated?.call(true);
                        },
                      ).yetkiKontrol(yetkiController.siparisDuzelt && widget.model.tipi != 1),
                      BottomSheetModel(
                        title: "Sil",
                        iconWidget: Icons.delete_outline_outlined,
                        onTap: () {
                          Get.back();
                          return dialogManager.showAreYouSureDialog(() async {
                            // if (widget.model.isNew == true) {
                            //   try {
                            //     CacheManager.removeSiparisEditList(widget.index!);
                            //     dialogManager.showSuccessSnackBar("Silindi");
                            //     widget.onDeleted?.call();
                            //   } catch (e) {
                            //     await dialogManager.showAlertDialog("Hata Oluştu.\n$e");
                            //   }
                            //   return;
                            // }
                            final result = await networkManager.deleteFatura(EditFaturaModel.fromTalepTeklifListesiModel(widget.model));
                            if (result.success == true) {
                              dialogManager.showSuccessSnackBar("Silindi");
                              widget.onDeleted?.call();
                            }
                          });
                        },
                      ).yetkiKontrol(widget.talepTeklifEnum.silinebilirMi && widget.model.tipi != 1),
                      BottomSheetModel(
                        title: "Yazdır",
                        iconWidget: Icons.print_outlined,
                        onTap: () async {
                          Get.back();
                          final PrintModel printModel = PrintModel(
                            raporOzelKod: widget.talepTeklifEnum.getPrintValue,
                            etiketSayisi: 1,
                            dicParams: DicParams(belgeNo: widget.model.belgeNo, belgeTipi: widget.model.belgeTuru, cariKodu: widget.model.cariKodu),
                          );
                          await bottomSheetDialogManager.showPrintBottomSheetDialog(context, printModel, true, true);
                        },
                      ),
                      // .yetkiKontrol(widget.model.remoteTempBelgeEtiketi == null),
                      // BottomSheetModel(
                      //   title: "İşlemler",
                      //   iconWidget: Icons.list_alt_outlined,
                      //   onTap: () async {
                      //     Get.back();
                      //     await dialogManager.showSiparisGridViewDialog(
                      //       model: widget.model,
                      //       onSelected: (value) {
                      //         widget.onUpdated?.call(value);
                      //       },
                      //     );
                      //   },
                      // ).yetkiKontrol(widget.model.remoteTempBelgeEtiketi == null),
                      // BottomSheetModel(title: "Kontrol Edildi", iconWidget: Icons.check_box_outlined)
                      //     .yetkiKontrol(widget.model.remoteTempBelgeEtiketi == null && yetkiController.siparisKontrolAciklamasiAktifMi && false),
                      BottomSheetModel(
                        title: "Cari İşlemleri",
                        iconWidget: Icons.person_outline_outlined,
                        onTap: () async {
                          Get.back();
                          dialogManager.showCariGridViewDialog(
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
              Text(widget.model.belgeNo ?? ""),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: widget.model.kayittarihi.toDateString),
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
                  // ColorfulBadge(label: Text(widget.model.remoteTempBelgeEtiketi ?? ""), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(widget.model.remoteTempBelgeEtiketi != null),
                  ColorfulBadge(label: Text("Dövizli ${widget.model.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(widget.model.dovizAdi != null),
                  // const ColorfulBadge(label: Text("Tamamlanmamış"), badgeColorEnum: BadgeColorEnum.tamamlanmamis).yetkiVarMi(widget.model.isNew == true),
                  const ColorfulBadge(label: Text("Fatura"), badgeColorEnum: BadgeColorEnum.fatura).yetkiVarMi(widget.model.faturalasti == "E"),
                  const ColorfulBadge(label: Text("Kapalı"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(widget.model.tipi == 1),
                  const ColorfulBadge(label: Text("Onayda")).yetkiVarMi(widget.model.tipi == 3),
                  // ColorfulBadge(label: Text("İrsaliye (${widget.model.irslesenSayi ?? ""})"), badgeColorEnum: BadgeColorEnum.irsaliye).yetkiVarMi(widget.model.irsaliyelesti == "E"),
                ].nullCheck.map((e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
              ),
              Text(widget.model.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize),
              LayoutBuilder(
                builder: (context, constrains) => Wrap(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.start,
                  children: [
                    // Text("Tipi: ${widget.model.tipi ? "Yurtiçi" : "Yurtdışı"}"),
                    Text("Kalem Adedi: ${widget.model.kalemAdedi ?? ""}"),
                    Text("Cari Kodu: ${widget.model.cariKodu ?? ""}"),
                    // Text("Koşul: ${widget.model.kosulKodu ?? ""}").yetkiVarMi(widget.model.kosulKodu != null),
                    Text("Plasiyer: ${widget.model.plasiyerAciklama ?? ""}", overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text("Vade Günü: ${widget.model.vadeGunu ?? "0"}").yetkiVarMi(widget.showVade == true),
                    Text("Döviz Toplamı: ${widget.model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${widget.model.dovizAdi ?? ""}")
                        .yetkiVarMi(widget.model.dovizTutari != null && widget.model.dovizAdi != null),
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
              //         widget.model.dovizAdi != null ? Text("Döviz Toplamı: ${widget.model.dovizTutari ?? ""} ${widget.model.dovizAdi ?? ""}").yetkiVarMi(widget.model.dovizTutari != null) : null,
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
                  Text("Teslim Miktar: ${((widget.model.miktar ?? 0) - (widget.model.kalanMiktar ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}", style: greyTextStyle),
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
}
