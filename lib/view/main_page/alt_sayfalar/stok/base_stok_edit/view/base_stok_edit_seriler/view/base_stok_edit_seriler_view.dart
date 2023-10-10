import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";

import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../view_model/base_stok_edit_seriler_view_model.dart";

class BaseStokEditSerilerView extends StatefulWidget {
  final BaseEditEnum? model;
  const BaseStokEditSerilerView({super.key, this.model});

  @override
  State<BaseStokEditSerilerView> createState() =>
      _BaseStokEditSerilerViewState();
}

class _BaseStokEditSerilerViewState extends State<BaseStokEditSerilerView> {
  BaseStokEditSerilerViewModel viewModel = BaseStokEditSerilerViewModel();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) {
        return Card(
            child: Observer(
                builder: (_) => SwitchListTile.adaptive(
                    value: viewModel.switchValueList[index],
                    onChanged: widget.model == BaseEditEnum.goruntule
                        ? null
                        : (value) {
                            viewModel.changeSwitchValue(index);
                          },
                    title: Text(viewModel.labelList[index]))));
      },
    );
  }
}
