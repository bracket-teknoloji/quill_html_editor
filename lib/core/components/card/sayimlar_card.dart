import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";

class SayimlarCard extends StatefulWidget {
  final SayimListesiModel model;
  const SayimlarCard({super.key, required this.model});

  @override
  State<SayimlarCard> createState() => _SayimlarCardState();
}

class _SayimlarCardState extends BaseState<SayimlarCard> {
  SayimListesiModel get model => widget.model;

  @override
  Widget build(BuildContext context) => Card(
        color: model.miktarSifirdanBuyukMu ? ColorPalette.persianRed.withOpacity(0.5) : null,
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.fisno ?? ""),
              Row(
                children: [
                  const ColorfulBadge(label: Text("Serbest"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.serbestMi),
                  const ColorfulBadge(label: Text("Filtre"), badgeColorEnum: BadgeColorEnum.kapali).yetkiVarMi(model.filtreliMi),
                ].nullCheck.map((Widget e) => e.runtimeType != SizedBox ? e.paddingOnly(right: UIHelper.lowSize) : e).toList(),
              ),
            ],
          ),
          subtitle: CustomLayoutBuilder(
            splitCount: 2,
            children: [
              Text("Başlama Tarihi: ${model.baslangicTarihi?.toDateString ?? ""}").yetkiVarMi(model.baslangicTarihi != null),
              Text("Bitiş Tarihi: ${model.bitisTarihi?.toDateString ?? ""}").yetkiVarMi(model.bitisTarihi != null),
              Text("Depolar: ${model.depoList?.any((element) => element == -1) == true ? "Tümü" : model.depoList?.first}").yetkiVarMi(model.depoList != null),
              Text("Kullanıcı: ${model.kullanicilar}").yetkiVarMi(model.kullanicilar != null),
              Text("Miktar: ${model.miktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.miktar != null),
              Text("Depo Miktarı: ${model.depoMiktari?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.depoMiktari != null),
              Text("Fark: ${model.fark?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(model.miktar != null),
            ],
          ),
        ),
      );
}
