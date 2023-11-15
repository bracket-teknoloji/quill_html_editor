import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "../../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../model/stok_detay_model.dart";

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
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: Observer(
          builder: (_) => BottomBarWidget(
            isScrolledDown: true,
            children: [
              FooterButton(children: [Text("Kayıt Sayısı: ${viewModel.seriList?.length ?? 0}")]),
              FooterButton(children: [Text("Miktar: ${(viewModel.seriList?.fold<double>(0, (previousValue, element) => previousValue + (element.miktar ?? 0)) ?? 0).toIntIfDouble}")]),
            ],
          ).yetkiVarMi(viewModel.seriList.ext.isNotNullOrEmpty),
        ),
        body: body(),
      );

  Column body() => Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
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
                  const Text("Seri Bakiye Listesi").paddingAll(UIHelper.lowSize).yetkiVarMi(viewModel.seriList.ext.isNotNullOrEmpty),
                  Divider(endIndent: UIHelper.lowSize, indent: UIHelper.lowSize).paddingSymmetric(vertical: UIHelper.midSize).yetkiVarMi(viewModel.seriList.ext.isNotNullOrEmpty),
                  ...List.generate(
                    viewModel.seriList?.length ?? 0,
                    (index) => Card(
                      color: UIHelper.getColorWithValue(StokDetayModel.instance.stokList?.first.bakiye ?? 0).withOpacity(0.5),
                      child: ListTile(
                        title: Text(viewModel.seriList?[index].seriNo ?? ""),
                        subtitle: Text("Depo: ${viewModel.seriList?[index].depoKodu.toStringIfNotNull}"),
                        trailing: Text("${viewModel.seriList?[index].miktar.toIntIfDouble} ${StokDetayModel.instance.stokList?.first.olcuBirimi ?? ""}"),
                      ),
                    ),
                  ),
                ],
              ).paddingAll(UIHelper.midSize),
            ),
          ),
        ],
      );
}
