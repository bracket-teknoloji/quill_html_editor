import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/color_palette.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "../view_model/proses_ekle_view_model.dart";

class ProsesEkleView extends StatefulWidget {
  const ProsesEkleView({required this.model, super.key});
  final BaseEditModel<OlcumProsesModel> model;

  @override
  State<ProsesEkleView> createState() => _ProsesEkleViewState();
}

class _ProsesEkleViewState extends BaseState<ProsesEkleView> {
  final ProsesEkleViewModel viewModel = ProsesEkleViewModel();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> olcumSonucFormKey = GlobalKey<FormState>();
  late final List<TextEditingController> numuneControllers;

  late final TextEditingController sartliKabulTuruController;
  late final TextEditingController operatorController;
  late final TextEditingController aciklamaController;

  @override
  void initState() {
    viewModel
      ..setEkleModel(widget.model.model!)
      ..setProsesDetayListesi(widget.model.model!.numuneMiktari ?? 0);
    numuneControllers = List.generate(widget.model.model!.numuneMiktari ?? 0, (index) {
      try {
        final double? deger = widget.model.model?.numuneler?.olcumler?[index].deger;
        if (widget.model.model?.numuneler != null) {
          viewModel.setIndexedItem(index, OlcumEkleDetayModel(deger: deger));
        }
        return TextEditingController(text: deger?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "");
      } on RangeError {
        return TextEditingController();
      }
    });
    sartliKabulTuruController = TextEditingController();
    operatorController = TextEditingController();
    aciklamaController = TextEditingController(text: widget.model.model!.aciklama);
    super.initState();
  }

  @override
  void dispose() {
    sartliKabulTuruController.dispose();
    operatorController.dispose();
    aciklamaController.dispose();
    for (final element in numuneControllers) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Proses ${widget.model.baseEditEnum?.getName}",
            subtitle: "ID ${widget.model.model!.id.toStringIfNotNull}",
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (viewModel.ekleModel.olcumler
                          ?.every((element) => ((element.deger ?? 0) >= (widget.model.model!.altSinir ?? 0)) && ((element.deger ?? 0) <= (widget.model.model!.ustSinir ?? 0))) ??
                      false) {
                    Get.back(result: widget.model.model!.copyWith(olcumler: viewModel.ekleModel.olcumler, sonuc: "K"));
                    dialogManager.showSuccessSnackBar("Başarılı");
                  } else {
                    final result = await showOlcumSonucBilgileri();
                    if (result != null) {
                      Get.back(result: result);
                    }
                  }
                }
              },
              icon: const Icon(Icons.save_outlined),
            ).yetkiVarMi(widget.model.model!.olculecekMi && !(widget.model.baseEditEnum?.goruntuleMi ?? false)),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Observer(
              builder: (_) => Column(
                children: [
                  Card(
                    child: ListTile(
                      title: Text(widget.model.model!.proses ?? ""),
                      subtitle: CustomLayoutBuilder(
                        splitCount: 2,
                        children: [
                          Text("Kriter: ${widget.model.model!.kriter}").yetkiVarMi(widget.model.model!.kriter != null),
                          Text("Tolerans: ${widget.model.model!.tolerans}").yetkiVarMi(widget.model.model!.tolerans != null),
                          Text("Tür: ${widget.model.model!.tur}").yetkiVarMi(widget.model.model!.tur != null),
                          Text("Ekipman: ${widget.model.model!.ekipman}").yetkiVarMi(widget.model.model!.ekipman != null),
                          Text("Alt Sınır: ${widget.model.model!.altSinir.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(widget.model.model!.altSinir != null),
                          Text("Üst Sınır: ${widget.model.model!.ustSinir.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(widget.model.model!.ustSinir != null),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Observer(
                            builder: (_) => CustomLayoutBuilder(
                              splitCount: 2,
                              children: [
                                Text("Numune Sayısı: ${widget.model.model!.numuneMiktari}"),
                                Text("Ortalama: ${viewModel.ortalamaDeger.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                                Text("En Küçük: ${viewModel.enKucukDeger.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                                Text("En Büyük: ${viewModel.enBuyukDeger.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                              ],
                            ),
                          ),
                          Text("Açıklama: ${widget.model.model?.aciklama}").yetkiVarMi(widget.model.model?.aciklama != null),
                        ],
                      ),
                    ),
                  ).yetkiVarMi(widget.model.model!.olculecekMi),
                  if (widget.model.model!.olculecekMi) ...buildFormFields(),
                  if (!widget.model.model!.olculecekMi) switchButton(),
                ],
              ).paddingAll(UIHelper.lowSize),
            ),
          ),
        ),
      );

  List<Widget> buildFormFields() => List.generate(
        viewModel.ekleModel.numuneMiktari ?? 0,
        (index) => CustomTextField(
          labelText: "Numune ${index + 1}",
          enabled: !(widget.model.baseEditEnum?.goruntuleMi ?? false),
          controller: numuneControllers[index],
          valueWidget: Observer(
            builder: (_) {
              final OlcumEkleDetayModel? olcum = viewModel.olcumler?[index];
              return Text(
                olcum?.deger == null || ((olcum?.deger ?? 0) >= (widget.model.model?.altSinir ?? 0) && (olcum?.deger ?? 0) <= (widget.model.model?.ustSinir ?? 0)) ? "" : "Aralık Dışında",
                style: const TextStyle(color: ColorPalette.persianRed),
              );
            },
          ),
          isMust: true,
          isFormattedString: true,
          onChanged: (value) => viewModel.setIndexedItem(index, OlcumEkleDetayModel(deger: value.toDoubleWithFormattedString)),
          keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
        ),
      );

  Row switchButton() => Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: widget.model.baseEditEnum?.goruntuleMi == true
                  ? () {}
                  : () {
                      Get.back(result: widget.model.model!.copyWith(olcumler: viewModel.ekleModel.olcumler?.map((e) => e..deger = 1).toList(), sonuc: "K"));
                    },
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(ColorPalette.mantis)),
              child: const Text("Onay"),
            ).paddingAll(UIHelper.lowSize),
          ).yetkiVarMi(!widget.model.isGoruntule || (widget.model.isGoruntule && viewModel.ekleModel.olcumler?.firstOrNull?.deger == 1)),
          Expanded(
            child: ElevatedButton(
              onPressed: widget.model.baseEditEnum?.goruntuleMi == true
                  ? () {}
                  : () {
                      Get.back(result: widget.model.model!.copyWith(olcumler: viewModel.ekleModel.olcumler?.map((e) => e..deger = 0).toList(), sonuc: "R"));
                    },
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(ColorPalette.persianRed)),
              child: const Text("Ret"),
            ).paddingAll(UIHelper.lowSize),
          ).yetkiVarMi(!widget.model.isGoruntule || (widget.model.isGoruntule && viewModel.ekleModel.olcumler?.firstOrNull?.deger == 0)),
        ],
      );

  Future showOlcumSonucBilgileri() async => await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: "Ölçüm Sonuç Bilgileri",
        body: Form(
          key: olcumSonucFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Observer(
                builder: (_) => SlideControllerWidget(
                  scroll: false,
                  title: "Sonuç Türü",
                  childrenTitleList: viewModel.sonucTuruTitleList,
                  childrenValueList: viewModel.sonucTuruValueList,
                  groupValue: viewModel.sonucTuruGroupValue,
                  filterOnChanged: (index) {
                    viewModel.setSonucTuruGroupValue(index ?? 0);
                    if (!viewModel.sartliKabulMu) {
                      sartliKabulTuruController.clear();
                    }
                  },
                ),
              ),
              CustomTextField(
                labelText: "Operatör",
                controller: operatorController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                onTap: () async {
                  final result = await bottomSheetDialogManager.showOlcumOperatorBottomSheetDialog(context, viewModel.ekleModel.kayitOperator);
                  if (result != null) {
                    viewModel.setOperator(result.sicilno);
                    operatorController.text = result.adiSoyadi ?? "";
                  }
                },
              ),
              Observer(
                builder: (_) => CustomTextField(
                  labelText: "Şartlı Kabul Türü",
                  controller: sartliKabulTuruController,
                  isMust: true,
                  readOnly: true,
                  suffixMore: true,
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showOlcumSartliKabullerBottomSheetDialog(context, viewModel.ekleModel.sartliKabulNedeni);
                    if (result != null) {
                      viewModel.ekleModel.sartliKabulNedeniAciklama = result.tanimi ?? result.kodu;
                      viewModel.setSartliKabul(result.kodu);
                      sartliKabulTuruController.text = result.tanimi ?? "";
                    }
                  },
                ).yetkiVarMi(viewModel.sartliKabulMu),
              ),
              CustomTextField(
                labelText: "Açıklama",
                controller: aciklamaController,
                onChanged: viewModel.setAciklama,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (olcumSonucFormKey.currentState?.validate() ?? false) {
                    Get.back(result: viewModel.ekleModel..sonuc = viewModel.sonucTuruGroupValue);
                    dialogManager.showSuccessSnackBar(loc.generalStrings.success);
                  }
                },
                child: Text(loc.generalStrings.apply),
              ),
            ],
          ),
        ),
      );
}
