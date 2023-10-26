import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/constants/color_palette.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/enum/siparis_tipi_enum.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../model/param_model.dart";
import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../view_model/base_fatura_toplamlar_view_model.dart";

class BaseFaturaToplamlarView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseFaturaToplamlarView({super.key, required this.model});

  @override
  State<BaseFaturaToplamlarView> createState() => _BaseFaturaToplamlarViewState();
}

class _BaseFaturaToplamlarViewState extends BaseState<BaseFaturaToplamlarView> {
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
            children: <Widget>[toplamlarCard().paddingAll(UIHelper.lowSize), textFields()],
          ),
        ),
      );

  Card toplamlarCard() => Card(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Text>[
                Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(text: "Miktar\n", style: TextStyle(color: ColorPalette.slateGray)),
                      TextSpan(text: BaseSiparisEditModel.instance.toplamKalemMiktari().toIntIfDouble.toStringIfNotNull ?? "0", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                const Text.rich(
                  TextSpan(
                    children: <InlineSpan>[TextSpan(text: "Mal Ağırlığı\n", style: TextStyle(color: ColorPalette.slateGray)), TextSpan(text: "0", style: TextStyle(fontWeight: FontWeight.bold))],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(text: "Brüt Tutar\n", style: TextStyle(color: ColorPalette.slateGray)),
                      TextSpan(text: "${model.toplamBrutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ].map((Text e) => Expanded(child: e)).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <StatelessWidget>[
                Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(text: "Mal. Faz. İsk.\n", style: TextStyle(color: ColorPalette.slateGray)),
                      TextSpan(text: "${viewModel.model.malFazlasiTutar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} $mainCurrency", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: <InlineSpan>[
                      const TextSpan(text: "Satır İsk.\n", style: TextStyle(color: ColorPalette.slateGray)),
                      TextSpan(text: "${viewModel.model.satirIskonto.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} $mainCurrency", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Observer(
                  builder: (_) => Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        const TextSpan(text: "Toplam İskonto\n", style: TextStyle(color: ColorPalette.slateGray)),
                        TextSpan(text: "${viewModel.model.getToplamIskonto.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} $mainCurrency", style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ].map((StatelessWidget e) => Expanded(child: e)).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Observer>[
                Observer(
                  builder: (_) => Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        const TextSpan(text: "Ara Toplam\n", style: TextStyle(color: ColorPalette.slateGray)),
                        TextSpan(text: "${viewModel.model.getAraToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        const TextSpan(text: "KDV Tutarı\n", style: TextStyle(color: ColorPalette.slateGray)),
                        TextSpan(text: "${viewModel.model.kdvTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Text.rich(
                    TextSpan(
                      children: <InlineSpan>[
                        const TextSpan(text: "Genel Toplam\n", style: TextStyle(color: ColorPalette.slateGray)),
                        TextSpan(text: "${viewModel.model.genelToplamTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
              ].map((Observer e) => Expanded(child: e)).toList(),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Padding textFields() => Padding(
        padding: UIHelper.lowPaddingHorizontal,
        child: Column(
          children: <Widget>[
            Row(
              children: <CustomTextField>[
                CustomTextField(
                  labelText: "Gen. İsk 1",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk1AktifMi,
                  controller: genelIskonto1Controller,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (String p0) => viewModel.setGenIsk1(double.tryParse(p0.replaceAll(RegExp(r","), "."))),
                  valueWidget: Observer(
                    builder: (_) => Text(
                      viewModel.isGenIsk1T
                          ? "%${(viewModel.model.genIsk1o ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"
                          : "${(viewModel.model.genIsk1t ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    ),
                  ),
                  suffix: IconButton(
                    onPressed: () => viewModel.changeGenIsk1O(genelIskonto1Controller),
                    icon: Observer(builder: (_) => Icon(viewModel.isGenIsk1T ? Icons.payments_outlined : Icons.percent_outlined)),
                  ),
                ),
                CustomTextField(
                  labelText: "İsk.Tipi 1",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk1AktifMi,
                  readOnly: true,
                  suffixMore: true,
                  controller: iskontoTipi1Controller,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.genisk1Tipi.toStringIfNotNull ?? "")),
                  onTap: () async {
                    final ListIskTip? result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context);
                    if (result != null) {
                      viewModel.setIskTipi1(result.iskontoTipi);
                      iskontoTipi1Controller.text = result.aciklama ?? "";
                    }
                  },
                ),
              ].map((CustomTextField e) => Expanded(child: e)).toList(),
            ),
            Row(
              children: <CustomTextField>[
                CustomTextField(
                  labelText: "Gen. İsk 2",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk2AktifMi,
                  controller: genelIskonto2Controller,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  valueWidget: Observer(
                    builder: (_) => Text(
                      viewModel.isGenIsk2T
                          ? "%${(viewModel.model.genIsk2o ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"
                          : "${(viewModel.model.genIsk2t ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    ),
                  ),
                  onChanged: (String p0) => viewModel.setGenIsk2(double.tryParse(p0.replaceAll(RegExp(r","), "."))),
                  suffix: IconButton(
                    onPressed: () => viewModel.changeGenIsk2O(genelIskonto2Controller),
                    icon: Observer(builder: (_) => Icon(viewModel.isGenIsk2T ? Icons.payments_outlined : Icons.percent_outlined)),
                  ),
                ),
                CustomTextField(
                  labelText: "İsk.Tipi 2",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk2AktifMi,
                  readOnly: true,
                  suffixMore: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.genisk2Tipi.toStringIfNotNull ?? "")),
                  controller: iskontoTipi2Controller,
                  onTap: () async {
                    final ListIskTip? result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context);
                    if (result != null) {
                      viewModel.setIskTipi2(result.iskontoTipi);
                      iskontoTipi2Controller.text = result.aciklama ?? "";
                    }
                  },
                ),
              ].map((CustomTextField e) => Expanded(child: e)).toList(),
            ),
            Row(
              children: <CustomTextField>[
                CustomTextField(
                  labelText: "Gen. İsk 3",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk3AktifMi,
                  controller: genelIskonto3Controller,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (String p0) => viewModel.setGenIsk3(double.tryParse(p0.replaceAll(RegExp(r","), "."))),
                  valueWidget: Observer(
                    builder: (_) => Text(
                      viewModel.isGenIsk3T
                          ? "%${(viewModel.model.genIsk3o ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"
                          : "${(viewModel.model.genIsk3t ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    ),
                  ),
                  suffix: IconButton(
                    onPressed: () => viewModel.changeGenIsk3O(genelIskonto3Controller),
                    icon: Observer(builder: (_) => Icon(viewModel.isGenIsk3T ? Icons.payments_outlined : Icons.percent_outlined)),
                  ),
                ),
                CustomTextField(
                  labelText: "İsk.Tipi 3",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk3AktifMi,
                  suffixMore: true,
                  readOnly: true,
                  controller: iskontoTipi3Controller,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.genisk3Tipi.toStringIfNotNull ?? "")),
                  onTap: () async {
                    final ListIskTip? result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context);
                    if (result != null) {
                      viewModel.setIskTipi3(result.iskontoTipi);
                      iskontoTipi3Controller.text = result.aciklama ?? "";
                    }
                  },
                ),
              ].map((CustomTextField e) => Expanded(child: e)).toList(),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    labelText: "Ek Mal. 1",
                    enabled: enable,
                    controller: ekMal1Controller,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String value) => viewModel.setEkMal1(double.tryParse(value.replaceAll(RegExp(r","), "."))),
                  ),
                ).yetkiVarMi(!yetkiController.siparisMSEkMaliyet2AktifMi),
                Expanded(
                  child: CustomTextField(
                    labelText: yetkiController.siparisSatisEkMaliyet2Adi ?? "Tevkifat",
                    enabled: enable,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                    controller: tevkifatController,
                    inputFormatter: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r"[\d+\-\.]"))],
                    suffix: IconButton(
                      onPressed: () async {
                        final result = await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "Tevkifat Oranı",
                          children: List.generate(
                            viewModel.tevkifatMap.length,
                            (int index) => BottomSheetModel(title: viewModel.tevkifatMap.keys.toList()[index], value: viewModel.tevkifatMap.values.toList()[index]),
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
                ).yetkiVarMi(yetkiController.siparisEkMaliyet2GizlenecekMi),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    labelText: "Ek Mal. 3",
                    enabled: enable,
                    controller: ekMal3Controller,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String value) => viewModel.setEkMal1(double.tryParse(value.replaceAll(RegExp(r","), "."))),
                  ),
                ).yetkiVarMi(!yetkiController.siparisMSEkMaliyet2AktifMi),
                Expanded(
                  child: CustomTextField(
                    labelText: "Vade Günü",
                    enabled: enable,
                    controller: vadeGunuController,
                    keyboardType: TextInputType.number,
                    onChanged: (String value) => model.vadeGunu = int.tryParse(value),
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.vadeTarihi.toDateString)),
                    suffix: IconButton(
                      onPressed: () async {
                        final DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: model.vadeTarihi ?? DateTime.now(),
                          firstDate: model.tarih ?? DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (date != null) {
                          model.vadeGunu = (model.tarih?.difference(date).inDays ?? 0) * -1;
                          viewModel.setVadeTarihi(date);
                          vadeGunuController.text = model.vadeGunu.toString();
                        }
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    labelText: "Ek Mal. 1",
                    enabled: enable,
                    controller: ekMal1Controller,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String value) => viewModel.setEkMal1(double.tryParse(value.replaceAll(RegExp(r","), "."))),
                  ),
                ).yetkiVarMi(!yetkiController.siparisMSEkMaliyet2AktifMi),
                Expanded(
                  child: CustomTextField(
                    labelText: yetkiController.siparisSatisEkMaliyet2Adi ?? "Tevkifat",
                    enabled: enable,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                    controller: tevkifatController,
                    inputFormatter: <TextInputFormatter>[FilteringTextInputFormatter.allow(RegExp(r"[\d+\-\.]"))],
                    suffix: IconButton(
                      onPressed: () async {
                        final result = await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "Tevkifat Oranı",
                          children: List.generate(
                            viewModel.tevkifatMap.length,
                            (int index) => BottomSheetModel(title: viewModel.tevkifatMap.keys.toList()[index], value: viewModel.tevkifatMap.values.toList()[index]),
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
                ).yetkiVarMi(yetkiController.siparisEkMaliyet2GizlenecekMi),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    labelText: "İstisna Kodu",
                    enabled: enable,
                    controller: istisnaKoduController,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (String value) => viewModel.setEkMal1(double.tryParse(value.replaceAll(RegExp(r","), "."))),
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "E-Fatura Senaryo",
                    enabled: enable,
                    isMust: true,
                    controller: eFaturaSenaryoController,
                    keyboardType: TextInputType.number,
                    onChanged: (String value) => model.vadeGunu = int.tryParse(value),
                    suffix: IconButton(
                      onPressed: () async {
                        final DateTime? date = await showDatePicker(
                          context: context,
                          initialDate: model.vadeTarihi ?? DateTime.now(),
                          firstDate: model.tarih ?? DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (date != null) {
                          model.vadeGunu = (model.tarih?.difference(date).inDays ?? 0) * -1;
                          viewModel.setVadeTarihi(date);
                          vadeGunuController.text = model.vadeGunu.toString();
                        }
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ],
            ).yetkiVarMi(widget.model.siparisTipiEnum?.irsaliyeMi != true),
          ],
        ),
      );

  void initControllers() {
    genelIskonto1Controller = TextEditingController(text: model.genIsk1o.toIntIfDouble.toStringIfNotNull);
    genelIskonto2Controller = TextEditingController(text: model.genIsk2o.toIntIfDouble.toStringIfNotNull);
    genelIskonto3Controller = TextEditingController(text: model.genIsk3o.toIntIfDouble.toStringIfNotNull);
    iskontoTipi1Controller = TextEditingController(text: model.genisk1Tipi.toStringIfNotNull);
    iskontoTipi2Controller = TextEditingController(text: model.genisk2Tipi.toStringIfNotNull);
    iskontoTipi3Controller = TextEditingController(text: model.genisk3Tipi.toStringIfNotNull);

    ekMal1Controller = TextEditingController(text: model.ekMaliyet1Tutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    tevkifatController = TextEditingController(text: model.ekMaliyet2Tutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    ekMal3Controller = TextEditingController(text: model.ekMaliyet3Tutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    final List<ListIskTip?>? iskList = parametreModel.listIskTip;
    if (iskList != null) {
      iskontoTipi1Controller.text = iskList.firstWhereOrNull((ListIskTip? element) => element?.iskontoTipi == model.genisk1Tipi)?.aciklama ?? "";
      iskontoTipi2Controller.text = iskList.firstWhereOrNull((ListIskTip? element) => element?.iskontoTipi == model.genisk2Tipi)?.aciklama ?? "";
      iskontoTipi3Controller.text = iskList.firstWhereOrNull((ListIskTip? element) => element?.iskontoTipi == model.genisk3Tipi)?.aciklama ?? "";
    }
    if (model.vadeGunu == null) {
      // viewModel.setVadeTarihi(DateTime.now());
      viewModel.model.vadeGunu = 0;
    }
    if (model.vadeTarihi == null) {
      viewModel.model.vadeGunu = 0;
      viewModel.setVadeTarihi(DateTime.now());
    }
    // if ((model.vadeTarihi?.isBefore(DateTime.now()) ?? false) && widget.model.baseEditEnum != BaseEditEnum.goruntule) {
    //   viewModel.setVadeTarihi(DateTime.now());
    // }
    vadeGunuController = TextEditingController(text: model.vadeGunu.toStringIfNotNull ?? model.vadeTarihi?.difference(DateTime.now()).inDays.toStringIfNotNull);
    eFaturaSenaryoController = TextEditingController(text: model.efaturaTipi);
    istisnaKoduController = TextEditingController();
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
}
