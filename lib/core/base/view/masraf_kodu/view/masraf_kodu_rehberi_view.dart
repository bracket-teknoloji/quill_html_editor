import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/view/masraf_kodu/model/masraf_kodu_rehberi_model.dart";
import "package:picker/core/base/view/masraf_kodu/view_model/masraf_kodu_rehberi_view_model.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

class MasrafKoduRehberiView extends StatefulWidget {
  final int tipi;
  const MasrafKoduRehberiView({super.key, required this.tipi});

  @override
  State<MasrafKoduRehberiView> createState() => _MasrafKoduRehberiViewState();
}

class _MasrafKoduRehberiViewState extends State<MasrafKoduRehberiView> {
  final MasrafKoduRehberiViewModel viewModel = MasrafKoduRehberiViewModel();
  late final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    viewModel.requestModel.tipi = widget.tipi;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
          await viewModel.getData();
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => viewModel.searchBar
                ? CustomAppBarTextField(
                    onFieldSubmitted: (value) async {
                      viewModel.setSearchText(value);
                      await viewModel.resetPage();
                    },
                  )
                : AppBarTitle(
                    title: "Masraf Kodu Rehberi",
                    subtitle: viewModel.masrafKoduRehberiList?.length.toStringIfNotNull,
                  ),
          ),
          actions: [
            IconButton(
              onPressed: viewModel.changeSearchBar,
              icon: Observer(
                builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined),
              ),
            ),
          ],
        ),
        body: RefreshIndicator.adaptive(
          onRefresh: () async => viewModel.resetPage(),
          child: Observer(
            builder: (_) {
              if (viewModel.masrafKoduRehberiList.ext.isNullOrEmpty) {
                if (viewModel.masrafKoduRehberiList != null) {
                  return const Center(
                    child: Text(
                      "Masraf Kodu Bulunamadı.",
                    ),
                  );
                } else {
                  return const ListViewShimmer();
                }
              }
              return ListView.builder(
                itemCount: viewModel.masrafKoduRehberiList != null ? ((viewModel.masrafKoduRehberiList?.length ?? 0) + (viewModel.dahaVarMi ? 1 : 0)) : 0,
                padding: UIHelper.lowPadding,
                controller: _scrollController,
                primary: false,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  if (index == viewModel.masrafKoduRehberiList?.length) {
                    return const Center(child: CircularProgressIndicator.adaptive());
                  }
                  final MasrafKoduRehberiModel item = viewModel.masrafKoduRehberiList![index];
                  return Card(
                    child: ListTile(
                      title: Text(item.masrafKodu ?? ""),
                      subtitle: Text(item.masrafAdi ?? ""),
                      onTap: () => Get.back(result: item),
                    ),
                  );
                },
              );
            },
          ),
        ),
      );
}
