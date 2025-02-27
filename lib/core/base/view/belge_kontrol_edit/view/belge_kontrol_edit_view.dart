import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/belge_kontrol_edit/view_model/belge_kontrol_edit_view_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

class BelgeKontrolEditView extends StatefulWidget {
  const BelgeKontrolEditView.add({super.key}) : editTipi = BaseEditEnum.ekle;
  const BelgeKontrolEditView.edit({super.key}) : editTipi = BaseEditEnum.duzenle;
  final BaseEditEnum editTipi;

  @override
  State<BelgeKontrolEditView> createState() => _BelgeKontrolEditViewState();
}

class _BelgeKontrolEditViewState extends BaseState<BelgeKontrolEditView> {
  final BelgeKontrolEditViewModel viewModel = BelgeKontrolEditViewModel();
  late final TextEditingController belgeTipiController;
  late final TextEditingController belgeNoController;

  @override
  void initState() {
    belgeTipiController = TextEditingController();
    belgeNoController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    belgeTipiController.dispose();
    belgeNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "Belge Kontrol"),
      actions: [
        IconButton(
          onPressed: () {
            if (viewModel.belgeKontrolModel.belgeTipi == null) {
              return belgeTipiSecinizSnackBar();
            }
            if (viewModel.belgeKontrolModel.belgeNo == null) {
              return dialogManager.showErrorSnackBar("Lütfen belge no seçiniz");
            }
            dialogManager.showAreYouSureDialog(() async {
              final result = await viewModel.saveData();
              if (result) {
                Get.back(result: true);
                dialogManager.showSuccessSnackBar("Kayıt başarılı");
              }
            });
          },
          icon: const Icon(Icons.save_outlined),
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(
            labelText: "Belge Tipi",
            controller: belgeTipiController,
            suffixMore: true,
            readOnly: true,
            valueWidget: Observer(builder: (_) => Text(viewModel.belgeKontrolModel.belgeTipi ?? "")),
            onTap: () async {
              final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                context,
                title: "Belge Türü Seçiniz",
                groupValue: viewModel.belgeKontrolModel.belgeTipi,
                children:
                    EditTipiEnum.values
                        .map((e) => BottomSheetModel(title: e.getName, value: e, groupValue: e.rawValue))
                        .toList(),
              );

              if (result case final value?) {
                belgeTipiController.text = value.getName;
                viewModel.setBelgeTuru(value.rawValue);
              }
            },
          ),
          CustomTextField(
            labelText: "Belge no",
            controller: belgeNoController,
            suffixMore: true,
            readOnly: true,
            suffix: IconButton(
              onPressed: () async {
                if (viewModel.belgeKontrolModel.belgeTipi == null) {
                  return belgeTipiSecinizSnackBar();
                }
                final result = await Get.toNamed("/qr");
                if (result case final String qr?) {
                  belgeNoController.text = qr;
                }
              },
              icon: const Icon(Icons.qr_code_scanner_outlined),
            ),
            onTap: () async {
              if (viewModel.belgeKontrolModel.belgeTipi == null) {
                return belgeTipiSecinizSnackBar();
              }
              final result = await Get.toNamed(
                EditTipiEnum.values
                    .firstWhere((element) => element.rawValue == viewModel.belgeKontrolModel.belgeTipi)
                    .getListRoute,
                arguments: true,
              );
              setBelge(result);
            },
          ),
        ],
      ),
    ),
  );

  void setBelge(BaseSiparisEditModel result) {
      viewModel.setBelge(result);
      belgeNoController.text = result.belgeNo ?? "";
  }

  void belgeTipiSecinizSnackBar() => dialogManager.showErrorSnackBar("Lütfen önce belge tipi seçiniz");
}
