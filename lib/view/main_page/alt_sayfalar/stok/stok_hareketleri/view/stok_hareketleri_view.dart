import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import '../../../../../../core/components/textfield/custom_label_widget.dart';
import '../../../../../../core/components/textfield/custom_text_field.dart';
import '../../../../../../core/constants/extensions/date_time_extensions.dart';
import '../../../../../../core/constants/extensions/widget_extensions.dart';
import '../../stok_liste/model/stok_listesi_model.dart';

import '../../../../../../core/base/helpers/helper.dart';
import '../../../../../../core/base/state/base_state.dart';
import '../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart';
import '../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart';
import '../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../../../../core/components/wrap/appbar_title.dart';
import '../model/stok_hareketleri_model.dart';
import '../view_model/stok_hareketleri_view_model.dart';

class StokHareketleriView extends StatefulWidget {
  final StokListesiModel? model;
  const StokHareketleriView({super.key, this.model});

  @override
  State<StokHareketleriView> createState() => _StokHareketleriViewState();
}

class _StokHareketleriViewState extends BaseState<StokHareketleriView> {
  StokHareketleriViewModel viewModel = StokHareketleriViewModel();
  @override
  void initState() {
    super.initState();
    viewModel.setFuture(getData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: fab().yetkiVarMi(yetkiController.stokHareketleriStokYeniKayit),
      body: NestedScrollView(headerSliverBuilder: (context, innerBoxIsScrolled) => [appBar()], body: body()),
    );
  }

  SliverAppBar appBar() {
    return SliverAppBar(
      floating: true,
      snap: true,
      pinned: true,
      title: Observer(
          builder: (_) => viewModel.searchBar
              ? SizedBox(
                  height: kToolbarHeight * 0.9,
                  child: TextField(
                    decoration: const InputDecoration(hintText: "Ara", border: InputBorder.none),
                    onChanged: (value) {
                      viewModel.setStokHareketleri(viewModel.stokHareketleri!.where((element) => element.stokAdi!.toLowerCase().contains(value.toLowerCase())).toList());
                    },
                  ))
              : AppBarTitle(title: "Stok Hareketleri", subtitle: widget.model?.stokAdi ?? "")),
      actions: [
        IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Seçenekler", children: [
                BottomSheetModel(
                    iconWidget: viewModel.dovizliFiyat ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
                    title: "Dövizli Fiyat Göster",
                    onTap: () {
                      viewModel.changeDovizliFiyat();
                      Get.back();
                    }),
                BottomSheetModel(iconWidget: Icons.visibility_off_outlined, title: "Gizlenecek Alanlar", onTap: () async {}),
              ]);
            },
            icon: const Icon(Icons.more_vert_outlined)),
        IconButton(onPressed: () => viewModel.changeSearchBar(), icon: const Icon(Icons.search_outlined))
      ],
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBarPreferedSizedBottom(children: [
            AppBarButton(
                child: const Text("Filtrele"),
                onPressed: () async {
                  //TODO! viewModel.arrHareketTuru bağla
                  await bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "Filtrele",
                      body: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CustomWidgetWithLabel(text: "Hareket Yönü", children: [
                              Center(
                                child: Observer(builder: (_) {
                                  return ToggleButtons(
                                      constraints: BoxConstraints(minWidth: (width * 0.9) / 3, minHeight: height * 0.05),
                                      isSelected: viewModel.isSelected,
                                      onPressed: (index) {
                                        viewModel.changeIsSelected(index);
                                      },
                                      children: viewModel.hareketYonuList.map((e) => Text(e)).toList());
                                }),
                              )
                            ]),
                            Observer(builder: (_) {
                              return CustomTextField(
                                  labelText: "Hareket Türü",
                                  readOnly: true,
                                  controllerText: viewModel.arrHareketTuru?.join(", "),
                                  suffix: IconButton(
                                      onPressed: () async {
                                        bottomSheetDialogManager.clearSelectedData();
                                        viewModel.clearArrHareketTuru();
                                        List? result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(context,
                                            title: "Hareket Türü", children: viewModel.hareketTuruMap.entries.map((e) => BottomSheetModel(title: e.key)).toList());
                                        if (result != null) {
                                          viewModel.changeArrHareketTuru(result.map((e) => e as String).toList().cast<String>());
                                          setState(() {});
                                        }
                                      },
                                      icon: const Icon(Icons.more_horiz_outlined)));
                            }),
                            Observer(builder: (_) {
                              return CustomTextField(
                                  labelText: "Cari",
                                  valueText: viewModel.cariListesiModel?.cariKodu ?? "",
                                  controllerText: viewModel.cariListesiModel?.cariAdi ?? "",
                                  readOnly: true,
                                  suffix: Wrap(children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(
                                          Icons.data_exploration_outlined,
                                          color: UIHelper.primaryColor,
                                        )),
                                    IconButton(
                                        onPressed: () async {
                                          var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                                          if (result != null) {
                                            viewModel.setCariListesiModel(result);
                                          }
                                        },
                                        icon: const Icon(Icons.more_horiz_outlined))
                                  ]));
                            }),
                            Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Get.back();
                                      viewModel.clearArrHareketTuru();
                                      viewModel.resetIsSelected();
                                      viewModel.setCariListesiModel(null);
                                      viewModel.setFuture(getData());
                                    },
                                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))),
                                    child: const Text("Temizle"),
                                  ),
                                ),
                                SizedBox(width: width * 0.02),
                                Expanded(
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Get.back();
                                        viewModel.setFuture(getData());
                                      },
                                      child: const Text("Uygula")),
                                )
                              ],
                            )
                          ],
                        ).paddingAll(UIHelper.lowSize),
                      ));
                }),
            AppBarButton(
                child: const Text("Sırala"),
                onPressed: () async {
                  String? result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Sırala", children: [
                    BottomSheetModel(title: "Tarih (Artan)", onTap: () => Get.back(result: "TARIH_AZ")),
                    BottomSheetModel(title: "Tarih (Azalan)", onTap: () => Get.back(result: "TARIH_ZA")),
                    BottomSheetModel(title: "Stok Kodu (A-Z)", onTap: () => Get.back(result: "KOD_AZ")),
                    BottomSheetModel(title: "Stok Kodu (Z-A)", onTap: () => Get.back(result: "KOZ_ZA")),
                  ]);
                  if (result != null) {
                    viewModel.setSiralama(result);
                    viewModel.setStokHareketleri(await getData()!);
                  }
                }),
            AppBarButton(
                child: const Text("Yenile"),
                onPressed: () {
                  getData();
                }),
          ])),
    );
  }

  FloatingActionButton fab() {
    return FloatingActionButton(
      onPressed: () async {
        await Get.toNamed("mainPage/stokYeniKayit", arguments: StokHareketleriModel()..stokKodu = widget.model!.stokKodu);
        viewModel.setStokHareketleri(await getData()!);
      },
      child: const Icon(Icons.add),
    );
  }

  FutureBuilder<dynamic> body() {
    return FutureBuilder(
        future: viewModel.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Observer(builder: (_) {
              return viewModel.stokHareketleri.isNullOrEmpty
                  ? const Center(child: Text("Stok Hareket Kaydı Bulunamadı."))
                  : RefreshIndicator.adaptive(
                      onRefresh: () async {
                        viewModel.setStokHareketleri(await getData()!);
                      },
                      child: ListView.builder(
                        padding: UIHelper.lowPadding,
                        itemCount: viewModel.stokHareketleri?.length ?? 0,
                        itemBuilder: (context, index) {
                          StokHareketleriModel model = viewModel.stokHareketleri![index];
                          List<Widget> children2 = [];
                          if (model.hareketTuruAciklama == "Devir") {
                            Widget? slidableAction = SlidableAction(
                              onPressed: (context) async {
                                dialogManager.showAreYouSureDialog(() async {
                                  var result = await networkManager.dioPost<StokHareketleriModel>(
                                      path: ApiUrls.deleteStokHareket,
                                      bodyModel: StokHareketleriModel(),
                                      addCKey: true,
                                      addSirketBilgileri: true,
                                      queryParameters: {"INCKEYNO": model.inckeyno.toString()});
                                  if (result.success == true) {
                                    dialogManager.showSnackBar("Stok Hareket Kaydı Silindi.");
                                    viewModel.setStokHareketleri(await getData()!);
                                  } else {
                                    dialogManager.showSnackBar("Lütfen daha sonra tekrar deneyiniz.\n ${result.exceptionName}");
                                  }
                                });
                              },
                              icon: Icons.delete_forever,
                              backgroundColor: theme.cardColor,
                              foregroundColor: theme.colorScheme.primary,
                              label: 'Sil',
                            ).yetkiVarMi(yetkiController.stokHareketleriStokSilme);
                            if (slidableAction != const SizedBox()) {
                              children2.add(slidableAction);
                            }
                          }
                          if (model.hareketTuruAciklama != "Muhtelif") {
                            children2.add(SlidableAction(
                              onPressed: (context) async {
                                await Get.toNamed("mainPage/stokYeniKayit", arguments: model);
                                viewModel.setStokHareketleri(await getData()!);
                              },
                              icon: Icons.directions_walk_outlined,
                              backgroundColor: theme.cardColor,
                              foregroundColor: theme.colorScheme.primary,
                              label: 'Hareket\nDetayı',
                            ));
                          }
                          return Slidable(
                            enabled: children2.isNotNullOrEmpty,
                            endActionPane: ActionPane(
                              motion: const ScrollMotion(),
                              children: children2,
                            ),
                            child: GestureDetector(
                              onTap: () async {
                                await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Seçenekler", children: [
                                  BottomSheetModel(title: "Belgeyi Göster"),
                                  BottomSheetModel(title: "Stok İşlemleri"),
                                ]);
                              },
                              child: Card(
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Wrap(
                                                  children: [
                                                    Text(model.stharTarih.toDateString()),
                                                    model.dovizTipi == 1 ? const Badge(label: Text("Dövizli")) : Container(),
                                                  ],
                                                ),
                                              ),
                                              Text(model.fisno ?? ""),
                                              Icon(model.cikisIslemi ?? false ? Icons.chevron_right_outlined : Icons.chevron_left_sharp, color: model.cikisIslemi ?? false ? Colors.red : Colors.green),
                                            ],
                                          ),
                                          Text.rich(
                                            TextSpan(
                                              children: [
                                                TextSpan(
                                                    text: "${model.belgeTipiAciklama ?? model.hareketTuruAciklama}  ",
                                                    style: TextStyle(color: (model.cikisIslemi ?? false) ? Colors.red : Colors.green)),
                                                TextSpan(text: "(${model.hareketTuruAciklama})", style: const TextStyle(color: Colors.white30)),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Expanded(child: Text("Miktar: ${model.stharGcmik?.toInt() ?? 0}")),
                                              Expanded(child: Text("Depo: ${model.depoKodu ?? ""} (${model.depoAdi ?? ""})")),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(child: Text("Plasiyer: ${model.plasiyerAciklama ?? ""}")),
                                              Expanded(child: Text("KDV %: ${model.stharKdv?.toInt() ?? 0}")),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(child: Text("Net Fiyat: ${(model.stharNf ?? 0).commaSeparatedWithFixedDigits}")),
                                              Expanded(child: Text("Brüt Fiyat: ${(model.stharBf ?? 0).commaSeparatedWithFixedDigits}")),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(child: Text("Net Tutar: ${((model.stharNf ?? 0) * (model.stharGcmik ?? 0)).commaSeparatedWithFixedDigits}")),
                                              Expanded(child: Text("Brüt Tutar: ${((model.stharBf ?? 0) * (model.stharGcmik ?? 0)).commaSeparatedWithFixedDigits}")),
                                            ],
                                          ),
                                        ],
                                      ).paddingAll(UIHelper.lowSize),
                                    ),
                                    Icon(model.hareketTuruAciklama != "Muhtelif" ? Icons.chevron_right_outlined : null, color: theme.colorScheme.primary),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
            });
          } else {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
        });
  }

  Future<List<StokHareketleriModel>>? getData() async {
    viewModel.setFuture(null);
    setState(() {});
    Map<String, dynamic> queryParameters = {
      "FilterModel":
          '{"EkranTipi": "L", "siralama": "${viewModel.siralama}", "stokKodu": "${widget.model?.stokKodu ?? ""}", "GC": "${viewModel.getIsSelected}", "CariKodu": "${viewModel.cariListesiModel?.cariKodu ?? ""}", "ArrHareketTuru": ${jsonEncode(viewModel.arrHareketTuru)}}'
    };
    // if (viewModel.arrHareketTuru.isNotNullOrEmpty) {
    //   queryParameters["FilterModel"] = "\"ArrHareketTuru\":${jsonEncode(viewModel.arrHareketTuru)}, ${queryParameters["FilterModel"]!}";
    // }
    var result = await networkManager.dioGet<StokHareketleriModel>(
        path: ApiUrls.getStokHareketleri, bodyModel: StokHareketleriModel(), addCKey: true, addSirketBilgileri: true, queryParameters: queryParameters);
    viewModel.setFuture(Future.value(result.data));
    List<StokHareketleriModel> list = result.data.map((e) => e as StokHareketleriModel).toList().cast<StokHareketleriModel>();
    viewModel.setStokHareketleri(list);
    setState(() {});

    return list;
  }
}
