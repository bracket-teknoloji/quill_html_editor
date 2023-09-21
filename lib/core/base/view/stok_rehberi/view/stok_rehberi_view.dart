import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/view/yapilandirma_rehberi/model/yapilandirma_rehberi_model.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../components/badge/colorful_badge.dart";
import "../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../components/floating_action_button/custom_floating_action_button.dart";
import "../../../../components/textfield/custom_text_field.dart";
import "../../../../constants/enum/badge_color_enum.dart";
import "../../../../constants/enum/base_edit_enum.dart";
import "../../../../constants/enum/grup_kodu_enums.dart";
import "../../../../constants/extensions/number_extensions.dart";
import "../../../../constants/ondalik_utils.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/base_edit_model.dart";
import "../../../model/base_grup_kodu_model.dart";
import "../../../model/generic_response_model.dart";
import "../../../state/base_state.dart";
import "../view_model/stok_rehberi_view_model.dart";

class StokRehberiView extends StatefulWidget {
  final String? searchText;
  const StokRehberiView({super.key, this.searchText});

  @override
  State<StokRehberiView> createState() => _StokRehberiViewState();
}

class _StokRehberiViewState extends BaseState<StokRehberiView> {
  late final ScrollController _scrollController;
  late final FocusNode focusNode;
  late final TextEditingController _searchTextController;
  late final TextEditingController grupKoduController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;
  StokRehberiViewModel viewModel = StokRehberiViewModel();
  @override
  void initState() {
    focusNode = FocusNode();
    controllerInitializer();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.searchText != null) {
        viewModel.setSearchText(widget.searchText!);
        _searchTextController.text = widget.searchText!;
      }
      FocusScope.of(context).requestFocus(focusNode);
      getData();
    });
    _scrollController.addListener(() async {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
        await Future.delayed(const Duration(milliseconds: 500), () => getData());
        viewModel.changeIsScrolledDown(true);
      }
      if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
        viewModel.changeIsScrolledDown(true);
      } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        viewModel.changeIsScrolledDown(false);
      }
      //focus to search textfield
    });
    super.initState();
  }

  @override
  void dispose() {
    controllerDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      floatingActionButton: fab(),
      body: body(),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: BackButton(onPressed: () => Get.back(result: true)),
      title: const Text("Stok Rehberi"),
      actions: [
        IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showBottomSheetDialog(context,
                  title: "Filtrele",
                  body: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(children: [
                        Expanded(
                            child: CustomTextField(
                                suffixMore: true,
                                labelText: "Grup Kodu",
                                controller: grupKoduController,
                                readOnly: true,
                                onTap: () async {
                                  var result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(context, modul: GrupKoduEnum.STOK, grupKodu: 0);
                                  if (result != null) {
                                    viewModel.setGrupKodu(result.whereType<BaseGrupKoduModel>().toList());
                                    grupKoduController.text = viewModel.stokBottomSheetModel.arrGrupKodu?.map((e) => e.grupAdi).join(",") ?? "";
                                  }
                                })),
                        Expanded(
                            child: CustomTextField(
                                suffixMore: true,
                                labelText: "Kod 1",
                                controller: kod1Controller,
                                readOnly: true,
                                onTap: () async {
                                  var result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(context, modul: GrupKoduEnum.STOK, grupKodu: 1);
                                  if (result != null) {
                                    viewModel.changeArrKod1(result.whereType<BaseGrupKoduModel>().toList());
                                    kod1Controller.text = viewModel.stokBottomSheetModel.arrKod1?.map((e) => e.grupAdi).join(",") ?? "";
                                  }
                                }))
                      ]),
                      Row(children: [
                        Expanded(
                            child: CustomTextField(
                                suffixMore: true,
                                labelText: "Kod 2",
                                controller: kod2Controller,
                                readOnly: true,
                                onTap: () async {
                                  var result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(context, modul: GrupKoduEnum.STOK, grupKodu: 2);
                                  if (result != null) {
                                    viewModel.changeArrKod2(result.whereType<BaseGrupKoduModel>().toList());
                                    kod2Controller.text = viewModel.stokBottomSheetModel.arrKod2?.map((e) => e.grupAdi).join(",") ?? "";
                                  }
                                })),
                        Expanded(
                            child: CustomTextField(
                                suffixMore: true,
                                labelText: "Kod 3",
                                controller: kod3Controller,
                                readOnly: true,
                                onTap: () async {
                                  var result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(context, modul: GrupKoduEnum.STOK, grupKodu: 3);
                                  if (result != null) {
                                    viewModel.changeArrKod3(result.whereType<BaseGrupKoduModel>().toList());
                                    kod3Controller.text = viewModel.stokBottomSheetModel.arrKod3?.map((e) => e.grupAdi).join(",") ?? "";
                                  }
                                }))
                      ]),
                      Row(children: [
                        Expanded(
                            child: CustomTextField(
                                suffixMore: true,
                                labelText: "Kod 4",
                                controller: kod4Controller,
                                readOnly: true,
                                onTap: () async {
                                  var result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(context, modul: GrupKoduEnum.STOK, grupKodu: 4);
                                  if (result != null) {
                                    viewModel.changeArrKod4(result.whereType<BaseGrupKoduModel>().toList());
                                    kod4Controller.text = viewModel.stokBottomSheetModel.arrKod4?.map((e) => e.grupAdi).join(",") ?? "";
                                  }
                                })),
                        Expanded(
                            child: CustomTextField(
                                suffixMore: true,
                                labelText: "Kod 5",
                                controller: kod5Controller,
                                readOnly: true,
                                onTap: () async {
                                  var result = await bottomSheetDialogManager.showGrupKoduCheckBoxBottomSheetDialog(context, modul: GrupKoduEnum.STOK, grupKodu: 5);
                                  if (result != null) {
                                    viewModel.changeArrKod5(result.whereType<BaseGrupKoduModel>().toList());
                                    kod5Controller.text = viewModel.stokBottomSheetModel.arrKod5?.map((e) => e.grupAdi).join(",") ?? "";
                                  }
                                }))
                      ]),
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                            resetData();
                          },
                          child: const Text("Filtrele"))
                    ],
                  ));
            },
            icon: const Icon(Icons.filter_alt_outlined)),
        IconButton(
            onPressed: () async {
              var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                  title: "Sırala",
                  children:
                      List.generate(viewModel.siralamaMap.length, (index) => BottomSheetModel(title: viewModel.siralamaMap.keys.toList()[index], value: viewModel.siralamaMap.values.toList()[index])));
              if (result != null) {
                viewModel.setSiralama(result);
                resetData();
              }
            },
            icon: const Icon(Icons.sort_by_alpha_outlined)),
        IconButton(onPressed: () async {}, icon: const Icon(Icons.more_vert_outlined)),
        IconButton(onPressed: () => Get.back(result: true), icon: Icon(Icons.check_circle, color: UIHelper.primaryColor)),
      ],
    );
  }

  Observer fab() {
    return Observer(
        builder: (_) => CustomFloatingActionButton(
            isScrolledDown: viewModel.isScrolledDown,
            onPressed: () async {
              var result = await Get.toNamed("/mainPage/stokEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.ekle, model: StokListesiModel()));
              if (result != null) {
                resetData();
              }
            }));
  }

  Padding body() {
    return Padding(
      padding: UIHelper.lowPadding,
      child: Column(
        children: [
          CustomTextField(
            labelText: "Ara",
            focusNode: focusNode,
            controller: _searchTextController,
            onSubmitted: (p0) {
              viewModel.setSearchText(p0);
              resetData();
            },
            suffix: Wrap(
              children: [
                IconButton(
                    icon: const Icon(Icons.check),
                    onPressed: () {
                      viewModel.setSearchText(_searchTextController.text);
                      resetData();
                    }),
                IconButton(
                    icon: const Icon(Icons.qr_code_2_outlined),
                    onPressed: () async {
                      var result = await Get.toNamed("/qr");
                      if (result != null) {
                        _searchTextController.text = result;
                        viewModel.setSearchText(result);
                        resetData();
                      }
                    })
              ],
            ),
          ),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async {
                viewModel.resetSayfa();
                viewModel.setDahaVarMi(true);
                viewModel.setStokListesi(null);
                return getData();
              },
              child: Observer(
                  builder: (_) => viewModel.stokListesi.ext.isNullOrEmpty
                      ? (viewModel.stokListesi?.isEmpty ?? false)
                          ? const Center(child: Text("Stok Bulunamadı"))
                          : const Center(child: CircularProgressIndicator.adaptive())
                      : Observer(builder: (_) {
                          return ListView.builder(
                              primary: false,
                              padding: UIHelper.zeroPadding,
                              controller: _scrollController,
                              itemCount: viewModel.stokListesi?.length != null ? viewModel.stokListesi!.length + 1 : 0,
                              itemBuilder: (context, index) {
                                if (index == viewModel.stokListesi?.length) {
                                  return Visibility(
                                    visible: viewModel.dahaVarMi,
                                    child: const Center(child: CircularProgressIndicator.adaptive()),
                                  );
                                } else {
                                  StokListesiModel? stok = viewModel.stokListesi?[index];
                                  return Card(
                                    child: ListTile(
                                      onTap: () async {
                                        StokListesiModel? stokModel;
                                        if (BaseSiparisEditModel.instance.kalemEkliMi(stok)) {
                                          var result = await dialogManager.showStokKayitliDialog(viewModel.stokListesi![index]);
                                          if (result != true) {
                                            return;
                                          }
                                        }

                                        stokModel = await getSelectedData(stok);
                                        if (stok?.yapilandirmaAktif == true) {
                                          var result = await Get.toNamed("/mainPage/yapilandirmaRehberi", arguments: stok);
                                          if (result is YapilandirmaRehberiModel) {
                                            stokModel?.yapkod = result.yapkod;
                                          } else {
                                            return;
                                          }
                                            stokModel?.yapkodAciklama = result.yapacik;
                                        }
                                        await Get.toNamed("/kalemEkle", arguments: stokModel ?? stok);
                                        viewModel.setSelectedStokModel(null);
                                      },
                                      title: Text(stok?.stokKodu ?? "", textAlign: TextAlign.start, style: const TextStyle(fontWeight: FontWeight.bold)),
                                      subtitle: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Wrap(
                                            spacing: UIHelper.lowSize,
                                            children: [
                                              const ColorfulBadge(label: Text("Seri"), badgeColorEnum: BadgeColorEnum.seri).yetkiVarMi(stok?.seriCikislardaAcik == true),
                                              const ColorfulBadge(label: Text("Dövizli"), badgeColorEnum: BadgeColorEnum.dovizli).yetkiVarMi(stok?.satDovTip != null || stok?.alisDovTip != null),
                                              const ColorfulBadge(label: Text("Es.Yap."), badgeColorEnum: BadgeColorEnum.esYap).yetkiVarMi(stok?.yapilandirmaAktif == true),
                                            ],
                                          ),
                                          Text(stok?.stokAdi ?? ""),
                                        ],
                                      ),
                                      trailing: Text("${stok?.bakiye?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? 0} ${stok?.olcuBirimi ?? ""}"),
                                    ),
                                  );
                                }
                              });
                        })),
            ),
          ),
        ],
      ),
    );
  }

  void resetData() {
    viewModel.resetSayfa();
    viewModel.setDahaVarMi(true);
    viewModel.setStokListesi(null);
    getData();
  }

  void getData() async {
    viewModel.setDahaVarMi(false);
    GenericResponseModel response = await networkManager.dioPost<StokListesiModel>(path: ApiUrls.getStoklar, data: viewModel.stokBottomSheetModel.toJsonWithList(), bodyModel: StokListesiModel());
    if (response.success == true && response.data is List) {
      if (response.data?.length == parametreModel.sabitSayfalamaOgeSayisi) {
        viewModel.setDahaVarMi(true);
        viewModel.increaseSayfa();
      }
      viewModel.setStokListesi(response.data as List);
    }
  }

  Future<StokListesiModel?> getSelectedData(StokListesiModel? model) async {
    viewModel.setSelectedStokModel(model?.stokKodu ?? "");
    GenericResponseModel response =
        await networkManager.dioPost<StokListesiModel>(path: ApiUrls.getStoklar, data: viewModel.stokBottomSheetModel.toJsonWithList(), bodyModel: StokListesiModel(), showLoading: true);
    if (response.success == true) {
      return response.data.first;
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
