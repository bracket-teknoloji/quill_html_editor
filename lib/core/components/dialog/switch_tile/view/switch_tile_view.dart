import "package:flutter/material.dart";

import "../../../../base/state/base_state.dart";
import "../view_model/switch_tile_view_model.dart";

final class DialogSwitchTile extends StatefulWidget {
  const DialogSwitchTile({required this.value, super.key, this.title});
  final String? title;
  final bool? value;

  @override
  State<DialogSwitchTile> createState() => _DialogSwitchTileState();
}

final class _DialogSwitchTileState extends BaseState<DialogSwitchTile> {
  DialogSwitchTileViewModel viewModel = DialogSwitchTileViewModel();

  @override
  Widget build(BuildContext context) => CheckboxListTile(
    controlAffinity: ListTileControlAffinity.leading,
    title: Text(widget.title.toString()),
    value: widget.value,
    onChanged: (value) => viewModel.changeValue(value),
  );
}
