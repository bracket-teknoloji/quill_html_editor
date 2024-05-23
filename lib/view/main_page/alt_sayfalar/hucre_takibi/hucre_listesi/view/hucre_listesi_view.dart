import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/model/hucre_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_listesi/view_model/hucre_listesi_view_model.dart";

class HucreListesiView extends StatefulWidget {
  final bool isGetData;
  const HucreListesiView({super.key, required this.isGetData});

  @override
  State<HucreListesiView> createState() => _HucreListesiViewState();
}

class _HucreListesiViewState extends BaseState<HucreListesiView> {
  final HucreListesiViewModel viewModel = HucreListesiViewModel();
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
            builder: (_) => AppBarTitle(
              title: "Hücre Listesi",
              subtitle: (viewModel.filteredHucreListesi?.length ?? 0).toStringIfNotNull,
            ),
          ),
        ),
        body: Column(
          children: [
            CustomTextField(
              labelText: "Hücre giriniz",
              controller: searchController,
              onChanged: viewModel.setSearchText,
              suffix: IconButton(
                onPressed: () async {
                  final result = await Get.toNamed("qr");
                  if (result is String) {
                    searchController.text = result;
                    viewModel.setSearchText(result);
                  }
                },
                icon: const Icon(Icons.qr_code_scanner_outlined),
              ),
            ),
            Expanded(
              child: RefreshIndicator.adaptive(
                onRefresh: viewModel.getData,
                child: Observer(
                  builder: (_) {
                    if (viewModel.filteredHucreListesi == null) return const ListViewShimmer();
                    if (viewModel.filteredHucreListesi!.isEmpty) return const Center(child: Text("Hücre bulunamadı."));
                    return ListView.builder(
                      itemCount: viewModel.filteredHucreListesi?.length ?? 0,
                      itemBuilder: (context, index) {
                        final HucreListesiModel item = viewModel.filteredHucreListesi![index];
                        return hucreCard(item);
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Card hucreCard(HucreListesiModel item) => Card(
        child: ListTile(
          onTap: () async {
            if (widget.isGetData) {
              Get.back(result: item);
            }
            if (yetkiController.yazdirmaHucre) {
              await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: item.hucreKodu ?? "",
                children: [
                  BottomSheetModel(
                    title: loc.generalStrings.print,
                    iconWidget: Icons.print_outlined,
                    onTap: () {
                      Get.back();
                      return Get.toNamed("/mainPage/hucreYazdir", arguments: item);
                    },
                  ),
                ],
              );
            }
          },
          title: Text(item.hucreKodu ?? ""),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${item.depoKodu} - ${item.depoTanimi}"),
              const Text(
                "Eksiye düşebilen hücre",
                style: TextStyle(color: ColorPalette.persianRed),
              ).yetkiVarMi(item.eksiyeDusebilir == true),
            ],
          ),
        ),
      );
}
