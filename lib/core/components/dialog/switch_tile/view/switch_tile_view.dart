import "package:flutter/material.dart";

import "../../../../base/state/base_state.dart";
import "../view_model/switch_tile_view_model.dart";

class DialogSwitchTile extends StatefulWidget {
  const DialogSwitchTile({super.key, this.title, required this.value});
  final String? title;
  final bool? value;

  @override
  State<DialogSwitchTile> createState() => _DialogSwitchTileState();
}

class _DialogSwitchTileState extends BaseState<DialogSwitchTile> {
  DialogSwitchTileViewModel viewModel = DialogSwitchTileViewModel();

  @override
  Widget build(BuildContext context) => CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(widget.title.toString()),
        value: widget.value,
        onChanged: (value) => viewModel.changeValue(value),
      );
}
