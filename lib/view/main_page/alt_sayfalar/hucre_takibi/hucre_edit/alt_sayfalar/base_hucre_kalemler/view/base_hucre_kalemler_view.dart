import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_edit/alt_sayfalar/base_hucre_kalemler/view_model/base_hucre_kalemler_view_model.dart";

class BaseHucreKalemlerView extends StatefulWidget {
  const BaseHucreKalemlerView({super.key});

  @override
  State<BaseHucreKalemlerView> createState() => _BaseHucreKalemlerViewState();
}

class _BaseHucreKalemlerViewState extends State<BaseHucreKalemlerView> {
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
    hucreController = TextEditingController();
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
                  title: Text("Cari Adı: ${viewModel.model.belgeModel?.cariAdi}").yetkiVarMi(viewModel.model.belgeModel?.cariAdi != null),
                  subtitle: CustomLayoutBuilder(
                    splitCount: 2,
                    children: [
                      Text("Tarih: ${viewModel.model.belgeModel?.tarih.toDateString}").yetkiVarMi(viewModel.model.belgeModel?.tarih != null),
                      Text("Belge Tipi: ${EditTipiEnum.values.firstWhere((element) => element.rawValue == viewModel.model.belgeModel?.belgeTipi).getName}")
                          .yetkiVarMi(viewModel.model.belgeModel?.belgeTipi != null),
                      Text("Cari Kodu: ${viewModel.model.belgeModel?.cariKodu}").yetkiVarMi(viewModel.model.belgeModel?.cariKodu != null),
                    ],
                  ),
                ),
              ),
              CustomTextField(
                labelText: "Stok",
                readOnly: true,
                isMust: true,
                controller: stokController,
                onTap: () async {},
              ),
              CustomTextField(
                labelText: "Stok Adı",
                readOnly: true,
                controller: stokAdiController,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "Ölçü Birimi",
                readOnly: true,
                controller: olcuBirimiController,
                onTap: () {},
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Kalem Miktarı",
                    readOnly: true,
                    controller: kalemMiktariController,
                  ),
                  CustomTextField(
                    labelText: "İşlem Yapılacak Miktar",
                    isMust: true,
                    readOnly: true,
                    controller: islemYapilacakMiktarController,
                    onTap: () {},
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Hücre",
                controller: hucreController,
                isMust: true,
                readOnly: true,
                onTap: () {},
              ),
            ],
          ),
        ),
      ).paddingAll(UIHelper.lowSize);
}
