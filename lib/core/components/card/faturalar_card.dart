import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../base/model/base_edit_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/enum/base_edit_enum.dart";
import "../../constants/enum/siparis_tipi_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../badge/colorful_badge.dart";
import "../dialog/bottom_sheet/model/bottom_sheet_model.dart";

class FaturalarCard extends StatefulWidget {
  final BaseSiparisEditModel model;
  final ValueChanged<bool>? onUpdated;
  final bool? showMiktar;
  final SiparisTipiEnum? siparisTipiEnum;
  final bool? showVade;
  final bool? showEkAciklama;

  const FaturalarCard({super.key, required this.model, this.onUpdated, this.showMiktar, this.showEkAciklama, this.showVade, this.siparisTipiEnum});

  @override
  State<FaturalarCard> createState() => _FaturalarCardState();
}

class _FaturalarCardState extends BaseState<FaturalarCard> {
  ParamModel? get paramModel => CacheManager.getAnaVeri()?.paramModel;

  TextStyle get greyTextStyle => TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6));

  List<Widget> aciklamaList() => List.generate(16, (int index) => aciklamaText(index + 1)).whereType<Text>().toList();

  Widget aciklamaText(int? index) => Text("${paramModel?.toJson()["SatisEkAciklamaTanimi$index"] ?? "Açıklama $index"}: ${widget.model.toJson()["ACIK$index"]}", style: greyTextStyle)
      .yetkiVarMi(widget.model.toJson()["ACIK$index"] != null && widget.showEkAciklama == true);

  BaseSiparisEditModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: () async => await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: model.cariAdi ?? "",
            children: <BottomSheetModel>[
              BottomSheetModel(
                  title: "Görüntüle",
                  iconWidget: Icons.search_outlined,
                  onTap: () async {
                    Get.back();
                    await Get.toNamed("/mainPage/sevkiyatEdit", arguments: BaseEditModel(model: model, baseEditEnum: BaseEditEnum.goruntule, siparisTipiEnum: widget.siparisTipiEnum));
                  },),
            ],
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(model.belgeNo ?? ""),
              Text.rich(
                TextSpan(
                  children: <InlineSpan>[
                    TextSpan(text: model.kayittarihi.toDateString),
                    TextSpan(text: "   ${model.kayittarihi.toTimeString}", style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6), fontSize: 10)),
                  ],
                ),
              ),
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  ColorfulBadge(label: Text(model.remoteTempBelgeEtiketi ?? ""), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(model.remoteTempBelgeEtiketi != null),
                  ColorfulBadge(label: Text("Dövizli ${model.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(model.dovizAdi != null),
                  const ColorfulBadge(label: Text("Tamamlanmamış"), badgeColorEnum: BadgeColorEnum.tamamlanmamis).yetkiVarMi(model.isNew == true),
                  ColorfulBadge(label: Text("Fatura (${model.faturalasanSayi})"), badgeColorEnum: BadgeColorEnum.fatura).yetkiVarMi(model.faturalasanSayi != null),
                  const ColorfulBadge(label: Text("Kapalı"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.tipi == 1),
                  const ColorfulBadge(label: Text("Onayda")).yetkiVarMi(model.tipi == 3),
                  ColorfulBadge(label: Text("İrsaliye (${model.irslesenSayi ?? ""})"), badgeColorEnum: BadgeColorEnum.irsaliye).yetkiVarMi(model.irsaliyelesti == "E"),
                  const ColorfulBadge(label: Text("E-Fatura"), badgeColorEnum: BadgeColorEnum.eFatura).yetkiVarMi(model.efaturaMi == "E"),
                  const ColorfulBadge(label: Text("E-Arşiv"), badgeColorEnum: BadgeColorEnum.eFatura).yetkiVarMi(model.earsivMi == "E"),
                  dialogInkWell(const ColorfulBadge(label: Text("Hata"), badgeColorEnum: BadgeColorEnum.hata))
                      .yetkiVarMi((model.earsivDurumu == "HAT" || model.efaturaDurumu == "HAT") && (model.efaturaMi == "E" || model.earsivMi == "E")),
                  dialogInkWell(const ColorfulBadge(label: Text("Taslak"), badgeColorEnum: BadgeColorEnum.taslak))
                      .yetkiVarMi((model.earsivDurumu == "TAS" || model.efaturaDurumu == "TAS") && (model.efaturaMi == "E" || model.earsivMi == "E")),
                  dialogInkWell(const ColorfulBadge(label: Text("Uyarı"), badgeColorEnum: BadgeColorEnum.uyari))
                      .yetkiVarMi((model.earsivDurumu == "BEK" || model.efaturaDurumu == "BEK") && (model.efaturaMi == "E" || model.earsivMi == "E")),
                  // const ColorfulBadge(label: Text("Uyarı"), badgeColorEnum: BadgeColorEnum.uyari).yetkiVarMi(model.efaturaDurumu == "BEK" && model.efaturaMi == "E"),
                  dialogInkWell(const ColorfulBadge(label: Text("Başarılı"), badgeColorEnum: BadgeColorEnum.basarili))
                      .yetkiVarMi((model.efaturaMi == "E" || model.earsivMi == "E") && model.efaturaGibDurumKodu == 1300 && widget.siparisTipiEnum?.satisMi == true),
                ].nullCheck.map((Widget e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
              ),
              Text(model.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize),
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) => Wrap(
                        crossAxisAlignment: WrapCrossAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.start,

                        children: <Widget>[
                          Text("Tipi: ${model.yurticiMi ? "Yurtiçi" : "Yurtdışı"}"),
                          Text("Kalem Adedi: ${model.kalemAdedi ?? ""}"),
                          Text("Cari Kodu: ${model.cariKodu ?? ""}"),
                          Text("Koşul: ${model.kosulKodu ?? ""}").yetkiVarMi(model.kosulKodu != null),
                          Text("Plasiyer: ${model.plasiyerAciklama ?? ""}", overflow: TextOverflow.ellipsis, maxLines: 1),
                          Text("Vade Günü: ${widget.model.vadeGunu ?? "0"}").yetkiVarMi(widget.showVade == true),
                          Text("Döviz Toplamı: ${model.dovizTutari ?? ""} ${model.dovizAdi ?? ""}").yetkiVarMi(model.dovizTutari != null && model.dovizAdi != null),
                          Text("KDV: ${model.kdv.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                          Text("Ara Toplam: ${model.getAraToplam2.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                          Text("Genel Toplam: ${model.genelToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency").yetkiVarMi(model.genelToplam != null),
                        ].map((Widget e) => e is SizedBox ? null : SizedBox(width: constraints.maxWidth / 2, child: e)).whereType<Widget>().toList(),
                      ),),
              const Divider(
                indent: 0,
                endIndent: 0,
              ).paddingSymmetric(vertical: UIHelper.midSize).yetkiVarMi(widget.showMiktar == true),
              // Text("Miktar: ${widget.model.miktar.commaSeparatedWithFixedDigits ?? ""}").yetkiVarMi(widget.showMiktar == true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Text>[
                  Text("Miktar: ${widget.model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                ].map((Text e) => e is SizedBox ? null : e).whereType<Widget>().toList(),
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
              "Durum Kodu: ${model.efaturaGibDurumKodu ?? 0}${model.efaturaDurumAciklama != null ? '\n${model.efaturaDurumAciklama ?? ""}' : ""}", badge.badgeColorEnum.getColor,);
          // switch (model.efaturaDurumu) {
          //   case "HAT":
          //   case "BEK":
          //   case "TAS":
          //     dialogManager.showInfoSnackBar("Durum Kodu: ${model.efaturaGibDurumKodu ?? 0}\n${model.efaturaDurumAciklama ?? ""}");
          //   case "TMM":
          //     dialogManager.showSuccessSnackBar("Durum Kodu: ${model.efaturaGibDurumKodu ?? 0}\n${model.efaturaDurumAciklama ?? ""}");
          //     break;
          //   default:
          // }
        },
        child: badge,
      );
}