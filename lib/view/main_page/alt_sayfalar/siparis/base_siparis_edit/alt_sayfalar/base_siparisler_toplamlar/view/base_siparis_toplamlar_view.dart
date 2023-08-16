import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../siparisler/model/siparis_edit_request_model.dart";
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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [toplamlarCard().paddingAll(UIHelper.lowSize), textFields()],
    ));
  }

  Card toplamlarCard() {
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text.rich(TextSpan(children: [
                const TextSpan(text: "Miktar\n", style: TextStyle(color: Colors.grey)),
                TextSpan(text: BaseSiparisEditModel.instance.toplamKalemMiktari.toIntIfDouble.toStringIfNull ?? "", style: const TextStyle(fontWeight: FontWeight.bold))
              ])),
              const Text.rich(TextSpan(children: [TextSpan(text: "Mal Ağırlığı\n", style: TextStyle(color: Colors.grey)), TextSpan(text: "1", style: TextStyle(fontWeight: FontWeight.bold))])),
              Text.rich(TextSpan(children: [
                const TextSpan(text: "Brüt Tutar\n", style: TextStyle(color: Colors.grey)),
                TextSpan(text: "${model.toplamBrutTutar.dotSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
              ])),
            ].map((e) => Expanded(child: e)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text.rich(TextSpan(children: [TextSpan(text: "Mal. Faz. İsk.\n", style: TextStyle(color: Colors.grey)), TextSpan(text: "1", style: TextStyle(fontWeight: FontWeight.bold))])),
              const Text.rich(TextSpan(children: [TextSpan(text: "Satır İsk.\n", style: TextStyle(color: Colors.grey)), TextSpan(text: "1", style: TextStyle(fontWeight: FontWeight.bold))])),
              Text.rich(TextSpan(children: [
                const TextSpan(text: "Toplam İskonto\n", style: TextStyle(color: Colors.grey)),
                TextSpan(text: "${model.getToplamIskonto.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
              ])),
            ].map((e) => Expanded(child: e)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text.rich(TextSpan(children: [
                const TextSpan(text: "Ara Toplam\n", style: TextStyle(color: Colors.grey)),
                TextSpan(text: "${model.getAraToplam.dotSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
              ])),
              Text.rich(TextSpan(children: [
                const TextSpan(text: "KDV Tutarı\n", style: TextStyle(color: Colors.grey)),
                TextSpan(text: "${model.kdv.dotSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
              ])),
              Text.rich(TextSpan(children: [
                const TextSpan(text: "Genel Toplam\n", style: TextStyle(color: Colors.grey)),
                TextSpan(text: "${model.genelToplam.dotSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
              ])),
            ].map((e) => Expanded(child: e)).toList(),
          ),
        ],
      ).paddingAll(UIHelper.lowSize),
    );
  }

  Column textFields() {
    return Column(
      children: [
        Row(
          children: [
            CustomTextField(
              labelText: "Gen. İsk 1",
              enabled: enable,
              controller: genelIskonto1Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              suffix: IconButton(onPressed: () => viewModel.changeGenIsk1O(), icon: Observer(builder: (_) => Icon(viewModel.isGenIsk1O ? Icons.money_outlined : Icons.percent_outlined))),
            ),
            CustomTextField(
              labelText: "İsk.Tipi 1",
              enabled: enable,
              readOnly: true,
              suffixMore: true,
              controller: iskontoTipi1Controller,
              onTap: () async {
                var result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context);
                if (result != null) {
                  model.genisk1Tipi = result.iskontoTipi;
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
              enabled: enable,
              controller: genelIskonto2Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              suffix: IconButton(onPressed: () => viewModel.changeGenIsk2O(), icon: Observer(builder: (_) => Icon(viewModel.isGenIsk2O ? Icons.money_outlined : Icons.percent_outlined))),
            ),
            CustomTextField(
              labelText: "İsk.Tipi 2",
              enabled: enable,
              readOnly: true,
              suffixMore: true,
              controller: iskontoTipi2Controller,
              onTap: () async {
                var result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context);
                if (result != null) {
                  model.genisk2Tipi = result.iskontoTipi;
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
              enabled: enable,
              controller: genelIskonto3Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              suffix: IconButton(onPressed: () => viewModel.changeGenIsk3O(), icon: Observer(builder: (_) => Icon(viewModel.isGenIsk3O ? Icons.money_outlined : Icons.percent_outlined))),
            ),
            CustomTextField(
              labelText: "İsk.Tipi 3",
              enabled: enable,
              suffixMore: true,
              readOnly: true,
              controller: iskontoTipi3Controller,
              onTap: () async {
                var result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context);
                if (result != null) {
                  model.genisk3Tipi = result.iskontoTipi;
                  iskontoTipi3Controller.text = result.aciklama ?? "";
                }
              },
            ),
          ].map((e) => Expanded(child: e)).toList(),
        ),
        Row(
          children: [
            CustomTextField(
              labelText: "Ek Mal. 1",
              enabled: enable,
              controller: ekMal1Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
            ),
            CustomTextField(
              labelText: "Tevkifat",
              enabled: enable,
              keyboardType: TextInputType.number,
              controller: tevkifatController,
              suffix: IconButton(
                  onPressed: () async {
                    var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                        title: "Tevkifat Oranı",
                        children: List.generate(
                            viewModel.tevkifatMap.length, (index) => BottomSheetModel(title: viewModel.tevkifatMap.keys.toList()[index], value: viewModel.tevkifatMap.values.toList()[index])));
                    if (result != null) {
                      BaseSiparisEditModel.instance.ekMaliyet2Tutari = (BaseSiparisEditModel.instance.getBrutTutar) * (result ?? 0) * (-1);
                      tevkifatController.text = BaseSiparisEditModel.instance.ekMaliyet2Tutari?.dotSeparatedWithFixedDigits ?? "";
                    }
                  },
                  icon: const Icon(Icons.more_horiz_outlined)),
              onChanged: (value) => model.ekMaliyet2Tutari = double.tryParse(value),
            ),
          ].map((e) => Expanded(child: e)).toList(),
        ),
        Row(
          children: [
            CustomTextField(
              labelText: "Ek Mal. 3",
              enabled: enable,
              controller: ekMal3Controller,
            ),
            CustomTextField(
              labelText: "Vade Günü",
              enabled: enable,
              controller: vadeGunuController,
              keyboardType: TextInputType.number,
              onChanged: (value) => model.vadeGunu = int.tryParse(value),
              suffix: IconButton(
                onPressed: () async {
                  final date = await showDatePicker(
                      context: context, initialDate: model.vadeTarihi ?? DateTime.now(), firstDate: model.tarih ?? DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));
                  if (date != null) {
                    model.vadeGunu = ((model.tarih?.difference(date).inDays ?? 0) * -1);
                    model.vadeTarihi = date;
                    vadeGunuController.text = model.vadeGunu.toString();
                  }
                },
                icon: const Icon(Icons.calendar_today),
              ),
            )
          ].map((e) => Expanded(child: e)).toList(),
        ),
      ],
    );
  }

  void initControllers() {
    genelIskonto1Controller = TextEditingController(text: model.genelIskonto1?.dotSeparatedWithFixedDigits);
    genelIskonto2Controller = TextEditingController(text: model.genelIskonto2?.dotSeparatedWithFixedDigits);
    genelIskonto3Controller = TextEditingController(text: model.genelIskonto3?.dotSeparatedWithFixedDigits);
    iskontoTipi1Controller = TextEditingController(text: model.genisk1Tipi?.toStringIfNull);
    iskontoTipi2Controller = TextEditingController(text: model.genisk2Tipi?.toStringIfNull);
    iskontoTipi3Controller = TextEditingController(text: model.genisk3Tipi?.toStringIfNull);
    ekMal1Controller = TextEditingController(text: model.ekMaliyet1Tutari?.dotSeparatedWithFixedDigits);
    tevkifatController = TextEditingController(text: model.ekMaliyet2Tutari?.dotSeparatedWithFixedDigits);
    ekMal3Controller = TextEditingController(text: model.ekMaliyet3Tutari?.dotSeparatedWithFixedDigits);
    vadeGunuController = TextEditingController(text: model.vadeGunu.toStringIfNull);
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
