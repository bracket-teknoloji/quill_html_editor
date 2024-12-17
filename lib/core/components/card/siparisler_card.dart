import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "package:picker/core/constants/enum/dizayn_ozel_kod_enum.dart";

import "../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
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

class SiparislerCard extends StatefulWidget {
  const SiparislerCard({
    required this.model, required this.editTipiEnum, required this.index, super.key,
    this.onDeleted,
    this.isGetData,
    this.showEkAciklama,
    this.showMiktar,
    this.showVade,
    this.onUpdated,
  });

  ///Eğer Bu widget Cache'den çağırılıyorsa index verilmelidir.
  final int index;
  final bool? isGetData;
  final BaseSiparisEditModel model;
  final Function? onDeleted;
  final ValueChanged<bool>? onUpdated;
  final bool? showEkAciklama;
  final bool? showMiktar;
  final bool? showVade;
  final EditTipiEnum editTipiEnum;

  @override
  State<SiparislerCard> createState() => _SiparislerCardState();
}

class _SiparislerCardState extends BaseState<SiparislerCard> {
  TextStyle get greyTextStyle => TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6));

  List<Widget> aciklamaList() => List.generate(16, (index) => aciklamaText(index + 1)).whereType<Text>().toList();

  Widget aciklamaText(int? index) => Text("${paramModel?.toJson()["SatisEkAciklamaTanimi$index"] ?? "Açıklama $index"}: ${widget.model.toJson()["ACIK$index"]}", style: greyTextStyle)
      .yetkiVarMi(widget.model.toJson()["ACIK$index"] != null && widget.showEkAciklama == true);

  ParamModel? get paramModel => CacheManager.getAnaVeri?.paramModel;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          // contentPadding: EdgeInsets.zero,
          onLongPress: widget.model.remoteTempBelgeEtiketi == null
              ? () async {
                  await dialogManager.showSiparisGridViewDialog(
                    model: widget.model,
                    siparisTipi: widget.model.getEditTipiEnum,
                    onSelected: (value) {
                      widget.onUpdated?.call(value);
                    },
                  );
                }
              : null,
          onTap: widget.isGetData == true
              ? () => Get.back(result: widget.model)
              : () async {
                  // var result =
                  await bottomSheetDialogManager.showBottomSheetDialog(
                    context,
                    title: widget.model.belgeNo ?? "",
                    children: [
                      BottomSheetModel(
                        title: loc.generalStrings.view,
                        iconWidget: Icons.preview_outlined,
                        onTap: () {
                          Get.back();
                          return Get.toNamed(
                            "mainPage/siparisEdit",
                            arguments: BaseEditModel(model: SiparisEditRequestModel.fromSiparislerModel(widget.model), baseEditEnum: BaseEditEnum.goruntule, editTipiEnum: widget.editTipiEnum),
                          );
                        },
                      ),
                      BottomSheetModel(
                        title: loc.generalStrings.edit,
                        iconWidget: Icons.edit_outlined,
                        onTap: () async {
                          if (widget.model.isNew == true) {
                            BaseSiparisEditModel.setInstance(widget.model);
                          }
                          Get.back();
                          final result = await Get.toNamed(
                            "mainPage/siparisEdit",
                            arguments: BaseEditModel(
                              model: SiparisEditRequestModel.fromSiparislerModel(widget.model),
                              baseEditEnum: BaseEditEnum.duzenle,
                              editTipiEnum: widget.editTipiEnum,
                            ),
                          );
                          if (result == true) {
                            if (widget.model.isNew == true) {
                              CacheManager.removeSiparisEditList(widget.model.belgeNo ?? "");
                            }
                            widget.onUpdated?.call(true);
                          }
                        },
                      ).yetkiKontrol(yetkiController.siparisDuzelt && widget.model.tipi != 1),
                      BottomSheetModel(
                        title: loc.generalStrings.delete,
                        iconWidget: Icons.delete_outline_outlined,
                        onTap: () {
                          Get.back();
                          return dialogManager.showAreYouSureDialog(() async {
                            if (widget.model.isNew == true) {
                              try {
                                CacheManager.removeSiparisEditList(widget.model.belgeNo ?? "");
                                dialogManager.showSuccessSnackBar("Silindi");
                                widget.onDeleted?.call();
                              } catch (e) {
                                await dialogManager.showAlertDialog("Hata Oluştu.\n$e");
                              }
                              return;
                            }
                            final result = await networkManager.deleteFatura(EditFaturaModel().fromJson(widget.model.toJson()));
                            if (result.isSuccess) {
                              dialogManager.showSuccessSnackBar("Silindi");
                              widget.onDeleted?.call();
                            }
                          });
                        },
                      ).yetkiKontrol((yetkiController.siparisSil || widget.model.isNew == true) && widget.model.tipi != 1),
                      BottomSheetModel(
                        title: "PDF Görüntüle",
                        iconWidget: Icons.picture_as_pdf_outlined,
                        onTap: () async {
                          Get.back();

                          final dizayn = await bottomSheetDialogManager.showDizaynBottomSheetDialog(context, null, ozelKod: DizaynOzelKodEnum.musteriSiparisi, editTipi: widget.model.getEditTipiEnum);
                          if (dizayn == null) {
                            return;
                          }
                          final PdfModel pdfModel = PdfModel(
                            raporOzelKod: widget.editTipiEnum.getPrintValue,
                            dizaynId: dizayn.id,
                            dicParams: DicParams(
                              belgeNo: widget.model.isTempBelge ? null : widget.model.belgeNo,
                              belgeTipi: widget.model.getEditTipiEnum?.rawValue,
                              cariKodu: widget.model.cariKodu,
                              tempBelgeId: widget.model.isTempBelge ? widget.model.tempBelgeId.toStringIfNotNull : null,
                            ),
                          );
                          await Get.to(() => PDFViewerView(title: dizayn.dizaynAdi ?? "", pdfData: pdfModel));
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
                            dicParams: DicParams(belgeNo: widget.model.belgeNo, belgeTipi: widget.model.getEditTipiEnum?.rawValue, cariKodu: widget.model.cariKodu),
                          );
                          await bottomSheetDialogManager.showPrintBottomSheetDialog(context, printModel, true, true, editTipiEnum: widget.editTipiEnum);
                        },
                      ).yetkiKontrol(widget.model.remoteTempBelgeEtiketi == null),
                      BottomSheetModel(
                        title: loc.generalStrings.actions,
                        iconWidget: Icons.list_alt_outlined,
                        onTap: () async {
                          Get.back();
                          await dialogManager.showSiparisGridViewDialog(
                            model: widget.model,
                            siparisTipi: widget.model.getEditTipiEnum,
                            onSelected: (value) {
                              widget.onUpdated?.call(value);
                            },
                          );
                        },
                      ).yetkiKontrol(widget.model.remoteTempBelgeEtiketi == null),
                      BottomSheetModel(title: "Kontrol Edildi", iconWidget: Icons.check_box_outlined)
                          .yetkiKontrol(widget.model.remoteTempBelgeEtiketi == null && yetkiController.siparisKontrolAciklamasiAktifMi && false),
                      BottomSheetModel(
                        title: "Cari İşlemleri",
                        iconWidget: Icons.person_outline_outlined,
                        onTap: () {
                          Get.back();
                          dialogManager.showCariGridViewDialog(
                            CariListesiModel()
                              ..cariKodu = widget.model.cariKodu
                              ..cariAdi = widget.model.cariAdi,
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
                    TextSpan(text: widget.model.tarih.toDateString),
                    TextSpan(text: "   ${widget.model.kayittarihi.toTimeString}", style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6), fontSize: UIHelper.midSize)),
                  ],
                ),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ColorfulBadge(label: Text(widget.model.remoteTempBelgeEtiketi ?? ""), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(widget.model.remoteTempBelgeEtiketi != null),
                  ColorfulBadge(label: Text("Dövizli ${widget.model.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(widget.model.dovizAdi != null),
                  const ColorfulBadge(label: Text("Tamamlanmamış"), badgeColorEnum: BadgeColorEnum.tamamlanmamis).yetkiVarMi(widget.model.isNew == true),
                  ColorfulBadge(label: Text("Fatura (${widget.model.faturalasanSayi})"), badgeColorEnum: BadgeColorEnum.fatura).yetkiVarMi(widget.model.faturalasanSayi != null),
                  const ColorfulBadge(label: Text("Kapalı"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(widget.model.tipi == 1),
                  const ColorfulBadge(label: Text("Onayda")).yetkiVarMi(widget.model.tipi == 3),
                  ColorfulBadge(label: Text("İrsaliye (${widget.model.irslesenSayi ?? ""})"), badgeColorEnum: BadgeColorEnum.irsaliye).yetkiVarMi(widget.model.irsaliyelesti == "E"),
                ].nullCheck.map((e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
              ),
              Text(widget.model.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize),
              Text("Teslim Cari: ${widget.model.teslimCariAdi}").yetkiVarMi(widget.model.teslimCariAdi != null && widget.model.teslimCariAdi != widget.model.cariAdi),
              LayoutBuilder(
                builder: (context, constrains) => Wrap(
                  children: [
                    Text("Tipi: ${widget.model.yurticiMi ? "Yurtiçi" : "Yurtdışı"}"),
                    Text("Kalem Adedi: ${widget.model.kalemAdedi ?? ""}"),
                    Text("Cari Kodu: ${widget.model.cariKodu ?? ""}"),
                    Text("Koşul: ${widget.model.kosulKodu ?? ""}").yetkiVarMi(widget.model.kosulKodu != null),
                    Text("Plasiyer: ${widget.model.plasiyerAciklama ?? ""}", overflow: TextOverflow.ellipsis, maxLines: 1),
                    Text("Vade Günü: ${widget.model.vadeGunu ?? "0"}").yetkiVarMi(widget.showVade == true),
                    Text("Döviz Toplamı: ${widget.model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${widget.model.dovizAdi ?? ""}")
                        .yetkiVarMi(widget.model.dovizTutari != null && widget.model.dovizAdi != null),
                    Text("KDV: ${widget.model.kdv.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                    Text("Ara Toplam: ${widget.model.getAraToplam2.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
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
}
