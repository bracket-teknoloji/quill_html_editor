import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "../../../../../../core/components/badge/colorful_badge.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
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
  final String? searchText;
  const StokListesiView({super.key, this.isGetData, this.searchText});

  @override
  State<StokListesiView> createState() => _StokListesiViewState();
}

class _StokListesiViewState extends BaseState<StokListesiView> {
  StokListesiViewModel viewModel = StokListesiViewModel();
  List<StokListesiModel>? get stokListesi => viewModel.stokListesi ?? [];
  ScrollController scrollController = ScrollController();
  TextEditingController grupKoduController = TextEditingController();
  TextEditingController kod1Controller = TextEditingController();
  TextEditingController kod2Controller = TextEditingController();
  TextEditingController kod3Controller = TextEditingController();
  TextEditingController kod4Controller = TextEditingController();
  TextEditingController kod5Controller = TextEditingController();
  @override
  void initState() {
    if (widget.searchText != null) {
      viewModel.setSearchBar();
      viewModel.setSearchValue(widget.searchText!);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
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
          child: body()),
    );
  }

  AppBar appBar() {
    return AppBar(
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
          icon: const Icon(Icons.arrow_back_outlined)),
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
              : Text("Stok Listesi ${viewModel.stokListesi?.length ?? ""}")),
      actions: [
        hideSearchBar(),
        Observer(builder: (_) {
          return viewModel.searchBar
              ? const SizedBox()
              : IconButton(
                  onPressed: () async {
                    await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Seçenekler", body: Observer(builder: (_) {
                      return SwitchListTile.adaptive(
                        title: const Text("Resimleri Göster"),
                        value: viewModel.resimleriGoster == "E",
                        onChanged: (value) {
                          viewModel.setResimleriGoster();
                          if (viewModel.resimleriGoster == "E") {
                            viewModel.setStokListesi(null);
                            viewModel.resetSayfa();
                            getData();
                            Get.back();
                          } else {
                            viewModel.setStokListesi(null);
                            viewModel.setImageMap({});
                            viewModel.resetSayfa();
                            getData();
                            Get.back();
                          }
                        },
                      );
                    }));
                  },
                  icon: const Icon(Icons.more_vert_outlined));
        })
      ],
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
                icon: Icons.qr_code_2_outlined,
                child: const Text("Barkod"),
                onPressed: () async {
                  var result = await Get.toNamed("/qr");
                  if (result != null) {
                    viewModel.setSearchBar();
                    viewModel.setStokListesi(null);
                    viewModel.resetSayfa();
                    viewModel.setSearchValue(result);
                    getData();
                  }
                },
              ),
              AppBarButton(
                  icon: Icons.filter_alt_outlined,
                  child: const Text("Filtrele"),
                  onPressed: () async {
                    if (viewModel.grupKodlari.isEmptyOrNull) {
                      dialogManager.showLoadingDialog("Kodlar alınıyor...");
                      var grupKodlari = await CariNetworkManager.getKod(name: GrupKoduEnum.STOK);
                      // StaticVariables.grupKodlari = grupKodlari.data.map((e) => e as BaseGrupKoduModel).toList().cast<BaseGrupKoduModel>();
                      if (grupKodlari.data != null) {
                        viewModel.setGrupKodlari(grupKodlari.data.map((e) => e as BaseGrupKoduModel).toList().cast<BaseGrupKoduModel>());
                      }
                      dialogManager.hideAlertDialog;
                    }
                    // ignore: use_build_context_synchronously
                    await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: "Filtre",
                      body: Column(children: [
                        CustomWidgetWithLabel(
                          text: "Bakiye",
                          child: Wrap(
                            children: [
                              Center(
                                child: Observer(builder: (_) {
                                  return ToggleButtons(
                                    constraints: BoxConstraints(minWidth: ((context.isPortrait ? width : 600) * 0.9) / 5, minHeight: height * 0.05),
                                    isSelected: viewModel.selected.toList(),
                                    children: viewModel.selectedList.map((e) => Text(e)).toList(),
                                    onPressed: (index) {
                                      viewModel.setSelectedWithIndex(index);
                                    },
                                  );
                                }),
                              ),
                              Row(
                                children: [
                                  Expanded(child: Observer(builder: (_) {
                                    return CustomTextField(
                                      labelText: "Grup Kodu",
                                      readOnly: true,
                                      controller: grupKoduController,
                                      onTap: () async {
                                        var result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                          context,
                                          title: "Grup Kodu",
                                          children: viewModel.grupKodlari
                                              .map((e) => BottomSheetModel(
                                                    title: e.grupAdi ?? "",
                                                    value: e,
                                                  ))
                                              .toList(),
                                        );
                                        if (result != null && result is List) {
                                          viewModel.changeArrGrupKodu(result.whereType<BaseGrupKoduModel>().toList());
                                          grupKoduController.text = viewModel.grupKodu?.map((e) => e.grupAdi).join(", ") ?? "";
                                        }
                                      },
                                      suffixMore: true,
                                    );
                                  })),
                                  Expanded(
                                      child: CustomTextField(
                                    labelText: "Kod 1",
                                    readOnly: true,
                                    suffixMore: true,
                                    controller: kod1Controller,
                                    onTap: () async {
                                      List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 1).toList();
                                      var result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                        context,
                                        title: "Kod 1",
                                        children: grupKodlari.map((e) => BottomSheetModel(title: e.grupAdi ?? "", value: e)).toList(),
                                      );
                                      if (result != null && result is List) {
                                        viewModel.changeArrKod1(result.whereType<BaseGrupKoduModel>().toList());
                                        kod1Controller.text = viewModel.kod1?.map((e) => e.grupAdi).join(", ") ?? "";
                                      }
                                    },
                                  ))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: CustomTextField(
                                    labelText: "Kod 2",
                                    readOnly: true,
                                    suffixMore: true,
                                    controller: kod2Controller,
                                    onTap: () async {
                                      List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 2).toList();
                                      var result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                        context,
                                        title: "Kod 2",
                                        children: grupKodlari.map((e) => BottomSheetModel(title: e.grupAdi ?? "", value: e)).toList(),
                                      );
                                      if (result != null && result is List) {
                                        viewModel.changeArrKod2(result.whereType<BaseGrupKoduModel>().toList());
                                        kod2Controller.text = viewModel.kod2?.map((e) => e.grupAdi).join(", ") ?? "";
                                      }
                                    },
                                  )),
                                  Expanded(
                                      child: CustomTextField(
                                    labelText: "Kod 3",
                                    readOnly: true,
                                    suffixMore: true,
                                    controller: kod3Controller,
                                    onTap: () async {
                                      List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 3).toList();
                                      var result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                        context,
                                        title: "Kod 3",
                                        children: grupKodlari.map((e) => BottomSheetModel(title: e.grupAdi ?? "", value: e)).toList(),
                                      );
                                      if (result != null && result is List) {
                                        viewModel.changeArrKod3(result.whereType<BaseGrupKoduModel>().toList());
                                        kod3Controller.text = viewModel.kod3?.map((e) => e.grupAdi).join(", ") ?? "";
                                      }
                                    },
                                  ))
                                ],
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: CustomTextField(
                                    labelText: "Kod 4",
                                    readOnly: true,
                                    suffixMore: true,
                                    controller: kod4Controller,
                                    onTap: () async {
                                      List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 4).toList();
                                      var result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                        context,
                                        title: "Kod 4",
                                        children: grupKodlari
                                            .map((e) => BottomSheetModel(
                                                  title: e.grupAdi ?? "",
                                                  onTap: () {
                                                    if (viewModel.bottomSheetModel.arrKod4?.contains(e) ?? false) {
                                                      viewModel.bottomSheetModel.arrKod4?.remove(e);
                                                    } else {
                                                      viewModel.bottomSheetModel.arrKod4?.add(e);
                                                    }
                                                  },
                                                ))
                                            .toList(),
                                      );
                                      if (result != null && result is List) {
                                        viewModel.changeArrKod4(result.whereType<BaseGrupKoduModel>().toList());
                                        kod4Controller.text = viewModel.kod4?.map((e) => e.grupAdi).join(", ") ?? "";
                                      }
                                    },
                                  )),
                                  Expanded(
                                      child: CustomTextField(
                                    labelText: "Kod 5",
                                    readOnly: true,
                                    suffixMore: true,
                                    controller: kod5Controller,
                                    onTap: () async {
                                      List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 5).toList();
                                      var result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                        context,
                                        title: "Kod 5",
                                        children: grupKodlari
                                            .map((e) => BottomSheetModel(
                                                  title: e.grupAdi ?? "",
                                                  onTap: () {
                                                    if (viewModel.bottomSheetModel.arrKod5?.contains(e) ?? false) {
                                                      viewModel.bottomSheetModel.arrKod5?.remove(e);
                                                    } else {
                                                      viewModel.bottomSheetModel.arrKod5?.add(e);
                                                    }
                                                  },
                                                ))
                                            .toList(),
                                      );
                                      if (result != null && result is List) {
                                        viewModel.changeArrKod5(result.whereType<BaseGrupKoduModel>().toList());
                                        kod5Controller.text = viewModel.kod5?.map((e) => e.grupAdi).join(", ") ?? "";
                                      }
                                    },
                                  ))
                                ],
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
                                            viewModel.resetSayfa();
                                            viewModel.setStokListesi(null);
                                            viewModel.resetSelected();
                                            viewModel.resetSelectedArr();
                                            getData();
                                            Get.back();
                                          },
                                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))),
                                          child: const Text("Temizle"))),
                                  SizedBox(width: width * 0.02),
                                  Expanded(
                                      child: ElevatedButton(
                                          onPressed: () {
                                            viewModel.resetSayfa();
                                            viewModel.setStokListesi(null);
                                            getData();
                                            Get.back();
                                          },
                                          child: const Text("Uygula")))
                                ],
                              ).paddingAll(UIHelper.lowSize),
                            ],
                          ),
                        )
                      ]).paddingAll(UIHelper.lowSize),
                    );
                  }),
              AppBarButton(
                  icon: Icons.sort_by_alpha_outlined,
                  child: const Text("Sırala"),
                  // child: const Icon(Icons.sort_by_alpha_outlined),
                  onPressed: () async {
                    String? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Sırala", children: [
                      BottomSheetModel(title: "Stok Adı (A-Z)", value: "AZ", onTap: () => Get.back(result: "AZ")),
                      BottomSheetModel(title: "Stok Adı (Z-A)", value: "ZA", onTap: () => Get.back(result: "ZA")),
                      BottomSheetModel(title: "Stok Kodu (A-Z)", value: "KOD_AZ", onTap: () => Get.back(result: "KOD_AZ")),
                      BottomSheetModel(title: "Stok Kodu (Z-A)", value: "KOD_ZA", onTap: () => Get.back(result: "KOD_ZA")),
                      BottomSheetModel(title: "Bakiye (Artan)", value: "BAKIYE_AZ", onTap: () => Get.back(result: "BAKIYE_AZ")),
                      BottomSheetModel(title: "Bakiye (Azalan)", value: "BAKIYE_ZA", onTap: () => Get.back(result: "BAKIYE_ZA")),
                    ]);
                    if (result != null) {
                      viewModel.setStokListesi(null);
                      viewModel.setSiralama(result);
                      viewModel.resetSayfa();
                      getData();
                    }
                  }),
              //! AppBarButton(icon: Icons.format_align_left_sharp, onPressed: () {}),
              //! AppBarButton(icon: Icons.refresh_outlined, onPressed: () {})
            ].map((e) => e.paddingAll(5)).toList(),
          ),
        ).paddingZero,
      ),
    );
  }

  Widget hideSearchBar() {
    return Observer(builder: (_) {
      return IconButton(
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
      );
    });
  }

  Observer? fab() {
    return Observer(builder: (_) {
      return Visibility(
        visible: viewModel.stokListesi?.isNotEmpty ?? false,
        child: CustomFloatingActionButton(
            isScrolledDown: viewModel.isScrolledDown,
            onPressed: () {
              BaseEditModel result = BaseEditModel<StokListesiModel>(baseEditEnum: BaseEditEnum.ekle, model: StokListesiModel());
              Get.toNamed("/mainPage/stokEdit", arguments: result);
            }).yetkiVarMi(yetkiController.stokKartiYeniKayit),
      );
    });
  }

  Observer body() {
    return Observer(builder: (_) {
      return viewModel.stokListesi.isEmptyOrNull
          ? (viewModel.stokListesi?.isEmpty ?? false)
              ? const Center(child: Text("Stok Bulunamadı"))
              : const Center(child: CircularProgressIndicator.adaptive())
          : ListView.builder(
              primary: false,
              controller: scrollController,
              padding: UIHelper.lowPadding,
              itemCount: (viewModel.stokListesi?.length ?? 0) + 1,
              itemBuilder: (context, index) {
                if (index < (viewModel.stokListesi?.length ?? 0)) {
                  StokListesiModel stok = stokListesi![index];

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
                        contentPadding: UIHelper.lowPadding,
                        // leading: stok.resimUrlKucuk !=null ? Image.memory(networkManager.getImage(stok.resimUrlKucuk))
                        leading: CircleAvatar(
                          foregroundImage: viewModel.imageMap[stok.stokKodu],
                          child: Text((stok.stokAdi ?? "  ").substring(0, 1)),
                        ),
                        trailing: Text("${(stok.bakiye ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${stok.olcuBirimi ?? ""}",
                            style: context.textTheme.bodySmall?.copyWith(color: UIHelper.getColorWithValue(stok.bakiye ?? 0))),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: stok.stokAdi,
                                children: [
                                  TextSpan(text: "\n${stok.stokKodu}", style: context.textTheme.bodySmall?.copyWith(color: Colors.grey)),
                                ],
                              ),
                            ),
                            Wrap(
                              spacing: UIHelper.lowSize,
                              children: [
                                const ColorfulBadge(label: Text("Seri"), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(stok.seriCikislardaAcik == true),
                                const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(stok.alisDovTip != null || stok.satDovTip != null),
                                const ColorfulBadge(label: Text("Es.Yap."), badgeColorEnum: BadgeColorEnum.esYap).yetkiVarMi(stok.yapilandirmaAktif == true)
                              ].whereType<ColorfulBadge>().toList(),
                            )
                          ],
                        ),
                        onTap: (widget.isGetData ?? false)
                            ? () => Get.back(result: stok)
                            : () async {
                                var children2 = [
                                  BottomSheetModel(
                                      title: "Görüntüle",
                                      iconWidget: Icons.visibility,
                                      onTap: () => Get.back(result: BaseEditModel<StokListesiModel>(baseEditEnum: BaseEditEnum.goruntule, model: stok))).yetkiKontrol(yetkiController.stokKarti),
                                  BottomSheetModel(
                                      title: "Düzelt",
                                      iconWidget: Icons.edit,
                                      onTap: () => Get.back(result: BaseEditModel<StokListesiModel>(baseEditEnum: BaseEditEnum.duzenle, model: stok))).yetkiKontrol(yetkiController.stokKartiDuzenleme),
                                  BottomSheetModel(
                                      title: "Hareketler",
                                      iconWidget: Icons.sync_alt_outlined,
                                      onTap: () {
                                        Get.back();
                                        return Get.toNamed("/mainPage/stokHareketleri", arguments: stok);
                                      }).yetkiKontrol(yetkiController.stokHareketleriStokHareketleri),
                                  BottomSheetModel(
                                      title: "Raporlar",
                                      iconWidget: Icons.area_chart_outlined,
                                      onTap: () async {
                                        dialogManager.showStokGridViewDialog(stok, IslemTipiEnum.stokRapor);
                                      }),
                                  //😳 BottomSheetModel(title: "Depo Bakiye Durumu", iconWidget: Icons.list_alt),
                                  // !!BottomSheetModel(
                                  // !!  title: "Yazdır",
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
                                      title: "İşlemler",
                                      iconWidget: Icons.list_alt,
                                      onTap: () {
                                        Get.back();
                                        dialogManager.showStokGridViewDialog(stok);
                                      }),
                                ];
                                children2.insert(
                                    2, BottomSheetModel(title: "Sil", iconWidget: Icons.delete, onTap: () => deleteStok(stok.stokKodu ?? "")).yetkiKontrol(yetkiController.stokKartiSilme));
                                List<BottomSheetModel>? newResult = children2.nullCheckWithGeneric;
                                BaseEditModel? result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: stok.stokKodu ?? "", children: newResult);
                                if (result != null) {
                                  await Get.toNamed("/mainPage/stokEdit", arguments: result);
                                  viewModel.setStokListesi(null);
                                  viewModel.resetSayfa();
                                  await getData();
                                }
                              },
                      ).paddingAll(10),
                    ),
                  );
                } else {
                  return Observer(builder: (_) {
                    return Visibility(
                      visible: viewModel.dahaVarMi,
                      child: const Center(child: CircularProgressIndicator.adaptive()),
                    );
                  });
                }
              },
            );
    });
  }

  Future<void> getData() async {
    var data2 = {"MenuKodu": "STOK_STOK", "ResimGoster": viewModel.resimleriGoster, "Siralama": viewModel.siralama, "Sayfa": viewModel.sayfa, "BakiyeDurumu": viewModel.bakiye ?? ""};
    if (!viewModel.bottomSheetModel.arrGrupKodu.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.arrGrupKodu?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrGrupKodu"] = liste;
    }
    if (viewModel.searchValue.isNotEmpty) {
      data2["SearchText"] = viewModel.searchValue;
    }
    if (!viewModel.bottomSheetModel.arrKod1.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.arrKod1?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrKod1"] = liste;
    }
    if (!viewModel.bottomSheetModel.arrKod2.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.arrKod2?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrKod2"] = liste;
    }
    if (!viewModel.bottomSheetModel.arrKod3.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.arrKod3?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrKod3"] = liste;
    }
    if (!viewModel.bottomSheetModel.arrKod4.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.arrKod4?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrKod4"] = liste;
    }
    if (!viewModel.bottomSheetModel.arrKod5.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.arrKod5?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrKod5"] = liste;
    }
    GenericResponseModel response = await networkManager.dioPost<StokListesiModel>(path: ApiUrls.getStoklar, data: data2, bodyModel: StokListesiModel());
    if (response.success ?? false) {
      Map<String, MemoryImage> imageMap = {};
      List<StokListesiModel>? liste = response.data.map((e) => e as StokListesiModel).toList().cast<StokListesiModel>();

      if (viewModel.sayfa == 1) {
        for (var stokKaydi in liste ?? <StokListesiModel>[]) {
          if (stokKaydi.resimUrlKucuk != null && viewModel.resimleriGoster == "E") {
            imageMap[stokKaydi.stokKodu ?? ""] = await getImage(stokKaydi.resimUrlKucuk ?? "");
          }
        }
        viewModel.setStokListesi(liste);
        viewModel.addImageMap(imageMap);
      } else {
        for (var stokKaydi in liste ?? <StokListesiModel>[]) {
          if (stokKaydi.resimUrlKucuk != null && viewModel.resimleriGoster == "E") {
            imageMap[stokKaydi.stokKodu ?? ""] = await getImage(stokKaydi.resimUrlKucuk ?? "");
          }
        }
        viewModel.addStokListesi(liste ?? <StokListesiModel>[]);
        viewModel.addImageMap(imageMap);
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

  Future<MemoryImage> getImage(String path) async {
    return await networkManager.getImage(path);
  }

  void deleteStok(String stokKodu) {
    dialogManager.showAreYouSureDialog(() async {
      Get.back();
      GenericResponseModel response = await networkManager.dioPost<StokListesiModel>(bodyModel: StokListesiModel(), path: ApiUrls.deleteStok, queryParameters: {"Kod": stokKodu});
      if (response.success ?? false) {
        dialogManager.showSuccessSnackBar("Başarıyla Silindi");
        viewModel.resetSayfa();
        getData();
      }
    });
  }
}
