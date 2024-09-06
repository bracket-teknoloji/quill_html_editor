import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/view/base_scaffold.dart";
import "package:picker/core/base/view/masraf_kodu/model/masraf_kodu_rehberi_model.dart";
import "package:picker/core/base/view/masraf_kodu/view_model/masraf_kodu_rehberi_view_model.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";

final class MasrafKoduRehberiView extends StatefulWidget {
  final int tipi;
  const MasrafKoduRehberiView({super.key, required this.tipi});

  @override
  State<MasrafKoduRehberiView> createState() => _MasrafKoduRehberiViewState();
}

final class _MasrafKoduRehberiViewState extends State<MasrafKoduRehberiView> {
  final MasrafKoduRehberiViewModel viewModel = MasrafKoduRehberiViewModel();
  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    viewModel.requestModel.tipi = widget.tipi;
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      _scrollController.addListener(() async => viewModel.changeScrollStatus(_scrollController.position));
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) => viewModel.isSearchBarOpen
              ? CustomAppBarTextField(
                  onFieldSubmitted: (value) async {
                    viewModel.setSearchText(value);
                    await viewModel.resetList();
                  },
                )
              : AppBarTitle(
                  title: "Masraf Kodu Rehberi",
                  subtitle: viewModel.observableList?.length.toStringIfNotNull,
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
      );

  Widget body() => Observer(
        builder: (_) => RefreshableListView.pageable(
          onRefresh: viewModel.resetList,
          scrollController: _scrollController,
          dahaVarMi: viewModel.dahaVarMi,
          items: viewModel.observableList,
          itemBuilder: masrafKoduCard,
        ),
      );

  Card masrafKoduCard(MasrafKoduRehberiModel item) => Card(
        child: ListTile(
          title: Text(item.masrafKodu ?? ""),
          subtitle: Text(item.masrafAdi ?? ""),
          onTap: () => Get.back(result: item),
        ),
      );
}
