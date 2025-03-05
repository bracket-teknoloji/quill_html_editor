import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/yazici_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/yazici_edit/view_model/yazici_edit_view_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";

final class YaziciEditView extends StatefulWidget {
  const YaziciEditView.duzenle({super.key, this.yaziciModel}) : editTipi = BaseEditEnum.duzenle;

  const YaziciEditView.ekle({super.key}) : editTipi = BaseEditEnum.ekle, yaziciModel = null;

  final BaseEditEnum editTipi;

  final YaziciModel? yaziciModel;

  @override
  State<YaziciEditView> createState() => _YaziciEditViewState();
}

final class _YaziciEditViewState extends BaseState<YaziciEditView> {
  final YaziciEditViewModel viewModel = YaziciEditViewModel();
  late final TextEditingController macController;
  late final TextEditingController yaziciTipiController;
  late final TextEditingController yazdirmaTipiController;
  late final TextEditingController adiController;
  late final TextEditingController aciklamaController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.yaziciModel case final value?) viewModel.setYaziciModel(value);
    macController = TextEditingController(text: widget.yaziciModel?.macAdresi);
    yaziciTipiController = TextEditingController(text: widget.yaziciModel?.yaziciTipi?.getLabel());
    yazdirmaTipiController = TextEditingController(text: "M");
    adiController = TextEditingController(text: widget.yaziciModel?.yaziciAdi);
    aciklamaController = TextEditingController(text: widget.yaziciModel?.aciklama);
    super.initState();
  }

  @override
  void dispose() {
    macController.dispose();
    yaziciTipiController.dispose();
    yazdirmaTipiController.dispose();
    adiController.dispose();
    aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(appBar: appBar(), body: body());

  AppBar appBar() => AppBar(
    title: AppBarTitle(title: "BT Yazıcı Detayı", subtitle: widget.editTipi.getName),
    actions: [
      IconButton(
        onPressed: () {
          if (formKey.currentState?.validate() ?? false) {
            Get.back(result: viewModel.yaziciModel);
          }
        },
        icon: const Icon(Icons.save_outlined),
      ),
    ],
  );

  SingleChildScrollView body() => SingleChildScrollView(
    child: Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextField(
            labelText: "MAC",
            controller: macController,
            readOnly: true,
            isMust: true,
            suffixMore: true,
            onTap: () async {
              final result = await Get.toNamed("yaziciRehberi");
              if (result case final YaziciModel yazici?) {
                macController.text = yazici.macAdresi;
                adiController.text = yazici.yaziciAdi ?? "";
                viewModel
                  ..setYaziciAdi(yazici.yaziciAdi)
                  ..setMACAdresi(yazici.macAdresi);
              }
            },
          ),
          CustomTextField(
            labelText: "Yazıcı Tipi",
            controller: yaziciTipiController,
            readOnly: true,
            isMust: true,
            suffixMore: true,
            onTap: () async {
              final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                context,
                title: "Yazıcı Tipi",
                groupValue: viewModel.yaziciModel.yaziciTipi,
                children: List.generate(YaziciTipi.values.length, (index) {
                  final YaziciTipi item = YaziciTipi.values[index];
                  return BottomSheetModel(
                    title: item.getLabel(),
                    description: item.value,
                    value: item,
                    groupValue: item.value,
                  );
                }),
              );
              if (result != null) {
                yaziciTipiController.text = result.getLabel();
                viewModel.setYaziciTipi(result);
              }
            },
          ),
          CustomTextField(
            labelText: "Yazdırma Tipi",
            controller: yazdirmaTipiController,
            readOnly: true,
            isMust: true,
            suffixMore: true,
          ),
          CustomTextField(labelText: "Adı", controller: adiController, isMust: true, onChanged: viewModel.setYaziciAdi),
          CustomTextField(labelText: "Açıklama", controller: aciklamaController, onChanged: viewModel.setAciklama),
        ],
      ),
    ),
  );
}
