import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/seri_islemleri/seri_listesi/view_model/seri_listesi_view_model.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";

class SeriListesiView extends StatefulWidget {
  final KalemModel kalemModel;
  const SeriListesiView({super.key, required this.kalemModel});

  @override
  State<SeriListesiView> createState() => _SeriListesiViewState();
}

class _SeriListesiViewState extends BaseState<SeriListesiView> {
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
            IconButton(
              onPressed: () {
                Get.back(result: viewModel.kalemModel.seriList);
              },
              icon: const Icon(Icons.check_outlined),
            ),
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
                    onPressed: () async {
                      final result = await Get.toNamed("/seriDetayi", arguments: (viewModel.hareketMiktari, viewModel.kalanMiktar));
                      if (result is SeriList) {
                        viewModel.addSeriList(result);
                      }
                    },
                    label: const Text("Seri Girişi"),
                    icon: const Icon(Icons.edit_outlined),
                  ).paddingAll(UIHelper.lowSize),
                ),
              ],
            ).yetkiVarMi(viewModel.kalanMiktar != 0 || viewModel.kalemModel.seriList.ext.isNullOrEmpty),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (viewModel.kalemModel.seriList.ext.isNullOrEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.dashboard_outlined),
                          Text("Seri Listesi Boş"),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: viewModel.kalemModel.seriList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final SeriList model = viewModel.kalemModel.seriList![index];
                      return Card(
                        child: ListTile(
                          title: Text(model.seri1 ?? ""),
                          subtitle: Text(model.miktar.toIntIfDouble.toStringIfNotNull ?? ""),
                          onTap: () async {
                            await bottomSheetDialogManager.showBottomSheetDialog(
                              context,
                              title: model.seri1 ?? "",
                              children: [
                                BottomSheetModel(title: loc(context).generalStrings.edit, iconWidget: Icons.edit_outlined),
                                BottomSheetModel(
                                  title: loc(context).generalStrings.delete,
                                  iconWidget: Icons.delete_outline_outlined,
                                  onTap: () {
                                    Get.back();
                                    dialogManager.showAreYouSureDialog(() {
                                      viewModel.removeSeriList(model.seri1 ?? "");
                                    });
                                  },
                                ),
                                BottomSheetModel(title: loc(context).generalStrings.print, iconWidget: Icons.print_outlined),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
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
