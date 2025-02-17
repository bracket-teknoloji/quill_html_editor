import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/banka_muhtelif_islemler_enum.dart";
import "../../../../../../../../core/constants/enum/muhasebe_kodu_belge_tipi_enum.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../banka_listesi/model/banka_listesi_model.dart";
import "../../view_model/banka_muhtelif_islemler_view_model.dart";

final class BankaMuhtelifIslemlerView extends StatefulWidget {
  const BankaMuhtelifIslemlerView({required this.bankaMuhtelifIslemlerEnum, super.key});
  final BankaMuhtelifIslemlerEnum bankaMuhtelifIslemlerEnum;

  @override
  State<BankaMuhtelifIslemlerView> createState() => _BankaMuhtelifIslemlerViewState();
}

final class _BankaMuhtelifIslemlerViewState extends BaseState<BankaMuhtelifIslemlerView> {
  final BankaMuhtelifIslemlerViewModel viewModel = BankaMuhtelifIslemlerViewModel();
  late final TextEditingController _tarihController;
  late final TextEditingController _seriController;
  late final TextEditingController _hesapController;
  late final TextEditingController _muhasebeKoduController;
  late final TextEditingController _dovizTipiController;
  late final TextEditingController _dovizTutariController;
  late final TextEditingController _dovizKuruController;
  late final TextEditingController _tutarController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projeController;
  late final TextEditingController _aciklamaController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel
      ..setTarih(DateTime.now().dateTimeWithoutTime)
      ..setBelgeTuru(widget.bankaMuhtelifIslemlerEnum.belgeTuru);
    _tarihController = TextEditingController(text: DateTime.now().toDateString);
    _seriController = TextEditingController();
    _hesapController = TextEditingController();
    _muhasebeKoduController = TextEditingController();
    _dovizTipiController = TextEditingController();
    _dovizTutariController = TextEditingController();
    _dovizKuruController = TextEditingController();
    _tutarController = TextEditingController();
    _plasiyerController = TextEditingController();
    _projeController = TextEditingController();
    _aciklamaController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getSeri();
      await getHesapListesi();
      await getMuhasebeKodu();
    });
    super.initState();
  }

  @override
  void dispose() {
    _tarihController.dispose();
    _seriController.dispose();
    _hesapController.dispose();
    _muhasebeKoduController.dispose();
    _dovizTipiController.dispose();
    _dovizTutariController.dispose();
    _dovizKuruController.dispose();
    _tutarController.dispose();
    _plasiyerController.dispose();
    _projeController.dispose();
    _aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(appBar: appBar(), body: body(context));

  AppBar appBar() => AppBar(
    title: Text(widget.bankaMuhtelifIslemlerEnum.title),
    actions: [
      IconButton(
        onPressed: () async {
          if (_formKey.currentState?.validate() ?? false) {
            dialogManager.showAreYouSureDialog(() async {
              viewModel.model.guid = const Uuid().v4();
              final result = await viewModel.postData();
              if (result.isSuccess) {
                Get.back();
              }
            });
          }
        },
        icon: const Icon(Icons.save_outlined),
      ),
    ],
  );

  Widget body(BuildContext context) => SingleChildScrollView(
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
                  readOnly: true,
                  isMust: true,
                  onTap: () async {
                    final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.tarih);
                    if (result is DateTime) {
                      viewModel.setTarih(result);
                      _tarihController.text = viewModel.model.tarih?.toDateString ?? "";
                    }
                  },
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Seri",
                  controller: _seriController,
                  suffixMore: true,
                  readOnly: true,
                  isMust: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.dekontSeri ?? "")),
                  onTap: getSeri,
                ),
              ),
            ],
          ),
          CustomTextField(
            labelText: "Hesap",
            controller: _hesapController,
            suffixMore: true,
            readOnly: true,
            isMust: true,
            valueWidget: Observer(builder: (_) => Text(viewModel.model.hesapKodu ?? "")),
            onTap: getHesapListesi,
          ),
          CustomTextField(
            labelText: "Muhasebe Kodu",
            controller: _muhasebeKoduController,
            suffixMore: true,
            readOnly: true,
            isMust: true,
            valueWidget: Observer(builder: (_) => Text(viewModel.model.hedefHesapKodu ?? "")),
            onTap: getMuhasebeKodu,
          ),
          Observer(
            builder:
                (_) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (viewModel.model.dovizliMi) ...[
                      Expanded(
                        child: CustomTextField(
                          labelText: "Döviz Tipi",
                          controller: _dovizTipiController,
                          suffixMore: true,
                          readOnly: true,
                          isMust: true,
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
                          labelText: "Kur",
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
                                  viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
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
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (yetkiController.plasiyerUygulamasiAcikMi)
                Expanded(
                  child: CustomTextField(
                    labelText: "Plasiyer",
                    controller: _plasiyerController,
                    suffixMore: true,
                    readOnly: true,
                    isMust: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
                        context,
                        viewModel.model.plasiyerKodu,
                      );
                      if (result != null) {
                        viewModel.setPlasiyerKodu(result.plasiyerKodu);
                        _plasiyerController.text = result.plasiyerAciklama ?? "";
                      }
                    },
                  ),
                ),
              if (yetkiController.projeUygulamasiAcikMi)
                Expanded(
                  child: CustomTextField(
                    labelText: "Proje",
                    controller: _projeController,
                    suffixMore: true,
                    readOnly: true,
                    isMust: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(
                        context,
                        viewModel.model.projeKodu,
                      );
                      if (result != null) {
                        viewModel.setProjeKodu(result.projeKodu);
                        _projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
                      }
                    },
                  ),
                ),
            ],
          ),
          CustomTextField(labelText: "Açıklama", controller: _aciklamaController, onChanged: viewModel.setAciklama),
        ],
      ).paddingAll(UIHelper.lowSize),
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
    // final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(context, viewModel.bankaListesiRequestModel, viewModel.model.hesapKodu);
    final result = await Get.toNamed("/mainPage/bankaListesiOzel", arguments: viewModel.bankaListesiRequestModel);
    if (result is BankaListesiModel) {
      _hesapController.text = result.hesapAdi ?? "";
      _dovizTipiController.text = result.dovizAdi ?? "";
      viewModel
        ..setHesapNo(result.hesapKodu)
        ..setDovizTipi(result.dovizTipi);
      if (result.dovizAdi != null) {
        await getDovizDialog();
      } else {
        viewModel.setDovizTutari(null);
        _dovizTutariController.clear();
        _dovizKuruController.clear();
      }
    }
  }

  Future<void> getMuhasebeKodu() async {
    final result = await bottomSheetDialogManager.showMuhasebeMuhasebeKoduBottomSheetDialog(
      context,
      viewModel.model.hedefHesapKodu,
      hesapTipi: "M",
      belgeTipi: MuhasebeBelgeTipiEnum.hesaplarArasiVirman.value,
    );
    if (result != null) {
      viewModel.setMuhasebeKodu(result.hesapKodu);
      _muhasebeKoduController.text = result.hesapAdi ?? "";
    }
  }

  Future<void> getSeri() async {
    if (viewModel.seriList.ext.isNullOrEmpty) {
      await viewModel.getSeri();
    }
    if (viewModel.seriList.ext.isNotNullOrEmpty) {
      // ignore: use_build_context_synchronously
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
        context,
        title: "Seri",
        groupValue: viewModel.model.dekontSeri,
        children:
            viewModel.seriList!
                .map(
                  (e) =>
                      BottomSheetModel(title: e.aciklama ?? "", description: e.seriNo, value: e, groupValue: e.seriNo),
                )
                .toList(),
      );
      if (result != null) {
        _seriController.text = result.aciklama ?? "";
        viewModel.setSeriNo(result.seriNo);
      }
    }
  }
}
