import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/model/hucre_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/model/hucre_listesi_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/view_model/hucre_transferi_view_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../../core/base/model/base_stok_mixin.dart";

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
  late final TextEditingController paketController;
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
    paketController = TextEditingController();
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
    paketController.dispose();
    hedefHucreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "Hücre Transferi"),
      actions: [
        IconButton(
          onPressed: () async {
            if (formKey.currentState?.validate() != true) return;
            if (!viewModel.isStok) {
              final result = await paketChecker(paketController.text);
              if (result == null) return;
            }
            await sendData();
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
                    children: const [Text("Stok"), Text("Paket")],
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
                  final result = await bottomSheetDialogManager.showHucreDepoBottomSheetDialog(
                    context,
                    viewModel.model.depoKodu,
                  );
                  if (result is DepoList) {
                    depoController.text = result.depoTanimi ?? "";
                    viewModel.setDepoKodu(result.depoKodu);
                  }
                },
              ),
              if (viewModel.isStok)
                CustomTextField(
                  labelText: "Kaynak Hücre",
                  isMust: true,
                  controller: kaynakHucreController,
                  suffixMore: true,
                  readOnly: true,
                  suffix: IconButton(onPressed: () async {}, icon: const Icon(Icons.qr_code_scanner_outlined)),
                  onTap: () async {
                    if (viewModel.model.depoKodu == null) {
                      return dialogManager.showAlertDialog("Depo Seçilmedi. Lütfen Deponu Seçiniz!");
                    }
                    final result = await getHucreModel();
                    if (result is HucreListesiModel) {
                      kaynakHucreController.text = result.hucreKodu ?? "";
                      viewModel.setHucreKodu(result.hucreKodu);
                    }
                  },
                ),
              if (viewModel.isStok)
                CustomTextField(
                  labelText: "Stok",
                  isMust: true,
                  readOnly: true,
                  controller: stokController,
                  suffixMore: true,
                  suffix: IconButton(
                    onPressed: () async {
                      if (viewModel.model.hucreKodu == null) return emptyHucreDialog();
                      final qr = await getQR();
                      if (qr is String) {
                        final result = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: qr));
                        updateStok(result);
                      }
                    },
                    icon: const Icon(Icons.qr_code_scanner_outlined),
                  ),
                  onTap: () async {
                    if (viewModel.model.hucreKodu == null) return emptyHucreDialog();
                    final result = await Get.toNamed(
                      "/mainPage/hucredekiStoklar",
                      arguments: HucreListesiRequestModel(
                        depoKodu: viewModel.model.depoKodu,
                        hucreKodu: viewModel.model.hucreKodu,
                        filterText: null,
                      ),
                    );
                    updateStok(result);
                  },
                ),
              if (viewModel.isStok)
                CustomTextField(
                  labelText: "Stok Adı",
                  readOnly: true,
                  controller: stokAdiController,
                  suffix: IconButton(
                    onPressed: () async {
                      if (viewModel.model.stokKodu == null) {
                        return dialogManager.showAlertDialog("Stok Kodu Boş Olamaz");
                      }
                      dialogManager.showStokGridViewDialog(
                        await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: viewModel.model.stokKodu)),
                      );
                    },
                    icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                  ),
                ),
              if (viewModel.isStok)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Hücre Miktarı",
                        controller: hucreMiktariController,
                        readOnly: true,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        isFormattedString: true,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "İşlem Miktarı",
                        isMust: true,
                        controller: islemMiktariController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        isFormattedString: true,
                        onChanged: (value) => viewModel.setMiktar(value.toDoubleWithFormattedString),
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Lütfen işlem miktarını giriniz!";
                          if (value.toDoubleWithFormattedString <= 0) {
                            return "Lütfen işlem miktarını doğru giriniz!";
                          }
                          if (value.toDoubleWithFormattedString >
                              hucreMiktariController.text.toDoubleWithFormattedString) {
                            return "Hücre miktarından büyük olamaz!";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              if (!viewModel.isStok)
                CustomTextField(
                  labelText: "Paket",
                  isMust: true,
                  controller: paketController,
                  suffix: IconButton(
                    onPressed: () async {
                      final qr = await getQR();
                      if (qr is! String) return;
                      await paketChecker(qr);
                    },
                    icon: const Icon(Icons.qr_code_scanner_outlined),
                  ),
                ),
              CustomTextField(
                labelText: "Hedef Hücre",
                isMust: true,
                readOnly: true,
                suffixMore: true,
                controller: hedefHucreController,
                onTap: () async {
                  final result = await getHucreModel();
                  if (result is HucreListesiModel) {
                    hedefHucreController.text = result.hucreKodu ?? "";
                    viewModel.setHedefHucre(result.hucreKodu);
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) return "Lütfen hedef hücre giriniz!";
                  if (value == viewModel.model.hucreKodu) return "Kaynak ile aynı olamaz";
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    ).paddingAll(UIHelper.lowSize),
  );

  Future<void> sendData() async {
    final result = await viewModel.sendData();
    if (result) {
      viewModel
        ..setStokKodu(null)
        ..setMiktar(null);
      stokController.clear();
      stokAdiController.clear();
      hucreMiktariController.clear();
      islemMiktariController.clear();
      paketController.clear();
      dialogManager.showSuccessSnackBar(loc.generalStrings.success);
    }
  }

  Future<String?> paketChecker(String paketKodu) async {
    final result = await viewModel.getPaket(paketKodu);
    if (result != null) {
      paketController.text = result;
      return result;
    } else {
      dialogManager.showErrorSnackBar("Paket Bulunamadı - $paketKodu");
      return null;
    }
  }

  Future<String?> getQR() async {
    final qr = await Get.toNamed("qr");
    return qr;
  }

  Future<HucreListesiModel?> getHucreModel() async {
    final result = await Get.toNamed("/mainPage/hucreListesiOzel", arguments: viewModel.model.depoKodu);
    return result;
  }

  void updateStok(BaseStokMixin? result) {
    if (result is BaseStokMixin) {
      stokController.text = result.stokKodu ?? "";
      stokAdiController.text = result.stokAdi ?? "";
      hucreMiktariController.text = result.getMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar);
      islemMiktariController.text = result.getMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar);
      viewModel
        ..setMiktar(result.getMiktar)
        ..setStokKodu(result.stokKodu);
    }
  }

  Future<void> emptyHucreDialog() => dialogManager.showAlertDialog("Kaynak Hücre Seçiniz.");

  List<DepoList>? get depoList => parametreModel.depoList?.where((element) => element.hucreTakibiMi).toList();
}
