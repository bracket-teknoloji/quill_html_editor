import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/barkod_tipi_enum.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/barkod_tanimla/alt_sayfalar/barkod_tanimla_edit/view_model/barkod_tanimla_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

final class BarkodTanimlaEditView extends StatefulWidget {
  final StokListesiModel model;
  const BarkodTanimlaEditView({super.key, required this.model});

  @override
  State<BarkodTanimlaEditView> createState() => _BarkodTanimlaEditViewState();
}

final class _BarkodTanimlaEditViewState extends BaseState<BarkodTanimlaEditView> {
  final BarkodTanimlaEditViewModel viewModel = BarkodTanimlaEditViewModel();
  late final TextEditingController barkodTipiController;
  late final TextEditingController barkodController;
  late final TextEditingController olcuBirimiController;
  late final TextEditingController aciklamaController;

  @override
  void initState() {
    viewModel.setStokKodu(widget.model.stokKodu);
    barkodTipiController = TextEditingController();
    barkodController = TextEditingController();
    olcuBirimiController = TextEditingController();
    aciklamaController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    barkodTipiController.dispose();
    barkodController.dispose();
    olcuBirimiController.dispose();
    aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Barkod Tanımla",
            subtitle: widget.model.stokKodu,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                labelText: "Barkod Tipi",
                controller: barkodTipiController,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.barkodTipi ?? "")),
                onTap: () async {
                  final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                    context,
                    title: "Barkod Tipi",
                    groupValue: viewModel.model.barkodTipi,
                    children: yetkiController.stokBarkodGecerliBarkodTipleri
                        .map(
                          (e) => BottomSheetModel(
                            title: e.barkodAdi,
                            value: e,
                            description: e.barkodTipi,
                            groupValue: e.barkodTipi,
                          ),
                        )
                        .toList(),
                  );
                  if (result is BarkodTipiEnum) {
                    viewModel.setBarkodTipi(result);
                    barkodTipiController.text = result.barkodAdi;
                  }
                },
                readOnly: true,
              ),
              CustomTextField(
                labelText: "Barkod",
                controller: barkodController,
                isMust: true,
                readOnly: true,
                suffix: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
                    IconButton(
                      onPressed: () async {
                        final result = await Get.toNamed("qr");
                        if (result != null) {
                          barkodController.text = result;
                          viewModel.setBarkod(result);
                        }
                      },
                      icon: const Icon(Icons.qr_code_scanner_outlined),
                    ),
                  ],
                ),
              ),
              CustomTextField(
                labelText: "Ölçü Birimi",
                controller: olcuBirimiController,
                isMust: true,
                readOnly: true,
                suffixMore: true,
                onTap: () async {
                  final stok = widget.model;
                  final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                    context,
                    groupValue: viewModel.model.birim,
                    title: widget.model.stokKodu ?? "",
                    children: [
                      BottomSheetModel(title: stok.olcuBirimi ?? "", description: "1", value: 1).yetkiKontrol(stok.olcuBirimi != null),
                      BottomSheetModel(title: stok.olcuBirimi2 ?? "", description: "2", value: 2).yetkiKontrol(stok.olcuBirimi2 != null),
                      BottomSheetModel(title: stok.olcuBirimi3 ?? "", description: "3", value: 3).yetkiKontrol(stok.olcuBirimi3 != null),
                    ].nullCheckWithGeneric,
                  );
                  if (result is int) {
                    olcuBirimiController.text = stok.olcuBirimiSelector(result) ?? "";
                    viewModel.setBirim(result);
                  }
                },
              ),
              CustomTextField(
                labelText: "Açıklama",
                controller: aciklamaController,
                onChanged: viewModel.setAciklama,
              ),
            ],
          ),
        ),
      );
}
