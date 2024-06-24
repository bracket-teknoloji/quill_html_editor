import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../model/banka_listesi_model.dart";
import "../model/banka_listesi_request_model.dart";
import "../view_model/banka_listesi_view_model.dart";

class BankaListesiView extends StatefulWidget {
  final bool? isGetData;
  final BankaListesiRequestModel? requestModel;
  const BankaListesiView({super.key, this.isGetData, this.requestModel});

  @override
  State<BankaListesiView> createState() => _BankaListesiViewState();
}

class _BankaListesiViewState extends BaseState<BankaListesiView> {
  final BankaListesiViewModel viewModel = BankaListesiViewModel();
  late final TextEditingController _searchController;
  late final TextEditingController _hesapTipiController;

  @override
  void initState() {
    _searchController = TextEditingController();
    _hesapTipiController = TextEditingController();
    if (widget.requestModel != null) {
      viewModel.model = widget.requestModel!;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async => await viewModel.getData());
    if (widget.isGetData == true) {
      viewModel.setSearchBar();
    }
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _hesapTipiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) => viewModel.searchBar
              ? CustomAppBarTextField(controller: _searchController, onChanged: viewModel.setSearchText)
              : AppBarTitle(
                  title: "Banka Listesi",
                  subtitle: viewModel.bankaListesi?.length.toStringIfNotNull,
                ),
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
              onPressed: () async => await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: loc.generalStrings.filter,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CustomWidgetWithLabel(
                      text: "Bakiye",
                      child: Observer(
                        builder: (_) => SlideControllerWidget(
                          childrenTitleList: viewModel.filtreleMap.keys.toList(),
                          filterOnChanged: (value) => viewModel.setBakiye(viewModel.filtreleMap.values.toList()[value ?? 0]),
                          childrenValueList: viewModel.filtreleMap.values.toList(),
                          groupValue: viewModel.model.bakiye,
                        ),
                      ),
                    ),
                    CustomTextField(
                      labelText: "Hesap Tipi",
                      readOnly: true,
                      suffixMore: true,
                      controller: _hesapTipiController,
                      onClear: () {
                        _hesapTipiController.clear();
                        viewModel.setHesapTipi(null);
                      },
                      onTap: () async {
                        final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                          context,
                          title: "Hesap Tipi Seçiniz",
                          groupValues: jsonDecode(viewModel.model.arrHesapTipi ?? "[]"),
                          children: List.generate(
                            viewModel.hesapTipiList.length,
                            (index) => BottomSheetModel(
                              title: viewModel.hesapTipiList[index],
                              value: index,
                              groupValue: index,
                            ),
                          ),
                        );
                        if (result is List) {
                          if (result.isNotEmpty && result.every((element) => element is int)) {
                            _hesapTipiController.text = viewModel.hesapTipiList.whereIndexed((index, element) => result.contains(index)).join(", ");
                            viewModel.setHesapTipi(result.map((e) => e as int).toList().cast<int>());
                          } else {
                            _hesapTipiController.clear();
                            viewModel.setHesapTipi(null);
                          }
                        }
                      },
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        Get.back();
                        await viewModel.resetPage();
                      },
                      child: Text(loc.generalStrings.apply),
                    ).paddingAll(UIHelper.lowSize),
                  ],
                ),
              ),
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              child: Text(loc.generalStrings.sort),
              onPressed: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Sıralama",
                  groupValue: viewModel.model.sirala,
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
              },
            ),
            AppBarButton(
              icon: Icons.refresh_outlined,
              child: Text(loc.generalStrings.refresh),
              onPressed: () async => await viewModel.resetPage(),
            ),
          ],
        ),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: viewModel.resetPage,
        child: Observer(
          builder: (_) {
            if (viewModel.bankaListesi == null) {
              return const ListViewShimmer();
            } else if (viewModel.bankaListesi!.isEmpty) {
              return Center(child: Text(viewModel.errorText ?? "Banka bulunamadı.", textAlign: TextAlign.center));
            } else {
              return ListView.builder(
                itemCount: viewModel.groupedWithHesapTipiAdiList.length,
                itemBuilder: (context, index) {
                  final List<BankaListesiModel> itemList = viewModel.groupedWithHesapTipiAdiList[index];
                  final double total = itemList.fold<double>(0, (previousValue, element) => previousValue + (element.bakiye));
                  // final double totalDovizsiz = itemList.where((element) => element.dovizAdi == null).fold<double>(0, (previousValue, element) => previousValue + (element.bakiyeDovizli));
                  // final double totalDovizLi = itemList.where((element) => element.dovizAdi != null).fold<double>(0, (previousValue, element) => previousValue + (element.bakiyeDovizli));
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(itemList.firstOrNull?.hesapTipiAdi ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                              Text(
                                "${total.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                                style: const TextStyle(color: ColorPalette.slateGray),
                              ),
                            ],
                          ),
                          Row(
                            children: List.generate(
                              itemList.bakiyeMap(mainCurrency).length,
                              (index) => Text(
                                "${itemList.bakiyeMap(mainCurrency).values.toList()[index].commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} (${itemList.bakiyeMap(mainCurrency).keys.toList()[index]})  ",
                                style: const TextStyle(color: ColorPalette.slateGray),
                              ),
                            ),
                          ).yetkiVarMi(itemList.any((element) => element.dovizAdi != null)),
                        ],
                      ).paddingAll(UIHelper.lowSize),
                      ListView.builder(
                        itemCount: itemList.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          final BankaListesiModel item = itemList[index];
                          return Card(
                            elevation: 0,
                            borderOnForeground: true,
                            child: ListTile(
                              onTap: () async => widget.isGetData == true ? Get.back(result: item) : await dialogManager.showBankaGridViewDialog(item),
                              leading: CircleAvatar(
                                foregroundColor: Colors.white,
                                backgroundColor: UIHelper.getColorWithValue(item.bakiye),
                                child: Text(item.hesapAdi?[0] ?? ""),
                              ),
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(item.hesapAdi ?? ""),
                                ],
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      ColorfulBadge(badgeColorEnum: BadgeColorEnum.dovizli, label: Text("Dövizli ${item.dovizAdi ?? ""}")).yetkiVarMi((item.dovizTipi ?? 0) > 1),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(item.hesapKodu ?? ""),
                                      Text(
                                        "${item.bakiyeDovizli.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${item.dovizAdi ?? mainCurrency}",
                                        style: TextStyle(color: UIHelper.getColorWithValue(item.bakiye), fontSize: 12),
                                      ),
                                    ],
                                  ),
                                  Text(item.subeAdi ?? ""),
                                  Text(item.bankaAdi ?? ""),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            }
          },
        ).paddingAll(UIHelper.lowSize),
      );
}
