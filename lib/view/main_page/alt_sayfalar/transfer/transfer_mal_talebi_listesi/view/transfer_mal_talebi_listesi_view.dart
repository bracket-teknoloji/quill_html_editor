import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/view/base_scaffold.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_listesi/view_model/transfer_mal_talebi_listesi_view_model.dart";

class TransferMalTalebiListesiView extends StatefulWidget {
  const TransferMalTalebiListesiView({super.key});

  @override
  State<TransferMalTalebiListesiView> createState() => _TransferMalTalebiListesiViewState();
}

class _TransferMalTalebiListesiViewState extends State<TransferMalTalebiListesiView> {
  final TransferMalTalebiListesiViewModel viewModel = TransferMalTalebiListesiViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        floatingActionButton: const CustomFloatingActionButton(isScrolledDown: true),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.isSearchBarOpen) {
              return CustomAppBarTextField(
                onChanged: viewModel.setSearchText,
              );
            }
            return const AppBarTitle(title: "Transfer Mal Talebi Listesi");
          },
        ),
        actions: [
          IconButton(
            icon: Observer(
              builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
            ),
            onPressed: () async {
              if (viewModel.isSearchBarOpen) {
                await viewModel.resetList();
              }
              viewModel.changeSearchBarStatus();
            },
          ),
        ],
      );

  Observer body() => Observer(
        builder: (_) => RefreshableListView(
          onRefresh: viewModel.resetList,
          items: viewModel.filteredObservableList,
          itemBuilder: (item) => Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("#${item.id}").paddingOnly(right: UIHelper.lowSize),
                      ColorfulBadge(label: Text(item.durumAdi ?? ""), badgeColorEnum: item.isTamamlandi ? BadgeColorEnum.basarili : BadgeColorEnum.kapali),
                    ],
                  ),
                  if (item.tarih != null) Text(item.tarih.toDateString),
                ],
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLayoutBuilder.divideInHalf(
                    children: [
                      // Text("Karşı Şube: ${item.kars}"),
                      if (item.kalemSayisi != null) Text("Kalem Adedi: ${item.kalemSayisi}"),
                      if (item.miktar != null) Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                      if (item.tamamlananMiktar != null) Text("Tammlanan Miktar: ${item.tamamlananMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                      if (item.kalanMiktar != null) Text("Kalan Miktar: ${item.kalanMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                    ],
                  ),
                  if (item.kayityapankul != null) Text("Kaydeden: ${item.kayityapankul}"),
                ],
              ),
            ),
          ),
        ),
      );
}
