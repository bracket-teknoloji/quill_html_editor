import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/card/talep_teklif_card.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/talep_teklif_tipi_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/view/talep_teklif_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/view_model/talep_teklif_listesi_view_model.dart";

class TalepTeklifListesiView extends StatefulWidget {
  final TalepTeklifEnum talepTeklifEnum;
  const TalepTeklifListesiView({super.key, required this.talepTeklifEnum});

  @override
  State<TalepTeklifListesiView> createState() => _TalepTeklifListesiViewState();
}

class _TalepTeklifListesiViewState extends BaseState<TalepTeklifListesiView> {
  final TalepTeklifListesiViewModel viewModel = TalepTeklifListesiViewModel();
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    viewModel.setPickerBelgeTuru(widget.talepTeklifEnum.rawValue);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
          await viewModel.getData();
          viewModel.setIsScrolledDown(true);
        }
        if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
          viewModel.setIsScrolledDown(true);
        } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          viewModel.setIsScrolledDown(false);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        extendBodyBehindAppBar: false,
        appBar: appBar(),
        bottomNavigationBar: bottomBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) => AppBarTitle(title: widget.talepTeklifEnum.getName, subtitle: viewModel.talepTeklifListesiModelList?.length.toStringIfNotNull),
        ),
        bottom: AppBarPreferedSizedBottom(
          children: [
            const AppBarButton(icon: Icons.filter_alt_outlined, child: Text("Filtrele")),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              onPressed: siralaButtonOnTap,
              child: const Text("Sırala"),
            ),
            AppBarButton(
              onPressed: seceneklerButtonOnTap,
              child: const Icon(Icons.more_horiz_outlined),
            ),
          ],
        ),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: viewModel.resetPage,
        child: Observer(
          builder: (_) {
            if (viewModel.talepTeklifListesiModelList == null) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (viewModel.talepTeklifListesiModelList!.isEmpty) {
              return const Center(child: Text("Veri Yok"));
            } else {
              return ListView.builder(
                controller: _scrollController,
                primary: false,
                padding: UIHelper.lowPadding,
                itemCount: viewModel.talepTeklifListesiModelList!.length + (viewModel.dahaVarMi ? 1 : 0),
                itemBuilder: (_, index) {
                  if (index == viewModel.talepTeklifListesiModelList!.length) {
                    return const Center(child: CircularProgressIndicator.adaptive());
                  }
                  final TalepTeklifListesiModel model = viewModel.talepTeklifListesiModelList![index];
                  return Observer(
                    builder: (_) => TalepTeklifCard(
                      model: model,
                      talepTeklifEnum: widget.talepTeklifEnum,
                      showEkAciklama: viewModel.ekstraAlanlarMap["EK"] ?? false,
                      showMiktar: viewModel.ekstraAlanlarMap["MİK"] ?? false,
                      showVade: viewModel.ekstraAlanlarMap["VADE"] ?? false,
                    ),
                  );
                },
              );
            }
          },
        ),
      );

  Observer bottomBar() => Observer(
        builder: (_) => BottomBarWidget(
          isScrolledDown: viewModel.isScrolledDown,
          children: const [
            FooterButton(children: [Text("Kdv Hariç")]),
            FooterButton(children: [Text("Kdv")]),
            FooterButton(children: [Text("Kdv Dahil")]),
          ],
        ),
      );

  Future<void> siralaButtonOnTap() async {
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Sıralama",
      groupValue: viewModel.siparislerRequestModel.siralama,
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
      viewModel.setSiralama(result);
      viewModel.resetPage();
    }
  }

  Future<void> seceneklerButtonOnTap() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Seçenekler",
      children: [
        BottomSheetModel(
          title: "Görünecek Ekstra Alanlar",
          iconWidget: Icons.add_circle_outline_outlined,
          onTap: () async {
            Get.back();
            await bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: "Görünecek Ekstra Alanlar",
              body: Column(
                children: [
                  Observer(
                    builder: (_) => SwitchListTile.adaptive(
                      title: const Text("Ek Açıklamalar"),
                      value: viewModel.ekstraAlanlarMap["EK"] ?? false,
                      onChanged: (value) => viewModel.changeEkstraAlanlarMap("EK", value),
                    ),
                  ),
                  Observer(
                    builder: (_) => SwitchListTile.adaptive(
                      title: const Text("Miktar"),
                      value: viewModel.ekstraAlanlarMap["MİK"] ?? false,
                      onChanged: (value) {
                        viewModel.changeEkstraAlanlarMap("MİK", value);
                      },
                    ),
                  ),
                  Observer(
                    builder: (_) => SwitchListTile.adaptive(
                      title: const Text("Vade"),
                      value: viewModel.ekstraAlanlarMap["VADE"] ?? false,
                      onChanged: (value) => viewModel.changeEkstraAlanlarMap("VADE", value),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
