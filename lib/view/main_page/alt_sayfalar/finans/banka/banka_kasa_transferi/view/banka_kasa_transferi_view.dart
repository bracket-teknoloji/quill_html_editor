import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/tahsilat_request_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_kasa_transferi/view_model/banka_kasa_transferi_view_model.dart";
import "package:picker/view/main_page/model/param_model.dart";
import "package:uuid/uuid.dart";

class BankaKasaTransferiView extends StatefulWidget {
  const BankaKasaTransferiView({super.key});

  @override
  State<BankaKasaTransferiView> createState() => _BankaKasaTransferiViewState();
}

class _BankaKasaTransferiViewState extends BaseState<BankaKasaTransferiView> {
  BankaKasaTransferiViewModel viewModel = BankaKasaTransferiViewModel();
  late final TextEditingController _belgeNoController;
  late final TextEditingController _tarihController;
  late final TextEditingController _hesapController;
  late final TextEditingController _kasaController;
  late final TextEditingController _dovizTipiController;
  late final TextEditingController _dovizTutariController;
  late final TextEditingController _dovizKuruController;
  late final TextEditingController _tutarController;
  late final TextEditingController _vadeGunuController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projeController;
  late final TextEditingController _kasaHarAciklamaController;
  late final TextEditingController _bankaHarAciklamaController;
  // form Key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _belgeNoController = TextEditingController();
    _tarihController = TextEditingController(text: DateTime.now().toDateString);
    _hesapController = TextEditingController();
    _kasaController = TextEditingController();
    _dovizTipiController = TextEditingController();
    _dovizTutariController = TextEditingController();
    _dovizKuruController = TextEditingController();
    _tutarController = TextEditingController();
    _vadeGunuController = TextEditingController();
    _plasiyerController = TextEditingController();
    _projeController = TextEditingController();
    _kasaHarAciklamaController = TextEditingController();
    _bankaHarAciklamaController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getSiradakiKod();
      _belgeNoController.text = viewModel.model.belgeNo ?? "";
      await getHesapListesi();
      await getKasaListesi();
    });
    super.initState();
  }

  @override
  void dispose() {
    _belgeNoController.dispose();
    _tarihController.dispose();
    _hesapController.dispose();
    _kasaController.dispose();
    _dovizTipiController.dispose();
    _dovizTutariController.dispose();
    _dovizKuruController.dispose();
    _tutarController.dispose();
    _vadeGunuController.dispose();
    _plasiyerController.dispose();
    _projeController.dispose();
    _kasaHarAciklamaController.dispose();
    _bankaHarAciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Banka Kasa Transferi"),
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
          child: Observer(
            builder: (_) => Form(
              key: _formKey,
              child: Column(
                children: [
                  Observer(
                    builder: (_) => SwitchListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Bankaya Para Girişi", style: TextStyle(fontWeight: FontWeight.bold)),
                      value: viewModel.model.gc == "G",
                      onChanged: (value) {
                        viewModel.setGc(value ? "G" : "C");
                        _bankaHarAciklamaController.text = viewModel.bankaHarAciklama;
                        viewModel.setHedefAciklama(viewModel.bankaHarAciklama);
                      },
                    ),
                  ).paddingAll(UIHelper.lowSize),
                  CustomTextField(
                    labelText: "Belge No",
                    controller: _belgeNoController,
                    maxLength: 15,
                    isMust: true,
                    suffix: IconButton(
                      onPressed: () {
                        viewModel.getSiradakiKod();
                        _belgeNoController.text = viewModel.model.belgeNo ?? "";
                      },
                      icon: const Icon(Icons.add_outlined),
                    ),
                  ),
                  CustomTextField(
                    labelText: "Tarih",
                    controller: _tarihController,
                    isDateTime: true,
                    readOnly: true,
                    isMust: true,
                    onTap: () async {
                      final DateTime? result = await dialogManager.showDateTimePicker();
                      if (result != null) {
                        _tarihController.text = result.toDateString;
                        viewModel.setTarih(result);
                      }
                    },
                  ),
                  CustomTextField(
                    labelText: "Hesap",
                    controller: _hesapController,
                    readOnly: true,
                    isMust: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.hesapKodu ?? "")),
                    onTap: () async => await getHesapListesi(),
                  ),
                  CustomTextField(
                    labelText: "Kasa",
                    controller: _kasaController,
                    readOnly: true,
                    isMust: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.kasaKodu ?? "")),
                    onTap: () async => await getKasaListesi(),
                  ),
                  Observer(
                    builder: (_) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Döviz Tipi",
                            controller: _dovizTipiController,
                            readOnly: true,
                            isMust: true,
                            suffixMore: true,
                            valueWidget: Observer(builder: (_) => Text(viewModel.model.dovizTipi?.toStringIfNotNull ?? "")),
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showDovizBottomSheetDialog(context, viewModel.model.dovizTipi);
                              if (result != null) {
                                if (result.dovizKodu != viewModel.model.dovizTipi) {
                                  _dovizTipiController.text = result.isim ?? "";
                                  viewModel.setDovizTipi(result.dovizKodu);
                                  await getDovizDialog();
                                }
                              }
                            },
                          ).yetkiVarMi(viewModel.model.dovizliMi || viewModel.bankaDovizliMi),
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
                        ).yetkiVarMi(viewModel.model.dovizliMi),
                      ],
                    ),
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
                            onPressed: () async => await getDovizDialog(),
                            icon: const Icon(Icons.more_horiz_outlined),
                          ),
                        ),
                      ).yetkiVarMi(viewModel.model.dovizliMi),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Tutar",
                          controller: _tutarController,
                          isMust: true,
                          keyboardType: const TextInputType.numberWithOptions(signed: true),
                          isFormattedString: true,
                          onChanged: (value) {
                            viewModel.setTutar(value.toDoubleWithFormattedString);
                            if (viewModel.model.dovizliMi) {
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
                          labelText: "Vade Günü",
                          controller: _vadeGunuController,
                          keyboardType: TextInputType.number,
                          valueWidget: Observer(builder: (_) => Text(DateTime.now().add(Duration(days: viewModel.model.vadeGunu ?? 0)).toDateString).yetkiVarMi(viewModel.model.vadeGunu != null)),
                          onChanged: (value) => viewModel.setVadeGunu(int.tryParse(value)),
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Plasiyer",
                          controller: _plasiyerController,
                          readOnly: true,
                          isMust: true,
                          suffixMore: true,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                          onTap: () async {
                            final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
                            if (result != null) {
                              _plasiyerController.text = result.plasiyerAciklama ?? "";
                              viewModel.setPlasiyerKodu(result.plasiyerKodu);
                            }
                          },
                        ).yetkiVarMi(parametreModel.plasiyerUygulamasi ?? false),
                      ),
                    ],
                  ),
                  CustomTextField(
                    labelText: "Proje",
                    controller: _projeController,
                    readOnly: true,
                    isMust: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
                      if (result != null) {
                        _projeController.text = result.projeAciklama ?? "";
                        viewModel.setProjeKodu(result.projeKodu);
                      }
                    },
                  ).yetkiVarMi(parametreModel.projeUygulamasiAcik ?? false),
                  CustomTextField(
                    labelText: "Kasa Hareket Açıklama",
                    controller: _kasaHarAciklamaController,
                  ),
                  CustomTextField(
                    labelText: "Banka Hareket Açıklama",
                    controller: _bankaHarAciklamaController,
                  ),
                ],
              ).paddingAll(UIHelper.lowSize),
            ),
          ),
        ),
      );

  Future<void> getDovizDialog() async {
    await viewModel.getDovizler();
    if (viewModel.dovizKurlariListesi.ext.isNotNullOrEmpty) {
      _dovizKuruController.text = "";
      _dovizTutariController.text = "";
      // ignore: use_build_context_synchronously
      final result = await bottomSheetDialogManager.showBottomSheetDialog(
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
    final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(context, viewModel.bankaListesiRequestModel, viewModel.model.hesapKodu);
    if (result != null) {
      _hesapController.text = result.hesapAdi ?? "";
      _dovizTipiController.text = result.dovizAdi ?? "";
      viewModel.setAciklama("${result.hesapAdi ?? ""} .Kodu: ${result.hesapKodu ?? ""}");
      _kasaHarAciklamaController.text = "${result.hesapAdi ?? ""} .Kodu: ${result.hesapKodu ?? ""}";
      viewModel.setHesapKodu(result);
      await getDovizDialog();
    }
  }

  Future<void> getKasaListesi() async {
    final List<KasaList> list = parametreModel.kasaList
            ?.where((element) => CacheManager.getAnaVeri?.userModel?.adminMi ?? CacheManager.getAnaVeri?.userModel?.kullaniciYetki?.yetkiliKasalar?.contains(element.kasaKodu) ?? false)
            .toList() ??
        [];
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Kasa Seçiniz",
      groupValue: viewModel.model.kasaKodu,
      children: list
          .map(
            (KasaList e) => BottomSheetModel(
              title: e.kasaTanimi ?? e.kasaKodu ?? "",
              value: e,
              groupValue: e.kasaKodu,
            ),
          )
          .toList(),
    );
    if (result != null) {
      _kasaController.text = result.kasaTanimi ?? "";
      viewModel.setKasaKodu(result.kasaKodu);
      _bankaHarAciklamaController.text = viewModel.bankaHarAciklama;

      viewModel.setHedefAciklama(viewModel.bankaHarAciklama);
      if (!viewModel.bankaDovizliMi) {
        _dovizTipiController.text = result.dovizAdi ?? "TL";
        if (result.dovizAdi != null) {
          viewModel.setDovizTipi(result.dovizTipi);
          await getDovizDialog();
        } else {
          viewModel.setDovizTipi(0);
        }
      }
    }
  }
}
