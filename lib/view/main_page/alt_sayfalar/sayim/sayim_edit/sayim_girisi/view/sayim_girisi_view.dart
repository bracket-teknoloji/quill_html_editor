import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/sayim_girisi/view_model/sayim_girisi_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

class SayimGirisiView extends StatefulWidget {
  const SayimGirisiView({super.key});

  @override
  State<SayimGirisiView> createState() => _SayimGirisiViewState();
}

class _SayimGirisiViewState extends BaseState<SayimGirisiView> {
  final SayimGirisiViewModel viewModel = SayimGirisiViewModel();
  late final TextEditingController stokController;
  late final TextEditingController stokAdiController;
  late final TextEditingController projeController;
  late final TextEditingController miktarController;
  late final TextEditingController olcuBirimiController;

  @override
  void initState() {
    stokController = TextEditingController();
    stokAdiController = TextEditingController();
    projeController = TextEditingController();
    miktarController = TextEditingController();
    olcuBirimiController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    stokController.dispose();
    stokAdiController.dispose();
    projeController.dispose();
    miktarController.dispose();
    olcuBirimiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: SwitchListTile.adaptive(
                value: false,
                onChanged: (value) {},
                title: const Text("Otomatik Sayım Etiketi Yazdır"),
              ),
            ),
            CustomTextField(
              labelText: "Stok",
              isMust: true,
              readOnly: true,
              suffixMore: true,
              controller: stokController,
              suffix: IconButton(
                onPressed: () async {
                  final stokKodu = await Get.toNamed("qr");
                  if (stokKodu is String) {
                    final StokListesiModel? stokModel = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: stokKodu));
                    stokController.text = stokModel?.stokKodu ?? "";
                    stokAdiController.text = stokModel?.stokAdi ?? "";
                  }
                },
                icon: const Icon(Icons.qr_code_scanner),
              ),
              onTap: () async {
                final stokModel = await Get.toNamed("mainPage/stokListesiOzel");
                if (stokModel is StokListesiModel) {
                  viewModel.setStokModel(stokModel);
                  stokController.text = stokModel.stokKodu ?? "";
                  stokAdiController.text = stokModel.stokAdi ?? "";
                }
              },
            ),
            CustomTextField(
              labelText: "Stok Adı",
              readOnly: true,
              controller: stokAdiController,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "Proje",
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    controller: projeController,
                    onTap: () async {
                      //TODO GROUP VALUE DEĞİŞTİR
                      final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, "");
                      if (result is BaseProjeModel) {
                        projeController.text = result.projeAciklama ?? "";
                      }
                    },
                  ),
                ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
                Expanded(
                  child: CustomTextField(
                    labelText: "Miktar",
                    isMust: true,
                    readOnly: true,
                    controller: miktarController,
                    suffix: Wrap(
                      children: [
                        IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                        IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Observer(
              builder: (_) => CustomTextField(
                labelText: "Ölçü Birimi",
                readOnly: true,
                suffixMore: true,
                controller: olcuBirimiController,
              ).yetkiVarMi(viewModel.stokModel != null),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );
}
