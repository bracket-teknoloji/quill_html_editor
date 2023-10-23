import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../model/param_model.dart";
import "../view_model/kasa_transferi_view_model.dart";

class KasaTransferiView extends StatefulWidget {
  const KasaTransferiView({super.key});

  @override
  State<KasaTransferiView> createState() => _KasaTransferiViewState();
}

class _KasaTransferiViewState extends BaseState<KasaTransferiView> {
  KasaTransferiViewModel viewModel = KasaTransferiViewModel();
  late final TextEditingController belgeNoController;
  late final TextEditingController tarihController;
  late final TextEditingController cikisKasaController;
  late final TextEditingController girisKasaController;
  late final TextEditingController plasiyerController;
  late final TextEditingController tutarController;
  late final TextEditingController dovizTipiController;
  late final TextEditingController dovizKuruController;
  late final TextEditingController dovizTutariController;
  late final TextEditingController projeController;
  late final TextEditingController aciklamaController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    belgeNoController = TextEditingController();
    tarihController = TextEditingController();
    cikisKasaController = TextEditingController();
    girisKasaController = TextEditingController();
    plasiyerController = TextEditingController();
    tutarController = TextEditingController();
    dovizTipiController = TextEditingController();
    dovizKuruController = TextEditingController();
    dovizTutariController = TextEditingController();
    projeController = TextEditingController();
    aciklamaController = TextEditingController(text: viewModel.aciklamaString);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getSiradakiKod();
      belgeNoController.text = viewModel.model.belgeNo ?? "";
      viewModel.setTarih(DateTime.now().dateTimeWithoutTime);
      tarihController.text = viewModel.model.tarih?.toDateString ?? "";
    });
    super.initState();
  }

  @override
  void dispose() {
    belgeNoController.dispose();
    tarihController.dispose();
    cikisKasaController.dispose();
    girisKasaController.dispose();
    plasiyerController.dispose();
    tutarController.dispose();
    dovizTipiController.dispose();
    dovizKuruController.dispose();
    dovizTutariController.dispose();
    projeController.dispose();
    aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(appBar: appBar(), body: body(context));

  AppBar appBar() => AppBar(
      title: const Text("Kasa Transferi"),
      actions: [
        IconButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                viewModel.setAciklama(aciklamaController.text);
                await dialogManager.showAreYouSureDialog(() async {
                  final result = await viewModel.postData();
                  if (result.success == true) {
                    Get.back(result: true);
                    dialogManager.showSuccessSnackBar(result.message ?? "Kayıt Başarılı");
                  }
                });
              }
            },
            icon: const Icon(Icons.save_outlined),),
      ],
    );

  SingleChildScrollView body(BuildContext context) => SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              labelText: "Belge No",
              controller: belgeNoController,
              maxLength: 15,
              suffix: IconButton(
                  onPressed: () async {
                    await viewModel.getSiradakiKod();
                    belgeNoController.text = viewModel.model.belgeNo ?? "";
                  },
                  icon: const Icon(Icons.add_outlined),),
              onChanged: (value) => viewModel.setBelgeNo(value),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: CustomTextField(
                        labelText: "Tarih",
                        controller: tarihController,
                        isMust: true,
                        readOnly: true,
                        isDateTime: true,
                        onTap: () async {
                          final result = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
                          if (result != null) {
                            viewModel.setTarih(result.dateTimeWithoutTime);
                            tarihController.text = result.toDateString;
                          }
                        },),),
                Expanded(
                    child: CustomTextField(
                  labelText: "Çıkış Kasa",
                  controller: cikisKasaController,
                  suffixMore: true,
                  isMust: true,
                  readOnly: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.cikisKasa?.kasaKodu ?? "")),
                  onTap: () async {
                    final KasaList? result = await bottomSheetDialogManager.showKasaBottomSheetDialog(context);
                    if (result is KasaList) {
                      await viewModel.setCikisKasa(result);
                      cikisKasaController.text = result.kasaTanimi ?? "";
                      aciklamaController.text = viewModel.aciklamaString;
                    }
                  },
                ),),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: "Giriş Kasa",
                  controller: girisKasaController,
                  isMust: true,
                  suffixMore: true,
                  readOnly: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.girisKasa?.kasaKodu ?? "")),
                  onTap: () async {
                    final KasaList? result = await bottomSheetDialogManager.showKasaBottomSheetDialog(context);
                    if (result is KasaList) {
                      await viewModel.setGirisKasa(result);
                      girisKasaController.text = result.kasaTanimi ?? "";
                      aciklamaController.text = viewModel.aciklamaString;
                      if (result.dovizli == "E" && result.dovizTipi != 0) {
                        dovizTipiController.text = result.dovizAdi ?? " ";
                        await getDovizDialog();
                      } else {
                        viewModel.setDovizTutari(null);
                        viewModel.setDovizTipi(null);
                        dovizTipiController.text = "";
                        dovizKuruController.text = "";
                        dovizTutariController.text = "";
                      }
                    }
                  },
                ),),
              ],
            ),
            Observer(builder: (_) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: CustomTextField(
                    labelText: "Döviz Tipi",
                    controller: dovizTipiController,
                    readOnly: true,
                    isMust: true,
                    keyboardType: const TextInputType.numberWithOptions(signed: true),
                    isFormattedString: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.dovizTipi.toStringIfNotNull ?? "")),
                    onChanged: (value) => viewModel.setTutar(value.toDoubleWithFormattedString),
                  ),).yetkiVarMi(viewModel.model.dovizTipi != 0 && viewModel.model.dovizTipi != null),
                  Expanded(
                      child: CustomTextField(
                          labelText: "Döviz Kuru",
                          controller: dovizKuruController,
                          isMust: true,
                          keyboardType: const TextInputType.numberWithOptions(signed: true),
                          isFormattedString: true,
                          onChanged: (value) {
                            if (dovizKuruController.text != "") {
                              viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / dovizKuruController.text.toDoubleWithFormattedString);
                              dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                            } else {
                              viewModel.setDovizTutari(null);
                              dovizTutariController.text = "";
                            }
                          },
                          suffix: IconButton(
                            onPressed: () async => await getDovizDialog(),
                            icon: const Icon(Icons.more_horiz_outlined),
                          ),),).yetkiVarMi(viewModel.model.dovizTipi != 0 && viewModel.model.dovizTipi != null),
                ],
              ),),
            Observer(builder: (_) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: CustomTextField(
                    labelText: "Döviz Tutarı",
                    controller: dovizTutariController,
                    isMust: true,
                    keyboardType: const TextInputType.numberWithOptions(signed: true),
                    isFormattedString: true,
                    onChanged: (value) {
                      viewModel.setDovizTutari(value.toDoubleWithFormattedString);
                      viewModel.setTutar((viewModel.model.dovizTutari ?? 0) * (dovizKuruController.text.toDoubleWithFormattedString));
                      tutarController.text = viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                    },
                  ),).yetkiVarMi(viewModel.model.dovizTipi != 0 && viewModel.model.dovizTipi != null),
                  Expanded(
                      child: CustomTextField(
                    labelText: "Tutar",
                    controller: tutarController,
                    isMust: true,
                    keyboardType: const TextInputType.numberWithOptions(signed: true),
                    isFormattedString: true,
                    onChanged: (value) {
                      viewModel.setTutar(value.toDoubleWithFormattedString);
                      if (viewModel.model.dovizTipi != 0 && viewModel.model.dovizTipi != null) {
                        viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / dovizKuruController.text.toDoubleWithFormattedString);
                        dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                      } else {
                        viewModel.setDovizTutari(null);
                        dovizTutariController.text = "";
                      }
                    },
                  ),),
                ],
              ),),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: "Plasiyer",
                  controller: plasiyerController,
                  suffixMore: true,
                  isMust: true,
                  readOnly: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context);
                    if (result != null) {
                      viewModel.setPlasiyerKodu(result);
                      plasiyerController.text = result.plasiyerAciklama ?? "";
                    }
                  },
                ),).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                Expanded(
                  child: CustomTextField(
                    labelText: "Proje",
                    controller: projeController,
                    suffixMore: true,
                    isMust: true,
                    readOnly: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                    onTap: () async {
                      final BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context);
                      if (result != null) {
                        viewModel.setProjekodu(result.projeKodu);
                        projeController.text = result.projeAdi ?? result.projeAciklama ?? "";
                      }
                    },
                  ),
                ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
              ],
            ),
            CustomTextField(
              labelText: "Kasa Hareketi Açıklama",
              controller: aciklamaController,
              onChanged: (value) => viewModel.setAciklama(value),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      ),
    );

  Future<void> getDovizDialog() async {
    await viewModel.getDovizler();
    if (viewModel.dovizKurlariListesi.ext.isNotNullOrEmpty) {
      dovizKuruController.text = "";
      dovizTutariController.text = "";
      // ignore: use_build_context_synchronously
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Döviz Kuru", children: [
        BottomSheetModel(
            title: "Alış: ${viewModel.dovizKurlariListesi?.first.dovAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.dovAlis,
            iconWidget: Icons.calculate_outlined,),
        BottomSheetModel(
            title: "Satış: ${viewModel.dovizKurlariListesi?.first.dovSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.dovSatis,
            iconWidget: Icons.calculate_outlined,),
        BottomSheetModel(
            title: "Efektif Alış: ${viewModel.dovizKurlariListesi?.first.effAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.effAlis,
            iconWidget: Icons.calculate_outlined,),
        BottomSheetModel(
            title: "Efektif Satış: ${viewModel.dovizKurlariListesi?.first.effSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.effSatis,
            iconWidget: Icons.calculate_outlined,),
      ],);
      if (result is double) {
        dovizKuruController.text = result.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati);
        if (tutarController.text != "") {
          viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / dovizKuruController.text.toDoubleWithFormattedString);
          dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else if (dovizTutariController.text != "") {
          viewModel.setTutar((viewModel.model.dovizTutari ?? 0) * (dovizKuruController.text.toDoubleWithFormattedString));
          tutarController.text = viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        }
      }
    }
  }
}
