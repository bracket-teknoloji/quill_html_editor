// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/e_irsaliye_ek_bilgiler/model/e_irsaliye_bilgi_model.dart";
import "package:picker/core/base/view/e_irsaliye_ek_bilgiler/view_model/e_irsaliye_ek_bilgiler_view_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";

class EIrsaliyeEkBilgilerView extends StatefulWidget {
  final EIrsaliyeBilgiModel? model;
  const EIrsaliyeEkBilgilerView({super.key, this.model});

  @override
  State<EIrsaliyeEkBilgilerView> createState() => _EIrsaliyeEkBilgilerViewState();
}

class _EIrsaliyeEkBilgilerViewState extends BaseState<EIrsaliyeEkBilgilerView> {
  final EIrsaliyeEkBilgilerViewModel viewModel = EIrsaliyeEkBilgilerViewModel();
  late final TextEditingController _plakaController;
  late final TextEditingController _sevkTarihiController;
  late final TextEditingController _sevkSaatiController;
  late final TextEditingController _unvanController;
  late final TextEditingController _vergiNoController;
  late final TextEditingController _ilController;
  late final TextEditingController _ilceController;
  late final TextEditingController _ulkeController;
  late final TextEditingController _postaKoduController;
  late final TextEditingController _soforAdi1Controller;
  late final TextEditingController _soforSoyadi1Controller;
  late final TextEditingController _soforAciklama1Controller;
  late final TextEditingController _soforTc1Controller;
  late final TextEditingController _soforAdi2Controller;
  late final TextEditingController _soforSoyadi2Controller;
  late final TextEditingController _soforAciklama2Controller;
  late final TextEditingController _soforTc2Controller;
  late final TextEditingController _soforAdi3Controller;
  late final TextEditingController _soforSoyadi3Controller;
  late final TextEditingController _soforAciklama3Controller;
  late final TextEditingController _soforTc3Controller;
  late final TextEditingController _plaka1Controller;
  late final TextEditingController _plaka2Controller;
  late final TextEditingController _plaka3Controller;
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    if (widget.model != null) {
      viewModel.setModel(widget.model!);
    } else {
      viewModel.setSevkTarihi(DateTime.now());
      viewModel.setSevkSaati(TimeOfDay.now());
    }
    _plakaController = TextEditingController(text: viewModel.model.plaka ?? "");
    _sevkTarihiController = TextEditingController(text: viewModel.model.sevktar?.toDateString ?? "");
    _sevkSaatiController = TextEditingController(text: viewModel.model.sevktar?.toTimeOfDay?.toTimeString ?? "");
    _unvanController = TextEditingController(text: viewModel.model.tasiyiciUnvan ?? "");
    _vergiNoController = TextEditingController(text: viewModel.model.tasiyiciVkn ?? "");
    _ilController = TextEditingController(text: viewModel.model.tasiyiciIl ?? "");
    _ilceController = TextEditingController(text: viewModel.model.tasiyiciIlce ?? "");
    _ulkeController = TextEditingController(text: viewModel.model.tasiyiciUlke ?? "");
    _postaKoduController = TextEditingController(text: viewModel.model.tasiyiciPostakodu ?? "");
    _soforAdi1Controller = TextEditingController(text: viewModel.model.sofor1Adi ?? "");
    _soforSoyadi1Controller = TextEditingController(text: viewModel.model.sofor1Soyadi ?? "");
    _soforAciklama1Controller = TextEditingController(text: viewModel.model.sofor1Aciklama ?? "");
    _soforTc1Controller = TextEditingController(text: viewModel.model.sofor1KimlikNo ?? "");
    _soforAdi2Controller = TextEditingController(text: viewModel.model.sofor2Adi ?? "");
    _soforSoyadi2Controller = TextEditingController(text: viewModel.model.sofor2Soyadi ?? "");
    _soforAciklama2Controller = TextEditingController(text: viewModel.model.sofor2Aciklama ?? "");
    _soforTc2Controller = TextEditingController(text: viewModel.model.sofor2KimlikNo ?? "");
    _soforAdi3Controller = TextEditingController(text: viewModel.model.sofor3Adi ?? "");
    _soforSoyadi3Controller = TextEditingController(text: viewModel.model.sofor3Soyadi ?? "");
    _soforAciklama3Controller = TextEditingController(text: viewModel.model.sofor3Aciklama ?? "");
    _soforTc3Controller = TextEditingController(text: viewModel.model.sofor3KimlikNo ?? "");
    _plaka1Controller = TextEditingController(text: viewModel.model.dorsePlaka1 ?? "");
    _plaka2Controller = TextEditingController(text: viewModel.model.dorsePlaka2 ?? "");
    _plaka3Controller = TextEditingController(text: viewModel.model.dorsePlaka3 ?? "");
    super.initState();
  }

  @override
  void dispose() {
    _plakaController.dispose();
    _sevkTarihiController.dispose();
    _sevkSaatiController.dispose();
    _unvanController.dispose();
    _vergiNoController.dispose();
    _ilController.dispose();
    _ilceController.dispose();
    _ulkeController.dispose();
    _postaKoduController.dispose();
    _soforAdi1Controller.dispose();
    _soforSoyadi1Controller.dispose();
    _soforAciklama1Controller.dispose();
    _soforTc1Controller.dispose();
    _soforAdi2Controller.dispose();
    _soforSoyadi2Controller.dispose();
    _soforAciklama2Controller.dispose();
    _soforTc2Controller.dispose();
    _soforAdi3Controller.dispose();
    _soforSoyadi3Controller.dispose();
    _soforAciklama3Controller.dispose();
    _soforTc3Controller.dispose();
    _plaka1Controller.dispose();
    _plaka2Controller.dispose();
    _plaka3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: const AppBarTitle(title: "E-İrsaliye Ek Bilgi Girişi"),
        actions: [
          IconButton(
            onPressed: () async {
              if (!viewModel.model.tasiyiciBilgileriTamMi) {
                dialogManager.showErrorSnackBar("Taşıyıcı bilgileri eksik.");
                return;
              }
              if (_formKey.currentState!.validate()) {
                dialogManager.showAreYouSureDialog(() {
                  Get.back(result: viewModel.model);
                });
              }
            },
            icon: const Icon(Icons.check_outlined),
          ),
        ],
      );

  Widget body() => Column(
        children: [
          const Card(
            child: ListTile(
              leading: Icon(Icons.info_outline),
              title: Text("Taşıyıcı bilgilerini veya plaka-şoför bilgilerini doldurun."),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () async {
                        final result = await bottomSheetDialogManager.showEIrsaliyeSablonBottomSheetDialog(context);
                        if (result != null) {
                          viewModel.setModel(result..sevktar = viewModel.model.sevktar);
                          _plakaController.text = result.plaka ?? "";
                          _unvanController.text = result.tasiyiciUnvan ?? "";
                          _vergiNoController.text = result.tasiyiciVkn ?? "";
                          _ilController.text = result.tasiyiciIl ?? "";
                          _ilceController.text = result.tasiyiciIlce ?? "";
                          _ulkeController.text = result.tasiyiciUlke ?? "";
                          _postaKoduController.text = result.tasiyiciPostakodu ?? "";
                          _soforAdi1Controller.text = result.sofor1Adi ?? "";
                          _soforSoyadi1Controller.text = result.sofor1Soyadi ?? "";
                          _soforAciklama1Controller.text = result.sofor1Aciklama ?? "";
                          _soforTc1Controller.text = result.sofor1KimlikNo ?? "";
                          _soforAdi2Controller.text = result.sofor2Adi ?? "";
                          _soforSoyadi2Controller.text = result.sofor2Soyadi ?? "";
                          _soforAciklama2Controller.text = result.sofor2Aciklama ?? "";
                          _soforTc2Controller.text = result.sofor2KimlikNo ?? "";
                          _soforAdi3Controller.text = result.sofor3Adi ?? "";
                          _soforSoyadi3Controller.text = result.sofor3Soyadi ?? "";
                          _soforAciklama3Controller.text = result.sofor3Aciklama ?? "";
                          _soforTc3Controller.text = result.sofor3KimlikNo ?? "";
                          _plaka1Controller.text = result.dorsePlaka1 ?? "";
                          _plaka2Controller.text = result.dorsePlaka2 ?? "";
                          _plaka3Controller.text = result.dorsePlaka3 ?? "";
                        }
                      },
                      child: const Text("Şablondan Getir"),
                    ).paddingAll(UIHelper.lowSize),
                    CustomTextField(
                      labelText: "Plaka",
                      controller: _plakaController,
                      onChanged: viewModel.setPlaka,
                    ),
                    CustomTextField(
                      labelText: "Sevk Tarihi",
                      controller: _sevkTarihiController,
                      readOnly: true,
                      isMust: true,
                      isDateTime: true,
                      onTap: () async {
                        final result = await dialogManager.showDateTimePicker();
                        if (result != null) {
                          viewModel.setSevkTarihi(result);
                          _sevkTarihiController.text = result.toDateString;
                        }
                      },
                    ),
                    CustomTextField(
                      labelText: "Sevk Saati",
                      controller: _sevkSaatiController,
                      readOnly: true,
                      isMust: true,
                      isTime: true,
                      onTap: () async {
                        final result = await dialogManager.showSaatPicker();
                        if (result != null) {
                          viewModel.setSevkSaati(result);
                          _sevkSaatiController.text = result.format(context);
                        }
                      },
                    ),
                    const Text(
                      "Taşıyıcı Bilgileri",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ).paddingAll(UIHelper.lowSize),
                    CustomTextField(
                      labelText: "Ünvan",
                      controller: _unvanController,
                      readOnly: true,
                      suffixMore: true,
                      onTap: getCari,
                    ),
                    CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        CustomTextField(
                          labelText: "Vergi No",
                          controller: _vergiNoController,
                          keyboardType: TextInputType.number,
                          onChanged: viewModel.setVergiNo,
                        ),
                        CustomTextField(
                          labelText: "İl",
                          controller: _ilController,
                          onChanged: viewModel.setIl,
                        ),
                        CustomTextField(
                          labelText: "İlçe",
                          controller: _ilceController,
                          onChanged: viewModel.setIlce,
                        ),
                        CustomTextField(
                          labelText: "Ülke",
                          controller: _ulkeController,
                          onChanged: viewModel.setUlke,
                        ),
                        CustomTextField(
                          labelText: "Posta Kodu",
                          controller: _postaKoduController,
                          onChanged: viewModel.setPostaKodu,
                        ),
                      ],
                    ),
                    const Text(
                      "Şoför Bilgileri 1",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ).paddingAll(UIHelper.lowSize),
                    CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        CustomTextField(
                          labelText: "Adı",
                          controller: _soforAdi1Controller,
                          onChanged: viewModel.setSofor1Adi,
                        ),
                        CustomTextField(
                          labelText: "Soyadı",
                          controller: _soforSoyadi1Controller,
                          onChanged: viewModel.setSofor1Soyadi,
                        ),
                        CustomTextField(
                          labelText: "Açıklama",
                          controller: _soforAciklama1Controller,
                          onChanged: viewModel.setSofor1Aciklama,
                        ),
                        CustomTextField(
                          labelText: "T.C. Kimlik No",
                          controller: _soforTc1Controller,
                          keyboardType: TextInputType.number,
                          onChanged: viewModel.setSofor1TcKimlikNo,
                        ),
                      ],
                    ),
                    const Text(
                      "Şoför Bilgileri 2",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ).paddingAll(UIHelper.lowSize),
                    CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        CustomTextField(
                          labelText: "Adı",
                          controller: _soforAdi2Controller,
                          onChanged: viewModel.setSofor2Adi,
                        ),
                        CustomTextField(
                          labelText: "Soyadı",
                          controller: _soforSoyadi2Controller,
                          onChanged: viewModel.setSofor2Soyadi,
                        ),
                        CustomTextField(
                          labelText: "Açıklama",
                          controller: _soforAciklama2Controller,
                          onChanged: viewModel.setSofor2Aciklama,
                        ),
                        CustomTextField(
                          labelText: "T.C. Kimlik No",
                          controller: _soforTc2Controller,
                          keyboardType: TextInputType.number,
                          onChanged: viewModel.setSofor2TcKimlikNo,
                        ),
                      ],
                    ),
                    const Text(
                      "Şoför Bilgileri 3",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ).paddingAll(UIHelper.lowSize),
                    CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        CustomTextField(
                          labelText: "Adı",
                          controller: _soforAdi3Controller,
                          onChanged: viewModel.setSofor3Adi,
                        ),
                        CustomTextField(
                          labelText: "Soyadı",
                          controller: _soforSoyadi3Controller,
                          onChanged: viewModel.setSofor3Soyadi,
                        ),
                        CustomTextField(
                          labelText: "Açıklama",
                          controller: _soforAciklama3Controller,
                          onChanged: viewModel.setSofor3Aciklama,
                        ),
                        CustomTextField(
                          labelText: "T.C. Kimlik No",
                          controller: _soforTc3Controller,
                          keyboardType: TextInputType.number,
                          onChanged: viewModel.setSofor3TcKimlikNo,
                        ),
                      ],
                    ),
                    const Text(
                      "Dorse Plakaları",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ).paddingAll(UIHelper.lowSize),
                    CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        CustomTextField(
                          labelText: "Plaka 1",
                          controller: _plaka1Controller,
                          onChanged: viewModel.setDorsePlaka1,
                        ),
                        CustomTextField(
                          labelText: "Plaka 2",
                          controller: _plaka2Controller,
                          onChanged: viewModel.setDorsePlaka2,
                        ),
                        CustomTextField(
                          labelText: "Plaka 3",
                          controller: _plaka3Controller,
                          onChanged: viewModel.setDorsePlaka3,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ).paddingAll(UIHelper.lowSize);

  Future<void> getCari() async {
    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
    if (result is CariListesiModel) {
      viewModel.setUnvan(result);
      _unvanController.text = result.cariAdi ?? "";
      _ilController.text = result.cariIl ?? "";
      _ilceController.text = result.cariIlce ?? "";
      _ulkeController.text = result.ulkeAdi ?? "";
      _postaKoduController.text = result.postakodu ?? "";
      _vergiNoController.text = result.vergiNumarasi ?? "";
    }
  }
}
