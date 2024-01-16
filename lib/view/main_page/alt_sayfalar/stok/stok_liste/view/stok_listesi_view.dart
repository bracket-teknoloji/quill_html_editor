// ignore_for_file: use_build_context_synchronously

import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/image/image_view.dart";
import "package:picker/core/components/image/image_widget.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/wrap/appbar_title.dart";

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
import "../../../../../../core/constants/extensions/model_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../cari/cari_network_manager.dart";
import "../model/stok_bottom_sheet_model.dart";
import "../model/stok_listesi_model.dart";
import "../view_model/stok_listesi_view_model.dart";

class StokListesiView extends StatefulWidget {
  final bool? isGetData;
  final StokBottomSheetModel? requestModel;
  final String? searchText;
  const StokListesiView({super.key, this.isGetData, this.searchText, this.requestModel});

  @override
  State<StokListesiView> createState() => _StokListesiViewState();
}

class _StokListesiViewState extends BaseState<StokListesiView> {
  StokListesiViewModel viewModel = StokListesiViewModel();
  List<StokListesiModel>? get stokListesi => viewModel.stokListesi ?? [];
  late final ScrollController scrollController;
  TextEditingController grupKoduController = TextEditingController();
  TextEditingController kod1Controller = TextEditingController();
  TextEditingController kod2Controller = TextEditingController();
  TextEditingController kod3Controller = TextEditingController();
  TextEditingController kod4Controller = TextEditingController();
  TextEditingController kod5Controller = TextEditingController();
  @override
  void initState() {
    scrollController = ScrollController();
    if (widget.requestModel != null) {
      viewModel.bottomSheetModel = widget.requestModel!;
    }
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
        if (viewModel.dahaVarMi) {
          await getData();
        }
      }
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        viewModel.changeIsScrolledDown(true);
      } else if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        viewModel.changeIsScrolledDown(false);
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.isGetData ?? false) {
        viewModel.setSearchBar();
        // viewModel.setSearchValue(widget.searchText);
      }
      await getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    bottomSheetDialogManager.clearSelectedData();
    // viewModel.setBottomSheetModel(StokBottomSheetModel());
    scrollController.dispose();
    super.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (viewModel.searchBar && widget.searchText != null) {
      FocusScope.of(context).unfocus();
    }
    kod5Controller.text = viewModel.kod5?.map((e) => e.grupAdi).join(", ") ?? "";
    return Scaffold(
      resizeToAvoidBottomInset: true,
      // floatingActionButton: Observer(builder: (_) {
      //   return CustomFloatingActionButton(isScrolledDown: viewModel.isScrolledDown, onPressed: () {});
      // }),
      floatingActionButton: fab(),
      appBar: appBar(),
      body: RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.setStokListesi(null);
          viewModel.resetSayfa();
          return await getData();
        },
        child: body(),
      ),
    );
  }

  AppBar appBar() => AppBar(
        primary: true,
        // controller: scrollController,
        leading: IconButton(
          onPressed: () {
            if (viewModel.searchBar) {
              viewModel.setSearchBar();
              viewModel.setSearchValue("");
              viewModel.setStokListesi(null);
              viewModel.resetSayfa();
              getData();
            } else {
              Get.back();
            }
          },
          icon: const Icon(Icons.arrow_back_outlined),
        ),
        title: Observer(
          builder: (_) => viewModel.searchBar
              ? CustomAppBarTextField(
                  controller: TextEditingController(text: viewModel.searchValue),
                  onFieldSubmitted: (value) {
                    viewModel.resetSayfa();
                    viewModel.setSearchValue(value);
                    viewModel.setStokListesi(null);
                    getData();
                  },
                )
              : AppBarTitle(
                  title: (widget.isGetData ?? false) ? "Stok Seçiniz" : "Stok Listesi",
                  subtitle: viewModel.stokListesi?.length.toStringIfNotNull ?? "",
                ),
        ),
        actions: [
          hideSearchBar(),
          Observer(
            builder: (_) => viewModel.searchBar
                ? const SizedBox()
                : IconButton(
                    onPressed: () async {
                      await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        title: loc(context).generalStrings.options,
                        body: Observer(
                          builder: (_) => SwitchListTile.adaptive(
                            title: const Text("Resimleri Göster"),
                            value: viewModel.resimleriGoster == "E",
                            onChanged: (value) async {
                              viewModel.setResimleriGoster();
                              if (viewModel.resimleriGoster == "E") {
                                viewModel.setStokListesi(null);
                                viewModel.resetSayfa();
                                Get.back();
                                await getData();
                              } else {
                                viewModel.setStokListesi(null);
                                viewModel.resetSayfa();
                                Get.back();
                                await getData();
                              }
                            },
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.more_vert_outlined),
                  ),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(
              icon: Icons.qr_code_scanner,
              child: const Text("Barkod"),
              onPressed: () async {
                final result = await Get.toNamed("/qr");
                if (result != null) {
                  viewModel.setSearchBar();
                  viewModel.setStokListesi(null);
                  viewModel.resetSayfa();
                  viewModel.setSearchValue(result);
                  await getData();
                }
              },
            ),
            AppBarButton(
              iconWidget: Observer(builder: (_) => Icon(Icons.filter_alt_outlined, size: 20, fill: 1, color: viewModel.hasAnyFilters ? UIHelper.primaryColor : null)),
              child: Text(loc(context).generalStrings.filter),
              onPressed: () async {
                if (viewModel.grupKodlari.isEmptyOrNull) {
                  final grupKodlari = await CariNetworkManager.getKod(name: GrupKoduEnum.stok);
                  // StaticVariables.grupKodlari = grupKodlari.data.map((e) => e as BaseGrupKoduModel).toList().cast<BaseGrupKoduModel>();
                  if (grupKodlari.data != null) {
                    viewModel.setGrupKodlari(grupKodlari.data.map((e) => e as BaseGrupKoduModel).toList().cast<BaseGrupKoduModel>());
                  }
                }
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc(context).generalStrings.filter,
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
                          // Center(
                          //   child: Observer(builder: (_) {
                          //     return CustomWidgetWithLabel(
                          //       text: "Bakiye",
                          //       child: ToggleButtons(
                          //         constraints: BoxConstraints(minWidth: ((context.isPortrait ? width : 600) * 0.9) / 5, minHeight: height * 0.05),
                          //         isSelected: viewModel.selected.toList(),
                          //         children: viewModel.selectedList.map((e) => Text(e)).toList(),
                          //         onPressed: (index) {
                          //           viewModel.setSelectedWithIndex(index);
                          //         },
                          //       ),
                          //     );
                          //   }),
                          // ),
                          Observer(
                            builder: (_) => Row(
                              children: [
                                Expanded(
                                  child: Observer(
                                    builder: (_) => CustomTextField(
                                      labelText: "Grup Kodu",
                                      readOnly: true,
                                      controller: grupKoduController,
                                      onTap: () async {
                                        final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
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
                                        if (result != null && result is List) {
                                          viewModel.changeArrGrupKoduTemp(result.whereType<BaseGrupKoduModel>().toList());
                                          grupKoduController.text = result.map((e) => e.grupAdi).join(", ");
                                        }
                                      },
                                      suffixMore: true,
                                    ),
                                  ),
                                ).yetkiVarMi(viewModel.grupKodlari.any((element) => element.grupNo == 0)),
                                Expanded(
                                  child: CustomTextField(
                                    labelText: "Kod 1",
                                    readOnly: true,
                                    suffixMore: true,
                                    controller: kod1Controller,
                                    onTap: () async {
                                      final List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 1).toList();
                                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
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
                                      if (result != null && result is List) {
                                        viewModel.changeArrKod1Temp(result.whereType<BaseGrupKoduModel>().toList());
                                        kod1Controller.text = result.map((e) => e.grupAdi).join(", ");
                                      }
                                    },
                                  ),
                                ).yetkiVarMi(viewModel.grupKodlari.any((element) => element.grupNo == 1)),
                              ],
                            ),
                          ),
                          Observer(
                            builder: (_) => Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    labelText: "Kod 2",
                                    readOnly: true,
                                    suffixMore: true,
                                    controller: kod2Controller,
                                    onTap: () async {
                                      final List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 2).toList();
                                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
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
                                      if (result != null && result is List) {
                                        viewModel.changeArrKod2(result.whereType<BaseGrupKoduModel>().toList());
                                        kod2Controller.text = result.map((e) => e.grupAdi).join(", ");
                                      }
                                    },
                                  ),
                                ).yetkiVarMi(viewModel.grupKodlari.any((element) => element.grupNo == 2)),
                                Expanded(
                                  child: CustomTextField(
                                    labelText: "Kod 3",
                                    readOnly: true,
                                    suffixMore: true,
                                    controller: kod3Controller,
                                    onTap: () async {
                                      final List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 3).toList();
                                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
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
                                      if (result != null && result is List) {
                                        viewModel.changeArrKod3Temp(result.whereType<BaseGrupKoduModel>().toList());
                                        kod3Controller.text = result.map((e) => e.grupAdi).join(", ");
                                      }
                                    },
                                  ),
                                ).yetkiVarMi(viewModel.grupKodlari.any((element) => element.grupNo == 3)),
                              ],
                            ),
                          ),
                          Observer(
                            builder: (_) => Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    labelText: "Kod 4",
                                    readOnly: true,
                                    suffixMore: true,
                                    controller: kod4Controller,
                                    onTap: () async {
                                      final List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 4).toList();
                                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                        context,
                                        title: "Kod 4",
                                        groupValues: viewModel.bottomSheetModelTemp.arrKod4?.map((e) => e.grupKodu).toList(),
                                        children: grupKodlari
                                            .map(
                                              (e) => BottomSheetModel(
                                                title: e.grupAdi ?? "",
                                                onTap: () {
                                                  if (viewModel.bottomSheetModelTemp.arrKod4?.contains(e) ?? false) {
                                                    viewModel.bottomSheetModelTemp.arrKod4?.remove(e);
                                                  } else {
                                                    viewModel.bottomSheetModelTemp.arrKod4?.add(e);
                                                  }
                                                },
                                              ),
                                            )
                                            .toList(),
                                      );
                                      if (result != null && result is List) {
                                        viewModel.changeArrKod4Temp(result.whereType<BaseGrupKoduModel>().toList());
                                        kod4Controller.text = result.map((e) => e.grupAdi).join(", ");
                                      }
                                    },
                                  ),
                                ).yetkiVarMi(viewModel.grupKodlari.any((element) => element.grupNo == 4)),
                                Expanded(
                                  child: CustomTextField(
                                    labelText: "Kod 5",
                                    readOnly: true,
                                    suffixMore: true,
                                    controller: kod5Controller,
                                    onTap: () async {
                                      final List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 5).toList();
                                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                        context,
                                        title: "Kod 5",
                                        groupValues: viewModel.bottomSheetModelTemp.arrKod5?.map((e) => e.grupKodu).toList(),
                                        children: grupKodlari
                                            .map(
                                              (e) => BottomSheetModel(
                                                title: e.grupAdi ?? "",
                                                groupValue: e.grupKodu,
                                                onTap: () {
                                                  if (viewModel.bottomSheetModelTemp.arrKod5?.contains(e) ?? false) {
                                                    viewModel.bottomSheetModelTemp.arrKod5?.remove(e);
                                                  } else {
                                                    viewModel.bottomSheetModelTemp.arrKod5?.add(e);
                                                  }
                                                },
                                              ),
                                            )
                                            .toList(),
                                      );
                                      if (result != null && result is List) {
                                        viewModel.changeArrKod5Temp(result.whereType<BaseGrupKoduModel>().toList());
                                        kod5Controller.text = result.map((e) => e.grupAdi).join(", ");
                                      }
                                    },
                                  ),
                                ).yetkiVarMi(viewModel.grupKodlari.any((element) => element.grupNo == 5)),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () {
                                    grupKoduController.text = "";
                                    kod1Controller.text = "";
                                    kod2Controller.text = "";
                                    kod3Controller.text = "";
                                    kod4Controller.text = "";
                                    kod5Controller.text = "";
                                    // viewModel.setBottomSheetModel(StokBottomSheetModel());
                                    viewModel.changeBakiyeDurumu("T");
                                    viewModel.changeBakiyeDurumuTemp(0);
                                    viewModel.resetSayfa();
                                    viewModel.setStokListesi(null);
                                    viewModel.setSelectedWithIndex(0);
                                    viewModel.resetSelectedArr();
                                    getData();
                                    Get.back();
                                  },
                                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                                  child: const Text("Temizle"),
                                ),
                              ),
                              SizedBox(width: width * 0.02),
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    viewModel.changeBakiyeDurumu(viewModel.bottomSheetModelTemp.bakiyeDurumu);
                                    viewModel.changeArrGrupKodu(viewModel.bottomSheetModelTemp.arrGrupKodu ?? <BaseGrupKoduModel>[]);
                                    viewModel.changeArrKod1(viewModel.bottomSheetModelTemp.arrKod1 ?? <BaseGrupKoduModel>[]);
                                    viewModel.changeArrKod2(viewModel.bottomSheetModelTemp.arrKod2 ?? <BaseGrupKoduModel>[]);
                                    viewModel.changeArrKod3(viewModel.bottomSheetModelTemp.arrKod3 ?? <BaseGrupKoduModel>[]);
                                    viewModel.changeArrKod4(viewModel.bottomSheetModelTemp.arrKod4 ?? <BaseGrupKoduModel>[]);
                                    viewModel.changeArrKod5(viewModel.bottomSheetModelTemp.arrKod5 ?? <BaseGrupKoduModel>[]);
                                    viewModel.resetSayfa();
                                    viewModel.setStokListesi(null);
                                    Get.back();
                                    await getData();
                                  },
                                  child: Text(loc(context).generalStrings.apply),
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
              child: Text(loc(context).generalStrings.sort),
              // child: const Icon(Icons.sort_by_alpha_outlined),
              onPressed: () async {
                final String? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: loc(context).generalStrings.sort,
                  groupValue: viewModel.siralama,
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
                  viewModel.setStokListesi(null);
                  viewModel.setSiralama(result);
                  viewModel.resetSayfa();
                  await getData();
                }
              },
            ),
            //! AppBarButton(icon: Icons.format_align_left_sharp, onPressed: () {}),
            //! AppBarButton(icon: Icons.refresh_outlined, onPressed: () {})
          ].nullCheckWithGeneric,
        ),
      );

  Widget hideSearchBar() => Observer(
        builder: (_) => IconButton(
          onPressed: () {
            viewModel.setSearchBar();
            if (!viewModel.searchBar) {
              viewModel.resetSayfa();
              viewModel.setSearchValue("");
              viewModel.setStokListesi(null);
              getData();
            }
          },
          icon: Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined),
        ),
      );

  Observer? fab() => Observer(
        builder: (_) => Visibility(
          visible: viewModel.stokListesi?.isNotEmpty ?? false,
          child: CustomFloatingActionButton(
            isScrolledDown: viewModel.isScrolledDown,
            onPressed: () async {
              final BaseEditModel result = BaseEditModel<StokListesiModel>(baseEditEnum: BaseEditEnum.ekle, model: StokListesiModel());
              final isSucces = await Get.toNamed("/mainPage/stokEdit", arguments: result);
              if (isSucces != null) {
                viewModel.setStokListesi(null);
                viewModel.resetSayfa();
                await getData();
              }
            },
          ).yetkiVarMi(yetkiController.stokKartiYeniKayit),
        ),
      );

  Observer body() => Observer(
        builder: (_) => viewModel.stokListesi.isEmptyOrNull
            ? (viewModel.stokListesi?.isEmpty ?? false)
                ? const Center(child: Text("Stok Bulunamadı"))
                : const ListViewShimmer().paddingAll(UIHelper.lowSize)
            : ListView.builder(
                primary: false,
                padding: UIHelper.lowPadding,
                controller: scrollController,
                itemCount: (viewModel.stokListesi?.length ?? 0) + 1,
                itemBuilder: (context, index) {
                  if (index < (viewModel.stokListesi?.length ?? 0)) {
                    final StokListesiModel stok = stokListesi![index];

                    return Card(
                      child: Listener(
                        onPointerDown: (event) {
                          if (event.kind == PointerDeviceKind.mouse && event.buttons == 2) {
                            dialogManager.showStokGridViewDialog(stok);
                          }
                        },
                        child: ListTile(
                          onLongPress: () {
                            dialogManager.showStokGridViewDialog(stok);
                          },
                          // leading: stok.resimUrlKucuk !=null ? Image.memory(networkManager.getImage(stok.resimUrlKucuk))
                          leading: CircleAvatar(
                            child: stok.resimUrlKucuk == null && viewModel.resimleriGoster != "E"
                                ? Text((stok.stokAdi ?? "  ").substring(0, 1))
                                : SizedBox(
                                    height: UIHelper.highSize * 3,
                                    width: UIHelper.highSize * 3,
                                    child: InkWell(
                                      borderRadius: UIHelper.lowBorderRadius,
                                      onTap: () {
                                        if (stok.resimUrl != null) {
                                          Get.to(ImageView(path: stok.resimUrl ?? "", title: stok.stokKodu ?? ""));
                                        }
                                      },
                                      child: ImageWidget(path: stok.resimUrlKucuk),
                                    ),
                                  ),
                          ),
                          trailing: Text(
                            "${(stok.bakiye ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${stok.olcuBirimi ?? ""}",
                            style: context.textTheme.bodySmall?.copyWith(color: UIHelper.getColorWithValue(stok.bakiye ?? 0)),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: stok.stokAdi,
                                  children: [
                                    TextSpan(text: "\n${stok.stokKodu}", style: context.textTheme.bodySmall?.copyWith(color: ColorPalette.slateGray)),
                                  ],
                                ),
                              ),
                              Wrap(
                                spacing: UIHelper.lowSize,
                                children: [
                                  const ColorfulBadge(label: Text("Seri"), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(stok.seriCikislardaAcik == true),
                                  const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(stok.alisDovTip != null || stok.satDovTip != null),
                                  const ColorfulBadge(label: Text("Es.Yap."), badgeColorEnum: BadgeColorEnum.esYap).yetkiVarMi(stok.yapilandirmaAktif == true),
                                ].whereType<ColorfulBadge>().toList(),
                              ),
                            ],
                          ),
                          onTap: (widget.isGetData ?? false)
                              ? () => Get.back(result: stok)
                              : () async {
                                  final children2 = [
                                    BottomSheetModel(
                                      title: loc(context).generalStrings.view,
                                      iconWidget: Icons.preview_outlined,
                                      onTap: () => Get.back(result: BaseEditModel<StokListesiModel>(baseEditEnum: BaseEditEnum.goruntule, model: stok)),
                                    ).yetkiKontrol(yetkiController.stokKarti),
                                    BottomSheetModel(
                                      title: loc(context).generalStrings.edit,
                                      iconWidget: Icons.edit,
                                      onTap: () => Get.back(result: BaseEditModel<StokListesiModel>(baseEditEnum: BaseEditEnum.duzenle, model: stok)),
                                    ).yetkiKontrol(yetkiController.stokKartiDuzenleme),
                                    BottomSheetModel(
                                      title: "Hareketler",
                                      iconWidget: Icons.sync_alt_outlined,
                                      onTap: () {
                                        Get.back();
                                        return Get.toNamed("/mainPage/stokHareketleri", arguments: stok);
                                      },
                                    ).yetkiKontrol(yetkiController.stokHareketleriStokHareketleri),
                                    BottomSheetModel(
                                      title: "Raporlar",
                                      iconWidget: Icons.area_chart_outlined,
                                      onTap: () async {
                                        Get.back();
                                        dialogManager.showStokGridViewDialog(stok, IslemTipiEnum.stokRapor);
                                      },
                                    ),
                                    //TODO BottomSheetModel(title: "Depo Bakiye Durumu", iconWidget: Icons.list_alt),
                                    //TODO !!BottomSheetModel(
                                    // !!  title: loc(context).generalStrings.print,
                                    //   iconWidget: Icons.print,
                                    //   onTap: () async {
                                    //     // // ignore: use_build_context_synchronously
                                    //     // await bottomSheetDialogManager.showBottomSheetDialog(context,
                                    //     //     title: "fdsfg",
                                    //     //     body: Image(
                                    //     //       image: result,
                                    //     //       errorBuilder: (context, error, stackTrace) {
                                    //     //         return const Icon(Icons.image_not_supported_outlined);
                                    //     //       },
                                    //     //     ));
                                    //   },
                                    // ),
                                    BottomSheetModel(
                                      title: loc(context).generalStrings.actions,
                                      iconWidget: Icons.list_alt,
                                      onTap: () {
                                        Get.back();
                                        dialogManager.showStokGridViewDialog(stok);
                                      },
                                    ),
                                  ];
                                  children2.insert(
                                    2,
                                    BottomSheetModel(title: loc(context).generalStrings.delete, iconWidget: Icons.delete, onTap: () => deleteStok(stok.stokKodu ?? ""))
                                        .yetkiKontrol(yetkiController.stokKartiSilme),
                                  );
                                  final List<BottomSheetModel> newResult = children2.nullCheckWithGeneric;
                                  final BaseEditModel? result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: stok.stokKodu ?? "", children: newResult);
                                  if (result != null) {
                                    await Get.toNamed("/mainPage/stokEdit", arguments: result);
                                    viewModel.setStokListesi(null);
                                    viewModel.resetSayfa();
                                    await getData();
                                  }
                                },
                        ),
                      ),
                    );
                  } else {
                    return Observer(
                      builder: (_) => Visibility(
                        visible: viewModel.dahaVarMi,
                        child: const Center(child: CircularProgressIndicator.adaptive()),
                      ),
                    );
                  }
                },
              ),
      );

  Future<void> getData() async {
    // final StokBottomSheetModel? requestModel = widget.requestModel;
    // Map data2 = {
    //   "MenuKodu": requestModel?.menuKodu ?? "STOK_STOK",
    //   "ResimGoster": requestModel?.resimleriGoster ?? viewModel.resimleriGoster,
    //   "Siralama": requestModel?.siralama ?? viewModel.siralama,
    //   "Sayfa": viewModel.sayfa,
    //   "BakiyeDurumu": viewModel.bakiye ?? "",
    // };
    // if (requestModel != null) {
    //   data2 = requestModel.toJson();
    //   data2["SeriTakibiVar"] = requestModel.seriTakibiVar;
    //   data2["Sayfa"] = viewModel.sayfa;
    // }
    // if (!viewModel.bottomSheetModel.arrGrupKodu.isEmptyOrNull) {
    //   final List<String> liste = [];
    //   viewModel.bottomSheetModel.arrGrupKodu?.forEach((element) {
    //     liste.add(element.grupKodu ?? "");
    //   });
    //   data2["ArrGrupKodu"] = liste;
    // }
    // if (viewModel.searchValue.isNotEmpty) {
    //   data2["SearchText"] = viewModel.searchValue;
    // }
    // if (!viewModel.bottomSheetModel.arrKod1.isEmptyOrNull) {
    //   final List<String> liste = [];
    //   viewModel.bottomSheetModel.arrKod1?.forEach((element) {
    //     liste.add(element.grupKodu ?? "");
    //   });
    //   data2["ArrKod1"] = liste;
    // }
    // if (!viewModel.bottomSheetModel.arrKod2.isEmptyOrNull) {
    //   final List<String> liste = [];
    //   viewModel.bottomSheetModel.arrKod2?.forEach((element) {
    //     liste.add(element.grupKodu ?? "");
    //   });
    //   data2["ArrKod2"] = liste;
    // }
    // if (!viewModel.bottomSheetModel.arrKod3.isEmptyOrNull) {
    //   final List<String> liste = [];
    //   viewModel.bottomSheetModel.arrKod3?.forEach((element) {
    //     liste.add(element.grupKodu ?? "");
    //   });
    //   data2["ArrKod3"] = liste;
    // }
    // if (!viewModel.bottomSheetModel.arrKod4.isEmptyOrNull) {
    //   final List<String> liste = [];
    //   viewModel.bottomSheetModel.arrKod4?.forEach((element) {
    //     liste.add(element.grupKodu ?? "");
    //   });
    //   data2["ArrKod4"] = liste;
    // }
    // if (!viewModel.bottomSheetModel.arrKod5.isEmptyOrNull) {
    //   final List<String> liste = [];
    //   viewModel.bottomSheetModel.arrKod5?.forEach((element) {
    //     liste.add(element.grupKodu ?? "");
    //   });
    //   data2["ArrKod5"] = liste;
    // }
    final GenericResponseModel response = await networkManager.dioPost<StokListesiModel>(
      path: ApiUrls.getStoklar,
      data: (viewModel.bottomSheetModel.copyWith(
        resimGoster: viewModel.resimleriGoster,
        menuKodu: "STOK_STOK",
        searchText: viewModel.searchValue,
      )).toJsonWithList(),
      bodyModel: StokListesiModel(),
    );
    if (response.success ?? false) {
      final List<StokListesiModel>? liste = response.data.map((e) => e as StokListesiModel).toList().cast<StokListesiModel>();

      if (viewModel.sayfa == 1) {
        viewModel.setStokListesi(liste);
      } else {
        viewModel.addStokListesi(liste ?? <StokListesiModel>[]);
      }
      if ((liste?.length ?? 0) < parametreModel.sabitSayfalamaOgeSayisi) {
        viewModel.setDahaVarMi(false);
        if (viewModel.bottomSheetModel != StokBottomSheetModel()) {
          viewModel.increaseSayfa();
        }
      } else if ((liste?.length ?? 0) == 0) {
        viewModel.setDahaVarMi(false);
      } else {
        viewModel.increaseSayfa();
        viewModel.setDahaVarMi(true);
      }
    } else {
      viewModel.setStokListesi(<StokListesiModel>[]);
    }

    if (scrollController.positions.isNotEmpty && (scrollController.position.pixels == scrollController.position.maxScrollExtent)) {
      viewModel.changeIsScrolledDown(true);
    }
  }

  Future<MemoryImage?> getImage(String path) async => await networkManager.getImage(path);

  void deleteStok(String stokKodu) {
    Get.back();
    dialogManager.showAreYouSureDialog(() async {
      final GenericResponseModel response =
          await networkManager.dioPost<StokListesiModel>(bodyModel: StokListesiModel(), path: ApiUrls.deleteStok, queryParameters: {"Kod": stokKodu}, showLoading: true);
      if (response.success ?? false) {
        dialogManager.showSuccessSnackBar("Başarıyla Silindi");
        viewModel.resetSayfa();
        await getData();
      }
    });
  }
}
