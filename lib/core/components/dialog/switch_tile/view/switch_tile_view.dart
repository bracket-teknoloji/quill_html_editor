import 'package:flutter/material.dart';

import '../../../../base/state/base_state.dart';
import '../view_model/switch_tile_view_model.dart';

class DialogSwitchTile extends StatefulWidget {
  final String? title;
  final bool? value;
  const DialogSwitchTile({super.key, this.title, required this.value});

  @override
  State<DialogSwitchTile> createState() => _DialogSwitchTileState();
}

class _DialogSwitchTileState extends BaseState<DialogSwitchTile> {
  DialogSwitchTileViewModel viewModel = DialogSwitchTileViewModel();

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      controlAffinity: ListTileControlAffinity.leading,
      title: Text(widget.title.toString()),
      value: widget.value,
      onChanged: (value) => viewModel.changeValue(value),
    );
  }
}
