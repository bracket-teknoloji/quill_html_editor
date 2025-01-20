import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../../../../../core/base/model/base_stok_mixin.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../hucre_listesi/model/hucre_listesi_model.dart";
import "../../../../hucre_transferi/model/hucre_transferi_model.dart";
import "../view_model/base_hucre_kalemler_view_model.dart";

final class BaseHucreKalemlerView extends StatefulWidget {
  const BaseHucreKalemlerView({super.key});

  @override
  State<BaseHucreKalemlerView> createState() => _BaseHucreKalemlerViewState();
}

final class _BaseHucreKalemlerViewState extends BaseState<BaseHucreKalemlerView> {
  final BaseHucreKalemlerViewModel viewModel = BaseHucreKalemlerViewModel();
  late final TextEditingController stokController;
  late final TextEditingController stokAdiController;
  late final TextEditingController olcuBirimiController;
  late final TextEditingController kalemMiktariController;
  late final TextEditingController paketController;
  late final TextEditingController islemYapilacakMiktarController;
  late final TextEditingController hucreController;

  @override
  void initState() {
    stokController = TextEditingController(text: viewModel.model.stokKodu);
    stokAdiController = TextEditingController(text: viewModel.model.stokAdi);
    olcuBirimiController = TextEditingController();
    kalemMiktariController = TextEditingController();
    paketController = TextEditingController();
    islemYapilacakMiktarController = TextEditingController();
    hucreController = TextEditingController(text: viewModel.model.hucreKodu);
    super.initState();
  }

  @override
  void dispose() {
    stokController.dispose();
    stokAdiController.dispose();
    olcuBirimiController.dispose();
    kalemMiktariController.dispose();
    paketController.dispose();
    islemYapilacakMiktarController.dispose();
    hucreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: (viewModel.model.belgeModel?.cariAdi != null) ? Text("Cari Adı: ${viewModel.model.belgeModel?.cariAdi}") : null,
                  subtitle: CustomLayoutBuilder(
                    splitCount: 2,
                    children: [
                      if (viewModel.model.belgeModel?.tarih != null) Text("Tarih: ${viewModel.model.belgeModel?.tarih.toDateString}"),
                      if (viewModel.model.belgeTuru != null) Text("Belge Tipi: ${EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == viewModel.model.belgeTuru)?.getName}"),
                      if (viewModel.model.belgeModel?.cariKodu != null) Text("Cari Kodu: ${viewModel.model.belgeModel?.cariKodu}"),
                    ],
                  ),
                ),
              ),
              if (!viewModel.model.paketMi) CustomTextField(
                labelText: "Stok",
                readOnly: true,
                isMust: true,
                suffixMore: true,
                controller: stokController,
                suffix: IconButton(
                  onPressed: () async {
                    final result = await Get.toNamed("/qr");
                    if (result is String) {
                      final BaseStokMixin? stok = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: result));
                      updateStok(stok);
                    }
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                ),
                onTap: () async {
                  if (viewModel.model.belgeGorunsunMu) {
                    final result = await Get.toNamed("mainPage/hucreTakibiStoklar");
                    updateStok(result);
                  } else {
                    final result = await Get.toNamed("mainPage/stokListesiOzel");
                    updateStok(result);
                  }
                },
              ),
              CustomTextField(
                labelText: "Paket",
                readOnly: true,
                isMust: true,
                controller: paketController,
                suffix: IconButton(
                  onPressed: () async {
                    final result = await Get.toNamed("/qr");
                    if (result is String) {
                      paketChecker(result);
                    }
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                ),
                onSubmitted: (value) async => paketChecker(value),
              ).yetkiVarMi(viewModel.model.paketMi),
              CustomTextField(
                labelText: "Stok Adı",
                readOnly: true,
                controller: stokAdiController,
                suffix: IconButton(
                  onPressed: () async {
                    if (viewModel.model.stokKodu == null) return dialogManager.showErrorSnackBar("Stok seçiniz.");
                    dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: viewModel.model.stokKodu)));
                  },
                  icon: Icon(Icons.open_in_new_outlined, color: theme.colorScheme.inversePrimary),
                ),
              ).yetkiVarMi(!viewModel.model.paketMi),
              CustomTextField(
                labelText: "Ölçü Birimi",
                readOnly: true,
                controller: olcuBirimiController,
                // onTap: () {},
              ).yetkiVarMi(!viewModel.model.paketMi),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Kalem Miktarı",
                    readOnly: true,
                    controller: kalemMiktariController,
                  ).yetkiVarMi(viewModel.model.kalemMiktariGorunsunMu),
                  CustomTextField(
                    labelText: "İşlem Yapılacak Miktar",
                    isMust: true,
                    isFormattedString: true,
                    controller: islemYapilacakMiktarController,
                    onChanged: (value) => viewModel.setMiktar(value.toDoubleWithFormattedString),
                    validator: (value) {
                      if (value case (null || "")) return "Lütfen işlem yapılacak miktarı giriniz.";
                      if (value.toDoubleWithFormattedString > kalemMiktariController.text.toDoubleWithFormattedString) return "İşlem yapılacak miktar kalem miktarından büyük olamaz.";
                      return null;
                    },
                  ),
                ],
              ).yetkiVarMi(!viewModel.model.paketMi),
              CustomTextField(
                labelText: "Hücre",
                controller: hucreController,
                isMust: true,
                suffixMore: true,
                readOnly: true,
                onTap: getHucreModel,
              ),
            ],
          ),
        ),
      ).paddingAll(UIHelper.lowSize);

  void updateStok(BaseStokMixin? result) {
    if (result is BaseStokMixin) {
      stokController.text = result.stokKodu ?? "";
      stokAdiController.text = result.stokAdi ?? "";
      olcuBirimiController.text = result.getOlcuBirimi ?? "";
      kalemMiktariController.text = result.getMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar);
      islemYapilacakMiktarController.text = result.getMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar);
      viewModel.setStok(result);
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

  Future<void> getHucreModel() async {
    final result = await Get.toNamed("/mainPage/hucreListesiOzel", arguments: viewModel.model.depoKodu);
    if (result is HucreListesiModel) {
      hucreController.text = result.hucreKodu ?? "";
      viewModel.setHucre(result.hucreKodu);
    }
  }
}
