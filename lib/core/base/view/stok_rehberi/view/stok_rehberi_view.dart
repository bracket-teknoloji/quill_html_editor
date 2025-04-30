import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../../view/main_page/model/param_model.dart";
import "../../../../components/badge/colorful_badge.dart";
import "../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../components/floating_action_button/custom_floating_action_button.dart";
import "../../../../components/image/image_carousel/view/image_carousel_view.dart";
import "../../../../components/image/image_widget.dart";
import "../../../../components/layout/custom_layout_builder.dart";
import "../../../../components/list_view/refreshable_list_view.dart";
import "../../../../components/textfield/custom_text_field.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/enum/badge_color_enum.dart";
import "../../../../constants/enum/base_edit_enum.dart";
import "../../../../constants/enum/edit_tipi_enum.dart";
import "../../../../constants/enum/grup_kodu_enums.dart";
import "../../../../constants/extensions/list_extensions.dart";
import "../../../../constants/extensions/number_extensions.dart";
import "../../../../constants/ondalik_utils.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/base_edit_model.dart";
import "../../../model/base_grup_kodu_model.dart";
import "../../../model/generic_response_model.dart";
import "../../../state/base_state.dart";
import "../../yapilandirma_rehberi/model/yapilandirma_rehberi_model.dart";
import "../view_model/stok_rehberi_view_model.dart";

final class StokRehberiView extends StatefulWidget {
  const StokRehberiView({super.key, this.searchText, this.isTalepTeklif, this.isDepoTalep});
  final String? searchText;
  final bool? isTalepTeklif;
  final bool? isDepoTalep;

  @override
  State<StokRehberiView> createState() => _StokRehberiViewState();
}

final class _StokRehberiViewState extends BaseState<StokRehberiView> {
  late final ScrollController _scrollController;
  late final FocusNode focusNode;
  late final TextEditingController _searchTextController;
  late final TextEditingController grupKoduController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;
  final StokRehberiViewModel viewModel = StokRehberiViewModel();
  final BaseSiparisEditModel instance = BaseSiparisEditModel.instance;
  @override
  void initState() {
    focusNode = FocusNode();
    controllerInitializer();
    viewModel
      ..setOzelKod1(instance.ozelKod1)
      ..setOzelKod2(instance.ozelKod2);
    if (parametreModel.satisFiyatGrubuSorulacakAlan != null &&
        instance.getEditTipiEnum?.fiyatGrubuGorunsunMu == true &&
        parametreModel.satisFiyatGrubuSorulacakAlan! ==
            instance.findFiyatGrubu(int.tryParse(parametreModel.satisFiyatGrubuSorulacakAlan ?? "") ?? 0)) {
      viewModel.setFiyatGrubu(
        instance.findFiyatGrubu(int.tryParse(parametreModel.satisFiyatGrubuSorulacakAlan ?? "") ?? 0),
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!(instance.getEditTipiEnum?.rehberdenStokSecilsin ?? false)) {
        await dialogManager.showAlertDialog("Bu işlemi gerçekleştiremezsiniz. Rehberden stok seçilmesi kapalı.");
        Get.back();
        return;
      }
      if (widget.searchText != null) {
        viewModel.setSearchText(widget.searchText);
        _searchTextController.text = widget.searchText!;
      }
      // if (parametreModel.satisFiyatGrubuSorulacakAlan != null && instance.getEditTipiEnum?.satisMi == true &&)
      focusNode.requestFocus();
      await viewModel.getData();
      if (viewModel.observableList?.length == 1 &&
          (viewModel.observableList?.first.okutulanBarkod?.startsWith("NQR") ?? false)) {
        await Get.offAndToNamed(
          (widget.isTalepTeklif ?? false) ? "/talepTeklifKalemEkle" : "/kalemEkle",
          arguments: viewModel.observableList?.first,
        );
      }
      _scrollController.addListener(() async {
        viewModel.changeScrollStatus(_scrollController.position);
        // if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        //   viewModel.setIsScrollDown(false);
        // }
        // if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        //   viewModel.setIsScrollDown(true);
        // }
        // if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
        //   await viewModel.getData();
        //   viewModel.setIsScrollDown(true);
        // }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    controllerDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BaseScaffold(appBar: appBar(context), floatingActionButton: fab(), body: body());

  AppBar appBar(BuildContext context) => AppBar(
    leading: BackButton(onPressed: () => Get.back(result: true)),
    title: const AppBarTitle(title: "Stok Rehberi"),
    actions: [
      IconButton(
        onPressed: () async {
          await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.filter,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        suffixMore: true,
                        labelText: "Grup Kodu",
                        controller: grupKoduController,
                        readOnly: true,
                        onTap: () async {
                          if (viewModel.grupKodlari == null) {}
                          final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                            context,
                            modul: GrupKoduEnum.stok,
                            grupKodu: 0,
                            groupValues: viewModel.stokBottomSheetModel.arrGrupKodu,
                          );
                          if (result != null) {
                            viewModel.setGrupKodu(result.toList());
                            grupKoduController.text =
                                viewModel.stokBottomSheetModel.arrGrupKodu?.map((e) => e.grupAdi).join(",") ?? "";
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        suffixMore: true,
                        labelText: "Kod 1",
                        controller: kod1Controller,
                        readOnly: true,
                        onTap: () async {
                          if (viewModel.grupKodlari == null) {}
                          final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                            context,
                            modul: GrupKoduEnum.stok,
                            grupKodu: 1,
                            groupValues: viewModel.stokBottomSheetModel.arrKod1,
                          );
                          if (result != null) {
                            viewModel.changeArrKod1(result.toList());
                            kod1Controller.text =
                                viewModel.stokBottomSheetModel.arrKod1?.map((e) => e.grupAdi).join(",") ?? "";
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
                        suffixMore: true,
                        labelText: "Kod 2",
                        controller: kod2Controller,
                        readOnly: true,
                        onTap: () async {
                          if (viewModel.grupKodlari == null) {}
                          final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                            context,
                            modul: GrupKoduEnum.stok,
                            grupKodu: 2,
                            groupValues: viewModel.stokBottomSheetModel.arrKod2,
                          );
                          if (result != null) {
                            viewModel.changeArrKod2(result.toList());
                            kod2Controller.text =
                                viewModel.stokBottomSheetModel.arrKod2?.map((e) => e.grupAdi).join(",") ?? "";
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        suffixMore: true,
                        labelText: "Kod 3",
                        controller: kod3Controller,
                        readOnly: true,
                        onTap: () async {
                          if (viewModel.grupKodlari == null) {}
                          final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                            context,
                            modul: GrupKoduEnum.stok,
                            grupKodu: 3,
                            groupValues: viewModel.stokBottomSheetModel.arrKod3,
                          );
                          if (result != null) {
                            viewModel.changeArrKod3(result.toList());
                            kod3Controller.text =
                                viewModel.stokBottomSheetModel.arrKod3?.map((e) => e.grupAdi).join(",") ?? "";
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
                        suffixMore: true,
                        labelText: "Kod 4",
                        controller: kod4Controller,
                        readOnly: true,
                        onTap: () async {
                          if (viewModel.grupKodlari == null) {}
                          final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                            context,
                            modul: GrupKoduEnum.stok,
                            grupKodu: 4,
                            groupValues: viewModel.stokBottomSheetModel.arrKod4,
                          );
                          if (result != null) {
                            viewModel.changeArrKod4(result.toList());
                            kod4Controller.text =
                                viewModel.stokBottomSheetModel.arrKod4?.map((e) => e.grupAdi).join(",") ?? "";
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        suffixMore: true,
                        labelText: "Kod 5",
                        controller: kod5Controller,
                        readOnly: true,
                        onTap: () async {
                          if (viewModel.grupKodlari == null) {}
                          final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                            context,
                            modul: GrupKoduEnum.stok,
                            grupKodu: 5,
                            groupValues: viewModel.stokBottomSheetModel.arrKod5,
                          );
                          if (result != null) {
                            viewModel.changeArrKod5(result.toList());
                            kod5Controller.text =
                                viewModel.stokBottomSheetModel.arrKod5?.map((e) => e.grupAdi).join(",") ?? "";
                          }
                        },
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                    viewModel.resetList();
                  },
                  child: Text(loc.generalStrings.filter),
                ).paddingAll(UIHelper.lowSize),
              ],
            ),
          );
        },
        icon: const Icon(Icons.filter_alt_outlined),
      ),
      IconButton(
        onPressed: () async {
          final result = await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.sort,
            children: List.generate(
              viewModel.siralamaMap.length,
              (index) => BottomSheetModel(
                title: viewModel.siralamaMap.keys.toList()[index],
                value: viewModel.siralamaMap.values.toList()[index],
              ),
            ),
          );
          if (result != null) {
            viewModel
              ..setSiralama(result)
              ..resetList();
          }
        },
        icon: const Icon(Icons.sort_by_alpha_outlined),
      ),
      IconButton(
        onPressed: () async {
          bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.options,
            children: [
              BottomSheetModel(
                title: "Detaylı Arama",
                iconWidget: Icons.search_outlined,
                onTap: () async {
                  Get.back();
                  final List<StokDetayliAramaAlanlar> list = [];
                  final List<StokDetayliAramaAlanlar> aramaList = [
                    StokDetayliAramaAlanlar(name: "Stok Kodu", searchField: "STOK_KODU"),
                    StokDetayliAramaAlanlar(name: "Stok Adı", searchField: "STOK_ADI"),
                    ...?parametreModel.stokDetayliAramaAlanlar,
                  ];
                  for (final StokDetayliAramaAlanlar item in aramaList) {
                    if (viewModel.getRequestModel.searchList?.any(
                          (element) => element.searchField == item.searchField,
                        ) ??
                        false) {
                      list.add(
                        viewModel.getRequestModel.searchList!.firstWhere(
                          (element) => element.searchField == item.searchField,
                        ),
                      );
                    } else {
                      list.add(item);
                    }
                  }
                  final result = await Get.toNamed("mainPage/stokDetayliArama", arguments: list);
                  if (result != null) {
                    if (result == true) {
                      viewModel.setSearchList(null);
                    } else {
                      viewModel.setSearchList(result);
                    }
                    await viewModel.resetList();
                  }
                },
              ),
            ],
          );
        },
        icon: const Icon(Icons.more_vert_outlined),
      ),
      IconButton(
        onPressed: () => Get.back(result: true),
        icon: const Icon(Icons.check_circle, color: UIHelper.primaryColor),
      ),
    ],
  );

  Observer? fab() {
    if (yetkiController.stokKartiYeniKayit) {
      return Observer(
        builder:
            (_) => CustomFloatingActionButton(
              isScrolledDown: viewModel.isScrollDown,
              onPressed: () async {
                final result = await Get.toNamed(
                  "/mainPage/stokEdit",
                  arguments: BaseEditModel(baseEditEnum: BaseEditEnum.ekle, model: StokListesiModel()),
                );
                if (result != null) {
                  viewModel.resetList();
                }
              },
            ),
      );
    }
    return null;
  }

  Padding body() => Padding(
    padding: UIHelper.lowPadding,
    child: Column(
      children: [
        CustomTextField(
          labelText: "Ara",
          focusNode: focusNode,
          controller: _searchTextController,
          onSubmitted: (p0) {
            viewModel
              ..setSearchText(p0)
              ..resetList();
          },
          suffix: Wrap(
            children: [
              IconButton(
                icon: const Icon(Icons.check),
                onPressed: () {
                  viewModel
                    ..setSearchText(_searchTextController.text)
                    ..resetList();
                },
              ),
              IconButton(
                icon: const Icon(Icons.qr_code_scanner),
                onPressed: () async {
                  final result = await Get.toNamed("/qr");
                  if (result != null) {
                    _searchTextController.text = result;
                    viewModel
                      ..setSearchText(result)
                      ..resetList();
                  }
                },
              ),
            ],
          ),
        ),
        Observer(
          builder:
              (_) => CustomLayoutBuilder(
                splitCount: 3,
                doNotExpand: true,
                children: [
                  if (!viewModel.kategoriMi || (grupKoduWithIndex(0).ext.isNotNullOrEmpty))
                    CustomTextField(
                      labelText: "Grup Kodu",
                      readOnly: true,
                      suffixMore: true,
                      controller: grupKoduController,
                      onClear: () async => await grupKoduOnClear(0),
                      onTap: () => getGrupKodlariBottomSheet(0),
                    ),
                  if (!viewModel.kategoriMi || (grupKoduWithIndex(1).ext.isNotNullOrEmpty))
                    CustomTextField(
                      labelText: "Kod 1",
                      readOnly: true,
                      suffixMore: true,
                      controller: kod1Controller,
                      onClear: () async => await grupKoduOnClear(1),
                      onTap: () => getGrupKodlariBottomSheet(1),
                    ),
                  if (!viewModel.kategoriMi || (grupKoduWithIndex(2).ext.isNotNullOrEmpty))
                    CustomTextField(
                      labelText: "Kod 2",
                      readOnly: true,
                      suffixMore: true,
                      controller: kod2Controller,
                      onClear: () async => await grupKoduOnClear(2),
                      onTap: () => getGrupKodlariBottomSheet(2),
                    ),
                  if (!viewModel.kategoriMi || (grupKoduWithIndex(3).ext.isNotNullOrEmpty))
                    CustomTextField(
                      labelText: "Kod 3",
                      readOnly: true,
                      suffixMore: true,
                      controller: kod3Controller,
                      onClear: () async => await grupKoduOnClear(3),
                      onTap: () => getGrupKodlariBottomSheet(3),
                    ),
                  if (!viewModel.kategoriMi || (grupKoduWithIndex(4).ext.isNotNullOrEmpty))
                    CustomTextField(
                      labelText: "Kod 4",
                      readOnly: true,
                      suffixMore: true,
                      controller: kod4Controller,
                      onClear: () async => await grupKoduOnClear(4),
                      onTap: () => getGrupKodlariBottomSheet(4),
                    ),
                  if (!viewModel.kategoriMi || (grupKoduWithIndex(5).ext.isNotNullOrEmpty))
                    CustomTextField(
                      labelText: "Kod 5",
                      readOnly: true,
                      suffixMore: true,
                      controller: kod5Controller,
                      onClear: () async => await grupKoduOnClear(5),
                      onTap: () => getGrupKodlariBottomSheet(5),
                    ),
                ],
              ),
        ),
        Expanded(
          child: Observer(
            builder:
                (_) => RefreshableListView.pageable(
                  scrollController: _scrollController,
                  dahaVarMi: viewModel.dahaVarMi,
                  onRefresh: viewModel.resetList,
                  items: viewModel.observableList,
                  itemBuilder:
                      (item) => Card(
                        child: ListTile(
                          onLongPress: () async {
                            dialogManager.showStokGridViewDialog(
                              await getSelectedData(item),
                              cariModel:
                                  instance.cariKodu == null ? null : CariListesiModel()
                                    ?..cariKodu = instance.cariKodu
                                    ..cariAdi = instance.cariAdi,
                            );
                          },
                          onTap: () async {
                            if (item.kilitliMi) {
                              return dialogManager.showAlertDialog(
                                "Kilitli olduğu için bu işlemi gerçekleştiremezsiniz.\nKilit tipi: ${item.kilitTipi}",
                              );
                            }
                            StokListesiModel? stokModel;
                            if (instance.kalemEkliMi(item)) {
                              final result = await dialogManager.showStokKayitliDialog(item);
                              if (result != true) {
                                return;
                              }
                            }
                            stokModel = await getSelectedData(item);
                            if (stokModel == null) {
                              return;
                            }
                            if (item.yapilandirmaAktif == true && parametreModel.esnekYapilandir == true) {
                              final result = await Get.toNamed("/mainPage/yapilandirmaRehberi", arguments: item);
                              if (result is YapilandirmaRehberiModel) {
                                stokModel.yapkod = result.yapkod;
                              } else {
                                return;
                              }
                              stokModel.yapkodAciklama = result.yapacik;
                            }
                            if (widget.isDepoTalep == true) {
                              if (BaseSiparisEditModel.instance.kalemler?.any(
                                    (element) => element.stokKodu == stokModel?.stokKodu,
                                  ) ??
                                  false) {
                                return dialogManager.showAlertDialog("Bu stok kodu daha önce eklenmiş.");
                              }
                              Get.back(result: stokModel);
                              return;
                            }
                            await Get.toNamed(
                              (widget.isTalepTeklif ?? false) ? "/talepTeklifKalemEkle" : "/kalemEkle",
                              arguments: stokModel,
                            );
                            viewModel.setSelectedStokModel(null);
                          },
                          leading: SizedBox(
                            height: UIHelper.highSize * 3,
                            width: UIHelper.highSize * 3,
                            child: InkWell(
                              onTap:
                                  item.resimUrlKucuk == null
                                      ? null
                                      : () => Get.to(() => ImageCarouselView(model: item)),
                              child: SizedBox(
                                height: UIHelper.highSize * 3,
                                width: UIHelper.highSize * 3,
                                child: ImageWidget(path: item.resimUrlKucuk),
                              ),
                            ),
                          ),
                          title: Text(
                            item.stokKodu ?? "",
                            textAlign: TextAlign.start,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Wrap(
                                spacing: UIHelper.lowSize,
                                children: [
                                  if (item.seriCikislardaAcik == true)
                                    const ColorfulBadge(label: Text("Seri"), badgeColorEnum: BadgeColorEnum.seri),
                                  if ((instance.getEditTipiEnum?.satisMi == true)
                                      ? item.satDovTip != null
                                      : item.alisDovTip != null)
                                    ColorfulBadge(
                                      label: Text(
                                        "Dövizli ${(instance.getEditTipiEnum?.satisMi == true) ? item.satisDovizAdi : item.alisDovizAdi}",
                                      ),
                                      badgeColorEnum: BadgeColorEnum.dovizli,
                                    ),
                                  if (item.yapilandirmaAktif == true)
                                    const ColorfulBadge(label: Text("Es.Yap."), badgeColorEnum: BadgeColorEnum.esYap),
                                  if (item.kilitliMi)
                                    ColorfulBadge(
                                      label: Text("Kilitli (${item.kilitTipi})"),
                                      badgeColorEnum: BadgeColorEnum.hata,
                                    ),
                                ],
                              ),
                              Text(item.stokAdi ?? ""),
                              CustomLayoutBuilder.divideInHalf(
                                children: [
                                  if (yetkiController.siparisMSEkstraAlanlari("acik_sip_miktari"))
                                    Text(
                                      "Sip. Miktarı: ${item.acikMussipMiktari.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                                    ),
                                  if (yetkiController.siparisMSEkstraAlanlari("satilabilir_miktar"))
                                    Text(
                                      "Sat. Mik.: ${item.satilabilirMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                                      style: TextStyle(color: UIHelper.getColorWithValue(item.satilabilirMiktar ?? 0)),
                                    ),
                                  // Text("KDV: ${item.kdvOrani?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? 0} %"),
                                ],
                              ),
                            ],
                          ),
                          trailing: Text(
                            "${item.bakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? 0} ${item.olcuBirimi ?? ""}",
                          ),
                        ),
                      ),
                ),
          ),
        ),
      ],
    ),
  );

  Future<StokListesiModel?> getSelectedData(StokListesiModel? model) async {
    viewModel.setSelectedStokModel(model?.stokKodu ?? "");
    final GenericResponseModel<StokListesiModel> response = await networkManager.dioPost<StokListesiModel>(
      path: ApiUrls.getStoklar,
      data: viewModel.stokBottomSheetModel.toJsonWithList(),
      bodyModel: StokListesiModel(),
      showLoading: true,
    );
    if (response.isSuccess) {
      final List<StokListesiModel> list = response.dataList;
      if (list.isEmptyOrNull) {
        return null;
      }
      return list.firstOrNull;
    }
    return null;
  }

  void controllerInitializer() {
    _searchTextController = TextEditingController();
    _scrollController = ScrollController();
    grupKoduController = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
  }

  void controllerDisposer() {
    _scrollController.dispose();
    _searchTextController.dispose();
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
  }

  Future<void> getGrupKodlariBottomSheet(int value) async {
    List<BaseGrupKoduModel>? selectedList = [];
    switch (value) {
      case 0:
        selectedList = viewModel.stokBottomSheetModel.arrGrupKodu;
      case 1:
        selectedList = viewModel.stokBottomSheetModel.arrKod1;
      case 2:
        selectedList = viewModel.stokBottomSheetModel.arrKod2;
      case 3:
        selectedList = viewModel.stokBottomSheetModel.arrKod3;
      case 4:
        selectedList = viewModel.stokBottomSheetModel.arrKod4;
      case 5:
        selectedList = viewModel.stokBottomSheetModel.arrKod5;
    }
    final iterable =
        (viewModel.kategoriGrupKodlari.ext.isNotNullOrEmpty
                ? grupKoduWithIndex(value)
                : viewModel.grupKodlari?.where((element) => element.grupNo == value))
            ?.toList();
    final uniqueList = <BaseGrupKoduModel>[];
    for (final item in iterable ?? <BaseGrupKoduModel>[]) {
      if (!uniqueList.any((element) => grupKoduWithItem(element, value) == grupKoduWithItem(item, value))) {
        uniqueList.add(item);
      }
    }

    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Kod Seçiniz",
      groupValue: grupKoduWithItem(selectedList?.firstOrNull, value),
      children: List.generate(uniqueList.length, (index) {
        final item = uniqueList[index];
        return BottomSheetModel(
          title: grupAdiWithItem(item, value),
          value: item,
          groupValue: grupKoduWithItem(item, value),
        );
      }),
    );
    if (result is! BaseGrupKoduModel) return;

    final List<BaseGrupKoduModel> grupKoduList = [BaseGrupKoduModel.forFirstSelected(result..grupNo = value)];
    switch (value) {
      case 0:
        viewModel.setGrupKodu(grupKoduList);
        grupKoduController.text = grupAdiWithItem(result, value);
      case 1:
        viewModel.changeArrKod1(grupKoduList);
        kod1Controller.text = grupAdiWithItem(result, value);
      case 2:
        viewModel.changeArrKod2(grupKoduList);
        kod2Controller.text = grupAdiWithItem(result, value);
      case 3:
        viewModel.changeArrKod3(grupKoduList);
        kod3Controller.text = grupAdiWithItem(result, value);
      case 4:
        viewModel.changeArrKod4(grupKoduList);
        kod4Controller.text = grupAdiWithItem(result, value);
      case 5:
        viewModel.changeArrKod5(grupKoduList);
        kod5Controller.text = grupAdiWithItem(result, value);
    }
    if (!viewModel.kategoriMi) {
      viewModel
        ..setKategoriMi(true)
        ..setGrupNo(value);
      await viewModel.getKategoriGrupKodlari();
    }
    await viewModel.resetList();
  }

  String grupAdiWithItem(BaseGrupKoduModel? item, int index) {
    if (item == null) return "";
    return switch (index) {
      0 => item.grupAdi ?? "",
      1 => (viewModel.kategoriMi ? item.kod1Adi ?? item.kod1 : item.grupAdi) ?? "",
      2 => (viewModel.kategoriMi ? item.kod2Adi ?? item.kod2 : item.grupAdi) ?? "",
      3 => (viewModel.kategoriMi ? item.kod3Adi ?? item.kod3 : item.grupAdi) ?? "",
      4 => (viewModel.kategoriMi ? item.kod4Adi ?? item.kod4 : item.grupAdi) ?? "",
      5 => (viewModel.kategoriMi ? item.kod5Adi ?? item.kod5 : item.grupAdi) ?? "",
      _ => "",
    };
  }

  String grupKoduWithItem(BaseGrupKoduModel? item, int index) {
    if (item == null) return "";
    return switch (index) {
      0 => item.grupKodu ?? "",
      1 => item.kod1 ?? item.grupKodu ?? "",
      2 => item.kod2 ?? item.grupKodu ?? "",
      3 => item.kod3 ?? item.grupKodu ?? "",
      4 => item.kod4 ?? item.grupKodu ?? "",
      5 => item.kod5 ?? item.grupKodu ?? "",
      _ => "",
    };
  }

  List<BaseGrupKoduModel>? grupKoduWithIndex(int index) {
    final Iterable<BaseGrupKoduModel>? filteredList = viewModel.kategoriGrupKodlari?.where(
      (e) =>
          (viewModel.stokBottomSheetModel.arrGrupKodu?.firstOrNull?.grupKodu == null
              ? true
              : e.grupKodu == viewModel.stokBottomSheetModel.arrGrupKodu?.firstOrNull?.grupKodu) &&
          (viewModel.stokBottomSheetModel.arrKod1?.firstOrNull?.kod1 == null
              ? true
              : e.kod1 == viewModel.stokBottomSheetModel.arrKod1?.firstOrNull?.kod1) &&
          (viewModel.stokBottomSheetModel.arrKod2?.firstOrNull?.kod2 == null
              ? true
              : e.kod2 == viewModel.stokBottomSheetModel.arrKod2?.firstOrNull?.kod2) &&
          (viewModel.stokBottomSheetModel.arrKod3?.firstOrNull?.kod3 == null
              ? true
              : e.kod3 == viewModel.stokBottomSheetModel.arrKod3?.firstOrNull?.kod3) &&
          (viewModel.stokBottomSheetModel.arrKod4?.firstOrNull?.kod4 == null
              ? true
              : e.kod4 == viewModel.stokBottomSheetModel.arrKod4?.firstOrNull?.kod4) &&
          (viewModel.stokBottomSheetModel.arrKod5?.firstOrNull?.kod5 == null
              ? true
              : e.kod5 == viewModel.stokBottomSheetModel.arrKod5?.firstOrNull?.kod5),
    );
    return switch (index) {
      0 => filteredList?.where((e) => e.grupKodu != null).toList(),
      1 => filteredList?.where((e) => e.kod1 != null).toList(),
      2 => filteredList?.where((e) => e.kod2 != null).toList(),
      3 => filteredList?.where((e) => e.kod3 != null).toList(),
      4 => filteredList?.where((e) => e.kod4 != null).toList(),
      5 => filteredList?.where((e) => e.kod5 != null).toList(),
      _ => null,
    };
  }

  Future<void> grupKoduOnClear(int value) async {
    if (grupKoduController.text.isEmpty &&
        kod1Controller.text.isEmpty &&
        kod2Controller.text.isEmpty &&
        kod3Controller.text.isEmpty &&
        kod4Controller.text.isEmpty &&
        kod5Controller.text.isEmpty) {
      viewModel
        ..setKategoriMi(false)
        ..setGrupNo(-1)
        ..setKategoriGrupKodlari(null);
    }
    switch (value) {
      case 0:
        viewModel.setGrupKodu(null);
        grupKoduController.clear();
      case 1:
        viewModel.changeArrKod1(null);
        kod1Controller.clear();
      case 2:
        viewModel.changeArrKod2(null);
        kod2Controller.clear();
      case 3:
        viewModel.changeArrKod3(null);
        kod3Controller.clear();
      case 4:
        viewModel.changeArrKod4(null);
        kod4Controller.clear();
      case 5:
        viewModel.changeArrKod5(null);
        kod5Controller.clear();
    }
    await viewModel.resetList();
  }
}
