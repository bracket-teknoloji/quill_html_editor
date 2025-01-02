// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/seri_islemleri/seri_hareketleri/model/seri_hareketleri_model.dart";
import "package:picker/core/base/view/seri_islemleri/seri_hareketleri/view_model/seri_hareketleri_view_model.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_bottom_sheet_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

class SeriHareketleriView extends StatefulWidget {
  const SeriHareketleriView({required this.model, super.key});
  final StokListesiModel? model;

  @override
  State<SeriHareketleriView> createState() => _SeriHareketleriViewState();
}

class _SeriHareketleriViewState extends BaseState<SeriHareketleriView> {
  late final TextEditingController _stokKoduController;
  SeriHareketleriViewModel viewModel = SeriHareketleriViewModel();

  @override
  void initState() {
    _stokKoduController = TextEditingController(text: widget.model?.stokKodu ?? "");
    if (widget.model != null) {
      viewModel.setStokListesiModel(widget.model!);
    }
    viewModel.setStokKodu(widget.model?.stokKodu ?? "");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(context),
        floatingActionButton: fab(),
        body: body().paddingAll(UIHelper.lowSize),
      );

  AppBar appBar(BuildContext context) => AppBar(
        title: Observer(
          builder: (_) {
            if (viewModel.isSearchBarOpened) {
              return CustomAppBarTextField(onChanged: viewModel.setSearchQuery);
            }
            return AppBarTitle(
              title: "Seri Hareketleri (${viewModel.seriHareketleriList?.length ?? 0})",
              subtitle: widget.model?.stokKodu,
            );
          },
        ),
        actions: [
          IconButton(
            onPressed: () => viewModel.setIsSearchBarOpened(),
            icon: Observer(
              builder: (_) => Icon(viewModel.isSearchBarOpened ? Icons.search_off_outlined : Icons.search_outlined),
            ),
          ),
          IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: loc.generalStrings.options,
                children: [
                  BottomSheetModel(
                    title: loc.generalStrings.sort,
                    iconWidget: Icons.sort_by_alpha_outlined,
                    onTap: () async {
                      Get.back();
                      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                        context,
                        groupValue: viewModel.requestModel.sirala,
                        title: loc.generalStrings.sort,
                        children: List.generate(
                          viewModel.siralaMap.length,
                          (index) => BottomSheetModel(
                            title: viewModel.siralaMap.keys.toList()[index],
                            value: viewModel.siralaMap.values.toList()[index],
                            groupValue: viewModel.siralaMap[viewModel.siralaMap.keys.toList()[index]],
                          ),
                        ),
                      );
                      if (result is String) {
                        viewModel.setSirala(result);
                        await viewModel.getData();
                      }
                    },
                  ),
                  BottomSheetModel(
                    title: "Stok İşlemleri",
                    iconWidget: Icons.list_alt,
                    onTap: () async {
                      Get.back();
                      if (viewModel.stokListesiModel == null) {
                        dialogManager.showAlertDialog("Önce Stok Ekleyin");
                        return;
                      }
                      final result = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: widget.model?.stokKodu));
                      if (result is StokListesiModel) {
                        dialogManager.showStokGridViewDialog(result);
                      }
                    },
                  ),
                ],
              );
            },
            icon: const Icon(Icons.more_vert_outlined),
          ),
        ],
      );

  Widget fab() => CustomFloatingActionButton(
        isScrolledDown: true,
        onPressed: () async {
          if (viewModel.stokListesiModel == null) {
            dialogManager.showAlertDialog("Önce Stok Ekleyin");
            return;
          }
          final result = await Get.toNamed("/seriGirisi", arguments: SeriHareketleriModel.ekle(viewModel.stokListesiModel!));
          if (result == true) {
            await viewModel.getData();
          }
        },
      );

  Column body() => Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => Observer(
              builder: (_) => ToggleButtons(
                constraints: BoxConstraints.expand(width: (constraints.maxWidth - UIHelper.midSize - 4) / 2),
                //TODO BU ne amk selected'ı düzelt
                isSelected: viewModel.selectedActionType,
                onPressed: (index) {
                  if (viewModel.selectedActionType[index]) {
                    return;
                  }
                  viewModel.onActionTypeChanged(index);
                  _stokKoduController.clear();
                  viewModel
                    ..setSeriNo(null)
                    ..setStokKodu(null);
                },
                children: const [
                  Text("Stok Kodundan"),
                  Text("Seriden"),
                ],
              ),
            ),
          ).paddingSymmetric(vertical: UIHelper.lowSize),
          Observer(
            builder: (_) => CustomTextField(
              labelText: viewModel.selectedActionType.first ? "Stok" : "Seri",
              readOnly: viewModel.selectedActionType.first,
              controller: _stokKoduController,
              suffixMore: true,
              onChanged: (value) {
                if (value.isEmpty) {
                  return;
                }
                if (viewModel.selectedActionType.first) {
                  viewModel
                    ..setSeriNo(null)
                    ..setStokKodu(value);
                } else {
                  viewModel
                    ..setSeriNo(null)
                    ..setSeriNo(value);
                }
              },
              onTap: !viewModel.selectedActionType.first
                  ? null
                  : () async {
                      final result = await Get.toNamed(
                        "/mainPage/stokListesiOzel",
                        arguments: StokBottomSheetModel(
                          seriTakibiVar: "E",
                          resimGoster: "E",
                          menuKodu: "STOK_SREH",
                        ),
                      );
                      if (result is StokListesiModel) {
                        _stokKoduController.text = result.stokKodu ?? "";
                        viewModel
                          ..stokListesiModel = result
                          ..setStokKodu(result.stokKodu ?? "");
                        await viewModel.getData();
                      }
                    },
              suffix: IconButton(
                onPressed: () async {
                  final result = await Get.toNamed("/qr");
                  if (result is String) {
                    _stokKoduController.text = result;
                    viewModel.setStokKodu(result);
                    await viewModel.getData();
                  }
                },
                icon: const Icon(Icons.qr_code_scanner),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator.adaptive(
              onRefresh: () async => await viewModel.getData(),
              child: Observer(
                builder: (_) {
                  if (viewModel.seriHareketleriList == null) {
                    return const ListViewShimmer();
                  }
                  if (viewModel.filteredList!.isEmpty) {
                    return const Center(child: Text("Veri Bulunamadı"));
                  }
                  return ListView.builder(
                    itemCount: viewModel.filteredList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final SeriHareketleriModel item = viewModel.filteredList![index];
                      return Card(
                        color: (item.gckod == "G" ? ColorPalette.mantis : ColorPalette.persianRed).withOpacity(0.5),
                        child: ListTile(
                          title: Text(item.seriNo ?? ""),
                          subtitle: CustomLayoutBuilder(
                            splitCount: 2,
                            children: [
                              Text("Tarih: ${item.tarih?.toDateString ?? ""}"),
                              if (item.depoKodu != null) Text("Depo: ${item.depoKodu ?? ""} - ${item.depoTanimi ?? ""}"),
                              if (item.acik1 != null) Text("Açıklama 1: ${item.acik1 ?? ""}"),
                              if (item.acik2 != null) Text("Açıklama 2: ${item.acik2 ?? ""}"),
                              Text("Depo: ${item.depoKodu ?? ""} - ${item.depoTanimi ?? ""}"),
                              Text("Miktar: ${item.miktar.toIntIfDouble ?? ""}"),
                              if (item.haracik != null) Text("Açıklama: ${item.haracik ?? ""}"),
                              if (item.gckod != null) Text("Giriş/Çıkış: ${item.gckod ?? ""}"),
                              if (item.belgeTipi != null) Text("Belge Tipi: ${item.belgeTipi ?? ""} - ${item.belgeTipiAdi ?? ""}"),
                              if (item.kayitTipi != null) Text("Kayıt Tipi: ${item.kayitTipi ?? ""} - ${item.kayitTipiAdi ?? ""}"),
                              // Text("Şube: ${item. ?? ""}"),
                              if (item.stharInc != null) Text("StHarInc: ${item.stharInc ?? ""}"),
                              if (item.belgeNo != null) Text("Belge No: ${item.belgeNo ?? ""}"),
                            ].whereType<Text>().toList(),
                          ),
                          onTap: () async {
                            await bottomSheetDialogManager.showBottomSheetDialog(
                              context,
                              title: loc.generalStrings.options,
                              children: [
                                BottomSheetModel(
                                  title: loc.generalStrings.edit,
                                  iconWidget: Icons.edit_outlined,
                                  onTap: () async {
                                    Get.back();
                                    if (item.devirMi) {
                                      final result = await Get.toNamed("/seriGirisi", arguments: item.copyWith(islemKodu: 8));
                                      if (result == true) {
                                        await viewModel.getData();
                                      }
                                    } else {
                                      islemHataDialog();
                                    }
                                  },
                                ),
                                BottomSheetModel(
                                  title: loc.generalStrings.delete,
                                  iconWidget: Icons.delete_outline,
                                  onTap: () async {
                                    Get.back();
                                    if (item.devirMi) {
                                      dialogManager.showAreYouSureDialog(() async {
                                        final result = await viewModel.deleteSeriHareket(item);
                                        if (result) {
                                          dialogManager.showAlertDialog(loc.generalStrings.success);
                                          await viewModel.getData();
                                        }
                                      });
                                    } else {
                                      islemHataDialog();
                                    }
                                  },
                                ),
                                BottomSheetModel(
                                  title: "Stok İşlemleri",
                                  iconWidget: Icons.list_alt,
                                  onTap: () async {
                                    Get.back();
                                    final result = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: item.stokKodu));
                                    if (result is StokListesiModel) {
                                      dialogManager.showStokGridViewDialog(result);
                                    }
                                  },
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      );

  void islemHataDialog() => dialogManager.showAlertDialog("Sadece kayıt tipi D-Devir olan kayıtlara işlem yapılabilir.");
}
