import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/hesaplar_arasi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/hesaplar_arasi/view_model/hesaplar_arasi_islem_view_model.dart";
import "package:uuid/uuid.dart";

class HesaplarArasiIslemView extends StatefulWidget {
  final HesaplarArasiEnum hesaplarArasiEnum;
  const HesaplarArasiIslemView({super.key, required this.hesaplarArasiEnum});

  @override
  State<HesaplarArasiIslemView> createState() => _HesaplarArasiIslemViewState();
}

class _HesaplarArasiIslemViewState extends BaseState<HesaplarArasiIslemView> {
  HesaplarArasiIslemViewModel viewModel = HesaplarArasiIslemViewModel();
  late final TextEditingController _tarihController;
  late final TextEditingController _dekontNoController;
  late final TextEditingController _cikisHesabiController;
  late final TextEditingController _girisHesabiController;
  late final TextEditingController _dovizTipiController;
  late final TextEditingController _dovizTutariController;
  late final TextEditingController _dovizKuruController;
  late final TextEditingController _tutarController;
  late final TextEditingController _masrafController;
  late final TextEditingController _bsmvController;
  late final TextEditingController _masrafMuhKoduController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projeController;
  late final TextEditingController _aciklamaController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tarihController = TextEditingController();
    _dekontNoController = TextEditingController();
    _cikisHesabiController = TextEditingController();
    _girisHesabiController = TextEditingController();
    _dovizTipiController = TextEditingController();
    _dovizTutariController = TextEditingController();
    _dovizKuruController = TextEditingController();
    _tutarController = TextEditingController();
    _masrafController = TextEditingController();
    _bsmvController = TextEditingController();
    _masrafMuhKoduController = TextEditingController();
    _plasiyerController = TextEditingController();
    _projeController = TextEditingController();
    _aciklamaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _tarihController.dispose();
    _dekontNoController.dispose();
    _cikisHesabiController.dispose();
    _girisHesabiController.dispose();
    _dovizTipiController.dispose();
    _dovizTutariController.dispose();
    _dovizKuruController.dispose();
    _tutarController.dispose();
    _masrafController.dispose();
    _bsmvController.dispose();
    _masrafMuhKoduController.dispose();
    _plasiyerController.dispose();
    _projeController.dispose();
    _aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text("Hesaplar Arası ${widget.hesaplarArasiEnum.name}"),
          actions: [
            IconButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  await dialogManager.showAreYouSureDialog(() async {
                    viewModel.setGuid(const Uuid().v4());
                    final result = await viewModel.saveTahsilat();
                    if (result?.success ?? false) {
                      dialogManager.showSuccessSnackBar(result?.message ?? "");
                      Get.back(result: true);
                    }
                  });
                }
              },
              icon: const Icon(Icons.save_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Tarih",
                        controller: _tarihController,
                        isDateTime: true,
                        isMust: true,
                        readOnly: true,
                        onTap: () async {
                          final result = await dialogManager.showDateTimePicker();
                          if (result != null) {
                            viewModel.setTarih(result);
                            _tarihController.text = result.toDateString;
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Dekont No",
                        controller: _dekontNoController,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: "Çıkış Hesabı",
                  controller: _cikisHesabiController,
                  isMust: true,
                  readOnly: true,
                  suffixMore: true,
                ),
                CustomTextField(
                  labelText: "Giriş Hesabı",
                  controller: _girisHesabiController,
                  isMust: true,
                  readOnly: true,
                  suffixMore: true,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Döviz Tipi",
                        controller: _dovizTipiController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Döviz Tutarı",
                        controller: _dovizTutariController,
                        isMust: true,
                        keyboardType: const TextInputType.numberWithOptions(signed: true),
                        isFormattedString: true,
                        onChanged: (value) {
                          viewModel.setDovizTutari(value.toDoubleWithFormattedString);
                          viewModel.setTutar((viewModel.model.dovizTutari ?? 0) * (_dovizKuruController.text.toDoubleWithFormattedString));
                          _tutarController.text = viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Döviz Kuru",
                        controller: _dovizKuruController,
                        isMust: true,
                        isFormattedString: true,
                        keyboardType: const TextInputType.numberWithOptions(signed: true),
                        onChanged: (value) {
                          if (_dovizKuruController.text != "") {
                            viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString);
                            _dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                          } else {
                            viewModel.setDovizTutari(null);
                            _dovizTutariController.text = "";
                          }
                        },
                        suffix: IconButton(
                          onPressed: () {},
                          // onPressed: () async => await getDovizDialog(),
                          icon: const Icon(Icons.more_horiz_outlined),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Tutar",
                        controller: _tutarController,
                        isMust: true,
                        keyboardType: const TextInputType.numberWithOptions(signed: true),
                        isFormattedString: true,
                        onChanged: (value) {
                          viewModel.setTutar(value.toDoubleWithFormattedString);
                          if (viewModel.model.dovizTipi != 0 && viewModel.model.dovizTipi != null) {
                            viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString);
                            _dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                          } else {
                            viewModel.setDovizTutari(null);
                            _dovizTutariController.text = "";
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Masraf (Çıkış Hesabından)",
                        controller: _masrafController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) => viewModel.setMasrafCikisHesabindanMi(double.tryParse(value)),
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "BSMV",
                        controller: _bsmvController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) => viewModel.setBSMV(double.tryParse(value)),
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Masraf Muh. Kodu",
                        controller: _masrafMuhKoduController,
                        readOnly: true,
                        suffixMore: true,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Plasiyer",
                        controller: _plasiyerController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context);
                          if (result != null) {
                            _plasiyerController.text = result.plasiyerAciklama ?? "";
                            viewModel.setPlasiyerKodu(result.plasiyerKodu);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: "Proje",
                  controller: _projeController,
                  isMust: true,
                  suffixMore: true,
                  readOnly: true,
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context);
                    if (result != null) {
                      _projeController.text = result.projeAdi ?? "";
                      viewModel.setProjeKodu(result.projeKodu);
                    }
                  },
                ),
                CustomTextField(
                  labelText: "Açıklama",
                  controller: _aciklamaController,
                  onChanged: (value) => viewModel.setAciklama(value),
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );

  Future<void> getDovizDialog() async {
    await viewModel.getDovizler();
    if (viewModel.dovizKurlariListesi.ext.isNotNullOrEmpty) {
      _dovizKuruController.text = "";
      _dovizTutariController.text = "";
      // ignore: use_build_context_synchronously
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
        context,
        title: "Döviz Kuru",
        children: [
          BottomSheetModel(
            title: "Alış: ${viewModel.dovizKurlariListesi?.first.dovAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.dovAlis,
            iconWidget: Icons.calculate_outlined,
          ),
          BottomSheetModel(
            title: "Satış: ${viewModel.dovizKurlariListesi?.first.dovSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.dovSatis,
            iconWidget: Icons.calculate_outlined,
          ),
          BottomSheetModel(
            title: "Efektif Alış: ${viewModel.dovizKurlariListesi?.first.effAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.effAlis,
            iconWidget: Icons.calculate_outlined,
          ),
          BottomSheetModel(
            title: "Efektif Satış: ${viewModel.dovizKurlariListesi?.first.effSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.effSatis,
            iconWidget: Icons.calculate_outlined,
          ),
        ],
      );
      if (result is double) {
        _dovizKuruController.text = result.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati);
        if (_tutarController.text != "") {
          viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString);
          _dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else if (_dovizTutariController.text != "") {
          viewModel.setTutar((viewModel.model.dovizTutari ?? 0) * (_dovizKuruController.text.toDoubleWithFormattedString));
          _tutarController.text = viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        }
      }
    } else {
      _dovizKuruController.text = "";
      _dovizTutariController.text = "";
    }
  }

  Future<void> getHesapListesi() async {
    final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(context, viewModel.bankaListesiRequestModel);
    // if (result != null) {
    //   _hesapController.text = result.hesapAdi ?? "";
    //   _dovizTipiController.text = result.dovizAdi ?? "";
    //   viewModel.setAciklama("${result.hesapAdi ?? ""} .Kodu: ${result.hesapKodu ?? ""}");
    //   _kasaHarAciklamaController.text = "${result.hesapAdi ?? ""} .Kodu: ${result.hesapKodu ?? ""}";
    //   viewModel.setHesapKodu(result);
    //   await getDovizDialog();
    // }
  }
}
