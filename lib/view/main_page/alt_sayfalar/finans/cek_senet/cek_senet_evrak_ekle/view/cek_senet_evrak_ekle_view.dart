import "dart:convert";
import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "../model/cek_senet_evrak_ekle_model.dart";
import "../view_model/cek_senet_evrak_ekle_view_model.dart";

class CekSenetEvrakEkleView extends StatefulWidget {
  final CekSenetListesiModel model;
  const CekSenetEvrakEkleView({super.key, required this.model});

  @override
  State<CekSenetEvrakEkleView> createState() => _CekSenetEvrakEkleViewState();
}

class _CekSenetEvrakEkleViewState extends BaseState<CekSenetEvrakEkleView> {
  late final CekSenetEvrakEkleViewModel viewModel;
  late final TextEditingController _aciklamaController;

  @override
  void initState() {
    _aciklamaController = TextEditingController();
    viewModel = CekSenetEvrakEkleViewModel(model: CekSenetEvrakEkleModel.fromCekSenetListesiModel(widget.model));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await addImage();
    });
    super.initState();
  }

  @override
  void dispose() {
    _aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Evrak Ekle",
            subtitle: widget.model.belgeNo ?? "",
          ),
          actions: [
            IconButton(
              onPressed: () async {
                final result = await viewModel.saveData();
                if (result.isSuccess) {
                  Get.back(result: true);
                  dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                }
              },
              icon: const Icon(Icons.save_outlined),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IntrinsicHeight(
              child: InkWell(
                onTap: addImage,
                child: Card(
                  child: SizedBox(
                    height: (width - UIHelper.midSize) / 2,
                    child: Observer(
                      builder: (_) {
                        if (viewModel.base64Data != null) {
                          return Image.memory(base64Decode(viewModel.base64Data ?? ""), fit: BoxFit.scaleDown);
                        }
                        return const Icon(Icons.camera_alt_outlined);
                      },
                    ).paddingAll(UIHelper.lowSize),
                  ),
                ),
              ),
            ),
            Center(
              child: Observer(builder: (_) => Text("Boyut: ${((viewModel.model.boyutByte ?? 0) / 1024).commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} kb")),
            ),
            CustomTextField(labelText: "Açıklama", controller: _aciklamaController, onChanged: viewModel.setAciklama),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Future<void> addImage() async {
    final result = await bottomSheetDialogManager.getPhoto(context);
    if (result != null) {
      viewModel.setBase64Data(base64Encode(result.bytes));
      viewModel.setBoyutByte(result.bytes.length);
      log(result.bytes.length.toString());
    }
  }
}
