import "dart:convert";
import "dart:developer";
import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_response_model.dart";
import "../../../../../../core/components/dialog/bottom_sheet/view_model/bottom_sheet_state_manager.dart";
import "../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../core/components/grid_tile/custom_animated_grid/view/custom_animated_grid_view.dart";
import "../../../../../../core/components/helper_widgets/scrollable_widget.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/islem_tipi_enum.dart";
import "../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../core/constants/extensions/model_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../cari_network_manager.dart";
import "../model/cari_listesi_model.dart";
import "../model/cari_secenekler_model.dart";
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
  BottomSheetResponseModel? bottomSheetResponseModel;
  bool isLoading = false;
  Map? filterData;
  Map<String, dynamic> paramData = {};
  String sort = "AZ";
  @override
  void initState() {
    _scrollController = ScrollController();
    init();
    super.initState();
  }

  void init() {
    BottomSheetResponseModel.instance.clear();
    BottomSheetStateManager().deleteIsSelectedListMap();
    viewModel.sayfa == 1
        ? getData(sayfa: viewModel.sayfa).then((value) {
            if (!viewModel.searchBar) {
              viewModel.changeArama("");
            }
            viewModel.changeCariListesi(value);
            if ((value?.length ?? 0) < parametreModel.sabitSayfalamaOgeSayisi) {
              viewModel.changeDahaVarMi(false);
            } else {
              viewModel.changeDahaVarMi(true);
            }
            // cariListesi = value;
          })
        : null;
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // await getData(sayfa: viewModel.sayfa + 1).then((value) {
        //   if (value.length == 25) {
        //     viewModel.increaseSayfa();
        //   }
        //   cariListesi!.addAll(value);
        // });
        if (viewModel.dahaVarMi) {
          List? a = await getData(sayfa: viewModel.sayfa + 1);
          if (a?.length == parametreModel.sabitSayfalamaOgeSayisi) {
            viewModel.increaseSayfa();
          }
          viewModel.addCariListesi(a!);
          if (a.length < parametreModel.sabitSayfalamaOgeSayisi) {
            viewModel.changeDahaVarMi(false);
          } else {
            viewModel.changeDahaVarMi(true);
          }
        } // cariListesi!.addAll(a);
      }
      // when scroll down change isScrolledDown to true
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        viewModel.changeIsScrolledDown(false);
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        viewModel.changeIsScrolledDown(true);
      }
      // if scrollcontroller is at the end of the page change isScrolldown to true
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        viewModel.changeIsScrolledDown(false);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    BottomSheetResponseModel.instance.clear();
  }

  @override
  Widget build(BuildContext context) {
    log(paramData.toString());
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: appBar(context),
      floatingActionButton: fab(),
      body: body(),
      bottomNavigationBar: bottomButtonBar(),
    );
  }

  AppBar appBar(BuildContext context) {
    // Platform.isLinux || Platform.isWindows || Platform.isMacOS ? _scrollController.appBar.setPinState(true) : _scrollController.appBar.setPinState(false);
    return AppBar(
      // controller: _scrollController,
      title: Observer(
        builder: (_) {
          return (viewModel.searchBar
              ? CustomAppBarTextField(onFieldSubmitted: onFieldSubmitted)
              : Wrap(direction: Axis.vertical, children: [
                  const Text("Cari Listesi"),
                  Text("${viewModel.cariListesi?.length ?? ""}", style: theme.textTheme.labelSmall),
                ]));
        },
      ),
      leading: viewModel.searchBar
          ? IconButton(
              onPressed: () {
                viewModel.changeSearchBar();
                viewModel.changeArama("");
                onFieldSubmitted(viewModel.arama);
              },
              icon: const Icon(Icons.arrow_back))
          : IconButton(
              onPressed: () {
                BottomSheetDialogManager.viewModel.deleteIsSelectedListMap();
                BottomSheetDialogManager.viewModel.deleteKodControllerText();
                BottomSheetDialogManager.viewModel.ilce = "";
                BottomSheetDialogManager.viewModel.sehir = "";
                BottomSheetDialogManager.viewModel.plasiyer = "";
                Get.back();
              },
              icon: const Icon(Icons.arrow_back)),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(height * 0.07),
        child: SizedBox(
          height: height * 0.07,
          child: ListView(
            shrinkWrap: true,
            itemExtent: width * 0.33,
            scrollDirection: Axis.horizontal,
            children: [
              AppBarButton(
                icon: Icons.filter_alt_outlined,
                onPressed: () async {
                  if (filterData == null) {
                    dialogManager.showLoadingDialog("Filtreler yükleniyor");
                    var responseSehir = await CariNetworkManager.getFilterData();
                    var responseKod = await CariNetworkManager.getKod();
                    filterData = {"sehir": responseSehir.data, "kod": responseKod.data};
                    dialogManager.hideAlertDialog;
                  }
                  // ignore: use_build_context_synchronously
                  var a = await bottomSheetDialogManager.showFilterBottomSheetDialog(context, request: filterData);
                  if (a != null && a is BottomSheetResponseModel) {
                    bottomSheetResponseModel = a;

                    viewModel.changeCariListesi(null);
                    List? data = await getData(sayfa: 1);
                    if (data.ext.isNotNullOrEmpty) {
                      viewModel.changeCariListesi(data);
                      if ((data?.length ?? 0) < parametreModel.sabitSayfalamaOgeSayisi) {
                        viewModel.changeDahaVarMi(false);
                      } else {
                        viewModel.changeDahaVarMi(true);
                      }
                    } else {
                      viewModel.changeCariListesi([]);
                    }
                  }
                },
                child: const Text("Filtrele"),
              ),
              AppBarButton(
                icon: Icons.sort_by_alpha_outlined,
                onPressed: () async {
                  var a = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Sıralama türünü seçiniz", children: [
                    BottomSheetModel(title: "Cari Adı (A-Z)", onTap: () => Get.back(result: "AZ")),
                    BottomSheetModel(title: "Cari Adı (Z-A)", onTap: () => Get.back(result: "ZA")),
                    BottomSheetModel(title: "Bakiye (0-9)", onTap: () => Get.back(result: "BAKIYE_AZ")),
                    BottomSheetModel(title: "Bakiye (9-0)", onTap: () => Get.back(result: "BAKIYE_ZA")),
                    BottomSheetModel(title: "Döviz Bakiye (0-9)", onTap: () => Get.back(result: "DOV_BAKIYE_AZ")),
                    BottomSheetModel(title: "Döviz Bakiye (9-0)", onTap: () => Get.back(result: "DOV_BAKIYE_ZA")),
                    BottomSheetModel(title: "Cari Kodu (A-Z)", onTap: () => Get.back(result: "CARI_KODU_AZ")),
                    BottomSheetModel(title: "Cari Kodu (Z-A))", onTap: () => Get.back(result: "CARI_KODU_ZA")),
                    BottomSheetModel(title: "Kayıt Tarihi (Artan)", onTap: () => Get.back(result: "KAYITTAR_ASC")),
                    BottomSheetModel(title: "Kayıt Tarihi (Azalan)", onTap: () => Get.back(result: "KAYITTAR_DESC")),
                    BottomSheetModel(title: "Konum(En yakın)", onTap: () => Get.back(result: "KONUM_AZ")),
                    BottomSheetModel(title: "Konum (En uzak)", onTap: () => Get.back(result: "KONUM_ZA")),
                  ]);
                  if (a.toString() != sort && a != null) {
                    sort = a;
                    viewModel.changeCariListesi(null);
                    getData(sayfa: 1).then((value) {
                      viewModel.changeCariListesi(value);
                      if ((value?.length ?? 0) < parametreModel.sabitSayfalamaOgeSayisi) {
                        viewModel.changeDahaVarMi(false);
                      } else {
                        viewModel.changeDahaVarMi(true);
                      }
                    });
                  }
                },
                child: const Text("Sırala"),
              ),
              AppBarButton(
                onPressed: () async {
                  await bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "Seçenekler", children: [BottomSheetModel(title: "Raporlar", iconWidget: Icons.area_chart_outlined, onTap: () => dialogManager.showCariRaporlarGridViewDialog())]);
                },
                child: const Icon(Icons.more_horiz_outlined),
              ),
            ].map((e) => e.paddingAll(5)).toList(),
          ),
        ).paddingZero,
      ),
      actions: [
        IconButton(
          onPressed: () {
            viewModel.changeSearchBar();
            viewModel.changeArama("");
            if (!viewModel.searchBar) {
              onFieldSubmitted(viewModel.arama);
            }
          },
          icon: Observer(builder: (_) {
            return Icon((viewModel.searchBar ? Icons.search_off : Icons.search));
          }),
        ),
      ],
    );
  }

  Widget fab() {
    return Observer(
      builder: (_) => Visibility(
        visible: viewModel.cariListesi != null,
        child: CustomFloatingActionButton(
          isScrolledDown: !viewModel.isScrolledDown,
          onPressed: () async {
            String? siradakiKod = await CariNetworkManager.getSiradakiKod();
            Get.toNamed("/mainPage/cariEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.ekle, model: CariListesiModel(), siradakiKod: siradakiKod));
          },
        ),
      ),
    );
  }

  RefreshIndicator body() {
    return RefreshIndicator.adaptive(
        onRefresh: () {
          viewModel.changeCariListesi(null);
          return getData(sayfa: 1).then((value) {
            viewModel.changeCariListesi(value);
            if ((value?.length ?? 0) < parametreModel.sabitSayfalamaOgeSayisi) {
              viewModel.changeDahaVarMi(false);
            } else {
              viewModel.changeDahaVarMi(true);
            }
          });
        },
        child: Observer(
          builder: (_) => (viewModel.cariListesi.ext.isNullOrEmpty
              ? (viewModel.cariListesi?.isEmpty ?? false)
                  ? const Center(child: Text("Cari Bulunamadı"))
                  : const Center(child: CircularProgressIndicator.adaptive())
              : ListView.builder(
                  primary: false,
                  controller: _scrollController,
                  itemCount: (viewModel.cariListesi?.length ?? 0) + 1,
                  itemBuilder: (context, index) {
                    if (index < (viewModel.cariListesi?.length ?? 0)) {
                      CariListesiModel object = viewModel.cariListesi?[index];
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
                            onTap: !(widget.isGetData ?? true)
                                ? () async {
                                    var pageName = await bottomSheetDialogManager.showBottomSheetDialog(context,
                                        title: "${object.cariKodu}\n${object.cariAdi}",
                                        children: [
                                          BottomSheetModel(
                                                  title: "Görüntüle",
                                                  iconWidget: Icons.search_outlined,
                                                  onTap: () => Get.back(result: CariSeceneklerModel(path: "/mainPage/cariEdit", baseEditEnum: BaseEditEnum.goruntule)))
                                              .yetkiKontrol(yetkiController.cariKarti),
                                          BottomSheetModel(
                                                  title: "Düzelt",
                                                  iconWidget: Icons.edit_outlined,
                                                  onTap: () => Get.back(result: CariSeceneklerModel(path: "/mainPage/cariEdit", baseEditEnum: BaseEditEnum.duzenle)))
                                              .yetkiKontrol(yetkiController.cariKartiDuzenleme),
                                          BottomSheetModel(
                                            title: "Sil",
                                            iconWidget: Icons.delete_outline,
                                            onTap: () async {
                                              Get.back();
                                              dialogManager.showAreYouSureDialog(() async {
                                                dialogManager.showLoadingDialog("Cari Siliniyor...");
                                                var result = await networkManager.dioPost<CariListesiModel>(
                                                  path: ApiUrls.deleteCari,
                                                  bodyModel: CariListesiModel(),
                                                  queryParameters: {"CariKodu": object.cariKodu ?? ""},
                                                );
                                                dialogManager.hideAlertDialog;
                                                if (result.success ?? false) {
                                                  dialogManager.showSuccessSnackBar("${object.cariAdi} adlı cari silindi");
                                                  getData(sayfa: 1).then((value) {
                                                    viewModel.changeCariListesi(value);
                                                    if ((value?.length ?? 0) < parametreModel.sabitSayfalamaOgeSayisi) {
                                                      viewModel.changeDahaVarMi(false);
                                                    } else {
                                                      viewModel.changeDahaVarMi(true);
                                                    }
                                                  });
                                                } else {
                                                  dialogManager.showErrorSnackBar(result.message ?? "");
                                                }
                                              });
                                            },
                                          ).yetkiKontrol(yetkiController.cariKartiSilme),
                                          BottomSheetModel(title: "Hareketler", iconWidget: Icons.sync_alt_outlined, onTap: () => Get.back(result: "/mainPage/cariHareketleri"))
                                              .yetkiKontrol(yetkiController.cariHareketleri),
                                          BottomSheetModel(
                                              title: "İşlemler",
                                              iconWidget: Icons.list_alt_outlined,
                                              onTap: () {
                                                Get.back();
                                                dialogManager.showCariGridViewDialog(object);
                                              }),
                                          BottomSheetModel(
                                              title: "Raporlar",
                                              iconWidget: Icons.area_chart_outlined,
                                              onTap: () {
                                                Get.back();
                                                dialogManager.showGridViewDialog(CustomAnimatedGridView(cariListesiModel: object, islemTipi: IslemTipiEnum.cariRapor));
                                              }),
                                        ].nullCheckWithGeneric);
                                    if (pageName != null) {
                                      BaseEditEnum? baseEditEnum;
                                      if (pageName is CariSeceneklerModel) {
                                        baseEditEnum = pageName.baseEditEnum;
                                        pageName = pageName.path;
                                        BaseEditModel editModel = BaseEditModel(baseEditEnum: baseEditEnum, model: object);
                                        Get.toNamed(pageName, arguments: editModel);
                                      } else {
                                        Get.toNamed(pageName, arguments: object);
                                      }
                                    }
                                  }
                                : () => Get.back(result: object),
                            isThreeLine: true,
                            contentPadding: UIHelper.midPadding,
                            leading: CircleAvatar(backgroundColor: UIHelper.getColorWithValue(object.bakiye ?? 0.0), child: Text(object.cariAdi?.substring(0, 1) ?? "")),
                            title: Text(object.cariAdi ?? ""),
                            subtitle: Wrap(
                              direction: Axis.vertical,
                              alignment: WrapAlignment.spaceBetween,
                              children: [
                                Text("${object.cariKodu}", style: TextStyle(color: theme.textTheme.bodySmall?.color?.withOpacity(0.5))),
                                object.cariIl != null ? Text("${object.cariIl}/${object.cariIlce}", style: TextStyle(color: theme.textTheme.bodySmall?.color?.withOpacity(0.5))) : const SizedBox(),
                                Row(
                                  children: [
                                    const ColorfulBadge(label: Text("E-Fatura"), badgeColorEnum: BadgeColorEnum.fatura).yetkiVarMi(object.efaturaMi == true),
                                    ColorfulBadge(label: Text("Dövizli ${object.dovizAdi ?? ""}"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(object.dovizli == true),
                                    const ColorfulBadge(label: Text("Konum"), badgeColorEnum: BadgeColorEnum.konum).yetkiVarMi(object.boylam != null),
                                    const ColorfulBadge(label: Text("Kilitli"), badgeColorEnum: BadgeColorEnum.kilitli).yetkiVarMi(object.kilit == "E")
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
                            trailing: Wrap(children: [
                              Text.rich(
                                  TextSpan(
                                      children: [
                                    TextSpan(
                                        text: object.bakiye == null ? "0,00 $mainCurrency\n" : "${object.bakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency\n",
                                        style: TextStyle(color: UIHelper.getColorWithValue(object.bakiye ?? 0.0))),
                                    object.bakiye != null
                                        ? TextSpan(text: "${((object.bakiye ?? 0) > 0) ? "Tahsil Edilecek" : "Ödenecek"}\n", style: const TextStyle(fontStyle: FontStyle.italic))
                                        : null,
                                    (object.dovizli == true && object.dovBakiye != null)
                                        ? TextSpan(
                                            text: "${object.dovBakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? ""} ${object.dovizAdi ?? ""}",
                                            style: TextStyle(color: UIHelper.getColorWithValue(object.dovBakiye ?? 0.0)))
                                        : null,
                                  ].nullCheckWithGeneric),
                                  textAlign: TextAlign.right),
                            ]),
                          ),
                        ),
                      );
                    } else {
                      return Observer(builder: (_) {
                        return Visibility(
                          visible: viewModel.dahaVarMi,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            height: viewModel.dahaVarMi || (viewModel.cariListesi?.isEmpty ?? false) ? 50 : 0,
                            child: const Center(child: CircularProgressIndicator.adaptive()),
                          ),
                        );
                      });
                    }
                  },
                )),
        ).paddingAll(UIHelper.lowSize));
  }

  Widget? bottomButtonBar() {
    return Observer(
        builder: (_) => Visibility(
              visible: viewModel.cariListesi != null,
              child: ScrollableWidget(
                isScrolledDown: !viewModel.isScrolledDown,
                child: SizedBox(
                  height: context.isPortrait ? (height * 0.07) : (height * 0.1 < 60 ? 60 : height * 0.1),
                  child: paramData.keys.isNotEmpty
                      ? Row(
                          children: [
                            Expanded(
                                child: FooterButton(
                                    children: [
                                  const Text("Tahsil Edilecek"),
                                  Text(
                                    "${double.tryParse(paramData["TAHSIL_EDILECEK"].replaceAll(",", "."))?.toInt().commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                                    style: const TextStyle(color: Colors.green),
                                  ),
                                ],
                                    onPressed: () async {
                                      viewModel.changeArama("");
                                      viewModel.resetSayfa();
                                      viewModel.changeCariListesi(null);
                                      var result = await getData(sayfa: 1, filterBakiye: "T");
                                      if (result is List) {
                                        viewModel.changeCariListesi(result);
                                        if ((result.length) < parametreModel.sabitSayfalamaOgeSayisi) {
                                          viewModel.changeDahaVarMi(false);
                                        } else {
                                          viewModel.changeDahaVarMi(true);
                                        }
                                      }
                                    })),
                            const VerticalDivider(thickness: 1, width: 1),
                            Expanded(
                                child: FooterButton(
                                    children: [
                                  const Text("Ödenecek"),
                                  Text("${(double.tryParse(paramData["ODENECEK"].replaceAll(",", "."))!.toInt() * -1).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency",
                                      style: const TextStyle(color: Colors.red)),
                                ],
                                    onPressed: () async {
                                      viewModel.changeArama("");
                                      viewModel.resetSayfa();
                                      viewModel.changeCariListesi(null);
                                      var result = await getData(sayfa: 1, filterBakiye: "Ö");
                                      if (result is List) {
                                        viewModel.changeCariListesi(result);
                                        if ((result.length) < parametreModel.sabitSayfalamaOgeSayisi) {
                                          viewModel.changeDahaVarMi(false);
                                        } else {
                                          viewModel.changeDahaVarMi(true);
                                        }
                                      }
                                    }))
                          ],
                        )
                      : null,
                ),
              ),
            ));
  }

  AppBarButton siralaButton(BuildContext context) {
    return AppBarButton(
      onPressed: () async {
        var a = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Sıralama türünü seçiniz", children: [
          BottomSheetModel(title: "Cari Adı (A-Z)", onTap: () => Get.back(result: "AZ")),
          BottomSheetModel(title: "Cari Adı (Z-A)", onTap: () => Get.back(result: "ZA")),
          BottomSheetModel(title: "Bakiye (0-9)", onTap: () => Get.back(result: "BAKIYE_AZ")),
          BottomSheetModel(title: "Bakiye (9-0)", onTap: () => Get.back(result: "BAKIYE_ZA")),
          BottomSheetModel(title: "Döviz Bakiye (0-9)", onTap: () => Get.back(result: "DOV_BAKIYE_AZ")),
          BottomSheetModel(title: "Döviz Bakiye (9-0)", onTap: () => Get.back(result: "DOV_BAKIYE_ZA")),
          BottomSheetModel(title: "Cari Kodu (A-Z)", onTap: () => Get.back(result: "CARI_KODU_AZ")),
          BottomSheetModel(title: "Cari Kodu (Z-A))", onTap: () => Get.back(result: "CARI_KODU_ZA")),
          BottomSheetModel(title: "Kayıt Tarihi (Artan)", onTap: () => Get.back(result: "KAYITTAR_ASC")),
          BottomSheetModel(title: "Kayıt Tarihi (Azalan)", onTap: () => Get.back(result: "KAYITTAR_DESC")),
          BottomSheetModel(title: "Konum(En yakın)", onTap: () => Get.back(result: "KONUM_AZ")),
          BottomSheetModel(title: "Konum (En uzak)", onTap: () => Get.back(result: "KONUM_ZA")),
        ]);
        if (a.toString() != sort && a != null) {
          sort = a;
          viewModel.changeCariListesi(null);
          getData(sayfa: 1).then((value) {
            viewModel.changeCariListesi(value);
            if ((value?.length ?? 0) < parametreModel.sabitSayfalamaOgeSayisi) {
              viewModel.changeDahaVarMi(false);
            } else {
              viewModel.changeDahaVarMi(true);
            }
          });
        }
      },
      child: const Text("Sırala"),
    );
  }

  void onFieldSubmitted(String value) {
    viewModel.changeArama(value);
    viewModel.resetSayfa();
    viewModel.changeCariListesi(null);
    getData(sayfa: viewModel.sayfa).then((value) {
      viewModel.changeCariListesi(value);
      if ((value?.length ?? 0) < parametreModel.sabitSayfalamaOgeSayisi) {
        viewModel.changeDahaVarMi(false);
      } else {
        viewModel.changeDahaVarMi(true);
      }
    });
  }

  Future<List?> getData({required int sayfa, String? sort1, String? filterBakiye}) async {
    // viewModel.changeDahaVarMi(false);
    var queryParameters2 = {
      "EFaturaGoster": "true",
      "SIRALAMA": sort1 ?? sort,
      "Sayfa": "$sayfa",
      "MenuKodu": "CARI_CARI",
      "FilterText": viewModel.arama,
      "Kod": "",
    };
    if (filterBakiye != null) {
      queryParameters2["FILTER_BAKIYE"] = filterBakiye;
    }
    if (bottomSheetResponseModel != null) {
      nullChecker("arrPlasiyer", queryParameters2);
      nullChecker("arrSehir", queryParameters2);
      nullChecker("arrGrupKodu", queryParameters2);
      nullChecker("arrKod1", queryParameters2);
      nullChecker("arrKod2", queryParameters2);
      nullChecker("arrKod3", queryParameters2);
      nullChecker("arrKod4", queryParameters2);
      nullChecker("arrKod5", queryParameters2);
      nullChecker("ilce", queryParameters2);
      nullChecker("cariTipi", queryParameters2);

      if (bottomSheetResponseModel!.filterBakiye!.ext.isNotNullOrNoEmpty) {
        String a = bottomSheetResponseModel!.filterBakiye ?? "";
        String b = a == "Tümü" ? "" : a[0];
        queryParameters2["FILTER_BAKIYE"] = b;
      }
    }
    final response = await networkManager.dioGet<CariListesiModel>(path: ApiUrls.getCariler, queryParameters: queryParameters2, bodyModel: CariListesiModel());

    // if (mounted) {
    //   if (response.data != null) {
    //     if (response.data.length < parametreModel.sabitSayfalamaOgeSayisi) {
    //       viewModel.changeDahaVarMi(false);
    //     } else {
    //       viewModel.changeDahaVarMi(true);
    //     }
    //   }
    // }
    if (response.paramData != null) {
      paramData = response.paramData ?? {};
      log("yeni param data : $paramData");
    } else {
      log("$paramData");
    }
    log("Sayfa : $sayfa");

    return response.data;
  }

  void nullChecker(String parametre, Map<String, String> map, {String? isim}) {
    dynamic selected = bottomSheetResponseModel!.toJson()[parametre];
    String parametreIsim = isim ?? parametre[0].toUpperCase() + parametre.substring(1);
    if (selected != null) {
      if (selected.isEmpty) return;
      if (selected is List) {
        map[parametreIsim] = jsonEncode(selected);
      } else {
        map[parametreIsim] = selected;
      }
    }
  }

  String getPaymentInfo(double bakiye) {
    if (bakiye > 0) {
      return "Tahsil Edilecek";
    } else if (bakiye < 0) {
      return "Ödenecek";
    } else {
      return "";
    }
  }

  // Color getLeadingColor(double bakiye) {
  //   if (bakiye > 0) {
  //     return Colors.green;
  //   } else if (bakiye < 0) {
  //     return Colors.red;
  //   } else {
  //     return Colors.grey;
  //   }
  // }
}
