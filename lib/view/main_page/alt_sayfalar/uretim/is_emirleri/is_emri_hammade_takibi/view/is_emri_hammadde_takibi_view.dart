import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/components/card/is_emri_hammadde_takibi_card.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_hammade_takibi/view_model/is_emri_hammadde_takibi_view_model.dart";

final class IsEmriHammaddeTakibiView extends StatefulWidget {
  const IsEmriHammaddeTakibiView({super.key});

  @override
  State<IsEmriHammaddeTakibiView> createState() => _IsEmriHammaddeTakibiViewState();
}

final class _IsEmriHammaddeTakibiViewState extends State<IsEmriHammaddeTakibiView> {
  final IsEmriHammaddeTakibiViewModel viewModel = IsEmriHammaddeTakibiViewModel();
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
        appBar: appBar(),
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
            return AppBarTitle(title: "İş Emri Hammadde Takibi", subtitle: (viewModel.observableList?.length ?? 0).toStringIfNotNull);
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.changeSearchBarStatus();
              if (!viewModel.isSearchBarOpen) {
                searchController.clear();
              }
            },
            icon: Observer(
              builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
            ),
          ),
        ],
      );

  Observer body() => Observer(
        builder: (_) => RefreshableListView(
          onRefresh: viewModel.getData,
          items: viewModel.getList,
          itemBuilder: (item) => IsEmriHammaddeTakibiCard(model: item),
        ),
      );
}
