import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../../../core/base/model/tahsilat_request_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../../core/constants/enum/muhasebe_kodu_belge_tipi_enum.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../../stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../../banka/banka_listesi/model/banka_listesi_model.dart";
import "../../../../../banka/banka_listesi/model/banka_listesi_request_model.dart";
import "../../../model/dekont_islemler_request_model.dart";
import "../view_model/dekont_kalem_ekle_view_model.dart";

class DekontKalemEkleView extends StatefulWidget {
  final DekontKalemler? model;
  final BaseEditEnum baseEditEnum;
  const DekontKalemEkleView({super.key, this.model, required this.baseEditEnum});

  @override
  State<DekontKalemEkleView> createState() => _DekontKalemEkleViewState();
}

class _DekontKalemEkleViewState extends BaseState<DekontKalemEkleView> {
  late final DekontKalemEkleViewModel viewModel;
  late final TextEditingController _belgeNoController;
  late final TextEditingController _hesapController;
  late final TextEditingController _depoController;
  late final TextEditingController _dovizTipiController;
  late final TextEditingController _dovizKuruController;
  late final TextEditingController _dovizTutariController;
  late final TextEditingController _tutarController;
  late final TextEditingController _aciklamaController;
  late final TextEditingController _exportTipiController;
  late final TextEditingController _exportRefNoController;
  late final TextEditingController _plasiyerController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel = DekontKalemEkleViewModel(
      model: widget.model ??
          DekontKalemler(
            ba: "B",
            hesapTipi: "C",
            dovizTipiAdi: mainCurrency,
            dovizTipi: 0,
            plasiyerAdi: SingletonDekontIslemlerRequestModel.instance.plasiyerAdi,
            plasiyerKodu: SingletonDekontIslemlerRequestModel.instance.plasiyerKodu,
          ),
    );
    _depoController = TextEditingController(text: viewModel.model.depoAdi ?? "");
    _belgeNoController = TextEditingController(text: viewModel.model.belgeNo ?? "");
    _hesapController = TextEditingController(text: viewModel.model.kalemAdi ?? "");
    _dovizTipiController = TextEditingController(text: viewModel.model.dovizTipiAdi ?? mainCurrency);
    _dovizKuruController = TextEditingController(text: viewModel.model.dovizKuru.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    _dovizTutariController = TextEditingController(text: viewModel.model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    _tutarController = TextEditingController(text: viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "");
    _aciklamaController = TextEditingController(text: viewModel.model.aciklama ?? "");
    _exportTipiController = TextEditingController(text: viewModel.model.exportTipi != null && viewModel.model.exportTipi != 0 ? viewModel.exportTipiList[(viewModel.model.exportTipi ?? 1) - 1] : "");
    _exportRefNoController = TextEditingController(text: viewModel.model.exportRefno ?? "");
    _plasiyerController = TextEditingController(text: viewModel.model.plasiyerAdi ?? SingletonDekontIslemlerRequestModel.instance.plasiyerAdi ?? "");

    super.initState();
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, value) async {
          if (didPop) {
            return;
          }
          await dialogManager.showAreYouSureDialog(
            Get.back,
            title: "Çıkış Yapmak İstediğinize Emin Misiniz?",
          );
        },
        // onWillPop: () async {
        //   bool? result;
        //   await dialogManager.showAreYouSureDialog(
        //     () async {
        //       result = true;
        //     },
        //     title: "Çıkış Yapmak İstediğinize Emin Misiniz?",
        //   );
        //   return result ?? false;
        // },
        child: BaseScaffold(
          appBar: AppBar(
            title: const AppBarTitle(title: "Dekont Kalem Detayı"),
            actions: [
              IconButton(
                onPressed: () async {
                  if (_formKey.currentState?.validate() ?? false) {
                    Get.back(result: viewModel.model);
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
                  LayoutBuilder(
                    builder: (context, constraints) => Observer(
                      builder: (_) => ToggleButtons(
                        constraints: BoxConstraints.expand(width: (constraints.maxWidth - 5) / viewModel.selectedHesapTipi.length),
                        isSelected: viewModel.selectedHesapTipi,
                        onPressed: (index) {
                          if (widget.baseEditEnum != BaseEditEnum.ekle) {
                            return;
                          }
                          if (!viewModel.selectedHesapTipi[index]) {
                            _hesapController.clear();
                            viewModel.setHesapKodu(null);
                          }
                          viewModel.setHesapTipi(index);
                          if (!viewModel.model.stokMu) {
                            viewModel.setDepoKodu(null);
                            _depoController.clear();
                          }
                        },
                        children: List.generate(
                          viewModel.hesapTipiMap.values.length,
                          (index) => Text(viewModel.hesapTipiMap.keys.toList()[index]),
                        ),
                      ),
                    ),
                  ).paddingAll(UIHelper.lowSize),
                  LayoutBuilder(
                    builder: (context, constraints) => Observer(
                      builder: (_) => ToggleButtons(
                        constraints: BoxConstraints.expand(width: (constraints.maxWidth - 3) / 2),
                        isSelected: viewModel.selectedBorcTipi,
                        onPressed: viewModel.setBa,
                        children: List.generate(
                          viewModel.borcTipiMap.values.length,
                          (index) => Text(viewModel.borcTipiMap.keys.toList()[index]),
                        ),
                      ),
                    ),
                  ).paddingAll(UIHelper.lowSize),
                  CustomTextField(
                    labelText: "Belge No",
                    controller: _belgeNoController,
                    onChanged: viewModel.setBelgeNo,
                  ),
                  CustomTextField(
                    labelText: "Hesap",
                    controller: _hesapController,
                    isMust: true,
                    suffixMore: true,
                    readOnly: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.hesapKodu ?? "")),
                    onTap: setHesap,
                  ),
                  Observer(
                    builder: (_) => CustomTextField(
                      labelText: "Depo",
                      controller: _depoController,
                      isMust: true,
                      suffixMore: true,
                      readOnly: true,
                      valueWidget: Observer(builder: (_) => Text(viewModel.model.depoKodu.toStringIfNotNull ?? "")),
                      onTap: setDepo,
                    ).yetkiVarMi(viewModel.model.stokMu),
                  ),
                  Observer(
                    builder: (_) => Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Döviz Tipi",
                            controller: _dovizTipiController,
                            suffixMore: true,
                            readOnly: true,
                            valueWidget: Observer(builder: (_) => Text(viewModel.model.dovizTipi.toStringIfNotNull ?? "0")),
                            onTap: setDovizTipi,
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
                              viewModel..setDovizTutari(value.toDoubleWithFormattedString)
                              ..setTutar((viewModel.model.dovizTutari ?? 0) * (_dovizKuruController.text.toDoubleWithFormattedString));
                              _tutarController.text = viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                            },
                          ),
                        ).yetkiVarMi(viewModel.model.dovizliMi),
                      ],
                    ),
                  ),
                  Observer(
                    builder: (_) => Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Döviz Kuru",
                            controller: _dovizKuruController,
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
                  CustomTextField(
                    labelText: "Açıklama",
                    controller: _aciklamaController,
                    onChanged: viewModel.setAciklama,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Export Tipi",
                          controller: _exportTipiController,
                          suffixMore: true,
                          readOnly: true,
                          onClear: () {
                            viewModel.model.exportAdi = null;
                            viewModel.setExportTipi(null);
                          },
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.exportTipi.toStringIfNotNull ?? "")),
                          onTap: setExportTipi,
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Export Ref No",
                          controller: _exportRefNoController,
                          onChanged: viewModel.setExportRefNo,
                        ),
                      ),
                    ],
                  ),
                  CustomTextField(
                    labelText: "Plasiyer",
                    controller: _plasiyerController,
                    isMust: true,
                    suffixMore: true,
                    readOnly: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                    onTap: setPlasiyer,
                  ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                ],
              ).paddingAll(UIHelper.lowSize),
            ),
          ),
        ),
      );

  Future<void> setExportTipi() async {
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Export Tipi",
      groupValue: viewModel.model.exportTipi,
      children: List.generate(
        viewModel.exportTipiList.length,
        (index) => BottomSheetModel(title: viewModel.exportTipiList[index], description: (index + 1).toStringIfNotNull, value: index, groupValue: index + 1),
      ),
    );
    if (result != null) {
      viewModel.setExportTipi(result + 1);
      viewModel.model.exportAdi = viewModel.exportTipiList[result];
      _exportTipiController.text = viewModel.exportTipiList[result];
    }
  }

  Future<void> setDepo() async {
    final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, viewModel.model.depoKodu);
    if (result != null) {
      viewModel.setDepoKodu(result);
      _depoController.text = result.depoTanimi ?? "";
    }
  }

  Future<void> setHesap() async {
    String? hesapKodu;
    if (viewModel.model.cariMi) {
      final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
      if (result is CariListesiModel) {
        _hesapController.text = result.cariAdi ?? "";
        hesapKodu = result.cariKodu ?? "";
      }
    } else if (viewModel.model.muhasebeMi) {
      final result = await bottomSheetDialogManager.showMuhasebeMuhasebeKoduBottomSheetDialog(context, viewModel.model.hesapKodu, belgeTipi: MuhasebeBelgeTipiEnum.dekont.value, hesapTipi: "M");
      if (result != null) {
        _hesapController.text = result.hesapAdi ?? "";
        hesapKodu = result.hesapKodu ?? "";
        // if (viewModel.model.ba == "B") {
        // } else {
        //   hesapKodu = result.alisHesabi ?? "";
        // }
      }
    } else if (viewModel.model.bankaMi) {
      // final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(context, BankaListesiRequestModel(menuKodu: "YONE_BHRE"), viewModel.model.hesapKodu);
      final result = await Get.toNamed("/mainPage/bankaListesiOzel", arguments: BankaListesiRequestModel(menuKodu: "YONE_BHRE"));
      if (result is BankaListesiModel) {
        _hesapController.text = result.hesapAdi ?? "";
        hesapKodu = result.hesapKodu ?? "";
      }
    } else {
      final result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
      if (result is StokListesiModel) {
        _hesapController.text = result.stokAdi ?? "";
        hesapKodu = result.stokKodu ?? "";
      }
    }

    if (hesapKodu != null) {
      viewModel..setHesapKodu(hesapKodu)
      ..setKalemAdi(_hesapController.text);
    }
  }

  Future<void> setPlasiyer() async {
    final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
    if (result != null) {
      _plasiyerController.text = result.plasiyerAciklama ?? "";
      viewModel.setPlasiyerKodu(result);
    }
  }

  Future<void> setDovizTipi() async {
    final result = await bottomSheetDialogManager.showDovizBottomSheetDialog(context, viewModel.model.dovizTipi);
    if (result != null) {
      _dovizTipiController.text = result.isim ?? "";
      viewModel.setDovizTipi(result);
      if (viewModel.model.dovizliMi) {
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
}
