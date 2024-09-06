import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "package:picker/core/components/card/transferler_card.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/slide_controller/view/slide_controller_view.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transferler/view_model/transferler_view_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

final class TransferlerView extends StatefulWidget {
  final EditTipiEnum editTipiEnum;
  const TransferlerView({super.key, required this.editTipiEnum});

  @override
  State<TransferlerView> createState() => _TransferlerViewState();
}

final class _TransferlerViewState extends BaseState<TransferlerView> {
  late final TransferlerViewModel viewModel;
  late final ScrollController _scrollController;
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController bitisTarihiController;
  late final TextEditingController ozelKod1Controller;
  late final TextEditingController ozelKod2Controller;

  @override
  void initState() {
    _scrollController = ScrollController();
    baslangicTarihiController = TextEditingController();
    bitisTarihiController = TextEditingController();
    ozelKod1Controller = TextEditingController();
    ozelKod2Controller = TextEditingController();
    viewModel = TransferlerViewModel(pickerBelgeTuru: widget.editTipiEnum.rawValue, editTipiEnum: widget.editTipiEnum);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        viewModel.changeScrollStatus(_scrollController.position);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    baslangicTarihiController.dispose();
    bitisTarihiController.dispose();
    ozelKod1Controller.dispose();
    ozelKod2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(context),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar(BuildContext context) => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.isSearchBarOpen) {
              return CustomAppBarTextField(
                onFieldSubmitted: (String value) async {
                  viewModel.setSearchText(value);
                  await viewModel.resetList();
                },
              );
            }
            return AppBarTitle(title: widget.editTipiEnum.getName, subtitle: viewModel.observableList?.length.toStringIfNotNull ?? "");
          },
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () async => await viewModel.changeSearchBarStatus(),
            icon: Observer(builder: (_) => Icon(viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined)),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: <AppBarButton?>[
            AppBarButton(
              icon: Icons.filter_alt_outlined,
              onPressed: () async => await filter(),
              child: Text(loc.generalStrings.filter),
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              child: Text(loc.generalStrings.sort),
              onPressed: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Sıralama",
                  groupValue: viewModel.faturaRequestModel.siralama,
                  children: List.generate(
                    viewModel.siralaMap.length,
                    (int index) => BottomSheetModel(
                      title: viewModel.siralaMap.keys.toList()[index],
                      value: viewModel.siralaMap.values.toList()[index],
                      groupValue: viewModel.siralaMap.values.toList()[index],
                    ),
                  ),
                );
                if (result != null) {
                  viewModel.setSiralama(result);
                  await viewModel.resetList();
                }
              },
            ),
            AppBarButton(
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc.generalStrings.options,
                  children: <BottomSheetModel>[
                    BottomSheetModel(
                      title: "Görünecek Ekstra Alanlar",
                      iconWidget: Icons.add_circle_outline_outlined,
                      onTap: () async {
                        Get.back();
                        await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "Görünecek Ekstra Alanlar",
                          body: Column(
                            children: <Widget>[
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Ek Açıklamalar"),
                                  value: viewModel.ekstraAlanlarMap["EK"] ?? false,
                                  onChanged: (bool value) => viewModel.changeEkstraAlanlarMap("EK", value),
                                ),
                              ),
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Miktar"),
                                  value: viewModel.ekstraAlanlarMap["MİK"] ?? false,
                                  onChanged: (bool value) {
                                    viewModel.changeEkstraAlanlarMap("MİK", value);
                                  },
                                ),
                              ),
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Vade"),
                                  value: viewModel.ekstraAlanlarMap["VADE"] ?? false,
                                  onChanged: (bool value) => viewModel.changeEkstraAlanlarMap("VADE", value),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
              child: const Icon(Icons.more_horiz_outlined),
            ),
          ],
        ),
      );

  Widget fab() => Observer(
        builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown && widget.editTipiEnum.eklensinMi,
          onPressed: () async {
            await Get.toNamed("/mainPage/transferEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.ekle, editTipiEnum: widget.editTipiEnum));
            await viewModel.resetList();
          },
        ),
      );

  Widget body() => Observer(
        builder: (_) => RefreshableListView.pageable(
          scrollController: _scrollController,
          onRefresh: viewModel.resetList,
          dahaVarMi: viewModel.dahaVarMi,
          items: viewModel.observableList?.mapIndexed((index, item) => item.copyWith(index: index)).toList(),
          itemBuilder: (item) => TransferlerCard(
            index: item.index,
            model: item,
            editTipiEnum: widget.editTipiEnum,
            showEkAciklama: viewModel.ekstraAlanlarMap["EK"],
            showMiktar: viewModel.ekstraAlanlarMap["MİK"],
            showVade: viewModel.ekstraAlanlarMap["VADE"],
            onDeleted: () async => await viewModel.resetList(),
            onUpdated: (value) async {
              if (value) {
                await viewModel.resetList();
              }
            },
          ),
        ),
      );

  Future<void> filter() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        children: [
          RaporFiltreDateTimeBottomSheetView(
            filterOnChanged: (index) {
              viewModel.setBaslangicTarihi(baslangicTarihiController.text);
              viewModel.setBitisTarihi(bitisTarihiController.text);
            },
            baslangicTarihiController: baslangicTarihiController,
            bitisTarihiController: bitisTarihiController,
          ),
          CustomTextField(
            labelText: "Özel Kod 2",
            controller: ozelKod2Controller,
            readOnly: true,
            suffixMore: true,
            valueWidget: Observer(builder: (_) => Text(viewModel.faturaRequestModel.ozelKod2 ?? "")),
            onTap: () async {
              final result = await bottomSheetDialogManager.showOzelKod2BottomSheetDialog(context, true);
              if (result is ListOzelKodTum) {
                ozelKod2Controller.text = result.aciklama ?? "";
                viewModel.setOzelKod2(result.kod);
              }
            },
          ),
          Observer(
            builder: (_) => SlideControllerWidget(
              childrenTitleList: viewModel.transferTipiMap.keys.toList(),
              filterOnChanged: (index) {
                viewModel.setLokalDAT(viewModel.transferTipiMap.values.toList()[index ?? 0]);
              },
              title: "Transfer Tipi",
              childrenValueList: viewModel.transferTipiMap.values.toList(),
              groupValue: viewModel.faturaRequestModel.lokalDAT,
            ),
          ).yetkiVarMi(widget.editTipiEnum.depoTransferiMi),
          Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                    // resetFilters();
                    viewModel.resetFilter();
                    baslangicTarihiController.clear();
                    bitisTarihiController.clear();
                    ozelKod2Controller.clear();
                    viewModel.resetList();
                  },
                  style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                  child: const Text("Temizle"),
                ),
              ),
              SizedBox(width: context.sized.dynamicWidth(0.02)),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    Get.back();
                    await viewModel.resetList();
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
