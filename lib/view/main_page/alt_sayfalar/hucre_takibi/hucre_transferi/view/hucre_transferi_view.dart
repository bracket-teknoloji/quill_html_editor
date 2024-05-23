import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/view_model/hucre_transferi_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

final class HucreTransferiView extends StatefulWidget {
  const HucreTransferiView({super.key});

  @override
  State<HucreTransferiView> createState() => _HucreTransferiViewState();
}

final class _HucreTransferiViewState extends BaseState<HucreTransferiView> {
  final HucreTransferiViewModel viewModel = HucreTransferiViewModel();
  late final TextEditingController depoController;
  late final TextEditingController kaynakHucreController;
  late final TextEditingController stokController;
  late final TextEditingController stokAdiController;
  late final TextEditingController hucreMiktariController;
  late final TextEditingController islemMiktariController;
  late final TextEditingController hedefHucreController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    depoController = TextEditingController();
    kaynakHucreController = TextEditingController();
    stokController = TextEditingController();
    stokAdiController = TextEditingController();
    hucreMiktariController = TextEditingController();
    islemMiktariController = TextEditingController();
    hedefHucreController = TextEditingController();
    if (depoList?.length == 1) {
      depoController.text = depoList?.firstOrNull?.depoTanimi ?? "";
      viewModel.setDepoKodu(depoList?.firstOrNull?.depoKodu);
    }
    super.initState();
  }

  @override
  void dispose() {
    depoController.dispose();
    kaynakHucreController.dispose();
    stokController.dispose();
    stokAdiController.dispose();
    hucreMiktariController.dispose();
    islemMiktariController.dispose();
    hedefHucreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(
            title: "Hücre Transferi",
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (formKey.currentState?.validate() == true) {}
              },
              icon: const Icon(Icons.save_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Observer(
              builder: (_) => Column(
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) => Observer(
                      builder: (_) => ToggleButtons(
                        constraints: BoxConstraints.expand(width: (constraints.maxWidth - UIHelper.midSize - 4) / 2),
                        isSelected: viewModel.isStokList,
                        onPressed: (index) {
                          viewModel.setIsStok(index != 1);
                        },
                        children: const [
                          Text("Stok"),
                          Text("Paket"),
                        ],
                      ),
                    ),
                  ),
                  CustomTextField(
                    labelText: "Depo",
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    controller: depoController,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.depoKodu.toStringIfNotNull ?? "")),
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showHucreDepoBottomSheetDialog(context, viewModel.model.depoKodu);
                      if (result is DepoList) {
                        depoController.text = result.depoTanimi ?? "";
                        viewModel.setDepoKodu(result.depoKodu);
                      }
                    },
                  ),
                  CustomTextField(
                    labelText: "Kaynak Hücre",
                    isMust: true,
                    controller: kaynakHucreController,
                    suffixMore: true,
                    suffix: IconButton(onPressed: () async {}, icon: const Icon(Icons.qr_code_scanner_outlined)),
                    onTap: () async {},
                  ).yetkiVarMi(viewModel.isStok),
                  CustomTextField(
                    labelText: "Stok",
                    isMust: true,
                    readOnly: true,
                    controller: stokController,
                    suffixMore: true,
                    suffix: IconButton(
                      onPressed: () async {
                        if (viewModel.model.hucreKodu == null) return emptyHucreDialog();
                        final qr = await Get.toNamed("qr");
                        if (qr is String) {
                          final result = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: qr));
                          updateStok(result);
                        }
                      },
                      icon: const Icon(Icons.qr_code_scanner_outlined),
                    ),
                    onTap: () async {
                      if (viewModel.model.hucreKodu == null) return emptyHucreDialog();
                      final result = await Get.toNamed("/mainPage/stokListesiOzel");
                      updateStok(result);
                    },
                  ).yetkiVarMi(viewModel.isStok),
                  CustomTextField(
                    labelText: "Stok Adı",
                    readOnly: true,
                    controller: stokAdiController,
                    suffix: IconButton(
                      onPressed: () async {
                        if (viewModel.model.stokKodu == null) return dialogManager.showAlertDialog("Stok Kodu Boş Olamaz");
                        dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: viewModel.model.stokKodu)));
                      },
                      icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                    ),
                  ).yetkiVarMi(viewModel.isStok),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Hücre Miktarı",
                          controller: hucreMiktariController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          isFormattedString: true,
                          onTap: () {},
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          labelText: "İşlem Miktarı",
                          isMust: true,
                          controller: islemMiktariController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          isFormattedString: true,
                          onTap: () {},
                        ),
                      ),
                    ],
                  ).yetkiVarMi(viewModel.isStok),
                  CustomTextField(
                    labelText: "Paket",
                    isMust: true,
                    controller: hedefHucreController,
                    onTap: () {},
                  ),
                  CustomTextField(
                    labelText: "Hedef Hücre",
                    isMust: true,
                    controller: hedefHucreController,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  void updateStok(StokListesiModel? result) {
    if (result is StokListesiModel) {
      stokController.text = result.stokKodu ?? "";
      stokAdiController.text = result.stokAdi ?? "";
      viewModel.setStokKodu(result.stokKodu);
    }
  }

  Future<void> emptyHucreDialog() => dialogManager.showAlertDialog("Kaynak Hücre Seçiniz.");

  List<DepoList>? get depoList => parametreModel.depoList?.where((element) => element.hucreTakibi == "E").toList();
}
