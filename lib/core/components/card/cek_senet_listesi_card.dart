import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_model.dart";

class CekSenetListesiCard extends StatefulWidget {
  final CekSenetListesiModel model;
  const CekSenetListesiCard({super.key, required this.model});

  @override
  State<CekSenetListesiCard> createState() => _CekSenetListesiCardState();
}

class _CekSenetListesiCardState extends BaseState<CekSenetListesiCard> {
  CekSenetListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(model.belgeNo ?? ""),
                  Text(model.yerAciklamaDurum, style: TextStyle(color: UIHelper.primaryColor, fontWeight: FontWeight.bold)),
                ],
              ),
              Row(
                children: [
                  const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(model.dovizKodu != null),
                ],
              ),
              Text(model.cariKodu ?? ""),
              LayoutBuilder(
                builder: (context, constraints) => Wrap(
                  children: [
                    Text("Tutar: ${model.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"),
                    Text("İşlem Tarihi: ${model.tarih.toDateString}"),
                    Text("Vade Tarihi: ${model.vadeTarihi.toDateString}"),
                    Text("Asıl/Ciro: ${model.ciroTipiString}"),
                    Text("Seri No: ${model.seriNo ?? ""}"),
                  ]
                      .map(
                        (e) => SizedBox(
                          width: constraints.maxWidth / 2,
                          child: e,
                        ),
                      )
                      .toList(),
                ),
              ),
              Text(model.aciklamalar, style: const TextStyle(color: ColorPalette.slateGray)),
            ],
          ),
        ),
      );
}
