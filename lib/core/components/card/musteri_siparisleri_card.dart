import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/constants/extensions/date_time_extensions.dart';
import 'package:picker/core/constants/extensions/list_extensions.dart';
import 'package:picker/core/constants/extensions/number_extensions.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/musteri_siparisleri/model/musteri_siparisleri_model.dart';

class MusteriSiparisleriCard extends StatefulWidget {
  final MusteriSiparisleriModel model;
  const MusteriSiparisleriCard({super.key, required this.model});

  @override
  State<MusteriSiparisleriCard> createState() => _MusteriSiparisleriCardState();
}

class _MusteriSiparisleriCardState extends BaseState<MusteriSiparisleriCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.model.belgeNo ?? ""),
          Text(widget.model.kayittarihi.toDateString()),
        ],
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.model.cariAdi ?? "").paddingSymmetric(vertical: UIHelper.lowSize),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tipi: ${widget.model.tipi ?? ""}"),
                  widget.model.kosulKodu != null ? Text("Koşul: ${widget.model.kosulKodu ?? ""}") : null,
                  Text("Ara Toplam: ${widget.model.araToplam.commaSeparatedWithFixedDigits} TL"),
                  Text("Genel Toplam: ${widget.model.genelToplam ?? ""} TL"),
                ].nullCheck.cast<Widget>(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Kalem Adedi: ${widget.model.kalemAdedi ?? ""}"),
                  Text("Plasiyer: ${widget.model.plasiyerAciklama ?? ""}"),
                  Text("KDV: ${widget.model.kdv ?? ""} TL"),
                  widget.model.dovizAdi != null ? Text("Döviz Toplamı: ${widget.model.dovizTutari ?? ""} ${widget.model.dovizAdi ?? ""}") : null,
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
