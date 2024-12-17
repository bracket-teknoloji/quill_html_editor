import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

import "../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../view/main_page/alt_sayfalar/cari/cari_network_manager.dart";
import "../../../../components/card/cari_rehberi_card.dart";
import "../../../../constants/enum/base_edit_enum.dart";
import "../../../model/base_edit_model.dart";
import "../../../state/base_state.dart";
import "../view_model/cari_rehberi_view_model.dart";

final class CariRehberiView extends StatefulWidget {
  const CariRehberiView({required this.cariRequestModel, super.key});
  final CariListesiRequestModel cariRequestModel;

  @override
  State<CariRehberiView> createState() => _CariRehberiViewState();
}

final class _CariRehberiViewState extends BaseState<CariRehberiView> {
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      viewModel.cariListesiRequestModel = viewModel.cariListesiRequestModel?.copyWith(
        eFaturaGoster: widget.cariRequestModel.eFaturaGoster,
        belgeTuru: widget.cariRequestModel.belgeTuru,
        bagliCariKodu: widget.cariRequestModel.bagliCariKodu,
        teslimCari: widget.cariRequestModel.teslimCari,
        siparisKarsilanmaDurumu: widget.cariRequestModel.siparisKarsilanmaDurumu,
        menuKodu: widget.cariRequestModel.menuKodu,
      );
      await viewModel.getData();
      scrollController.addListener(() => viewModel.changeScrollStatus(scrollController.position));
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
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) => viewModel.isSearchBarOpen
              ? CustomTextField(
                  labelText: "Ara",
                  focusNode: searchFocusNode,
                  controller: searchController,
                  onSubmitted: (value) {
                    viewModel
                      ..setSearchText(value)
                      ..resetList();
                  },
                  onClear: () => viewModel.setSearchText(""),
                )
              : AppBarTitle(
                  title: "Cari Rehberi",
                  subtitle: widget.cariRequestModel.kod != null ? "${widget.cariRequestModel.kod} Koduna Bağlı Cariler" : null,
                ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              viewModel.changeSearchBarStatus();
              if (viewModel.isSearchBarOpen) {
                searchFocusNode.requestFocus();
              } else {
                viewModel
                  ..setSearchText("")
                  ..resetList();
              }
            },
            icon: Observer(
              builder: (_) => Icon(
                viewModel.isSearchBarOpen ? Icons.search_off_outlined : Icons.search_outlined,
              ),
            ),
          ),
        ],
        bottom: AppBarPreferedSizedBottom(
          children: [
            filtreleButton,
            siralaButton,
            digerButton.yetkiVarMi(BaseSiparisEditModel.instance.getEditTipiEnum?.talepTeklifMi ?? false),
          ].whereType<AppBarButton>().toList(),
        ),
      );

  Observer fab() => Observer(
        builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown,
          onPressed: () async {
            final String? siradakiKod = await CariNetworkManager.getSiradakiKod();
            final result = await Get.toNamed(
              "/mainPage/cariEdit",
              arguments: BaseEditModel(
                baseEditEnum: BaseEditEnum.ekle,
                editTipiEnum: EditTipiEnum.cari,
                model: CariListesiModel(),
                siradakiKod: siradakiKod,
              ),
            );
            if (result is String) {}
          },
        ),
      );
  Widget body() => Observer(
        builder: (_) => RefreshableListView.pageable(
          scrollController: scrollController,
          onRefresh: viewModel.resetList,
          dahaVarMi: viewModel.dahaVarMi,
          items: viewModel.observableList,
          itemBuilder: (item) => CariRehberiCard(model: item, teslimCariMi: widget.cariRequestModel.teslimCari == "E"),
        ),
      );
  @Deprecated("")
  RefreshIndicator body2() => RefreshIndicator.adaptive(
        onRefresh: viewModel.resetList,
        child: Observer(
          builder: (_) {
            if (viewModel.observableList.ext.isNullOrEmpty) {
              if (viewModel.observableList != null) {
                //* Eğer cariListesi boş ise
                return const Center(child: Text("Cari Bulunamadı"));
              } else {
                //* Eğer cariListesi null ise
                return const ListViewShimmer();
              }
            } else {
              //* Eğer cariListesi boş veya null değilse
              return ListView.builder(
                controller: scrollController,
                itemCount: viewModel.observableList != null ? (viewModel.observableList!.length + 1) : 0,
                itemBuilder: (context, index) {
                  if (index == viewModel.observableList!.length) {
                    return Visibility(
                      visible: viewModel.dahaVarMi,
                      child: const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  }
                  final CariListesiModel item = viewModel.observableList![index];
                  return CariRehberiCard(model: item, teslimCariMi: widget.cariRequestModel.teslimCari == "E");
                },
              );
            }
          },
        ),
      );

  AppBarButton get siralaButton => AppBarButton(
        icon: Icons.sort_by_alpha_outlined,
        child: Text(loc.generalStrings.sort),
        onPressed: () async {
          final result = await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.sort,
            children: List.generate(
              viewModel.siralaMap.length,
              (index) => BottomSheetModel(
                title: viewModel.siralaMap.keys.toList()[index],
                value: viewModel.siralaMap.values.toList()[index],
              ),
            ),
          );
          if (result != null) {
            viewModel
              ..changeSiralama(result)
              ..resetList();
          }
        },
      );
  AppBarButton get digerButton => AppBarButton(
        icon: Icons.more_horiz_outlined,
        onPressed: () async {
          final result = await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.options,
            children: [
              BottomSheetModel(
                title: "Muhtelif Cari Oluştur",
                iconWidget: Icons.person_outline_outlined,
                onTap: () async {
                  Get.back();
                  final result = await Get.toNamed("mainPage/MuhtelifCariEkle");
                  if (result is CariListesiModel) {
                    Get.back(result: result);
                  }
                },
              ),
            ],
          );
          if (result != null) {
            viewModel.changeSiralama(result);
          }
        },
      );
  AppBarButton get filtreleButton => AppBarButton(
        icon: Icons.filter_alt_outlined,
        child: Text(loc.generalStrings.filter),
        onPressed: () async {
          await viewModel.getGrupKodlari();
          await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.filter,
            body: Observer(
              builder: (_) => Column(
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
                            final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<String>(
                              context,
                              title: "Kod 1 Seçiniz",
                              groupValues: viewModel.cariListesiRequestModel?.arrKod1,
                              children: List.generate(
                                viewModel.grupKodlari1?.length ?? 0,
                                (index) => BottomSheetModel(
                                  title: viewModel.grupKodlari1?[index].grupAdi ?? "",
                                  value: viewModel.grupKodlari1?[index].grupKodu,
                                  groupValue: viewModel.grupKodlari1?[index].grupKodu,
                                ),
                              ),
                            );
                            if (result != null) {
                              viewModel.changeKod1(result.toList());
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
                            final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<String>(
                              context,
                              title: "Kod 2 Seçiniz",
                              groupValues: viewModel.cariListesiRequestModel?.arrKod2,
                              children: List.generate(
                                viewModel.grupKodlari2?.length ?? 0,
                                (index) => BottomSheetModel(
                                  title: viewModel.grupKodlari2?[index].grupAdi ?? "",
                                  value: viewModel.grupKodlari2?[index].grupKodu,
                                  groupValue: viewModel.grupKodlari2?[index].grupKodu,
                                ),
                              ),
                            );
                            if (result != null) {
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
                            final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<String>(
                              context,
                              title: "Kod 3 Seçiniz",
                              groupValues: viewModel.cariListesiRequestModel?.arrKod3,
                              children: List.generate(
                                viewModel.grupKodlari3?.length ?? 0,
                                (index) => BottomSheetModel(
                                  title: viewModel.grupKodlari3?[index].grupAdi ?? "",
                                  value: viewModel.grupKodlari3?[index].grupKodu,
                                  groupValue: viewModel.grupKodlari3?[index].grupKodu,
                                ),
                              ),
                            );
                            if (result != null) {
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
                            final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<String>(
                              context,
                              title: "Kod 4 Seçiniz",
                              groupValues: viewModel.cariListesiRequestModel?.arrKod4,
                              children: List.generate(
                                viewModel.grupKodlari4?.length ?? 0,
                                (index) => BottomSheetModel(
                                  title: viewModel.grupKodlari4?[index].grupAdi ?? "",
                                  value: viewModel.grupKodlari4?[index].grupKodu,
                                  groupValue: viewModel.grupKodlari4?[index].grupKodu,
                                ),
                              ),
                            );
                            if (result != null) {
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
                            final result = await bottomSheetDialogManager.showCheckBoxBottomSheetDialog<String>(
                              context,
                              title: "Kod 5 Seçiniz",
                              groupValues: viewModel.cariListesiRequestModel?.arrKod5,
                              children: List.generate(
                                viewModel.grupKodlari5?.length ?? 0,
                                (index) => BottomSheetModel(
                                  title: viewModel.grupKodlari5?[index].grupAdi ?? "",
                                  value: viewModel.grupKodlari5?[index].grupKodu,
                                  groupValue: viewModel.grupKodlari5?[index].grupKodu,
                                ),
                              ),
                            );
                            if (result != null) {
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
                      viewModel.resetList();
                      Get.back();
                    },
                    child: Text(loc.generalStrings.filter),
                  ),
                ],
              ),
            ),
          );
        },
      );
}
