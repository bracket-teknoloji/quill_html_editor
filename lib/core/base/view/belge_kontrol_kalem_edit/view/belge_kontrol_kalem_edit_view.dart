import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/view/base_scaffold.dart";
import "package:picker/core/base/view/belge_kontrol_kalem_edit/view_model/belge_kontrol_kalem_edit_view_model.dart";
import "package:picker/core/base/view/belge_kontrol_kalemler/model/belge_kontrol_kalemler_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

final class BelgeKontrolKalemEditView extends StatefulWidget {
  const BelgeKontrolKalemEditView({required this.belgeKontrolModel, super.key});

  final BelgeKontrolKalemlerModel belgeKontrolModel;

  @override
  State<BelgeKontrolKalemEditView> createState() => _BelgeKontrolKalemEditViewState();
}

final class _BelgeKontrolKalemEditViewState extends State<BelgeKontrolKalemEditView> {
  final BelgeKontrolKalemEditViewModel viewModel = BelgeKontrolKalemEditViewModel();
  late final TextEditingController miktarController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    miktarController = TextEditingController(
      text: widget.belgeKontrolModel.kalanMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar),
    );
    viewModel.setRequestModel(widget.belgeKontrolModel);
    super.initState();
  }

  @override
  void dispose() {
    miktarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "Belge Kontrol", subtitle: "Miktar Girişi"),
      actions: [
        IconButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              if (await viewModel.saveKalem()) {
                Get.back(result: viewModel.requestModel);
              }
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
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.belgeKontrolModel.stokAdi case final stokAdi?) Text(stokAdi),
                  CustomLayoutBuilder.divideInHalf(
                    children: [
                      if (widget.belgeKontrolModel.stokKodu case final stokKodu?) Text("Stok Kodu: $stokKodu"),
                      Text(
                        "Miktar: ${widget.belgeKontrolModel.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                      ),
                      Text(
                        "Tamamlanan Miktar: ${widget.belgeKontrolModel.tamamlananMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                      ),
                      Text(
                        "Kalan Miktar: ${widget.belgeKontrolModel.kalanMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                      ),
                    ],
                  ),
                ],
              ).paddingAll(UIHelper.lowSize),
            ),
            CustomTextField(
              labelText: "Miktar",
              isFormattedString: true,
              controller: miktarController,
              isMust: true,
              validator: (value) {
                if (value == "") return "Lütfen miktar giriniz";
                if ((value?.toDoubleWithFormattedString ?? 0) <= 0) return "Miktar sıfırdan büyük olmalıdır";
                if ((value?.toDoubleWithFormattedString ?? 0) > (widget.belgeKontrolModel.kalanMiktar ?? 0)) {
                  return "Miktar kalan miktarı aşamaz";
                }
                return null;
              },
              keyboardType: const TextInputType.numberWithOptions(decimal: true),

              // decrease and increase suffixes
              suffix: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () {
                      if ((viewModel.requestModel.miktar ?? 0) <= 0) return;
                      viewModel.setMiktar((viewModel.requestModel.miktar ?? 0) - 1);
                      miktarController.text = (viewModel.requestModel.miktar ?? 0).commaSeparatedWithDecimalDigits(
                        OndalikEnum.miktar,
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      viewModel.setMiktar((viewModel.requestModel.miktar ?? 0) + 1);
                      miktarController.text = (viewModel.requestModel.miktar ?? 0 + 1).commaSeparatedWithDecimalDigits(
                        OndalikEnum.miktar,
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
