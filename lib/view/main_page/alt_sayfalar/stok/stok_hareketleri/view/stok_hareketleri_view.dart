import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/color_palette.dart";
import "../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../core/constants/extensions/model_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../stok_liste/model/stok_listesi_model.dart";
import "../model/stok_hareketleri_model.dart";
import "../view_model/stok_hareketleri_view_model.dart";

class StokHareketleriView extends StatefulWidget {
  final StokListesiModel? model;
  final String? stokKodu;
  final CariListesiModel? cariModel;
  const StokHareketleriView({super.key, this.model, this.stokKodu, this.cariModel});

  @override
  State<StokHareketleriView> createState() => _StokHareketleriViewState();
}

class _StokHareketleriViewState extends BaseState<StokHareketleriView> {
  StokHareketleriViewModel viewModel = StokHareketleriViewModel();
  late final TextEditingController _hareketTuruController;
  late final TextEditingController _cariController;

  @override
  void initState() {
    _hareketTuruController = TextEditingController();
    _cariController = TextEditingController();
    super.initState();
    if (widget.cariModel != null) {
      viewModel.setCariListesiModel(widget.cariModel!);
    }
    viewModel.setFuture(getData());
  }

  @override
  void dispose() {
    _hareketTuruController.dispose();
    _cariController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: fab().yetkiVarMi(yetkiController.stokHareketleriStokYeniKayit),
        appBar: appBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) => viewModel.searchBar
              ? CustomAppBarTextField(
                  onFieldSubmitted: (value) async {
                    await getData();
                    if (value == "") {
                      return;
                    } else {
                      viewModel.setStokHareketleri(viewModel.stokHareketleri!.where((element) => element.fisno?.toLowerCase().contains(value.toLowerCase()) ?? false).toList());
                    }
                  },
                )
              : AppBarTitle(title: "Stok Hareketleri", subtitle: widget.model?.stokAdi ?? widget.stokKodu ?? ""),
        ),
        actions: [
          //😳 IconButton(
          //😳     onPressed: () async {
          //😳       await bottomSheetDialogManager.showBottomSheetDialog(context, title: loc.generalStrings.options, children: [
          //😳         BottomSheetModel(
          //😳             iconWidget: viewModel.dovizliFiyat ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
          //😳             title: "Dövizli Fiyat Göster",
          //😳             onTap: () {
          //😳               viewModel.changeDovizliFiyat();
          //😳               Get.back();
          //😳             }),
          //😳         BottomSheetModel(iconWidget: Icons.visibility_off_outlined, title: "Gizlenecek Alanlar", onTap: () async {}),
          //😳       ]);
          //😳     },
          //😳     icon: const Icon(Icons.more_vert_outlined)),
          Observer(
            builder: (_) => IconButton(
              onPressed: () {
                if (viewModel.searchBar) {
                  getData();
                }
                viewModel.changeSearchBar();
              },
              icon: Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined),
            ),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(
              icon: Icons.filter_alt_outlined,
              child: Text(loc.generalStrings.filter),
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc.generalStrings.filter,
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomWidgetWithLabel(
                        text: "Hareket Yönü",
                        child: Center(
                          child: Observer(
                            builder: (_) => SlideControllerWidget(
                              scroll: false,
                              childrenTitleList: viewModel.hareketYonuList,
                              filterOnChanged: (index) => viewModel.changeIsSelected(index ?? 0),
                              childrenValueList: viewModel.isSelected,
                              groupValue: viewModel.isSelectedGroupValue,
                            ),
                          ),
                        ),
                      ),
                      Observer(
                        builder: (_) => CustomTextField(
                          labelText: "Hareket Türü",
                          readOnly: true,
                          controller: _hareketTuruController,
                          controllerText: viewModel.arrHareketTuru?.join(", "),
                          onTap: () async {
                            bottomSheetDialogManager.clearSelectedData();
                            final List? result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                              context,
                              title: "Hareket Türü",
                              groupValues: viewModel.arrHareketTuru,
                              children: viewModel.hareketTuruMap.entries.map((e) => BottomSheetModel(title: e.key, groupValue: e.key)).toList(),
                            );
                            if (result != null) {
                              _hareketTuruController.text = result.join(", ");
                              viewModel.changeArrHareketTuru(result.map((e) => e as String).toList().cast<String>());
                              // setState(() {});
                            }
                          },
                          suffixMore: true,
                        ),
                      ),
                      Observer(
                        builder: (_) => CustomTextField(
                          labelText: "Cari",
                          valueText: viewModel.cariListesiModel?.cariKodu ?? "",
                          controllerText: viewModel.cariListesiModel?.cariAdi ?? "",
                          readOnly: true,
                          suffix: Wrap(
                            children: [
                              IconButton(
                                onPressed: () {
                                  if (viewModel.cariListesiModel != null) {
                                    dialogManager.showCariGridViewDialog(viewModel.cariListesiModel);
                                  } else {
                                    dialogManager.showAlertDialog("Lütfen önce cari seçiniz.");
                                  }
                                },
                                icon: const Icon(
                                  Icons.data_exploration_outlined,
                                  color: UIHelper.primaryColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () async {
                                  final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                                  if (result != null) {
                                    viewModel.setCariListesiModel(result);
                                  }
                                },
                                icon: const Icon(Icons.more_horiz_outlined),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                Get.back();
                                viewModel.clearArrHareketTuru();
                                viewModel.setCariListesiModel(null);
                                viewModel.setFuture(getData());
                              },
                              style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
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
                              child: Text(loc.generalStrings.apply),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              child: Text(loc.generalStrings.sort),
              onPressed: () async {
                final String? result = await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc.generalStrings.sort,
                  children: [
                    BottomSheetModel(title: "Tarih (Artan)", onTap: () => Get.back(result: "TARIH_AZ")),
                    BottomSheetModel(title: "Tarih (Azalan)", onTap: () => Get.back(result: "TARIH_ZA")),
                    BottomSheetModel(title: "Stok Kodu (A-Z)", onTap: () => Get.back(result: "KOD_AZ")),
                    BottomSheetModel(title: "Stok Kodu (Z-A)", onTap: () => Get.back(result: "KOZ_ZA")),
                  ],
                );
                if (result != null) {
                  viewModel.setSiralama(result);
                  viewModel.setStokHareketleri(await getData()!);
                }
              },
            ),
            AppBarButton(
              icon: Icons.refresh_outlined,
              child: Text(loc.generalStrings.refresh),
              onPressed: () {
                getData();
              },
            ),
          ],
        ),
      );

  FloatingActionButton fab() => FloatingActionButton(
        onPressed: () async {
          await Get.toNamed("mainPage/stokYeniKayit", arguments: StokHareketleriModel()..stokKodu = widget.model?.stokKodu ?? widget.stokKodu);
          viewModel.setStokHareketleri(await getData()!);
        },
        child: const Icon(Icons.add),
      );

  FutureBuilder<dynamic> body() => FutureBuilder(
        future: viewModel.future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Observer(
              builder: (_) => viewModel.stokHareketleri.ext.isNullOrEmpty
                  ? const Center(child: Text("Stok Hareket Kaydı Bulunamadı."))
                  : RefreshIndicator.adaptive(
                      onRefresh: () async {
                        viewModel.setStokHareketleri(await getData()!);
                      },
                      child: SlidableAutoCloseBehavior(
                        child: ListView.builder(
                          primary: false,
                          padding: UIHelper.lowPadding,
                          itemCount: viewModel.stokHareketleri?.length ?? 0,
                          itemBuilder: (context, index) {
                            final StokHareketleriModel model = viewModel.stokHareketleri![index];
                            final List<Widget> children2 = [];
                            if (model.hareketTuruAciklama == "Devir" && yetkiController.stokHareketleriStokSilme) {
                              final Widget slidableAction = SlidableAction(
                                onPressed: (context) async {
                                  dialogManager.showAreYouSureDialog(() async {
                                    final result = await networkManager.dioPost<StokHareketleriModel>(
                                      path: ApiUrls.deleteStokHareket,
                                      bodyModel: StokHareketleriModel(),
                                      addCKey: true,
                                      addSirketBilgileri: true,
                                      queryParameters: {"INCKEYNO": model.inckeyno.toString()},
                                    );
                                    if (result.success == true) {
                                      dialogManager.showSuccessSnackBar("Stok Hareket Kaydı Silindi.");
                                      viewModel.setStokHareketleri(await getData()!);
                                    } else {
                                      dialogManager.showErrorSnackBar("Lütfen daha sonra tekrar deneyiniz.\n ${result.exceptionName}");
                                    }
                                  });
                                },
                                icon: Icons.delete_forever,
                                backgroundColor: UIHelper.primaryColor,
                                foregroundColor: theme.colorScheme.primary,
                                label: loc.generalStrings.delete,
                              ).yetkiVarMi(yetkiController.stokHareketleriStokSilme);
                              if (slidableAction != const SizedBox()) {
                                children2.add(slidableAction);
                              }
                            }
                            //😳 Aslında devir değil. Muhtelif yapmak lazım ama sadece devirin sayfası olduğu için böyle yaptım.
                            //😳 "Muhtelif"
                            if (model.hareketTuruAciklama == "Devir") {
                              children2.add(
                                SlidableAction(
                                  onPressed: (context) async {
                                    await Get.toNamed("mainPage/stokYeniKayit", arguments: model);
                                    viewModel.setStokHareketleri(await getData()!);
                                  },
                                  icon: Icons.directions_walk_outlined,
                                  backgroundColor: UIHelper.primaryColor,
                                  foregroundColor: theme.colorScheme.primary,
                                  label: "Hareket\nDetayı",
                                ),
                              );
                            }
                            if ((model.hareketTuruAciklama == "İrsaliye" || model.hareketTuruAciklama == "Açık Fatura") && !yetkiController.stokHareketDetayiniGizle) {
                              children2.add(
                                SlidableAction(
                                  onPressed: (context) async {
                                    await Get.toNamed(
                                      "mainPage/faturaEdit",
                                      arguments: BaseEditModel<SiparisEditRequestModel>(
                                        baseEditEnum: BaseEditEnum.goruntule,
                                        model: SiparisEditRequestModel.fromStokHareketleriModel(model),
                                        editTipiEnum: EditTipiEnum.values.firstWhereOrNull((element) => element.getName == model.belgeTipiAciklama),
                                      ),
                                    );
                                    viewModel.setStokHareketleri(await getData()!);
                                  },
                                  icon: Icons.directions_walk_outlined,
                                  backgroundColor: UIHelper.primaryColor,
                                  foregroundColor: theme.colorScheme.primary,
                                  label: "Hareket Detayı",
                                ),
                              );
                            }
                            return InkWell(
                              onTap: () async {
                                if (widget.model != null) {
                                  await bottomSheetDialogManager.showBottomSheetDialog(
                                    context,
                                    title: loc.generalStrings.options,
                                    children: [
                                      BottomSheetModel(
                                        title: "Belgeyi Görüntüle",
                                        iconWidget: Icons.preview_outlined,
                                        onTap: () async {
                                          await Get.toNamed(
                                            "mainPage/faturaEdit",
                                            arguments: BaseEditModel<SiparisEditRequestModel>(
                                              baseEditEnum: BaseEditEnum.goruntule,
                                              model: SiparisEditRequestModel.fromStokHareketleriModel(model),
                                              editTipiEnum: EditTipiEnum.values.firstWhereOrNull((element) => element.getName == model.belgeTipiAciklama),
                                            ),
                                          );
                                          viewModel.setStokHareketleri(await getData()!);
                                        },
                                      ).yetkiKontrol(!yetkiController.stokHareketDetayiniGizle),
                                      BottomSheetModel(
                                        title: "Stok İşlemleri",
                                        iconWidget: Icons.list_alt_outlined,
                                        onTap: () {
                                          Get.back();
                                          dialogManager.showStokGridViewDialog(widget.model);
                                        },
                                      ),
                                    ].nullCheckWithGeneric,
                                  );
                                }
                              },
                              child: IntrinsicHeight(
                                child: Card(
                                  child: Slidable(
                                    enabled: children2.ext.isNotNullOrEmpty,
                                    endActionPane: ActionPane(
                                      motion: const BehindMotion(),
                                      children: children2,
                                    ),
                                    child: Row(
                                      // crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: [
                                        listTile(model),
                                        Container(
                                          width: UIHelper.lowSize,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.rectangle,
                                            color: UIHelper.primaryColor,
                                          ),
                                        ).yetkiVarMi(children2.ext.isNotNullOrEmpty),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
            );
          } else {
            return const ListViewShimmer();
          }
        },
      );

  Expanded listTile(StokHareketleriModel model) => Expanded(
        child: ListTile(
          contentPadding: UIHelper.midPaddingHorizontal,
          title: Row(
            children: [
              Expanded(
                child: Wrap(
                  children: [
                    Text(model.stharTarih.toDateString).yetkiVarMi(model.stharTarih != null),
                    const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli).paddingOnly(left: UIHelper.lowSize).yetkiVarMi(model.dovizTipi == 1),
                    // model.dovizTipi == 1 ? const Badge(label: Text("Dövizli")) : Container(),
                  ],
                ),
              ),
              Text(model.fisno ?? ""),
              Icon(
                model.cikisIslemi ?? false ? Icons.chevron_right_outlined : Icons.chevron_left_sharp,
                color: model.cikisIslemi ?? false ? ColorPalette.persianRed : ColorPalette.mantis,
              ),
            ],
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.cariAdi ?? "").yetkiVarMi(model.cariAdi != null),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "${model.belgeTipiAciklama ?? model.hareketTuruAciklama}  ",
                      style: TextStyle(color: (model.cikisIslemi ?? false) ? ColorPalette.persianRed : ColorPalette.mantis),
                    ),
                    TextSpan(text: "(${model.hareketTuruAciklama})", style: TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.3))),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(child: Text("Miktar: ${model.stharGcmik?.toInt() ?? 0}")),
                  Expanded(child: Text("Depo: ${model.depoKodu ?? ""} (${model.depoAdi ?? ""})")).yetkiVarMi(yetkiController.lokalDepoUygulamasiAcikMi),
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
                  Expanded(child: Text("Net Fiyat: ${(model.stharNf ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}")),
                  Expanded(child: Text("Brüt Fiyat: ${(model.stharBf ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}")),
                ],
              ),
              Row(
                children: [
                  Expanded(child: Text("Net Tutar: ${((model.stharNf ?? 0) * (model.stharGcmik ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}")),
                  Expanded(child: Text("Brüt Tutar: ${((model.stharBf ?? 0) * (model.stharGcmik ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}")),
                ],
              ),
            ],
          ),
        ).paddingOnly(bottom: UIHelper.highSize),
      );

  Future<List<StokHareketleriModel>>? getData() async {
    viewModel.setFuture(null);
    setState(() {});
    final Map<String, dynamic> queryParameters = {
      "FilterModel":
          '{"EkranTipi": "L", "siralama": "${viewModel.siralama}", "stokKodu": "${widget.model?.stokKodu ?? widget.stokKodu ?? ""}", "GC": "${viewModel.getIsSelected}", "CariKodu": "${viewModel.cariListesiModel?.cariKodu ?? ""}", "ArrHareketTuru": ${jsonEncode(viewModel.arrHareketTuru)}}',
    };
    // if (viewModel.arrHareketTuru.ext.isNotNullOrEmpty) {
    //   queryParameters["FilterModel"] = "\"ArrHareketTuru\":${jsonEncode(viewModel.arrHareketTuru)}, ${queryParameters["FilterModel"]!}";
    // }
    final result = await networkManager.dioGet<StokHareketleriModel>(
      path: ApiUrls.getStokHareketleri,
      bodyModel: StokHareketleriModel(),
      addCKey: true,
      addSirketBilgileri: true,
      queryParameters: queryParameters,
    );
    viewModel.setFuture(Future.value(result.data));
    final List<StokHareketleriModel> list = result.data.map((e) => e as StokHareketleriModel).toList().cast<StokHareketleriModel>();
    viewModel.setStokHareketleri(list);
    setState(() {});

    return list;
  }
}
