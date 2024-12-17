import "dart:convert";
import "dart:typed_data";

import "package:flutter/material.dart";
import "package:flutter_image_compress/flutter_image_compress.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:image_picker/image_picker.dart";

import "../../../../../view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_evraklar/model/evraklar_request_model.dart";
import "../../../../base/state/base_state.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../textfield/custom_text_field.dart";
import "../../../wrap/appbar_title.dart";
import "../view_model/image_picker_view_model.dart";

final class ImagePickerView extends StatefulWidget {
  const ImagePickerView({super.key, required this.requestModel});
  final EvraklarRequestModel requestModel;

  @override
  State<ImagePickerView> createState() => _ImagePickerViewState();
}

final class _ImagePickerViewState extends BaseState<ImagePickerView> {
  final ImagePickerViewModel viewModel = ImagePickerViewModel();

  @override
  void initState() {
    viewModel.setRequestModel(widget.requestModel);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => selectPhoto());
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: const AppBarTitle(title: "Görsel Seçiniz"),
          actions: [
            IconButton(
              onPressed: () async {
                if (viewModel.image != null) {
                  final result = await viewModel.uploadEvrak();
                  if (result.isSuccess) {
                    dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                    Get.back(result: true);
                  }
                } else {
                  dialogManager.showErrorSnackBar("Lütfen bir görsel seçiniz.");
                }
              },
              icon: const Icon(Icons.save_outlined),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 3,
              child: Observer(
                builder: (_) => InkWell(
                  onTap: selectPhoto,
                  child: Card(
                    child: viewModel.image != null
                        ? viewModel.isProcessing
                            ? const Center(child: CircularProgressIndicator.adaptive())
                            : Image.memory(viewModel.image!)
                        : Icon(
                            Icons.preview_outlined,
                            size: width * 0.3,
                          ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: CustomTextField(
                labelText: "Açıklama",
                onChanged: viewModel.setAciklama,
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Future<void> selectPhoto() async {
    final sourceType = await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Kaynak tipi",
      children: [
        BottomSheetModel(title: "Galeri", iconWidget: Icons.photo_library_outlined, value: ImageSource.gallery),
        BottomSheetModel(title: "Kamera", iconWidget: Icons.camera_alt_outlined, value: ImageSource.camera),
      ],
    );
    if (sourceType != null) {
      await imageCompresser(sourceType);
    }
  }

  Future<void> imageCompresser(ImageSource sourceType) async {
    final ImagePicker picker = ImagePicker();
    final XFile? result = await picker.pickImage(source: sourceType, imageQuality: 30, maxHeight: 1024, maxWidth: 768);
    if (result != null) {
      viewModel
        ..setIsProcessing(true)
        ..setImage(await result.readAsBytes());
      Uint8List? compressedImage;
      try {
        compressedImage = await FlutterImageCompress.compressWithFile(
          result.path,
          format: CompressFormat.png,
          keepExif: true,
          numberOfRetries: 10,
          quality: 30,
          autoCorrectionAngle: true,
        );
      } catch (e) {
        compressedImage = await FlutterImageCompress.compressWithFile(result.path, format: CompressFormat.heic, numberOfRetries: 10, keepExif: true, autoCorrectionAngle: true);
      }
      final list = compressedImage!.toList();
      final base64 = base64Encode(list);
      viewModel.setBoyutByte(list.length);
      // wait for a second
      await Future.delayed(const Duration(seconds: 1));
      viewModel
        ..setByteData(base64)
        ..setIsProcessing(false);
    }
  }
}
