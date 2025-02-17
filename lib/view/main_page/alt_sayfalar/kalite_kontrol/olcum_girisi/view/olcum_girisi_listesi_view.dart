import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
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
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/view_model/olcum_girisi_listesi_view_model.dart";

final class OlcumGirisiListesiView extends StatefulWidget {
  const OlcumGirisiListesiView({super.key});

  @override
  State<OlcumGirisiListesiView> createState() => _OlcumGirisiListesiViewState();
}

final class _OlcumGirisiListesiViewState extends BaseState<OlcumGirisiListesiView> {
  final OlcumGirisiViewModel viewModel = OlcumGirisiViewModel();
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController belgeTipiController;
  late final TextEditingController durumController;
  late final ScrollController _scrollController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel.setBelgeTipi(CacheManager.getProfilParametre.olcumGirisiBelgeTipi);
    _scrollController = ScrollController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    belgeTipiController = TextEditingController(text: CacheManager.getProfilParametre.olcumGirisiBelgeTipi.getName);
    durumController = TextEditingController(
      text: viewModel.durumList.indexed.where((element) => element.$1 == viewModel.requestModel.durum).first.$2,
    );
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
  Widget build(BuildContext context) => BaseScaffold(appBar: appBar(), body: body());

  AppBar appBar() => AppBar(
    title: Observer(
      builder: (_) {
        if (viewModel.searchBar) {
          return CustomAppBarTextField(
            onFieldSubmitted: (value) async {
              viewModel.setSearchText(value);
              await viewModel.resetSayfa();
            },
          );
        }
        return AppBarTitle(
          title: "Ölçüm Girişi",
          subtitle:
              viewModel.appBarTitle != null ? "${viewModel.appBarTitle} (${viewModel.olcumList?.length ?? 0})" : null,
        );
      },
    ),
    actions: [
      IconButton(
        onPressed: viewModel.setSearchBar,
        icon: Observer(builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined)),
      ),
    ],
    bottom: AppBarPreferedSizedBottom(
      children: [
        AppBarButton(icon: Icons.qr_code_scanner_outlined, onPressed: scanQrCode, child: const Text("Barkod")),
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
            if (result != null) {
              viewModel.requestModel.siralama = result.value;
              await viewModel.resetSayfa();
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
    onRefresh: viewModel.resetSayfa,
    child: Observer(
      builder: (_) {
        if (viewModel.olcumList == null) return const ListViewShimmer();
        if (viewModel.olcumList?.isEmpty == true) return const Center(child: Text("Ölçüm Girişi bulunamadı."));
        return Observer(
          builder:
              (_) => ListView.builder(
                controller: _scrollController,
                itemCount: viewModel.olcumList?.length != null ? viewModel.olcumList!.length + 1 : 0,
                //musteriSiparisleriList?.length != null ? musteriSiparisleriList!.length + 1 : 0
                padding: UIHelper.lowPadding,
                primary: false,
                physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (context, index) {
                  if (index == viewModel.olcumList?.length) {
                    return Observer(
                      builder:
                          (_) => Visibility(
                            visible: viewModel.dahaVarMi,
                            child: const Center(child: CircularProgressIndicator.adaptive()),
                          ),
                    );
                  }
                  return OlcumGirisiListesiCard(
                    model: viewModel.olcumList![index].copyWith(belgeTipi: viewModel.requestModel.belgeTipi),
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
    final result = await bottomSheetDialogManager.showBottomSheetDialog(
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
                viewModel
                  ..setBastar(baslangicTarihiController.text)
                  ..setBittar(bitisTarihiController.text);
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
                  viewModel.setBelgeTipi(result);
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
                    return BottomSheetModel(title: value, groupValue: index, value: (value, index));
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
                  Get.back(result: true);
                  viewModel
                    ..setBastar(baslangicTarihiController.text)
                    ..setBittar(bitisTarihiController.text)
                    ..setAppBarTitle(belgeTipiController.text)
                    ..setOlcumList(null);
                  await viewModel.resetSayfa();
                }
              },
              child: Text(loc.generalStrings.apply),
            ).paddingAll(UIHelper.lowSize),
          ],
        ).paddingAll(UIHelper.lowSize),
      ),
    );
    if (result != true && viewModel.olcumList.ext.isNullOrEmpty) {
      viewModel.setOlcumList([]);
    }
  }

  Future<void> scanQrCode() async {
    final result = await Get.toNamed("/qr");
    if (result is! String) return;
    viewModel.setQr(result);
    await viewModel.getData();
    // viewModel.setOlcumList(null);
    // await viewModel.resetSayfa();
    OlcumBelgeModel? selectedOlcumModel;
    final length = viewModel.qrOlcumList?.length ?? 0;
    if (length <= 0) return;
    if (length == 1) {
      selectedOlcumModel = viewModel.qrOlcumList!.first;
    }
    if (length > 1) {
      selectedOlcumModel = await bottomSheetDialogManager.showRadioBottomSheetDialog(
        context,
        title: "Ölçüm Seçiniz",
        groupValue: 0,
        children:
            viewModel.qrOlcumList
                ?.map(
                  (element) => BottomSheetModel(
                    title: element.belgeNo ?? "",
                    value: element,
                    description: element.belgeTipi ?? "",
                    groupValue: "",
                  ),
                )
                .toList(),
      );
    }
    if (selectedOlcumModel == null) return;
    if (selectedOlcumModel.getEditTipiEnum.kalemSecilecekMi) {
      final result2 = await Get.toNamed("/mainPage/olcumKalemSec", arguments: selectedOlcumModel);
      if (result2 == true) {
        viewModel.getData();
      }
      return;
    }
    final result2 = await Get.toNamed("/mainPage/olcumDetay", arguments: selectedOlcumModel);
    if (result2 == true) {
      viewModel.getData();
    }
  }
}
