// ignore_for_file: use_build_context_synchronously

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/grid_view/refreshable_grid_view.dart";
import "package:picker/core/components/image/image_carousel/view/image_carousel_view.dart";
import "package:picker/core/components/image/image_widget.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/listener/mouse_right_click_listener.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/main_page/model/menu_item/menu_item_constants.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/constants/color_palette.dart";
import "../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/grup_kodu_enums.dart";
import "../../../../../../core/constants/enum/islem_tipi_enum.dart";
import "../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../cari/cari_network_manager.dart";
import "../model/stok_bottom_sheet_model.dart";
import "../model/stok_listesi_model.dart";
import "../view_model/stok_listesi_view_model.dart";

final class StokListesiView extends StatefulWidget {
  const StokListesiView({super.key, this.isGetData, this.searchText, this.requestModel});
  final bool? isGetData;
  final StokBottomSheetModel? requestModel;
  final String? searchText;

  @override
  State<StokListesiView> createState() => _StokListesiViewState();
}

final class _StokListesiViewState extends BaseState<StokListesiView> {
  final StokListesiViewModel viewModel = StokListesiViewModel();
  List<StokListesiModel>? get stokListesi => viewModel.observableList ?? [];
  late final ScrollController scrollController;
  late final TextEditingController grupKoduController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;
  @override
  void initState() {
    grupKoduController = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
    scrollController = ScrollController();
    if (widget.requestModel != null) {
      viewModel
        ..setIsGetData(true)
        ..bottomSheetModel = widget.requestModel!;
    }
    viewModel.setSiralama(CacheManager.getProfilParametre.stokListesiSirala);
    scrollController.addListener(() async {
      viewModel.changeScrollStatus(scrollController.position);
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.isGetData ?? false) {
        viewModel
          ..changeSearchBarStatus()
          ..setSearchText(widget.searchText);
      }
      await viewModel.getGrupKodlari();
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    bottomSheetDialogManager.clearSelectedData();
    scrollController.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (viewModel.isSearchBarOpen && widget.searchText != null) {
      FocusScope.of(context).unfocus();
    }
    kod5Controller.text = viewModel.kod5?.map((e) => e.grupAdi).join(", ") ?? "";
    return BaseScaffold(
      floatingActionButton: fab(),
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() => AppBar(
        // controller: scrollController,
        leading: IconButton(
          onPressed: () {
            if (viewModel.isSearchBarOpen) {
              viewModel
                ..changeSearchBarStatus()
                ..setSearchText("")
                ..resetList();
            } else {
              Get.back();
            }
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: Observer(
          builder: (_) => viewModel.isSearchBarOpen
              ? CustomAppBarTextField(
                  controller: TextEditingController(text: viewModel.searchText),
                  onFieldSubmitted: (value) {
                    viewModel
                      ..setSearchText(value)
                      ..resetList()
                      ..getData();
                  },
                )
              : AppBarTitle(
                  title: (widget.isGetData ?? false) ? "Stok Seçiniz" : "Stok Listesi",
                  subtitle: viewModel.observableList?.length.toStringIfNotNull ?? "",
                ),
        ),
        actions: [
          hideSearchBar(),
          Observer(
            builder: (_) => viewModel.isSearchBarOpen
                ? const SizedBox.shrink()
                : IconButton(
                    onPressed: () async {
                      await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        title: loc.generalStrings.options,
                        body: Column(
                          children: [
                            Observer(
                              builder: (_) => SwitchListTile.adaptive(
                                title: const Text("Resimleri Göster"),
                                secondary: const Icon(Icons.preview_outlined, color: UIHelper.primaryColor),
                                value: viewModel.resimleriGoster == "E",
                                onChanged: (value) async {
                                  viewModel.setResimleriGoster();
                                  if (viewModel.resimleriGoster == "E") {
                                    viewModel.resetList();
                                    await viewModel.getData();
                                  } else {
                                    viewModel.resetList();
                                    await viewModel.getData();
                                  }
                                },
                              ),
                            ),
                            const Divider(
                              endIndent: 10,
                              indent: 10,
                            ).paddingSymmetric(vertical: UIHelper.lowSize),
                            ListTile(
                              title: const Text("Detaylı Arama"),
                              leading: const Icon(Icons.search_outlined, color: UIHelper.primaryColor),
                              onTap: () async {
                                Get.back();
                                final List<StokDetayliAramaAlanlar> list = [];
                                final List<StokDetayliAramaAlanlar> aramaList = [
                                  StokDetayliAramaAlanlar(name: "Stok Kodu", searchField: "STOK_KODU"),
                                  StokDetayliAramaAlanlar(name: "Stok Adı", searchField: "STOK_ADI"),
                                  ...parametreModel.stokDetayliAramaAlanlar ?? [],
                                ];
                                for (final StokDetayliAramaAlanlar item in aramaList) {
                                  if (viewModel.bottomSheetModel.searchList?.any((element) => element.searchField == item.searchField) ?? false) {
                                    list.add(viewModel.bottomSheetModel.searchList!.firstWhere((element) => element.searchField == item.searchField));
                                  } else {
                                    list.add(item);
                                  }
                                }
                                final result = await Get.toNamed("mainPage/stokDetayliArama", arguments: list);
                                if (result != null) {
                                  if (result == true) {
                                    viewModel.setSearchList(null);
                                  } else {
                                    viewModel.setSearchList(result);
                                  }
                                  await viewModel.resetList();
                                }
                              },
                            ),
                            Column(
                              children: [
                                const Divider(
                                  endIndent: 10,
                                  indent: 10,
                                ).paddingSymmetric(vertical: UIHelper.lowSize),
                                ListTile(
                                  title: const Text("Görünecek Ekstra Alanlar"),
                                  leading: const Icon(Icons.add_circle_outline_outlined, color: UIHelper.primaryColor),
                                  onTap: () async {
                                    final result = await bottomSheetDialogManager.showStokGorunecekAlanlarCheckBoxBottomSheetDialog(
                                      context,
                                      viewModel.gorunecekAlanlar?.entries.map((e) => e.key).toList(),
                                    );
                                    if (result != null) {
                                      Get.back();
                                      viewModel.setGorunecekAlanlar(result);
                                      await viewModel.resetList();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
          ),
        ],
        bottom: appBarBottom(),
      );

  AppBarPreferedSizedBottom appBarBottom() => AppBarPreferedSizedBottom(
        children: appBarBottomChildren.nullCheckWithGeneric,
      );

  List<AppBarButton> get appBarBottomChildren => [
        AppBarButton(
          icon: Icons.qr_code_scanner,
          child: const Text("Barkod"),
          onPressed: () async {
            final result = await Get.toNamed("/qr");
            if (result != null) {
              viewModel.setSearchText(result);

              if (!viewModel.isSearchBarOpen) {
                viewModel.changeSearchBarStatus();
              }
              viewModel.resetList();
              await viewModel.getData();
            }
          },
        ),
        AppBarButton(
          iconWidget: Observer(builder: (_) => Icon(Icons.filter_alt_outlined, size: 20, fill: 1, color: viewModel.hasAnyFilters ? UIHelper.primaryColor : null)),
          child: Text(loc.generalStrings.filter),
          onPressed: () async {
            if (viewModel.grupKodlari.isEmptyOrNull) {
              final grupKodlari = await CariNetworkManager.getKod(name: GrupKoduEnum.stok);
              if (grupKodlari.isSuccess) {
                viewModel.setGrupKodlari(grupKodlari.dataList);
              }
            }
            await bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: loc.generalStrings.filter,
              body: Column(
                children: [
                  Wrap(
                    children: [
                      CustomWidgetWithLabel(
                        text: "Bakiye Durumu",
                        child: Observer(
                          builder: (_) => SlideControllerWidget(
                            childrenTitleList: viewModel.selectedList,
                            filterOnChanged: (index) => viewModel.changeBakiyeDurumuTemp(index ?? 0),
                            childrenValueList: viewModel.selectedList.map((e) => e.substring(0, 1)).toList(),
                            groupValue: viewModel.bottomSheetModelTemp.bakiyeDurumu,
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => Row(
                          children: [
                            if (viewModel.grupKodlari.any((element) => element.grupNo == 0))
                              Expanded(
                                child: CustomTextField(
                                  labelText: "Grup Kodu",
                                  readOnly: true,
                                  controller: grupKoduController,
                                  onClear: () => viewModel.changeArrGrupKoduTemp(null),
                                  onTap: () async {
                                    final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                      context,
                                      title: "Grup Kodu",
                                      groupValues: viewModel.bottomSheetModelTemp.arrGrupKodu?.map((e) => e.grupKodu).toList(),
                                      children: viewModel.grupKodlari
                                          .map(
                                            (e) => BottomSheetModel(
                                              title: e.grupAdi ?? "",
                                              value: e,
                                              groupValue: e.grupKodu,
                                            ),
                                          )
                                          .toList(),
                                    );
                                    if (result != null) {
                                      viewModel.changeArrGrupKoduTemp(result);
                                      grupKoduController.text = result.map((e) => e.grupAdi).join(", ");
                                    }
                                  },
                                  suffixMore: true,
                                ),
                              ),
                            if (viewModel.grupKodlari.any((element) => element.grupNo == 1))
                              Expanded(
                                child: CustomTextField(
                                  labelText: "Kod 1",
                                  readOnly: true,
                                  suffixMore: true,
                                  controller: kod1Controller,
                                  onClear: () => viewModel.changeArrKod1Temp(null),
                                  onTap: () async {
                                    final List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 1).toList();
                                    final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                      context,
                                      title: "Kod 1",
                                      groupValues: viewModel.bottomSheetModelTemp.arrKod1?.map((e) => e.grupKodu).toList(),
                                      children: grupKodlari
                                          .map(
                                            (e) => BottomSheetModel(
                                              title: e.grupAdi ?? "",
                                              value: e,
                                              groupValue: e.grupKodu,
                                            ),
                                          )
                                          .toList(),
                                    );
                                    if (result != null) {
                                      viewModel.changeArrKod1Temp(result);
                                      kod1Controller.text = result.map((e) => e.grupAdi).join(", ");
                                    }
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      Observer(
                        builder: (_) => Row(
                          children: [
                            if (viewModel.grupKodlari.any((element) => element.grupNo == 2))
                              Expanded(
                                child: CustomTextField(
                                  labelText: "Kod 2",
                                  readOnly: true,
                                  suffixMore: true,
                                  controller: kod2Controller,
                                  onClear: () => viewModel.changeArrKod2Temp(null),
                                  onTap: () async {
                                    final List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 2).toList();
                                    final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                      context,
                                      title: "Kod 2",
                                      groupValues: viewModel.bottomSheetModelTemp.arrKod2?.map((e) => e.grupKodu).toList(),
                                      children: grupKodlari
                                          .map(
                                            (e) => BottomSheetModel(
                                              title: e.grupAdi ?? "",
                                              value: e,
                                              groupValue: e.grupKodu,
                                            ),
                                          )
                                          .toList(),
                                    );
                                    if (result != null) {
                                      viewModel.changeArrKod2(result);
                                      kod2Controller.text = result.map((e) => e.grupAdi).join(", ");
                                    }
                                  },
                                ),
                              ),
                            if (viewModel.grupKodlari.any((element) => element.grupNo == 3))
                              Expanded(
                                child: CustomTextField(
                                  labelText: "Kod 3",
                                  readOnly: true,
                                  suffixMore: true,
                                  controller: kod3Controller,
                                  onClear: () => viewModel.changeArrKod3Temp(null),
                                  onTap: () async {
                                    final List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 3).toList();
                                    final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                      context,
                                      title: "Kod 3",
                                      groupValues: viewModel.bottomSheetModelTemp.arrKod3?.map((e) => e.grupKodu).toList(),
                                      children: grupKodlari
                                          .map(
                                            (e) => BottomSheetModel(
                                              title: e.grupAdi ?? "",
                                              value: e,
                                              groupValue: e.grupKodu,
                                            ),
                                          )
                                          .toList(),
                                    );
                                    if (result != null) {
                                      viewModel.changeArrKod3Temp(result);
                                      kod3Controller.text = result.map((e) => e.grupAdi).join(", ");
                                    }
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      Observer(
                        builder: (_) => Row(
                          children: [
                            if (viewModel.grupKodlari.any((element) => element.grupNo == 4))
                              Expanded(
                                child: CustomTextField(
                                  labelText: "Kod 4",
                                  readOnly: true,
                                  suffixMore: true,
                                  controller: kod4Controller,
                                  onClear: () => viewModel.changeArrKod4Temp(null),
                                  onTap: () async {
                                    final List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 4).toList();
                                    final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                      context,
                                      title: "Kod 4",
                                      groupValues: viewModel.bottomSheetModelTemp.arrKod4?.map((e) => e.grupKodu).toList(),
                                      children: grupKodlari
                                          .map(
                                            (e) => BottomSheetModel(
                                              title: e.grupAdi ?? "",
                                              value: e,
                                              groupValue: e.grupKodu,
                                            ),
                                          )
                                          .toList(),
                                    );
                                    if (result != null) {
                                      viewModel.changeArrKod4Temp(result);
                                      kod4Controller.text = result.map((e) => e.grupAdi).join(", ");
                                    }
                                  },
                                ),
                              ),
                            if (viewModel.grupKodlari.any((element) => element.grupNo == 5))
                              Expanded(
                                child: CustomTextField(
                                  labelText: "Kod 5",
                                  readOnly: true,
                                  suffixMore: true,
                                  controller: kod5Controller,
                                  onClear: () => viewModel.changeArrKod5Temp(null),
                                  onTap: () async {
                                    final List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 5).toList();
                                    final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                      context,
                                      title: "Kod 5",
                                      groupValues: viewModel.bottomSheetModelTemp.arrKod5?.map((e) => e.grupKodu).toList(),
                                      children: grupKodlari
                                          .map(
                                            (e) => BottomSheetModel(
                                              title: e.grupAdi ?? "",
                                              value: e,
                                              groupValue: e.grupKodu,
                                            ),
                                          )
                                          .toList(),
                                    );
                                    if (result != null) {
                                      viewModel.changeArrKod5Temp(result);
                                      kod5Controller.text = result.map((e) => e.grupAdi).join(", ");
                                    }
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                grupKoduController.clear();
                                kod1Controller.clear();
                                kod2Controller.clear();
                                kod3Controller.clear();
                                kod4Controller.clear();
                                kod5Controller.clear();
                                // viewModel.setBottomSheetModel(StokBottomSheetModel());
                                viewModel
                                  ..changeBakiyeDurumu("T")
                                  ..changeBakiyeDurumuTemp(0)
                                  ..resetSelectedArr()
                                  ..resetList();
                                Get.back();
                              },
                              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withValues(alpha: 0.1))),
                              child: const Text("Temizle"),
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () async {
                                viewModel
                                  ..changeBakiyeDurumu(viewModel.bottomSheetModelTemp.bakiyeDurumu)
                                  ..changeArrGrupKodu(viewModel.bottomSheetModelTemp.arrGrupKodu ?? <BaseGrupKoduModel>[])
                                  ..changeArrKod1(viewModel.bottomSheetModelTemp.arrKod1 ?? <BaseGrupKoduModel>[])
                                  ..changeArrKod2(viewModel.bottomSheetModelTemp.arrKod2 ?? <BaseGrupKoduModel>[])
                                  ..changeArrKod3(viewModel.bottomSheetModelTemp.arrKod3 ?? <BaseGrupKoduModel>[])
                                  ..changeArrKod4(viewModel.bottomSheetModelTemp.arrKod4 ?? <BaseGrupKoduModel>[])
                                  ..changeArrKod5(viewModel.bottomSheetModelTemp.arrKod5 ?? <BaseGrupKoduModel>[])
                                  ..resetList();
                                Get.back();
                              },
                              child: Text(loc.generalStrings.apply),
                            ),
                          ),
                        ],
                      ).paddingAll(UIHelper.lowSize),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
        AppBarButton(
          icon: Icons.sort_by_alpha_outlined,
          child: Text(loc.generalStrings.sort),
          // child: const Icon(Icons.sort_by_alpha_outlined),
          onPressed: () async {
            final String? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
              context,
              title: loc.generalStrings.sort,
              groupValue: viewModel.bottomSheetModel.siralama,
              children: [
                BottomSheetModel(title: "Stok Adı (A-Z)", value: "AZ", groupValue: "AZ"),
                BottomSheetModel(title: "Stok Adı (Z-A)", value: "ZA", groupValue: "ZA"),
                BottomSheetModel(title: "Stok Kodu (A-Z)", value: "KOD_AZ", groupValue: "KOD_AZ"),
                BottomSheetModel(title: "Stok Kodu (Z-A)", value: "KOD_ZA", groupValue: "KOD_ZA"),
                BottomSheetModel(title: "Bakiye (Artan)", value: "BAKIYE_AZ", groupValue: "BAKIYE_AZ"),
                BottomSheetModel(title: "Bakiye (Azalan)", value: "BAKIYE_ZA", groupValue: "BAKIYE_ZA"),
              ],
            );
            if (result != null) {
              viewModel
                ..setSiralama(result)
                ..resetList();
            }
          },
        ),
        AppBarButton(
          icon: Icons.grid_view_outlined,
          child: Text(loc.generalStrings.view),
          onPressed: () async {
            int? count;
            final result = await bottomSheetDialogManager.showBottomSheetDialog<bool>(
              context,
              title: "Listeleme türünü seçin",
              children: [
                BottomSheetModel(title: "Liste Görünümü", iconWidget: Icons.list_alt_outlined, value: false, groupValue: false),
                BottomSheetModel(title: "Kart Görünümü", iconWidget: Icons.grid_view_outlined, value: true, groupValue: true),
              ],
            );
            if (result != null) {
              if (!result) {
                count = 0;
              } else {
                count = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Sayı Seçiniz",
                  groupValue: viewModel.gridSayisi,
                  children: List.generate(
                    kIsWeb ? 8 : 4,
                    (index) => BottomSheetModel(title: (index + 1).toString(), value: index + 1, groupValue: index + 1),
                  ),
                );
              }
              if (count != null) {
                viewModel
                  ..setGridSayisi(count)
                  ..resetList();
              }
            }
          },
        ),
        //! AppBarButton(icon: Icons.refresh_outlined, onPressed: () {})
      ];

  Widget hideSearchBar() => Observer(
        builder: (_) => IconButton(
          onPressed: () {
            viewModel.changeSearchBarStatus();
            if (!viewModel.isSearchBarOpen) {
              viewModel
                ..resetList()
                ..getData();
            }
          },
          icon: Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined),
        ),
      );

  Observer? fab() {
    if (yetkiController.stokKartiYeniKayit) {
      return Observer(
        builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown,
          onPressed: () async {
            final BaseEditModel result = BaseEditModel<StokListesiModel>(baseEditEnum: BaseEditEnum.ekle, model: StokListesiModel());
            final isSucces = await Get.toNamed("/mainPage/stokEdit", arguments: result);
            if (isSucces != null) {
              viewModel.resetList();
            }
          },
        ),
      );
    }
    return null;
  }

  Column body() => Column(
        children: [
          grupKoduFilter(),
          Expanded(
            child: Observer(
              builder: (_) => viewModel.gridSayisi != 0
                  ? Observer(
                      builder: (_) => RefreshableGridView.pageable(
                        crossAxisCount: viewModel.gridSayisi,
                        scrollController: scrollController,
                        onRefresh: viewModel.resetList,
                        dahaVarMi: viewModel.dahaVarMi,
                        items: viewModel.observableList,
                        itemBuilder: (item, {crossAxisCount}) => stokListesiGridTile(item, crossAxisCount),
                      ),
                    )
                  : RefreshableListView.pageable(
                      scrollController: scrollController,
                      onRefresh: viewModel.resetList,
                      dahaVarMi: viewModel.dahaVarMi,
                      items: viewModel.observableList,
                      itemBuilder: stokListesiCard,
                    ),
            ),
          ),
        ],
      );

  Widget stokListesiGridTile(StokListesiModel item, int? crossAxisCount) => MouseRightClickListener(
        onRightClick: () => showStokIslemlerDialog(item),
        child: Card(
          child: InkWell(
            onLongPress: () => showStokIslemlerDialog(item),
            onTap: () => stokOnTap(item),
            child: GridTile(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    flex: 2,
                    child: ImageWidget(
                      path: item.resimUrl,
                      onTap: () {
                        if (item.resimUrl != null) {
                          Get.to(() => ImageCarouselView(model: item));
                        }
                      },
                    ),
                  ),
                  Flexible(
                    child: SingleChildScrollView(
                      primary: false,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (item.stokAdi != null)
                            Text(
                              item.stokAdi ?? "",
                              style: const TextStyle(fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis),
                              maxLines: 2,
                            ),
                          Wrap(
                            children: [
                              if (item.seriCikislardaAcik == true) const ColorfulBadge(label: Text("Seri"), badgeColorEnum: BadgeColorEnum.seri),
                              if (item.kilitliMi) ColorfulBadge(label: Text("Kilitli (${item.kilitTipi})"), badgeColorEnum: BadgeColorEnum.hata),
                              if (item.alisDovTip != null || item.satDovTip != null) const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli),
                              if (item.yapilandirmaAktif == true) const ColorfulBadge(label: Text("Es.Yap."), badgeColorEnum: BadgeColorEnum.esYap),
                            ]
                                .map(
                                  (e) => e.paddingOnly(top: UIHelper.lowSize, right: UIHelper.lowSize),
                                )
                                .toList(),
                          ),
                          CustomLayoutBuilder(
                            splitCount: crossAxisCount == 1
                                ? 3
                                : crossAxisCount == 2
                                    ? 2
                                    : 1,
                            children: [
                              Text("Stok Kodu:  ${item.stokKodu}"),
                              Text("Bakiye:  ${item.bakiye.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${item.olcuBirimi ?? ""}"),
                              if (item.yapacik != null) Text("Yap.Açık:  ${item.yapacik ?? ""}"),
                              if (item.yapkod != null) Text("YapKod:  ${item.yapkod ?? ""}"),
                              if (item.kull1s != null && viewModel.gorunecekAlanlar?["1S"] != null) Text("${viewModel.gorunecekAlanlar?["1S"]}:  ${item.kull1s}"),
                              if (item.kull2s != null && viewModel.gorunecekAlanlar?["2S"] != null) Text("${viewModel.gorunecekAlanlar?["2S"]}:  ${item.kull2s}"),
                              if (item.kull3s != null && viewModel.gorunecekAlanlar?["3S"] != null) Text("${viewModel.gorunecekAlanlar?["3S"]}:  ${item.kull3s}"),
                              if (item.kull4s != null && viewModel.gorunecekAlanlar?["4S"] != null) Text("${viewModel.gorunecekAlanlar?["4S"]}:  ${item.kull4s}"),
                              if (item.kull5s != null && viewModel.gorunecekAlanlar?["5S"] != null) Text("${viewModel.gorunecekAlanlar?["5S"]}:  ${item.kull5s}"),
                              if (item.kull6s != null && viewModel.gorunecekAlanlar?["6S"] != null) Text("${viewModel.gorunecekAlanlar?["6S"]}:  ${item.kull6s}"),
                              if (item.kull7s != null && viewModel.gorunecekAlanlar?["7S"] != null) Text("${viewModel.gorunecekAlanlar?["7S"]}:  ${item.kull7s}"),
                              if (item.kull8s != null && viewModel.gorunecekAlanlar?["8S"] != null) Text("${viewModel.gorunecekAlanlar?["8S"]}:  ${item.kull8s}"),
                              if (item.kull1n != null && viewModel.gorunecekAlanlar?["1N"] != null)
                                Text("${viewModel.gorunecekAlanlar?["1N"]}:  ${item.kull1n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                              if (item.kull2n != null && viewModel.gorunecekAlanlar?["2N"] != null)
                                Text("${viewModel.gorunecekAlanlar?["2N"]}:  ${item.kull2n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                              if (item.kull3n != null && viewModel.gorunecekAlanlar?["3N"] != null)
                                Text("${viewModel.gorunecekAlanlar?["3N"]}:  ${item.kull3n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                              if (item.kull4n != null && viewModel.gorunecekAlanlar?["4N"] != null)
                                Text("${viewModel.gorunecekAlanlar?["4N"]}:  ${item.kull4n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                              if (item.kull5n != null && viewModel.gorunecekAlanlar?["5N"] != null)
                                Text("${viewModel.gorunecekAlanlar?["5N"]}:  ${item.kull5n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                              if (item.kull6n != null && viewModel.gorunecekAlanlar?["6N"] != null)
                                Text("${viewModel.gorunecekAlanlar?["6N"]}:  ${item.kull6n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                              if (item.kull7n != null && viewModel.gorunecekAlanlar?["7N"] != null)
                                Text("${viewModel.gorunecekAlanlar?["7N"]}:  ${item.kull7n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                              if (item.kull8n != null && viewModel.gorunecekAlanlar?["8N"] != null)
                                Text("${viewModel.gorunecekAlanlar?["8N"]}:  ${item.kull8n.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ).paddingAll(UIHelper.lowSize),
            ),
          ),
        ),
      );

  Future<dynamic> showStokIslemlerDialog(StokListesiModel item, [IslemTipiEnum? islemTipi]) async {
    await dialogManager.showStokGridViewDialog(
      item,
      tip: islemTipi,
      onSelected: (result) async {
        if (result) {
          await viewModel.resetList();
        }
      },
    );
  }

  Widget stokListesiCard(StokListesiModel item) => MouseRightClickListener(
        onRightClick: () => showStokIslemlerDialog(item),
        child: Card(
          child: ListTile(
            onLongPress: () => showStokIslemlerDialog(item),
            // leading: stok.resimUrlKucuk !=null ? Image.memory(networkManager.getImage(stok.resimUrlKucuk))
            leading: CircleAvatar(
              backgroundColor: theme.scaffoldBackgroundColor,
              child: item.resimUrlKucuk != null && viewModel.resimleriGoster == "E"
                  ? SizedBox(
                      height: UIHelper.highSize * 3,
                      width: UIHelper.highSize * 3,
                      child: InkWell(
                        borderRadius: UIHelper.lowBorderRadius,
                        onTap: () {
                          if (item.resimUrl != null) {
                            Get.to(() => ImageCarouselView(model: item));
                          }
                        },
                        child: ImageWidget(path: item.resimUrlKucuk),
                      ),
                    )
                  : Text((item.stokAdi ?? "  ").substring(0, 1)),
            ),
            trailing: Text(
              "${(item.bakiye ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${item.olcuBirimi ?? ""}",
              style: context.textTheme.bodySmall?.copyWith(color: UIHelper.getColorWithValue(item.bakiye ?? 0)),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    text: item.stokAdi,
                    children: [
                      TextSpan(text: "\n${item.stokKodu}", style: context.textTheme.bodySmall?.copyWith(color: ColorPalette.slateGray)),
                    ],
                  ),
                ),
                Wrap(
                  spacing: UIHelper.lowSize,
                  children: [
                    if (item.seriCikislardaAcik == true) const ColorfulBadge(label: Text("Seri"), badgeColorEnum: BadgeColorEnum.seri),
                    if (item.kilitliMi) ColorfulBadge(label: Text("Kilitli (${item.kilitTipi})"), badgeColorEnum: BadgeColorEnum.hata),
                    if (item.alisDovTip != null || item.satDovTip != null) const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli),
                    if (item.yapilandirmaAktif == true) const ColorfulBadge(label: Text("Es.Yap."), badgeColorEnum: BadgeColorEnum.esYap),
                  ],
                ).paddingSymmetric(vertical: UIHelper.lowSize),
              ],
            ),
            subtitle: CustomLayoutBuilder.divideInHalf(
              children: [
                if (item.kull1s != null && viewModel.gorunecekAlanlar?["1S"] != null) Text("${viewModel.gorunecekAlanlar?["1S"]}: ${item.kull1s}"),
                if (item.kull2s != null && viewModel.gorunecekAlanlar?["2S"] != null) Text("${viewModel.gorunecekAlanlar?["2S"]}: ${item.kull2s}"),
                if (item.kull3s != null && viewModel.gorunecekAlanlar?["3S"] != null) Text("${viewModel.gorunecekAlanlar?["3S"]}: ${item.kull3s}"),
                if (item.kull4s != null && viewModel.gorunecekAlanlar?["4S"] != null) Text("${viewModel.gorunecekAlanlar?["4S"]}: ${item.kull4s}"),
                if (item.kull5s != null && viewModel.gorunecekAlanlar?["5S"] != null) Text("${viewModel.gorunecekAlanlar?["5S"]}: ${item.kull5s}"),
                if (item.kull6s != null && viewModel.gorunecekAlanlar?["6S"] != null) Text("${viewModel.gorunecekAlanlar?["6S"]}: ${item.kull6s}"),
                if (item.kull7s != null && viewModel.gorunecekAlanlar?["7S"] != null) Text("${viewModel.gorunecekAlanlar?["7S"]}: ${item.kull7s}"),
                if (item.kull8s != null && viewModel.gorunecekAlanlar?["8S"] != null) Text("${viewModel.gorunecekAlanlar?["8S"]}: ${item.kull8s}"),
                if (item.kull1n != null && viewModel.gorunecekAlanlar?["1N"] != null) Text("${viewModel.gorunecekAlanlar?["1N"]}: ${item.kull1n.commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"),
                if (item.kull2n != null && viewModel.gorunecekAlanlar?["2N"] != null) Text("${viewModel.gorunecekAlanlar?["2N"]}: ${item.kull2n.commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"),
                if (item.kull3n != null && viewModel.gorunecekAlanlar?["3N"] != null) Text("${viewModel.gorunecekAlanlar?["3N"]}: ${item.kull3n.commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"),
                if (item.kull4n != null && viewModel.gorunecekAlanlar?["4N"] != null) Text("${viewModel.gorunecekAlanlar?["4N"]}: ${item.kull4n.commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"),
                if (item.kull5n != null && viewModel.gorunecekAlanlar?["5N"] != null) Text("${viewModel.gorunecekAlanlar?["5N"]}: ${item.kull5n.commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"),
                if (item.kull6n != null && viewModel.gorunecekAlanlar?["6N"] != null) Text("${viewModel.gorunecekAlanlar?["6N"]}: ${item.kull6n.commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"),
                if (item.kull7n != null && viewModel.gorunecekAlanlar?["7N"] != null) Text("${viewModel.gorunecekAlanlar?["7N"]}: ${item.kull7n.commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"),
                if (item.kull8n != null && viewModel.gorunecekAlanlar?["8N"] != null) Text("${viewModel.gorunecekAlanlar?["8N"]}: ${item.kull8n.commaSeparatedWithDecimalDigits(OndalikEnum.oran)}"),
                if (yetkiController.stokListesiExtraAlanlar("acik_sip_miktari")) Text("Açık Müş. Sip. Miktarı: ${item.acikMussipMiktari.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                if (yetkiController.stokListesiExtraAlanlar("satilabilir_miktar"))
                  Text(
                    "Sat. Mik.: ${item.satilabilirMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                    style: TextStyle(color: UIHelper.getColorWithValue(item.satilabilirMiktar ?? 0)),
                  ),
                // if (item)
              ],
            ),
            onTap: () => stokOnTap(item),
          ),
        ),
      );

  Future<void> stokOnTap(StokListesiModel item) async {
    if (widget.isGetData == true) {
      Get.back(result: item);
      return;
    } else {
      {
        final List<BottomSheetModel> children2 = [
          if (yetkiController.stokKarti)
            BottomSheetModel(
              title: loc.generalStrings.view,
              iconWidget: Icons.preview_outlined,
              value: BaseEditModel<StokListesiModel>(baseEditEnum: BaseEditEnum.goruntule, model: item),
            ),
          if (yetkiController.stokKartiDuzenleme)
            BottomSheetModel(
              title: loc.generalStrings.edit,
              iconWidget: Icons.edit,
              value: BaseEditModel<StokListesiModel>(baseEditEnum: BaseEditEnum.duzenle, model: item),
            ),
          if (yetkiController.stokKartiSilme) BottomSheetModel(title: loc.generalStrings.delete, iconWidget: Icons.delete, onTap: () => deleteStok(item.stokKodu ?? "")),
          if (yetkiController.stokHareketleriStokHareketleri)
            BottomSheetModel(
              title: "Hareketler",
              iconWidget: Icons.sync_alt_outlined,
              onTap: () {
                Get.back();
                return Get.toNamed("/mainPage/stokHareketleri", arguments: item);
              },
            ),
          if (MenuItemConstants.gridItemModel
                  .firstWhereOrNull((element) => element.title == "Stok")
                  ?.altMenuler
                  ?.firstWhereOrNull((element) => element.title == "Raporlar")
                  ?.altMenuler
                  ?.ext
                  .isNotNullOrEmpty ??
              false)
            BottomSheetModel(
              title: "Raporlar",
              iconWidget: Icons.area_chart_outlined,
              onTap: () async {
                Get.back();
                showStokIslemlerDialog(item, IslemTipiEnum.stokRapor);
              },
            ),
          if (yetkiController.stokDepoBakiyeDurumu)
            BottomSheetModel(
              title: "Depo Bakiye Durumu",
              iconWidget: Icons.list_alt,
              onTap: () async {
                Get.back();
                await Get.toNamed("/mainPage/depoBakiyeDurumu", arguments: item);
              },
            ),
          if (yetkiController.yazdirmaStokEtiketi)
            BottomSheetModel(
              title: loc.generalStrings.print,
              iconWidget: Icons.print,
              onTap: () async {
                Get.back();
                final result = await Get.toNamed("mainPage/stokYazdir", arguments: item);
                if (result == true) {
                  viewModel.resetList();
                }
              },
            ),
          BottomSheetModel(
            title: loc.generalStrings.actions,
            iconWidget: Icons.list_alt,
            onTap: () {
              Get.back();
              showStokIslemlerDialog(item);
            },
          ),
        ];

        final List<BottomSheetModel> newResult = children2.nullCheckWithGeneric;
        final result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: item.stokKodu ?? "", children: newResult);
        if (result != null && result is BaseEditModel) {
          await Get.toNamed("/mainPage/stokEdit", arguments: result);
          viewModel.resetList();
        }
      }
    }
  }

  Observer grupKoduFilter() => Observer(
        builder: (_) => CustomLayoutBuilder(
          splitCount: 3,
          doNotExpand: true,
          children: [
            if (!viewModel.kategoriMi || (grupKoduWithIndex(0).ext.isNotNullOrEmpty))
              CustomTextField(
                labelText: "Grup Kodu",
                readOnly: true,
                suffixMore: true,
                controller: grupKoduController,
                onClear: () async => await grupKoduOnClear(0),
                onTap: () => getGrupKodlariBottomSheet(0),
              ),
            if (!viewModel.kategoriMi || (grupKoduWithIndex(1).ext.isNotNullOrEmpty))
              CustomTextField(
                labelText: "Kod 1",
                readOnly: true,
                suffixMore: true,
                controller: kod1Controller,
                onClear: () async => await grupKoduOnClear(1),
                onTap: () => getGrupKodlariBottomSheet(1),
              ),
            if (!viewModel.kategoriMi || (grupKoduWithIndex(2).ext.isNotNullOrEmpty))
              CustomTextField(
                labelText: "Kod 2",
                readOnly: true,
                suffixMore: true,
                controller: kod2Controller,
                onClear: () async => await grupKoduOnClear(2),
                onTap: () => getGrupKodlariBottomSheet(2),
              ),
            if (!viewModel.kategoriMi || (grupKoduWithIndex(3).ext.isNotNullOrEmpty))
              CustomTextField(
                labelText: "Kod 3",
                readOnly: true,
                suffixMore: true,
                controller: kod3Controller,
                onClear: () async => await grupKoduOnClear(3),
                onTap: () => getGrupKodlariBottomSheet(3),
              ),
            if (!viewModel.kategoriMi || (grupKoduWithIndex(4).ext.isNotNullOrEmpty))
              CustomTextField(
                labelText: "Kod 4",
                readOnly: true,
                suffixMore: true,
                controller: kod4Controller,
                onClear: () async => await grupKoduOnClear(4),
                onTap: () => getGrupKodlariBottomSheet(4),
              ),
            if (!viewModel.kategoriMi || (grupKoduWithIndex(5).ext.isNotNullOrEmpty))
              CustomTextField(
                labelText: "Kod 5",
                readOnly: true,
                suffixMore: true,
                controller: kod5Controller,
                onClear: () async => await grupKoduOnClear(5),
                onTap: () => getGrupKodlariBottomSheet(5),
              ),
          ],
        ),
      );

  Future<MemoryImage?> getImage(String path) async => await networkManager.getImage(path);

  void deleteStok(String stokKodu) {
    Get.back();
    dialogManager.showAreYouSureDialog(() async {
      final GenericResponseModel response =
          await networkManager.dioPost<StokListesiModel>(bodyModel: StokListesiModel(), path: ApiUrls.deleteStok, queryParameters: {"Kod": stokKodu}, showLoading: true);
      if (response.isSuccess) {
        dialogManager.showSuccessSnackBar("Başarıyla Silindi");
        viewModel.resetList();
      }
    });
  }

  Future<void> getGrupKodlariBottomSheet(int value) async {
    List<BaseGrupKoduModel>? selectedList = [];
    switch (value) {
      case 0:
        selectedList = viewModel.bottomSheetModel.arrGrupKodu;
      case 1:
        selectedList = viewModel.bottomSheetModel.arrKod1;
      case 2:
        selectedList = viewModel.bottomSheetModel.arrKod2;
      case 3:
        selectedList = viewModel.bottomSheetModel.arrKod3;
      case 4:
        selectedList = viewModel.bottomSheetModel.arrKod4;
      case 5:
        selectedList = viewModel.bottomSheetModel.arrKod5;
    }
    final iterable = (viewModel.kategoriGrupKodlari.ext.isNotNullOrEmpty ? grupKoduWithIndex(value) : viewModel.grupKodlari.where((element) => element.grupNo == value))?.toList();
    final uniqueList = <BaseGrupKoduModel>[];
    for (final item in iterable ?? <BaseGrupKoduModel>[]) {
      if (!uniqueList.any((element) => grupKoduWithItem(element, value) == grupKoduWithItem(item, value))) {
        uniqueList.add(item);
      }
    }

    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Kod Seçiniz",
      groupValue: grupKoduWithItem(selectedList?.firstOrNull, value),
      children: List.generate(uniqueList.length, (index) {
        final item = uniqueList[index];
        return BottomSheetModel(
          title: grupAdiWithItem(item, value),
          value: item,
          description: grupKoduWithItem(item, value),
          groupValue: grupKoduWithItem(item, value),
        );
      }),
    );
    if (result is! BaseGrupKoduModel) return;
    final List<BaseGrupKoduModel> grupKoduList = [BaseGrupKoduModel.forFirstSelected(result..grupNo = value)];
    switch (value) {
      case 0:
        viewModel.changeArrGrupKodu(grupKoduList);
        grupKoduController.text = grupAdiWithItem(result, value);
      case 1:
        viewModel.changeArrKod1(grupKoduList);
        kod1Controller.text = grupAdiWithItem(result, value);
      case 2:
        viewModel.changeArrKod2(grupKoduList);
        kod2Controller.text = grupAdiWithItem(result, value);
      case 3:
        viewModel.changeArrKod3(grupKoduList);
        kod3Controller.text = grupAdiWithItem(result, value);
      case 4:
        viewModel.changeArrKod4(grupKoduList);
        kod4Controller.text = grupAdiWithItem(result, value);
      case 5:
        viewModel.changeArrKod5(grupKoduList);
        kod5Controller.text = grupAdiWithItem(result, value);
    }
    if (!viewModel.kategoriMi) {
      viewModel
        ..setKategoriMi(true)
        ..setGrupNo(value);
      await viewModel.getKategoriGrupKodlari();
    }
    await viewModel.resetList();
  }

  String grupAdiWithItem(BaseGrupKoduModel? item, int index) {
    if (item == null) return "";
    return switch (index) {
      0 => item.grupAdi ?? "",
      1 => (viewModel.kategoriMi ? item.kod1Adi ?? item.kod1 : item.grupAdi) ?? "",
      2 => (viewModel.kategoriMi ? item.kod2Adi ?? item.kod2 : item.grupAdi) ?? "",
      3 => (viewModel.kategoriMi ? item.kod3Adi ?? item.kod3 : item.grupAdi) ?? "",
      4 => (viewModel.kategoriMi ? item.kod4Adi ?? item.kod4 : item.grupAdi) ?? "",
      5 => (viewModel.kategoriMi ? item.kod5Adi ?? item.kod5 : item.grupAdi) ?? "",
      _ => "",
    };
  }

  String grupKoduWithItem(BaseGrupKoduModel? item, int index) {
    if (item == null) return "";
    return switch (index) {
      0 => item.grupKodu ?? "",
      1 => item.kod1 ?? item.grupKodu ?? "",
      2 => item.kod2 ?? item.grupKodu ?? "",
      3 => item.kod3 ?? item.grupKodu ?? "",
      4 => item.kod4 ?? item.grupKodu ?? "",
      5 => item.kod5 ?? item.grupKodu ?? "",
      _ => "",
    };
  }

  List<BaseGrupKoduModel>? grupKoduWithIndex(int index) {
    final Iterable<BaseGrupKoduModel>? filteredList = viewModel.kategoriGrupKodlari?.where(
      (e) =>
          (viewModel.bottomSheetModel.arrGrupKodu?.firstOrNull?.grupKodu == null ? true : e.grupKodu == viewModel.bottomSheetModel.arrGrupKodu?.firstOrNull?.grupKodu) &&
          (viewModel.bottomSheetModel.arrKod1?.firstOrNull?.kod1 == null ? true : e.kod1 == viewModel.bottomSheetModel.arrKod1?.firstOrNull?.kod1) &&
          (viewModel.bottomSheetModel.arrKod2?.firstOrNull?.kod2 == null ? true : e.kod2 == viewModel.bottomSheetModel.arrKod2?.firstOrNull?.kod2) &&
          (viewModel.bottomSheetModel.arrKod3?.firstOrNull?.kod3 == null ? true : e.kod3 == viewModel.bottomSheetModel.arrKod3?.firstOrNull?.kod3) &&
          (viewModel.bottomSheetModel.arrKod4?.firstOrNull?.kod4 == null ? true : e.kod4 == viewModel.bottomSheetModel.arrKod4?.firstOrNull?.kod4) &&
          (viewModel.bottomSheetModel.arrKod5?.firstOrNull?.kod5 == null ? true : e.kod5 == viewModel.bottomSheetModel.arrKod5?.firstOrNull?.kod5),
    );
    // if (filteredList?.every((element) => element.grupKodu == viewModel.bottomSheetModel.arrGrupKodu?.firstOrNull?.grupKodu) ?? false) viewModel.changeArrGrupKodu(null);
    // if (filteredList?.every((element) => element.kod1 == viewModel.bottomSheetModel.arrKod1?.firstOrNull?.kod1) ?? false) viewModel.changeArrKod1(null);
    // if (filteredList?.every((element) => element.kod2 == viewModel.bottomSheetModel.arrKod2?.firstOrNull?.kod2) ?? false) viewModel.changeArrKod2(null);
    // if (filteredList?.every((element) => element.kod3 == viewModel.bottomSheetModel.arrKod3?.firstOrNull?.kod3) ?? false) viewModel.changeArrKod3(null);
    // if (filteredList?.every((element) => element.kod4 == viewModel.bottomSheetModel.arrKod4?.firstOrNull?.kod4) ?? false) viewModel.changeArrKod4(null);
    // if (filteredList?.every((element) => element.kod5 == viewModel.bottomSheetModel.arrKod5?.firstOrNull?.kod5) ?? false) viewModel.changeArrKod5(null);

    // if (filteredList?.every((element) => element.grupKodu == null) ?? false) viewModel.changeArrGrupKodu(null);
    // if (filteredList?.every((element) => element.kod1 == null) ?? false) viewModel.changeArrKod1(null);
    // if (filteredList?.every((element) => element.kod2 == null) ?? false) viewModel.changeArrKod2(null);
    // if (filteredList?.every((element) => element.kod3 == null) ?? false) viewModel.changeArrKod3(null);
    // if (filteredList?.every((element) => element.kod4 == null) ?? false) viewModel.changeArrKod4(null);
    // if (filteredList?.every((element) => element.kod5 == null) ?? false) viewModel.changeArrKod5(null);
    return switch (index) {
      0 => filteredList?.where((e) => e.grupKodu != null).toList(),
      1 => filteredList?.where((e) => e.kod1 != null).toList(),
      2 => filteredList?.where((e) => e.kod2 != null).toList(),
      3 => filteredList?.where((e) => e.kod3 != null).toList(),
      4 => filteredList?.where((e) => e.kod4 != null).toList(),
      5 => filteredList?.where((e) => e.kod5 != null).toList(),
      _ => null,
    };
  }

  Future<void> grupKoduOnClear(int value) async {
    if (grupKoduController.text.isEmpty && kod1Controller.text.isEmpty && kod2Controller.text.isEmpty && kod3Controller.text.isEmpty && kod4Controller.text.isEmpty && kod5Controller.text.isEmpty) {
      viewModel
        ..setKategoriMi(false)
        ..setGrupNo(-1)
        ..setKategoriGrupKodlari(null);
    }
    switch (value) {
      case 0:
        viewModel.changeArrGrupKodu(null);
        grupKoduController.clear();
      case 1:
        viewModel.changeArrKod1(null);
        kod1Controller.clear();
      case 2:
        viewModel.changeArrKod2(null);
        kod2Controller.clear();
      case 3:
        viewModel.changeArrKod3(null);
        kod3Controller.clear();
      case 4:
        viewModel.changeArrKod4(null);
        kod4Controller.clear();
      case 5:
        viewModel.changeArrKod5(null);
        kod5Controller.clear();
    }
    await viewModel.resetList();
  }
}
