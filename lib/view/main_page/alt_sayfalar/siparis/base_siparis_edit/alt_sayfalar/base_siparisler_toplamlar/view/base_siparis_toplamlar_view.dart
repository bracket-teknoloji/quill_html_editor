import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/extensions/text_span_extensions.dart";
import "../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../model/param_model.dart";
import "../../../../siparisler/model/siparis_edit_request_model.dart";
import "../../../model/base_siparis_edit_model.dart";
import "../view_model/base_siparis_toplamlar_view_model.dart";

class BaseSiparisToplamlarView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseSiparisToplamlarView({super.key, required this.model});

  @override
  State<BaseSiparisToplamlarView> createState() => _BaseSiparisToplamlarViewState();
}

class _BaseSiparisToplamlarViewState extends BaseState<BaseSiparisToplamlarView> {
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  BaseSiparisToplamlarViewModel viewModel = BaseSiparisToplamlarViewModel();
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
            children: [toplamlarCard().paddingAll(UIHelper.lowSize), textFields()],
          ),
        ),
      );

  Card toplamlarCard() => Card(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Miktar\n",
                        style: TextStyle(color: ColorPalette.slateGray),
                      ),
                      TextSpan(
                        text: BaseSiparisEditModel.instance.toplamKalemMiktari().toIntIfDouble.toStringIfNotNull ?? "0",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Mal Ağırlığı\n",
                        style: TextStyle(color: ColorPalette.slateGray),
                      ),
                      TextSpan(
                        text: "0",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Brüt Tutar\n",
                        style: TextStyle(color: ColorPalette.slateGray),
                      ),
                      TextSpan(
                        text: "${model.toplamBrutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "\n${model.toplamDovizBrutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}").yetkiVarMi(model.dovizliMi),
                    ],
                  ),
                ),
              ].map((e) => Expanded(child: e)).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Mal. Faz. İsk.\n",
                        style: TextStyle(color: ColorPalette.slateGray),
                      ),
                      TextSpan(
                        text: "${viewModel.model.malFazlasiTutar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} $mainCurrency",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "\n${model.malFazlasiDovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}").yetkiVarMi(model.dovizliMi),
                    ],
                  ),
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: "Satır İsk.\n",
                        style: TextStyle(color: ColorPalette.slateGray),
                      ),
                      TextSpan(
                        text: "${viewModel.model.satirIskonto.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} $mainCurrency",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(text: "\n${model.satirDovizIskonto.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}").yetkiVarMi(model.dovizliMi),
                    ],
                  ),
                ),
                Observer(
                  builder: (_) => Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "Toplam İskonto\n",
                          style: TextStyle(color: ColorPalette.slateGray),
                        ),
                        TextSpan(
                          text: "${viewModel.model.getToplamIskonto.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} $mainCurrency",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "\n${model.satirDovizIskonto.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}").yetkiVarMi(model.dovizliMi),
                      ],
                    ),
                  ),
                ),
              ].map((e) => Expanded(child: e)).toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Observer(
                  builder: (_) => Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "Ara Toplam\n",
                          style: TextStyle(color: ColorPalette.slateGray),
                        ),
                        TextSpan(
                          text: "${viewModel.model.getAraToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "\n${viewModel.model.getDovizliAraToplam.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}",
                        ).yetkiVarMi(model.dovizliMi),
                      ],
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "KDV Tutarı\n",
                              style: TextStyle(color: ColorPalette.slateGray),
                            ),
                            TextSpan(
                              text: "${viewModel.model.kdvTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: "\n${model.dovizliKdv.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}").yetkiVarMi(model.dovizliMi),
                          ],
                        ),
                      ),
                      IconButton(
                        alignment: Alignment.topLeft,
                        padding: UIHelper.zeroPadding,
                        onPressed: () async {
                          dialogManager.showInfoDialog("KDV Tutarları\n${viewModel.model.kdvTutarlariVeOranlari}");
                        },
                        icon: Icon(
                          Icons.open_in_new_outlined,
                          size: UIHelper.highSize,
                        ),
                      ),
                    ],
                  ),
                ),
                Observer(
                  builder: (_) => Text.rich(
                    TextSpan(
                      children: [
                        const TextSpan(
                          text: "Genel Toplam\n",
                          style: TextStyle(color: ColorPalette.slateGray),
                        ),
                        TextSpan(
                          text: "${viewModel.model.genelToplamTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(text: "\n${model.genelDovizToplamTutar.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)}").yetkiVarMi(model.dovizliMi),
                      ],
                    ),
                  ),
                ),
              ].map((e) => Expanded(child: e)).toList(),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Padding textFields() => Padding(
        padding: UIHelper.lowPaddingHorizontal,
        child: Column(
          children: [
            Row(
              children: [
                CustomTextField(
                  labelText: "Gen. İsk 1",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk1AktifMi,
                  controller: genelIskonto1Controller,
                  isFormattedString: true,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (p0) => viewModel.setGenIsk1(
                    double.tryParse(p0.replaceAll(RegExp(r","), ".")),
                  ),
                  valueWidget: Observer(
                    builder: (_) => Text(
                      viewModel.isGenIsk1T
                          ? "%${(viewModel.model.genIsk1o ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"
                          : "${(viewModel.model.genIsk1t ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    ),
                  ),
                  suffix: IconButton(
                    onPressed: () => viewModel.changeGenIsk1O(genelIskonto1Controller),
                    icon: Observer(
                      builder: (_) => Icon(
                        viewModel.isGenIsk1T ? Icons.payments_outlined : Icons.percent_outlined,
                      ),
                    ),
                  ),
                ),
                CustomTextField(
                  labelText: "İsk.Tipi 1",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk1AktifMi,
                  readOnly: true,
                  suffixMore: true,
                  controller: iskontoTipi1Controller,
                  valueWidget: Observer(
                    builder: (_) => Text(
                      viewModel.model.genisk1Tipi?.toStringIfNotNull ?? "",
                    ),
                  ),

                  onClear: () => viewModel.setIskTipi1(null),
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context, viewModel.model.genisk1Tipi);
                    if (result != null) {
                      viewModel.setIskTipi1(result.iskontoTipi);
                      iskontoTipi1Controller.text = result.aciklama ?? "";
                    }
                  },
                ),
              ].map((e) => Expanded(child: e)).toList(),
            ),
            Row(
              children: [
                CustomTextField(
                  labelText: "Gen. İsk 2",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk2AktifMi,
                  controller: genelIskonto2Controller,
                  isFormattedString: true,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  valueWidget: Observer(
                    builder: (_) => Text(
                      viewModel.isGenIsk2T
                          ? "%${(viewModel.model.genIsk2o ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"
                          : "${(viewModel.model.genIsk2t ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    ),
                  ),
                  onChanged: (p0) => viewModel.setGenIsk2(
                    double.tryParse(p0.replaceAll(RegExp(r","), ".")),
                  ),
                  suffix: IconButton(
                    onPressed: () => viewModel.changeGenIsk2O(genelIskonto2Controller),
                    icon: Observer(
                      builder: (_) => Icon(
                        viewModel.isGenIsk2T ? Icons.payments_outlined : Icons.percent_outlined,
                      ),
                    ),
                  ),
                ),
                CustomTextField(
                  labelText: "İsk.Tipi 2",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk2AktifMi,
                  readOnly: true,
                  isFormattedString: true,
                  suffixMore: true,
                  valueWidget: Observer(
                    builder: (_) => Text(
                      viewModel.model.genisk2Tipi?.toStringIfNotNull ?? "",
                    ),
                  ),
                  controller: iskontoTipi2Controller,
                  onClear: () => viewModel.setIskTipi2(null),
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context, viewModel.model.genisk2Tipi);
                    if (result != null) {
                      viewModel.setIskTipi2(result.iskontoTipi);
                      iskontoTipi2Controller.text = result.aciklama ?? "";
                    }
                  },
                ),
              ].map((e) => Expanded(child: e)).toList(),
            ),
            Row(
              children: [
                CustomTextField(
                  labelText: "Gen. İsk 3",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk3AktifMi,
                  isFormattedString: true,
                  controller: genelIskonto3Controller,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (p0) => viewModel.setGenIsk3(
                    double.tryParse(p0.replaceAll(RegExp(r","), ".")),
                  ),
                  valueWidget: Observer(
                    builder: (_) => Text(
                      viewModel.isGenIsk3T
                          ? "%${(viewModel.model.genIsk3o ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"
                          : "${(viewModel.model.genIsk3t ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    ),
                  ),
                  suffix: IconButton(
                    onPressed: () => viewModel.changeGenIsk3O(genelIskonto3Controller),
                    icon: Observer(
                      builder: (_) => Icon(
                        viewModel.isGenIsk3T ? Icons.payments_outlined : Icons.percent_outlined,
                      ),
                    ),
                  ),
                ),
                CustomTextField(
                  labelText: "İsk.Tipi 3",
                  //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
                  enabled: enable && yetkiController.siparisGenIsk3AktifMi,
                  suffixMore: true,
                  readOnly: true,
                  controller: iskontoTipi3Controller,
                  valueWidget: Observer(
                    builder: (_) => Text(
                      viewModel.model.genisk3Tipi?.toStringIfNotNull ?? "",
                    ),
                  ),
                  onClear: () => viewModel.setIskTipi3(null),
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context, viewModel.model.genisk3Tipi);
                    if (result != null) {
                      viewModel.setIskTipi3(result.iskontoTipi);
                      iskontoTipi3Controller.text = result.aciklama ?? "";
                    }
                  },
                ),
              ].map((e) => Expanded(child: e)).toList(),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "Ek Mal. 1",
                    enabled: enable,
                    controller: ekMal1Controller,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) => viewModel.setEkMal1(
                      double.tryParse(value.replaceAll(RegExp(r","), ".")),
                    ),
                  ),
                ).yetkiVarMi(!yetkiController.siparisMSEkMaliyet2AktifMi),
                Expanded(
                  child: CustomTextField(
                    labelText: yetkiController.siparisSatisEkMaliyet2Adi ?? "Tevkifat",
                    enabled: enable,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                      signed: true,
                    ),
                    controller: tevkifatController,
                    inputFormatter: [
                      FilteringTextInputFormatter.allow(RegExp(r"[\d+\-\.]")),
                    ],
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
                ).yetkiVarMi(yetkiController.siparisEkMaliyet2GizlenecekMi),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "Ek Mal. 3",
                    enabled: enable,
                    controller: ekMal3Controller,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) => viewModel.setEkMal1(
                      double.tryParse(value.replaceAll(RegExp(r","), ".")),
                    ),
                  ),
                ).yetkiVarMi(!yetkiController.siparisMSEkMaliyet2AktifMi),
                Expanded(
                  child: CustomTextField(
                    labelText: "Vade Günü",
                    enabled: enable,
                    controller: vadeGunuController,
                    keyboardType: TextInputType.number,
                    onChanged: (value) {
                      model.vadeGunu = int.tryParse(value);
                      viewModel.setVadeTarihi(DateTime.now().dateTimeWithoutTime?.add(Duration(days: model.vadeGunu ?? 0)));
                    },
                    valueWidget: Observer(
                      builder: (_) => Text(viewModel.model.vadeTarihi?.toDateString ?? ""),
                    ),
                    suffix: IconButton(
                      onPressed: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: model.vadeTarihi ?? DateTime.now(),
                          firstDate: model.tarih ?? DateTime.now(),
                          lastDate: DateTime.now().add(const Duration(days: 365)),
                        );
                        if (date != null) {
                          // model.vadeGunu = (model.tarih?.difference(date).inDays ?? 0) * -1;
                          viewModel.setVadeTarihi(date);
                          model.vadeGunu = viewModel.model.vadeTarihi.dateTimeWithoutTime?.difference(DateTime.now().dateTimeWithoutTime!).inDays;
                          vadeGunuController.text = model.vadeGunu.toString();
                        }
                      },
                      icon: const Icon(Icons.calendar_today),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );

  void initControllers() {
    genelIskonto1Controller = TextEditingController(
      text: model.genIsk1o?.toIntIfDouble.toStringIfNotNull,
    );
    genelIskonto2Controller = TextEditingController(
      text: model.genIsk2o?.toIntIfDouble.toStringIfNotNull,
    );
    genelIskonto3Controller = TextEditingController(
      text: model.genIsk3o?.toIntIfDouble.toStringIfNotNull,
    );
    iskontoTipi1Controller = TextEditingController(text: model.genisk1Tipi?.toStringIfNotNull);
    iskontoTipi2Controller = TextEditingController(text: model.genisk2Tipi?.toStringIfNotNull);
    iskontoTipi3Controller = TextEditingController(text: model.genisk3Tipi?.toStringIfNotNull);
    ekMal1Controller = TextEditingController(
      text: model.ekMaliyet1Tutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
    );
    tevkifatController = TextEditingController(
      text: model.ekMaliyet2Tutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
    );
    ekMal3Controller = TextEditingController(
      text: model.ekMaliyet3Tutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
    );
    final List<ListIskTip?>? iskList = parametreModel.listIskTip;
    if (iskList != null) {
      iskontoTipi1Controller.text = iskList
              .firstWhereOrNull(
                (element) => element?.iskontoTipi == model.genisk1Tipi,
              )
              ?.aciklama ??
          "";
      iskontoTipi2Controller.text = iskList
              .firstWhereOrNull(
                (element) => element?.iskontoTipi == model.genisk2Tipi,
              )
              ?.aciklama ??
          "";
      iskontoTipi3Controller.text = iskList
              .firstWhereOrNull(
                (element) => element?.iskontoTipi == model.genisk3Tipi,
              )
              ?.aciklama ??
          "";
    }
    // if (model.vadeTarihi?.isBefore(DateTime.now()) ?? false) {
    //   viewModel.model.vadeGunu = 0;
    // }
    if (model.vadeGunu == null) {
      viewModel.model.vadeGunu = 0;
    }
    vadeGunuController = TextEditingController(
      text: viewModel.model.vadeGunu.toStringIfNotNull ?? viewModel.model.vadeTarihi.dateTimeWithoutTime?.difference(DateTime.now().dateTimeWithoutTime!).inDays.toStringIfNotNull,
    );
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
  }
}
