import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/print_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/helper_widgets/custom_label_widget.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/yazdir/view_model/stok_yazdir_view_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

class StokYazdirView extends StatefulWidget {
  final StokListesiModel? model;
  const StokYazdirView({super.key, this.model});

  @override
  State<StokYazdirView> createState() => _StokYazdirViewState();
}

class _StokYazdirViewState extends BaseState<StokYazdirView> {
  StokYazdirViewModel viewModel = StokYazdirViewModel();
  late final TextEditingController stokController;
  late final TextEditingController yapilandirmaKoduController;
  late final TextEditingController dizaynController;
  late final TextEditingController yaziciController;
  late final TextEditingController miktarBakiyeController;
  late final TextEditingController kopyaSayisiController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    viewModel.init();
    if (widget.model != null) {
      viewModel.setStokKodu(widget.model?.stokKodu);
      stokController = TextEditingController(text: widget.model?.stokAdi);
    }else{
    stokController = TextEditingController(text: viewModel.printModel.dicParams?.stokKodu);
    }
    yapilandirmaKoduController = TextEditingController();
    dizaynController = TextEditingController(text: viewModel.printModel.dizaynId.toStringIfNotNull ?? "");
    yaziciController = TextEditingController(text: viewModel.printModel.yaziciAdi);
    miktarBakiyeController = TextEditingController(text: viewModel.printModel.dicParams?.miktar.toStringIfNotNull ?? "");
    kopyaSayisiController = TextEditingController(text: viewModel.printModel.etiketSayisi.toStringIfNotNull ?? "");

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await setDizayn();
      await setYazici();
    });
    super.initState();
  }

  @override
  void dispose() {
    stokController.dispose();
    yapilandirmaKoduController.dispose();
    dizaynController.dispose();
    yaziciController.dispose();
    miktarBakiyeController.dispose();
    kopyaSayisiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yazdır"),
        actions: [
          IconButton(
            icon: const Icon(Icons.print_outlined),
            onPressed: () async => postPrint(),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            CustomTextField(
              labelText: "Stok",
              controller: stokController,
              readOnly: true,
              isMust: true,
              suffixMore: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.printModel.dicParams?.stokKodu ?? "")),
              onTap: () async {
                var result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
                if (result is StokListesiModel) {
                  // viewModel.setStokListesiModel(result);
                  // barkodKontroller.text = result.stokKodu.toString();
                  stokController.text = result.stokAdi.toString();
                  viewModel.setStokKodu(result.stokKodu);
                  if (viewModel.stokSecildigindeYazdir) {
                    postPrint();
                  }
                }
              },
              suffix: IconButton(
                  icon: const Icon(Icons.qr_code_2_outlined),
                  onPressed: () async {
                    var result = await Get.toNamed("/qr");
                    if (result != null) {
                      // barkodKontroller.text = result.toString();
                    }
                  }),
            ),
            CustomTextField(
              labelText: "Yapılandırma Kodu",
              controller: yapilandirmaKoduController,
              readOnly: true,
              // isMust: true,
              suffixMore: true,
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: "Dizayn",
                  controller: dizaynController,
                  readOnly: true,
                  isMust: true,
                  suffixMore: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.printModel.dizaynId.toStringIfNotNull ?? "")),
                  onTap: () async => setDizayn(),
                )),
                Expanded(
                    child: CustomTextField(
                  labelText: "Yazıcı",
                  controller: yaziciController,
                  readOnly: true,
                  isMust: true,
                  suffixMore: true,
                  onTap: () async => setYazici(),
                )),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CustomTextField(
                  labelText: "Miktar/Bakiye",
                  controller: miktarBakiyeController,
                  valueWidget: Observer(builder: (_) => const Text("")),
                  suffix: Wrap(
                    children: [
                      IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: () {
                            viewModel.decreaseMiktar();
                            miktarBakiyeController.text = viewModel.printModel.dicParams?.miktar.toStringIfNotNull ?? "";
                          }),
                      IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            viewModel.increaseMiktar();
                            miktarBakiyeController.text = viewModel.printModel.dicParams?.miktar.toStringIfNotNull ?? "";
                          }),
                    ],
                  ),
                )),
                Expanded(
                    child: CustomTextField(
                        labelText: "Kopya Sayısı",
                        controller: kopyaSayisiController,
                        isMust: true,
                        suffix: Wrap(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.remove),
                                onPressed: () {
                                  viewModel.decreaseKopyaSayisi();
                                  kopyaSayisiController.text = viewModel.printModel.etiketSayisi.toStringIfNotNull ?? "";
                                }),
                            IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () {
                                  viewModel.increaseKopyaSayisi();
                                  kopyaSayisiController.text = viewModel.printModel.etiketSayisi.toStringIfNotNull ?? "";
                                }),
                          ],
                        ))),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: CustomWidgetWithLabel(
                  text: "Stok Seçildiğinde Yazdır",
                  child: Observer(builder: (_) => Switch(value: viewModel.stokSecildigindeYazdir, onChanged: (value) => viewModel.changeStokSecildigindeYazdir(value))),
                )),
                Expanded(
                    child: CustomWidgetWithLabel(
                  text: "Yazıcı ve Dizaynı Hatırla",
                  child: Observer(builder: (_) => Switch(value: viewModel.yaziciVeDizayniHatirla, onChanged: (value) => viewModel.changeYaziciVeDizayniHatirla(value))),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setDizayn() async {
    List<NetFectDizaynList>? dizaynList = parametreModel.netFectDizaynList?.where((element) => element.ozelKod == "StokEtiket").toList();
    var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
        title: "Dizayn", children: List.generate(dizaynList?.length ?? 0, (index) => BottomSheetModel(title: dizaynList?[index].dizaynAdi ?? "", value: dizaynList?[index])));
    if (result is NetFectDizaynList) {
      dizaynController.text = result.dizaynAdi ?? "";
      viewModel.setDizaynId(result.id);
    } else {
      return;
    }
  }

  Future<void> setYazici() async {
    List<YaziciList>? yaziciList = parametreModel.yaziciList;
    var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
        title: "Yazıcı",
        children: List.generate(
          yaziciList?.length ?? 0,
          (index) => BottomSheetModel(title: yaziciList?[index].yaziciAdi ?? "", value: yaziciList?[index]),
        ));
    if (result is YaziciList) {
      yaziciController.text = result.yaziciAdi ?? "";
      viewModel.setYaziciAdi(result.yaziciAdi);
    } else {
      return;
    }
  }

  Future<void> postPrint() async {
    if (formKey.currentState?.validate() ?? false) {
      var result = await networkManager.postPrint(context, model: viewModel.printModel);
      if (result.success == true) {}
    }
  }
}
