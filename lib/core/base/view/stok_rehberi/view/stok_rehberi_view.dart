import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../components/badge/colorful_badge.dart";
import "../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../components/floating_action_button/custom_floating_action_button.dart";
import "../../../../components/image/image_view.dart";
import "../../../../components/image/image_widget.dart";
import "../../../../components/textfield/custom_text_field.dart";
import "../../../../constants/enum/badge_color_enum.dart";
import "../../../../constants/enum/base_edit_enum.dart";
import "../../../../constants/enum/grup_kodu_enums.dart";
import "../../../../constants/extensions/list_extensions.dart";
import "../../../../constants/extensions/number_extensions.dart";
import "../../../../constants/extensions/widget_extensions.dart";
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
  final String? searchText;
  final bool? isTalepTeklif;
  const StokRehberiView({super.key, this.searchText, this.isTalepTeklif});

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
  @override
  void initState() {
    focusNode = FocusNode();
    controllerInitializer();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (widget.searchText != null) {
        viewModel.setSearchText(widget.searchText!);
        _searchTextController.text = widget.searchText!;
      }
      FocusScope.of(context).requestFocus(focusNode);
      await viewModel.getData();
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
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(context),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar(BuildContext context) => AppBar(
        leading: BackButton(onPressed: () => Get.back(result: true)),
        title: const Text("Stok Rehberi"),
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
                              final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                                context,
                                modul: GrupKoduEnum.stok,
                                grupKodu: 0,
                                groupValues: viewModel.stokBottomSheetModel.arrGrupKodu,
                              );
                              if (result != null) {
                                viewModel.setGrupKodu(result.whereType<BaseGrupKoduModel>().toList());
                                grupKoduController.text = viewModel.stokBottomSheetModel.arrGrupKodu?.map((e) => e.grupAdi).join(",") ?? "";
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
                              final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                                context,
                                modul: GrupKoduEnum.stok,
                                grupKodu: 1,
                                groupValues: viewModel.stokBottomSheetModel.arrKod1,
                              );
                              if (result != null) {
                                viewModel.changeArrKod1(result.whereType<BaseGrupKoduModel>().toList());
                                kod1Controller.text = viewModel.stokBottomSheetModel.arrKod1?.map((e) => e.grupAdi).join(",") ?? "";
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
                              final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                                context,
                                modul: GrupKoduEnum.stok,
                                grupKodu: 2,
                                groupValues: viewModel.stokBottomSheetModel.arrKod2,
                              );
                              if (result != null) {
                                viewModel.changeArrKod2(result.whereType<BaseGrupKoduModel>().toList());
                                kod2Controller.text = viewModel.stokBottomSheetModel.arrKod2?.map((e) => e.grupAdi).join(",") ?? "";
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
                              final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                                context,
                                modul: GrupKoduEnum.stok,
                                grupKodu: 3,
                                groupValues: viewModel.stokBottomSheetModel.arrKod3,
                              );
                              if (result != null) {
                                viewModel.changeArrKod3(result.whereType<BaseGrupKoduModel>().toList());
                                kod3Controller.text = viewModel.stokBottomSheetModel.arrKod3?.map((e) => e.grupAdi).join(",") ?? "";
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
                              final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                                context,
                                modul: GrupKoduEnum.stok,
                                grupKodu: 4,
                                groupValues: viewModel.stokBottomSheetModel.arrKod4,
                              );
                              if (result != null) {
                                viewModel.changeArrKod4(result.whereType<BaseGrupKoduModel>().toList());
                                kod4Controller.text = viewModel.stokBottomSheetModel.arrKod4?.map((e) => e.grupAdi).join(",") ?? "";
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
                              final result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(
                                context,
                                modul: GrupKoduEnum.stok,
                                grupKodu: 5,
                                groupValues: viewModel.stokBottomSheetModel.arrKod5,
                              );
                              if (result != null) {
                                viewModel.changeArrKod5(result.whereType<BaseGrupKoduModel>().toList());
                                kod5Controller.text = viewModel.stokBottomSheetModel.arrKod5?.map((e) => e.grupAdi).join(",") ?? "";
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
                children:
                    List.generate(viewModel.siralamaMap.length, (index) => BottomSheetModel(title: viewModel.siralamaMap.keys.toList()[index], value: viewModel.siralamaMap.values.toList()[index])),
              );
              if (result != null) {
                viewModel.setSiralama(result);
                viewModel.resetList();
              }
            },
            icon: const Icon(Icons.sort_by_alpha_outlined),
          ),
          //TODO Bu butonu ekle
          // IconButton(onPressed: () async {}, icon: const Icon(Icons.more_vert_outlined)),
          IconButton(onPressed: () => Get.back(result: true), icon: const Icon(Icons.check_circle, color: UIHelper.primaryColor)),
        ],
      );

  Observer fab() => Observer(
        builder: (_) => CustomFloatingActionButton(
          isScrolledDown: viewModel.isScrollDown,
          onPressed: () async {
            final result = await Get.toNamed("/mainPage/stokEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.ekle, model: StokListesiModel()));
            if (result != null) {
              viewModel.resetList();
            }
          },
        ).yetkiVarMi(yetkiController.stokKartiYeniKayit),
      );

  Padding body() => Padding(
        padding: UIHelper.lowPadding,
        child: Column(
          children: [
            CustomTextField(
              labelText: "Ara",
              focusNode: focusNode,
              controller: _searchTextController,
              onSubmitted: (p0) {
                viewModel.setSearchText(p0);
                viewModel.resetList();
              },
              suffix: Wrap(
                children: [
                  IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      viewModel.setSearchText(_searchTextController.text);
                      viewModel.resetList();
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.qr_code_scanner),
                    onPressed: () async {
                      final result = await Get.toNamed("/qr");
                      if (result != null) {
                        _searchTextController.text = result;
                        viewModel.setSearchText(result);
                        viewModel.resetList();
                      }
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) => RefreshableListView.pageable(
                  scrollController: _scrollController,
                  dahaVarMi: viewModel.dahaVarMi,
                  onRefresh: viewModel.resetList,
                  items: viewModel.observableList,
                  itemBuilder: (item) => Card(
                    child: ListTile(
                      onLongPress: () async {
                        dialogManager.showStokGridViewDialog(await getSelectedData(item));
                      },
                      onTap: () async {
                        StokListesiModel? stokModel;
                        if (BaseSiparisEditModel.instance.kalemEkliMi(item)) {
                          final result = await dialogManager.showStokKayitliDialog(item);
                          if (result != true) {
                            return;
                          }
                        }

                        stokModel = await getSelectedData(item);
                        if (item.yapilandirmaAktif == true && parametreModel.esnekYapilandir == true) {
                          final result = await Get.toNamed("/mainPage/yapilandirmaRehberi", arguments: item);
                          if (result is YapilandirmaRehberiModel) {
                            stokModel?.yapkod = result.yapkod;
                          } else {
                            return;
                          }
                          stokModel?.yapkodAciklama = result.yapacik;
                        }
                        await Get.toNamed((widget.isTalepTeklif ?? false) ? "/talepTeklifKalemEkle" : "/kalemEkle", arguments: stokModel ?? item);
                        viewModel.setSelectedStokModel(null);
                      },
                      leading: SizedBox(
                        height: UIHelper.highSize * 3,
                        width: UIHelper.highSize * 3,
                        child: InkWell(
                          onTap: item.resimUrlKucuk == null ? null : () => Get.to(ImageView(path: item.resimUrl ?? "", title: item.stokKodu ?? "")),
                          child: SizedBox(
                            height: UIHelper.highSize * 3,
                            width: UIHelper.highSize * 3,
                            child: ImageWidget(path: item.resimUrlKucuk),
                          ),
                        ),
                      ),
                      title: Text(item.stokKodu ?? "", textAlign: TextAlign.start, style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            spacing: UIHelper.lowSize,
                            children: [
                              const ColorfulBadge(label: Text("Seri"), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(item.seriCikislardaAcik == true),
                              ColorfulBadge(
                                label: Text("Dövizli ${item.satisDovizAdi}"),
                                badgeColorEnum: BadgeColorEnum.dovizli,
                              ).yetkiVarMi(item.satDovTip != null || item.alisDovTip != null),
                              const ColorfulBadge(label: Text("Es.Yap."), badgeColorEnum: BadgeColorEnum.esYap).yetkiVarMi(item.yapilandirmaAktif == true),
                              const ColorfulBadge(label: Text("Kilitli (Genel)"), badgeColorEnum: BadgeColorEnum.kilitli).yetkiVarMi(item.kilitGenel == "E"),
                            ].whereType<ColorfulBadge>().toList(),
                          ),
                          Text(item.stokAdi ?? ""),
                        ],
                      ),
                      trailing: Text("${item.bakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? 0} ${item.olcuBirimi ?? ""}"),
                    ),
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: RefreshIndicator.adaptive(
            //     onRefresh: () async {
            //       viewModel.resetList();
            //     },
            //     child: Observer(
            //       builder: (_) => viewModel.observableList.ext.isNullOrEmpty
            //           ? (viewModel.observableList?.isEmpty ?? false)
            //               ? const Center(child: Text("Stok Bulunamadı"))
            //               : const ListViewShimmer()
            //           : Observer(
            //               builder: (_) => ListView.builder(
            //                 primary: false,
            //                 physics: const AlwaysScrollableScrollPhysics(),
            //                 padding: UIHelper.zeroPadding,
            //                 controller: _scrollController,
            //                 itemCount: viewModel.observableList?.length != null ? viewModel.observableList!.length + 1 : 0,
            //                 itemBuilder: (context, index) {
            //                   if (index == viewModel.observableList?.length) {
            //                     return Visibility(
            //                       visible: viewModel.dahaVarMi,
            //                       child: const SafeArea(child: Center(child: CircularProgressIndicator.adaptive())),
            //                     );
            //                   } else {
            //                     final StokListesiModel? stok = viewModel.observableList?[index];
            //                     return Card(
            //                       child: ListTile(
            //                         onLongPress: () async {
            //                           dialogManager.showStokGridViewDialog(await getSelectedData(stok));
            //                         },
            //                         onTap: () async {
            //                           StokListesiModel? stokModel;
            //                           if (BaseSiparisEditModel.instance.kalemEkliMi(stok)) {
            //                             final result = await dialogManager.showStokKayitliDialog(viewModel.observableList![index]);
            //                             if (result != true) {
            //                               return;
            //                             }
            //                           }

            //                           stokModel = await getSelectedData(stok);
            //                           if (stok?.yapilandirmaAktif == true && parametreModel.esnekYapilandir == true) {
            //                             final result = await Get.toNamed("/mainPage/yapilandirmaRehberi", arguments: stok);
            //                             if (result is YapilandirmaRehberiModel) {
            //                               stokModel?.yapkod = result.yapkod;
            //                             } else {
            //                               return;
            //                             }
            //                             stokModel?.yapkodAciklama = result.yapacik;
            //                           }
            //                           await Get.toNamed((widget.isTalepTeklif ?? false) ? "/talepTeklifKalemEkle" : "/kalemEkle", arguments: stokModel ?? stok);
            //                           viewModel.setSelectedStokModel(null);
            //                         },
            //                         leading: SizedBox(
            //                           height: UIHelper.highSize * 3,
            //                           width: UIHelper.highSize * 3,
            //                           child: InkWell(
            //                             onTap: stok?.resimUrlKucuk == null ? null : () => Get.to(ImageView(path: stok?.resimUrl ?? "", title: stok?.stokKodu ?? "")),
            //                             child: SizedBox(
            //                               height: UIHelper.highSize * 3,
            //                               width: UIHelper.highSize * 3,
            //                               child: ImageWidget(path: stok?.resimUrlKucuk),
            //                             ),
            //                           ),
            //                         ),
            //                         title: Text(stok?.stokKodu ?? "", textAlign: TextAlign.start, style: const TextStyle(fontWeight: FontWeight.bold)),
            //                         subtitle: Column(
            //                           crossAxisAlignment: CrossAxisAlignment.start,
            //                           children: [
            //                             Wrap(
            //                               spacing: UIHelper.lowSize,
            //                               children: [
            //                                 const ColorfulBadge(label: Text("Seri"), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(stok?.seriCikislardaAcik == true),
            //                                 ColorfulBadge(
            //                                   label: Text("Dövizli ${stok?.satisDovizAdi}"),
            //                                   badgeColorEnum: BadgeColorEnum.dovizli,
            //                                 ).yetkiVarMi(stok?.satDovTip != null || stok?.alisDovTip != null),
            //                                 const ColorfulBadge(label: Text("Es.Yap."), badgeColorEnum: BadgeColorEnum.esYap).yetkiVarMi(stok?.yapilandirmaAktif == true),
            //                                 const ColorfulBadge(label: Text("Kilitli (Genel)"), badgeColorEnum: BadgeColorEnum.kilitli).yetkiVarMi(stok?.kilitGenel == "E"),
            //                               ].whereType<ColorfulBadge>().toList(),
            //                             ),
            //                             Text(stok?.stokAdi ?? ""),
            //                           ],
            //                         ),
            //                         trailing: Text("${stok?.bakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? 0} ${stok?.olcuBirimi ?? ""}"),
            //                       ),
            //                     );
            //                   }
            //                 },
            //               ),
            //             ),
            //     ),
            //   ),
            // ),
          ],
        ),
      );

  // void resetData() {
  //   viewModel.resetSayfa();
  //   viewModel.setDahaVarMi(true);
  //   viewModel.setObservableList(null);
  //   getData();
  // }

  // Future<void> getData() async {
  //   viewModel.setDahaVarMi(false);
  //   final GenericResponseModel response =
  //       await networkManager.dioPost<StokListesiModel>(path: ApiUrls.getStoklar, data: viewModel.stokBottomSheetModel.toJsonWithList(), bodyModel: StokListesiModel());
  //   if (response.isSuccess && response.data is List) {
  //     if (response.data?.length == parametreModel.sabitSayfalamaOgeSayisi) {
  //       viewModel.setDahaVarMi(true);
  //       viewModel.increaseSayfa();
  //     }
  //     viewModel.setObservableList(response.data as List);
  //   }
  // }

  Future<StokListesiModel?> getSelectedData(StokListesiModel? model) async {
    viewModel.setSelectedStokModel(model?.stokKodu ?? "");
    final GenericResponseModel response =
        await networkManager.dioPost<StokListesiModel>(path: ApiUrls.getStoklar, data: viewModel.stokBottomSheetModel.toJsonWithList(), bodyModel: StokListesiModel(), showLoading: true);
    if (response.isSuccess) {
      final List<StokListesiModel> list = (response.data as List).map((e) => e as StokListesiModel).toList().cast<StokListesiModel>();
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
}
