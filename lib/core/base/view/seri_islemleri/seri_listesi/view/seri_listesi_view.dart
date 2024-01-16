import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/view/seri_islemleri/seri_listesi/view_model/seri_listesi_view_model.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

class SeriListesiView extends StatefulWidget {
  final KalemModel kalemModel;
  const SeriListesiView({super.key, required this.kalemModel});

  @override
  State<SeriListesiView> createState() => _SeriListesiViewState();
}

class _SeriListesiViewState extends State<SeriListesiView> {
  late final SeriListesiViewModel viewModel;
  @override
  void initState() {
    viewModel = SeriListesiViewModel(widget.kalemModel);
    viewModel.setKalemModel(widget.kalemModel);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Seri Listesi",
              subtitle: viewModel.kalemModel.seriList?.length.toStringIfNotNull ?? "0",
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.check_outlined)),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Stok Kodu: ${viewModel.kalemModel.stokKodu ?? ""}"),
            Text("Depo Kodu: ${viewModel.kalemModel.depoKodu ?? 0}"),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text("Seri Rehberi"),
                    icon: const Icon(Icons.safety_divider),
                  ).paddingAll(UIHelper.lowSize),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    label: const Text("Seri Girişi"),
                    icon: const Icon(Icons.edit_outlined),
                  ).paddingAll(UIHelper.lowSize),
                ),
              ],
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
        bottomNavigationBar: bottomBar(),
      );

  BottomBarWidget bottomBar() => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              const Text("Hareket Miktarı"),
              Observer(
                builder: (_) => Text(viewModel.hareketMiktari.toString()),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Kalan Miktar"),
              Observer(
                builder: (_) => Text(viewModel.kalanMiktar.toString()),
              ),
            ],
          ),
        ],
      );
}
