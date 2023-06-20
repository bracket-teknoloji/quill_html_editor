import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../core/base/model/base_edit_model.dart';
import '../../../../../../core/base/state/base_state.dart';
import '../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart';
import '../../../../../../core/components/button/elevated_buttons/footer_button.dart';
import '../../../../../../core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart';
import '../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_response_model.dart';
import '../../../../../../core/components/dialog/bottom_sheet/view_model/bottom_sheet_state_manager.dart';
import '../../../../../../core/components/floating_action_button/custom_floating_action_button.dart';
import '../../../../../../core/components/grid_tile/custom_animated_grid/view/custom_animated_grid_view.dart';
import '../../../../../../core/components/textfield/custom_app_bar_text_field.dart';
import '../../../../../../core/components/widget/scrollable_widget.dart';
import '../../../../../../core/constants/enum/base_edit_enum.dart';
import '../../../../../../core/constants/extensions/list_extensions.dart';
import '../../../../../../core/constants/extensions/model_extensions.dart';
import '../../../../../../core/constants/extensions/number_extensions.dart';
import '../../../../../../core/constants/ui_helper/ui_helper.dart';
import '../../../../../../core/init/network/login/api_urls.dart';
import '../../../../../add_company/model/account_model.dart';
import '../../cari_network_manager.dart';
import '../model/cari_listesi_model.dart';
import '../model/cari_secenekler_model.dart';
import '../view_model/cari_listesi_view_model.dart';

class CariListesiView extends StatefulWidget {
  final bool? isGetData;
  const CariListesiView({super.key, this.isGetData});

  @override
  State<CariListesiView> createState() => _CariListesiViewState();
}

class _CariListesiViewState extends BaseState<CariListesiView> {
  CariListesiViewModel viewModel = CariListesiViewModel();
  final ScrollController _scrollController = ScrollController();
  BottomSheetResponseModel? bottomSheetResponseModel;
  var formatter = NumberFormat("#,##0.00", "tr_TR");
  bool isLoading = false;
  Map? filterData;
  Map<String, dynamic> paramData = {};
  String sort = "AZ";
  @override
  void initState() {
    super.initState();
    init();
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
          if (a?.length == 25) {
            viewModel.increaseSayfa();
          }
          viewModel.addCariListesi(a!);
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
    return Observer(builder: (_) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBody: true,
        appBar: appBar(context),
        floatingActionButton: fab(),
        body: body(),
        bottomNavigationBar: bottomButtonBar(),
      );
    });
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
          : Observer(builder: (_) {
              return IconButton(
                  onPressed: () {
                    BottomSheetDialogManager.viewModel.deleteIsSelectedListMap();
                    BottomSheetDialogManager.viewModel.deleteKodControllerText();
                    BottomSheetDialogManager.viewModel.ilce = "";
                    BottomSheetDialogManager.viewModel.sehir = "";
                    BottomSheetDialogManager.viewModel.plasiyer = "";
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back));
            }),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: SizedBox(
          height: context.isPortrait ? height * 0.06 : height * 0.1,
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
                    List? data = await getData(sayfa: 1);
                    if (data.isNotNullOrEmpty) {
                      viewModel.changeCariListesi(data);
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
                    });
                  }
                },
                child: const Text("Sırala"),
              ),
              AppBarButton(
                onPressed: () {},
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
      builder: (_) => CustomFloatingActionButton(
        isScrolledDown: !viewModel.isScrolledDown,
        onPressed: () async {
          String siradakiKod = await CariNetworkManager.getSiradakiKod();
          Get.toNamed("/mainPage/cariEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.ekle, model: CariListesiModel(), siradakiKod: siradakiKod));
        },
      ),
    );
  }

  RefreshIndicator body() {
    return RefreshIndicator.adaptive(
        onRefresh: () {
          viewModel.changeCariListesi(null);
          return getData(sayfa: 1).then((value) {
            viewModel.changeCariListesi(value);
          });
        },
        child: Observer(
          builder: (_) => (viewModel.cariListesi.isNullOrEmpty
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
                        child: ListTile(
                          onLongPress: () {
                            dialogManager.showGridViewDialog(CustomAnimatedGridView(cariListesiModel: object));
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
                                            dialogManager.showAreYouSureDialog(() async {
                                              dialogManager.showLoadingDialog("Cari Siliniyor...");
                                              var result = await networkManager.dioPost<CariListesiModel>(
                                                path: ApiUrls.deleteCari,
                                                bodyModel: CariListesiModel(),
                                                addCKey: true,
                                                addSirketBilgileri: true,
                                                addTokenKey: true,
                                                queryParameters: {"CariKodu": object.cariKodu ?? ""},
                                              );
                                              if (result.success ?? false) {
                                                Get.back();
                                                dialogManager.hideAlertDialog;
                                                dialogManager.showSnackBar("${object.cariAdi} adlı cari silindi");
                                                getData(sayfa: 1).then((value) {
                                                  viewModel.changeCariListesi(value);
                                                });
                                              }
                                            });
                                          },
                                        ).yetkiKontrol(yetkiController.cariKartiSilme),
                                        BottomSheetModel(title: "Hareketler", iconWidget: Icons.sync_alt_outlined, onTap: () => Get.back(result: "/mainPage/cariHareketleri"))
                                            .yetkiKontrol(yetkiController.cariHareketleri),
                                        // BottomSheetModel(title: "İşlemler", iconWidget: Icons.list_alt_outlined),
                                        BottomSheetModel(
                                            title: "Raporlar",
                                            iconWidget: Icons.list_alt_outlined,
                                            onTap: () {
                                              Get.back();
                                              dialogManager.showGridViewDialog(CustomAnimatedGridView(cariListesiModel: object));
                                            }),
                                        // BottomSheetModel(title: "Serbest Raporlar", iconWidget: Icons.list_alt_outlined),
                                      ].nullCheck.cast<BottomSheetModel>());
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
                            ],
                          ),
                          trailing: Wrap(children: [
                            Text(
                                (object.bakiye == null
                                        ? '0.00 TL'
                                        : '${formatter.format(object.bakiye)} TL'
                                            "\n")
                                    .toString(),
                                style: TextStyle(color: UIHelper.getColorWithValue(object.bakiye ?? 0.0)))
                          ]),
                        ),
                      );
                    } else {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 150),
                        height: viewModel.dahaVarMi || (viewModel.cariListesi?.isEmpty ?? false) ? 50 : 0,
                        child: const Center(child: CircularProgressIndicator.adaptive()),
                      );
                    }
                  },
                )),
        ));
  }

  Widget? bottomButtonBar() {
    return SafeArea(
      child: Observer(
          builder: (_) => ScrollableWidget(
                isScrolledDown: !viewModel.isScrolledDown,
                child: SizedBox(
                  height: context.isPortrait ? (height * 0.06) : (height * 0.1 < 60 ? 60 : height * 0.1),
                  child: paramData.keys.isNotEmpty
                      ? Row(
                          children: [
                            Expanded(
                                child: FooterButton(onPressed: () {}, children: [
                              const Text("Tahsil Edilecek"),
                              Text(
                                "${double.tryParse(paramData["TAHSIL_EDILECEK"].replaceAll(",", "."))?.toInt().commaSeparated} TL",
                                style: const TextStyle(color: Colors.green),
                              ),
                            ])),
                            const VerticalDivider(thickness: 1, width: 1),
                            Expanded(
                                child: FooterButton(children: [
                              const Text("Ödenecek"),
                              Text("${(double.tryParse(paramData["ODENECEK"].replaceAll(",", "."))!.toInt() * -1).commaSeparated} TL", style: const TextStyle(color: Colors.red)),
                            ]))
                          ],
                        )
                      : null,
                ),
              )),
    );
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
    });
  }

  // ElevatedButton footerButton(Color color, List<Widget> child) {
  //   return ElevatedButton(
  //     style: ButtonStyle(
  //       padding: MaterialStateProperty.all(EdgeInsets.zero),
  //       backgroundColor: MaterialStateProperty.all(color),
  //       foregroundColor: MaterialStateProperty.all(Colors.white),
  //       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
  //         RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
  //       ),
  //     ),
  //     onPressed: () {},
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //       children: child,
  //     ),
  //   );
  // }

  // Future<GenericResponseModel<NetworkManagerMixin>> getFilterData() async {
  //   GenericResponseModel<NetworkManagerMixin> responseSehirler;
  //   responseSehirler = await networkManager.dioGet<CariSehirlerModel>(path: ApiUrls.getCariKayitliSehirler, bodyModel: CariSehirlerModel(), addTokenKey: true, headers: {
  //     "VERITABANI": AccountModel.instance.aktifVeritabani.toString(),
  //     "ISLETME_KODU": AccountModel.instance.aktifIsletmeKodu.toString(),
  //     "SUBE_KODU": AccountModel.instance.aktifSubeKodu.toString(),
  //     "Modul": "CARI",
  //     "GrupNo": "-1",
  //     "Kullanimda": "E"
  //   });

  //   return responseSehirler;
  // }

  // Future<GenericResponseModel<NetworkManagerMixin>> getKod() async {
  //   var responseKod = await networkManager.dioGet<CariGrupKoduModel>(
  //       path: ApiUrls.getGrupKodlari,
  //       bodyModel: CariGrupKoduModel(),
  //       addCKey: true,
  //       headers: {"Modul": "CARI", "GrupNo": "1"},
  //       addQuery: true,
  //       addSirketBilgileri: true,
  //       queryParameters: {"Modul": "CARI", "GrupNo": "-1"});
  //   return responseKod;
  // }

  Future<List?> getData({required int sayfa, String? sort1}) async {
    viewModel.changeDahaVarMi(false);
    var queryParameters2 = {
      "EFaturaGoster": "true",
      "SIRALAMA": sort1 ?? sort,
      "Sayfa": "$sayfa",
      "MenuKodu": "CARI_CARI",
      "FilterText": viewModel.arama,
      "Kod": "",
    };
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
      if (bottomSheetResponseModel!.filterBakiye!.isNotNullOrNoEmpty) {
        String a = bottomSheetResponseModel!.filterBakiye ?? "";
        String b = a == "Tümü" ? "" : a[0];
        queryParameters2["FILTER_BAKIYE"] = b;
      }
    }
    final response = await networkManager.dioGet<CariListesiModel>(
        path: ApiUrls.getCariler,
        queryParameters: queryParameters2,
        addCKey: true,
        headers: {
          "Host": "95.70.216.35:7575",
          "VERITABANI": AccountModel.instance.aktifVeritabani.toString(),
          "ISLETME_KODU": AccountModel.instance.aktifIsletmeKodu.toString(),
          "SUBE_KODU": AccountModel.instance.aktifSubeKodu.toString(),
          "Platform": "android",
          "X-App-Version": "226",
          "UserHostAddress": AccountModel.instance.localIp.toString()
        },
        bodyModel: CariListesiModel());

    if (mounted) {
      if (response.data != null) {
        if (response.data.length < 25) {
          viewModel.changeDahaVarMi(false);
        } else {
          viewModel.changeDahaVarMi(true);
        }
      }
    }
    if (response.paramData != null) {
      paramData = response.paramData!;
      log("yeni param data : $paramData");
    } else {
      log("$paramData");
    }
    log("Sayfa : $sayfa");
    setState(() {});

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
