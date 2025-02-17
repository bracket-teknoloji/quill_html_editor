import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../view_model/operator_ekle_view_model.dart";

final class OperatorEkleView extends StatefulWidget {
  const OperatorEkleView({super.key});

  @override
  State<OperatorEkleView> createState() => _OperatorEkleViewState();
}

final class _OperatorEkleViewState extends BaseState<OperatorEkleView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final OperatorEkleViewModel viewModel = OperatorEkleViewModel();
  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(),
    body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [CustomTextField(labelText: "", isMust: true, onChanged: (value) {})],
        ).paddingAll(UIHelper.lowSize),
      ),
    ),
  );
}
