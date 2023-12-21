import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/enum/muhasebe_kodu_belge_tipi_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../view_model/cari_havale_eft_view_model.dart";

class CariHavaleEftView extends StatefulWidget {
  final CariListesiModel? cariListesiModel;
  const CariHavaleEftView({super.key, this.cariListesiModel});

  @override
  State<CariHavaleEftView> createState() => _CariHavaleEftViewState();
}

class _CariHavaleEftViewState extends BaseState<CariHavaleEftView> {
  final CariHavaleEftViewModel viewModel = CariHavaleEftViewModel();
  late final TextEditingController _tarihController;
  late final TextEditingController _dekontNoController;
  late final TextEditingController _hesapController;
  late final TextEditingController _cariController;
  late final TextEditingController _tcmbBankaKoduController;
  late final TextEditingController _tcmbSubeKoduController;
  late final TextEditingController _bankaHesapNoController;
  late final TextEditingController _ibanController;
  late final TextEditingController _dovizTipiController;
  late final TextEditingController _dovizTutariController;
  late final TextEditingController _dovizKuruController;
  late final TextEditingController _tutarController;
  late final TextEditingController _masrafTutariController;
  late final TextEditingController _bsmvController;
  late final TextEditingController _masrafMuhKoduController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projeController;
  late final TextEditingController _aciklamaController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel.setTarih(DateTime.now());
    viewModel.setGc(false);
    _tarihController = TextEditingController(text: viewModel.model.tarih.toDateStringIfNull);
    _dekontNoController = TextEditingController();
    _hesapController = TextEditingController();
    _cariController = TextEditingController();
    _tcmbBankaKoduController = TextEditingController();
    _tcmbSubeKoduController = TextEditingController();
    _bankaHesapNoController = TextEditingController();
    _ibanController = TextEditingController();
    _dovizTipiController = TextEditingController();
    _dovizTutariController = TextEditingController();
    _dovizKuruController = TextEditingController();
    _tutarController = TextEditingController();
    _masrafTutariController = TextEditingController();
    _bsmvController = TextEditingController();
    _masrafMuhKoduController = TextEditingController();
    _plasiyerController = TextEditingController();
    _projeController = TextEditingController();
    _aciklamaController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getHesapListesi();
      if (widget.cariListesiModel != null) {
        viewModel.setCariKodu(widget.cariListesiModel?.cariKodu);
        _cariController.text = widget.cariListesiModel?.cariAdi ?? "";
      } else {
        await getCari();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tarihController.dispose();
    _dekontNoController.dispose();
    _hesapController.dispose();
    _cariController.dispose();
    _tcmbBankaKoduController.dispose();
    _tcmbSubeKoduController.dispose();
    _bankaHesapNoController.dispose();
    _ibanController.dispose();
    _dovizTipiController.dispose();
    _dovizTutariController.dispose();
    _dovizKuruController.dispose();
    _tutarController.dispose();
    _masrafTutariController.dispose();
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
          title: const AppBarTitle(
            title: "Cari EFT/Havale",
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() == true) {
                  await dialogManager.showAreYouSureDialog(() async {
                    viewModel.model.guid = const Uuid().v4();
                    await viewModel.postData();
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
            child: Observer(
              builder: (_) => Column(
                children: [
                  Observer(
                    builder: (_) => SwitchListTile.adaptive(
                      contentPadding: EdgeInsets.zero,
                      title: const Text("Bankaya Para Girişi", style: TextStyle(fontWeight: FontWeight.bold)),
                      value: viewModel.model.cariyiBorclandir == false,
                      // ignore: unnecessary_lambdas
                      onChanged: (value) async {
                        viewModel.setGc(!value);
                        if (value) {
                          viewModel.setTCMBBankaKodu(null);
                          viewModel.setTCMBSubeKodu(null);
                          viewModel.setBankaHesapNo(null);
                          viewModel.setIBAN(null);
                        } else {
                          viewModel.setTCMBBankaKodu(_tcmbBankaKoduController.text);
                          viewModel.setTCMBSubeKodu(_tcmbSubeKoduController.text);
                          viewModel.setBankaHesapNo(_bankaHesapNoController.text);
                          viewModel.setIBAN(_ibanController.text);
                        }
                      },
                    ),
                  ).paddingAll(UIHelper.lowSize),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Tarih",
                          controller: _tarihController,
                          isMust: true,
                          readOnly: true,
                          isDateTime: true,
                          onTap: () async {
                            final result = await dialogManager.showDateTimePicker();
                            if (result != null) {
                              viewModel.setTarih(result);
                              _tarihController.text = viewModel.model.tarih?.toDateStringIfNull ?? "";
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Dekont No",
                          controller: _dekontNoController,
                          onChanged: viewModel.setDekontNo,
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    labelText: "Hesap",
                    controller: _hesapController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.hesapKodu ?? "")),
                    onTap: getHesapListesi,
                  ),
                  CustomTextField(
                    labelText: "Cari",
                    controller: _cariController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.cariKodu ?? "")),
                    onTap: () async => getCari(),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "TCMB Banka Kodu",
                          controller: _tcmbBankaKoduController,
                          onChanged: viewModel.setTCMBBankaKodu,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.tcmbBankaKodu ?? "")),
                          suffix: IconButton(
                            onPressed: () async {
                              final result = await bottomSheetDialogManager.showTcmbBankalarBottomSheetDialog(context, viewModel.model.tcmbBankaKodu);
                              if (result != null) {
                                _tcmbBankaKoduController.text = result.bankaadi ?? "";
                                viewModel.setTCMBBankaKodu(result.bankakodu);
                              }
                            },
                            icon: const Icon(Icons.more_horiz_outlined),
                          ),
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          labelText: "TCMB Şube Kodu",
                          controller: _tcmbSubeKoduController,
                          onChanged: viewModel.setTCMBSubeKodu,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.tcmbSubeKodu ?? "")),
                          suffix: IconButton(
                            onPressed: () async {
                              if (_tcmbBankaKoduController.text == "") {
                                dialogManager.showErrorSnackBar("TCMB Banka Kodu seçiniz.");
                                return;
                              }
                              final result = await bottomSheetDialogManager.showTcmbSubelerBottomSheetDialog(context, viewModel.model.tcmbBankaKodu, viewModel.model.tcmbSubeKodu);
                              if (result != null) {
                                _tcmbSubeKoduController.text = result.subeadi ?? "";
                                viewModel.setTCMBSubeKodu(result.subekodu);
                              }
                            },
                            icon: const Icon(Icons.more_horiz_outlined),
                          ),
                        ),
                      ),
                    ],
                  ).yetkiVarMi(viewModel.model.cariyiBorclandir ?? false),
                  CustomTextField(
                    labelText: "Banka Hesap No",
                    controller: _bankaHesapNoController,
                    onChanged: viewModel.setBankaHesapNo,
                  ).yetkiVarMi(viewModel.model.cariyiBorclandir ?? false),
                  CustomTextField(
                    labelText: "IBAN",
                    controller: _ibanController,
                    onChanged: viewModel.setIBAN,
                  ).yetkiVarMi(viewModel.model.cariyiBorclandir ?? false),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Döviz Tipi",
                          controller: _dovizTipiController,
                          isMust: true,
                          readOnly: true,
                          suffixMore: true,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.dovizTipi.toStringIfNotNull ?? "")),
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
                  ).yetkiVarMi(viewModel.model.dovizliMi),
                  Row(
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
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Masraf Tutarı",
                          controller: _masrafTutariController,
                          isFormattedString: true,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          labelText: "BSMV",
                          controller: _bsmvController,
                          isFormattedString: true,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (value) => viewModel.setBSMV(value.toDoubleWithFormattedString),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Masraf Muh. Kodu",
                          controller: _masrafMuhKoduController,
                          readOnly: true,
                          suffixMore: true,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.masrafMuhKodu ?? "")),
                          onTap: () async {
                            if (_masrafTutariController.text == "") {
                              dialogManager.showErrorSnackBar("Masraf tutarını giriniz.");
                              return;
                            }
                            final result = await bottomSheetDialogManager.showMuhasebeMuhasebeKoduBottomSheetDialog(
                              context,
                              viewModel.model.masrafMuhKodu,
                              hesapTipi: "M",
                              belgeTipi: MuhasebeBelgeTipiEnum.cariHavaleEft,
                            );
                            if (result != null) {
                              _masrafMuhKoduController.text = result.hesapAdi ?? "";
                              viewModel.setMasrafMuhKodu(result.hesapKodu);
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Plasiyer",
                          controller: _plasiyerController,
                          isMust: true,
                          readOnly: true,
                          suffixMore: true,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                          onTap: () async {
                            final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
                            if (result != null) {
                              _plasiyerController.text = result.plasiyerAciklama ?? "";
                              viewModel.setPlasiyerKodu(result.plasiyerKodu);
                            }
                          },
                        ),
                      ).yetkiVarMi(parametreModel.plasiyerUygulamasi ?? false),
                    ],
                  ),
                  CustomTextField(
                    labelText: "Proje",
                    controller: _projeController,
                    isMust: true,
                    readOnly: true,
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
                    labelText: "Açıklama",
                    controller: _aciklamaController,
                  ),
                ],
              ).paddingAll(UIHelper.lowSize),
            ),
          ),
        ),
      );

  Future<void> getCari() async {
    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
    if (result is CariListesiModel) {
      _cariController.text = result.cariAdi ?? "";
      _plasiyerController.text = result.plasiyerAciklama ?? "";
      _aciklamaController.text = "EFT/HAVALE - ${result.cariAdi ?? ""}";
      viewModel.setAciklama(_aciklamaController.text);
      viewModel.setPlasiyerKodu(result.plasiyerKodu);
      viewModel.setCariKodu(result.cariKodu);
      viewModel.setDovizTipi(result.dovizKodu);
      _dovizTipiController.text = result.dovizAdi ?? "";
      if (result.dovizli == true) {
        await getDovizDialog();
      }
    }
  }

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
            title: "Alış: ${viewModel.dovizKurlariListesi?.firstOrNull?.dovAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.firstOrNull?.dovAlis,
            iconWidget: Icons.calculate_outlined,
          ),
          BottomSheetModel(
            title: "Satış: ${viewModel.dovizKurlariListesi?.firstOrNull?.dovSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.firstOrNull?.dovSatis,
            iconWidget: Icons.calculate_outlined,
          ),
          BottomSheetModel(
            title: "Efektif Alış: ${viewModel.dovizKurlariListesi?.firstOrNull?.effAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.firstOrNull?.effAlis,
            iconWidget: Icons.calculate_outlined,
          ),
          BottomSheetModel(
            title: "Efektif Satış: ${viewModel.dovizKurlariListesi?.firstOrNull?.effSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.firstOrNull?.effSatis,
            iconWidget: Icons.calculate_outlined,
          ),
        ],
      );
      if (result is double) {
        _dovizKuruController.text = result.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati);
        if (_tutarController.text != "") {
          viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString);
          _dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari) ?? "";
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
      viewModel.setHesapNo(result);
    }
  }
}
