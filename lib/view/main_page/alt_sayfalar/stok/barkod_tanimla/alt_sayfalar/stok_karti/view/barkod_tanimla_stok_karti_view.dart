import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_olcu_birimleri_model.dart";

import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";

final class BarkodTanimlaStokKartiView extends StatefulWidget {
  const BarkodTanimlaStokKartiView({required this.onChanged, super.key, this.model});
  final StokListesiModel? model;
  final Function(StokListesiModel?) onChanged;

  @override
  State<BarkodTanimlaStokKartiView> createState() => BarkodTanimlaStokKartiViewState();
}

final class BarkodTanimlaStokKartiViewState extends BaseState<BarkodTanimlaStokKartiView> {
  late final TextEditingController barkod1Controller;
  late final TextEditingController barkod2Controller;
  late final TextEditingController barkod3Controller;

  StokListesiModel? get model => widget.model;

  @override
  void initState() {
    barkod1Controller = TextEditingController(text: model?.barkod1);
    barkod2Controller = TextEditingController(text: model?.barkod2);
    barkod3Controller = TextEditingController(text: model?.barkod3);
    super.initState();
  }

  @override
  void dispose() {
    barkod1Controller.dispose();
    barkod2Controller.dispose();
    barkod3Controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BarkodTanimlaStokKartiView oldWidget) {
    if (oldWidget.model != widget.model) {
      barkod1Controller.text = widget.model?.barkod1 ?? "";
      barkod2Controller.text = widget.model?.barkod2 ?? "";
      barkod3Controller.text = widget.model?.barkod3 ?? "";
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) => ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          if (yetkiController.stokBarkodGorunecekAlanlar("B1"))
            CustomTextField(
              labelText: "Barkod 1",
              maxLength: 35,
              controller: barkod1Controller,
              suffix: Row(
                children: [
                  barkodUretSuffix(1),
                  qrSuffix(1),
                ],
              ),
              onChanged: (value) => widget.onChanged.call(widget.model?.copyWith(barkod1: value)),
            ),
          if (yetkiController.stokBarkodGorunecekAlanlar("B2"))
            CustomTextField(
              labelText: "Barkod 2",
              maxLength: 35,
              controller: barkod2Controller,
              suffix: Row(
                children: [
                  barkodUretSuffix(2),
                  qrSuffix(2),
                ],
              ),
              onChanged: (value) => widget.onChanged.call(widget.model?.copyWith(barkod2: value)),
            ),
          if (yetkiController.stokBarkodGorunecekAlanlar("B3"))
            CustomTextField(
              labelText: "Barkod 3",
              maxLength: 35,
              controller: barkod3Controller,
              suffix: Row(
                children: [
                  barkodUretSuffix(3),
                  qrSuffix(3),
                ],
              ),
              onChanged: (value) => widget.onChanged.call(widget.model?.copyWith(barkod3: value)),
            ),
        ],
      );

  Widget qrSuffix(int index) => IconButton(onPressed: () => getQR(index), icon: const Icon(Icons.qr_code_scanner_outlined));

  Future<void> getQR(int index) async {
    final result = await Get.toNamed("qr");
    if (result is String) {
      switch (index) {
        case 1:
          barkod1Controller.text = result;
          widget.onChanged.call(widget.model?.copyWith(barkod1: result));
        case 2:
          barkod2Controller.text = result;
          widget.onChanged.call(widget.model?.copyWith(barkod2: result));
        case 3:
          barkod3Controller.text = result;
          widget.onChanged.call(widget.model?.copyWith(barkod3: result));
      }
    }
  }

  Widget barkodUretSuffix(int index) => IconButton(onPressed: () => barkodUret(index), icon: const Icon(Icons.format_list_numbered_rtl_outlined));

  Future<void> barkodUret(int index) async {
    final result = await networkManager.dioPost(path: ApiUrls.barkodUret, bodyModel: StokOlcuBirimleriModel(), data: {"BarkodSira": index}, showLoading: true);
    if (result.isSuccess) {
      final String barkod = result.paramData?["URETILEN_BARKOD"];
      switch (index) {
        case 1:
          barkod1Controller.text = barkod;
          widget.onChanged.call(widget.model?.copyWith(barkod1: barkod));
        case 2:
          barkod2Controller.text = barkod;
          widget.onChanged.call(widget.model?.copyWith(barkod2: barkod));
        case 3:
          barkod3Controller.text = barkod;
          widget.onChanged.call(widget.model?.copyWith(barkod3: barkod));
      }
    }
  }
}
