// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/muhasebe_referans_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/hizli_islemler/nakit_odeme/view_model/nakit_odeme_view_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

class NakitOdemeView extends StatefulWidget {
  final bool? tahsilatMi;
  const NakitOdemeView({super.key, this.tahsilatMi});

  @override
  State<NakitOdemeView> createState() => _NakitOdemeViewState();
}

class _NakitOdemeViewState extends BaseState<NakitOdemeView> {
  NakitOdemeViewModel viewModel = NakitOdemeViewModel();
  late final TextEditingController _belgeNoController;
  late final TextEditingController _tarihController;
  late final TextEditingController _kasaController;
  late final TextEditingController _cariController;
  late final TextEditingController _dovizTipiController;
  late final TextEditingController _dovizKuruController;
  late final TextEditingController _dovizTutariController;
  late final TextEditingController _tutarController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projekoduController;
  late final TextEditingController _referansKoduController;
  late final TextEditingController _kasaHareketiAciklamaController;
  late final TextEditingController _cariHareketiAciklamaController;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _belgeNoController = TextEditingController();
    _tarihController = TextEditingController();
    _kasaController = TextEditingController();
    _cariController = TextEditingController();
    _dovizTipiController = TextEditingController();
    _dovizKuruController = TextEditingController();
    _dovizTutariController = TextEditingController();
    _tutarController = TextEditingController();
    _plasiyerController = TextEditingController();
    _projekoduController = TextEditingController();
    _referansKoduController = TextEditingController();
    _kasaHareketiAciklamaController = TextEditingController();
    _cariHareketiAciklamaController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      viewModel.setTahsilatmi(widget.tahsilatMi == true);
      await getCari();
      await getKasa();
      await viewModel.getSiradakiKod();
      _belgeNoController.text = viewModel.model.belgeNo ?? "";
      viewModel.setTarih(DateTime.now().dateTimeWithoutTime);
      _tarihController.text = viewModel.model.tarih?.toDateString ?? "";
    });

    super.initState();
  }

  @override
  void dispose() {
    _belgeNoController.dispose();
    _tarihController.dispose();
    _kasaController.dispose();
    _cariController.dispose();
    _dovizTipiController.dispose();
    _dovizKuruController.dispose();
    _dovizTutariController.dispose();
    _tutarController.dispose();
    _plasiyerController.dispose();
    _projekoduController.dispose();
    _referansKoduController.dispose();
    _kasaHareketiAciklamaController.dispose();
    _cariHareketiAciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (_) => Text("Nakit ${viewModel.formTipi}")),
        actions: [
          IconButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                viewModel.setAciklama(_kasaHareketiAciklamaController.text);
                await dialogManager.showAreYouSureDialog(() async {
                  final result = await viewModel.postData();
                  if (result.success == true) {
                    Get.back(result: true);
                    dialogManager.showSuccessSnackBar(result.message ?? "Kayıt başarılı");
                  }
                });
              }
            },
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Observer(builder: (_) {
              return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                Observer(
                    builder: (_) => CustomTextField(
                        labelText: "Belge No",
                        controller: _belgeNoController,
                        maxLength: 15,
                        onChanged: (value) => viewModel.setBelgeNo(value),
                        suffix: IconButton(
                          onPressed: () async {
                            await viewModel.getSiradakiKod();
                            _belgeNoController.text = viewModel.model.belgeNo ?? "";
                          },
                          icon: const Icon(Icons.add_outlined),
                        ))),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Tarih",
                        controller: _tarihController,
                        isMust: true,
                        isDateTime: true,
                        readOnly: true,
                        onTap: () async {
                          final result = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
                          if (result != null) {
                            _tarihController.text = result.toDateString;
                            viewModel.setTarih(result.dateTimeWithoutTime);
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Kasa",
                        controller: _kasaController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.kasaKodu ?? "")),
                        onTap: () async => await getKasa(),
                      ),
                    )
                  ],
                ),
                CustomTextField(
                    labelText: "Cari",
                    controller: _cariController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.hesapKodu ?? "")),
                    onTap: () async => await getCari(),
                    suffix: IconButton(
                      onPressed: () async {
                        if (viewModel.model.hesapKodu != null) {
                          dialogManager.showCariGridViewDialog(CariListesiModel(cariKodu: viewModel.model.hesapKodu));
                        } else {
                          dialogManager.showErrorSnackBar("Cari seçiniz");
                        }
                      },
                      icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                    )),
                Observer(
                    builder: (_) => Text(
                          (viewModel.getCariBakiye ?? "") + ((viewModel.cariBakiye ?? 0) > 0 ? " (Tahsil Edilecek)" : " (Ödenecek)"),
                          style: TextStyle(color: (viewModel.cariBakiye ?? 0) > 0 ? Colors.green : Colors.red),
                        ).paddingAll(UIHelper.lowSize).yetkiVarMi(viewModel.getCariBakiye != null)),
                Observer(builder: (_) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Döviz Tipi",
                          controller: _dovizTipiController,
                          isMust: true,
                          readOnly: true,
                          suffixMore: viewModel.kasa?.dovizli != "E",
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.dovizTipi.toStringIfNotNull ?? "")),
                          onTap: () async {
                            if (viewModel.kasa?.dovizli == "E") {
                              return;
                            }
                            final result = await bottomSheetDialogManager.showDovizBottomSheetDialog(context);
                            if (result is DovizList) {
                              _dovizTipiController.text = result.isim ?? "";
                              viewModel.setDovizTipi(result.dovizTipi);
                              await getDovizDialog();
                            }
                          },
                          // onTap: () async => await getSeri(),
                        ),
                      ).yetkiVarMi(viewModel.model.dovizTipi != null),
                      Expanded(
                        child: CustomTextField(
                            labelText: "Döviz Kuru",
                            controller: _dovizKuruController,
                            isMust: true,
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
                            )),
                      ).yetkiVarMi(viewModel.model.dovizTipi != null && viewModel.model.dovizTipi != 0),
                    ],
                  );
                }),
                Observer(builder: (_) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Döviz Tutarı",
                          controller: _dovizTutariController,
                          isMust: true,
                          isFormattedString: true,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value) {
                            viewModel.setDovizTutari(value.toDoubleWithFormattedString);
                            viewModel.setTutar((viewModel.model.dovizTutari ?? 0) * (_dovizKuruController.text.toDoubleWithFormattedString));
                            _tutarController.text = viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                          },
                          // onChanged: (value) => viewModel.setTutar(value.toDoubleWithFormattedString),
                        ),
                      ).yetkiVarMi(viewModel.model.dovizTipi != null && viewModel.model.dovizTipi != 0),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Tutar",
                          controller: _tutarController,
                          isMust: true,
                          isFormattedString: true,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value) {
                            viewModel.setTutar(value.toDoubleWithFormattedString);
                            if (_dovizKuruController.text != "") {
                              viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString);
                              _dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                            } else {
                              viewModel.setDovizTutari(null);
                              _dovizTutariController.text = "";
                            }
                          },
                          // onChanged: (value) => viewModel.setTutar(value.toDoubleWithFormattedString),
                        ),
                      ),
                    ],
                  );
                }),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Plasiyer",
                        controller: _plasiyerController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context);
                          if (result is PlasiyerList) {
                            _plasiyerController.text = result.plasiyerAciklama ?? "";
                            viewModel.setPlasiyerKodu(result);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Proje",
                        controller: _projekoduController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context);
                          if (result is BaseProjeModel) {
                            _projekoduController.text = result.projeAciklama ?? "";
                            viewModel.setProjekodu(result.projeKodu);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
                  ],
                ),
                CustomTextField(
                  labelText: "Referans Kodu",
                  controller: _referansKoduController,
                  isMust: true,
                  readOnly: true,
                  suffixMore: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.refKod ?? "")),
                  onTap: () async {
                    if (viewModel.muhaRefList.ext.isNullOrEmpty) {
                      await viewModel.getMuhaRefList();
                    }
                    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context,
                        title: "Referans Kodu", children: viewModel.muhaRefList!.map((e) => BottomSheetModel(title: e.tanimi ?? "", description: e.kodu, value: e)).toList());
                    if (result is MuhasebeReferansModel) {
                      _referansKoduController.text = result.tanimi ?? "";
                      viewModel.setReferansKodu(result.kodu);
                    }
                  },
                ).yetkiVarMi(viewModel.showReferansKodu == true),
                CustomTextField(
                  labelText: "Kasa Hareketi Açıklama",
                  controller: _kasaHareketiAciklamaController,
                  onChanged: (value) => viewModel.setAciklama(value),
                ),
                CustomTextField(
                  labelText: "Cari Hareketi Açıklama",
                  controller: _cariHareketiAciklamaController,
                  onChanged: (value) => viewModel.setHedefAciklama(value),
                ),
              ]).paddingAll(UIHelper.lowSize);
            }),
          )),
    );
  }

  Future<void> getKasa() async {
    final KasaList? result = await bottomSheetDialogManager.showKasaBottomSheetDialog(context);
    if (result is KasaList) {
      viewModel.setKasa(result);
      _kasaController.text = result.kasaTanimi ?? "";
      _cariHareketiAciklamaController.text = "Nakit ${viewModel.formTipi} (${result.kasaKodu ?? ""})";
      if (result.dovizli == "E") {
        _dovizTipiController.text = result.dovizAdi ?? " ";
        viewModel.setHedefAciklama(_cariHareketiAciklamaController.text);
        viewModel.setDovizTipi(result.dovizli == "E" ? result.dovizTipi ?? 0 : null);
        _dovizTipiController.text = result.dovizli == "E" ? result.dovizAdi ?? mainCurrency : "";
        if (result.dovizAdi != null) {
          await getDovizDialog();
        }
      } else {
        if (viewModel.model.dovizTipi != null || viewModel.model.dovizTipi != 0) {
          viewModel.setDovizTipi(0);
          _dovizTipiController.text = mainCurrency;
          _dovizKuruController.text = "";
          _dovizTutariController.text = "";
        }
      }
    }
  }

  Future<void> getCari() async {
    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
    if (result is CariListesiModel) {
      viewModel.setShowReferansKodu(yetkiController.referansKodu(result.muhHesapTipi));
      _cariHareketiAciklamaController.text = result.cariAdi ?? "";
      _cariController.text = result.cariAdi ?? "";
      _kasaHareketiAciklamaController.text = "${result.cariAdi ?? ""} .KODU: ${result.cariKodu ?? ""}";
      viewModel.setAciklama(_kasaHareketiAciklamaController.text);
      viewModel.setHedefAciklama(result.cariAdi);
      viewModel.setHesapKodu(result.cariKodu);
      if (result.dovizli == true) {
        if (viewModel.kasa?.dovizli != "E") {
          viewModel.setDovizTipi(result.dovizKodu);
          _dovizTipiController.text = result.dovizAdi ?? "";
          await getDovizDialog();
        } else {
          if (viewModel.kasa?.dovizTipi != result.dovizKodu) {
            viewModel.setDovizTipi(result.dovizKodu);
            _dovizTipiController.text = result.dovizAdi ?? "";
            await getDovizDialog();
          }
        }
      }
      viewModel.setCariBakiye(result.bakiye);
    }
  }

  Future<void> getDovizDialog() async {
    await viewModel.getDovizler();
    if (viewModel.dovizKurlariListesi.ext.isNotNullOrEmpty) {
      _dovizKuruController.text = "";
      _dovizTutariController.text = "";
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Döviz Kuru", children: [
        BottomSheetModel(
            title: "Alış: ${viewModel.dovizKurlariListesi?.first.dovAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.dovAlis,
            iconWidget: Icons.calculate_outlined),
        BottomSheetModel(
            title: "Satış: ${viewModel.dovizKurlariListesi?.first.dovSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.dovSatis,
            iconWidget: Icons.calculate_outlined),
        BottomSheetModel(
            title: "Efektif Alış: ${viewModel.dovizKurlariListesi?.first.effAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.effAlis,
            iconWidget: Icons.calculate_outlined),
        BottomSheetModel(
            title: "Efektif Satış: ${viewModel.dovizKurlariListesi?.first.effSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.first.effSatis,
            iconWidget: Icons.calculate_outlined),
      ]);
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
    }
  }
}
