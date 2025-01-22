import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

class TransferMalTalebiGenelView extends StatefulWidget {
  const TransferMalTalebiGenelView({super.key});

  @override
  State<TransferMalTalebiGenelView> createState() => _TransferMalTalebiGenelViewState();
}

class _TransferMalTalebiGenelViewState extends State<TransferMalTalebiGenelView> {
  late final TextEditingController _subeController;
  late final TextEditingController _girisDepoController;
  late final TextEditingController _karsiSubeController;
  late final TextEditingController _isEmriController;
  late final TextEditingController _aciklamaController;

  @override
  void initState() {
    super.initState();
    _subeController = TextEditingController();
    _girisDepoController = TextEditingController();
    _karsiSubeController = TextEditingController();
    _isEmriController = TextEditingController();
    _aciklamaController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _subeController.dispose();
    _girisDepoController.dispose();
    _karsiSubeController.dispose();
    _isEmriController.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            CustomLayoutBuilder.divideInHalf(
              children: [
                CustomTextField(
                  labelText: "Şubeniz",
                  controller: _subeController,
                ),
                CustomTextField(
                  labelText: "Giriş Depo",
                  controller: _girisDepoController,
                ),
                CustomTextField(
                  labelText: "Karşı Şube",
                  controller: _karsiSubeController,
                ),
              ],
            ),
            CustomTextField(
              labelText: "İş Emri",
              controller: _isEmriController,
            ),
            CustomTextField(
              labelText: "Açıklama",
              controller: _aciklamaController,
            ),
          ],
        ),
      ).paddingAll(UIHelper.lowSize);
}
