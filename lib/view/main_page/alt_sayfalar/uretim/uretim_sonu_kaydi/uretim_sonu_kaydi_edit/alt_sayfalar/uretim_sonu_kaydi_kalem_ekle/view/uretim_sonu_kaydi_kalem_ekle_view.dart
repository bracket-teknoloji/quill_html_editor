import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_bottom_sheet_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/alt_sayfalar/uretim_sonu_kaydi_kalem_ekle/view_model/uretim_sonu_kaydi_kalem_ekle_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/model/uretim_sonu_kaydi_edit_model.dart";

final class UretimSonuKaydiKalemEkleView extends StatefulWidget {
  final UretimSonuKaydiEditModel model;
  const UretimSonuKaydiKalemEkleView({super.key, required this.model});

  @override
  State<UretimSonuKaydiKalemEkleView> createState() => _UretimSonuKaydiKalemEkleViewState();
}

final class _UretimSonuKaydiKalemEkleViewState extends BaseState<UretimSonuKaydiKalemEkleView> {
  final UretimSonuKaydiKalemEkleViewModel viewModel = UretimSonuKaydiKalemEkleViewModel();
  late final TextEditingController isEmriController;
  late final TextEditingController mamulController;
  late final TextEditingController miktarController;
  late final TextEditingController hurdaMiktarController;
  late final TextEditingController aciklamaController;
  late final TextEditingController ekAlan1Controller;
  late final TextEditingController ekAlan2Controller;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    isEmriController = TextEditingController();
    mamulController = TextEditingController();
    miktarController = TextEditingController();
    hurdaMiktarController = TextEditingController();
    aciklamaController = TextEditingController(text: widget.model.aciklama);
    ekAlan1Controller = TextEditingController();
    ekAlan2Controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    isEmriController.dispose();
    mamulController.dispose();
    miktarController.dispose();
    hurdaMiktarController.dispose();
    aciklamaController.dispose();
    ekAlan1Controller.dispose();
    ekAlan2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Üretim Sonu Kaydı"),
          actions: [
            IconButton(
              onPressed: () async {
                if (formKey.currentState?.validate() != true) return;
                Get.back(result: viewModel.model);
                dialogManager.showSuccessSnackBar("Kalem Eklendi");
              },
              icon: const Icon(Icons.save_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  labelText: "İş Emri",
                  controller: isEmriController,
                  readOnly: true,
                  suffixMore: true,
                  onTap: () async {
                    if (viewModel.model.stokKodu == null) {
                      return dialogManager.showAlertDialog("Önce stok seçiniz.");
                    }
                    final result = await Get.toNamed("/mainPage/isEmriRehberiOzel", arguments: viewModel.model.stokKodu);
                    if (result is IsEmirleriModel) {
                      // viewModel.changeIsEmri(result);
                      isEmriController.text = result.isemriNo ?? "";
                    }
                  },
                ),
                CustomTextField(
                  labelText: "Mamul",
                  // enabled: isEnabled,
                  controller: mamulController,
                  isMust: true,
                  suffixMore: true,
                  readOnly: true,
                  valueWidget: Observer(
                    builder: (_) => Text(
                      viewModel.model.stokAdi ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  suffix: IconButton(
                    onPressed: () async {
                      if (viewModel.model.stokKodu == null) {
                        return dialogManager.showAlertDialog("Önce stok seçiniz.");
                      }
                      dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: viewModel.model.stokKodu)));
                    },
                    icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                  ),
                  onTap: () async {
                    final result = await Get.toNamed("mainPage/stokListesiOzel", arguments: StokBottomSheetModel(receteliStoklar: true, menuKodu: "STOK_SREH", okutuldu: true));
                    if (result is StokListesiModel) {
                      mamulController.text = result.stokKodu ?? "";
                      viewModel.setMamul(result);
                    }
                  },
                ),
                CustomTextField(
                  labelText: "Miktar",
                  controller: miktarController,
                  isFormattedString: true,
                  isMust: true,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) => viewModel.setMiktar(value.toDoubleWithFormattedString),
                ),
                CustomTextField(
                  labelText: "Hurda/Fire Miktarı",
                  controller: hurdaMiktarController,
                  isFormattedString: true,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  onChanged: (value) => viewModel.setHurdaMiktar(value.toDoubleWithFormattedString),
                ),
                CustomTextField(
                  labelText: "Açıklama",
                  controller: aciklamaController,
                  onChanged: viewModel.setAciklama,
                ),
                CustomTextField(
                  labelText: "Ek Alan 1",
                  controller: ekAlan1Controller,
                  onChanged: viewModel.setEkAlan1,
                ),
                CustomTextField(
                  labelText: "Ek Alan 2",
                  controller: ekAlan2Controller,
                  onChanged: viewModel.setEkAlan2,
                ),
              ],
            ),
          ),
        ).paddingAll(UIHelper.lowSize),
      );
}
