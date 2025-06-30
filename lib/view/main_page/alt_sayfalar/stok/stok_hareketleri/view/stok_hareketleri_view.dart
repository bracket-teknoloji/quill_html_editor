import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:flutter_slidable/flutter_slidable.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/init/cache/cache_manager.dart";

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
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../stok_liste/model/stok_listesi_model.dart";
import "../model/stok_hareketleri_model.dart";
import "../view_model/stok_hareketleri_view_model.dart";

final class StokHareketleriView extends StatefulWidget {
  const StokHareketleriView({super.key, this.model, this.stokKodu, this.cariModel});
  final StokListesiModel? model;
  final String? stokKodu;
  final CariListesiModel? cariModel;

  @override
  State<StokHareketleriView> createState() => _StokHareketleriViewState();
}

final class _StokHareketleriViewState extends BaseState<StokHareketleriView> {
  StokHareketleriViewModel viewModel = StokHareketleriViewModel();
  late final TextEditingController _hareketTuruController;
  late final TextEditingController _cariController;

  @override
  void initState() {
    _hareketTuruController = TextEditingController();
    _cariController = TextEditingController();
    super.initState();
    viewModel.setGizlenecekAlanlar(
      viewModel.gizlenecekAlanlar
          .where((element) => CacheManager.getProfilParametre.stokhareketleriGizlenecekAlanlar.contains(element.value))
          .toList(),
    );
    if (widget.cariModel != null) {
      viewModel.setCariListesiModel(widget.cariModel);
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
  Widget build(BuildContext context) => BaseScaffold(
    floatingActionButton: yetkiController.stokHareketleriStokYeniKayit ? fab() : null,
    appBar: appBar(),
    bottomNavigationBar: bottomButtonBar(),
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
                  viewModel.setStokHareketleri(
                    viewModel.stokHareketleri!
                        .where((element) => element.fisno?.toLowerCase().contains(value.toLowerCase()) ?? false)
                        .toList(),
                  );
                }
              },
            )
          : AppBarTitle(title: "Stok Hareketleri", subtitle: widget.model?.stokAdi ?? widget.stokKodu ?? ""),
    ),
    actions: [
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
      IconButton(
        onPressed: () async {
          await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.options,
            children: [
              BottomSheetModel(
                iconWidget: viewModel.dovizliFiyat ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
                title: "Dövizli Fiyat Göster",
                onTap: () {
                  viewModel.changeDovizliFiyat();
                  Get.back();
                  getData();
                },
              ),
              BottomSheetModel(
                iconWidget: Icons.visibility_off_outlined,
                title: "Gizlenecek Alanlar",
                onTap: () async {
                  final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                    context,
                    groupValues: viewModel.gizlenecekAlanlarList.map((e) => e.value).toList(),
                    title: "Gizlenecek Alanlar",
                    children: List.generate(viewModel.gizlenecekAlanlar.length, (index) {
                      final item = viewModel.gizlenecekAlanlar[index];
                      return BottomSheetModel(title: item.name, value: item, groupValue: item.value);
                    }),
                  );
                  if (result case final value?) {
                    viewModel.setGizlenecekAlanlar(value);
                    getData();
                  }
                },
              ),
            ],
          );
        },
        icon: const Icon(Icons.more_vert_outlined),
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
                        final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                          context,
                          title: "Hareket Türü",
                          groupValues: viewModel.arrHareketTuru,
                          children: viewModel.hareketTuruMap.entries
                              .map((e) => BottomSheetModel(title: e.key, value: e, groupValue: e.value))
                              .toList(),
                        );
                        if (result != null) {
                          _hareketTuruController.text = result.map((e) => e.key).join(", ");
                          viewModel.changeArrHareketTuru(result.map((e) => e.value).toList());
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
                            icon: const Icon(Icons.data_exploration_outlined, color: UIHelper.primaryColor),
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
                            viewModel
                              ..clearArrHareketTuru()
                              ..setCariListesiModel(null)
                              ..setFuture(getData());
                          },
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              theme.colorScheme.onSurface.withValues(alpha: 0.1),
                            ),
                          ),
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
            final String? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
              context,
              groupValue: viewModel.siralama,
              title: loc.generalStrings.sort,
              children: [
                BottomSheetModel(title: "Tarih (Artan)", value: "TARIH_AZ", groupValue: "TARIH_AZ"),
                BottomSheetModel(title: "Tarih (Azalan)", value: "TARIH_ZA", groupValue: "TARIH_ZA"),
                BottomSheetModel(title: "Stok Kodu (A-Z)", value: "KOD_AZ", groupValue: "KOD_AZ"),
                BottomSheetModel(title: "Stok Kodu (Z-A)", value: "KOZ_ZA", groupValue: "KOZ_ZA"),
              ],
            );
            if (result != null) {
              viewModel
                ..setSiralama(result)
                ..setStokHareketleri(await getData()!);
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
      await Get.toNamed(
        "mainPage/stokYeniKayit",
        arguments: StokHareketleriModel()..stokKodu = widget.model?.stokKodu ?? widget.stokKodu,
      );
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
                  onRefresh: () async => getData(),
                  child: SlidableAutoCloseBehavior(
                    child: ListView.builder(
                      primary: false,
                      padding: UIHelper.lowPadding,
                      physics: const AlwaysScrollableScrollPhysics(),
                      itemCount: viewModel.stokHareketleri?.length ?? 0,
                      itemBuilder: (context, index) {
                        final StokHareketleriModel model = viewModel.stokHareketleri![index];
                        final List<Widget> children2 = [];
                        if (model.hareketTuruAciklama == "Devir" && yetkiController.stokHareketleriStokSilme) {
                          final SlidableAction slidableAction = SlidableAction(
                            onPressed: (context) async {
                              dialogManager.showAreYouSureDialog(
                                onYes: () async {
                                  final result = await networkManager.dioPost<StokHareketleriModel>(
                                    path: ApiUrls.deleteStokHareket,
                                    bodyModel: StokHareketleriModel(),
                                    queryParameters: {"INCKEYNO": model.inckeyno.toString()},
                                  );
                                  if (result.isSuccess) {
                                    dialogManager.showSuccessSnackBar("Stok Hareket Kaydı Silindi.");
                                    viewModel.setStokHareketleri(await getData()!);
                                  } else {
                                    dialogManager.showErrorSnackBar(
                                      "Lütfen daha sonra tekrar deneyiniz.\n ${result.exceptionName}",
                                    );
                                  }
                                },
                              );
                            },
                            icon: Icons.delete_forever,
                            backgroundColor: theme.colorScheme.onPrimary,
                            foregroundColor: theme.colorScheme.primary,
                            label: loc.generalStrings.delete,
                          );
                          if (yetkiController.stokHareketleriStokSilme) {
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
                              backgroundColor: theme.colorScheme.onPrimary,
                              foregroundColor: theme.colorScheme.primary,
                              label: "Hareket\nDetayı",
                            ),
                          );
                        }
                        if (!yetkiController.stokHareketDetayiniGizle) {
                          children2.add(
                            SlidableAction(
                              onPressed: (context) async {
                                await _viewBelgeDetay(model);
                              },
                              icon: Icons.directions_walk_outlined,
                              backgroundColor: theme.colorScheme.onPrimary,
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
                                  if (!yetkiController.stokHareketDetayiniGizle)
                                    BottomSheetModel(
                                      title: "Belgeyi Görüntüle",
                                      iconWidget: Icons.preview_outlined,
                                      onTap: () async {
                                        await _viewBelgeDetay(model);
                                      },
                                    ),
                                  BottomSheetModel(
                                    title: "Stok İşlemleri",
                                    iconWidget: Icons.list_alt_outlined,
                                    onTap: () {
                                      Get.back();
                                      dialogManager.showStokGridViewDialog(widget.model);
                                    },
                                  ),
                                ],
                              );
                            }
                          },
                          child: IntrinsicHeight(
                            child: Card(
                              child: Slidable(
                                enabled: children2.ext.isNotNullOrEmpty,
                                endActionPane: ActionPane(motion: const BehindMotion(), children: children2),
                                child: Row(
                                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    listTile(model),
                                    if (children2.ext.isNotNullOrEmpty)
                                      Container(
                                        width: UIHelper.lowSize,
                                        decoration: const BoxDecoration(color: UIHelper.primaryColor),
                                      ),
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

  Future<void> _viewBelgeDetay(StokHareketleriModel model) async {
    final editTipi = model.editTipi;
    if (editTipi?.goruntulensinMi ?? false) {
      await Get.toNamed(
        editTipi?.getEditRoute ?? "",
        arguments: BaseEditModel<SiparisEditRequestModel>(
          baseEditEnum: BaseEditEnum.goruntule,
          model: SiparisEditRequestModel.fromStokHareketleriModel(
            model,
          ).copyWith(belgeTuru: editTipi?.rawValue, belgeTipi: editTipi?.rawValue),
          editTipiEnum: editTipi,
        ),
      );
      viewModel.setStokHareketleri(await getData()!);
    } else {
      dialogManager.showErrorSnackBar("Bu belge tipi için yetkiniz bulunmamaktadır.");
    }
  }

  Widget bottomButtonBar() => BottomBarWidget(
    isScrolledDown: true,
    children: [
      FooterButton(
        children: [
          const Text("Giriş"),
          Observer(builder: (_) => Text(viewModel.toplamGiris.commaSeparatedWithDecimalDigits(OndalikEnum.tutar))),
        ],
      ),
      FooterButton(
        children: [
          const Text("Çıkış"),
          Observer(builder: (_) => Text(viewModel.toplamCikis.commaSeparatedWithDecimalDigits(OndalikEnum.tutar))),
        ],
      ),
      FooterButton(
        children: [
          const Text("Kalan"),
          Observer(
            builder: (_) => Text(
              viewModel.toplamBakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
              style: TextStyle(color: UIHelper.getColorWithValue(viewModel.toplamBakiye)),
            ),
          ),
        ],
      ),
    ],
  );

  Expanded listTile(StokHareketleriModel model) => Expanded(
    child: ListTile(
      contentPadding: UIHelper.midPaddingHorizontal,
      title: Row(
        children: [
          Expanded(
            child: Wrap(
              children: [
                if (model.stharTarih != null) Text(model.stharTarih.toDateString),
                if (model.dovizTipi == 1)
                  const ColorfulBadge(
                    label: Text("Dövizli"),
                    badgeColorEnum: BadgeColorEnum.dovizli,
                  ).paddingOnly(left: UIHelper.lowSize),
                // model.dovizTipi == 1 ? const Badge(label: Text("Dövizli")) : Container(),
              ],
            ),
          ),
          if (!viewModel.gizlenecekAlanlarList.map((e) => e.value).contains("BN")) Text(model.fisno ?? ""),
          Icon(
            model.cikisIslemi ?? false ? Icons.arrow_circle_left_outlined : Icons.arrow_circle_right_outlined,
            color: model.cikisIslemi ?? false ? ColorPalette.persianRed : ColorPalette.mantis,
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (model.cariAdi != null && !viewModel.gizlenecekAlanlarList.map((e) => e.value).contains("CSA"))
            Text(model.cariAdi ?? ""),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: "${model.belgeTipiAciklama ?? model.hareketTuruAciklama}  ",
                  style: TextStyle(color: (model.cikisIslemi ?? false) ? ColorPalette.persianRed : ColorPalette.mantis),
                ),
                TextSpan(
                  text: "(${model.hareketTuruAciklama})",
                  style: TextStyle(color: theme.colorScheme.onSurface.withValues(alpha: 0.3)),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(child: Text("Miktar: ${model.stharGcmik?.toInt() ?? 0}")),
              if (yetkiController.lokalDepoUygulamasiAcikMi &&
                  !viewModel.gizlenecekAlanlarList.map((e) => e.value).contains("D"))
                Expanded(child: Text("Depo: ${model.depoKodu ?? ""} (${model.depoAdi ?? ""})")),
            ],
          ),
          Row(
            children: [
              if (!viewModel.gizlenecekAlanlarList.map((e) => e.value).contains("P"))
                Expanded(child: Text("Plasiyer: ${model.plasiyerAciklama ?? ""}")),
              if (!viewModel.gizlenecekAlanlarList.map((e) => e.value).contains("K"))
                Expanded(child: Text("KDV %: ${model.stharKdv?.toInt() ?? 0}")),
            ],
          ),
          if (!viewModel.gizlenecekAlanlarList.map((e) => e.value).contains("F") &&
              yetkiController.stokEditTipineGorefiyatGor(model.editTipi))
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: "Net Fiyat: ${(model.stharNf ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
                        ),
                        if ((model.dovizTipi ?? 0) > 0 && viewModel.dovizliFiyat)
                          TextSpan(
                            text:
                                " (${model.dovizliNetFiyat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati)} ${parametreModel.dovizList?.firstWhereOrNull((element) => element.dovizTipi == model.dovizTipi)?.isim})",
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Brüt Fiyat: ${(model.stharBf ?? 0).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
                        ),
                        if ((model.dovizTipi ?? 0) > 0 && viewModel.dovizliFiyat)
                          TextSpan(
                            text:
                                " (${model.dovizFiyati.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati)} ${parametreModel.dovizList?.firstWhereOrNull((element) => element.dovizTipi == model.dovizTipi)?.isim})",
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          if (!viewModel.gizlenecekAlanlarList.map((e) => e.value).contains("T") &&
              yetkiController.stokEditTipineGorefiyatGor(model.editTipi))
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Net Tutar: ${((model.stharNf ?? 0) * (model.stharGcmik ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
                        ),
                        if ((model.dovizTipi ?? 0) > 0 && viewModel.dovizliFiyat)
                          TextSpan(
                            text:
                                " (${model.dovizliNetTutar.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati)} ${parametreModel.dovizList?.firstWhereOrNull((element) => element.dovizTipi == model.dovizTipi)?.isim})",
                          ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "Brüt Tutar: ${((model.stharBf ?? 0) * (model.stharGcmik ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)}",
                        ),
                        if ((model.dovizTipi ?? 0) > 0 && viewModel.dovizliFiyat)
                          TextSpan(
                            text:
                                " (${((model.dovizFiyati ?? 0) * (model.stharGcmik ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati)} ${parametreModel.dovizList?.firstWhereOrNull((element) => element.dovizTipi == model.dovizTipi)?.isim})",
                          ),
                      ],
                    ),
                  ),
                ),
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
      queryParameters: queryParameters,
    );
    viewModel
      ..setFuture(Future.value(result.dataList))
      ..setStokHareketleri(result.dataList);
    setState(() {});

    return result.dataList;
  }
}
