import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/kasa/kasa_transferi/view_model/kasa_transferi_view_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

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
    aciklamaController = TextEditingController(text: "Transfer => ");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getSiradakiKod();
      belgeNoController.text = viewModel.model.belgeNo ?? "";
      viewModel.setTarih(DateTime.now());
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
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kasa Transferi"),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.calculate_outlined)), IconButton(onPressed: () {}, icon: const Icon(Icons.save_outlined))],
        ),
        body: Form(
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
                    icon: const Icon(Icons.add_outlined)),
                onChanged: (value) => viewModel.setBelgeNo(value),
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          labelText: "Tarih",
                          controller: tarihController,
                          isMust: true,
                          readOnly: true,
                          isDateTime: true,
                          onTap: () async {
                            var result = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
                            if (result != null) {
                              viewModel.setTarih(result);
                              tarihController.text = result.toDateString;
                            }
                          })),
                  Expanded(
                      child: CustomTextField(
                    labelText: "Çıkış Kasa",
                    controller: cikisKasaController,
                    suffixMore: true,
                    isMust: true,
                    readOnly: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.cikisKasa?.kasaKodu ?? "")),
                    onTap: () async {
                      KasaList? result = await bottomSheetDialogManager.showKasaBottomSheetDialog(context);
                      if (result is KasaList) {
                        await viewModel.setCikisKasa(result);
                        cikisKasaController.text = result.kasaTanimi ?? "";
                      }
                    },
                  )),
                ],
              ),
              Row(
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
                      KasaList? result = await bottomSheetDialogManager.showKasaBottomSheetDialog(context);
                      if (result is KasaList) {
                        await viewModel.setGirisKasa(result);
                        girisKasaController.text = result.kasaTanimi ?? "";
                        if (result.dovizli == "E" && result.dovizTipi != 0) {
                          dovizTipiController.text = result.dovizAdi ?? "";
                        } else {
                          dovizTipiController.text = "";
                        }
                      }
                    },
                  )),
                  Expanded(
                      child: CustomTextField(
                    labelText: "Plasiyer",
                    controller: plasiyerController,
                    suffixMore: true,
                    isMust: true,
                    readOnly: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                    onTap: () async {
                      var result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context);
                      if (result != null) {
                        viewModel.setPlasiyerKodu(result);
                        plasiyerController.text = result.plasiyerAciklama ?? "";
                      }
                    },
                  )),
                ],
              ),
              Observer(builder: (_) {
                return Row(
                  children: [
                    Expanded(
                        child: CustomTextField(
                      labelText: "Döviz Tipi",
                      controller: dovizTipiController,
                      isMust: true,
                      keyboardType: const TextInputType.numberWithOptions(signed: true),
                      isFormattedString: true,
                      valueWidget: Observer(builder: (_) => Text(viewModel.model.dovizTipi.toStringIfNotNull ?? "")),
                      onChanged: (value) => viewModel.setTutar(value.toDoubleWithFormattedString),
                    )).yetkiVarMi(viewModel.model.dovizTipi != 0 && viewModel.model.dovizTipi != null),
                    Expanded(
                        child: CustomTextField(
                      labelText: "Döviz Kuru",
                      controller: dovizKuruController,
                      isMust: true,
                      keyboardType: const TextInputType.numberWithOptions(signed: true),
                      isFormattedString: true,
                      onChanged: (value) => viewModel.setTutar(value.toDoubleWithFormattedString),
                    )).yetkiVarMi(viewModel.model.dovizTipi != 0 && viewModel.model.dovizTipi != null),
                  ],
                );
              }),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    labelText: "Döviz Tutarı",
                    controller: dovizTutariController,
                    isMust: true,
                    keyboardType: const TextInputType.numberWithOptions(signed: true),
                    isFormattedString: true,
                    onChanged: (value) => viewModel.setTutar(value.toDoubleWithFormattedString),
                  )).yetkiVarMi(viewModel.model.dovizTipi != 0 && viewModel.model.dovizTipi != null),
                  Expanded(
                      child: CustomTextField(
                    labelText: "Tutar",
                    controller: tutarController,
                    isMust: true,
                    keyboardType: const TextInputType.numberWithOptions(signed: true),
                    isFormattedString: true,
                    onChanged: (value) => viewModel.setTutar(value.toDoubleWithFormattedString),
                  )),
                ],
              ),
              CustomTextField(
                labelText: "Proje",
                controller: projeController,
                suffixMore: true,
                isMust: true,
                readOnly: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                onTap: () async {
                  BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context);
                  if (result != null) {
                    viewModel.setProjekodu(result.projeKodu);
                    projeController.text = result.projeAdi ?? result.projeAciklama ?? "";
                  }
                },
              ),
              CustomTextField(
                labelText: "Kasa Hareketi Açıklama",
                controller: aciklamaController,
                onChanged: (value) => viewModel.setAciklama(value),
              ),
            ],
          ),
        ));
  }
}
