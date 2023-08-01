import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';

import '../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';
import '../../../state/base_state.dart';

class KalemEkleView extends StatefulWidget {
  const KalemEkleView({super.key});

  @override
  State<KalemEkleView> createState() => _KalemEkleViewState();
}

class _KalemEkleViewState extends BaseState<KalemEkleView> {
  late final TextEditingController kalemAdiController;
  late final TextEditingController ekAlan1Controller;
  late final TextEditingController ekAlan2Controller;
  late final TextEditingController teslimTarihiController;
  late final TextEditingController kosulController;
  late final TextEditingController depoController;
  late final TextEditingController projeController;
  late final TextEditingController miktarController;
  late final TextEditingController miktar2Controller;
  late final TextEditingController malFazMiktarController;
  late final TextEditingController olcuBirimiController;
  late final TextEditingController kdvOraniController;
  late final TextEditingController fiyatController;
  late final TextEditingController isk1Controller;
  late final TextEditingController isk1TipiController;
  late final TextEditingController isk2TipiController;
  late final TextEditingController isk2YuzdeController;
  late final TextEditingController isk3TipiController;
  late final TextEditingController isk3YuzdeController;
  StokListesiModel? model;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      var result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
      if (result is StokListesiModel) {
        model = result;
      }
    initControllers();
    });

    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Kalem Ekle"),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.save_outlined)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            dialogManager.showStokGridViewDialog(model);
          },
          child: const Icon(Icons.open_in_new_outlined),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "Stok Kodu: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                        Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "StkBakiye: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                      ],
                    ),
                    const Row(
                      children: [
                        Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "Brüt Tutar: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                        Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "MF. Tutarı: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                      ],
                    ),
                    const Row(
                      children: [
                        Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "İsk. Tutarı: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                        Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "Ara Toplam: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                      ],
                    ),
                    const Row(
                      children: [
                        Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "KDV Tutarı: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                        Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "Genel Toplam: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                      ],
                    ),
                    Card(
                        child:
                            const Text.rich(TextSpan(children: [TextSpan(text: "Son Fiyat: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))])).paddingAll(UIHelper.lowSize))
                  ],
                ).paddingAll(UIHelper.lowSize),
              ),
              const CustomTextField(labelText: "Kalem Adı"),
              const CustomTextField(labelText: "Ek Alan 1"),
              const CustomTextField(labelText: "Ek Alan 2"),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          labelText: "Teslim Tarihi",
                          readOnly: true,
                          suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [IconButton(onPressed: () {}, icon: const Icon(Icons.close)), IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_today_outlined))]))),
                  const Expanded(child: CustomTextField(labelText: "Koşul", isMust: true, readOnly: true, suffixMore: true)),
                ],
              ),
              const Row(
                children: [
                  Expanded(child: CustomTextField(labelText: "Depo", isMust: true, readOnly: true, suffixMore: true)),
                  Expanded(child: CustomTextField(labelText: "Proje", isMust: true, readOnly: true, suffixMore: true)),
                ],
              ),
              const Row(
                children: [
                  Expanded(child: CustomTextField(labelText: "Miktar", isMust: true)),
                  Expanded(child: CustomTextField(labelText: "Miktar 2")),
                ],
              ),
              const Row(
                children: [
                  Expanded(child: CustomTextField(labelText: "Mal. Faz. Miktar")),
                  Expanded(child: CustomTextField(labelText: "Ölçü Birimi", readOnly: true, suffixMore: true)),
                ],
              ),
              const Row(
                children: [
                  Expanded(child: CustomTextField(labelText: "KDV Oranı", isMust: true)),
                  Expanded(child: CustomTextField(labelText: "Fiyat")),
                ],
              ),
              const Row(
                children: [
                  Expanded(child: CustomTextField(labelText: "İsk.1")),
                  Expanded(child: CustomTextField(labelText: "İsk.Tipi 1")),
                ],
              ),
              const Row(
                children: [
                  Expanded(child: CustomTextField(labelText: "İsk.Tipi 2")),
                  Expanded(child: CustomTextField(labelText: "İsk.2 %")),
                ],
              ),
              const Row(
                children: [
                  Expanded(child: CustomTextField(labelText: "İsk.Tipi 3")),
                  Expanded(child: CustomTextField(labelText: "İsk.3 %")),
                ],
              ),
            ],
          ),
        ));
  }

  void initControllers() {
    ekAlan1Controller = TextEditingController();
    ekAlan2Controller = TextEditingController();
    teslimTarihiController = TextEditingController();
    kosulController = TextEditingController();
    depoController = TextEditingController();
    projeController = TextEditingController();
    miktarController = TextEditingController();
    miktar2Controller = TextEditingController();
    malFazMiktarController = TextEditingController();
    olcuBirimiController = TextEditingController();
    kdvOraniController = TextEditingController();
    fiyatController = TextEditingController();
    isk1Controller = TextEditingController();
    isk1TipiController = TextEditingController();
    isk2TipiController = TextEditingController();
    isk2YuzdeController = TextEditingController();
    isk3TipiController = TextEditingController();
    isk3YuzdeController = TextEditingController();
  }

  void disposeControllers() {
    ekAlan1Controller.dispose();
    ekAlan2Controller.dispose();
    teslimTarihiController.dispose();
    kosulController.dispose();
    depoController.dispose();
    projeController.dispose();
    miktarController.dispose();
    miktar2Controller.dispose();
    malFazMiktarController.dispose();
    olcuBirimiController.dispose();
    kdvOraniController.dispose();
    fiyatController.dispose();
    isk1Controller.dispose();
    isk1TipiController.dispose();
    isk2TipiController.dispose();
    isk2YuzdeController.dispose();
    isk3TipiController.dispose();
    isk3YuzdeController.dispose();
  }
}
