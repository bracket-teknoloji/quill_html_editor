import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../core/constants/enum/muhasebe_kodu_belge_tipi_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../banka_listesi/model/banka_listesi_model.dart";
import "../view_model/cari_havale_eft_view_model.dart";

final class CariHavaleEftView extends StatefulWidget {
  const CariHavaleEftView({super.key, this.cariListesiModel});
  final CariListesiModel? cariListesiModel;

  @override
  State<CariHavaleEftView> createState() => _CariHavaleEftViewState();
}

final class _CariHavaleEftViewState extends BaseState<CariHavaleEftView> {
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
  late final TextEditingController _referansKoduController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // viewModel.setGc(false);
    _tarihController = TextEditingController();
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
    _referansKoduController = TextEditingController();
    if (yetkiController.varsayilanMuhRefKodu case final muhRefKodu?) {
      viewModel.setReferansKodu(muhRefKodu.hesapKodu);
      _referansKoduController.text = muhRefKodu.hesapAdi ?? "";
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      viewModel.setTarih(await dialogManager.showDateTimePicker());
      _tarihController.text = viewModel.model.tarih.toDateString;
      if (widget.cariListesiModel != null) {
        viewModel
          ..setCariModel(
            await networkManager.getCariModel(
              CariRequestModel(kod: [widget.cariListesiModel?.cariKodu ?? ""], secildi: "E", belgeTuru: "DCE", plasiyerKisitiYok: true, eFaturaGoster: true),
            ),
          )
          ..setCariKodu(widget.cariListesiModel?.cariKodu)
          ..setPlasiyerKodu(widget.cariListesiModel?.plasiyerKodu)
          ..setDovizTipi(widget.cariListesiModel?.dovizKodu);
        _aciklamaController.text = "EFT/HAVALE - ${widget.cariListesiModel?.cariAdi ?? ""}";
        viewModel.setAciklama(_aciklamaController.text);
        _cariController.text = widget.cariListesiModel?.cariAdi ?? "";
        _plasiyerController.text = widget.cariListesiModel?.plasiyerAciklama ?? "";
      } else {
        await getCari();
      }
      await getHesapListesi();
      setGirisCikis(
        await bottomSheetDialogManager.showRadioBottomSheetDialog<int>(
              context,
              title: "Giriş/Çıkış seçiniz",
              groupValue: viewModel.model.cariyiBorclandir != true,
              children: [
                BottomSheetModel(title: "Bankaya Para Girişi", value: 0, groupValue: 0),
                BottomSheetModel(title: "Bankadan Para Çıkışı", value: 1, groupValue: 1),
              ],
            ) ??
            0,
      );
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
    _referansKoduController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "Cari EFT/Havale"),
      actions: [
        IconButton(
          onPressed: () async {
            if (_formKey.currentState?.validate() == true) {
              await dialogManager.showAreYouSureDialog(() async {
                viewModel.model.guid = const Uuid().v4();
                final result = await viewModel.postData();
                if (result.isSuccess) {
                  dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı.");
                  Get.back(result: result.isSuccess);
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
        child: Observer(
          builder:
              (_) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder:
                        (context, constraints) => Observer(
                          builder:
                              (_) => ToggleButtons(
                                constraints: BoxConstraints.expand(width: constraints.maxWidth / 2 - 2),
                                isSelected: [
                                  (viewModel.model.cariyiBorclandir == null),
                                  viewModel.model.cariyiBorclandir ?? false,
                                ],
                                onPressed: setGirisCikis,
                                children: const [Text("Bankaya Para Girişi"), Text("Bankadan Para Çıkışı")],
                              ),
                        ),
                  ).paddingAll(UIHelper.lowSize),
                  // Observer(
                  //   builder: (_) => SwitchListTile.adaptive(
                  //     contentPadding: EdgeInsets.zero,
                  //     title: const Text("Bankaya Para Girişi", style: TextStyle(fontWeight: FontWeight.bold)),
                  //     value: viewModel.model.cariyiBorclandir == false,
                  //     // ignore: unnecessary_lambdas
                  //     onChanged: (value) async {
                  //       viewModel.setGc(!value);
                  //       if (value) {
                  //         viewModel.setTCMBBankaKodu(null);
                  //         viewModel.setTCMBSubeKodu(null);
                  //         viewModel.setBankaHesapNo(null);
                  //         viewModel.setIBAN(null);
                  //       } else {
                  //         if (_tcmbBankaKoduController.text.isEmpty) {
                  //           _tcmbBankaKoduController.text = parametreModel.finansBankaTcmbBankaKodu ?? "";
                  //         }
                  //         viewModel.setTCMBBankaKodu(_tcmbBankaKoduController.text);
                  //         if (_tcmbSubeKoduController.text.isEmpty) {
                  //           _tcmbSubeKoduController.text = parametreModel.finansBankaTcmbSubeKodu ?? "";
                  //         }
                  //         viewModel.setTCMBSubeKodu(_tcmbSubeKoduController.text);
                  //         viewModel.setBankaHesapNo(_bankaHesapNoController.text);
                  //         viewModel.setIBAN(_ibanController.text);
                  //       }
                  //     },
                  //   ),
                  // ).paddingAll(UIHelper.lowSize),
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
                            final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.tarih);
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
                    suffix: IconButton(
                      onPressed: () {
                        if (viewModel.cariModel != null) {
                          dialogManager.showCariIslemleriGridViewDialog(viewModel.cariModel);
                        } else {
                          dialogManager.showInfoDialog("Cari kodu boş olduğu için bu işlem gerçekleştirilemiyor.");
                        }
                      },
                      icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                    ),
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.cariKodu ?? "")),
                    onTap: () async => getCari(),
                  ),
                  Observer(
                    builder:
                        (_) =>
                            viewModel.cariModel != null
                                ? Text(
                                  "Bakiye: ${viewModel.cariModel?.bakiye?.abs().commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? 0} ${viewModel.cariModel?.dovizAdi ?? mainCurrency} ${(viewModel.cariModel?.bakiye ?? 0) > 0
                                      ? "(Tahsil Edilecek)"
                                      : (viewModel.cariModel?.bakiye ?? 0) < 0
                                      ? "(Ödenecek)"
                                      : ""}",
                                  style: TextStyle(
                                    color:
                                        (viewModel.cariModel?.bakiye ?? 0) > 0
                                            ? ColorPalette.mantis
                                            : ColorPalette.persianRed,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ).paddingAll(UIHelper.lowSize)
                                : const SizedBox.shrink(),
                  ),
                  if (viewModel.model.cariyiBorclandir ?? false)
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "TCMB Banka Kodu",
                            controller: _tcmbBankaKoduController,
                            onClear: () => viewModel.setTCMBBankaKodu(null),
                            onChanged: viewModel.setTCMBBankaKodu,
                            // valueWidget: Observer(builder: (_) => Text(viewModel.model.tcmbBankaKodu ?? "")),
                            suffix: IconButton(
                              onPressed: () async {
                                final result = await bottomSheetDialogManager.showTcmbBankalarBottomSheetDialog(
                                  context,
                                  viewModel.model.tcmbBankaKodu,
                                );
                                if (result != null) {
                                  _tcmbBankaKoduController.text = result.bankakodu ?? "";
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
                            onClear: () => viewModel.setTCMBSubeKodu(null),
                            onChanged: viewModel.setTCMBSubeKodu,
                            // valueWidget: Observer(builder: (_) => Text(viewModel.model.tcmbSubeKodu ?? "")),
                            suffix: IconButton(
                              onPressed: () async {
                                if (_tcmbBankaKoduController.text == "") {
                                  dialogManager.showErrorSnackBar("TCMB Banka Kodu seçiniz.");
                                  return;
                                }
                                final result = await bottomSheetDialogManager.showTcmbSubelerBottomSheetDialog(
                                  context,
                                  viewModel.model.tcmbBankaKodu,
                                  viewModel.model.tcmbSubeKodu,
                                );
                                if (result != null) {
                                  _tcmbSubeKoduController.text = result.subekodu ?? "";
                                  viewModel.setTCMBSubeKodu(result.subekodu);
                                }
                              },
                              icon: const Icon(Icons.more_horiz_outlined),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (viewModel.model.cariyiBorclandir ?? false)
                    CustomTextField(
                      labelText: "Banka Hesap No",
                      controller: _bankaHesapNoController,
                      onChanged: viewModel.setBankaHesapNo,
                    ),
                  if (viewModel.model.cariyiBorclandir ?? false)
                    CustomTextField(labelText: "IBAN", controller: _ibanController, onChanged: viewModel.setIBAN),
                  Row(
                    children: [
                      if (viewModel.cariModel?.dovizli == true)
                        Expanded(
                          child: CustomTextField(
                            labelText: "Döviz Tipi",
                            controller: _dovizTipiController,
                            isMust: true,
                            readOnly: true,
                            suffixMore: true,
                            valueWidget: Observer(
                              builder: (_) => Text(viewModel.model.dovizTipi.toStringIfNotNull ?? ""),
                            ),
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showDovizBottomSheetDialog(
                                context,
                                viewModel.model.dovizTipi,
                              );
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
                      if (viewModel.model.dovizliMi)
                        Expanded(
                          child: CustomTextField(
                            labelText: "Döviz Tutarı",
                            controller: _dovizTutariController,
                            isMust: true,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            isFormattedString: true,
                            onChanged: (value) {
                              viewModel
                                ..setDovizTutari(value.toDoubleWithFormattedString)
                                ..setTutar(
                                  (viewModel.model.dovizTutari ?? 0) *
                                      (_dovizKuruController.text.toDoubleWithFormattedString),
                                );
                              _tutarController.text =
                                  viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                            },
                          ),
                        ),
                    ],
                  ),
                  Row(
                    children: [
                      if (viewModel.model.dovizliMi)
                        Expanded(
                          child: CustomTextField(
                            labelText: "Döviz Kuru",
                            controller: _dovizKuruController,
                            isMust: true,
                            isFormattedString: true,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            onChanged: (value) {
                              if (_dovizKuruController.text != "") {
                                viewModel.setDovizTutari(
                                  (viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString,
                                );
                                _dovizTutariController.text =
                                    viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ??
                                    "";
                              } else {
                                viewModel.setDovizTutari(null);
                                _dovizTutariController.clear();
                              }
                            },
                            suffix: IconButton(
                              onPressed: () async => await getDovizDialog(),
                              icon: const Icon(Icons.more_horiz_outlined),
                            ),
                          ),
                        ),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Tutar",
                          controller: _tutarController,
                          isMust: true,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          isFormattedString: true,
                          onChanged: (value) {
                            viewModel.setTutar(value.toDoubleWithFormattedString);
                            if (viewModel.model.dovizliMi) {
                              viewModel.setDovizTutari(
                                (viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString,
                              );
                              _dovizTutariController.text =
                                  viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                            } else {
                              viewModel.setDovizTutari(null);
                              _dovizTutariController.clear();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  if (parametreModel.finansBankaIslemModulu == "B")
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Masraf Tutarı",
                            controller: _masrafTutariController,
                            isFormattedString: true,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            onChanged: (value) => viewModel.setMasrafTutari(value.toDoubleWithFormattedString),
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
                      // Muhasebe entegre ve finans aktif
                    ),
                  Row(
                    children: [
                      if (yetkiController.referansKodu("B") ||
                          parametreModel.finansBankaIslemModulu == "B" && parametreModel.muhasebeEntegre == true)
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
                                belgeTipi: MuhasebeBelgeTipiEnum.cariHavaleEft.value,
                              );
                              if (result != null) {
                                _masrafMuhKoduController.text = result.hesapAdi ?? "";
                                viewModel.setMasrafMuhKodu(result.hesapKodu);
                              }
                            },
                          ),
                        ),
                      if (yetkiController.plasiyerUygulamasiAcikMi)
                        Expanded(
                          child: CustomTextField(
                            labelText: "Plasiyer",
                            controller: _plasiyerController,
                            isMust: true,
                            readOnly: true,
                            suffixMore: true,
                            valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
                                context,
                                viewModel.model.plasiyerKodu,
                              );
                              if (result != null) {
                                _plasiyerController.text = result.plasiyerAciklama ?? "";
                                viewModel.setPlasiyerKodu(result.plasiyerKodu);
                              }
                            },
                          ),
                        ),
                    ],
                  ),
                  if (yetkiController.projeUygulamasiAcikMi)
                    CustomTextField(
                      labelText: "Proje",
                      controller: _projeController,
                      isMust: true,
                      readOnly: true,
                      suffixMore: true,
                      valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                      onTap: () async {
                        final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(
                          context,
                          viewModel.model.projeKodu,
                        );
                        if (result != null) {
                          _projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
                          viewModel.setProjeKodu(result.projeKodu);
                        }
                      },
                    ),
                  CustomTextField(
                    labelText: "Açıklama",
                    controller: _aciklamaController,
                    onChanged: viewModel.setAciklama,
                  ),
                  Observer(
                    builder: (_) {
                      log("Cari Hesap Referans Kodu: ${viewModel.cariModel?.muhHesapTipi}");
                      log("Banka Hesap Referans Kodu: ${viewModel.bankaModel?.muhasebeHesapTipi}");
                      if ((yetkiController.referansKodu(viewModel.cariModel?.muhHesapTipi) ||
                              yetkiController.referansKodu(viewModel.bankaModel?.muhasebeHesapTipi) &&
                                  yetkiController.varsayilanMuhRefKodu == null) &&
                          !yetkiController.referansKoduSorulsun(false)) {
                        // if (viewModel.model.cariyiBorclandir ?? false)
                        // if (!yetkiController.referansKodu("") && !yetkiController.referansKoduSorulsun(false)) {

                        return CustomTextField(
                          labelText: "Referans Kodu",
                          controller: _referansKoduController,
                          isMust: true,
                          enabled: yetkiController.adminMi,
                          readOnly: true,
                          suffixMore: true,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.hedefHesapReferansKodu ?? "")),
                          onTap: () async {
                            final result = await bottomSheetDialogManager.showReferansKodBottomSheetDialog(
                              context,
                              viewModel.model.hedefHesapReferansKodu,
                            );
                            if (result != null) {
                              _referansKoduController.text = result.tanimi ?? "";
                              viewModel.setReferansKodu(result.kodu);
                            }
                          },
                        );
                      }
                      // if (viewModel.model.hedefHesapReferansKodu != null) viewModel.setReferansKodu(null);
                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ).paddingAll(UIHelper.lowSize),
        ),
      ),
    ),
  );

  void setGirisCikis(int value) {
    if (value == 0) {
      viewModel
        ..setGc(null)
        ..setTCMBBankaKodu(null)
        ..setTCMBSubeKodu(null)
        ..setBankaHesapNo(null)
        ..setIBAN(null);
    } else {
      if (_tcmbBankaKoduController.text.isEmpty) {
        _tcmbBankaKoduController.text = parametreModel.finansBankaTcmbBankaKodu ?? "";
      }
      viewModel.setTCMBBankaKodu(_tcmbBankaKoduController.text);
      if (_tcmbSubeKoduController.text.isEmpty) {
        _tcmbSubeKoduController.text = parametreModel.finansBankaTcmbSubeKodu ?? "";
      }
      viewModel
        ..setGc(true)
        ..setTCMBSubeKodu(_tcmbSubeKoduController.text)
        ..setBankaHesapNo(_bankaHesapNoController.text)
        ..setIBAN(_ibanController.text);
    }
  }

  Future<void> getCari() async {
    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
    if (result is CariListesiModel) {
      _cariController.text = result.cariAdi ?? "";
      _plasiyerController.text = result.plasiyerAciklama ?? "";
      _aciklamaController.text = "EFT/HAVALE - ${result.cariAdi ?? ""}";
      viewModel
        ..setCariModel(result)
        ..setAciklama(_aciklamaController.text)
        ..setPlasiyerKodu(result.plasiyerKodu)
        ..setCariKodu(result.cariKodu)
        ..setDovizTipi(result.dovizKodu);
      _dovizTipiController.text = result.dovizAdi ?? result.dovizKodu.toStringIfNotNull ?? "";
      if (result.dovizli == true) {
        await getDovizDialog();
      }
    }
  }

  Future<void> getDovizDialog() async {
    await viewModel.getDovizler();
    if (viewModel.dovizKurlariListesi.ext.isNotNullOrEmpty) {
      _dovizKuruController.clear();
      _dovizTutariController.clear();
      // ignore: use_build_context_synchronously
      final result = await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: "Döviz Kuru",
        children: [
          BottomSheetModel(
            title:
                "Alış: ${viewModel.dovizKurlariListesi?.firstOrNull?.dovAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.firstOrNull?.dovAlis,
            iconWidget: Icons.calculate_outlined,
          ),
          BottomSheetModel(
            title:
                "Satış: ${viewModel.dovizKurlariListesi?.firstOrNull?.dovSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.firstOrNull?.dovSatis,
            iconWidget: Icons.calculate_outlined,
          ),
          BottomSheetModel(
            title:
                "Efektif Alış: ${viewModel.dovizKurlariListesi?.firstOrNull?.effAlis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.firstOrNull?.effAlis,
            iconWidget: Icons.calculate_outlined,
          ),
          BottomSheetModel(
            title:
                "Efektif Satış: ${viewModel.dovizKurlariListesi?.firstOrNull?.effSatis.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? ""}",
            value: viewModel.dovizKurlariListesi?.firstOrNull?.effSatis,
            iconWidget: Icons.calculate_outlined,
          ),
        ],
      );
      if (result is double) {
        _dovizKuruController.text = result.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati);
        if (_tutarController.text != "") {
          viewModel.setDovizTutari(
            (viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString,
          );
          _dovizTutariController.text =
              viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari) ?? "";
        } else if (_dovizTutariController.text != "") {
          viewModel.setTutar(
            (viewModel.model.dovizTutari ?? 0) * (_dovizKuruController.text.toDoubleWithFormattedString),
          );
          _tutarController.text = viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        }
      }
    } else {
      _dovizKuruController.clear();
      _dovizTutariController.clear();
    }
  }

  Future<void> getHesapListesi() async {
    final result = await Get.toNamed("/mainPage/bankaListesiOzel", arguments: viewModel.bankaListesiRequestModel);
    if (result is BankaListesiModel) {
      _hesapController.text = result.hesapAdi ?? "";
      // _dovizTipiController.text = result.dovizAdi ?? "";
      viewModel.setHesapNo(result);
    }
  }
}
