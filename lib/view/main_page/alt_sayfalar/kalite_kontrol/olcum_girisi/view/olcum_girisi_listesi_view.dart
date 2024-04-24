import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "package:picker/core/components/card/olcum_girisi_listesi_card.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/view_model/olcum_girisi_listesi_view_model.dart";

class OlcumGirisiListesiView extends StatefulWidget {
  const OlcumGirisiListesiView({super.key});

  @override
  State<OlcumGirisiListesiView> createState() => _OlcumGirisiListesiViewState();
}

class _OlcumGirisiListesiViewState extends BaseState<OlcumGirisiListesiView> {
  final OlcumGirisiViewModel viewModel = OlcumGirisiViewModel();
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController belgeTipiController;
  late final TextEditingController durumController;
  late final ScrollController _scrollController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _scrollController = ScrollController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    belgeTipiController = TextEditingController();
    durumController = TextEditingController(text: viewModel.durumList.indexed.where((element) => element.$1 == viewModel.requestModel.durum).first.$2);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await filterBottomSheet();
      _scrollController.addListener(() async {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
          await viewModel.getData();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    belgeTipiController.dispose();
    durumController.dispose();
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
            if (viewModel.searchBar) {
              return CustomAppBarTextField(
                onFieldSubmitted: (value) async {
                  viewModel.setSearchText(value);
                  viewModel.resetSayfa();
                },
              );
            }
            return AppBarTitle(
              title: "Ölçüm Girişi",
              subtitle: viewModel.appBarTitle != null ? "${viewModel.appBarTitle} (${viewModel.getList?.length ?? 0})" : null,
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
              onPressed: filterBottomSheet,
              child: Text(loc.generalStrings.filter),
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              child: Text(loc.generalStrings.sort),
              onPressed: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: loc.generalStrings.sort,
                  groupValue: viewModel.requestModel.siralama,
                  children: List.generate(
                    viewModel.siralaMap.length,
                    (index) => BottomSheetModel(
                      title: viewModel.siralaMap.keys.toList()[index],
                      value: viewModel.siralaMap.entries.toList()[index],
                      groupValue: viewModel.siralaMap.values.toList()[index],
                    ),
                  ),
                );
                if (result is MapEntry) {
                  viewModel.requestModel.siralama = result.value;
                  viewModel.resetSayfa();
                }
              },
            ),
            // AppBarButton(
            //   icon: Icons.more_horiz_outlined,
            //   onPressed: () {},
            // ),
          ],
        ),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: () async => viewModel.resetSayfa(),
        child: Observer(
          builder: (_) {
            if (viewModel.getList == null) return const ListViewShimmer();
            if (viewModel.getList?.isEmpty == true) return const Center(child: Text("Ölçüm Girişi bulunamadı."));
            return Observer(
              builder: (_) => ListView.builder(
                controller: _scrollController,
                itemCount: viewModel.getList?.length != null ? viewModel.getList!.length + 1 : 0,
                //musteriSiparisleriList?.length != null ? musteriSiparisleriList!.length + 1 : 0
                padding: UIHelper.lowPadding,
                primary: false,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  if (index == viewModel.getList?.length) {
                    return Observer(
                      builder: (_) => Visibility(visible: viewModel.dahaVarMi, child: const Center(child: CircularProgressIndicator.adaptive())),
                    );
                  }
                  return OlcumGirisiListesiCard(
                    model: viewModel.getList![index].copyWith(belgeTipi: viewModel.requestModel.belgeTipi),
                    onTapped: (value) async {
                      if (value) {
                        await viewModel.getData();
                      }
                    },
                  );
                },
              ),
            );
          },
        ),
      );

  Future<void> filterBottomSheet() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            RaporFiltreDateTimeBottomSheetView(
              showBugunFirst: false,
              filterOnChanged: (index) {
                viewModel.setBastar(baslangicTarihiController.text);
                viewModel.setBittar(bitisTarihiController.text);
              },
              baslangicTarihiController: baslangicTarihiController,
              bitisTarihiController: bitisTarihiController,
            ),
            CustomTextField(
              labelText: "Belge Tipi",
              isMust: true,
              readOnly: true,
              suffixMore: true,
              controller: belgeTipiController,
              valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.belgeTipi ?? "")),
              onTap: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Belge Tipi",
                  groupValue: viewModel.requestModel.belgeTipi,
                  children: List.generate(viewModel.belgeTipiList.length, (index) {
                    final EditTipiEnum editTipi = viewModel.belgeTipiList[index];
                    return BottomSheetModel(
                      title: editTipi.getName,
                      description: editTipi.rawValue,
                      value: editTipi,
                      groupValue: editTipi.rawValue,
                    );
                  }),
                );
                if (result is EditTipiEnum) {
                  belgeTipiController.text = result.getName;
                  viewModel.setBelgeTipi(result.rawValue);
                }
              },
            ),
            CustomTextField(
              labelText: "Durum",
              isMust: true,
              readOnly: true,
              suffixMore: true,
              controller: durumController,
              onTap: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Durum",
                  groupValue: viewModel.requestModel.durum,
                  children: List.generate(viewModel.durumList.length, (index) {
                    final String value = viewModel.durumList[index];
                    return BottomSheetModel(
                      title: value,
                      groupValue: index,
                      value: (value, index),
                    );
                  }),
                );
                if (result is (String, int)) {
                  durumController.text = result.$1;
                  viewModel.setDurum(result.$2);
                }
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState?.validate() ?? false) {
                  Get.back();
                  viewModel.setBastar(baslangicTarihiController.text);
                  viewModel.setBittar(bitisTarihiController.text);
                  viewModel.setAppBarTitle(belgeTipiController.text);
                  viewModel.resetSayfa();
                }
              },
              child: Text(loc.generalStrings.apply),
            ).paddingAll(UIHelper.lowSize),
          ],
        ).paddingAll(UIHelper.lowSize),
      ),
    );
    if (viewModel.requestModel.belgeTipi == null || viewModel.requestModel.durum == null) {
      Get.back();
    }
  }
}
