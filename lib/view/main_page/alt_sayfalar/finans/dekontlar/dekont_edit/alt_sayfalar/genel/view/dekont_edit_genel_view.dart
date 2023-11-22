import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

class DekontEditGenelView extends StatefulWidget {
  const DekontEditGenelView({super.key});

  @override
  State<DekontEditGenelView> createState() => _DekontEditGenelViewState();
}

class _DekontEditGenelViewState extends State<DekontEditGenelView> {
  late final TextEditingController _tarihController;
  late final TextEditingController _seriController;
  late final TextEditingController _plasiyerController;

  @override
  void initState() {
    _tarihController = TextEditingController();
    _seriController = TextEditingController();
    _plasiyerController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _tarihController.dispose();
    _seriController.dispose();
    _plasiyerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          CustomTextField(
            labelText: "Tarih",
            isDateTime: true,
            isMust: true,
            readOnly: true,
            controller: _tarihController,
          ),
          CustomTextField(
            labelText: "Seri",
            suffixMore: true,
            isMust: true,
            readOnly: true,
            controller: _seriController,
          ),
          CustomTextField(
            labelText: "Plasiyer",
            suffixMore: true,
            isMust: true,
            readOnly: true,
            controller: _plasiyerController,
          ),
        ],
      ).paddingAll(UIHelper.lowSize);
}
