import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../base/state/base_state.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../view_model/toggle_button_view_model.dart";

class ToggleButton extends StatefulWidget {
  const ToggleButton({super.key, this.onChanged});
  static String selected = "";
  // onCHanged fonksiyonu ile seçilen butonun değerini almak için kullanılan değişken
  final Function(String)? onChanged;

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends BaseState<ToggleButton> {
  ToggleButtonViewModel viewModel = ToggleButtonViewModel();
  // List<bool> isSelected2 = [false, false, false, false, false];
  @override
  void initState() {
    super.initState();
    viewModel.initializeIsSelected();
  }

  @override
  Widget build(BuildContext context) => ToggleButtons(
        constraints: BoxConstraints(
          minWidth: ((context.isPortrait ? width : 600) * 0.2) / viewModel.title.length,
          minHeight: height * 0.05,
        ),
        isSelected: viewModel.isSelected,
        children: List.generate(
          viewModel.title.length,
          (index) => Padding(
            padding: UIHelper.lowPadding,
            child: Text(
              viewModel.title[index],
            ),
          ),
        ),
        onPressed: (index) {
          viewModel.changeIsSelected(index);

          ToggleButton.selected = viewModel.title[index];
        },
      );
}
