import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/main_page/model/menu_item/menu_item_constants.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_response_model.dart";
import "../../../../../../core/components/dialog/bottom_sheet/view_model/bottom_sheet_state_manager.dart";
import "../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../core/components/grid_tile/custom_animated_grid/view/custom_animated_grid_view.dart";
import "../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/color_palette.dart";
import "../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../core/constants/enum/islem_tipi_enum.dart";
import "../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../core/constants/extensions/model_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../cari_network_manager.dart";
import "../model/cari_listesi_model.dart";
import "../model/cari_request_model.dart";
import "../model/cari_secenekler_model.dart";
import "../model/cari_sehirler_model.dart";
import "../view_model/cari_listesi_view_model.dart";

final class CariListesiView extends StatefulWidget {
  const CariListesiView({super.key, this.isGetData = false, this.cariRequestModel});
  final bool isGetData;
  final CariRequestModel? cariRequestModel;

  @override
  State<CariListesiView> createState() => _CariListesiViewState();
}

final class _CariListesiViewState extends BaseState<CariListesiView> {
  final CariListesiViewModel viewModel = CariListesiViewModel();
  late final ScrollController _scrollController;
  late final TextEditingController plasiyerController;
  late final TextEditingController sehirController;
  late final TextEditingController ilceController;
  late final TextEditingController tipiController;
  late final TextEditingController kod0Controller;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;
  BottomSheetResponseModel? bottomSheetResponseModel;
  bool isLoading = false;
  Map? filterData;
  @override
  void initState() {
    if (widget.cariRequestModel != null) {
      viewModel.cariRequestModel = widget.cariRequestModel!;
    }
    _scrollController = ScrollController();
    plasiyerController = TextEditingController();
    sehirController = TextEditingController();
    ilceController = TextEditingController();
    tipiController = TextEditingController();
    kod0Controller = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
    if (yetkiController.cariKartiRotasUygulamasiAcikMi) {
      viewModel.setRota(CacheManager.getProfilParametre.rotaDisiGorunsunMu);
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _scrollController.addListener(() async {
        viewModel.changeScrollStatus(_scrollController.position);
      });
      if (widget.isGetData) {
        viewModel.changeSearchBar();
      }
      BottomSheetResponseModel.instance.clear();
      BottomSheetStateManager().deleteIsSelectedListMap();
      viewModel.changeSiralama(CacheManager.getProfilParametre.cariListesiSirala);
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    if (_scrollController.hasClients) {
      _scrollController.dispose();
    }
    plasiyerController.dispose();
    sehirController.dispose();
    ilceController.dispose();
    tipiController.dispose();
    kod0Controller.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(context),
        floatingActionButton: fab(),
        body: body(),
        bottomNavigationBar: bottomButtonBar(),
      );

  AppBar appBar(BuildContext context) => AppBar(
        title: Observer(
          builder: (_) => (viewModel.searchBar
              ? CustomAppBarTextField(
                  onFieldSubmitted: (value) async {
                    viewModel
                      ..changeFilterText(value)
                      ..resetList();
                  },
                )
              : AppBarTitle(
                  title: widget.isGetData ? "Cari Seçiniz" : "Cari Listesi",
                  subtitle: "${viewModel.observableList?.length ?? ""}",
                )),
        ),
        leading: IconButton(
          onPressed: () {
            if (viewModel.searchBar) {
              viewModel
                ..changeSearchBar()
                ..changeArama("")
                ..changeFilterText(null);
            } else {
              Get.back();
            }
          },
          icon: const Icon(Icons.arrow_back),
        ),
        bottom: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(
              iconWidget: Observer(builder: (_) => Icon(Icons.filter_alt_outlined, size: 20, fill: 1, color: viewModel.hasAnyFilters ? UIHelper.primaryColor : null)),
              onPressed: () async {
                await filtreleDialog(context);
                // if (filterData == null) {
                //   dialogManager.showLoadingDialog("Filtreler yükleniyor");
                //   var responseSehir = await CariNetworkManager.getFilterData();
                //   var responseKod = await CariNetworkManager.getKod();
                //   // filterData = {"sehir": responseSehir.data, "kod": responseKod.data};
                //   dialogManager.hideAlertDialog;
                // }
                // // ignore: use_build_context_synchronously
                // var result = await bottomSheetDialogManager.showFilterBottomSheetDialog(context, request: filterData);
                // if (result != null && result is BottomSheetResponseModel) {
                //   bottomSheetResponseModel = result;
                //   viewModel.resetList();
                // }
              },
              child: Text(loc.generalStrings.filter),
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              onPressed: () async => await siralaDialog(context),
              child: Text(loc.generalStrings.sort),
            ),
            AppBarButton(
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc.generalStrings.options,
                  children: [
                    BottomSheetModel(
                      title: "Cari Haritası",
                      iconWidget: Icons.map_outlined,
                      onTap: () {
                        Get
                          ..back()
                          ..toNamed("mainPage/cariHaritasi");
                      },
                    ),
                    BottomSheetModel(
                      title: "Raporlar",
                      iconWidget: Icons.area_chart_outlined,
                      onTap: () {
                        Get.back();
                        dialogManager.showCariRaporlarGridViewDialog();
                      },
                    ),
                  ],
                );
              },
              child: const Icon(Icons.more_horiz_outlined),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () async {
              viewModel.changeSearchBar();
              if (!viewModel.searchBar) {
                viewModel
                  ..changeFilterText(null)
                  ..resetList();
              }
            },
            icon: Observer(builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined)),
          ),
        ],
      );

  Future<void> siralaDialog(BuildContext context) async {
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Sıralama Türünü Seçiniz",
      groupValue: viewModel.cariRequestModel.siralama,
      children: List.generate(
        viewModel.siralaMap.length,
        (index) => BottomSheetModel(
          title: viewModel.siralaMap.keys.toList()[index],
          value: viewModel.siralaMap.values.toList()[index],
          groupValue: viewModel.siralaMap.values.toList()[index],
        ),
      ),
    );
    if (result != viewModel.cariRequestModel.siralama && result != null) {
      viewModel
        ..changeSiralama(result)
        ..resetList();
    }
  }

  Widget fab() => Observer(
        builder: (_) => Visibility(
          visible: viewModel.observableList != null && yetkiController.cariKartiYeniKayit,
          child: CustomFloatingActionButton(
            isScrolledDown: viewModel.isScrollDown,
            onPressed: () async {
              final String? siradakiKod = await CariNetworkManager.getSiradakiKod();
              Get.toNamed(
                "/mainPage/cariEdit",
                arguments: BaseEditModel(
                  baseEditEnum: BaseEditEnum.ekle,
                  editTipiEnum: EditTipiEnum.cari,
                  model: CariListesiModel(),
                  siradakiKod: siradakiKod,
                ),
              );
            },
          ),
        ),
      );
  Widget body() => Observer(
        builder: (_) => RefreshableListView.pageable(
          scrollController: _scrollController,
          onRefresh: viewModel.resetList,
          dahaVarMi: viewModel.dahaVarMi,
          items: viewModel.observableList,
          itemBuilder: cariListesiCard,
        ),
      );

  Card cariListesiCard(CariListesiModel item) => Card(
        child: Listener(
          onPointerDown: (event) {
            if (event.kind == PointerDeviceKind.mouse && event.buttons == 2) {
              showCariGrid(item);
            }
          },
          child: ListTile(
            onLongPress: () {
              showCariGrid(item);
            },
            onTap: () {
              if (widget.isGetData) {
                Get.back(result: item);
              } else {
                cariBottomSheet(context, item);
              }
            },
            // isThreeLine: true,
            // contentPadding: UIHelper.midPadding,
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: UIHelper.getColorWithValue(item.bakiye ?? 0.0),
                  foregroundColor: Colors.white,
                  child: Text(item.cariAdi?.substring(0, 1) ?? "", style: const TextStyle(color: Colors.white)),
                ),
              ],
            ),
            title: Text(item.cariAdi ?? ""),
            subtitle: Wrap(
              direction: Axis.vertical,
              alignment: WrapAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const ColorfulBadge(label: Text("E-Fatura"), badgeColorEnum: BadgeColorEnum.fatura).yetkiVarMi(item.efaturaMi == true),
                    ColorfulBadge(label: Text("Dövizli ${item.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(item.dovizli == true),
                    const ColorfulBadge(label: Text("Konum"), badgeColorEnum: BadgeColorEnum.konum).yetkiVarMi(item.boylam != null),
                    const ColorfulBadge(label: Text("Kilitli"), badgeColorEnum: BadgeColorEnum.kilitli).yetkiVarMi(item.kilit == "E"),
                    // object.boylam != null && object.enlem != null ? const Badge(label: Text(("Konum"))) : const SizedBox(),
                    // object.dovizAdi != null ? Badge(label: Text(("Dövizli ${object.dovizAdi}"))) : const SizedBox(),
                  ]
                      .map(
                        (e) => e is! SizedBox? ? e.paddingOnly(top: UIHelper.lowSize, right: UIHelper.lowSize) : null,
                      )
                      .toList()
                      .nullCheckWithGeneric,
                ),
                Text("${item.cariKodu}", style: TextStyle(color: theme.textTheme.bodySmall?.color?.withOpacity(0.5))),
                if (item.cariIl != null) Text("${item.cariIl ?? ""}/${item.cariIlce ?? ""}", style: TextStyle(color: theme.textTheme.bodySmall?.color?.withOpacity(0.5))) else const SizedBox(),
              ],
            ),
            trailing: Wrap(
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: item.bakiye == null ? "0,00 $mainCurrency\n" : "${item.bakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency\n",
                        style: TextStyle(color: UIHelper.getColorWithValue(item.bakiye ?? 0.0)),
                      ),
                      if (item.bakiye != null) TextSpan(text: "${((item.bakiye ?? 0) > 0) ? "Tahsil Edilecek" : "Ödenecek"}\n", style: const TextStyle(fontStyle: FontStyle.italic)) else null,
                      if (item.dovizli == true && item.dovBakiye != null)
                        TextSpan(
                          text: "${item.dovBakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} ${item.dovizAdi ?? ""}",
                          style: TextStyle(color: UIHelper.getColorWithValue(item.dovBakiye ?? 0.0)),
                        ),
                    ].nullCheckWithGeneric,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ).yetkiVarMi(bakiyeGorunsunMu(item)),
          ),
        ),
      );

  Future<void> showCariGrid(CariListesiModel object) async {
    await dialogManager.showCariGridViewDialog(
      object,
      islemTipi: IslemTipiEnum.cariListesi,
      onSelected: (p0) {
        if (p0) viewModel.resetList();
      },
    );
  }

  Widget? bottomButtonBar() => Observer(
        builder: (_) => BottomBarWidget(
          isScrolledDown: viewModel.isScrollDown,
          children: [
            FooterButton(
              children: [
                const Text("Tahsil Edilecek"),
                Observer(
                  builder: (_) => Text(
                    "${(viewModel.paramData?["TAHSIL_EDILECEK"] as double?)?.abs().commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? 0} $mainCurrency",
                    style: const TextStyle(color: ColorPalette.mantis),
                  ),
                ),
              ],
              onPressed: () async {
                if (viewModel.cariRequestModel.filterBakiye == "T") {
                  viewModel
                    ..changeFilterBakiye("")
                    ..changeFilterBakiyeTemp("")
                    ..changeSiralama("AZ");
                } else {
                  viewModel
                    ..changeFilterBakiye("T")
                    ..changeFilterBakiyeTemp("T")
                    ..changeSiralama("BAKIYE_ZA");
                }
                viewModel.resetList();
              },
            ),
            FooterButton(
              children: [
                const Text("Ödenecek"),
                Observer(
                  builder: (_) => Text(
                    "${(viewModel.paramData?["ODENECEK"] as double?)?.abs().commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? 0} $mainCurrency",
                    style: const TextStyle(color: ColorPalette.persianRed),
                  ),
                ),
              ],
              onPressed: () async {
                if (viewModel.cariRequestModel.filterBakiye == "Ö") {
                  viewModel
                    ..changeFilterBakiye("")
                    ..changeFilterBakiyeTemp("")
                    ..changeSiralama("AZ");
                } else {
                  viewModel
                    ..changeFilterBakiye("Ö")
                    ..changeFilterBakiyeTemp("Ö")
                    ..changeSiralama("BAKIYE_AZ");
                }
                viewModel.resetList();
              },
            ),
          ],
        ),
      );

  String getPaymentInfo(double bakiye) {
    if (bakiye > 0) {
      return "Tahsil Edilecek";
    } else if (bakiye < 0) {
      return "Ödenecek";
    } else {
      return "";
    }
  }

  Future<void> cariBottomSheet(BuildContext context, CariListesiModel object) async {
    final pageName = await bottomSheetDialogManager.showBottomSheetDialog<Object?>(
      context,
      title: "${object.cariKodu}\n${object.cariAdi}",
      children: [
        BottomSheetModel(
          title: loc.generalStrings.view,
          iconWidget: Icons.preview_outlined,
          value: CariSeceneklerModel(
            path: "/mainPage/cariEdit",
            baseEditEnum: BaseEditEnum.goruntule,
          ),
        ).yetkiKontrol(yetkiController.cariKarti),
        BottomSheetModel(
          title: loc.generalStrings.edit,
          iconWidget: Icons.edit_outlined,
          value: CariSeceneklerModel(
            path: "/mainPage/cariEdit",
            baseEditEnum: BaseEditEnum.duzenle,
          ),
        ).yetkiKontrol(yetkiController.cariKartiDuzenleme),
        BottomSheetModel(
          title: loc.generalStrings.delete,
          iconWidget: Icons.delete_outline,
          onTap: () async {
            Get.back();
            dialogManager.showAreYouSureDialog(() async {
              dialogManager.showLoadingDialog("Cari Siliniyor...");
              final result = await networkManager.dioPost<CariListesiModel>(
                path: ApiUrls.deleteCari,
                bodyModel: CariListesiModel(),
                queryParameters: {"CariKodu": object.cariKodu ?? ""},
              );
              dialogManager.hideAlertDialog;
              if (result.isSuccess) {
                dialogManager.showSuccessSnackBar("${object.cariAdi} adlı cari silindi");
                viewModel.resetList();
              } else {
                dialogManager.showErrorSnackBar(result.message ?? "");
              }
            });
          },
        ).yetkiKontrol(yetkiController.cariKartiSilme),
        BottomSheetModel(title: "Hareketler", iconWidget: Icons.sync_alt_outlined, onTap: () => Get.back(result: "/mainPage/cariHareketleri")).yetkiKontrol(yetkiController.cariHareketleri),
        BottomSheetModel(
          title: loc.generalStrings.actions,
          iconWidget: Icons.list_alt_outlined,
          onTap: () {
            Get.back();
            showCariGrid(object);
          },
        ),
        if (MenuItemConstants(context)
                .gridItemModel
                .firstWhereOrNull((element) => element.title == "Cari")
                ?.altMenuler
                ?.firstWhereOrNull((element) => element.title == "Raporlar")
                ?.altMenuler
                ?.where(
                  (element) => element.yetkiKontrol,
                )
                .toList()
                .ext
                .isNotNullOrEmpty ??
            false)
          BottomSheetModel(
            title: "Raporlar",
            iconWidget: Icons.area_chart_outlined,
            onTap: () {
              Get.back();
              dialogManager.showGridViewDialog(CustomAnimatedGridView(cariListesiModel: object, islemTipi: IslemTipiEnum.cariRapor, title: object.cariAdi ?? object.cariKodu));
            },
          ),
      ].nullCheckWithGeneric,
    );
    if (pageName != null) {
      BaseEditEnum? baseEditEnum;
      if (pageName is CariSeceneklerModel) {
        baseEditEnum = pageName.baseEditEnum;
        final BaseEditModel<CariListesiModel> editModel = BaseEditModel(
          baseEditEnum: baseEditEnum,
          editTipiEnum: EditTipiEnum.cari,
          model: object,
        );
        final result = await Get.toNamed(pageName.path ?? "", arguments: editModel);
        if (result == true) {
          viewModel.resetList();
        }
      } else if (pageName is String) {
        Get.toNamed(pageName, arguments: object);
      }
    }
  }

  Future<dynamic> filtreleDialog(BuildContext context) async => await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: loc.generalStrings.filter,
        body: Column(
          children: [
            CustomWidgetWithLabel(
              text: "Bakiye Durumu",
              child: Observer(
                builder: (_) => SlideControllerWidget(
                  childrenTitleList: viewModel.bakiyeMap.keys.toList(),
                  filterOnChanged: (index) => viewModel.changeFilterBakiyeTemp(viewModel.bakiyeMap.values.toList()[index ?? 0]),
                  childrenValueList: viewModel.bakiyeMap.values.toList(),
                  groupValue: viewModel.cariRequestModelTemp.filterBakiye,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "Plasiyer",
                    controller: plasiyerController,
                    suffixMore: true,
                    readOnly: true,
                    onClear: () {
                      plasiyerController.clear();
                      viewModel.changeArrPlasiyerKoduTemp(null);
                    },
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showPlasiyerListesiBottomSheetDialog(context, groupValues: viewModel.cariRequestModelTemp.arrPlasiyerKodu);
                      if (result != null) {
                        viewModel.changeArrPlasiyerKoduTemp(result.map((e) => e?.plasiyerKodu).toList().nullCheckWithGeneric);
                        plasiyerController.text = result.map((e) => e?.plasiyerAciklama).join(", ");
                      }
                    },
                  ),
                ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                Expanded(
                  child: CustomTextField(
                    labelText: "Şehir",
                    controller: sehirController,
                    readOnly: true,
                    suffixMore: true,
                    onClear: () {
                      sehirController.clear();
                      viewModel.changeArrSehirTemp(null);
                    },
                    onTap: () async {
                      if (viewModel.sehirler == null) {
                        await viewModel.getFilterData();
                      }
                      // ignore: use_build_context_synchronously
                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<CariSehirlerModel>(
                        context,
                        title: "Şehirler",
                        groupValues: viewModel.cariRequestModelTemp.arrSehir,
                        children: List.generate(
                          viewModel.sehirler?.length ?? 0,
                          (index) => BottomSheetModel(
                            title: viewModel.sehirler?[index].sehirAdi ?? "",
                            value: viewModel.sehirler?[index],
                            groupValue: viewModel.sehirler?[index].sehirAdi,
                          ),
                        ),
                      );
                      if (result != null) {
                        final List<CariSehirlerModel?> list = result.cast<CariSehirlerModel?>().toList();
                        viewModel.changeArrSehirTemp(list.map((e) => e?.sehirAdi).toList().nullCheckWithGeneric);
                        sehirController.text = list.map((e) => e?.sehirAdi).join(", ");
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "İlçe",
                    controller: ilceController,
                    onChanged: viewModel.changeIlceTemp,
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Tipi",
                    controller: tipiController,
                    suffixMore: true,
                    readOnly: true,
                    onClear: () {
                      tipiController.clear();
                      viewModel.changeCariTipiTemp(null);
                    },
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showCariTipiBottomSheetDialog(context, viewModel.cariRequestModelTemp.cariTipi);
                      if (result != null) {
                        tipiController.text = result.title ?? "";
                        viewModel.changeCariTipiTemp(result.value);
                      }
                    },
                  ),
                ),
              ],
            ),
            Card(
              child: Observer(
                builder: (_) => SwitchListTile.adaptive(
                  value: viewModel.getRota,
                  onChanged: (value) {
                    viewModel.setRota(value);
                    CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(rotaDisiGorunsunMu: value));
                  },
                  title: const Text("Rota Dışı"),
                ),
              ).yetkiVarMi(yetkiController.cariKartiRotasUygulamasiAcikMi),
            ),
            InkWell(
              onTap: viewModel.changeKodlariGoster,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [const Text("Cari Rapor Kodları"), Observer(builder: (_) => Icon(viewModel.kodlariGoster ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down))],
              ),
            ).paddingAll(UIHelper.lowSize),
            Observer(
              builder: (_) => Visibility(
                visible: viewModel.kodlariGoster,
                child: Wrap(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Grup Kodu",
                            controller: kod0Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: viewModel.cariRequestModelTemp.arrGrupKodu,
                                children: List.generate(
                                  viewModel.getGrupKod0?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.getGrupKod0?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod0?[index],
                                    groupValue: viewModel.getGrupKod0?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result != null) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod0Temp(list.map((e) => e?.grupKodu).toList().nullCheckWithGeneric);
                                kod0Controller.text = list.map((e) => e?.grupAdi).join(", ");
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodlari?.any((element) => element.grupNo == 0) ?? false),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 1",
                            controller: kod1Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: viewModel.cariRequestModelTemp.arrKod1,
                                children: List.generate(
                                  viewModel.getGrupKod1?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.getGrupKod1?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod1?[index],
                                    groupValue: viewModel.getGrupKod1?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result != null) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod1Temp(list.map((e) => e?.grupKodu).toList().nullCheckWithGeneric);
                                kod1Controller.text = list.map((e) => e?.grupAdi).join(", ");
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodlari?.any((element) => element.grupNo == 1) ?? false),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 2",
                            controller: kod2Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: viewModel.cariRequestModelTemp.arrKod2,
                                children: List.generate(
                                  viewModel.getGrupKod2?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.getGrupKod2?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod2?[index],
                                    groupValue: viewModel.getGrupKod2?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result != null) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod2Temp(list.map((e) => e?.grupKodu).toList().nullCheckWithGeneric);
                                kod2Controller.text = list.map((e) => e?.grupAdi).join(", ");
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodlari?.any((element) => element.grupNo == 2) ?? false),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 3",
                            controller: kod3Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: viewModel.cariRequestModelTemp.arrKod3,
                                children: List.generate(
                                  viewModel.getGrupKod3?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.getGrupKod3?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod3?[index],
                                    groupValue: viewModel.getGrupKod3?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result != null) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod3Temp(list.map((e) => e?.grupKodu).toList().nullCheckWithGeneric);
                                kod3Controller.text = list.map((e) => e?.grupAdi).join(", ");
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodlari?.any((element) => element.grupNo == 3) ?? false),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 4",
                            controller: kod4Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: viewModel.cariRequestModelTemp.arrKod4,
                                children: List.generate(
                                  viewModel.getGrupKod4?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.getGrupKod4?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod4?[index],
                                    groupValue: viewModel.getGrupKod4?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result != null) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod4Temp(list.map((e) => e?.grupKodu).toList().nullCheckWithGeneric);
                                kod4Controller.text = list.map((e) => e?.grupAdi).join(", ");
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodlari?.any((element) => element.grupNo == 4) ?? false),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 5",
                            controller: kod5Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<BaseGrupKoduModel>(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: viewModel.cariRequestModelTemp.arrKod5,
                                children: List.generate(
                                  viewModel.getGrupKod5?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.getGrupKod5?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod5?[index],
                                    groupValue: viewModel.getGrupKod5?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result != null) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod5Temp(list.map((e) => e?.grupKodu).toList().nullCheckWithGeneric);
                                kod5Controller.text = list.map((e) => e?.grupAdi).join(", ");
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodlari?.any((element) => element.grupNo == 5) ?? false),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                    onPressed: () {
                      Get.back();
                      viewModel.resetFilter();
                      plasiyerController.clear();
                      sehirController.clear();
                      ilceController.clear();
                      tipiController.clear();
                      kod0Controller.clear();
                      kod1Controller.clear();
                      kod2Controller.clear();
                      kod3Controller.clear();
                      kod4Controller.clear();
                      kod5Controller.clear();
                      viewModel.resetList();
                    },
                    child: const Text("Filtreyi Temizle"),
                  ),
                ),
                const SizedBox(width: UIHelper.midSize),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      Get.back();
                      viewModel
                        ..changeArrKod0(viewModel.cariRequestModelTemp.arrGrupKodu)
                        ..changeArrKod1(viewModel.cariRequestModelTemp.arrKod1)
                        ..changeArrKod2(viewModel.cariRequestModelTemp.arrKod2)
                        ..changeArrKod3(viewModel.cariRequestModelTemp.arrKod3)
                        ..changeArrKod4(viewModel.cariRequestModelTemp.arrKod4)
                        ..changeArrKod5(viewModel.cariRequestModelTemp.arrKod5)
                        ..changeArrSehir(viewModel.cariRequestModelTemp.arrSehir)
                        ..changeArrPlasiyerKodu(viewModel.cariRequestModelTemp.arrPlasiyerKodu)
                        ..changeCariTipi(viewModel.cariRequestModelTemp.cariTipi)
                        ..changeFilterBakiye(viewModel.cariRequestModelTemp.filterBakiye)
                        ..changeIlce(viewModel.cariRequestModelTemp.ilce)
                        ..resetList();
                    },
                    child: Text(loc.generalStrings.apply),
                  ),
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ],
        ),
      );

  bool bakiyeGorunsunMu(CariListesiModel model) {
    if (widget.isGetData && !yetkiController.adminMi && !yetkiController.cariListesi) return false;
    if (widget.cariRequestModel?.teslimCari == "E" && yetkiController.cariTeslimCariRehberSadeceSecsin) return false;
    if (yetkiController.cariBakiyeGosterimTumuMu) return true;
    if (userModel.plasiyerKodu == null || userModel.plasiyerKodu != model.plasiyerKodu) return false;
    if (yetkiController.cariBakiyeGosterimKendiCarileriMi) return true;
    return false;
  }
}
