import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../../core/constants/enum/barkod_tipi_enum.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";
import "../view_model/barkod_tanimla_edit_view_model.dart";

final class BarkodTanimlaEditView extends StatefulWidget {
  const BarkodTanimlaEditView({required this.model, super.key});
  final StokListesiModel model;

  @override
  State<BarkodTanimlaEditView> createState() => _BarkodTanimlaEditViewState();
}

final class _BarkodTanimlaEditViewState extends BaseState<BarkodTanimlaEditView> {
  final BarkodTanimlaEditViewModel viewModel = BarkodTanimlaEditViewModel();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController barkodTipiController;
  late final TextEditingController barkodController;
  late final TextEditingController olcuBirimiController;
  late final TextEditingController aciklamaController;

  @override
  void initState() {
    BarkodTipiEnum? barkodTipi = BarkodTipiEnum.code128;
    viewModel.setStokKodu(widget.model.stokKodu);
    barkodTipiController = TextEditingController();
    barkodController = TextEditingController();
    olcuBirimiController = TextEditingController();
    aciklamaController = TextEditingController();
    if (yetkiController.stokBarkodGecerliBarkodTipleri.every((element) => element != barkodTipi)) {
      barkodTipi = yetkiController.stokBarkodGecerliBarkodTipleri.firstOrNull;
    }
    viewModel.setBarkodTipi(barkodTipi);
    barkodTipiController.text = barkodTipi?.barkodAdi ?? "";
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
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: AppBarTitle(title: "Barkod Tanımla", subtitle: widget.model.stokKodu),
      actions: [
        IconButton(
          onPressed: () async {
            if (formKey.currentState?.validate() != true) return;
            final result = await viewModel.sendData();
            if (result.isSuccess) {
              Get.back(result: true);
              dialogManager.showSuccessSnackBar("Barkod başarıyla tanımlandı.");
            }
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
                  children:
                      yetkiController.stokBarkodGecerliBarkodTipleri
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
              maxLength: 50,
              onChanged: viewModel.setBarkod,
              suffix: Row(
                children: [
                  IconButton(
                    onPressed: () async {
                      final result = await viewModel.getBarkod();
                      if (result.isSuccess) {
                        final paramData = result.paramData?["URETILEN_BARKOD"];
                        barkodController.text = paramData;
                        viewModel.setBarkod(paramData);
                      }
                    },
                    icon: const Icon(Icons.add),
                  ),
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
              valueWidget: Observer(builder: (_) => Text(viewModel.model.birim.toStringIfNotNull ?? "")),
              onTap: () async {
                final stok = widget.model;
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  groupValue: viewModel.model.birim,
                  title: widget.model.stokKodu ?? "",
                  children: [
                    if (stok.olcuBirimi != null)
                      BottomSheetModel(title: stok.olcuBirimi ?? "", description: "1", value: 1, groupValue: 1),
                    if (stok.olcuBirimi2 != null)
                      BottomSheetModel(title: stok.olcuBirimi2 ?? "", description: "2", value: 2, groupValue: 2),
                    if (stok.olcuBirimi3 != null)
                      BottomSheetModel(title: stok.olcuBirimi3 ?? "", description: "3", value: 3, groupValue: 3),
                  ],
                );
                if (result is int) {
                  olcuBirimiController.text = stok.olcuBirimiSelector(result) ?? "";
                  viewModel.setBirim(result);
                }
              },
            ),
            CustomTextField(labelText: "Açıklama", controller: aciklamaController, onChanged: viewModel.setAciklama),
          ],
        ).paddingAll(UIHelper.lowSize),
      ),
    ),
  );
}
