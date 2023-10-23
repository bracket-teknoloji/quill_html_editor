// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../view/main_page/alt_sayfalar/cari/cari_network_manager.dart";
import "../../../../components/card/cari_rehberi_card.dart";
import "../../../../constants/enum/base_edit_enum.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../model/base_edit_model.dart";
import "../../../state/base_state.dart";
import "../view_model/cari_rehberi_view_model.dart";

class CariRehberiView extends StatefulWidget {
  final String cariKodu;
  const CariRehberiView({super.key, required this.cariKodu});

  @override
  State<CariRehberiView> createState() => _CariRehberiViewState();
}

class _CariRehberiViewState extends BaseState<CariRehberiView> {
  late final CariRehberiViewModel viewModel;
  late final TextEditingController searchController;
  late final TextEditingController sehirController;
  late final TextEditingController ilceController;
  late final TextEditingController tipiController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;
  late final ScrollController scrollController;
  late final FocusNode searchFocusNode;

  @override
  void initState() {
    viewModel = CariRehberiViewModel();
    searchController = TextEditingController();
    sehirController = TextEditingController();
    ilceController = TextEditingController();
    tipiController = TextEditingController();
    kod1Controller = TextEditingController();
    kod2Controller = TextEditingController();
    kod3Controller = TextEditingController();
    kod4Controller = TextEditingController();
    kod5Controller = TextEditingController();
    scrollController = ScrollController();
    searchFocusNode = FocusNode();
    searchFocusNode.requestFocus();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.changeBagliCariKodu(widget.cariKodu);
      viewModel.getCariListesi();
      scrollController.addListener(() {
        if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          viewModel.changeIsScrollDown(false);
        } else if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
          viewModel.changeIsScrollDown(true);
        }
        if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
          viewModel.getCariListesi();
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    sehirController.dispose();
    ilceController.dispose();
    tipiController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) => viewModel.searchBar
              ? CustomTextField(
                  labelText: "Ara",
                  focusNode: searchFocusNode,
                  controller: searchController,
                  onSubmitted: (value) => viewModel.changeFilterText(value),
                  onClear: () => viewModel.changeFilterText(""),
                )
              : AppBarTitle(
                  title: "Cari Rehberi",
                  subtitle: "${widget.cariKodu} Koduna Bağlı Cariler",
                ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.changeSearchBar();
              if (viewModel.searchBar) {
                searchFocusNode.requestFocus();
              } else {
                viewModel.changeFilterText("");
              }
            },
            icon: Observer(
              builder: (_) => Icon(
                viewModel.searchBar ? Icons.search_off_outlined : Icons.search_outlined,
              ),
            ),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            filtreleButton(),
            siralaButton(),
          ],
        ),
      );

  Observer fab() => Observer(
        builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown,
          onPressed: () async {
            final String? siradakiKod = await CariNetworkManager.getSiradakiKod();
            Get.toNamed(
              "/mainPage/cariEdit",
              arguments: BaseEditModel(
                baseEditEnum: BaseEditEnum.ekle,
                model: CariListesiModel(),
                siradakiKod: siradakiKod,
              ),
            );
          },
        ),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.resetAll();
        },
        child: Observer(
          builder: (_) {
            if (viewModel.cariListesi.ext.isNullOrEmpty) {
              if (viewModel.cariListesi != null) {
                //* Eğer cariListesi boş ise
                return const Center(child: Text("Cari Bulunamadı"));
              } else {
                //* Eğer cariListesi null ise
                return const Center(child: CircularProgressIndicator.adaptive());
              }
            } else {
              //* Eğer cariListesi boş veya null değilse
              return ListView.builder(
                controller: scrollController,
                itemCount: viewModel.cariListesi != null ? (viewModel.cariListesi!.length + 1) : 0,
                itemBuilder: (context, index) {
                  if (index == viewModel.cariListesi!.length) {
                    return Visibility(
                      visible: viewModel.dahaVarMi,
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  }
                  final CariListesiModel item = viewModel.cariListesi![index];
                  return CariRehberiCard(model: item);
                },
              );
            }
          },
        ),
      );

  AppBarButton siralaButton() => AppBarButton(
        icon: Icons.sort_by_alpha_outlined,
        child: const Text("Sırala"),
        onPressed: () async {
          final result = await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: "Sırala",
            children: List.generate(
              viewModel.siralaMap.length,
              (index) => BottomSheetModel(
                title: viewModel.siralaMap.keys.toList()[index],
                value: viewModel.siralaMap.values.toList()[index],
              ),
            ),
          );
          if (result != null) {
            viewModel.changeSiralama(result);
          }
        },
      );
  AppBarButton filtreleButton() => AppBarButton(
        icon: Icons.filter_alt_outlined,
        child: const Text("Filtrele"),
        onPressed: () async {
          await viewModel.getGrupKodlari();
          await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: "Filtrele",
            body: Observer(
              builder: (_) => Padding(
                padding: UIHelper.lowPadding,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Şehir",
                            controller: sehirController,
                            onClear: () {
                              viewModel.changeSehir(null);
                              sehirController.clear();
                            },
                            onChanged: (value) => viewModel.changeSehir(value),
                            suffix: IconButton(
                              onPressed: () async {
                                if (viewModel.sehirler == null) {
                                  await viewModel.getSehirBilgileri();
                                }
                                final result = await bottomSheetDialogManager.showBottomSheetDialog(
                                  context,
                                  title: "Şehir Seçiniz",
                                  children: List.generate(
                                    viewModel.sehirler?.length ?? 0,
                                    (index) => BottomSheetModel(
                                      title: viewModel.sehirler?[index].sehirAdi ?? "",
                                      value: viewModel.sehirler?[index].sehirAdi,
                                    ),
                                  ),
                                );
                                if (result != null) {
                                  viewModel.changeSehir(result);
                                  sehirController.text = result;
                                }
                              },
                              icon: const Icon(Icons.more_horiz_outlined),
                            ),
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            labelText: "İlçe",
                            controller: ilceController,
                            onClear: () {
                              viewModel.changeIlce(null);
                              ilceController.clear();
                            },
                            onChanged: (value) => viewModel.changeIlce(value),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Tipi",
                            readOnly: true,
                            suffixMore: true,
                            controller: tipiController,
                            onClear: () {
                              viewModel.changeTipi(null);
                              tipiController.clear();
                            },
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showBottomSheetDialog(
                                context,
                                title: "Tipi Seçiniz",
                                children: List.generate(
                                  viewModel.tipiMap.length,
                                  (index) => BottomSheetModel(
                                    title: viewModel.tipiMap.keys.toList()[index],
                                    value: viewModel.tipiMap.values.toList()[index],
                                  ),
                                ),
                              );
                              if (result != null) {
                                viewModel.changeTipi(result);
                                tipiController.text = result;
                              }
                            },
                          ),
                        ),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 1",
                            readOnly: true,
                            suffixMore: true,
                            controller: kod1Controller,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod 1 Seçiniz",
                                children: List.generate(
                                  viewModel.grupKodlari1?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.grupKodlari1?[index].grupAdi ?? "",
                                    value: viewModel.grupKodlari1?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result is List && result.ext.isNotNullOrEmpty) {
                                viewModel.changeKod1(result.whereType<String>().toList());
                                kod1Controller.text = result.join(", ");
                              } else {
                                viewModel.changeKod1(null);
                                kod1Controller.clear();
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodlari1.ext.isNotNullOrEmpty),
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
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod 2 Seçiniz",
                                children: List.generate(
                                  viewModel.grupKodlari2?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.grupKodlari2?[index].grupAdi ?? "",
                                    value: viewModel.grupKodlari2?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result is List && result.ext.isNotNullOrEmpty) {
                                viewModel.changeKod2(result.whereType<String>().toList());
                                kod2Controller.text = result.join(", ");
                              } else {
                                viewModel.changeKod2(null);
                                kod2Controller.clear();
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodlari2.ext.isNotNullOrEmpty),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 3",
                            readOnly: true,
                            suffixMore: true,
                            controller: kod3Controller,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod 3 Seçiniz",
                                children: List.generate(
                                  viewModel.grupKodlari3?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.grupKodlari3?[index].grupAdi ?? "",
                                    value: viewModel.grupKodlari3?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result is List && result.ext.isNotNullOrEmpty) {
                                viewModel.changeKod3(result.whereType<String>().toList());
                                kod3Controller.text = result.join(", ");
                              } else {
                                viewModel.changeKod3(null);
                                kod3Controller.clear();
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodlari3.ext.isNotNullOrEmpty),
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
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod 4 Seçiniz",
                                children: List.generate(
                                  viewModel.grupKodlari4?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.grupKodlari4?[index].grupAdi ?? "",
                                    value: viewModel.grupKodlari4?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result is List && result.ext.isNotNullOrEmpty) {
                                viewModel.changeKod4(result.whereType<String>().toList());
                                kod4Controller.text = result.join(", ");
                              } else {
                                viewModel.changeKod4(null);
                                kod4Controller.clear();
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodlari4.ext.isNotNullOrEmpty),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Kod 5",
                            readOnly: true,
                            suffixMore: true,
                            controller: kod5Controller,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog(
                                context,
                                title: "Kod 5 Seçiniz",
                                children: List.generate(
                                  viewModel.grupKodlari5?.length ?? 0,
                                  (index) => BottomSheetModel(
                                    title: viewModel.grupKodlari5?[index].grupAdi ?? "",
                                    value: viewModel.grupKodlari5?[index].grupKodu,
                                  ),
                                ),
                              );
                              if (result is List && result.ext.isNotNullOrEmpty) {
                                viewModel.changeKod5(result.whereType<String>().toList());
                                kod5Controller.text = result.join(", ");
                              } else {
                                viewModel.changeKod5(null);
                                kod5Controller.clear();
                              }
                            },
                          ),
                        ).yetkiVarMi(viewModel.grupKodlari5.ext.isNotNullOrEmpty),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        viewModel.resetAll();
                        Get.back();
                      },
                      child: const Text("Filtrele"),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
}
