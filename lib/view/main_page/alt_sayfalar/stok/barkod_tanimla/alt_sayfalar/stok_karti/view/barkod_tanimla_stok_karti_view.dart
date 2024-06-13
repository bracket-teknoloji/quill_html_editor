import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

final class BarkodTanimlaStokKartiView extends StatefulWidget {
  final StokListesiModel? model;
  const BarkodTanimlaStokKartiView({super.key, this.model});

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
    barkod3Controller = TextEditingController(text: model?.barkod2);
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
          CustomTextField(
            labelText: "Barkod 1",
            maxLength: 35,
            controller: barkod1Controller,
          ).yetkiVarMi(yetkiController.stokBarkodGorunecekAlanlar("B1")),
          CustomTextField(
            labelText: "Barkod 2",
            maxLength: 35,
            controller: barkod2Controller,
          ).yetkiVarMi(yetkiController.stokBarkodGorunecekAlanlar("B2")),
          CustomTextField(
            labelText: "Barkod 3",
            maxLength: 35,
            controller: barkod3Controller,
          ).yetkiVarMi(yetkiController.stokBarkodGorunecekAlanlar("B3")),
        ],
      );
}
