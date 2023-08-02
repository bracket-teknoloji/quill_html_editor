import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/view/kalem_ekle/view_model/kalem_ekle_view_model.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/constants/extensions/date_time_extensions.dart';
import 'package:picker/core/constants/extensions/number_extensions.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/core/init/network/login/api_urls.dart';

import '../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart';
import '../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';
import '../../../model/doviz_kurlari_model.dart';
import '../../../state/base_state.dart';

class KalemEkleView extends StatefulWidget {
  final StokListesiModel? stokListesiModel;
  const KalemEkleView({super.key, this.stokListesiModel});

  @override
  State<KalemEkleView> createState() => _KalemEkleViewState();
}

class _KalemEkleViewState extends BaseState<KalemEkleView> {
  KalemEkleViewModel viewModel = KalemEkleViewModel();
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
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

  @override
  void initState() {
    initControllers();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getData();
      controllerFiller();
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
            dialogManager.showStokGridViewDialog(viewModel.model);
          },
          child: const Icon(Icons.open_in_new_outlined),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: Observer(
                    builder: (_) => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text.rich(TextSpan(
                                        children: [const TextSpan(text: "Stok Kodu: "), TextSpan(text: viewModel.model?.stokKodu ?? "", style: const TextStyle(fontWeight: FontWeight.bold))]))),
                                Expanded(
                                    child: Text.rich(TextSpan(children: [
                                  const TextSpan(text: "StkBakiye: "),
                                  TextSpan(text: "${viewModel.model?.bakiye.toStringIfNull} ${viewModel.model?.olcuBirimi}", style: const TextStyle(fontWeight: FontWeight.bold))
                                ]))),
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
                                child: const Text.rich(TextSpan(children: [TextSpan(text: "Son Fiyat: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))
                                    .paddingAll(UIHelper.lowSize))
                          ],
                        ).paddingAll(UIHelper.lowSize)),
              ),
              const CustomTextField(labelText: "Kalem Adı"),
              const CustomTextField(labelText: "Ek Alan 1"),
              const CustomTextField(labelText: "Ek Alan 2"),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          labelText: "Teslim Tarihi",
                          controller: teslimTarihiController,
                          readOnly: true,
                          suffix: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [IconButton(onPressed: () {}, icon: const Icon(Icons.close)), IconButton(onPressed: () {}, icon: const Icon(Icons.calendar_today_outlined))]))),
                  const Expanded(child: CustomTextField(labelText: "Koşul", isMust: true, readOnly: true, suffixMore: true)),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                    labelText: "Depo",
                    controller: depoController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    onTap: () async {
                      var result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context);
                      if (result != null) {
                        depoController.text = result.depoKodu.toStringIfNull ?? "";
                      }
                    },
                  )),
                  Expanded(child: CustomTextField(labelText: "Proje", controller: projeController, isMust: true, readOnly: true, suffixMore: true)),
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

  Future<void> getData() async {
    if (widget.stokListesiModel != null) {
      viewModel.setModel(widget.stokListesiModel!);
    } else {
      var result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
      if (result is StokListesiModel) {
        viewModel.setModel(result);
      }
      // var stokResult = await networkManager.dioGet(path: ApiUrls.getStokFiyatOzeti, bodyModel: bodyModel)
      if (viewModel.dovizliMi) {
        var dovizResult =
            await networkManager.dioGet(path: ApiUrls.getDovizKurlari, bodyModel: DovizKurlariModel(), queryParameters: {"EkranTipi": "D", "DovizTipi": 2, "Tarih": result.duzeltmetarihi});
        if (dovizResult.data != null) {
          print(dovizResult.data);
        }
      }
    }
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

  void controllerFiller() {
    teslimTarihiController.text = model.teslimTarihi.toDateString();
    projeController.text = model.projeKodu ?? "";
    depoController.text = model.cikisDepoKodu.toStringIfNull ?? "";
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
