import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../core/components/card/talep_teklif_card.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../core/components/slide_controller/view/slide_controller_view.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../core/constants/enum/talep_teklif_tipi_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../view_model/talep_teklif_listesi_view_model.dart";

class TalepTeklifListesiView extends StatefulWidget {
  final TalepTeklifEnum talepTeklifEnum;
  const TalepTeklifListesiView({super.key, required this.talepTeklifEnum});

  @override
  State<TalepTeklifListesiView> createState() => _TalepTeklifListesiViewState();
}

class _TalepTeklifListesiViewState extends BaseState<TalepTeklifListesiView> {
  final TalepTeklifListesiViewModel viewModel = TalepTeklifListesiViewModel();
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;
  late final TextEditingController _baslangicTarihiController;
  late final TextEditingController _bitisTarihiController;
  late final TextEditingController _cariController;
  late final TextEditingController _cariTipiController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _grupKoduController;
  late final TextEditingController _kod1Controller;
  late final TextEditingController _kod2Controller;
  late final TextEditingController _kod3Controller;
  late final TextEditingController _kod4Controller;
  late final TextEditingController _kod5Controller;

  @override
  void initState() {
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    _baslangicTarihiController = TextEditingController();
    _bitisTarihiController = TextEditingController();
    _cariController = TextEditingController();
    _cariTipiController = TextEditingController();
    _plasiyerController = TextEditingController();
    _grupKoduController = TextEditingController();
    _kod1Controller = TextEditingController();
    _kod2Controller = TextEditingController();
    _kod3Controller = TextEditingController();
    _kod4Controller = TextEditingController();
    _kod5Controller = TextEditingController();
    viewModel.setPickerBelgeTuru(widget.talepTeklifEnum.rawValue);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
          await viewModel.getData();
          viewModel.setIsScrolledDown(true);
        }
        if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
          viewModel.setIsScrolledDown(true);
        } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          viewModel.setIsScrolledDown(false);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    _baslangicTarihiController.dispose();
    _bitisTarihiController.dispose();
    _cariController.dispose();
    _cariTipiController.dispose();
    _plasiyerController.dispose();
    _grupKoduController.dispose();
    _kod1Controller.dispose();
    _kod2Controller.dispose();
    _kod3Controller.dispose();
    _kod4Controller.dispose();
    _kod5Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: true,
        extendBody: true,
        extendBodyBehindAppBar: false,
        appBar: appBar(),
        floatingActionButton: fab(),
        bottomNavigationBar: bottomBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.searchBar) {
              return CustomAppBarTextField(
                controller: _searchController,
                onChanged: viewModel.setSearchText,
                onFieldSubmitted: (value) async {
                  viewModel.setSearchText(value);
                  await viewModel.resetPage();
                },
              );
            }
            return AppBarTitle(title: widget.talepTeklifEnum.getName, subtitle: viewModel.talepTeklifListesiModelList?.length.toStringIfNotNull);
          },
        ),
        actions: [
          Observer(
            builder: (_) => viewModel.searchBar
                ? IconButton(
                    onPressed: viewModel.changeSearchBar,
                    icon: const Icon(Icons.search_off_outlined),
                  )
                : IconButton(
                    onPressed: viewModel.changeSearchBar,
                    icon: const Icon(Icons.search_outlined),
                  ),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            AppBarButton(
              onPressed: filtreleButtonOnTap,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Observer(
                    builder: (_) => Icon(
                      Icons.filter_alt_outlined,
                      color: viewModel.hasFilter ? theme.colorScheme.inversePrimary : null,
                      size: UIHelper.midSize * 2,
                    ),
                  ),
                  Text(loc.generalStrings.filter),
                ],
              ),
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              onPressed: siralaButtonOnTap,
              child: Text(loc.generalStrings.sort),
            ),
            AppBarButton(
              onPressed: seceneklerButtonOnTap,
              child: const Icon(Icons.more_horiz_outlined),
            ),
          ],
        ),
      );

  Observer fab() => Observer(
        builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrolledDown,
          onPressed: () async {
            final result = await Get.toNamed(
              "mainPage/talTekEdit",
              arguments: BaseEditModel(
                // model: widget.model,
                baseEditEnum: BaseEditEnum.ekle,
                editTipiEnum: EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == widget.talepTeklifEnum.rawValue),
              ),
            );
            if (result == true) {
              await viewModel.resetPage();
            }
          },
        ),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: viewModel.resetPage,
        child: Observer(
          builder: (_) {
            if (viewModel.talepTeklifListesiModelList == null) {
              return const ListViewShimmer();
            } else if (viewModel.talepTeklifListesiModelList!.isEmpty) {
              return const Center(child: Text("Kayıt Bulunamadı."));
            } else {
              return ListView.builder(
                controller: _scrollController,
                primary: false,
                padding: UIHelper.lowPadding,
                itemCount: viewModel.talepTeklifListesiModelList!.length + (viewModel.dahaVarMi ? 1 : 0),
                itemBuilder: (_, index) {
                  if (index == viewModel.talepTeklifListesiModelList!.length) {
                    return const Center(child: CircularProgressIndicator.adaptive());
                  }
                  final BaseSiparisEditModel model = viewModel.talepTeklifListesiModelList![index];
                  return Observer(
                    builder: (_) => TalepTeklifCard(
                      model: model,
                      talepTeklifEnum: widget.talepTeklifEnum,
                      editTipiEnum: EditTipiEnum.values.firstWhereOrNull((element) => element.rawValue == widget.talepTeklifEnum.rawValue),
                      showEkAciklama: viewModel.ekstraAlanlarMap["EK"] ?? false,
                      showMiktar: viewModel.ekstraAlanlarMap["MİK"] ?? false,
                      showVade: viewModel.ekstraAlanlarMap["VADE"] ?? false,
                      onDeleted: () async => await viewModel.resetPage(),
                      onUpdated: (value) async {
                        if (value) {
                          await viewModel.resetPage();
                        }
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      );

  Observer bottomBar() => Observer(
        builder: (_) => BottomBarWidget(
          isScrolledDown: viewModel.isScrolledDown,
          visible: viewModel.paramData?.isNotEmpty == true,
          children: [
            FooterButton(
              children: [
                const Text("KDV Hariç"),
                Observer(builder: (_) => Text("${(viewModel.paramData?["ARA_TOPLAM"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
              ],
            ),
            FooterButton(
              children: [
                const Text("KDV"),
                Observer(builder: (_) => Text("${(viewModel.paramData?["KDV"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
              ],
            ),
            FooterButton(
              children: [
                const Text("KDV Dahil"),
                Observer(builder: (_) => Text("${(viewModel.paramData?["GENEL_TOPLAM"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
              ],
            ),
          ],
        ),
      );

  Future<void> filtreleButtonOnTap() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.filter,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RaporFiltreDateTimeBottomSheetView(
            filterOnChanged: (index) {
              viewModel.setBaslamaTarihi(_baslangicTarihiController.text);
              viewModel.setBitisTarihi(_bitisTarihiController.text);
            },
            baslangicTarihiController: _baslangicTarihiController,
            bitisTarihiController: _bitisTarihiController,
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  labelText: "Cari",
                  controller: _cariController,
                  suffixMore: true,
                  readOnly: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.siparislerRequestModel.cariKodu ?? "")),
                  onClear: () {
                    viewModel.setCariKodu(null);
                    _cariController.clear();
                  },
                  onTap: () async {
                    final result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                    if (result != null) {
                      _cariController.text = result.cariAdi;
                      viewModel.setCariKodu(result.cariKodu);
                    }
                  },
                ),
              ),
              Expanded(
                child: CustomTextField(
                  labelText: "Cari Tipi",
                  controller: _cariTipiController,
                  suffixMore: true,
                  readOnly: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.siparislerRequestModel.cariTipi ?? "")),
                  onClear: () {
                    viewModel.setCariTipi(null);
                    _cariTipiController.clear();
                  },
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showCariTipiBottomSheetDialog(context, viewModel.siparislerRequestModel.cariTipi);
                    if (result != null) {
                      _cariTipiController.text = result.title ?? "";
                      //😳 Bunu düzenle
                      viewModel.setCariTipi(result.value);
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
                  labelText: "Plasiyer",
                  controller: _plasiyerController,
                  suffixMore: true,
                  readOnly: true,
                  onClear: () => viewModel.setArrPlasiyerKodu(null),
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showPlasiyerListesiBottomSheetDialog(
                      context,
                      groupValues: ((jsonDecode(viewModel.siparislerRequestModel.arrPlasiyerKodu ?? "[]")) as List).map((e) => e as String).toList().cast<String>(),
                    );
                    if (result.ext.isNotNullOrEmpty) {
                      _plasiyerController.text = result!.map((e) => e?.plasiyerAciklama).join(", ");

                      viewModel.setArrPlasiyerKodu(result.map((e) => e?.plasiyerKodu.toString()).toList().cast<String>());
                    }
                  },
                ),
              ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
            ],
          ),
          CustomWidgetWithLabel(
            isVertical: true,
            text: "Kapalı Belgeler Listelenmesin",
            child: Observer(builder: (_) => Switch.adaptive(value: viewModel.siparislerRequestModel.kapaliBelgelerListelenmesin ?? false, onChanged: viewModel.setKapaliBelgelerListelenmesin)),
          ),
          // .yetkiVarMi(parametreModel.kapali),
          Observer(
            builder: (_) => SlideControllerWidget(
              scroll: false,
              title: "Teslimat Durumu",
              childrenTitleList: viewModel.teslimatDurumu,
              filterOnChanged: viewModel.setTeslimatDurumuGroupValue,
              childrenValueList: viewModel.teslimatDurumuValueList,
              groupValue: viewModel.siparislerRequestModel.siparisKarsilanmaDurumu,
            ),
          ),
          InkWell(
            onTap: viewModel.changeGrupKodlariGoster,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Cari Rapor Kodları"),
                Observer(builder: (_) => Icon(viewModel.grupKodlariGoster ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down_outlined)),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
          Observer(
            builder: (_) => AnimatedContainer(
              height: viewModel.grupKodlariGoster ? null : 0,
              duration: const Duration(seconds: 1),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Grup Kodu",
                          controller: _grupKoduController,
                          readOnly: true,
                          suffixMore: true,
                          onTap: () async => await grupKodlariBottomSheet(0, viewModel.siparislerRequestModel.arrGrupKodu, viewModel.getGrupKodlari0),
                        ),
                      ).yetkiVarMi(viewModel.getGrupKodlari0.ext.isNotNullOrEmpty),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Kod 1",
                          controller: _kod1Controller,
                          readOnly: true,
                          suffixMore: true,
                          onClear: () {
                            viewModel.setArrKod1(null);
                            _kod1Controller.clear();
                          },
                          onTap: () async => await grupKodlariBottomSheet(1, viewModel.siparislerRequestModel.arrKod1, viewModel.getGrupKodlari1),
                        ),
                      ).yetkiVarMi(viewModel.getGrupKodlari1.ext.isNotNullOrEmpty),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          labelText: "Kod 2",
                          controller: _kod2Controller,
                          readOnly: true,
                          suffixMore: true,
                          onClear: () {
                            viewModel.setArrKod2(null);
                            _kod2Controller.clear();
                          },
                          onTap: () async => await grupKodlariBottomSheet(2, viewModel.siparislerRequestModel.arrKod2, viewModel.getGrupKodlari2),
                        ),
                      ).yetkiVarMi(viewModel.getGrupKodlari2.ext.isNotNullOrEmpty),
                      // .yetkiVarMi(viewModel.grupKodList2),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Kod 3",
                          controller: _kod3Controller,
                          readOnly: true,
                          suffixMore: true,
                          onClear: () {
                            viewModel.setArrKod3(null);
                            _kod3Controller.clear();
                          },
                          onTap: () async => await grupKodlariBottomSheet(3, viewModel.siparislerRequestModel.arrKod3, viewModel.getGrupKodlari3),
                        ),
                      ).yetkiVarMi(viewModel.getGrupKodlari3.ext.isNotNullOrEmpty),
                    ],
                  ),
                  Observer(
                    builder: (_) => Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "kod 4",
                            controller: _kod4Controller,
                            readOnly: true,
                            suffixMore: true,
                            onClear: () {
                              viewModel.setArrKod4(null);
                              _kod4Controller.clear();
                            },
                            onTap: () async => await grupKodlariBottomSheet(4, viewModel.siparislerRequestModel.arrKod4, viewModel.getGrupKodlari4),
                          ),
                        ).yetkiVarMi(viewModel.getGrupKodlari4.ext.isNotNullOrEmpty),
                        Expanded(
                          child: CustomTextField(
                            labelText: "kod 5",
                            controller: _kod5Controller,
                            readOnly: true,
                            suffixMore: true,
                            onClear: () {
                              viewModel.setArrKod5(null);
                              _kod5Controller.clear();
                            },
                            onTap: () async => await grupKodlariBottomSheet(5, viewModel.siparislerRequestModel.arrKod5, viewModel.getGrupKodlari5),
                          ),
                        ).yetkiVarMi(viewModel.getGrupKodlari5.ext.isNotNullOrEmpty),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    Get.back();
                    _baslangicTarihiController.clear();
                    _bitisTarihiController.clear();
                    _cariController.clear();
                    _cariTipiController.clear();
                    _plasiyerController.clear();
                    _grupKoduController.clear();
                    _kod1Controller.clear();
                    _kod2Controller.clear();
                    _kod3Controller.clear();
                    _kod4Controller.clear();
                    _kod5Controller.clear();
                    await viewModel.resetFilter();
                    await viewModel.resetPage();
                  },
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                  child: const Text("Temizle"),
                ),
              ),
              SizedBox(width: context.sized.dynamicWidth(0.02)),
              Expanded(
                child: ElevatedButton(
                  onPressed: () async {
                    Get.back();
                    await viewModel.resetPage();
                  },
                  child: Text(loc.generalStrings.apply),
                ),
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ],
      ).paddingAll(UIHelper.lowSize),
    );
  }

  Future<void> siralaButtonOnTap() async {
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Sıralama",
      groupValue: viewModel.siparislerRequestModel.siralama,
      children: List.generate(
        viewModel.siralaMap.length,
        (index) => BottomSheetModel(
          title: viewModel.siralaMap.keys.toList()[index],
          value: viewModel.siralaMap.values.toList()[index],
          groupValue: viewModel.siralaMap.values.toList()[index],
        ),
      ),
    );
    if (result != null) {
      viewModel.setSiralama(result);
      viewModel.resetPage();
    }
  }

  Future<void> seceneklerButtonOnTap() async {
    await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: loc.generalStrings.options,
      children: [
        BottomSheetModel(
          title: "Görünecek Ekstra Alanlar",
          iconWidget: Icons.add_circle_outline_outlined,
          onTap: () async {
            Get.back();
            await bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: "Görünecek Ekstra Alanlar",
              body: Column(
                children: [
                  Observer(
                    builder: (_) => SwitchListTile.adaptive(
                      title: const Text("Ek Açıklamalar"),
                      value: viewModel.ekstraAlanlarMap["EK"] ?? false,
                      onChanged: (value) => viewModel.changeEkstraAlanlarMap("EK", value),
                    ),
                  ),
                  Observer(
                    builder: (_) => SwitchListTile.adaptive(
                      title: const Text("Miktar"),
                      value: viewModel.ekstraAlanlarMap["MİK"] ?? false,
                      onChanged: (value) {
                        viewModel.changeEkstraAlanlarMap("MİK", value);
                      },
                    ),
                  ),
                  Observer(
                    builder: (_) => SwitchListTile.adaptive(
                      title: const Text("Vade"),
                      value: viewModel.ekstraAlanlarMap["VADE"] ?? false,
                      onChanged: (value) => viewModel.changeEkstraAlanlarMap("VADE", value),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Future<void> grupKodlariBottomSheet(int index, dynamic groupValues, List<BaseGrupKoduModel>? list) async {
    var result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
      context,
      title: "Grup Kodu Seçiniz",
      groupValues: ((jsonDecode(groupValues ?? "[]")) as List).map((e) => e as String).toList().cast<String>(),
      children: List.generate(
        list?.length ?? 0,
        (index) => BottomSheetModel(
          title: list?[index].grupAdi ?? "",
          value: list?[index],
          groupValue: list?[index].grupKodu,
        ),
      ),
    );
    if (result != null) {
      result = result.map((e) => e as BaseGrupKoduModel).toList().cast<BaseGrupKoduModel>();
      switch (index) {
        case 0:
          viewModel.setArrKod0(result.map((e) => e.grupKodu ?? "").toList().cast<String>());
          _grupKoduController.text = result.map((e) => e.grupAdi).join(", ");
        case 1:
          viewModel.setArrKod1(result.map((e) => e.grupKodu ?? "").toList().cast<String>());
          _kod1Controller.text = result.map((e) => e.grupAdi).join(", ");
        case 2:
          viewModel.setArrKod2(result.map((e) => e.grupKodu ?? "").toList().cast<String>());
          _kod2Controller.text = result.map((e) => e.grupAdi).join(", ");
        case 3:
          viewModel.setArrKod3(result.map((e) => e.grupKodu ?? "").toList().cast<String>());
          _kod3Controller.text = result.map((e) => e.grupAdi).join(", ");
        case 4:
          viewModel.setArrKod4(result.map((e) => e.grupKodu ?? "").toList().cast<String>());
          _kod4Controller.text = result.map((e) => e.grupAdi).join(", ");
        case 5:
          viewModel.setArrKod5(result.map((e) => e.grupKodu ?? "").toList().cast<String>());
          _kod5Controller.text = result.map((e) => e.grupAdi).join(", ");
      }
    }
  }
}
