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
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_bottom_sheet_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

class SeriHareketleriView extends StatefulWidget {
  final StokListesiModel model;
  const SeriHareketleriView({super.key, required this.model});

  @override
  State<SeriHareketleriView> createState() => _SeriHareketleriViewState();
}

class _SeriHareketleriViewState extends BaseState<SeriHareketleriView> {
  late final TextEditingController _stokKoduController;
  SeriHareketleriViewModel viewModel = SeriHareketleriViewModel();

  @override
  void initState() {
    _stokKoduController = TextEditingController(text: widget.model.stokKodu ?? "");
    viewModel.setStokKodu(widget.model.stokKodu ?? "");
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              if (viewModel.isSearchBarOpened) {
                return const CustomAppBarTextField();
              }
              return AppBarTitle(
                title: "Seri Hareketleri (${viewModel.seriHareketleriList?.length ?? 0})",
                subtitle: widget.model.stokKodu,
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
                  title: loc(context).generalStrings.options,
                  children: [
                    BottomSheetModel(
                      title: loc(context).generalStrings.sort,
                      iconWidget: Icons.sort_by_alpha_outlined,
                      onTap: () async {
                        Get.back();
                        final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                          context,
                          groupValue: viewModel.requestModel.sirala,
                          title: loc(context).generalStrings.sort,
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
                        final result = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: widget.model.stokKodu));
                        if (result is StokListesiModel) {
                          dialogManager.showStokGridViewDialog(result);
                        }
                      },
                    ),
                  ],
                );
              },
              icon: Observer(
                builder: (_) => const Icon(Icons.more_vert_outlined),
              ),
            ),
          ],
        ),
        floatingActionButton: const CustomFloatingActionButton(isScrolledDown: true),
        body: Column(
          children: [
            CustomTextField(
              labelText: "Stok",
              readOnly: true,
              controller: _stokKoduController,
              suffixMore: true,
              onTap: () async {
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
                  viewModel.setStokKodu(result.stokKodu ?? "");
                  await viewModel.getData();
                }
              },
              suffix: Row(
                children: [
                  IconButton(
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
                ],
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (viewModel.seriHareketleriList == null) {
                    return const ListViewShimmer();
                  }
                  if (viewModel.seriHareketleriList!.isEmpty) {
                    return const Center(child: Text("Veri Bulunamadı"));
                  }
                  return ListView.builder(
                    itemCount: viewModel.seriHareketleriList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final SeriHareketleriModel item = viewModel.seriHareketleriList![index];
                      return Card(
                        child: ListTile(
                          title: Text(item.seriNo ?? ""),
                          subtitle: CustomLayoutBuilder(
                            splitCount: 2,
                            children: [
                              Text("Tarih: ${item.tarih?.toDateString ?? ""}"),
                              Text("Depo: ${item.depoKodu ?? ""} - ${item.depoTanimi ?? ""}"),
                              // Text("Tarih: ${item.seriNo ?? ""}"),
                              Text("Miktar: ${item.miktar.toIntIfDouble ?? ""}"),
                              Text("Açıklama: ${item.haracik ?? ""}"),
                              Text("Giriş/Çıkış: ${item.gckod ?? ""}"),
                              Text("Belge Tipi: ${item.belgeTipi ?? ""} - ${item.belgeTipiAdi ?? ""}"),
                              Text("Kayıt Tipi: ${item.kayitTipi ?? ""} - ${item.kayitTipiAdi ?? ""}"),
                              // Text("Şube: ${item. ?? ""}"),
                              Text("StHarInc: ${item.stharInc ?? ""}"),
                              Text("Belge No: ${item.belgeNo ?? ""}"),
                              // Text("Tarih: ${item.tarih?.toDateString ?? ""}"),
                              // Text("Tarih: ${item.tarih?.toDateString ?? ""}"),
                              // Text("Tarih: ${item.tarih?.toDateString ?? ""}"),
                            ],
                          ),
                          onTap: () async {
                            await bottomSheetDialogManager.showBottomSheetDialog(
                              context,
                              title: loc(context).generalStrings.options,
                              children: [
                                BottomSheetModel(title: loc(context).generalStrings.edit, iconWidget: Icons.edit_outlined, onTap: () {}),
                                BottomSheetModel(title: loc(context).generalStrings.delete, iconWidget: Icons.delete_outline, onTap: () {}),
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
          ],
        ).paddingAll(UIHelper.lowSize),
      );
}
