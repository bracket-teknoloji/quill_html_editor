import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

class EIrsaliyeEkBilgilerView extends StatefulWidget {
  const EIrsaliyeEkBilgilerView({super.key});

  @override
  State<EIrsaliyeEkBilgilerView> createState() => _EIrsaliyeEkBilgilerViewState();
}

class _EIrsaliyeEkBilgilerViewState extends BaseState<EIrsaliyeEkBilgilerView> {
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

  @override
  void initState() {
    _plakaController = TextEditingController();
    _sevkTarihiController = TextEditingController();
    _sevkSaatiController = TextEditingController();
    _unvanController = TextEditingController();
    _vergiNoController = TextEditingController();
    _ilController = TextEditingController();
    _ilceController = TextEditingController();
    _ulkeController = TextEditingController();
    _postaKoduController = TextEditingController();
    _soforAdi1Controller = TextEditingController();
    _soforSoyadi1Controller = TextEditingController();
    _soforAciklama1Controller = TextEditingController();
    _soforTc1Controller = TextEditingController();
    _soforAdi2Controller = TextEditingController();
    _soforSoyadi2Controller = TextEditingController();
    _soforAciklama2Controller = TextEditingController();
    _soforTc2Controller = TextEditingController();
    _soforAdi3Controller = TextEditingController();
    _soforSoyadi3Controller = TextEditingController();
    _soforAciklama3Controller = TextEditingController();
    _soforTc3Controller = TextEditingController();
    _plaka1Controller = TextEditingController();
    _plaka2Controller = TextEditingController();
    _plaka3Controller = TextEditingController();
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
        appBar: AppBar(
          title: const Text("E-İrsaliye Ek Bilgi Girişi"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.check_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Card(
                child: ListTile(
                  leading: Icon(Icons.info),
                  title: Text("Taşıyıcı bilgilerini veya plaka-şoför bilgilerini doldurun."),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Şablondan Getir")).paddingAll(UIHelper.lowSize),
               CustomTextField(
                labelText: "Plaka",
                controller: _plakaController,
              ),
              CustomTextField(
                labelText: "Sevk Tarihi",
                controller: _sevkTarihiController,
                readOnly: true,
                isMust: true,
                isDateTime: true,
                onTap: () async {
                  final result = await dialogManager.showDateTimePicker();
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
                },
              ),
              const Text(
                "Taşıyıcı Bilgileri",
                style: TextStyle(fontWeight: FontWeight.bold),
              ).paddingAll(UIHelper.lowSize),
               CustomTextField(
                labelText: "Ünvan",
                controller: _unvanController,
              ),
               CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Vergi No",
                    controller: _vergiNoController,
                    keyboardType: TextInputType.number,
                  ),
                  CustomTextField(
                    labelText: "İl",
                    controller: _ilController,
                  ),
                  CustomTextField(
                    labelText: "İlçe",
                    controller: _ilceController,
                  ),
                  CustomTextField(
                    labelText: "Ülke",
                    controller: _ulkeController,
                  ),
                  CustomTextField(
                    labelText: "Posta Kodu",
                    controller: _postaKoduController,
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
                  ),
                  CustomTextField(
                    labelText: "Soyadı",
                    controller: _soforSoyadi1Controller,
                  ),
                  CustomTextField(
                    labelText: "Açıklama",
                    controller: _soforAciklama1Controller,
                  ),
                  CustomTextField(
                    labelText: "T.C. Kimlik No",
                    controller: _soforTc1Controller,
                    keyboardType: TextInputType.number,
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
                  ),
                  CustomTextField(
                    labelText: "Soyadı",
                    controller: _soforSoyadi2Controller,
                  ),
                  CustomTextField(
                    labelText: "Açıklama",
                    controller: _soforAciklama2Controller,
                  ),
                  CustomTextField(
                    labelText: "T.C. Kimlik No",
                    controller: _soforTc2Controller,
                    keyboardType: TextInputType.number,
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
                  ),
                  CustomTextField(
                    labelText: "Soyadı",
                    controller: _soforSoyadi3Controller,
                  ),
                  CustomTextField(
                    labelText: "Açıklama",
                    controller: _soforAciklama3Controller,
                  ),
                  CustomTextField(
                    labelText: "T.C. Kimlik No",
                    controller: _soforTc3Controller,
                    keyboardType: TextInputType.number,
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

                  ),
                  CustomTextField(
                    labelText: "Plaka 2",
                    controller: _plaka2Controller,
                  ),
                  CustomTextField(
                    labelText: "Plaka 3",
                    controller: _plaka3Controller,
                  ),
                ],
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );

  Future<void> getCari() async {
    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
    if (result != null) {
      // viewModel.setCari(result);
    }
  }
}
