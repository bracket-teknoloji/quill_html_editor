import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";

import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
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
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...List.generate(
              6,
              (index) => Card(
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
            ),
            const Text("Seri Bakiye Listesi").paddingAll(UIHelper.lowSize),
            Divider(endIndent: UIHelper.lowSize, indent: UIHelper.lowSize).paddingSymmetric(vertical: UIHelper.midSize),
            ...List.generate(
              viewModel.seriList?.length ?? 0,
              (index) => Card(
                child: ListTile(
                  title: Text(viewModel.seriList?[index].seriNo ?? ""),
                  subtitle: Text("Depo: ${viewModel.seriList?[index].depoKodu.toStringIfNotNull}"),
                  trailing: Text("${viewModel.seriList?[index].miktar.toIntIfDouble} ${StokDetayModel.instance.stokList?.first.olcuBirimi ?? ""}"),
                ),
              ),
            ),
          ],
        ).paddingAll(UIHelper.midSize),
      );
}
