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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    belgeTipiController = TextEditingController();
    durumController = TextEditingController(text: viewModel.durumList.indexed.where((element) => element.$1 == viewModel.requestModel.durum).first.$2);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await filterBottomSheet();
    });
    super.initState();
  }

  @override
  void dispose() {
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
              return CustomAppBarTextField(onChanged: viewModel.setSearchText);
            }
            return AppBarTitle(
              title: "Ölçüm Girişi",
              subtitle: "${viewModel.appBarTitle} (${viewModel.getList?.length ?? 0})",
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
                  await viewModel.getData();
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
        onRefresh: () async {
          viewModel.getData();
        },
        child: Observer(
          builder: (_) {
            if (viewModel.getList == null) return const ListViewShimmer();
            if (viewModel.getList?.isEmpty == true) return const Center(child: Text("Ölçüm Girişi bulunamadı."));
            return ListView.builder(
              itemCount: viewModel.getList?.length ?? 0,
              padding: UIHelper.lowPadding,
              itemBuilder: (context, index) => OlcumGirisiListesiCard(model: viewModel.getList![index].copyWith(belgeTipi: viewModel.requestModel.belgeTipi)),
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
                  viewModel.setAppBarTitle(belgeTipiController.text);
                  await viewModel.getData();
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
