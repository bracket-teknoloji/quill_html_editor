import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../../core/components/card/kasa_listesi_card.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../model/kasa_listesi_model.dart";
import "../view_model/kasa_listesi_view_model.dart";

final class KasaListesiView extends StatefulWidget {
  const KasaListesiView({super.key});

  @override
  State<KasaListesiView> createState() => _KasaListesiViewState();
}

final class _KasaListesiViewState extends BaseState<KasaListesiView> {
  final KasaListesiViewModel viewModel = KasaListesiViewModel();
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: false,
        extendBodyBehindAppBar: false,
        appBar: appBar(),
        body: body2(),
        bottomNavigationBar: bottomAppBar(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.isSearchBarOpen) {
              return CustomAppBarTextField(
                onChanged: viewModel.setSearchText,
              );
            }
            return Observer(builder: (_) => AppBarTitle(title: "Kasa Listesi", subtitle: viewModel.getKasaListesi?.length.toStringIfNotNull ?? ""));
          },
        ),
        actions: [
          IconButton(
            onPressed: viewModel.changeSearchBarStatus,
            icon: Observer(builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined)),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(
              iconWidget: Observer(
                builder: (_) => Icon(
                  Icons.filter_alt_outlined,
                  size: 20,
                  fill: 1,
                  color: viewModel.filtreGroupValue != "T" ? UIHelper.primaryColor : null,
                ),
              ),
              onPressed: filtrele,
              child: Text(loc.generalStrings.filter),
            ),
            AppBarButton(icon: Icons.sort_by_alpha_outlined, onPressed: sirala, child: Text(loc.generalStrings.sort)),
            AppBarButton(
              icon: Icons.refresh_outlined,
              onPressed: () async {
                viewModel.setObservableList(null);
                await viewModel.getData();
              },
              child: Text(loc.generalStrings.refresh),
            ),
          ],
        ),
      );

  Widget body2() => Observer(
        builder: (_) => RefreshableListView(
          onRefresh: viewModel.resetList,
          items: viewModel.getKasaListesi,
          itemBuilder: (item) => KasaListesiCard(
            item: item,
            onSelected: (p0) async {
              if (p0) {
                viewModel.setObservableList(null);
                await viewModel.getData();
              }
            },
          ),
        ),
      );

  Widget body() => RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.setObservableList(null);
          await viewModel.getData();
        },
        child: Observer(
          builder: (_) => viewModel.getKasaListesi == null
              ? const ListViewShimmer()
              : viewModel.getKasaListesi.ext.isNullOrEmpty
                  ? const Center(
                      child: Text("Kasa bulunamadı"),
                    )
                  : Observer(
                      builder: (_) => ListView.builder(
                        padding: UIHelper.lowPadding,
                        itemCount: viewModel.getKasaListesi?.length ?? 0,
                        itemBuilder: (context, index) {
                          final KasaListesiModel? item = viewModel.getKasaListesi?[index];
                          return KasaListesiCard(
                            item: item,
                            onSelected: (p0) async {
                              if (p0) {
                                viewModel.setObservableList(null);
                                await viewModel.getData();
                              }
                            },
                          );
                        },
                      ),
                    ),
        ),
      );

  BottomBarWidget bottomAppBar() => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              const Text("Gelir"),
              Observer(
                builder: (_) => Text(
                  "${viewModel.getGelir.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                  style: const TextStyle(color: ColorPalette.mantis),
                ),
              ),
            ],
            onPressed: () {
              if (viewModel.filtreGroupValue != "A") {
                viewModel.setFiltreGroupValue(3);
              } else {
                viewModel.setFiltreGroupValue(0);
              }
              viewModel.setObservableList(null);
              viewModel.getData();
            },
          ),
          FooterButton(
            children: [
              const Text("Gider"),
              Observer(builder: (_) => Text("${viewModel.getGider.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(color: ColorPalette.persianRed))),
            ],
            onPressed: () {
              if (viewModel.filtreGroupValue != "E") {
                viewModel.setFiltreGroupValue(2);
              } else {
                viewModel.setFiltreGroupValue(0);
              }
              viewModel.setObservableList(null);
              viewModel.getData();
            },
          ),
          FooterButton(
            children: [
              const Text("Bakiye"),
              Observer(builder: (_) => Text("${viewModel.bakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(color: ColorPalette.slateGray))),
            ],
          ),
        ],
      );

  Future<void> sirala() async {
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: loc.generalStrings.sort,
      groupValue: viewModel.sirala,
      children: List.generate(
        viewModel.siralaMap.length,
        (index) => BottomSheetModel(
          title: viewModel.siralaMap.keys.toList()[index],
          value: viewModel.siralaMap.values.toList()[index],
          groupValue: viewModel.siralaMap.values.toList()[index],
        ),
      ),
    );
    if (result != null) {
      viewModel.setSirala(result);
      viewModel.setObservableList(null);
      viewModel.getData();
    }
  }

  Future<void> filtrele() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        children: [
          Observer(
            builder: (_) => SlideControllerWidget(
              childrenTitleList: viewModel.filtreleMap.keys.toList(),
              childrenValueList: viewModel.filtreleMap.values.toList(),
              filterOnChanged: (index) => viewModel.setFiltreGroupValue(index ?? 0),
              groupValue: viewModel.filtreGroupValue,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                  onPressed: () {
                    Get.back();
                    viewModel.setFiltreGroupValue(0);
                    viewModel.getData();
                  },
                  child: const Text("Sıfırla"),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    viewModel.setObservableList(null);
                    viewModel.getData();
                  },
                  child: Text(loc.generalStrings.apply),
                ),
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ],
      ),
    );
  }
}
