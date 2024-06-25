import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_listesi/model/uretim_sonu_kaydi_listesi_model.dart";

final class UretimSonuKaydiListesiCard extends StatefulWidget {
  final UretimSonuKaydiListesiModel model;
  const UretimSonuKaydiListesiCard({super.key, required this.model});

  @override
  State<UretimSonuKaydiListesiCard> createState() => _UretimSonuKaydiListesiCardState();
}

final class _UretimSonuKaydiListesiCardState extends BaseState<UretimSonuKaydiListesiCard> {
  UretimSonuKaydiListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(model.belgeNo ?? ""),
              Text(model.tarih.toDateString),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.stokAdi ?? ""),
              Text(model.stokKodu ?? ""),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  Text("Çıkış Depo: ${model.cikisDepo}").yetkiVarMi(model.cikisDepo != null),
                  Text("Giriş Depo: ${model.girisDepo}").yetkiVarMi(model.girisDepo != null),
                  Text("Miktar: ${model.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                  Text("Hurda/Fir: ${model.miktar2.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                ],
              ),
              Text(model.aciklama ?? ""),
            ],
          ),
        ),
      );
}
