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
import "../../../../../../../core/constants/enum/hesaplar_arasi_enum.dart";
import "../../../../../../../core/constants/enum/muhasebe_kodu_belge_tipi_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../banka_listesi/model/banka_listesi_model.dart";
import "../view_model/hesaplar_arasi_islem_view_model.dart";

final class HesaplarArasiIslemView extends StatefulWidget {
  const HesaplarArasiIslemView({required this.hesaplarArasiEnum, super.key});
  final HesaplarArasiEnum hesaplarArasiEnum;

  @override
  State<HesaplarArasiIslemView> createState() => _HesaplarArasiIslemViewState();
}

final class _HesaplarArasiIslemViewState extends BaseState<HesaplarArasiIslemView> {
  late final HesaplarArasiIslemViewModel viewModel;
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
    viewModel = HesaplarArasiIslemViewModel();
    viewModel
      ..changeBelgeTipi(widget.hesaplarArasiEnum)
      ..setTarih(DateTime.now());
    _tarihController = TextEditingController(text: DateTime.now().toDateString);
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

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getCikisHesapListesi();
    });
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
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: AppBarTitle(title: "Hesaplar Arası ${widget.hesaplarArasiEnum.name}"),
      actions: [
        IconButton(
          onPressed: () async {
            if (_formKey.currentState!.validate()) {
              await dialogManager.showAreYouSureDialog(() async {
                if (viewModel.model.tutar case (null || 0.0)) {
                  dialogManager.showErrorSnackBar("Tutar boş bırakılamaz!");
                  return;
                }
                viewModel.setGuid(const Uuid().v4());
                final result = await viewModel.saveTahsilat();
                if (result.isSuccess) {
                  dialogManager.showSuccessSnackBar(result.message ?? "");
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
                Expanded(child: CustomTextField(labelText: "Tarih", controller: _tarihController, isDateTime: true, isMust: true, readOnly: true, onTap: () async => await getTarih())),
                Expanded(child: CustomTextField(labelText: "Dekont No", controller: _dekontNoController)),
              ],
            ),
            CustomTextField(
              labelText: "Çıkış Hesabı",
              controller: _cikisHesabiController,
              isMust: true,
              readOnly: true,
              suffixMore: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.model.hesapKodu ?? "")),
              onTap: () async => await getCikisHesapListesi(),
            ),
            CustomTextField(
              labelText: "Giriş Hesabı",
              controller: _girisHesabiController,
              isMust: true,
              readOnly: true,
              suffixMore: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.model.hedefHesapKodu ?? "")),
              onTap: () async => await getGirisHesapListesi(),
            ),
            Observer(
              builder:
                  (_) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (viewModel.model.dovizliMi || viewModel.bankaDovizliMi)
                        Expanded(
                          child: CustomTextField(
                            labelText: "Döviz Tipi",
                            controller: _dovizTipiController,
                            isMust: true,
                            readOnly: true,
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
                              if (value == "") {
                                _dovizTutariController.text = "0";
                                _tutarController.text = "0";
                                viewModel
                                  ..setDovizTutari(0)
                                  ..setTutar(0);
                                return;
                              }
                              viewModel
                                ..setDovizTutari(value.toDoubleWithFormattedString)
                                ..setTutar((viewModel.model.dovizTutari ?? 0) * (_dovizKuruController.text.toDoubleWithFormattedString));
                              _tutarController.text = viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                            },
                          ),
                        ),
                    ],
                  ),
            ),
            Observer(
              builder:
                  (_) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString);
                                _dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                              } else {
                                viewModel.setDovizTutari(null);
                                _dovizTutariController.clear();
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
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          isFormattedString: true,
                          onChanged: (value) {
                            viewModel.setTutar(value.toDoubleWithFormattedString);
                            if (viewModel.model.dovizliMi) {
                              viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString);
                              _dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                            } else {
                              viewModel.setDovizTutari(null);
                              _dovizTutariController.clear();
                            }
                          },
                        ),
                      ),
                    ],
                  ),
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
            if (yetkiController.plasiyerUygulamasiAcikMi)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Masraf Muh. Kodu",
                      controller: _masrafMuhKoduController,
                      readOnly: true,
                      suffixMore: true,
                      valueWidget: Observer(builder: (_) => Text(viewModel.model.masrafMuhKodu ?? "")),
                      onTap: () async {
                        if (_masrafController.text == "") {
                          dialogManager.showErrorSnackBar("Masraf tutarını giriniz.");
                          return;
                        }
                        final result = await bottomSheetDialogManager.showMuhasebeMuhasebeKoduBottomSheetDialog(
                          context,
                          viewModel.model.masrafMuhKodu,
                          hesapTipi: "M",
                          belgeTipi: widget.hesaplarArasiEnum == HesaplarArasiEnum.eftHavale ? MuhasebeBelgeTipiEnum.hesaplarArasiEft.value : MuhasebeBelgeTipiEnum.hesaplarArasiVirman.value,
                        );
                        if (result != null) {
                          _masrafMuhKoduController.text = result.hesapAdi ?? "";
                          viewModel.setMasrafMuhKodu(result.muhKodu.toStringIfNotNull);
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
                  ),
                ],
              ),
            if (yetkiController.projeUygulamasiAcikMi)
              CustomTextField(
                labelText: "Proje",
                controller: _projeController,
                isMust: true,
                suffixMore: true,
                readOnly: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                onTap: () async {
                  final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
                  if (result != null) {
                    _projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
                    viewModel.setProjeKodu(result.projeKodu);
                  }
                },
              ),
            CustomTextField(labelText: "Açıklama", controller: _aciklamaController, onChanged: (value) => viewModel.setAciklama(value)),
          ],
        ).paddingAll(UIHelper.lowSize),
      ),
    ),
  );

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
          _dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        } else if (_dovizTutariController.text != "") {
          viewModel.setTutar((viewModel.model.dovizTutari ?? 0) * (_dovizKuruController.text.toDoubleWithFormattedString));
          _tutarController.text = viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
        }
      }
    } else {
      _dovizKuruController.clear();
      _dovizTutariController.clear();
    }
  }

  Future<void> getCikisHesapListesi() async {
    // final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(context, viewModel.cikisBankaListesiRequestModel, viewModel.model.hesapKodu);
    final result = await Get.toNamed("/mainPage/bankaListesiOzel", arguments: viewModel.cikisBankaListesiRequestModel);
    if (result is BankaListesiModel) {
      // if (result != null) {
      _cikisHesabiController.text = result.hesapAdi ?? "";
      viewModel
        ..setCikisHesabi(result)
        ..setDovizTipi(result.dovizTipi);
      _dovizTipiController.text = result.dovizAdi ?? "";
      await getGirisHesapListesi();
    }
  }

  Future<void> getGirisHesapListesi() async {
    if (viewModel.model.hesapKodu == null) {
      dialogManager.showErrorSnackBar("Çıkış hesabını seçiniz.");
      return;
    }
    // final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(context, viewModel.girisBankaListesiRequestModel, viewModel.model.hedefHesapKodu);
    final result = await Get.toNamed("/mainPage/bankaListesiOzel", arguments: viewModel.girisBankaListesiRequestModel);
    if (result is BankaListesiModel) {
      _girisHesabiController.text = result.hesapAdi ?? "";
      viewModel.setGirisHesabi(result);
      if (!viewModel.model.dovizliMi) {
        viewModel.setDovizTipi(result.dovizTipi);
        _dovizTipiController.text = result.dovizAdi ?? "";
      }
      await getDovizDialog();
    }
  }

  Future<void> getTarih() async {
    final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.tarih);
    if (result != null) {
      viewModel.setTarih(result);
      _tarihController.text = result.toDateString;
    }
  }
}
