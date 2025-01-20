import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../model/paketleme_listesi_model.dart";
import "../view_model/paketleme_listesi_view_model.dart";

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
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => viewModel.isSearchBarOpen
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
              onPressed: viewModel.changeSearchBarStatus,
              icon: Observer(
                builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
              ),
            ),
          ],
        ),
        body: Observer(
          builder: (_) => RefreshableListView(onRefresh: viewModel.getData, items: viewModel.filteredPaketlemeListesi, itemBuilder: card),
        ),
      );

  Card card(PaketlemeListesiModel item) => Card(
        child: ListTile(
          onTap: () => bottomSheet(item),
          title: Text(item.kodu ?? ""),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  if (item.kilit == "E")
                    const ColorfulBadge(
                      label: Text("Kilitli"),
                      badgeColorEnum: BadgeColorEnum.kilitli,
                    ),
                ],
              ),
              if (item.paketTuruTanimi != null) Text("Paket Türü: ${item.paketTuruTanimi}"),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  if (item.kalemSayisi != null) Text("Kalem Adedi: ${item.kalemSayisi ?? 0}"),
                  if (item.depoKodu != null) Text("Depo Kodu: ${item.depoKodu}"),
                ],
              ),
              if (item.kayityapankul != null) Text("Kaydeden: ${item.kayityapankul}"),
              if (item.kayittarihi != null) Text("Kaydeden: ${item.kayittarihi?.toDateString}"),
            ],
          ),
        ),
      );

  Future<void> bottomSheet(PaketlemeListesiModel item) async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: item.kodu ?? "",
      children: [
        BottomSheetModel(
          title: "Paket İçeriği",
          iconWidget: Icons.inventory_outlined,
          onTap: () async {
            Get
              ..back()
              ..toNamed("/mainPage/paketIcerigi", arguments: item);
          },
        ),
        if (yetkiController.stokPaketlemeEkle && item.kilit != "E") BottomSheetModel(title: loc.generalStrings.edit, iconWidget: Icons.edit_outlined),
        if (yetkiController.stokPaketlemeSil && item.kilit != "E")
          BottomSheetModel(
            title: loc.generalStrings.delete,
            iconWidget: Icons.delete_outline_outlined,
            onTap: () async {
              Get.back();
              dialogManager.showAreYouSureDialog(() async {
                final result = await viewModel.deleteItem(item.id);
                if (result.isSuccess) {
                  dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
                  await viewModel.getData();
                }
              });
            },
          ),
        //TODO : bir yere gitmiyor
        // if (yetkiController.yazdirmaPaketlemeEtiketi) BottomSheetModel(title: loc.generalStrings.print, iconWidget: Icons.print_outlined),
      ],
    );
  }
}
