import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/appbar/appbar_prefered_sized_bottom.dart";
import "../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../core/components/card/faturalar_card.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../core/components/list_view/rapor_filtre_date_time_bottom_sheet/view/rapor_filtre_date_time_bottom_sheet_view.dart";
import "../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../core/components/textfield/custom_app_bar_text_field.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../model/param_model.dart";
import "../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../view_model/faturalar_view_model.dart";

class FaturalarView extends StatefulWidget {
  final EditTipiEnum editTipiEnum;
  const FaturalarView({super.key, required this.editTipiEnum});

  @override
  State<FaturalarView> createState() => _FaturalarViewState();
}

class _FaturalarViewState extends BaseState<FaturalarView> {
  late final FaturalarViewModel viewModel;
  late final ScrollController _scrollController;
  late final TextEditingController _searchController;
  late final TextEditingController _baslangicTarihiController;
  late final TextEditingController _bitisTarihiController;
  late final TextEditingController _cariController;
  late final TextEditingController _cariTipiController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projeController;
  late final TextEditingController _ozelKod1Controller;
  late final TextEditingController _ozelKod2Controller;
  late final TextEditingController _kod0Controller;
  late final TextEditingController _kod1Controller;
  late final TextEditingController _kod2Controller;
  late final TextEditingController _kod3Controller;
  late final TextEditingController _kod4Controller;
  late final TextEditingController _kod5Controller;

  @override
  void initState() {
    viewModel = FaturalarViewModel(pickerBelgeTuru: widget.editTipiEnum.rawValue, editTipiEnum: widget.editTipiEnum);
    _scrollController = ScrollController();
    _searchController = TextEditingController();
    _baslangicTarihiController = TextEditingController();
    _bitisTarihiController = TextEditingController();
    _cariController = TextEditingController();
    _cariTipiController = TextEditingController();
    _plasiyerController = TextEditingController();
    _projeController = TextEditingController();
    _ozelKod1Controller = TextEditingController();
    _ozelKod2Controller = TextEditingController();
    _kod0Controller = TextEditingController();
    _kod1Controller = TextEditingController();
    _kod2Controller = TextEditingController();
    _kod3Controller = TextEditingController();
    _kod4Controller = TextEditingController();
    _kod5Controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          viewModel.setIsScrollDown(false);
        }
        if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
          viewModel.setIsScrollDown(true);
        }
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
          await viewModel.getData();
          viewModel.setIsScrollDown(true);
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
    _projeController.dispose();
    _ozelKod1Controller.dispose();
    _ozelKod2Controller.dispose();
    _kod0Controller.dispose();
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
        body: body(),
        bottomNavigationBar: bottomBar(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.searchBar) {
              return CustomAppBarTextField(
                onFieldSubmitted: (String value) async {
                  viewModel.setSearchText(value);
                  await viewModel.resetPage();
                },
              );
            }
            return AppBarTitle(title: widget.editTipiEnum.getName, subtitle: viewModel.faturaList?.length.toStringIfNotNull ?? "");
          },
        ),
        actions: <Widget>[
          IconButton(onPressed: () async => await viewModel.changeSearchBar(), icon: Observer(builder: (_) => Icon(viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined))),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: <AppBarButton?>[
            AppBarButton(
              icon: Icons.filter_alt_outlined,
              onPressed: () async => await filtrele(),
              child: Text(loc(context).generalStrings.filter),
            ),
            AppBarButton(
              icon: Icons.sort_by_alpha_outlined,
              child: Text(loc(context).generalStrings.sort),
              onPressed: () async {
                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Sıralama",
                  groupValue: viewModel.faturaRequestModel.siralama,
                  children: List.generate(
                    viewModel.siralaMap.length,
                    (int index) => BottomSheetModel(
                      title: viewModel.siralaMap.keys.toList()[index],
                      value: viewModel.siralaMap.values.toList()[index],
                      groupValue: viewModel.siralaMap.values.toList()[index],
                    ),
                  ),
                );
                if (result != null) {
                  viewModel.setSiralama(result);
                  await viewModel.resetPage();
                }
              },
            ),
            AppBarButton(
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc(context).generalStrings.options,
                  children: <BottomSheetModel>[
                    BottomSheetModel(
                      title: "Görünecek Ekstra Alanlar",
                      iconWidget: Icons.add_circle_outline_outlined,
                      onTap: () async {
                        Get.back();
                        await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "Görünecek Ekstra Alanlar",
                          body: Column(
                            children: <Widget>[
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Ek Açıklamalar"),
                                  value: viewModel.ekstraAlanlarMap["EK"] ?? false,
                                  onChanged: (bool value) => viewModel.changeEkstraAlanlarMap("EK", value),
                                ),
                              ),
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Miktar"),
                                  value: viewModel.ekstraAlanlarMap["MİK"] ?? false,
                                  onChanged: (bool value) {
                                    viewModel.changeEkstraAlanlarMap("MİK", value);
                                  },
                                ),
                              ),
                              Observer(
                                builder: (_) => SwitchListTile.adaptive(
                                  title: const Text("Vade"),
                                  value: viewModel.ekstraAlanlarMap["VADE"] ?? false,
                                  onChanged: (bool value) => viewModel.changeEkstraAlanlarMap("VADE", value),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
              child: const Icon(Icons.more_horiz_outlined),
            ),
          ],
        ),
      );

  Observer fab() => Observer(
        builder: (_) => Visibility(
          child: CustomFloatingActionButton(
            isScrolledDown: viewModel.isScrolledDown,
            onPressed: () async {
              await Get.toNamed("/mainPage/faturaEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.ekle, editTipiEnum: widget.editTipiEnum));
              await viewModel.resetPage();
            },
          ),
        ).yetkiVarMi(viewModel.faturaList != null && widget.editTipiEnum.eklensinMi),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: () async => viewModel.resetPage(),
        child: Observer(
          builder: (_) => viewModel.faturaList == null
              ? const ListViewShimmer().paddingAll(UIHelper.lowSize)
              : viewModel.faturaList.ext.isNullOrEmpty
                  ? const Center(child: Text("Fatura bulunamadı"))
                  : ListView.builder(
                      padding: UIHelper.lowPadding,
                      primary: false,
                      physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                      controller: _scrollController,
                      itemCount: viewModel.faturaList != null ? ((viewModel.faturaList?.length ?? 0) + (viewModel.dahaVarMi ? 1 : 0)) : 0,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == viewModel.faturaList?.length) {
                          return const Center(child: CircularProgressIndicator.adaptive());
                        } else {
                          final BaseSiparisEditModel item = viewModel.faturaList?[index] ?? BaseSiparisEditModel();
                          return Observer(
                            builder: (_) => FaturalarCard(
                              model: item,
                              showEkAciklama: viewModel.ekstraAlanlarMap["EK"],
                              showMiktar: viewModel.ekstraAlanlarMap["MİK"],
                              showVade: viewModel.ekstraAlanlarMap["VADE"],
                              editTipiEnum: widget.editTipiEnum,
                              onDeleted: () async {
                                await viewModel.resetPage();
                              },
                              onUpdated: (value) async {
                                if (value) {
                                  await viewModel.resetPage();
                                }
                              },
                            ),
                          );
                        }
                      },
                    ),
        ),
      );

  Observer bottomBar() => Observer(
        builder: (_) => BottomBarWidget(
          isScrolledDown: viewModel.isScrolledDown,
          children: <FooterButton>[
            FooterButton(
              children: <Widget>[
                const Text("KDV Hariç"),
                Observer(builder: (_) => Text("${(viewModel.paramData?["ARA_TOPLAM"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
              ],
            ),
            FooterButton(
              children: <Widget>[
                const Text("KDV"),
                Observer(builder: (_) => Text("${(viewModel.paramData?["KDV"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
              ],
            ),
            FooterButton(
              children: <Widget>[
                const Text("KDV Dahil"),
                Observer(builder: (_) => Text("${(viewModel.paramData?["GENEL_TOPLAM"] as double?).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency")),
              ],
            ),
          ],
        ),
      );

  Future<void> filtrele() async => await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: loc(context).generalStrings.filter,
        body: Column(
          children: <Widget>[
            RaporFiltreDateTimeBottomSheetView(
              filterOnChanged: (int? index) async {
                viewModel.setBaslamaTarihi(_baslangicTarihiController.text);
                viewModel.setBitisTarihi(_bitisTarihiController.text);
              },
              baslangicTarihiController: _baslangicTarihiController,
              bitisTarihiController: _bitisTarihiController,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    labelText: "Cari",
                    suffixMore: true,
                    readOnly: true,
                    controller: _cariController,
                    suffix: IconButton(
                      onPressed: () async {
                        if (viewModel.faturaRequestModel.cariKodu != null && viewModel.faturaRequestModel.cariKodu != "") {
                          Get.back();
                          dialogManager.showCariGridViewDialog(CariListesiModel()..cariKodu = viewModel.faturaRequestModel.cariKodu);
                        } else {
                          await dialogManager.showAlertDialog("Cari Seçiniz");
                        }
                      },
                      icon: Icon(Icons.open_in_new_outlined, color: theme.colorScheme.inversePrimary),
                    ),
                    onTap: () async {
                      final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                      if (result is CariListesiModel) {
                        _cariController.text = result.cariAdi ?? "";
                        viewModel.setCari(result.cariKodu ?? "");
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Cari Tipi",
                    suffixMore: true,
                    readOnly: true,
                    controller: _cariTipiController,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        title: "Cari Tipi",
                        children: List.generate(
                          viewModel.tipiMap.length,
                          (int index) => BottomSheetModel(
                            title: viewModel.tipiMap.keys.toList()[index],
                            value: viewModel.tipiMap.entries.toList()[index],
                          ),
                        ),
                      );
                      if (result != null) {
                        _cariTipiController.text = result.key;
                        viewModel.setCariTipi(result.value);
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    labelText: "Plasiyer",
                    suffixMore: true,
                    readOnly: true,
                    controller: _plasiyerController,
                    onTap: () async {
                      final List<PlasiyerList?>? result =
                          await bottomSheetDialogManager.showPlasiyerListesiBottomSheetDialog(context, groupValues: jsonDecode(viewModel.faturaRequestModel.arrPlasiyerKodu ?? "[]"));
                      if (result != null) {
                        _plasiyerController.text = result.map((PlasiyerList? e) => e?.plasiyerAciklama).join(", ");
                        viewModel.setPlasiyerArr(result.map((PlasiyerList? e) => e?.plasiyerKodu).toList());
                      }
                    },
                  ),
                ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                Expanded(
                  child: CustomTextField(
                    labelText: "Proje",
                    suffixMore: true,
                    readOnly: true,
                    controller: _projeController,
                    onTap: () async {
                      final BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.faturaRequestModel.projeKodu);
                      if (result != null) {
                        _projeController.text = result.projeAdi ?? "";
                        viewModel.setProjeKodu(result.projeKodu ?? "");
                      }
                    },
                  ),
                ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    labelText: "Özel Kod 1",
                    controller: _ozelKod1Controller,
                    onChanged: (String value) => viewModel.setOzelKod1(value),
                    suffix: IconButton(
                      onPressed: () async {
                        // var result = await bottomSheetDialogManager.showOzelKod1BottomSheetDialog(context);
                        final result = await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "Özel Kod Seçiniz",
                          children: List.generate(viewModel.tipiList.length, (int index) => BottomSheetModel(title: viewModel.tipiList[index], value: viewModel.tipiList[index])),
                        );
                        if (result != null) {
                          _ozelKod1Controller.text = result ?? "";
                          viewModel.setOzelKod1(result);
                        }
                      },
                      icon: const Icon(Icons.more_horiz_outlined),
                    ),
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Özel Kod 2",
                    controller: _ozelKod2Controller,
                    onChanged: (String value) => viewModel.setOzelKod2(value),
                    suffix: IconButton(
                      onPressed: () async {
                        final ListOzelKodTum? result = await bottomSheetDialogManager.showOzelKod2BottomSheetDialog(context, viewModel.faturaRequestModel.ozelKod2);
                        if (result != null) {
                          _ozelKod2Controller.text = result.kod ?? "";
                          viewModel.setOzelKod2(result.kod);
                        }
                      },
                      icon: const Icon(Icons.more_horiz_outlined),
                    ),
                  ),
                ),
              ],
            ),
            const CustomTextField(
              labelText: "Belge Tipi",
              suffixMore: true,
              readOnly: true,
            ),
            InkWell(
              onTap: () => viewModel.setKodlariGoster(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[const Text("Cari Rapor Kodları"), Observer(builder: (_) => Icon(viewModel.kodlariGoster ? Icons.arrow_drop_up_outlined : Icons.arrow_drop_down))],
              ),
            ).paddingAll(UIHelper.lowSize),
            Observer(
              builder: (_) => Visibility(
                visible: viewModel.kodlariGoster,
                child: Wrap(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            labelText: "Grup Kodu",
                            controller: _kod0Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: jsonDecode(viewModel.faturaRequestModel.arrGrupKodu ?? "[]"),
                                children: List.generate(
                                  viewModel.getGrupKod0?.length ?? 0,
                                  (int index) => BottomSheetModel(
                                    title: viewModel.getGrupKod0?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod0?[index],
                                    groupValue: viewModel.getGrupKod0?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod0(list.map((BaseGrupKoduModel? e) => e?.grupKodu).toList());
                                _kod0Controller.text = list.map((BaseGrupKoduModel? e) => e?.grupAdi).join(", ");
                                await viewModel.resetPage();
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodList?.any((BaseGrupKoduModel element) => element.grupNo == 0) ?? false),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 1",
                            controller: _kod1Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: jsonDecode(viewModel.faturaRequestModel.arrKod1 ?? "[]"),
                                children: List.generate(
                                  viewModel.getGrupKod1?.length ?? 0,
                                  (int index) => BottomSheetModel(
                                    title: viewModel.getGrupKod1?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod1?[index],
                                    groupValue: viewModel.getGrupKod1?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod1(list.map((BaseGrupKoduModel? e) => e?.grupKodu).toList());
                                _kod1Controller.text = list.map((BaseGrupKoduModel? e) => e?.grupAdi).join(", ");
                                await viewModel.resetPage();
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodList?.any((BaseGrupKoduModel element) => element.grupNo == 1) ?? false),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 2",
                            controller: _kod2Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: jsonDecode(viewModel.faturaRequestModel.arrKod2 ?? "[]"),
                                children: List.generate(
                                  viewModel.getGrupKod2?.length ?? 0,
                                  (int index) => BottomSheetModel(
                                    title: viewModel.getGrupKod2?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod2?[index],
                                    groupValue: viewModel.getGrupKod2?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod2(list.map((BaseGrupKoduModel? e) => e?.grupKodu).toList());
                                _kod2Controller.text = list.map((BaseGrupKoduModel? e) => e?.grupAdi).join(", ");
                                await viewModel.resetPage();
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodList?.any((BaseGrupKoduModel element) => element.grupNo == 2) ?? false),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 3",
                            controller: _kod3Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: jsonDecode(viewModel.faturaRequestModel.arrKod3 ?? "[]"),
                                children: List.generate(
                                  viewModel.getGrupKod3?.length ?? 0,
                                  (int index) => BottomSheetModel(
                                    title: viewModel.getGrupKod3?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod3?[index],
                                    groupValue: viewModel.getGrupKod3?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod3(list.map((BaseGrupKoduModel? e) => e?.grupKodu).toList());
                                _kod3Controller.text = list.map((BaseGrupKoduModel? e) => e?.grupAdi).join(", ");
                                await viewModel.resetPage();
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodList?.any((BaseGrupKoduModel element) => element.grupNo == 3) ?? false),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 4",
                            controller: _kod4Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: jsonDecode(viewModel.faturaRequestModel.arrKod4 ?? "[]"),
                                children: List.generate(
                                  viewModel.getGrupKod4?.length ?? 0,
                                  (int index) => BottomSheetModel(
                                    title: viewModel.getGrupKod4?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod4?[index],
                                    groupValue: viewModel.getGrupKod4?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod4(list.map((BaseGrupKoduModel? e) => e?.grupKodu).toList());
                                _kod4Controller.text = list.map((BaseGrupKoduModel? e) => e?.grupAdi).join(", ");
                                await viewModel.resetPage();
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodList?.any((BaseGrupKoduModel element) => element.grupNo == 4) ?? false),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 5",
                            controller: _kod5Controller,
                            readOnly: true,
                            suffixMore: true,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod Seçiniz",
                                groupValues: jsonDecode(viewModel.faturaRequestModel.arrKod5 ?? "[]"),
                                children: List.generate(
                                  viewModel.getGrupKod5?.length ?? 0,
                                  (int index) => BottomSheetModel(
                                    title: viewModel.getGrupKod5?[index].grupAdi ?? "",
                                    value: viewModel.getGrupKod5?[index],
                                    groupValue: viewModel.getGrupKod5?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result is List) {
                                final List<BaseGrupKoduModel?> list = result.cast<BaseGrupKoduModel?>().toList();
                                viewModel.changeArrKod5(list.map((BaseGrupKoduModel? e) => e?.grupKodu).toList());
                                _kod5Controller.text = list.map((BaseGrupKoduModel? e) => e?.grupAdi).join(", ");
                                await viewModel.resetPage();
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodList?.any((BaseGrupKoduModel element) => element.grupNo == 5) ?? false),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      resetFilters();
                      viewModel.resetFilter();
                      viewModel.resetPage();
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                    child: const Text("Temizle"),
                  ),
                ),
                SizedBox(width: context.sized.dynamicWidth(0.02)),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back();
                      viewModel.setFaturaList(null);
                      viewModel.setDahaVarMi(true);
                      viewModel.resetPage();
                    },
                    child: const Text("Kaydet"),
                  ),
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ],
        ),
      );

  void resetFilters() {
    _baslangicTarihiController.clear();
    _bitisTarihiController.clear();
    _cariController.clear();
    _cariTipiController.clear();
    _plasiyerController.clear();
    _projeController.clear();
    _ozelKod1Controller.clear();
    _ozelKod2Controller.clear();
    _kod0Controller.clear();
    _kod1Controller.clear();
    _kod2Controller.clear();
    _kod3Controller.clear();
    _kod4Controller.clear();
    _kod5Controller.clear();
  }
}
