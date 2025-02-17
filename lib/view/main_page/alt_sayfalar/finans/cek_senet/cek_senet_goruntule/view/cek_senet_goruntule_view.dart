import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../cek_senet_listesi/model/cek_senet_listesi_model.dart";

final class CekSenetGoruntuleView extends StatefulWidget {
  const CekSenetGoruntuleView({required this.model, super.key});
  final CekSenetListesiModel model;

  @override
  State<CekSenetGoruntuleView> createState() => _CekSenetGoruntuleViewState();
}

final class _CekSenetGoruntuleViewState extends BaseState<CekSenetGoruntuleView> {
  CekSenetListesiModel get model => widget.model;
  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(title: AppBarTitle(title: loc.generalStrings.view, subtitle: model.belgeNo ?? "")),
    body: SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(
            labelText: "Cari",
            valueWidget: Text(model.cariKodu ?? ""),
            controllerText: model.cariAdi ?? "",
            readOnly: true,
          ),
          CustomTextField(labelText: "Asıl Borçlu", controllerText: model.asilCari, readOnly: true),
          CustomTextField(labelText: "Çek Seri No", controllerText: model.seriNo, readOnly: true),
          CustomTextField(labelText: "Çekin Bankası", controllerText: model.getCekBankaAdi, readOnly: true),
          CustomTextField(labelText: "IBAN", controllerText: model.belgeNo, readOnly: true),
          Row(
            children: [
              Expanded(
                child: CustomTextField(labelText: "Asıl/Ciro", controllerText: model.ciroTipiString, readOnly: true),
              ),
              Expanded(child: CustomTextField(labelText: "Yeri", controllerText: model.yerAciklama, readOnly: true)),
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(labelText: "Durum", controllerText: model.durumString, readOnly: true)),
              Expanded(
                child: CustomTextField(
                  labelText: "Tutar",
                  controllerText: model.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
                  readOnly: true,
                ),
              ),
            ],
          ),
          if (model.dovizTutari != null)
            CustomTextField(
              labelText: "Döviz Tutarı",
              controllerText:
                  "${model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${model.dovizKodu ?? mainCurrency}",
              readOnly: true,
            ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Giriş Tarihi",
                  controllerText: model.tarih.toDateString,
                  readOnly: true,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Vade Tarihi",
                  controllerText: model.vadeTarihi.toDateString,
                  readOnly: true,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Çıkış Tarihi",
                  controllerText: model.cikisTarihi.toDateString,
                  readOnly: true,
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Ödeme Tarihi",
                  controllerText: model.odemeTarihi.toDateString,
                  readOnly: true,
                ),
              ),
            ],
          ),
          Row(
            children: [
              if (model.raporKodu != null)
                Expanded(
                  child: CustomTextField(labelText: "Rapor Kodu", controllerText: model.raporKodu, readOnly: true),
                ),
              if (model.cariRaporKodu != null)
                Expanded(
                  child: CustomTextField(
                    labelText: "Cari Rapor Kodu",
                    controllerText: model.odemeTarihi.toDateString,
                    readOnly: true,
                  ),
                ),
            ],
          ),
          CustomTextField(labelText: "Alınan Bordro No", controllerText: model.alinanBordroNo, readOnly: true),
          if (yetkiController.plasiyerUygulamasiAcikMi)
            CustomTextField(
              labelText: "Plasiyer",
              valueWidget: Text(model.plasiyerKodu ?? ""),
              controllerText: model.plasiyerKodu,
              readOnly: true,
            ),
        ],
      ).paddingAll(UIHelper.lowSize),
    ),
  );
}
