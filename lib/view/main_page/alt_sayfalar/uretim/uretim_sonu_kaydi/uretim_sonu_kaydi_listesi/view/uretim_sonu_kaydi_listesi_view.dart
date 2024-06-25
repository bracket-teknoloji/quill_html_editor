import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/card/uretim_sonu_kaydi_listesi_card.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_listesi/view_model/uretim_sonu_kaydi_listesi_view_model.dart";

final class UretimSonuKaydiListesiView extends StatefulWidget {
  const UretimSonuKaydiListesiView({super.key});

  @override
  State<UretimSonuKaydiListesiView> createState() => _UretimSonuKaydiListesiViewState();
}

final class _UretimSonuKaydiListesiViewState extends BaseState<UretimSonuKaydiListesiView> {
  final UretimSonuKaydiListesiViewModel viewModel = UretimSonuKaydiListesiViewModel();
  late final TextEditingController searchController;
  late final ScrollController scrollController;

  @override
  void initState() {
    searchController = TextEditingController();
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      scrollController.addListener(() {
        viewModel.changeScrollStatus(scrollController.position);
      });
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.isSearchBarOpen) {
              return CustomAppBarTextField(
                controller: searchController,
                onChanged: viewModel.setSearchText,
                onFieldSubmitted: (value) => viewModel.resetList(),
              );
            }
            return AppBarTitle(title: "Üretim Sonu Kayıtları", subtitle: viewModel.observableList?.length.toStringIfNotNull ?? "0");
          },
        ),
        actions: [
          IconButton(
            onPressed: viewModel.changeSearchBarStatus,
            icon: Observer(
              builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
            ),
          ),
        ],
      );

  Observer fab() => Observer(
        builder: (_) => CustomFloatingActionButton(isScrolledDown: viewModel.isScrollDown && yetkiController.uretimSonuKaydiEkle),
      );

  Observer body() => Observer(
        builder: (_) => RefreshableListView.pageable(
          scrollController: scrollController,
          onRefresh: viewModel.resetList,
          dahaVarMi: viewModel.dahaVarMi,
          items: viewModel.observableList,
          itemBuilder: (item) => UretimSonuKaydiListesiCard(model: item),
        ),
      );
}
