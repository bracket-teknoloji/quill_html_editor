import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/constants/enum/muhasebe_kodu_belge_tipi_enum.dart";
import "../../../../stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "../view_model/aylik_mizan_raporu_view_model.dart";

class AylikMizanRaporuView extends StatefulWidget {
  const AylikMizanRaporuView({super.key});

  @override
  State<AylikMizanRaporuView> createState() => _AylikMizanRaporuViewState();
}

class _AylikMizanRaporuViewState extends BaseState<AylikMizanRaporuView> {
  AylikMizanRaporuViewModel viewModel = AylikMizanRaporuViewModel();
  late final TextEditingController muhasebeKoduController;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    muhasebeKoduController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    muhasebeKoduController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PDFViewerView(filterBottomSheet: filterBottomSheet, title: "Aylık Mizan Raporu", pdfData: viewModel.pdfModel);

  Future<bool> filterBottomSheet() async {
    viewModel.resetFuture();
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc(context).generalStrings.filter,
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              labelText: "Muhasebe Kodu",
              isMust: true,
              controller: muhasebeKoduController,
              readOnly: true,
              suffixMore: true,
              onTap: () async {
                final result =
                    await bottomSheetDialogManager.showMuhasebeMuhasebeKoduBottomSheetDialog(context, viewModel.pdfModel.dicParams?.muhasebeKodu, belgeTipi: MuhasebeBelgeTipiEnum.aylikMizan);
                if (result is StokMuhasebeKoduModel) {
                  viewModel.changeMuhasebeKodu(result.hesapKodu);
                  muhasebeKoduController.text = result.hesapAdi ?? result.hesapKodu ?? "";
                }
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  viewModel.setFuture();
                  Get.back();
                }
              },
              child: Text(loc(context).generalStrings.apply),
            ).paddingAll(UIHelper.lowSize),
          ],
        ),
      ),
    );
    return Future.value(viewModel.futureController.value);
  }
}
