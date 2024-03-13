import "package:flutter/material.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";

class CariAktiviteCard extends StatefulWidget {
  final CariAktiviteListesiModel model;
  const CariAktiviteCard({super.key, required this.model});

  @override
  State<CariAktiviteCard> createState() => _CariAktiviteCardState();
}

class _CariAktiviteCardState extends State<CariAktiviteCard> {
  CariAktiviteListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Kullanıcı: ${model.kullaniciAdi}").yetkiVarMi(model.kullaniciAdi != null),
                  Text("#${model.id}"),
                ],
              ),
              Text("Başlama Tarihi: ${model.bastar.toDateString}").yetkiVarMi(model.bastar != null),
              Text("Bitiş Tarihi: ${model.bittar.toDateString}").yetkiVarMi(model.bittar != null),
              Text("Cari: ${model.cariAdi}").yetkiVarMi(model.cariAdi != null),
              Text("İlgili Kişi: ${model.ilgiliKisi}").yetkiVarMi(model.ilgiliKisi != null),
              Text("Aktivite: ${model.aktiviteAdi}").yetkiVarMi(model.aktiviteAdi != null),
              Text("Kaydeden: ${model.kayityapankul}").yetkiVarMi(model.kayityapankul != null),
              Text("Açıklama: ${model.aciklama}").yetkiVarMi(model.aciklama != null),
            ],
          ),
        ),
      );
}
