import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
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
                TextSpan(text: BaseSiparisEditModel.instance.toplamKalemMiktari().toIntIfDouble.toStringIfNull ?? "0", style: const TextStyle(fontWeight: FontWeight.bold))
              ])),
              const Text.rich(TextSpan(children: [TextSpan(text: "Mal Ağırlığı\n", style: TextStyle(color: Colors.grey)), TextSpan(text: "0", style: TextStyle(fontWeight: FontWeight.bold))])),
              Text.rich(TextSpan(children: [
                const TextSpan(text: "Brüt Tutar\n", style: TextStyle(color: Colors.grey)),
                TextSpan(text: "${model.toplamBrutTutar.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
              ])),
            ].map((e) => Expanded(child: e)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text.rich(TextSpan(children: [
                const TextSpan(text: "Mal. Faz. İsk.\n", style: TextStyle(color: Colors.grey)),
                TextSpan(text: "${model.malFazlasiTutar.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
              ])),
              Text.rich(TextSpan(children: [
                const TextSpan(text: "Satır İsk.\n", style: TextStyle(color: Colors.grey)),
                TextSpan(text: "${model.satirIskonto.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
              ])),
              Observer(builder: (_) {
                return Text.rich(TextSpan(children: [
                  const TextSpan(text: "Toplam İskonto\n", style: TextStyle(color: Colors.grey)),
                  TextSpan(text: "${viewModel.model.getToplamIskonto.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
                ]));
              }),
            ].map((e) => Expanded(child: e)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Observer(builder: (_) {
                return Text.rich(TextSpan(children: [
                  const TextSpan(text: "Ara Toplam\n", style: TextStyle(color: Colors.grey)),
                  TextSpan(text: "${viewModel.model.getAraToplam.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
                ]));
              }),
              Observer(builder: (_) {
                return Text.rich(TextSpan(children: [
                  const TextSpan(text: "KDV Tutarı\n", style: TextStyle(color: Colors.grey)),
                  TextSpan(text: "${viewModel.model.kdvTutari.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
                ]));
              }),
              Observer(builder: (_) {
                return Text.rich(TextSpan(children: [
                  const TextSpan(text: "Genel Toplam\n", style: TextStyle(color: Colors.grey)),
                  TextSpan(text: "${viewModel.model.genelToplamTutar.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
                ]));
              }),
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
              //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
              enabled: enable && yetkiController.siparisGenIsk1AktifMi,
              controller: genelIskonto1Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (p0) => viewModel.setGenIsk1(double.tryParse(p0.replaceAll(RegExp(r","), "."))),
              valueWidget: Observer(
                  builder: (_) =>
                      Text(viewModel.isGenIsk1T ? "%${(viewModel.model.genIsk1O ?? 0).toIntIfDouble?.toStringAsFixed(2)}" : "${(viewModel.model.genIsk1T ?? 0).commaSeparatedWithFixedDigits} TL")),
              suffix: IconButton(
                  onPressed: () => viewModel.changeGenIsk1O(genelIskonto1Controller), icon: Observer(builder: (_) => Icon(viewModel.isGenIsk1T ? Icons.payments_outlined : Icons.percent_outlined))),
            ),
            CustomTextField(
              labelText: "İsk.Tipi 1",
              //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
              enabled: enable && yetkiController.siparisGenIsk1AktifMi,
              readOnly: true,
              suffixMore: true,
              controller: iskontoTipi1Controller,
              valueWidget: Observer(builder: (_) => Text(viewModel.model.genisk1Tipi?.toStringIfNull ?? "")),
              onTap: () async {
                var result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context);
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
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              valueWidget:
                  Observer(builder: (_) => Text(viewModel.isGenIsk2T ? "%${(viewModel.model.genIsk2O ?? 0).toIntIfDouble}" : "${(viewModel.model.genIsk2T ?? 0).commaSeparatedWithFixedDigits} TL")),
              onChanged: (p0) => viewModel.setGenIsk2(double.tryParse(p0.replaceAll(RegExp(r","), "."))),
              suffix: IconButton(
                  onPressed: () => viewModel.changeGenIsk2O(genelIskonto2Controller), icon: Observer(builder: (_) => Icon(viewModel.isGenIsk2T ? Icons.payments_outlined : Icons.percent_outlined))),
            ),
            CustomTextField(
              labelText: "İsk.Tipi 2",
              //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
              enabled: enable && yetkiController.siparisGenIsk2AktifMi,
              readOnly: true,
              suffixMore: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.model.genisk2Tipi?.toStringIfNull ?? "")),
              controller: iskontoTipi2Controller,
              onTap: () async {
                var result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context);
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
              controller: genelIskonto3Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              onChanged: (p0) => viewModel.setGenIsk3(double.tryParse(p0.replaceAll(RegExp(r","), "."))),
              valueWidget:
                  Observer(builder: (_) => Text(viewModel.isGenIsk3T ? "%${(viewModel.model.genIsk3O ?? 0).toIntIfDouble}" : "${(viewModel.model.genIsk3T ?? 0).commaSeparatedWithFixedDigits} TL")),
              suffix: IconButton(
                  onPressed: () => viewModel.changeGenIsk3O(genelIskonto3Controller), icon: Observer(builder: (_) => Icon(viewModel.isGenIsk3T ? Icons.payments_outlined : Icons.percent_outlined))),
            ),
            CustomTextField(
              labelText: "İsk.Tipi 3",
              //? Değişmeyecek alansa gizlesin diye tersini aldım. Değişmeyecekse "true" dönüyor.
              enabled: enable && yetkiController.siparisGenIsk3AktifMi,
              suffixMore: true,
              readOnly: true,
              controller: iskontoTipi3Controller,
              valueWidget: Observer(builder: (_) => Text(viewModel.model.genisk3Tipi?.toStringIfNull ?? "")),
              onTap: () async {
                var result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context);
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
                onChanged: (value) => viewModel.setEkMal1(double.tryParse(value.replaceAll(RegExp(r","), "."))),
              ),
            ).yetkiVarMi(!yetkiController.siparisMSEkMaliyet2AktifMi),
            Expanded(
              child: CustomTextField(
                labelText: yetkiController.siparisSatisEkMaliyet2Adi ?? "Tevkifat",
                enabled: enable,
                keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                controller: tevkifatController,
                inputFormatter: [FilteringTextInputFormatter.allow(RegExp(r"[\d+\-\.]"))],
                suffix: IconButton(
                    onPressed: () async {
                      var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                          title: "Tevkifat Oranı",
                          children: List.generate(
                              viewModel.tevkifatMap.length, (index) => BottomSheetModel(title: viewModel.tevkifatMap.keys.toList()[index], value: viewModel.tevkifatMap.values.toList()[index])));
                      if (result != null) {
                        viewModel.setTevkifat(result);
                        tevkifatController.text = (-result * viewModel.model.kdvTutari).toString();
                      }
                    },
                    icon: const Icon(Icons.more_horiz_outlined)),
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
                onChanged: (value) => viewModel.setEkMal1(double.tryParse(value.replaceAll(RegExp(r","), "."))),
              ),
            ).yetkiVarMi(!yetkiController.siparisMSEkMaliyet2AktifMi),
            Expanded(
              child: CustomTextField(
                labelText: "Vade Günü",
                enabled: enable,
                controller: vadeGunuController,
                keyboardType: TextInputType.number,
                onChanged: (value) => model.vadeGunu = int.tryParse(value),
                valueWidget: Observer(builder: (_) => Text(viewModel.model.vadeTarihi?.toDateString ?? "")),
                suffix: IconButton(
                  onPressed: () async {
                    final date = await showDatePicker(
                        context: context, initialDate: model.vadeTarihi ?? DateTime.now(), firstDate: model.tarih ?? DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 365)));
                    if (date != null) {
                      model.vadeGunu = ((model.tarih?.difference(date).inDays ?? 0) * -1);
                      viewModel.setVadeTarihi(date);
                      vadeGunuController.text = model.vadeGunu.toString();
                    }
                  },
                  icon: const Icon(Icons.calendar_today),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  void initControllers() {
    genelIskonto1Controller = TextEditingController(text: model.genIsk1O?.toIntIfDouble.toStringIfNull);
    genelIskonto2Controller = TextEditingController(text: model.genIsk2O?.toIntIfDouble.toStringIfNull);
    genelIskonto3Controller = TextEditingController(text: model.genIsk3O?.toIntIfDouble.toStringIfNull);
    iskontoTipi1Controller = TextEditingController(text: model.genisk1Tipi?.toStringIfNull);
    iskontoTipi2Controller = TextEditingController(text: model.genisk2Tipi?.toStringIfNull);
    iskontoTipi3Controller = TextEditingController(text: model.genisk3Tipi?.toStringIfNull);
    ekMal1Controller = TextEditingController(text: model.ekMaliyet1Tutari?.commaSeparatedWithFixedDigits);
    tevkifatController = TextEditingController(text: model.ekMaliyet2Tutari?.commaSeparatedWithFixedDigits);
    ekMal3Controller = TextEditingController(text: model.ekMaliyet3Tutari?.commaSeparatedWithFixedDigits);
    if (model.vadeGunu == null && model.vadeTarihi == null) {
      viewModel.setVadeTarihi(DateTime.now());
    }
    if ((model.vadeTarihi?.difference(DateTime.now()).inDays?? 0) < 0){
      viewModel.setVadeTarihi(DateTime.now());
    }
    vadeGunuController = TextEditingController(text: model.vadeGunu.toStringIfNull ?? (model.vadeTarihi?.difference(DateTime.now()))?.inDays.toStringIfNull);
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
