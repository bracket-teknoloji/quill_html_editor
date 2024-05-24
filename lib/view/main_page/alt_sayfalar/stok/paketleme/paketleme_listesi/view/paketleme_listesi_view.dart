import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paketleme_listesi/model/paketleme_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/paketleme/paketleme_listesi/view_model/paketleme_listesi_view_model.dart";

final class PaketlemeListesiView extends StatefulWidget {
  const PaketlemeListesiView({super.key});

  @override
  State<PaketlemeListesiView> createState() => _PaketlemeListesiViewState();
}

final class _PaketlemeListesiViewState extends BaseState<PaketlemeListesiView> {
  final PaketlemeListesiViewModel viewModel = PaketlemeListesiViewModel();
  late final TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => viewModel.searchBar
                ? CustomAppBarTextField(
                    controller: searchController,
                    onChanged: viewModel.setSearchText,
                  )
                : AppBarTitle(
                    title: "Paketleme",
                    subtitle: viewModel.filteredPaketlemeListesi?.length.toStringIfNotNull,
                  ),
          ),
          actions: [
            IconButton(
              onPressed: viewModel.setSearchBar,
              icon: Observer(
                builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined),
              ),
            ),
          ],
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: viewModel.getData,
          child: Observer(
            builder: (_) {
              if (viewModel.filteredPaketlemeListesi == null) return const ListViewShimmer();
              if (viewModel.filteredPaketlemeListesi!.isEmpty) return const Center(child: Text("Aradığınız kriterlere uygun sonuç bulunamadı."));
              return ListView.builder(
                itemCount: viewModel.filteredPaketlemeListesi?.length ?? 0,
                itemBuilder: (context, index) {
                  final item = viewModel.filteredPaketlemeListesi![index];
                  return Card(
                    child: ListTile(
                      onTap: () => bottomSheet(item),
                      title: Text(item.kodu ?? ""),
                      trailing: IconButton(onPressed: () {}, icon: const Icon(Icons.print_outlined)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const ColorfulBadge(
                                label: Text("Kilitli"),
                                badgeColorEnum: BadgeColorEnum.kilitli,
                              ).yetkiVarMi(item.kilit == "E"),
                            ],
                          ),
                          Text("Paket Türü: ${item.paketTuruTanimi}").yetkiVarMi(item.paketTuruTanimi != null),
                          CustomLayoutBuilder(
                            splitCount: 2,
                            children: [
                              Text("Kalem Adedi: ${item.kalemSayisi ?? 0}").yetkiVarMi(item.kalemSayisi != null),
                              Text("Depo Kodu: ${item.depoKodu}").yetkiVarMi(item.depoKodu != null),
                            ],
                          ),
                          Text("Kaydeden: ${item.kayityapankul}").yetkiVarMi(item.kayityapankul != null),
                          Text("Kaydeden: ${item.kayittarihi?.toDateString}").yetkiVarMi(item.kayittarihi != null),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      );

  Future<void> bottomSheet(PaketlemeListesiModel item) async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: item.kodu ?? "",
      children: [
        BottomSheetModel(title: "Kalemler", iconWidget: Icons.edit_outlined),
        BottomSheetModel(title: loc.generalStrings.edit, iconWidget: Icons.edit_outlined),
        BottomSheetModel(
          title: loc.generalStrings.delete,
          iconWidget: Icons.delete_outline_outlined,
          onTap: () async {
            Get.back();
            dialogManager.showAreYouSureDialog(() async {
              final result = await viewModel.deleteItem(item.id);
              if (result.success == true) {
                dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
                await viewModel.getData();
              }
            });
          },
        ),
        BottomSheetModel(title: loc.generalStrings.print, iconWidget: Icons.print_outlined),
      ],
    );
  }
}
