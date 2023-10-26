import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/color_palette.dart";

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
import "../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
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
import "../model/cari_secenekler_model.dart";
import "../model/cari_sehirler_model.dart";
import "../view_model/cari_listesi_view_model.dart";

class CariListesiView extends StatefulWidget {
  final bool? isGetData;
  const CariListesiView({super.key, this.isGetData});

  @override
  State<CariListesiView> createState() => _CariListesiViewState();
}

class _CariListesiViewState extends BaseState<CariListesiView> {
  CariListesiViewModel viewModel = CariListesiViewModel();
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      init();
    });
    super.initState();
  }

  void init() {
    BottomSheetResponseModel.instance.clear();
    BottomSheetStateManager().deleteIsSelectedListMap();
    _scrollController.addListener(() async {
      if (_scrollController.hasClients) {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
          if (viewModel.dahaVarMi) {
            await viewModel.getData();
            viewModel.changeIsScrolledDown(true);
          }
        }
        if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
          viewModel.changeIsScrolledDown(false);
        } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          viewModel.changeIsScrolledDown(true);
        }
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
          viewModel.changeIsScrolledDown(false);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
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
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        extendBodyBehindAppBar: false,
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
                    viewModel.changeFilterText(value);
                    await viewModel.resetPage();
                  },
                )
              : AppBarTitle(
                  title: "Cari Listesi",
                  subtitle: "${viewModel.cariListesi?.length ?? ""}",
                )),
        ),
        leading: IconButton(
          onPressed: () {
            if (viewModel.searchBar) {
              viewModel.changeSearchBar();
              viewModel.changeArama("");
              viewModel.changeFilterText(null);
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
                //   viewModel.resetPage();
                // }
              },
              child: const Text("Filtrele"),
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              onPressed: () async => await siralaDialog(context),
              child: const Text("Sırala"),
            ),
            AppBarButton(
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: "Seçenekler",
                  children: [
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
                viewModel.changeFilterText(null);
                await viewModel.resetPage();
              }
            },
            icon: Observer(builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined)),
          ),
        ],
      );

  Future<void> siralaDialog(BuildContext context) async {
    final result = await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Sıralama Türünü Seçiniz",
      children: List.generate(viewModel.siralaMap.length, (index) => BottomSheetModel(title: viewModel.siralaMap.keys.toList()[index], value: viewModel.siralaMap.values.toList()[index])),
    );
    if (result != viewModel.cariRequestModel.siralama) {
      viewModel.changeSiralama(result);
      viewModel.resetPage();
    }
  }

  Widget fab() => Observer(
        builder: (_) => Visibility(
          visible: viewModel.cariListesi != null,
          child: CustomFloatingActionButton(
            isScrolledDown: !viewModel.isScrolledDown,
            onPressed: () async {
              final String? siradakiKod = await CariNetworkManager.getSiradakiKod();
              Get.toNamed("/mainPage/cariEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.ekle, model: CariListesiModel(), siradakiKod: siradakiKod));
            },
          ),
        ),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: () async => await viewModel.resetPage(),
        child: Observer(
          builder: (_) => (viewModel.cariListesi.ext.isNullOrEmpty
              ? (viewModel.cariListesi?.isEmpty ?? false)
                  ? Center(child: Observer(builder: (_) => Text(viewModel.errorText != null ? (viewModel.errorText ?? "") : "Cari Bulunamadı")))
                  : const Center(child: CircularProgressIndicator.adaptive())
              : ListView.builder(
                  primary: false,
                  controller: _scrollController,
                  shrinkWrap: true,
                  itemCount: (viewModel.cariListesi?.length ?? 0) + 1,
                  itemBuilder: (context, index) {
                    if (index < (viewModel.cariListesi?.length ?? 0)) {
                      final CariListesiModel object = viewModel.cariListesi?[index];
                      return Card(
                        child: Listener(
                          onPointerDown: (event) {
                            if (event.kind == PointerDeviceKind.mouse && event.buttons == 2) {
                              dialogManager.showCariGridViewDialog(object);
                            }
                          },
                          child: ListTile(
                            onLongPress: () {
                              dialogManager.showCariGridViewDialog(object);
                            },
                            onTap: () {
                              if (widget.isGetData ?? false) {
                                Get.back(result: object);
                              } else {
                                cariBottomSheet(context, object);
                              }
                            },
                            isThreeLine: true,
                            // contentPadding: UIHelper.midPadding,
                            leading: CircleAvatar(backgroundColor: UIHelper.getColorWithValue(object.bakiye ?? 0.0), child: Text(object.cariAdi?.substring(0, 1) ?? "")),
                            title: Text(object.cariAdi ?? ""),
                            subtitle: Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                Text("${object.cariKodu}", style: TextStyle(color: theme.textTheme.bodySmall?.color?.withOpacity(0.5))),
                                if (object.cariIl != null)
                                  Text("${object.cariIl}/${object.cariIlce}", style: TextStyle(color: theme.textTheme.bodySmall?.color?.withOpacity(0.5)))
                                else
                                  const SizedBox(),
                                Row(
                                  children: [
                                    const ColorfulBadge(label: Text("E-Fatura"), badgeColorEnum: BadgeColorEnum.fatura).yetkiVarMi(object.efaturaMi == true),
                                    ColorfulBadge(label: Text("Dövizli ${object.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(object.dovizli == true),
                                    const ColorfulBadge(label: Text("Konum"), badgeColorEnum: BadgeColorEnum.konum).yetkiVarMi(object.boylam != null),
                                    const ColorfulBadge(label: Text("Kilitli"), badgeColorEnum: BadgeColorEnum.kilitli).yetkiVarMi(object.kilit == "E"),
                                    // object.boylam != null && object.enlem != null ? const Badge(label: Text(("Konum"))) : const SizedBox(),
                                    // object.dovizAdi != null ? Badge(label: Text(("Dövizli ${object.dovizAdi}"))) : const SizedBox(),
                                  ]
                                      .map(
                                        (e) => e is! SizedBox? ? e.paddingOnly(top: UIHelper.lowSize, right: UIHelper.lowSize) : null,
                                      )
                                      .toList()
                                      .nullCheckWithGeneric,
                                ),
                              ],
                            ),
                            trailing: Wrap(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: object.bakiye == null ? "0,00 $mainCurrency\n" : "${object.bakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency\n",
                                        style: TextStyle(color: UIHelper.getColorWithValue(object.bakiye ?? 0.0)),
                                      ),
                                      if (object.bakiye != null)
                                        TextSpan(text: "${((object.bakiye ?? 0) > 0) ? "Tahsil Edilecek" : "Ödenecek"}\n", style: const TextStyle(fontStyle: FontStyle.italic))
                                      else
                                        null,
                                      if (object.dovizli == true && object.dovBakiye != null)
                                        TextSpan(
                                          text: "${object.dovBakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} ${object.dovizAdi ?? ""}",
                                          style: TextStyle(color: UIHelper.getColorWithValue(object.dovBakiye ?? 0.0)),
                                        )
                                      else
                                        null,
                                    ].nullCheckWithGeneric,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ],
                            ),
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
                )),
        ).paddingAll(UIHelper.lowSize),
      );

  Widget? bottomButtonBar() => Observer(
        builder: (_) => BottomBarWidget(
          isScrolledDown: !viewModel.isScrolledDown,
          children: [
            FooterButton(
              children: [
                const Text("Tahsil Edilecek"),
                Observer(
                  builder: (_) => Text(
                    "${(viewModel.paramData?["TAHSIL_EDILECEK"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                    style: const TextStyle(color: ColorPalette.mantis),
                  ),
                ),
              ],
              onPressed: () async {
                if (viewModel.cariRequestModel.filterBakiye == "T") {
                  viewModel.changeFilterBakiye("");
                } else {
                  viewModel.changeFilterBakiye("T");
                }
                viewModel.changeSiralama("BAKIYE_ZA");
                await viewModel.resetPage();
              },
            ),
            FooterButton(
              children: [
                const Text("Ödenecek"),
                Observer(
                  builder: (_) =>
                      Text("${(viewModel.paramData?["ODENECEK"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency", style: const TextStyle(color: ColorPalette.persianRed)),
                ),
              ],
              onPressed: () async {
                if (viewModel.cariRequestModel.filterBakiye == "Ö") {
                  viewModel.changeFilterBakiye("");
                } else {
                  viewModel.changeFilterBakiye("Ö");
                }
                viewModel.changeSiralama("BAKIYE_AZ");
                await viewModel.resetPage();
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

  void cariBottomSheet(BuildContext context, CariListesiModel object) async {
    var pageName = await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "${object.cariKodu}\n${object.cariAdi}",
      children: [
        BottomSheetModel(title: "Görüntüle", iconWidget: Icons.search_outlined, onTap: () => Get.back(result: CariSeceneklerModel(path: "/mainPage/cariEdit", baseEditEnum: BaseEditEnum.goruntule)))
            .yetkiKontrol(yetkiController.cariKarti),
        BottomSheetModel(title: "Düzelt", iconWidget: Icons.edit_outlined, onTap: () => Get.back(result: CariSeceneklerModel(path: "/mainPage/cariEdit", baseEditEnum: BaseEditEnum.duzenle)))
            .yetkiKontrol(yetkiController.cariKartiDuzenleme),
        BottomSheetModel(
          title: "Sil",
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
              if (result.success ?? false) {
                dialogManager.showSuccessSnackBar("${object.cariAdi} adlı cari silindi");
                await viewModel.resetPage();
              } else {
                dialogManager.showErrorSnackBar(result.message ?? "");
              }
            });
          },
        ).yetkiKontrol(yetkiController.cariKartiSilme),
        BottomSheetModel(title: "Hareketler", iconWidget: Icons.sync_alt_outlined, onTap: () => Get.back(result: "/mainPage/cariHareketleri")).yetkiKontrol(yetkiController.cariHareketleri),
        BottomSheetModel(
          title: "İşlemler",
          iconWidget: Icons.list_alt_outlined,
          onTap: () {
            Get.back();
            dialogManager.showCariGridViewDialog(object);
          },
        ),
        BottomSheetModel(
          title: "Raporlar",
          iconWidget: Icons.area_chart_outlined,
          onTap: () {
            Get.back();
            dialogManager.showGridViewDialog(CustomAnimatedGridView(cariListesiModel: object, islemTipi: IslemTipiEnum.cariRapor));
          },
        ),
      ].nullCheckWithGeneric,
    );
    if (pageName != null) {
      BaseEditEnum? baseEditEnum;
      if (pageName is CariSeceneklerModel) {
        baseEditEnum = pageName.baseEditEnum;
        pageName = pageName.path;
        final BaseEditModel editModel = BaseEditModel(baseEditEnum: baseEditEnum, model: object);
        final result = await Get.toNamed(pageName, arguments: editModel);
        if (result != null) {
          await viewModel.resetPage();
        }
      } else {
        Get.toNamed(pageName, arguments: object);
      }
    }
  }

  Future<dynamic> filtreleDialog(BuildContext context) async => await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: "Filtrele",
        body: Column(
          children: [
            CustomWidgetWithLabel(
              text: "Bakiye Durumu",
              child: Observer(
                builder: (_) => SlideControllerWidget(
                  childrenTitleList: viewModel.bakiyeMap.keys.toList(),
                  filterOnChanged: (index) => viewModel.changeFilterBakiye(viewModel.bakiyeMap.values.toList()[index ?? 0]),
                  childrenValueList: viewModel.bakiyeMap.values.toList(),
                  groupValue: viewModel.cariRequestModel.filterBakiye,
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
                      plasiyerController.text = "";
                      viewModel.changeArrPlasiyerKodu(null);
                    },
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showPlasiyerListesiBottomSheetDialog(context);
                      if (result != null) {
                        viewModel.changeArrPlasiyerKodu(result.map((e) => e?.plasiyerKodu).toList());
                        plasiyerController.text = result.map((e) => e?.plasiyerAciklama).join(", ");
                        viewModel.resetPage();
                      }
                    },
                  ),
                ).yetkiVarMi(parametreModel.plasiyerUygulamasi == true),
                Expanded(
                  child: CustomTextField(
                    labelText: "Şehir",
                    controller: sehirController,
                    readOnly: true,
                    suffixMore: true,
                    onClear: () {
                      sehirController.text = "";
                      viewModel.changeArrSehir(null);
                    },
                    onTap: () async {
                      if (viewModel.sehirler == null) {
                        await viewModel.getFilterData();
                      }
                      // ignore: use_build_context_synchronously
                      final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                        context,
                        title: "Şehirler",
                        children: List.generate(viewModel.sehirler?.length ?? 0, (index) => BottomSheetModel(title: viewModel.sehirler?[index].sehirAdi ?? "", value: viewModel.sehirler?[index])),
                      );
                      if (result is List) {
                        final List<CariSehirlerModel?> list = result.cast<CariSehirlerModel?>().toList();
                        viewModel.changeArrSehir(list.map((e) => e?.sehirAdi).toList());
                        sehirController.text = list.map((e) => e?.sehirAdi).join(", ");
                        viewModel.resetPage();
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
                    onChanged: (value) => viewModel.changeIlce(value),
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Tipi",
                    controller: tipiController,
                    suffixMore: true,
                    readOnly: true,
                    onClear: () {
                      tipiController.text = "";
                      viewModel.changeCariTipi(null);
                    },
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showCariTipiBottomSheetDialog(context);
                      if (result != null) {
                        tipiController.text = result;
                        viewModel.changeCariTipi(result != "Komisyoncu" ? result[0] : "I");
                      }
                    },
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () => viewModel.changeKodlariGoster(),
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
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                children: List.generate(
                                  viewModel.getGrupKod0?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.getGrupKod0?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod0?[index],
                                  ),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod0(list.map((e) => e?.grupKodu).toList());
                                kod0Controller.text = list.map((e) => e?.grupAdi).join(", ");
                                viewModel.resetPage();
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
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                children: List.generate(
                                  viewModel.getGrupKod1?.length ?? 0,
                                  (index) => BottomSheetModel(title: viewModel.getGrupKod1?[index].grupAdi ?? "", value: viewModel.getGrupKod1?[index]),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod1(list.map((e) => e?.grupKodu).toList());
                                kod1Controller.text = list.map((e) => e?.grupAdi).join(", ");
                                viewModel.resetPage();
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
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                children: List.generate(
                                  viewModel.getGrupKod2?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.getGrupKod2?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod2?[index],
                                  ),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod2(list.map((e) => e?.grupKodu).toList());
                                kod2Controller.text = list.map((e) => e?.grupAdi).join(", ");
                                viewModel.resetPage();
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
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                children: List.generate(
                                  viewModel.getGrupKod3?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.getGrupKod3?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod3?[index],
                                  ),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod3(list.map((e) => e?.grupKodu).toList());
                                kod3Controller.text = list.map((e) => e?.grupAdi).join(", ");
                                viewModel.resetPage();
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
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                children: List.generate(
                                  viewModel.getGrupKod4?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.getGrupKod4?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod4?[index],
                                  ),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod4(list.map((e) => e?.grupKodu).toList());
                                kod4Controller.text = list.map((e) => e?.grupAdi).join(", ");
                                viewModel.resetPage();
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
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                children: List.generate(
                                  viewModel.getGrupKod5?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.getGrupKod5?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod5?[index],
                                  ),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod5(list.map((e) => e?.grupKodu).toList());
                                kod5Controller.text = list.map((e) => e?.grupAdi).join(", ");
                                viewModel.resetPage();
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
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))),
                    onPressed: () {
                      Get.back();
                      viewModel.resetFilter();
                      plasiyerController.text = "";
                      sehirController.text = "";
                      ilceController.text = "";
                      tipiController.text = "";
                      kod1Controller.text = "";
                      kod2Controller.text = "";
                      kod3Controller.text = "";
                      kod4Controller.text = "";
                      kod5Controller.text = "";
                      viewModel.resetPage();
                    },
                    child: const Text("Filtreyi Temizle"),
                  ),
                ),
                SizedBox(width: UIHelper.midSize),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      Get.back();
                      await viewModel.resetPage();
                    },
                    child: const Text("Uygula"),
                  ),
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ],
        ).paddingAll(UIHelper.lowSize),
      );
}
