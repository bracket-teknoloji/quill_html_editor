import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/constants/static_variables/static_variables.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/base/view/e_irsaliye_ek_bilgiler/model/e_irsaliye_bilgi_model.dart";
import "../../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../model/param_model.dart";
import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../view_model/base_fatura_toplamlar_view_model.dart";

final class BaseFaturaToplamlarView extends StatefulWidget {
  const BaseFaturaToplamlarView({required this.model, super.key});
  final BaseEditModel<SiparisEditRequestModel> model;

  @override
  State<BaseFaturaToplamlarView> createState() => _BaseFaturaToplamlarViewState();
}

final class _BaseFaturaToplamlarViewState extends BaseState<BaseFaturaToplamlarView> {
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  BaseFaturaToplamlarViewModel viewModel = BaseFaturaToplamlarViewModel();
  bool get enable => widget.model.enable;
  late final TextEditingController genelIskonto1Controller;
  late final TextEditingController genelIskonto2Controller;
  late final TextEditingController genelIskonto3Controller;
  late final TextEditingController iskontoTipi1Controller;
  late final TextEditingController iskontoTipi2Controller;
  late final TextEditingController iskontoTipi3Controller;
  late final TextEditingController ekMal1Controller;
  late final TextEditingController ekMal3Controller;
  late final TextEditingController tevkifatController;
  late final TextEditingController vadeGunuController;
  late final TextEditingController eFaturaSenaryoController;
  late final TextEditingController istisnaKoduController;

  @override
  void initState() {
    initControllers();
    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
    child: Padding(
      padding: UIHelper.lowPaddingOnlyTop,
      child: Column(
        children: <Widget>[
          if (model.efaturaMi == "E" && model.resmiBelgeNo != null)
            eBelgeCard().paddingSymmetric(horizontal: UIHelper.lowSize),
          toplamlarCard().paddingAll(UIHelper.lowSize),
          textFields(),
        ],
      ),
    ),
  );

  Card eBelgeCard() => Card(
    child: ListTile(
      onTap:
          () async => Get.toNamed(
            "/mainPage/eBelgePdf",
            arguments: EBelgeListesiModel(
              belgeTuru: widget.model.editTipiEnum?.rawValue,
              ebelgeTuru: "EFT",
              resmiBelgeNo: BaseSiparisEditModel.instance.resmiBelgeNo ?? "",
            ),
          ),
      contentPadding: UIHelper.lowPaddingHorizontal,
      leading: const Icon(Icons.info_outline),
      title: Text(eBelgeButtonText),
      subtitle:
          model.efattanTutar != null
              ? Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          "Genel Toplam: ${model.efattanTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    ),
                    if (model.efattanDoviz != null)
                      TextSpan(
                        text:
                            "\nGenel Döviz Tutarı: ${model.efattanDoviz.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${model.efattanDovizAdi ?? ""}",
                      ),
                  ],
                ),
              )
              : null,
      trailing: const Icon(Icons.open_in_new_outlined),
    ),
  );
  Card toplamlarCard() => Card(
    child: CustomLayoutBuilder(
      splitCount: 3,
      children: [
        Text.rich(
          TextSpan(
            children: <InlineSpan>[
              const TextSpan(text: "Miktar\n", style: TextStyle(color: ColorPalette.slateGray)),
              TextSpan(
                text: BaseSiparisEditModel.instance.toplamKalemMiktari().toIntIfDouble.toStringIfNotNull ?? "0",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Text.rich(
          TextSpan(
            children: <InlineSpan>[
              const TextSpan(text: "Mal Ağırlığı\n", style: TextStyle(color: ColorPalette.slateGray)),
              TextSpan(
                text: BaseSiparisEditModel.instance.toplamAgirlik.toIntIfDouble.toStringIfNotNull ?? "0",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        if (model.getEditTipiEnum?.fiyatGor == true)
          Text.rich(
            TextSpan(
              children: <InlineSpan>[
                const TextSpan(text: "Brüt Tutar\n", style: TextStyle(color: ColorPalette.slateGray)),
                TextSpan(
                  text: "${model.toplamBrutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (model.dovizliMi)
                  TextSpan(text: "\n${model.toplamDovizBrutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}"),
              ],
            ),
          ),
        if (model.getEditTipiEnum?.fiyatGor == true)
          Text.rich(
            TextSpan(
              children: <InlineSpan>[
                const TextSpan(text: "Mal. Faz. İsk.\n", style: TextStyle(color: ColorPalette.slateGray)),
                TextSpan(
                  text:
                      "${viewModel.model.malFazlasiTutar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} $mainCurrency",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (model.dovizliMi)
                  TextSpan(
                    text: "\n${model.malFazlasiDovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}",
                  ),
              ],
            ),
          ),
        if (model.getEditTipiEnum?.fiyatGor == true)
          Text.rich(
            TextSpan(
              children: <InlineSpan>[
                const TextSpan(text: "Satır İsk.\n", style: TextStyle(color: ColorPalette.slateGray)),
                TextSpan(
                  text:
                      "${viewModel.model.satirIskonto.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} $mainCurrency",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (model.dovizliMi)
                  TextSpan(
                    text: "\n${model.satirDovizIskonto.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}",
                  ),
              ],
            ),
          ),
        if (model.getEditTipiEnum?.fiyatGor == true)
          Observer(
            builder:
                (_) => Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(text: "Toplam İskonto\n", style: TextStyle(color: ColorPalette.slateGray)),
                      TextSpan(
                        text:
                            "${viewModel.model.getToplamIskonto.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} $mainCurrency",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (model.dovizliMi)
                        TextSpan(
                          text:
                              "\n${viewModel.model.getDovizliToplamIskonto.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}",
                        ),
                    ],
                  ),
                ),
          ),
        if (model.getEditTipiEnum?.fiyatGor == true)
          Observer(
            builder:
                (_) => Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(text: "Ara Toplam\n", style: TextStyle(color: ColorPalette.slateGray)),
                      TextSpan(
                        text:
                            "${viewModel.model.getAraToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (model.dovizliMi)
                        TextSpan(
                          text:
                              "\n${viewModel.model.getDovizliAraToplam.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}",
                        ),
                    ],
                  ),
                ),
          ),
        if (model.getEditTipiEnum?.fiyatGor == true)
          Observer(
            builder:
                (_) => Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(text: "ÖTV Toplam\n", style: TextStyle(color: ColorPalette.slateGray)),
                      TextSpan(
                        text:
                            "${viewModel.model.getOTVToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (model.dovizliMi)
                        TextSpan(
                          text:
                              "\n${viewModel.model.getDovizliOTVToplam.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}",
                        ),
                    ],
                  ),
                ),
          ),
        if (model.getEditTipiEnum?.fiyatGor == true)
          Observer(
            builder:
                (_) => Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(text: "KDV Tutarı\n", style: TextStyle(color: ColorPalette.slateGray)),
                      TextSpan(
                        text:
                            "${viewModel.model.kdvTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (model.dovizliMi)
                        TextSpan(
                          text:
                              "\n${viewModel.model.dovizliKdv.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}",
                        ),
                    ],
                  ),
                ),
          ),
        if (model.getEditTipiEnum?.fiyatGor == true)
          Observer(
            builder:
                (_) => Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(text: "Genel Toplam\n", style: TextStyle(color: ColorPalette.slateGray)),
                      TextSpan(
                        text:
                            "${viewModel.model.genelToplamTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      if (model.dovizliMi)
                        TextSpan(
                          text:
                              "\n${viewModel.model.getDovizliToplamTutar.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}",
                        ),
                    ],
                  ),
                ),
          ),
      ],
    ).paddingAll(UIHelper.lowSize),
  );

  Padding textFields() => Padding(
    padding: UIHelper.lowPaddingHorizontal,
    child: Form(
      key: StaticVariables.instance.faturaToplamlarFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          if (!(model.getEditTipiEnum?.gizlenecekAlanlar("genel_iskontolar") ?? false)) ...[
            Row(
              children:
                  <CustomTextField>[
                    if (!(model.getEditTipiEnum?.gizlenecekAlanlar("gen_isk1") ?? false))
                      CustomTextField(
                        labelText: "Gen. İsk 1",
                        //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                        enabled: enable && yetkiController.siparisGenIsk1AktifMi(model.getEditTipiEnum),
                        controller: genelIskonto1Controller,
                        isFormattedString: true,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (p0) => viewModel.setGenIsk1(p0.toDoubleWithFormattedString),
                        validator: (value) {
                          if (maxGenelIskonto(1) == null) return null;
                          if (viewModel.model.genIsk1o != null && viewModel.model.genIsk1o! > maxGenelIskonto(1)!) {
                            return "${maxGenelIskonto(1).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}'dan büyük olamaz.";
                          }
                          return null;
                        },
                        valueWidget: Observer(
                          builder:
                              (_) => Text(
                                viewModel.isGenIsk1T
                                    ? "%${(viewModel.model.genIsk1o ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"
                                    : "${(viewModel.model.genIsk1t ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                              ),
                        ),
                        suffix: IconButton(
                          onPressed: () => viewModel.changeGenIsk1O(genelIskonto1Controller),
                          icon: Observer(
                            builder:
                                (_) => Icon(viewModel.isGenIsk1T ? Icons.payments_outlined : Icons.percent_outlined),
                          ),
                        ),
                      ),
                    if (!(model.getEditTipiEnum?.gizlenecekAlanlar("isk_tipleri") ?? false) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("gen_isk1") ?? false))
                      CustomTextField(
                        labelText: "İsk.Tipi 1",
                        //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                        enabled: enable && yetkiController.siparisGenIsk1AktifMi(model.getEditTipiEnum),
                        readOnly: true,
                        suffixMore: true,
                        controller: iskontoTipi1Controller,
                        valueWidget: Observer(
                          builder: (_) => Text(viewModel.model.genisk1Tipi.toStringIfNotNull ?? ""),
                        ),

                        onClear: () => viewModel.setIskTipi1(null),
                        onTap: () async {
                          final ListIskTip? result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(
                            context,
                            viewModel.model.genisk1Tipi,
                          );
                          if (result != null) {
                            viewModel.setIskTipi1(result.iskontoTipi);
                            iskontoTipi1Controller.text = result.aciklama ?? "";
                          }
                        },
                      ),
                  ].map((e) => Expanded(child: e)).toList(),
            ),
            Row(
              children:
                  <CustomTextField>[
                    if (!(model.getEditTipiEnum?.gizlenecekAlanlar("gen_isk2") ?? false))
                      CustomTextField(
                        labelText: "Gen. İsk 2",
                        //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                        enabled: enable && yetkiController.siparisGenIsk2AktifMi(model.getEditTipiEnum),
                        controller: genelIskonto2Controller,
                        isFormattedString: true,
                        validator: (value) {
                          if (maxGenelIskonto(2) == null) return null;
                          if (viewModel.model.genIsk2o != null && viewModel.model.genIsk2o! > maxGenelIskonto(2)!) {
                            return "${maxGenelIskonto(2).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}'dan büyük olamaz.";
                          }
                          return null;
                        },
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        valueWidget: Observer(
                          builder:
                              (_) => Text(
                                viewModel.isGenIsk2T
                                    ? "%${(viewModel.model.genIsk2o ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"
                                    : "${(viewModel.model.genIsk2t ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                              ),
                        ),
                        onChanged: (p0) => viewModel.setGenIsk2(p0.toDoubleWithFormattedString),
                        suffix: IconButton(
                          onPressed: () => viewModel.changeGenIsk2O(genelIskonto2Controller),
                          icon: Observer(
                            builder:
                                (_) => Icon(viewModel.isGenIsk2T ? Icons.payments_outlined : Icons.percent_outlined),
                          ),
                        ),
                      ),
                    if (!(model.getEditTipiEnum?.gizlenecekAlanlar("isk_tipleri") ?? false) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("gen_isk2") ?? false))
                      CustomTextField(
                        labelText: "İsk.Tipi 2",
                        //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                        enabled: enable && yetkiController.siparisGenIsk2AktifMi(model.getEditTipiEnum),
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(
                          builder: (_) => Text(viewModel.model.genisk2Tipi.toStringIfNotNull ?? ""),
                        ),
                        controller: iskontoTipi2Controller,
                        onClear: () => viewModel.setIskTipi2(null),
                        onTap: () async {
                          final ListIskTip? result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(
                            context,
                            viewModel.model.genisk2Tipi,
                          );
                          if (result != null) {
                            viewModel.setIskTipi2(result.iskontoTipi);
                            iskontoTipi2Controller.text = result.aciklama ?? "";
                          }
                        },
                      ),
                  ].map((e) => Expanded(child: e)).toList(),
            ),
            Row(
              children:
                  <CustomTextField>[
                    if (!(model.getEditTipiEnum?.gizlenecekAlanlar("gen_isk3") ?? false))
                      CustomTextField(
                        labelText: "Gen. İsk 3",
                        //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                        enabled: enable && yetkiController.siparisGenIsk3AktifMi(model.getEditTipiEnum),
                        controller: genelIskonto3Controller,
                        isFormattedString: true,
                        validator: (value) {
                          if (maxGenelIskonto(3) == null) return null;
                          if (viewModel.model.genIsk3o != null && viewModel.model.genIsk3o! > maxGenelIskonto(3)!) {
                            return "${maxGenelIskonto(3).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}'dan büyük olamaz.";
                          }
                          return null;
                        },
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (p0) => viewModel.setGenIsk3(p0.toDoubleWithFormattedString),
                        valueWidget: Observer(
                          builder:
                              (_) => Text(
                                viewModel.isGenIsk3T
                                    ? "%${(viewModel.model.genIsk3o ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"
                                    : "${(viewModel.model.genIsk3t ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                              ),
                        ),
                        suffix: IconButton(
                          onPressed: () => viewModel.changeGenIsk3O(genelIskonto3Controller),
                          icon: Observer(
                            builder:
                                (_) => Icon(viewModel.isGenIsk3T ? Icons.payments_outlined : Icons.percent_outlined),
                          ),
                        ),
                      ),
                    if (!(model.getEditTipiEnum?.gizlenecekAlanlar("isk_tipleri") ?? false) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("gen_isk3") ?? false))
                      CustomTextField(
                        labelText: "İsk.Tipi 3",
                        //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                        enabled: enable && yetkiController.siparisGenIsk3AktifMi(model.getEditTipiEnum),
                        suffixMore: true,
                        readOnly: true,
                        controller: iskontoTipi3Controller,
                        valueWidget: Observer(
                          builder: (_) => Text(viewModel.model.genisk3Tipi.toStringIfNotNull ?? ""),
                        ),
                        onClear: () => viewModel.setIskTipi3(null),
                        onTap: () async {
                          final ListIskTip? result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(
                            context,
                            viewModel.model.genisk3Tipi,
                          );
                          if (result != null) {
                            viewModel.setIskTipi3(result.iskontoTipi);
                            iskontoTipi3Controller.text = result.aciklama ?? "";
                          }
                        },
                      ),
                  ].map((e) => Expanded(child: e)).toList(),
            ),
          ],
          Row(
            children: <Widget>[
              if (yetkiController.siparisEkMaliyet2GizlenecekMi &&
                  yetkiController.ekMaliyet2Aktif(model.getEditTipiEnum))
                Expanded(
                  child: CustomTextField(
                    labelText: yetkiController.siparisSatisEkMaliyet2Adi(model.getEditTipiEnum) ?? "Tevkifat",
                    enabled: enable,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    controller: tevkifatController,
                    inputFormatter: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r"[\d+\-\.]"))],
                    suffix: IconButton(
                      onPressed: () async {
                        final result = await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "Tevkifat Oranı",
                          children: List.generate(
                            viewModel.tevkifatMap.length,
                            (index) => BottomSheetModel(
                              title: viewModel.tevkifatMap.keys.toList()[index],
                              value: viewModel.tevkifatMap.values.toList()[index],
                            ),
                          ),
                        );
                        if (result != null) {
                          viewModel.setTevkifat(result);
                          tevkifatController.text = (-result * viewModel.model.kdvTutari).toString();
                        }
                      },
                      icon: const Icon(Icons.more_horiz_outlined),
                    ),
                    // onChanged: (value) => model.ekMaliyet2Tutari = double.tryParse(value),
                  ),
                ),
            ],
          ),
          Row(
            children: <Widget>[
              if (!(model.getEditTipiEnum?.gizlenecekAlanlar("vade_gunu") ?? false) &&
                  !yetkiController.satirdaVade(model.getEditTipiEnum!))
                Expanded(
                  child: CustomTextField(
                    labelText: "Vade Günü",
                    isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("vade_gunu") ?? false,
                    enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("vade_gunu") ?? false),
                    controller: vadeGunuController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      model.vadeGunu = int.tryParse(value);
                      viewModel.setVadeTarihi(
                        DateTime.now().dateTimeWithoutTime?.add(Duration(days: model.vadeGunu ?? 0)),
                      );
                    },
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.vadeTarihi.toDateString)),
                    suffix: IconButton(
                      onPressed: () async {
                        final date = await dialogManager.showDateTimePicker(
                          initialDate: model.vadeTarihi ?? DateTime.now(),
                        );
                        // final date = await showDatePicker(
                        //   context: context,
                        //   initialDate: model.vadeTarihi ?? DateTime.now(),
                        //   firstDate: model.tarih ?? DateTime.now(),
                        //   lastDate: DateTime.now().add(const Duration(days: 365)),
                        // );
                        if (date != null) {
                          // model.vadeGunu = (model.tarih?.difference(date).inDays ?? 0) * -1;
                          viewModel.setVadeTarihi(date);
                          model.vadeGunu =
                              viewModel.model.vadeTarihi.dateTimeWithoutTime
                                  ?.difference(DateTime.now().dateTimeWithoutTime!)
                                  .inDays;
                          vadeGunuController.text = model.vadeGunu.toString();
                        }
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
            ],
          ),
          if (widget.model.editTipiEnum?.irsaliyeMi != true)
            Row(
              children: <Widget>[
                if (model.sFaturaMi)
                  Expanded(
                    child: CustomTextField(
                      labelText: "İstisna Kodu",
                      enabled: enable,
                      readOnly: true,
                      suffixMore: true,
                      controller: istisnaKoduController,
                      valueWidget: Observer(builder: (_) => Text(viewModel.model.efatOzelkod.toStringIfNotNull ?? "")),
                      onTap: () async {
                        final result = await bottomSheetDialogManager.showEFaturaOzelKodBottomSheetDialog(
                          context,
                          viewModel.model.efatOzelkod,
                          cariKodu: model.cariKodu,
                          belgeTipi: model.belgeTuru,
                          belgeNo: model.belgeNo,
                        );
                        if (result != null) {
                          istisnaKoduController.text = result.aciklama ?? "";
                          viewModel.setEfatOzelkod(result.kod);
                        }
                      },
                    ),
                  ),
                if (model.eFaturaSerisindenMi && yetkiController.eFaturaAktif)
                  Expanded(
                    child: CustomTextField(
                      labelText: "E-Fatura Senaryo",
                      enabled: enable && yetkiController.eFaturaSenaryoDegistir,
                      isMust: true,
                      readOnly: true,
                      controller: eFaturaSenaryoController,
                      suffixMore: true,
                      onTap: () async {
                        final result = await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "E-Fatura Senaryo",
                          children: List.generate(
                            viewModel.senaryoMap.length,
                            (index) => BottomSheetModel(
                              title: viewModel.senaryoMap.keys.toList()[index],
                              value: viewModel.senaryoMap.entries.toList()[index],
                            ),
                          ),
                        );
                        if (result != null) {
                          viewModel.setSenaryo(result.value);
                          eFaturaSenaryoController.text = result.key;
                        }
                      },
                    ),
                  ),
              ],
            ),

          // Eğer enable ise sayfaya yönlendirme yapılabilir.
          if (model.eBelgeCheckBoxMi && (model.getEditTipiEnum?.satisIrsaliyesiMi ?? false))
            ElevatedButton(
              onPressed:
                  !enable
                      ? null
                      : () async {
                        final result = await Get.toNamed(
                          "/mainPage/eIrsaliyeEkBilgiler",
                          arguments: model.eirsBilgiModel,
                        );
                        if (result is EIrsaliyeBilgiModel) {
                          model.eirsBilgiModel = result;
                        }
                      },
              child: const Text("E-İrsaliye Ek Bilgiler"),
            ).paddingAll(UIHelper.lowSize),
        ],
      ),
    ),
  );

  void initControllers() {
    genelIskonto1Controller = TextEditingController(
      text: model.genIsk1o.commaSeparatedWithDecimalDigits(OndalikEnum.oran),
    );
    genelIskonto2Controller = TextEditingController(
      text: model.genIsk2o.commaSeparatedWithDecimalDigits(OndalikEnum.oran),
    );
    genelIskonto3Controller = TextEditingController(
      text: model.genIsk3o.commaSeparatedWithDecimalDigits(OndalikEnum.oran),
    );
    iskontoTipi1Controller = TextEditingController(text: model.genisk1Tipi.toStringIfNotNull);
    iskontoTipi2Controller = TextEditingController(text: model.genisk2Tipi.toStringIfNotNull);
    iskontoTipi3Controller = TextEditingController(text: model.genisk3Tipi.toStringIfNotNull);

    ekMal1Controller = TextEditingController(
      text: model.ekMaliyet1Tutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
    );
    tevkifatController = TextEditingController(
      text: model.ekMaliyet2Tutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
    );
    ekMal3Controller = TextEditingController(
      text: model.ekMaliyet3Tutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
    );
    final List<ListIskTip?>? iskList = parametreModel.listIskTip;
    if (iskList != null) {
      iskontoTipi1Controller.text =
          iskList.firstWhereOrNull((element) => element?.iskontoTipi == model.genisk1Tipi)?.aciklama ?? "";
      iskontoTipi2Controller.text =
          iskList.firstWhereOrNull((element) => element?.iskontoTipi == model.genisk2Tipi)?.aciklama ?? "";
      iskontoTipi3Controller.text =
          iskList.firstWhereOrNull((element) => element?.iskontoTipi == model.genisk3Tipi)?.aciklama ?? "";
    }
    // if (model.vadeTarihi?.isBefore(DateTime.now()) ?? false) {
    //   viewModel.model.vadeGunu = 0;
    // }
    if (model.vadeGunu == null) {
      viewModel.model.vadeGunu = 0;
      viewModel.model.vadeTarihi = DateTime.now().dateTimeWithoutTime;
    } else {
      viewModel.model.vadeTarihi ??= DateTime.now().dateTimeWithoutTime?.add(Duration(days: model.vadeGunu ?? 0));
    }
    vadeGunuController = TextEditingController(
      text:
          viewModel.model.vadeGunu.toStringIfNotNull ??
          viewModel.model.vadeTarihi.dateTimeWithoutTime
              ?.difference(DateTime.now().dateTimeWithoutTime!)
              .inDays
              .toStringIfNotNull,
    );
    eFaturaSenaryoController = TextEditingController(text: model.eFaturaTipAdi);
    istisnaKoduController = TextEditingController(
      text: model.efatOzelkod.toStringIfNotNull ?? viewModel.model.efatOzelkod.toStringIfNotNull,
    );
    if (widget.model.baseEditEnum != BaseEditEnum.ekle &&
        viewModel.model.efatOzelkod == null &&
        widget.model.editTipiEnum?.irsaliyeMi != true) {
      viewModel.setEfatOzelkod(model.kalemList?.firstOrNull?.efatOzelkod ?? 0);
      istisnaKoduController.text = model.kalemList?.firstOrNull?.efatOzelkodAdi ?? "";
    }
  }

  void disposeControllers() {
    genelIskonto1Controller.dispose();
    genelIskonto2Controller.dispose();
    genelIskonto3Controller.dispose();
    iskontoTipi1Controller.dispose();
    iskontoTipi2Controller.dispose();
    iskontoTipi3Controller.dispose();
    ekMal1Controller.dispose();
    tevkifatController.dispose();
    ekMal3Controller.dispose();
    vadeGunuController.dispose();
    eFaturaSenaryoController.dispose();
    istisnaKoduController.dispose();
  }

  String get eBelgeButtonText {
    if (model.efaturaMi == "E" || model.cariEfaturami == "E") {
      if (model.efaturaDurumu == "TAS") {
        return "E-Fatura Taslağı (${model.resmiBelgeNo})";
      }
      return "E-Fatura (${model.resmiBelgeNo})";
    } else if (model.earsivMi == "E") {
      if (model.earsivDurumu == "TAS") {
        return "E-Arşiv Taslağı (${model.resmiBelgeNo})";
      }
      return "E-Arşiv (${model.resmiBelgeNo})";
    } else {
      if (model.eirsaliyeDurumu == "TAS") {
        return "E-İrsaliye Taslağı (${model.resmiBelgeNo})";
      } else {
        return "E-Fatura (${model.resmiBelgeNo})";
      }
    }
  }

  double? maxGenelIskonto(int index) {
    if (model.getEditTipiEnum?.maxIskontoUygula != true) return null;
    return switch (index) {
      1 => model.getEditTipiEnum?.maxGenelIskonto1,
      2 => model.getEditTipiEnum?.maxGenelIskonto2,
      3 => model.getEditTipiEnum?.maxGenelIskonto3,
      _ => null,
    };
  }
}
