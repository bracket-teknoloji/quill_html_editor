import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/card/cek_senet_listesi_card.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/helper_widgets/custom_label_widget.dart";
import "package:picker/core/components/slide_controller/view/slide_controller_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/cek_senet_listesi_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/view_model/cek_senet_listesi_view_model.dart";

class CekSenetListesiView extends StatefulWidget {
  final CekSenetListesiEnum cekSenetListesiEnum;
  const CekSenetListesiView({super.key, required this.cekSenetListesiEnum});

  @override
  State<CekSenetListesiView> createState() => _CekSenetListesiViewState();
}

class _CekSenetListesiViewState extends BaseState<CekSenetListesiView> {
  CekSenetListesiViewModel viewModel = CekSenetListesiViewModel();
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    viewModel.setBelgeTipi(widget.cekSenetListesiEnum.belgeTipi);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
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
        appBar: appBar,
        body: body,
        bottomNavigationBar: bottomAppBar,
      );

  AppBar get appBar => AppBar(
        title: Observer(
          builder: (_) =>
              viewModel.searchBar ? CustomAppBarTextField(controller: _searchController) : AppBarTitle(title: "${widget.cekSenetListesiEnum.title} (${viewModel.cekSenetListesiListesi?.length ?? 0})"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.setSearchBar();
              if (!viewModel.searchBar) {
                viewModel.setSearchText(null);
              }
            },
            icon: Observer(
              builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined),
            ),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(
              icon: Icons.filter_alt_outlined,
              child: const Text("Filtrele"),
              onPressed: () async {
                final result = await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: "Filtrele",
                  body: Column(
                    children: [
                      CustomWidgetWithLabel(
                        text: "Yeri",
                        child: Observer(
                          builder: (_) => SlideControllerWidget(
                            childrenTitleList: viewModel.yeriMap.keys.toList(),
                            childrenValueList: viewModel.yeriMap.values.toList(),
                            filterOnChanged: (index) => viewModel.setYeri(viewModel.yeriMap.values.toList()[index ?? 0]),
                            groupValue: viewModel.cekSenetListesiRequestModel.yer,
                          ),
                        ),
                      ),
                      CustomWidgetWithLabel(
                        text: "Durumu",
                        child: Observer(
                          builder: (_) => SlideControllerWidget(
                            childrenTitleList: viewModel.durumuMap.keys.toList(),
                            childrenValueList: viewModel.durumuMap.values.toList(),
                            filterOnChanged: (index) => viewModel.setDurumu(viewModel.durumuMap.values.toList()[index ?? 0]),
                            groupValue: viewModel.cekSenetListesiRequestModel.durum,
                          ),
                        ),
                      ),
                      const CustomTextField(),
                      const CustomTextField(),
                      const CustomTextField(),
                      const CustomTextField(),
                    ],
                  ),
                );
              },
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              child: const Text("Sırala"),
              onPressed: () async {
                final result = await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: "Sırala",
                  children: List.generate(viewModel.siralaMap.length, (index) => BottomSheetModel(title: viewModel.siralaMap.keys.toList()[index], value: viewModel.siralaMap.values.toList()[index])),
                );
                if (result != null) {
                  viewModel.setSirala(result);
                  await viewModel.getData();
                }
              },
            ),
            AppBarButton(icon: Icons.refresh_outlined, onPressed: () async => await viewModel.getData(), child: const Text("Yenile")),
          ],
        ),
      );

  RefreshIndicator get body => RefreshIndicator.adaptive(
        onRefresh: viewModel.getData,
        child: Observer(
          builder: (_) {
            if (viewModel.cekSenetListesiListesi == null) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (viewModel.cekSenetListesiListesi.ext.isNullOrEmpty) {
              return const Center(child: Text("Veri bulunamadı", textAlign: TextAlign.center));
            }
            return ListView.builder(
              padding: UIHelper.lowPadding,
              itemCount: viewModel.cekSenetListesiListesi?.length ?? 0,
              itemBuilder: (context, index) {
                final model = viewModel.cekSenetListesiListesi![index];
                return CekSenetListesiCard(model: model);
              },
            );
          },
        ),
      );

  BottomBarWidget get bottomAppBar => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              Observer(
                builder: (_) => Text("Toplam Tutar: ${viewModel.toplamTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
              ),
            ],
          ),
        ],
      );
}
