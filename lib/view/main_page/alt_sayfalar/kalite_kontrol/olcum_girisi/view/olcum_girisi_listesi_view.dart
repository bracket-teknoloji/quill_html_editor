import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "package:picker/core/components/card/olcum_girisi_listesi_card.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/view_model/olcum_girisi_listesi_view_model.dart";

class OlcumGirisiListesiView extends StatefulWidget {
  const OlcumGirisiListesiView({super.key});

  @override
  State<OlcumGirisiListesiView> createState() => _OlcumGirisiListesiViewState();
}

class _OlcumGirisiListesiViewState extends BaseState<OlcumGirisiListesiView> {
  final OlcumGirisiViewModel viewModel = OlcumGirisiViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
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
            if (viewModel.searchBar) {
              return CustomAppBarTextField(onFieldSubmitted: viewModel.setSearchText);
            }
            return AppBarTitle(
              title: "Ölçüm Girişi",
              subtitle: "${viewModel.olcumList?.length ?? 0}",
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: viewModel.setSearchBar,
            icon: Observer(
              builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined),
            ),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(
              icon: Icons.filter_alt_outlined,
              child: Text(loc.generalStrings.filter),
              onPressed: () {},
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              child: Text(loc.generalStrings.sort),
              onPressed: () {},
            ),
            AppBarButton(
              icon: Icons.more_horiz_outlined,
              onPressed: () {},
            ),
          ],
        ),
      );

  CustomFloatingActionButton fab() => CustomFloatingActionButton(isScrolledDown: true, onPressed: () {});

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.getData();
        },
        child: Observer(
          builder: (_) {
            if (viewModel.olcumList == null) return const ListViewShimmer();
            if (viewModel.olcumList?.isEmpty == true) return const Center(child: Text("Ölçüm Girişi bulunamadı."));
            return ListView.builder(
              itemCount: viewModel.olcumList?.length ?? 0,
              padding: UIHelper.lowPadding,
              itemBuilder: (context, index) => OlcumGirisiListesiCard(model: viewModel.olcumList![index]),
            );
          },
        ),
      );
}
