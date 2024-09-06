// ignore_for_file: use_build_context_synchronously

import "dart:convert";
import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_image_compress/flutter_image_compress.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/muhasebe_referans_model.dart";
import "package:picker/core/base/model/tcmb_bankalar_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/cek_senet_listesi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/model/banka_listesi_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_tahsilati/model/save_cek_senet_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../view_model/cek_senet_tahsilat_ekle_view_model.dart";

class CekSenetTahsilatEkleView extends StatefulWidget {
  final CekSenetKalemlerModel? model;
  final CekSenetListesiEnum cekSenetListesiEnum;
  const CekSenetTahsilatEkleView({super.key, this.model, required this.cekSenetListesiEnum});

  @override
  State<CekSenetTahsilatEkleView> createState() => _CekSenetTahsilatEkleViewState();
}

class _CekSenetTahsilatEkleViewState extends BaseState<CekSenetTahsilatEkleView> {
  final CekSenetTahsilatEkleViewModel viewModel = CekSenetTahsilatEkleViewModel();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late final TextEditingController _bankaHesapKoduController;
  late final TextEditingController _asilBorcluController;
  late final TextEditingController _vadeTarihiController;
  late final TextEditingController _seriNoController;
  late final TextEditingController _dovizTipiController;
  late final TextEditingController _dovizTutariController;
  late final TextEditingController _dovizKuruController;
  late final TextEditingController _tutarController;
  late final TextEditingController _duzenlendigiYerController;
  late final TextEditingController _referansKoduController;
  late final TextEditingController _bankaController;
  late final TextEditingController _subeController;
  late final TextEditingController _hesapNoController;
  late final TextEditingController _ibanController;
  late final TextEditingController _ilController;
  late final TextEditingController _ilceController;
  late final TextEditingController _aciklama1Controller;
  late final TextEditingController _aciklama2Controller;
  late final TextEditingController _aciklama3Controller;
  late final TextEditingController _raporKoduController;
  late final TextEditingController _cariRaporKoduController;

  @override
  void initState() {
    viewModel.setDovizTipi(0);
    _bankaHesapKoduController = TextEditingController();
    _asilBorcluController = TextEditingController();
    _vadeTarihiController = TextEditingController();
    _seriNoController = TextEditingController();
    _dovizTipiController = TextEditingController(text: mainCurrency);
    _dovizTutariController = TextEditingController();
    _dovizKuruController = TextEditingController();
    _tutarController = TextEditingController();
    _duzenlendigiYerController = TextEditingController();
    _referansKoduController = TextEditingController();
    _bankaController = TextEditingController();
    _subeController = TextEditingController();
    _hesapNoController = TextEditingController();
    _ibanController = TextEditingController();
    _ilController = TextEditingController();
    _ilceController = TextEditingController();
    _aciklama1Controller = TextEditingController();
    _aciklama2Controller = TextEditingController();
    _aciklama3Controller = TextEditingController();
    _raporKoduController = TextEditingController();
    _cariRaporKoduController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model?.vadeTarihi != null) {
        await initModel();
      } else {
        await getTarih();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _bankaHesapKoduController.dispose();
    _asilBorcluController.dispose();
    _vadeTarihiController.dispose();
    _seriNoController.dispose();
    _dovizTipiController.dispose();
    _dovizTutariController.dispose();
    _dovizKuruController.dispose();
    _tutarController.dispose();
    _duzenlendigiYerController.dispose();
    _referansKoduController.dispose();
    _bankaController.dispose();
    _subeController.dispose();
    _hesapNoController.dispose();
    _ibanController.dispose();
    _ilController.dispose();
    _ilceController.dispose();
    _aciklama1Controller.dispose();
    _aciklama2Controller.dispose();
    _aciklama3Controller.dispose();
    _raporKoduController.dispose();
    _cariRaporKoduController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        body: body(context),
      );

  AppBar appBar() => AppBar(
        title: const AppBarTitle(title: "Tahsilat Ekle"),
        actions: [
          IconButton(
            onPressed: () async {
              if (_formKey.currentState?.validate() ?? false) {
                await dialogManager.showAreYouSureDialog(() {
                  Get.back(result: viewModel.model);
                });
              }
            },
            icon: const Icon(Icons.check_outlined),
          ),
        ],
      );

  SingleChildScrollView body(BuildContext context) => SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Observer(
                builder: (_) => SwitchListTile.adaptive(
                  value: viewModel.model.ciroMu,
                  onChanged: (value) {
                    viewModel.setCiroTipi(value ? "C" : "A");
                    if (!value) {
                      viewModel.setAsilCari(null);
                      _asilBorcluController.clear();
                    }
                  },
                  title: const Text("Ciro"),
                ).yetkiVarMi(!widget.cekSenetListesiEnum.borcMu),
              ),
              CustomTextField(
                labelText: "Banka Hesap Kodu",
                controller: _bankaHesapKoduController,
                readOnly: true,
                suffixMore: true,
                isMust: true,
                onTap: getBankaHesapKodu,
              ).yetkiVarMi(widget.cekSenetListesiEnum == CekSenetListesiEnum.cekBorc),
              Observer(
                builder: (_) => CustomTextField(
                  labelText: "Asıl Borçlu",
                  controller: _asilBorcluController,
                  onClear: () => viewModel.setAsilCari(null),
                  suffix: IconButton(
                    onPressed: () async {
                      await getAsilBorclu();
                    },
                    icon: const Icon(Icons.more_horiz_outlined),
                  ),
                  onChanged: viewModel.setAsilCari,
                ).yetkiVarMi(viewModel.model.ciroMu && widget.cekSenetListesiEnum.cekMi),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Vade Tarihi",
                      controller: _vadeTarihiController,
                      isDateTime: true,
                      readOnly: true,
                      isMust: true,
                      onTap: getTarih,
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Seri No",
                      controller: _seriNoController,
                      onChanged: viewModel.setSeriNo,
                    ),
                  ).yetkiVarMi(widget.cekSenetListesiEnum.cekMi),
                ],
              ),
              Observer(
                builder: (_) => Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Döviz Tipi",
                        controller: _dovizTipiController,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.dovizTipi.toStringIfNotNull ?? "")),
                        onTap: getDovizTipi,
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
                          viewModel.setDovizTutari(value.toDoubleWithFormattedString);
                          viewModel.setTutar((viewModel.model.dovizTutari ?? 0) * (_dovizKuruController.text.toDoubleWithFormattedString));
                          _tutarController.text = viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
                        },
                      ),
                    ).yetkiVarMi(viewModel.model.dovizliMi),
                  ],
                ).yetkiVarMi(widget.cekSenetListesiEnum != CekSenetListesiEnum.cekBorc),
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
                labelText: "Düzenlendiği Yer",
                controller: _duzenlendigiYerController,
                onChanged: viewModel.setDuzenlendigiYer,
              ).yetkiVarMi(!widget.cekSenetListesiEnum.cekMi),
              CustomTextField(
                labelText: "Referans Kodu",
                controller: _referansKoduController,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.refKod ?? "")),
                onTap: () async {
                  if (viewModel.muhaRefList.ext.isNullOrEmpty) {
                    await viewModel.getMuhaRefList();
                  }
                  final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                    context,
                    title: "Referans Kodu",
                    groupValue: viewModel.model.refKod,
                    children: viewModel.muhaRefList!
                        .map(
                          (e) => BottomSheetModel(
                            title: e.tanimi ?? "",
                            description: e.kodu,
                            value: e,
                            groupValue: e.kodu,
                          ),
                        )
                        .toList(),
                  );
                  if (result is MuhasebeReferansModel) {
                    _referansKoduController.text = result.tanimi ?? "";
                    viewModel.setReferans(result);
                  }
                },
              ).yetkiVarMi(widget.model?.refKodSorulsunMu ?? false),
              CustomTextField(
                labelText: "Banka",
                controller: _bankaController,
                readOnly: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.cekBanka ?? "")),
                onClear: () => viewModel.setBanka(null),
                onTap: getbanka,
              ).yetkiVarMi(widget.cekSenetListesiEnum.cekMi),
              CustomTextField(
                labelText: "Şube",
                controller: _subeController,
                readOnly: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.cekSube ?? "")),
                onClear: () => viewModel.setSube(null),
                onTap: getSube,
              ).yetkiVarMi(widget.cekSenetListesiEnum.cekMi),
              CustomTextField(
                labelText: "Hesap No",
                controller: _hesapNoController,
                onChanged: viewModel.setHesapNo,
              ).yetkiVarMi(widget.cekSenetListesiEnum.cekMi),
              CustomTextField(
                labelText: "IBAN",
                controller: _ibanController,
                onChanged: viewModel.setIBAN,
              ).yetkiVarMi(widget.cekSenetListesiEnum.cekMi),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "İl",
                      controller: _ilController,
                      onChanged: viewModel.setIl,
                    ),
                  ).yetkiVarMi(widget.cekSenetListesiEnum == CekSenetListesiEnum.cekMusteri),
                  Expanded(
                    child: CustomTextField(
                      labelText: "İlçe",
                      controller: _ilceController,
                      onChanged: viewModel.setIlce,
                    ),
                  ).yetkiVarMi(widget.cekSenetListesiEnum == CekSenetListesiEnum.cekMusteri),
                ],
              ),
              CustomTextField(
                labelText: "Açıklama 1",
                controller: _aciklama1Controller,
                onChanged: viewModel.setAciklama1,
              ).yetkiVarMi(widget.cekSenetListesiEnum != CekSenetListesiEnum.senetMusteri),
              CustomTextField(
                labelText: "Açıklama 2",
                controller: _aciklama2Controller,
                onChanged: viewModel.setAciklama2,
              ).yetkiVarMi(widget.cekSenetListesiEnum != CekSenetListesiEnum.senetMusteri),
              CustomTextField(
                labelText: "Açıklama 3",
                controller: _aciklama3Controller,
                onChanged: viewModel.setAciklama3,
              ).yetkiVarMi(widget.cekSenetListesiEnum != CekSenetListesiEnum.senetMusteri),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Rapor Kodu",
                      controller: _raporKoduController,
                      onChanged: viewModel.setRaporKodu,
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Cari Rapor Kodu",
                      controller: _cariRaporKoduController,
                      onChanged: viewModel.setCariRaporKodu,
                    ),
                  ),
                ],
              ),
              LayoutBuilder(
                builder: (context, constraints) => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text("Ön Taraf").paddingAll(UIHelper.lowSize),
                          InkWell(
                            onTap: () async => await takeImage(1),
                            child: Card(
                              child: SizedBox(
                                height: (constraints.maxWidth - UIHelper.midSize) / 2,
                                child: Observer(
                                  builder: (_) {
                                    if (viewModel.model.gorsel1 != null) {
                                      return Image.memory(base64Decode(viewModel.model.gorsel1!), fit: BoxFit.scaleDown);
                                    }
                                    return const Icon(Icons.camera_alt_outlined);
                                  },
                                ).paddingAll(UIHelper.lowSize),
                              ),
                            ),
                          ),
                        ],
                      ).paddingAll(UIHelper.lowSize),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Text("Arka Taraf").paddingAll(UIHelper.lowSize),
                          InkWell(
                            onTap: () async => await takeImage(2),
                            child: Card(
                              child: SizedBox(
                                height: (constraints.maxWidth - UIHelper.midSize) / 2,
                                child: Observer(
                                  builder: (_) {
                                    if (viewModel.model.gorsel2 != null) {
                                      return Image.memory(base64Decode(viewModel.model.gorsel2!), fit: BoxFit.scaleDown);
                                    }
                                    return const Icon(Icons.camera_alt_outlined);
                                  },
                                ).paddingAll(UIHelper.lowSize),
                              ),
                            ),
                          ),
                        ],
                      ).paddingAll(UIHelper.lowSize),
                    ),
                  ],
                ).paddingSymmetric(vertical: UIHelper.highSize * 2),
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );

  Future<void> getBankaHesapKodu() async {
    // final result = await bottomSheetDialogManager.showBankaHesaplariBottomSheetDialog(
    //   context,
    //   BankaListesiRequestModel(belgeTipi: widget.cekSenetListesiEnum.belgeTipi, menuKodu: "YONE_BHRE"),
    //   viewModel.model.verenKodu,
    // );
    final result = await Get.toNamed("/mainPage/bankaListesiOzel", arguments: BankaListesiRequestModel(belgeTipi: widget.cekSenetListesiEnum.belgeTipi, menuKodu: "YONE_BHRE"));
    if (result is BankaListesiModel) {
      _bankaHesapKoduController.text = result.hesapKodu ?? "";
      viewModel.setBankaHesapKodu(result.hesapKodu);
    }
  }

  Future<void> getTarih() async {
    final DateTime? result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.tarih);
    if (result != null) {
      _vadeTarihiController.text = result.toDateString;
      viewModel.setVadeTarihi(result);
    }
  }

  Future<void> getDovizTipi() async {
    final DovizList? result = await bottomSheetDialogManager.showDovizBottomSheetDialog(context, viewModel.model.dovizTipi);
    if (result != null) {
      _dovizTipiController.text = result.isim ?? "";
      viewModel.setDovizTipi(result.dovizKodu);
      if (viewModel.model.dovizliMi) {
        await getDovizDialog();
      }
    }
  }

  Future<void> getbanka() async {
    final TcmbBankalarModel? result = await bottomSheetDialogManager.showTcmbBankalarBottomSheetDialog(context, viewModel.model.cekBanka);
    if (result != null) {
      _bankaController.text = result.bankaadi ?? "";
      viewModel.setBanka(result.bankakodu);
      await getSube();
    }
  }

  Future<void> getSube() async {
    if (viewModel.model.cekBanka == null) {
      dialogManager.showInfoSnackBar("Lütfen önce banka seçiniz");
      return;
    }
    final TcmbBankalarModel? result = await bottomSheetDialogManager.showTcmbSubelerBottomSheetDialog(context, viewModel.model.cekBanka, viewModel.model.cekSube);
    if (result != null) {
      _subeController.text = result.subeadi ?? "";
      viewModel.setSube(result.subekodu);
    }
  }

  Future<void> getAsilBorclu() async {
    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
    if (result is CariListesiModel) {
      _asilBorcluController.text = result.cariAdi ?? "";
      viewModel.setAsilCari(result.cariAdi);
    }
  }

  Future<void> getDovizDialog() async {
    await viewModel.getDovizler();
    if (viewModel.dovizKurlariListesi.ext.isNotNullOrEmpty) {
      _dovizKuruController.clear();
      _dovizTutariController.clear();
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

  Future<void> takeImage(int index) async {
    if ((index == 1 && viewModel.model.gorsel1 != null) || (index == 2 && viewModel.model.gorsel2 != null)) {
      return await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: "Kaynak tipi",
        children: [
          BottomSheetModel(
            title: loc.generalStrings.edit,
            iconWidget: Icons.photo_library_outlined,
            onTap: () async {
              Get.back();
              if (index == 1) {
                viewModel.setPhotoFront(null);
              } else {
                viewModel.setPhotoBack(null);
              }
              await takeImage(index);
            },
          ),
          BottomSheetModel(
            title: loc.generalStrings.delete,
            iconWidget: Icons.camera_alt_outlined,
            onTap: () {
              Get.back();
              if (index == 1) {
                viewModel.setPhotoFront(null);
              } else {
                viewModel.setPhotoBack(null);
              }
              dialogManager.showInfoSnackBar("Fotoğraf silindi");
            },
          ),
        ],
      );
    } else {
      final sourceType = await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: "Kaynak tipi",
        children: [
          BottomSheetModel(title: "Galeri", iconWidget: Icons.photo_library_outlined, onTap: () => Get.back(result: ImageSource.gallery)),
          BottomSheetModel(title: "Kamera", iconWidget: Icons.camera_alt_outlined, onTap: () => Get.back(result: ImageSource.camera)),
        ],
      );
      //image picker
      if (sourceType != null) {
        final ImagePicker picker = ImagePicker();
        final XFile? result = await picker.pickImage(source: sourceType, imageQuality: 30, maxHeight: 1024, maxWidth: 768);
        if (result != null) {
          Uint8List? compressedImage;
          compressedImage = await FlutterImageCompress.compressWithFile(
            result.path,
            format: CompressFormat.png,
            keepExif: true,
            numberOfRetries: 10,
            quality: 30,
            autoCorrectionAngle: true,
          );
          if (compressedImage != null) {
            if (index == 1) {
              viewModel.setPhotoFront(base64Encode(compressedImage));
            } else {
              viewModel.setPhotoBack(base64Encode(compressedImage));
            }
          }
        }
      }
    }
  }

  Future<void> initModel() async {
    viewModel.setModel(widget.model!);
    _bankaHesapKoduController.text = viewModel.model.verenKodu ?? "";
    _asilBorcluController.text = viewModel.model.asilCari ?? "";
    _vadeTarihiController.text = viewModel.model.vadeTarihi?.toDateString ?? "";
    _dovizTipiController.text = viewModel.model.dovizTipi.toStringIfNotNull ?? mainCurrency;
    _dovizTutariController.text = viewModel.model.dovizTutari?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
    _dovizKuruController.text = viewModel.model.dovizKuru?.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? "";
    _tutarController.text = viewModel.model.tutar?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
    _referansKoduController.text = viewModel.model.refKod ?? "";
    _bankaController.text = viewModel.model.cekBanka ?? "";
    _subeController.text = viewModel.model.cekSube ?? "";
    _hesapNoController.text = viewModel.model.hesapNo ?? "";
    _ibanController.text = viewModel.model.ibanNo ?? "";
    _ilController.text = viewModel.model.sehir ?? "";
    _ilceController.text = viewModel.model.ilce ?? "";
    _raporKoduController.text = viewModel.model.raporKodu ?? "";
    _cariRaporKoduController.text = viewModel.model.cariRaporKodu ?? "";
    _seriNoController.text = viewModel.model.seriNo ?? "";
    _asilBorcluController.text = viewModel.model.asilCari ?? "";
    if (viewModel.model.dovizliMi) {
      await getDovizDialog();
    }
  }
}
