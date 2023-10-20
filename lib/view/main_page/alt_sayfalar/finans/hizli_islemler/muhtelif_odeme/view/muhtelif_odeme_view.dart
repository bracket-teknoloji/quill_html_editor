// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/model/muhasebe_referans_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/muhasebe_kodu_belge_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/hizli_islemler/muhtelif_odeme/view_model/muhtelif_odeme_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

class MuhtelifOdemeView extends StatefulWidget {
  final bool? tahsilatMi;
  const MuhtelifOdemeView({super.key, this.tahsilatMi});

  @override
  State<MuhtelifOdemeView> createState() => _MuhtelifOdemeViewState();
}

class _MuhtelifOdemeViewState extends BaseState<MuhtelifOdemeView> {
  MuhtelifOdemeViewModel viewModel = MuhtelifOdemeViewModel();
  late final TextEditingController _belgeNoController;
  late final TextEditingController _tarihController;
  late final TextEditingController _kasaController;
  late final TextEditingController _sozlesmeController;
  late final TextEditingController _seriController;
  late final TextEditingController _hesapController;
  late final TextEditingController _dovizTipiController;
  late final TextEditingController _dovizKuruController;
  late final TextEditingController _dovizTutariController;
  late final TextEditingController _tutarController;
  late final TextEditingController _krediKartiNoController;
  late final TextEditingController _referansKoduController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projekoduController;
  late final TextEditingController _aciklamaController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel.setTahsilatMi(widget.tahsilatMi);
    viewModel.setTarih(DateTime.now().dateTimeWithoutTime);
    _belgeNoController = TextEditingController();
    _tarihController = TextEditingController(text: viewModel.model.tarih.toDateString);
    _kasaController = TextEditingController();
    _sozlesmeController = TextEditingController();
    _seriController = TextEditingController();
    _hesapController = TextEditingController();
    _dovizTipiController = TextEditingController();
    _dovizKuruController = TextEditingController();
    _dovizTutariController = TextEditingController();
    _tutarController = TextEditingController();
    _krediKartiNoController = TextEditingController();
    _referansKoduController = TextEditingController();
    _plasiyerController = TextEditingController();
    _projekoduController = TextEditingController();
    _aciklamaController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      await getKasa();
      if (viewModel.model.dovizTipi != null) {
        await getDovizDialog();
      }
      await getMuhKodu();
      // await getSeri();

      // viewModel.setPickerBelgeTuru("KKT");
      await viewModel.getSiradakiKod();
      _belgeNoController.text = viewModel.model.belgeNo ?? "";
      _tarihController.text = viewModel.model.tarih.toDateString;
    });
    super.initState();
  }

  @override
  void dispose() {
    _belgeNoController.dispose();
    _tarihController.dispose();
    _kasaController.dispose();
    _sozlesmeController.dispose();
    _seriController.dispose();
    _hesapController.dispose();
    _dovizTipiController.dispose();
    _dovizKuruController.dispose();
    _dovizTutariController.dispose();
    _tutarController.dispose();
    _krediKartiNoController.dispose();
    _referansKoduController.dispose();
    _plasiyerController.dispose();
    _projekoduController.dispose();
    _aciklamaController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: body(context),
      );

  AppBar appBar() => AppBar(
        title: Observer(builder: (_) => AppBarTitle(title: "Muhtelif ${viewModel.model.tahsilatmi == true ? "Tahsilat" : "Ödeme"}")),
        actions: <Widget>[
          IconButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                viewModel.setAciklama(_aciklamaController.text);
                await dialogManager.showAreYouSureDialog(() async {
                  final GenericResponseModel<NetworkManagerMixin> result = await viewModel.postData();
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
      );

  SingleChildScrollView body(BuildContext context) => SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
            CustomTextField(
                labelText: "Belge No",
                controller: _belgeNoController,
                maxLength: 15,
                onChanged: (String value) => viewModel.setBelgeNo(value),
                suffix: IconButton(
                  onPressed: () async {
                    await viewModel.getSiradakiKod();
                    _belgeNoController.text = viewModel.model.belgeNo ?? "";
                  },
                  icon: const Icon(Icons.add_outlined),
                )),
            Observer(
                builder: (_) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            labelText: "Tarih",
                            controller: _tarihController,
                            isMust: true,
                            isDateTime: true,
                            readOnly: true,
                            onTap: () async {
                              final DateTime? result = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
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
                        ),
                      ],
                    )),
            Observer(
                builder: (_) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                              final DovizList? result = await bottomSheetDialogManager.showDovizBottomSheetDialog(context);
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
                              onChanged: (String value) {
                                if (_dovizKuruController.text != "") {
                                  viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString);
                                  _dovizTutariController.text = viewModel.model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar);
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
                    )),
            Observer(
                builder: (_) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            labelText: "Döviz Tutarı",
                            controller: _dovizTutariController,
                            isMust: true,
                            isFormattedString: true,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            onChanged: (String value) {
                              viewModel.setDovizTutari(value.toDoubleWithFormattedString);
                              viewModel.setTutar((viewModel.model.dovizTutari ?? 0) * (_dovizKuruController.text.toDoubleWithFormattedString));
                              _tutarController.text = viewModel.model.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar);
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
                            onChanged: (String value) {
                              viewModel.setTutar(value.toDoubleWithFormattedString);
                              if (_dovizKuruController.text != "") {
                                viewModel.setDovizTutari((viewModel.model.tutar ?? 0) / _dovizKuruController.text.toDoubleWithFormattedString);
                                _dovizTutariController.text = viewModel.model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar);
                              } else {
                                viewModel.setDovizTutari(null);
                                _dovizTutariController.text = "";
                              }
                            },
                          ),
                        ),
                      ],
                    )),
            Observer(
                builder: (_) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            labelText: "Plasiyer",
                            controller: _plasiyerController,
                            isMust: true,
                            readOnly: true,
                            suffixMore: true,
                            valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                            onTap: () async {
                              final PlasiyerList? result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context);
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
                              final BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context);
                              if (result is BaseProjeModel) {
                                _projekoduController.text = result.projeAdi ?? result.projeAciklama ?? "";
                                // viewModel.setPlasiyerKodu(result);
                                viewModel.setProjeKodu(result);
                              }
                            },
                          ),
                        ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
                      ],
                    )),
            Observer(
                builder: (_) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            labelText: "Muh. Kodu",
                            controller: _hesapController,
                            isMust: true,
                            readOnly: true,
                            suffixMore: true,
                            valueWidget: Observer(builder: (_) => Text(viewModel.model.hesapKodu ?? "")),
                            onTap: () async => await getMuhKodu(),
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
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
                                  title: "Referans Kodu", children: viewModel.muhaRefList!.map((MuhasebeReferansModel e) => BottomSheetModel(title: e.tanimi ?? "", value: e)).toList());
                              if (result is MuhasebeReferansModel) {
                                _referansKoduController.text = result.tanimi ?? "";
                                viewModel.setReferansKodu(result.kodu);
                              }
                            },
                          ),
                        ).yetkiVarMi(yetkiController.referansKodu(viewModel.showReferansKodu)),
                      ],
                    )),
            CustomTextField(
              labelText: "Kasa Har. Açıklama",
              controller: _aciklamaController,
              onChanged: (String value) => viewModel.setAciklama(value),
            ),
          ]).paddingAll(UIHelper.lowSize),
        ),
      );

  Future<void> getMuhKodu() async {
    final StokMuhasebeKoduModel? result = await bottomSheetDialogManager.showMuhasebeMuhasebeKoduBottomSheetDialog(context, belgeTipi: MuhasebeBelgeTipiEnum.muo, hesapTipi: viewModel.model.hesapTipi);
    if (result is StokMuhasebeKoduModel) {
      _hesapController.text = result.hesapAdi ?? result.hesapKodu ?? "";
      viewModel.setHesapTipi(result.agm);
      viewModel.setShowReferansKodu(result.hesapTipi);
      viewModel.setHesapKodu(result.hesapKodu);
    }
  }

  Future<void> getKasa() async {
    final KasaList? result = await bottomSheetDialogManager.showKasaBottomSheetDialog(context);
    if (result != null) {
      _kasaController.text = result.kasaTanimi ?? "";
      viewModel.setKasaKodu(result);
      if (result.dovizAdi != null) {
        _dovizTipiController.text = result.dovizAdi ?? mainCurrency;
        viewModel.setDovizTipi(result.dovizTipi);
      } else {
        _dovizTipiController.text = "";
        _dovizKuruController.text = "";
        _dovizTutariController.text = "";
        viewModel.setDovizTipi(null);
        viewModel.setDovizTutari(null);
      }
    }
  }

  Future<void> getDovizDialog() async {
    await viewModel.getDovizler();
    if (viewModel.dovizKurlariListesi.ext.isNotNullOrEmpty) {
      _dovizKuruController.text = "";
      _dovizTutariController.text = "";
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Döviz Kuru", children: <BottomSheetModel?>[
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
          _dovizTutariController.text = viewModel.model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar);
        } else if (_dovizTutariController.text != "") {
          viewModel.setTutar((viewModel.model.dovizTutari ?? 0) * (_dovizKuruController.text.toDoubleWithFormattedString));
          _tutarController.text = viewModel.model.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar);
        }
      }
    }
  }
}
