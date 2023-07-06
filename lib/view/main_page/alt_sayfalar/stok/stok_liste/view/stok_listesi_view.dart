import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

import '../../../../../../core/base/model/base_edit_model.dart';
import '../../../../../../core/base/model/base_grup_kodu_model.dart';
import '../../../../../../core/base/model/generic_response_model.dart';
import '../../../../../../core/base/state/base_state.dart';
import '../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart';
import '../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../../../../core/components/floating_action_button/custom_floating_action_button.dart';
import '../../../../../../core/components/helper_widgets/custom_label_widget.dart';
import '../../../../../../core/components/textfield/custom_app_bar_text_field.dart';
import '../../../../../../core/components/textfield/custom_text_field.dart';
import '../../../../../../core/constants/enum/base_edit_enum.dart';
import '../../../../../../core/constants/enum/grup_kodu_enums.dart';
import '../../../../../../core/constants/enum/islem_tipi_enum.dart';
import '../../../../../../core/constants/extensions/list_extensions.dart';
import '../../../../../../core/constants/extensions/model_extensions.dart';
import '../../../../../../core/constants/extensions/number_extensions.dart';
import '../../../../../../core/constants/extensions/widget_extensions.dart';
import '../../../../../../core/constants/ui_helper/ui_helper.dart';
import '../../../../../../core/init/network/login/api_urls.dart';
import '../../../cari/cari_network_manager.dart';
import '../model/stok_bottom_sheet_model.dart';
import '../model/stok_listesi_model.dart';
import '../view_model/stok_listesi_view_model.dart';

class StokListesiView extends StatefulWidget {
  final bool? isGetData;
  const StokListesiView({super.key, this.isGetData});

  @override
  State<StokListesiView> createState() => _StokListesiViewState();
}

class _StokListesiViewState extends BaseState<StokListesiView> {
  StokListesiViewModel viewModel = StokListesiViewModel();
  List<StokListesiModel>? get stokListesi => viewModel.stokListesi ?? [];
  final ScrollController _scrollController = ScrollController();
  TextEditingController grupKoduController = TextEditingController();
  TextEditingController kod1Controller = TextEditingController();
  TextEditingController kod2Controller = TextEditingController();
  TextEditingController kod3Controller = TextEditingController();
  TextEditingController kod4Controller = TextEditingController();
  TextEditingController kod5Controller = TextEditingController();
  @override
  void initState() {
    getData();
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
        if (viewModel.dahaVarMi) {
          Future.delayed(const Duration(milliseconds: 500), () {
            getData();
          });
        }
      }
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        viewModel.changeIsScrolledDown(true);
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        viewModel.changeIsScrolledDown(false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    bottomSheetDialogManager.clearSelectedData();
    viewModel.setBottomSheetModel(StokBottomSheetModel());
    _scrollController.dispose();
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
    kod5Controller.text = viewModel.kod5;
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
      // controller: _scrollController,
      leading: Observer(
          builder: (_) => IconButton(
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
              icon: const Icon(Icons.arrow_back_outlined))),
      title: Observer(
          builder: (_) => viewModel.searchBar
              ? CustomAppBarTextField(
                  controller: TextEditingController(text: viewModel.searchValue),
                  onFieldSubmitted: (value) {
                    viewModel.setSearchValue(value);
                    viewModel.setStokListesi(null);
                    viewModel.resetSayfa();
                    getData();
                  },
                )
              : Text("Stok Listesi ${viewModel.stokListesi?.length ?? ""}")),
      actions: [
        Observer(builder: (_) {
          if (!viewModel.searchBar) {
            return IconButton(
              onPressed: () {
                viewModel.setSearchBar();
                if (!viewModel.searchBar) {
                  viewModel.setSearchValue("");
                  viewModel.setStokListesi(null);
                  viewModel.resetSayfa();
                  getData();
                }
              },
              icon: const Icon(Icons.search_outlined),
            );
          } else {
            return const SizedBox();
          }
        }),
        IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(context, title: "Seçenekler", children: [
                BottomSheetModel(
                    title: "Resimleri Göster",
                    onTap: () {
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
                    })
              ]);
            },
            icon: const Icon(Icons.more_vert_outlined))
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
                                        await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                          context,
                                          title: "Grup Kodu",
                                          children: viewModel.grupKodlari
                                              .map((e) => BottomSheetModel(
                                                    title: e.grupAdi ?? "",
                                                    value: e.grupNo.toStringIfNull,
                                                    onTap: () {
                                                      if (viewModel.bottomSheetModel.grupKodu?.contains(e) ?? false) {
                                                        viewModel.bottomSheetModel.grupKodu?.remove(e);
                                                      } else {
                                                        viewModel.bottomSheetModel.grupKodu?.add(e);
                                                      }
                                                      debugPrint(viewModel.grupKodu);
                                                    },
                                                  ))
                                              .toList(),
                                        );
                                        grupKoduController.text = viewModel.grupKodu;
                                      },
                                      suffix: const Icon(Icons.more_horiz));
                                })),
                                Expanded(
                                    child: CustomTextField(
                                  labelText: "Kod 1",
                                  readOnly: true,
                                  suffix: const Icon(Icons.more_horiz),
                                  controller: kod1Controller,
                                  onTap: () async {
                                    List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 1).toList();
                                    await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                      context,
                                      title: "Kod 1",
                                      children: grupKodlari
                                          .map((e) => BottomSheetModel(
                                                title: e.grupAdi ?? "",
                                                onTap: () {
                                                  if (viewModel.bottomSheetModel.kod1?.contains(e) ?? false) {
                                                    viewModel.bottomSheetModel.kod1?.remove(e);
                                                  } else {
                                                    viewModel.bottomSheetModel.kod1?.add(e);
                                                  }
                                                },
                                              ))
                                          .toList(),
                                    );
                                    kod1Controller.text = viewModel.kod1;
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
                                  suffix: const Icon(Icons.more_horiz),
                                  controller: kod2Controller,
                                  onTap: () async {
                                    List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 2).toList();
                                    await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                      context,
                                      title: "Kod 2",
                                      children: grupKodlari
                                          .map((e) => BottomSheetModel(
                                                title: e.grupAdi ?? "",
                                                onTap: () {
                                                  if (viewModel.bottomSheetModel.kod2?.contains(e) ?? false) {
                                                    viewModel.bottomSheetModel.kod2?.remove(e);
                                                  } else {
                                                    viewModel.bottomSheetModel.kod2?.add(e);
                                                  }
                                                },
                                              ))
                                          .toList(),
                                    );
                                    kod2Controller.text = viewModel.kod2;
                                  },
                                )),
                                Expanded(
                                    child: CustomTextField(
                                  labelText: "Kod 3",
                                  readOnly: true,
                                  suffix: const Icon(Icons.more_horiz),
                                  controller: kod3Controller,
                                  onTap: () async {
                                    List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 3).toList();
                                    await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                      context,
                                      title: "Kod 3",
                                      children: grupKodlari
                                          .map((e) => BottomSheetModel(
                                                title: e.grupAdi ?? "",
                                                onTap: () {
                                                  if (viewModel.bottomSheetModel.kod3?.contains(e) ?? false) {
                                                    viewModel.bottomSheetModel.kod3?.remove(e);
                                                  } else {
                                                    viewModel.bottomSheetModel.kod3?.add(e);
                                                  }
                                                },
                                              ))
                                          .toList(),
                                    );
                                    kod3Controller.text = viewModel.kod3;
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
                                  suffix: const Icon(Icons.more_horiz),
                                  controller: kod4Controller,
                                  onTap: () async {
                                    List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 4).toList();
                                    await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                      context,
                                      title: "Kod 4",
                                      children: grupKodlari
                                          .map((e) => BottomSheetModel(
                                                title: e.grupAdi ?? "",
                                                onTap: () {
                                                  if (viewModel.bottomSheetModel.kod4?.contains(e) ?? false) {
                                                    viewModel.bottomSheetModel.kod4?.remove(e);
                                                  } else {
                                                    viewModel.bottomSheetModel.kod4?.add(e);
                                                  }
                                                },
                                              ))
                                          .toList(),
                                    );
                                    kod4Controller.text = viewModel.kod4;
                                  },
                                )),
                                Expanded(
                                    child: CustomTextField(
                                  labelText: "Kod 5",
                                  readOnly: true,
                                  suffix: const Icon(Icons.more_horiz),
                                  controller: kod5Controller,
                                  onTap: () async {
                                    List<BaseGrupKoduModel> grupKodlari = viewModel.grupKodlari.where((element) => element.grupNo == 5).toList();
                                    await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                      context,
                                      title: "Kod 5",
                                      children: grupKodlari
                                          .map((e) => BottomSheetModel(
                                                title: e.grupAdi ?? "",
                                                onTap: () {
                                                  if (viewModel.bottomSheetModel.kod5?.contains(e) ?? false) {
                                                    viewModel.bottomSheetModel.kod5?.remove(e);
                                                  } else {
                                                    viewModel.bottomSheetModel.kod5?.add(e);
                                                  }
                                                },
                                              ))
                                          .toList(),
                                    );
                                    kod5Controller.text = viewModel.kod5;
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
                                          viewModel.setBottomSheetModel(StokBottomSheetModel());
                                          viewModel.resetSayfa();
                                          viewModel.setStokListesi(null);
                                          viewModel.resetSelected();
                                          bottomSheetDialogManager.clearSelectedData();
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

  Observer? fab() {
    return Observer(builder: (_) {
      return CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrolledDown,
          onPressed: () {
            BaseEditModel result = BaseEditModel<StokListesiModel>(baseEditEnum: BaseEditEnum.ekle, model: StokListesiModel());
            Get.toNamed("/mainPage/stokEdit", arguments: result);
          }).yetkiVarMi(yetkiController.stokKartiYeniKayit);
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
              controller: _scrollController,
              padding: UIHelper.lowPadding,
              itemCount: (stokListesi?.length ?? 0) + 1,
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
                        trailing: Text("${stok.bakiye ?? 0} ${stok.olcuBirimi ?? ""}", style: context.textTheme.bodySmall?.copyWith(color: UIHelper.getColorWithValue(stok.bakiye ?? 0))),
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
                                (stok.seriCikislardaAcik ?? false) ? const Badge(label: Text("Seri")) : const SizedBox(),
                                (stok.satDovTip != null || stok.alisDovTip != null) ? const Badge(label: Text("Dövizli")) : const SizedBox()
                              ],
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
                                      iconWidget: Icons.list_alt,
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
                                List<BottomSheetModel>? newResult = children2.nullCheck.cast<BottomSheetModel>();
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
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 150),
                    height: (viewModel.dahaVarMi) ? 50 : 0,
                    child: const Center(child: CircularProgressIndicator.adaptive()),
                  );
                }
              },
            );
    });
  }

  Future<void> getData() async {
    viewModel.setDahaVarMi(false);
    var data2 = {"MenuKodu": "STOK_STOK", "ResimGoster": viewModel.resimleriGoster, "Siralama": viewModel.siralama, "Sayfa": viewModel.sayfa + 1, "BakiyeDurumu": viewModel.bakiye ?? ""};
    if (!viewModel.bottomSheetModel.grupKodu.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.grupKodu?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrGrupKodu"] = liste;
    }
    if (viewModel.searchValue.isNotEmpty) {
      data2["SearchText"] = viewModel.searchValue;
    }
    if (!viewModel.bottomSheetModel.kod1.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.kod1?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrKod1"] = liste;
    }
    if (!viewModel.bottomSheetModel.kod2.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.kod2?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrKod2"] = liste;
    }
    if (!viewModel.bottomSheetModel.kod3.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.kod3?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrKod3"] = liste;
    }
    if (!viewModel.bottomSheetModel.kod4.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.kod4?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrKod4"] = liste;
    }
    if (!viewModel.bottomSheetModel.kod5.isEmptyOrNull) {
      List<String> liste = [];
      viewModel.bottomSheetModel.kod5?.forEach((element) {
        liste.add(element.grupKodu ?? "");
      });
      data2["ArrKod5"] = liste;
    }
    GenericResponseModel response = await networkManager.dioPost<StokListesiModel>(
      path: ApiUrls.getStoklar,
      data: data2,
      bodyModel: StokListesiModel(),
      addCKey: true,
      addTokenKey: true,
      addSirketBilgileri: true,
    );
    if (response.success ?? false) {
      Map<String, MemoryImage> imageMap = {};
      List<StokListesiModel>? liste = response.data.map((e) => e as StokListesiModel).toList().cast<StokListesiModel>();
      if ((liste?.length ?? 0) < 25) {
        if (viewModel.bottomSheetModel != StokBottomSheetModel()) {
          viewModel.setDahaVarMi(false);
          viewModel.increaseSayfa();
        } else if ((liste?.length ?? 0) == 0) {
          viewModel.setDahaVarMi(false);
        }
      } else {
        viewModel.increaseSayfa();
        viewModel.setDahaVarMi(true);
      }
      if (viewModel.sayfa == 1) {
        for (var stokKaydi in liste ?? <StokListesiModel>[]) {
          if (stokKaydi.resimUrlKucuk != null && viewModel.resimleriGoster == "E") {
            imageMap[stokKaydi.stokKodu ?? ""] = await getImage(stokKaydi.resimUrlKucuk ?? "");
          }
        }
        viewModel.addImageMap(imageMap);
        viewModel.setStokListesi(liste);
      } else {
        for (var stokKaydi in liste ?? <StokListesiModel>[]) {
          if (stokKaydi.resimUrlKucuk != null && viewModel.resimleriGoster == "E") {
            imageMap[stokKaydi.stokKodu ?? ""] = await getImage(stokKaydi.resimUrlKucuk ?? "");
          }
        }
        viewModel.addStokListesi(liste ?? <StokListesiModel>[]);
        viewModel.addImageMap(imageMap);
      }
    } else {
      viewModel.setStokListesi(<StokListesiModel>[]);
    }
    setState(() {});

    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      viewModel.changeIsScrolledDown(true);
    }
  }

  Future<MemoryImage> getImage(String path) async {
    return await networkManager.getImage(path);
  }

  void deleteStok(String stokKodu) {
    dialogManager.showAreYouSureDialog(() async {
      Get.back();
      GenericResponseModel response = await networkManager.dioPost<StokListesiModel>(
        bodyModel: StokListesiModel(),
        path: ApiUrls.deleteStok,
        queryParameters: {"Kod": stokKodu},
        addCKey: true,
        addTokenKey: true,
        addSirketBilgileri: true,
      );
      if (response.success ?? false) {
        dialogManager.showSnackBar("Başarıyla Silindi");
        viewModel.resetSayfa();
        getData();
      }
    });
  }
}
