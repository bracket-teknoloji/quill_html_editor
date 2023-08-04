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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
    return WillPopScope(
      onWillPop: () async {
        bool result = false;
        await dialogManager.showAreYouSureDialog(() {
          result = true;
        });
        return result;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Kalem Ekle"),
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
              IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      BaseSiparisEditModel.instance.kalemler?.add(viewModel.kalemModel);
                      Get.back();
                    }
                  },
                  icon: const Icon(Icons.save_outlined)),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              dialogManager.showStokGridViewDialog(viewModel.model);
            },
            child: const Icon(Icons.open_in_new_outlined),
          ),
          body: Column(
            children: [
              Card(
                child: Observer(
                    builder: (_) => Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Text.rich(TextSpan(
                                        children: [const TextSpan(text: "Stok Kodu: "), TextSpan(text: viewModel.model?.stokKodu ?? "", style: const TextStyle(fontWeight: FontWeight.bold))]))),
                                Expanded(
                                    child: Text.rich(TextSpan(children: [
                                  const TextSpan(text: "StkBakiye: "),
                                  TextSpan(text: "${viewModel.model?.bakiye.toStringIfNull ?? ""} ${viewModel.model?.olcuBirimi ?? ""}", style: const TextStyle(fontWeight: FontWeight.bold))
                                ]))),
                              ],
                            ).paddingSymmetric(horizontal: UIHelper.lowSize).paddingOnly(top: UIHelper.lowSize),
                            const Row(
                              children: [
                                Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "Brüt Tutar: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                                Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "MF. Tutarı: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                              ],
                            ).paddingSymmetric(horizontal: UIHelper.lowSize),
                            const Row(
                              children: [
                                Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "İsk. Tutarı: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                                Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "Ara Toplam: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                              ],
                            ).paddingSymmetric(horizontal: UIHelper.lowSize),
                            const Row(
                              children: [
                                Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "KDV Tutarı: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                                Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: "Genel Toplam: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))),
                              ],
                            ).paddingSymmetric(horizontal: UIHelper.lowSize),
                            Card(
                                color: theme.colorScheme.primary.withOpacity(0.1),
                                child: Center(
                                  child: const Text.rich(TextSpan(children: [TextSpan(text: "Son Fiyat: "), TextSpan(text: "123456", style: TextStyle(fontWeight: FontWeight.bold))]))
                                      .paddingOnly(top: UIHelper.lowSize),
                                ))
                          ],
                        )),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(labelText: "Kalem Adı", controller: kalemAdiController),
                        const CustomTextField(labelText: "Ek Alan 1"),
                        const CustomTextField(labelText: "Ek Alan 2"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: CustomTextField(
                                    labelText: "Teslim Tarihi",
                                    controller: teslimTarihiController,
                                    readOnly: true,
                                    suffix: Row(mainAxisSize: MainAxisSize.min, children: [
                                      IconButton(
                                          onPressed: () {
                                            teslimTarihiController.clear();
                                          },
                                          icon: const Icon(Icons.close)),
                                      IconButton(
                                          onPressed: () async {
                                            var result = await dialogManager.showDateTimePicker();
                                            if (result != null) {
                                              teslimTarihiController.text = result.toDateString();
                                              viewModel.kalemModel.teslimTarihi = result;
                                            }
                                          },
                                          icon: const Icon(Icons.calendar_today_outlined))
                                    ]))),
                            const Expanded(child: CustomTextField(labelText: "Koşul", isMust: true, readOnly: true, suffixMore: true)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  depoController.text = result.depoTanimi ?? "";
                                  viewModel.kalemModel.depoTanimi = result.depoTanimi;
                                  viewModel.kalemModel.depoKodu = result.depoKodu;
                                }
                              },
                            )),
                            Expanded(child: CustomTextField(labelText: "Proje", controller: projeController, isMust: true, readOnly: true, suffixMore: true)),
                          ],
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: CustomTextField(
                              labelText: "Miktar",
                              isMust: true,
                              suffix: Wrap(children: [
                                IconButton(icon: const Icon(Icons.remove_outlined), onPressed: () {}),
                                IconButton(icon: const Icon(Icons.add_outlined), onPressed: () {}),
                              ]),
                            )),
                            Expanded(
                                child: CustomTextField(
                              labelText: "Miktar 2",
                              suffix: Wrap(children: [
                                IconButton(icon: const Icon(Icons.remove_outlined), onPressed: () {}),
                                IconButton(icon: const Icon(Icons.add_outlined), onPressed: () {}),
                              ]),
                            )),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: CustomTextField(labelText: "Mal. Faz. Miktar")),
                            Expanded(child: CustomTextField(labelText: "Ölçü Birimi", readOnly: true, suffixMore: true)),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: CustomTextField(labelText: "KDV Oranı", isMust: true)),
                            Expanded(child: CustomTextField(labelText: "Fiyat")),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: CustomTextField(labelText: "İsk.1")),
                            Expanded(child: CustomTextField(labelText: "İsk.Tipi 1")),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: CustomTextField(labelText: "İsk.Tipi 2")),
                            Expanded(child: CustomTextField(labelText: "İsk.2 %")),
                          ],
                        ),
                        const Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: CustomTextField(labelText: "İsk.Tipi 3")),
                            Expanded(child: CustomTextField(labelText: "İsk.3 %")),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
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
    kalemAdiController = TextEditingController();
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
    kalemAdiController.text = widget.stokListesiModel?.stokAdi ?? widget.stokListesiModel?.stokKodu ?? "";
    depoController.text = widget.stokListesiModel?.depoKodu.toStringIfNull ?? "";
    teslimTarihiController.text = model.teslimTarihi.toDateString();
    projeController.text = BaseSiparisEditModel.instance.projeKodu ?? "";
    depoController.text = model.cikisDepoKodu.toStringIfNull ?? "";
  }

  void disposeControllers() {
    kalemAdiController.dispose();
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
