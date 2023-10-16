import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

import "../../constants/ondalik_utils.dart";

class FaturalarCard extends StatefulWidget {
  final BaseSiparisEditModel model;
  final ValueChanged<bool>? onUpdated;
  const FaturalarCard({super.key, required this.model, this.onUpdated});

  @override
  State<FaturalarCard> createState() => _FaturalarCardState();
}

class _FaturalarCardState extends BaseState<FaturalarCard> {
  BaseSiparisEditModel get model => widget.model;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(model.belgeNo ?? ""),
            Text.rich(
              TextSpan(
                children: [
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
          children: [
            Row(
              children: [
                ColorfulBadge(label: Text(model.remoteTempBelgeEtiketi ?? ""), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(model.remoteTempBelgeEtiketi != null),
                ColorfulBadge(label: Text("Dövizli ${model.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(model.dovizAdi != null),
                const ColorfulBadge(label: Text("Tamamlanmamış"), badgeColorEnum: BadgeColorEnum.tamamlanmamis).yetkiVarMi(model.isNew == true),
                ColorfulBadge(label: Text("Fatura (${model.faturalasanSayi})"), badgeColorEnum: BadgeColorEnum.fatura).yetkiVarMi(model.faturalasanSayi != null),
                const ColorfulBadge(label: Text("Kapalı"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.tipi == 1),
                const ColorfulBadge(label: Text("Onayda")).yetkiVarMi(model.tipi == 3),
                ColorfulBadge(label: Text("İrsaliye (${model.irslesenSayi ?? ""})"), badgeColorEnum: BadgeColorEnum.irsaliye).yetkiVarMi(model.irsaliyelesti == "E"),
              ].nullCheck.map((e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
            ),
            Text(model.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize),
            Wrap(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: WrapCrossAlignment.start,
              children: [
                Text("Tipi: ${model.yurticiMi ? "Yurtiçi" : "Yurtdışı"}"),
                Text("Kalem Adedi: ${model.kalemAdedi ?? ""}"),
                Text("Cari Kodu: ${model.cariKodu ?? ""}"),
                Text("Koşul: ${model.kosulKodu ?? ""}").yetkiVarMi(model.kosulKodu != null),
                Text("Plasiyer: ${model.plasiyerAciklama ?? ""}", overflow: TextOverflow.ellipsis, maxLines: 1),
                Text("Vade Günü: ${model.vadeGunu ?? "0"}"),
                model.dovizAdi != null ? Text("Döviz Toplamı: ${model.dovizTutari ?? ""} ${model.dovizAdi ?? ""}").yetkiVarMi(model.dovizTutari != null) : null,
                Text("KDV: ${model.kdv.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                Text("Ara Toplam: ${model.getAraToplam2.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                Text("Genel Toplam: ${model.genelToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency").yetkiVarMi(model.genelToplam != null),
              ].whereType<Widget>().map((e) => e is SizedBox ? null : SizedBox(width: width * 0.4, child: e)).whereType<Widget>().toList(),
            ),
            // const Divider(
            //   indent: 0,
            //   endIndent: 0,
            // )
            //     .paddingSymmetric(vertical: UIHelper.midSize),
            // // Text("Miktar: ${widget.model.miktar?.commaSeparatedWithFixedDigits ?? ""}").yetkiVarMi(widget.showMiktar == true),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text(
            //         "Miktar: ${widget.model?.miktar.(OndalikEnum.miktar)}"),
            //     const Flexible(child: Text("|")),
            //     Text(
            //         "Teslim Miktar: ${((widget.model?.miktar ?? 0) - (widget.model?.kalanMiktar ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",),
            //     const Flexible(child: Text("|")),
            //     Text(
            //         "Kalan Miktar: ${widget.model?.kalanMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
            //   ].map((e) => e is SizedBox ? null : e).whereType<Widget>().toList(),
            // ).yetkiVarMi(widget.showMiktar == true),
            // const Divider(
            //   indent: 0,
            //   endIndent: 0,
            // ).paddingSymmetric(vertical: UIHelper.midSize).yetkiVarMi(
            //     (widget.showEkAciklama == true &&
            //         aciklamaList().ext.isNotNullOrEmpty)),
            // ...aciklamaList(),
          ],
        ),
      ),
    );
  }
}
