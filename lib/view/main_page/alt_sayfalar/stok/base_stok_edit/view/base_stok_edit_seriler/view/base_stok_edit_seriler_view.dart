import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../view_model/base_stok_edit_seriler_view_model.dart";

class BaseStokEditSerilerView extends StatefulWidget {
  final BaseEditEnum? model;
  const BaseStokEditSerilerView({super.key, this.model});

  @override
  State<BaseStokEditSerilerView> createState() => _BaseStokEditSerilerViewState();
}

class _BaseStokEditSerilerViewState extends State<BaseStokEditSerilerView> {
  BaseStokEditSerilerViewModel viewModel = BaseStokEditSerilerViewModel();
  @override
  Widget build(BuildContext context) => Scaffold(
        body: body(),
      );

  Widget body() => ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.labelList.length,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            title: Text(viewModel.labelList[index]),
            trailing: Observer(
              builder: (_) => Switch.adaptive(
                value: viewModel.switchValueList[index],
                onChanged: widget.model == BaseEditEnum.goruntule
                    ? null
                    : (value) {
                        viewModel.changeSwitchValue(index);
                      },
              ),
            ),
          ),
        ),
      ).paddingAll(UIHelper.midSize);
}
