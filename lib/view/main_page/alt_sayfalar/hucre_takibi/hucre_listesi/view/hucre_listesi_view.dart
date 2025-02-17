import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/color_palette.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../model/hucre_listesi_model.dart";
import "../view_model/hucre_listesi_view_model.dart";

final class HucreListesiView extends StatefulWidget {
  const HucreListesiView({super.key, this.depoKodu});
  final int? depoKodu;

  @override
  State<HucreListesiView> createState() => _HucreListesiViewState();
}

final class _HucreListesiViewState extends BaseState<HucreListesiView> {
  final HucreListesiViewModel viewModel = HucreListesiViewModel();
  late final TextEditingController searchController;

  @override
  void initState() {
    searchController = TextEditingController();
    viewModel.setDepoKodu(widget.depoKodu ?? 0);
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
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: Observer(
        builder:
            (_) => AppBarTitle(
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
          child: Observer(
            builder:
                (_) => RefreshableListView(
                  onRefresh: viewModel.getData,
                  items: viewModel.filteredHucreListesi,
                  itemBuilder: hucreCard,
                ),
          ),
        ),
      ],
    ).paddingAll(UIHelper.lowSize),
  );

  Card hucreCard(HucreListesiModel item) => Card(
    child: ListTile(
      onTap: () async {
        if (widget.depoKodu != null) return Get.back(result: item);
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
          if (item.eksiyeDusebilir == true)
            const Text("Eksiye düşebilen hücre", style: TextStyle(color: ColorPalette.persianRed)),
        ],
      ),
    ),
  );
}
