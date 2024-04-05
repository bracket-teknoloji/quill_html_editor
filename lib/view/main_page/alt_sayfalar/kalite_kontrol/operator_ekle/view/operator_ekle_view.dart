import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/operator_ekle/view_model/operator_ekle_view_model.dart";

class OperatorEkleView extends StatefulWidget {
  const OperatorEkleView({super.key});

  @override
  State<OperatorEkleView> createState() => _OperatorEkleViewState();
}

class _OperatorEkleViewState extends BaseState<OperatorEkleView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final OperatorEkleViewModel viewModel = OperatorEkleViewModel();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  labelText: "",
                  isMust: true,
                  onChanged: (value) {},
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );
}
