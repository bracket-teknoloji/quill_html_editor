import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/tahsilat_request_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/alt_sayfalar/kalemler/view_model/dekont_edit_kalemler_view_model.dart";

class DekontEditKalemlerView extends StatefulWidget {
  final ValueChanged<int> onChanged;
  final BaseEditEnum baseEditEnum;
  const DekontEditKalemlerView({super.key, required this.onChanged, required this.baseEditEnum});

  @override
  State<DekontEditKalemlerView> createState() => _DekontEditKalemlerViewState();
}

class _DekontEditKalemlerViewState extends BaseState<DekontEditKalemlerView> {
  DekontEditKalemlerViewModel viewModel = DekontEditKalemlerViewModel();
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await Get.toNamed("/mainPage/dekontKalemEkle");
            if (result != null) {
              viewModel.addKalemler(result);
              widget.onChanged(viewModel.kalemler?.length ?? 0);
            }
          },
          child: const Icon(Icons.add),
        ),
        body: Observer(
          builder: (_) {
            if (viewModel.kalemler.ext.isNullOrEmpty) {
              return const Center(child: Text("Kalem Ekleyin"));
            }
            return ListView.builder(
              itemCount: viewModel.kalemler?.length,
              padding: UIHelper.lowPadding,
              itemBuilder: (context, index) {
                final item = viewModel.kalemler![index];
                return Card(
                  child: ListTile(
                    onTap: () async => await getCardBottomSheet(item, index),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ColorfulBadge(label: Text(item.hesapTipiAciklama ?? "")).paddingOnly(right: UIHelper.lowSize),
                                Text(item.hesapKodu ?? ""),
                              ],
                            ),
                            Row(
                              children: [
                                const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli).paddingOnly(right: UIHelper.lowSize).yetkiVarMi(item.dovizliMi),
                                Text("${item.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                                ColorfulBadge(label: Text(item.ba ?? "")).paddingOnly(left: UIHelper.lowSize),
                              ],
                            ),
                          ],
                        ),
                        Text(item.kalemAdi ?? ""),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${item.aciklama}").paddingOnly(top: UIHelper.highSize).yetkiVarMi(item.aciklama != null),
                        Text("Plasiyer:\n${item.plasiyerAdi ?? item.plasiyerKodu ?? ""}").paddingOnly(top: UIHelper.highSize),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
        bottomNavigationBar: BottomBarWidget(
          isScrolledDown: true,
          children: [
            FooterButton(
              children: [
                const Text("Borç"),
                Observer(
                  builder: (_) => Text("${viewModel.toplamBorc.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(color: ColorPalette.mantis)),
                ),
              ],
            ),
            FooterButton(
              children: [
                const Text("Alacak"),
                Observer(
                  builder: (_) => Text("${viewModel.toplamAlacak.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(color: ColorPalette.persianRed)),
                ),
              ],
            ),
          ],
        ),
      );

  Future<void> getCardBottomSheet(DekontKalemler model, int index) async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: model.kalemAdi ?? "",
      children: [
        BottomSheetModel(
          title: "Düzelt",
          iconWidget: Icons.edit_outlined,
          onTap: () async {
            Get.back();
            final result = await Get.toNamed("/mainPage/dekontKalemEkle", arguments: model);
            if (result != null) {
              viewModel.updateKalemler(index, result);
              widget.onChanged(viewModel.kalemler?.length ?? 0);
            }
          },
        ),
        BottomSheetModel(
          title: "Sil",
          iconWidget: Icons.delete_outline_outlined,
          onTap: () async {
            Get.back();
            dialogManager.showAreYouSureDialog(() {
              viewModel.removeKalemler(index);
              widget.onChanged(viewModel.kalemler?.length ?? 0);
            });
          },
        ),
      ],
    );
  }
}
