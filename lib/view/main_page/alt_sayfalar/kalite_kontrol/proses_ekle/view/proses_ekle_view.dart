import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/slide_controller/view/slide_controller_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_ekle_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/proses_ekle/view_model/proses_ekle_view_model.dart";

class ProsesEkleView extends StatefulWidget {
  final OlcumProsesModel model;
  const ProsesEkleView({super.key, required this.model});

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
    viewModel.ekleModel = OlcumEkleProsesModel.fromOlcumProsesModel(widget.model);
    viewModel.setProsesDetayListesi(widget.model.numuneMiktari ?? 0);
    numuneControllers = List.generate(widget.model.numuneMiktari ?? 0, (index) {
      final double? deger = widget.model.numunler?.detaylar?[index].deger;
      if (widget.model.numunler != null) {
        viewModel.setIndexedItem(index, OlcumEkleDetayModel(deger: deger));
      }
      return TextEditingController(text: deger?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "");
    });
    sartliKabulTuruController = TextEditingController();
    operatorController = TextEditingController();
    aciklamaController = TextEditingController(text: widget.model.kabulSarti);
    super.initState();
  }

  @override
  void dispose() {
    sartliKabulTuruController.dispose();
    operatorController.dispose();
    aciklamaController.dispose();
    for (var element in numuneControllers) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Proses Ekle",
            subtitle: widget.model.id.toStringIfNotNull,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  if (viewModel.ekleModel.detaylar?.every((element) => ((element.deger ?? 0) > (widget.model.altSinir ?? 0)) && ((element.deger ?? 0) < (widget.model.ustSinir ?? 0))) ?? false) {
                    Get.back(result: OlcumEkleProsesModel.fromOlcumProsesModel(widget.model).copyWith(detaylar: viewModel.ekleModel.detaylar, sonuc: "K"));
                    dialogManager.showSuccessSnackBar("Başarılı");
                  } else {
                    //TODO Ölçüm sonuç bilgileri eklensin
                    final result = await showOlcumSonucBilgileri();
                    if (result != null) {
                      Get.back(result: result);
                    }
                  }
                }
              },
              icon: const Icon(Icons.save_outlined),
            ).yetkiVarMi(widget.model.olculecekMi),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Card(
                  child: ListTile(
                    title: Text(widget.model.proses ?? ""),
                    subtitle: CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        Text("Kriter: ${widget.model.kriter}").yetkiVarMi(widget.model.kriter != null),
                        Text("Tolerans: ${widget.model.tolerans}").yetkiVarMi(widget.model.tolerans != null),
                        Text("Tür: ${widget.model.tur}").yetkiVarMi(widget.model.tur != null),
                        Text("Ekipman: ${widget.model.ekipman}").yetkiVarMi(widget.model.ekipman != null),
                        Text("Alt Sınır: ${widget.model.altSinir.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(widget.model.altSinir != null),
                        Text("Üst Sınır: ${widget.model.ustSinir.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(widget.model.ustSinir != null),
                      ],
                    ),
                  ),
                ),
                Card(
                  child: ListTile(
                    subtitle: Observer(
                      builder: (_) => CustomLayoutBuilder(
                        splitCount: 2,
                        children: [
                          Text("Numune Sayısı: ${widget.model.numuneMiktari}"),
                          Text("Ortalama: ${viewModel.ortalamaDeger.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                          Text("En Küçük: ${viewModel.enKucukDeger.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                          Text("En Büyük: ${viewModel.enBuyukDeger.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                        ],
                      ),
                    ),
                  ),
                ),
                if (widget.model.olculecekMi) ...buildFormFields(),
                if (!widget.model.olculecekMi) switchButton(),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );

  List<Widget> buildFormFields() => List.generate(
        widget.model.numuneMiktari ?? 0,
        (index) => CustomTextField(
          labelText: "Numune ${index + 1}",
          controller: numuneControllers[index],
          isMust: true,
          isFormattedString: true,
          onChanged: (value) => viewModel.setIndexedItem(index, OlcumEkleDetayModel(deger: value.toDoubleWithFormattedString)),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
      );

  Row switchButton() => Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Get.back(result: OlcumEkleProsesModel.fromOlcumProsesModel(widget.model).copyWith(detaylar: viewModel.ekleModel.detaylar?.map((e) => e..deger = 1).toList(), sonuc: "K"));
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(ColorPalette.mantis)),
              child: const Text("Onay"),
            ).paddingAll(UIHelper.lowSize),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                Get.back(result: OlcumEkleProsesModel.fromOlcumProsesModel(widget.model).copyWith(detaylar: viewModel.ekleModel.detaylar?.map((e) => e..deger = 0).toList(), sonuc: "R"));
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(ColorPalette.persianRed)),
              child: const Text("Ret"),
            ).paddingAll(UIHelper.lowSize),
          ),
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
                      sartliKabulTuruController.text = "";
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
                    operatorController.text = result.adi ?? "";
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
