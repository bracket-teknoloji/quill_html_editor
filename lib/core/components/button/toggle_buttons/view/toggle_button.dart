import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../base/state/base_state.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../view_model/toggle_button_view_model.dart";

class ToggleButton extends StatefulWidget {
  static String selected = "";
  // onCHanged fonksiyonu ile seçilen butonun değerini almak için kullanılan değişken
  final Function(String)? onChanged;
  const ToggleButton({super.key, this.onChanged});

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
  Widget build(BuildContext context) {
    return ToggleButtons(
      direction: Axis.horizontal,
      constraints: BoxConstraints(minWidth: ((context.isPortrait ? width : 600) * 0.2) / viewModel.title.length, minHeight: height * 0.05),
      isSelected: viewModel.isSelected,
      children: List.generate(viewModel.title.length, (index) {
        return Padding(
          padding: UIHelper.lowPadding,
          child: Text(
            viewModel.title[index],
          ),
        );
      }),
      onPressed: (index) {
        viewModel.changeIsSelected(index);
       
        ToggleButton.selected = viewModel.title[index];
      },
    );
  }
}
