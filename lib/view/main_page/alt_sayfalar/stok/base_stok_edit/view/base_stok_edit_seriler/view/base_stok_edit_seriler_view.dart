import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../core/constants/extensions/iterable_extensions.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../model/stok_detay_model.dart";
import "../view_model/base_stok_edit_seriler_view_model.dart";

class BaseStokEditSerilerView extends StatefulWidget {
  final BaseEditEnum? model;
  const BaseStokEditSerilerView({super.key, this.model});

  @override
  State<BaseStokEditSerilerView> createState() => _BaseStokEditSerilerViewState();
}

class _BaseStokEditSerilerViewState extends BaseState<BaseStokEditSerilerView> {
  BaseStokEditSerilerViewModel viewModel = BaseStokEditSerilerViewModel();
  StokDetayModel get stokModel => StokDetayModel.instance;
  @override
  Widget build(BuildContext context) => BaseScaffold(
        body: body(),
        bottomNavigationBar: bottomBar(),
      );

  Widget body() => SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2.3,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: viewModel.labelList.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text(viewModel.labelList[index]),
                  subtitle: Align(
                    alignment: Alignment.topLeft,
                    child: Observer(
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
            ),
            Text("Seri Bakiye Listesi", style: context.textTheme.titleLarge).paddingAll(UIHelper.lowSize),
            const Divider(
              indent: UIHelper.lowSize,
              endIndent: UIHelper.lowSize,
            ),
            seriListesi(),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Widget seriListesi() {
    if (stokModel.seriList == null || stokModel.seriList!.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.info_outline),
            Text("Kayıt Bulunamadı.", style: theme.textTheme.titleMedium).paddingSymmetric(vertical: UIHelper.midSize),
            Text("Yaptığınız işlem sonuç döndürmedi.", style: theme.textTheme.titleSmall),
          ],
        ).paddingSymmetric(vertical: UIHelper.midSize),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: stokModel.seriList?.length ?? 0,
      itemBuilder: (context, index) {
        final SeriList? seri = stokModel.seriList?[index];
        return Card(
          child: ListTile(
            title: Text(seri?.seriNo ?? ""),
            subtitle: Text("Depo: ${seri?.depoKodu ?? ""}${seri?.depoTanimi ?? ""}"),
            trailing: Text("${seri?.miktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? ""} AD"),
          ),
        );
      },
    );
  }

  BottomBarWidget bottomBar() => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(children: [const Text("Kayıt Sayısı"), Text(stokModel.seriList?.length.toStringIfNotNull ?? "0")]),
          FooterButton(children: [const Text("Miktar"), Text((stokModel.seriList?.map((e) => e.miktar ?? 0).sum ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.miktar))]),
        ],
      );
}
