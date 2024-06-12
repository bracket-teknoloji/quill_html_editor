import "package:flutter/material.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";

class BarkodTanimlaStokKartiView extends StatefulWidget {
  const BarkodTanimlaStokKartiView({super.key});

  @override
  State<BarkodTanimlaStokKartiView> createState() => BarkodTanimlaStokKartiViewState();
}

class BarkodTanimlaStokKartiViewState extends State<BarkodTanimlaStokKartiView> {
  late final TextEditingController barkod1Controller;
  late final TextEditingController barkod2Controller;
  late final TextEditingController barkod3Controller;

  @override
  void initState() {
    barkod1Controller = TextEditingController();
    barkod2Controller = TextEditingController();
    barkod3Controller = TextEditingController();
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
  Widget build(BuildContext context) => Column(
        children: [
          CustomTextField(
            labelText: "Barkod 1",
            maxLength: 35,
            controller: barkod1Controller,
          ),
          CustomTextField(
            labelText: "Barkod 2",
            maxLength: 35,
            controller: barkod1Controller,
          ),
          CustomTextField(
            labelText: "Barkod 3",
            maxLength: 35,
            controller: barkod1Controller,
          ),
        ],
      );
}
