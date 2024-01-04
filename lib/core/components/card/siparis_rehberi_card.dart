import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";

import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/list_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../badge/colorful_badge.dart";

class SiparisRehberiCard extends StatefulWidget {
  const SiparisRehberiCard({
    super.key,
    required this.model,
    required this.editTipiEnum,
    this.showEkAciklama,
    this.showMiktar,
    this.showVade,
    this.onTap, required this.value,
  });

  ///Eğer Bu widget Cache'den çağırılıyorsa index verilmelidir.
  final BaseSiparisEditModel model;
  final void Function()? onTap;
  final bool value;
  final bool? showEkAciklama;
  final bool? showMiktar;
  final bool? showVade;
  final EditTipiEnum editTipiEnum;

  @override
  State<SiparisRehberiCard> createState() => _SiparisRehberiCardState();
}

class _SiparisRehberiCardState extends BaseState<SiparisRehberiCard> {
  TextStyle get greyTextStyle => TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.6));

  List<Widget> aciklamaList() => List.generate(16, (index) => aciklamaText(index + 1)).whereType<Text>().toList();

  Widget aciklamaText(int? index) => Text("${paramModel?.toJson()["SatisEkAciklamaTanimi$index"] ?? "Açıklama $index"}: ${widget.model.toJson()["ACIK$index"]}", style: greyTextStyle)
      .yetkiVarMi(widget.model.toJson()["ACIK$index"] != null && widget.showEkAciklama == true);

  ParamModel? get paramModel => CacheManager.getAnaVeri?.paramModel;

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          onTap: widget.onTap,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: widget.value,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onChanged: (value) {
                  widget.onTap?.call();
                },
              ),
              Expanded(child: Text(widget.model.belgeNo ?? "")),
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
              LayoutBuilder(
                builder: (context, constrains) => Wrap(
                  crossAxisAlignment: WrapCrossAlignment.start,
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
