import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";

import "../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../view/main_page/model/param_model.dart";
import "../../base/state/base_state.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/enum/edit_tipi_enum.dart";
import "../../constants/extensions/date_time_extensions.dart";
import "../../constants/extensions/number_extensions.dart";
import "../../constants/ondalik_utils.dart";
import "../../constants/ui_helper/ui_helper.dart";
import "../../init/cache/cache_manager.dart";
import "../badge/colorful_badge.dart";

final class SiparisRehberiCard extends StatefulWidget {
  const SiparisRehberiCard({
    required this.model,
    required this.editTipiEnum,
    required this.value,
    super.key,
    this.showEkAciklama,
    this.showMiktar,
    this.showVade,
    this.onTap,
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

final class _SiparisRehberiCardState extends BaseState<SiparisRehberiCard> {
  TextStyle get greyTextStyle => TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.6));

  List<Widget> aciklamaList() => List.generate(16, (index) => aciklamaText(index + 1)).nonNulls.toList();

  Widget? aciklamaText(int? index) {
    if (widget.model.toJson()["ACIK$index"] != null && widget.showEkAciklama == true) {
      return Text(
        "${paramModel?.toJson()["SatisEkAciklamaTanimi$index"] ?? "Açıklama $index"}: ${widget.model.toJson()["ACIK$index"]}",
        style: greyTextStyle,
      );
    }
    return null;
  }

  ParamModel? get paramModel => CacheManager.getAnaVeri?.paramModel;

  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      onTap: widget.onTap,
      title: Row(
        children: [
          if (_cokluSecim)
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
                TextSpan(
                  text: "   ${widget.model.kayittarihi.toTimeString}",
                  style: TextStyle(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    fontSize: UIHelper.midSize,
                  ),
                ),
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
              if (widget.model.remoteTempBelgeEtiketi != null)
                ColorfulBadge(
                  label: Text(widget.model.remoteTempBelgeEtiketi ?? ""),
                  badgeColorEnum: BadgeColorEnum.seri,
                ),
              if (widget.model.dovizAdi != null)
                ColorfulBadge(
                  label: Text("Dövizli ${widget.model.dovizAdi ?? ""}"),
                  badgeColorEnum: BadgeColorEnum.dovizli,
                ),
              if (widget.model.isNew == true)
                const ColorfulBadge(label: Text("Tamamlanmamış"), badgeColorEnum: BadgeColorEnum.tamamlanmamis),
              if (widget.model.faturalasanSayi != null)
                ColorfulBadge(
                  label: Text("Fatura (${widget.model.faturalasanSayi})"),
                  badgeColorEnum: BadgeColorEnum.fatura,
                ),
              if (widget.model.tipi == 1)
                const ColorfulBadge(label: Text("Kapalı"), badgeColorEnum: BadgeColorEnum.kapali),
              if (widget.model.tipi == 3) const ColorfulBadge(label: Text("Onayda")),
              if (widget.model.irsaliyelestiMi)
                ColorfulBadge(
                  label: Text("İrsaliye (${widget.model.irslesenSayi ?? ""})"),
                  badgeColorEnum: BadgeColorEnum.irsaliye,
                ),
            ].map((e) => e.paddingOnly(right: UIHelper.lowSize)).toList(),
          ),
          Text(widget.model.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize),
          CustomLayoutBuilder.divideInHalf(
            children: [
              Text("Tipi: ${widget.model.yurticiMi ? "Yurtiçi" : "Yurtdışı"}"),
              Text("Kalem Adedi: ${widget.model.kalemAdedi ?? ""}"),
              Text("Cari Kodu: ${widget.model.cariKodu ?? ""}"),
              if (widget.model.kosulKodu != null) Text("Koşul: ${widget.model.kosulKodu ?? ""}"),
              Text("Plasiyer: ${widget.model.plasiyerAciklama ?? ""}", overflow: TextOverflow.ellipsis, maxLines: 1),
              if (widget.showVade == true) Text("Vade Günü: ${widget.model.vadeGunu ?? "0"}"),
              if (widget.model.dovizTutari != null && widget.model.dovizAdi != null)
                Text(
                  "Döviz Toplamı: ${widget.model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${widget.model.dovizAdi ?? ""}",
                ),
              Text("KDV: ${widget.model.kdv.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
              Text(
                "Ara Toplam: ${widget.model.getAraToplam2.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
              ),
              Text(
                "Genel Toplam: ${widget.model.genelToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
              ),
            ],
          ),
          if (widget.showMiktar == true)
            const Divider(indent: 0, endIndent: 0).paddingSymmetric(vertical: UIHelper.midSize),
          if (widget.showMiktar == true)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Miktar: ${widget.model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                  style: greyTextStyle,
                ),
                const Flexible(child: Text("|")),
                Text(
                  "Teslim Miktar: ${((widget.model.miktar ?? 0) - (widget.model.kalanMiktar ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                  style: greyTextStyle,
                ),
                const Flexible(child: Text("|")),
                Text(
                  "Kalan Miktar: ${widget.model.kalanMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                  style: greyTextStyle,
                ),
              ],
            ),
          if (widget.showEkAciklama == true && aciklamaList().ext.isNotNullOrEmpty)
            const Divider(indent: 0, endIndent: 0).paddingSymmetric(vertical: UIHelper.midSize),
          ...aciklamaList(),
        ],
      ),
    ),
  );

  bool get _cokluSecim => widget.editTipiEnum.siparisBaglantisiCokluSecim;
}
