import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/constants/extensions/date_time_extensions.dart';
import 'package:picker/core/constants/extensions/list_extensions.dart';
import 'package:picker/core/constants/extensions/number_extensions.dart';
import 'package:picker/core/constants/extensions/widget_extensions.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_model.dart';

class SiparislerCard extends StatefulWidget {
  final SiparislerModel? model;
  const SiparislerCard({super.key, required this.model});

  @override
  State<SiparislerCard> createState() => _SiparislerCardState();
}

class _SiparislerCardState extends BaseState<SiparislerCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      onTap: () async {
        // var result =
        await bottomSheetDialogManager.showBottomSheetDialog(context, title: widget.model?.belgeNo ?? "", children: [
          BottomSheetModel(title: "Görüntüle", iconWidget: Icons.search_outlined),
          BottomSheetModel(title: "Düzelt", iconWidget: Icons.edit_outlined),
          BottomSheetModel(title: "Sil", iconWidget: Icons.delete_outline),
          BottomSheetModel(title: "Yazdır", iconWidget: Icons.print_outlined),
          BottomSheetModel(title: "İşlemler", iconWidget: Icons.list_alt_outlined),
          BottomSheetModel(title: "Kontrol Edildi", iconWidget: Icons.check_box_outlined),
          BottomSheetModel(
              title: "Cari İşlemleri",
              iconWidget: Icons.person_outline_outlined,
              onTap: () {
                Get.back();
                dialogManager.showCariGridViewDialog(CariListesiModel()
                  ..cariKodu = widget.model?.cariKodu
                  ..cariAdi = widget.model?.cariAdi);
              }),
        ]);
      },
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.model?.belgeNo ?? ""),
          Text(widget.model?.kayittarihi.toDateString() ?? ""),
        ],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Badge(label: Text(widget.model?.remoteTempBelgeEtiketi ?? "")).yetkiVarMi(widget.model?.remoteTempBelgeEtiketi != null),
              Badge(label: Text("Dövizli ${widget.model?.dovizAdi ?? ""}")).yetkiVarMi(widget.model?.dovizAdi != null),
              const Badge(label: Text("Onayda")).yetkiVarMi(widget.model?.tipi == 3),
              Badge(label: Text("İrsaliye (${widget.model?.irslesenSayi ?? ""})")).yetkiVarMi(widget.model?.irsaliyelesti == "E"),
            ].nullCheck.map((e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
          ),
          Text(widget.model?.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tipi: ${widget.model?.tipi ?? ""}"),
                  widget.model?.kosulKodu != null ? Text("Koşul: ${widget.model?.kosulKodu ?? ""}") : null,
                  Text("Ara Toplam: ${widget.model?.araToplam.commaSeparatedWithFixedDigits ?? ""} TL"),
                  Text("Genel Toplam: ${widget.model!.genelToplam?.commaSeparatedWithFixedDigits ?? ""} TL"),
                ].nullCheck.cast<Widget>(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kalem Adedi: ${widget.model?.kalemAdedi ?? ""}"),
                  Text("Plasiyer: ${widget.model?.plasiyerAciklama ?? ""}"),
                  Text("KDV: ${widget.model?.kdv ?? ""} TL"),
                  widget.model?.dovizAdi != null ? Text("Döviz Toplamı: ${widget.model?.dovizTutari ?? ""} ${widget.model?.dovizAdi ?? ""}") : null,
                ].nullCheck.cast<Widget>(),
              ),
            ].map((e) => Expanded(child: e)).toList(),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Tipi: ${widget.model.tipi ?? ""}"),
          //     Text("Kalem Adedi: ${widget.model.kalemAdedi ?? ""}"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Ara Toplam: ${widget.model.araToplam.commaSeparatedWithFixedDigits} TL"),
          //     Text("Plasiyer: ${widget.model.plasiyerAciklama ?? ""}"),
          //   ],
          // ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //   children: [
          //     Text("Genel Toplam: ${widget.model.genelToplam ?? ""} TL"),
          //     Text("KDV: ${widget.model.kdv ?? ""} TL"),
          //   ],
          // ),
        ],
      ),
    ));
  }
}
