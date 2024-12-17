import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../../view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";
import "../../../../../components/bottom_bar/bottom_bar.dart";
import "../../../../../components/button/elevated_buttons/footer_button.dart";
import "../../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../components/layout/custom_layout_builder.dart";
import "../../../../../components/wrap/appbar_title.dart";
import "../../../../../constants/enum/edit_tipi_enum.dart";
import "../../../../../constants/extensions/date_time_extensions.dart";
import "../../../../../constants/extensions/number_extensions.dart";
import "../../../../../constants/extensions/widget_extensions.dart";
import "../../../../../constants/ui_helper/ui_helper.dart";
import "../../../../state/base_state.dart";
import "../model/seri_detayi_model.dart";
import "../view_model/seri_listesi_view_model.dart";

class SeriListesiView extends StatefulWidget {
  const SeriListesiView({super.key, required this.kalemModel});
  final KalemModel kalemModel;

  @override
  State<SeriListesiView> createState() => _SeriListesiViewState();
}

class _SeriListesiViewState extends BaseState<SeriListesiView> {
  late final SeriListesiViewModel viewModel;
  @override
  void initState() {
    viewModel = SeriListesiViewModel(widget.kalemModel);
    viewModel.setKalemModel(widget.kalemModel);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getStok();
      if (((BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false ? viewModel.stokModel?.seriCikistaOtomatikMi : viewModel.stokModel?.seriCikistaOtomatikMi) ?? false) &&
          viewModel.kalanMiktar != 0) {
        dialogManager.showAreYouSureDialog(
          () async {
            await seriNoUret();
          },
          title: "Otomatik Seri Üretilsin Mi?",
        );
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Seri Listesi",
              subtitle: viewModel.kalemModel.seriList?.length.toStringIfNotNull ?? "0",
            ),
          ),
          actions: [
            // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
            IconButton(
              onPressed: () {
                if (viewModel.kalanMiktar == 0) {
                  Get.back(result: viewModel.kalemModel.seriList);
                } else {
                  dialogManager.showErrorSnackBar("Kalan Miktar (${viewModel.kalanMiktar})");
                }
              },
              icon: const Icon(Icons.check_outlined),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder: (_) => Text(
                "Stok Adı: ${viewModel.stokModel?.stokAdi ?? ""}",
                overflow: TextOverflow.ellipsis,
              ).paddingAll(UIHelper.lowSize),
            ),
            Text("Stok Kodu: ${viewModel.kalemModel.stokKodu ?? ""}").paddingAll(UIHelper.lowSize),
            Text("Depo Kodu: ${viewModel.kalemModel.depoKodu ?? 0}").paddingAll(UIHelper.lowSize),
            Observer(
              builder: (_) => const Card(
                child: ListTile(
                  leading: Icon(Icons.info_outline),
                  title: Text("Her 1 miktar için seri giriniz."),
                ),
              ).yetkiVarMi(viewModel.stokModel?.seriMiktarKadarSor == true),
            ),
            Observer(
              builder: (_) => Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        // ignore: prefer_typing_uninitialized_variables
                        dynamic result;
                        if (viewModel.kalemModel.isUsk == true) {
                          result = await Get.toNamed(
                            "/seriRehberiUSK",
                            arguments: viewModel.stokModel
                              ?..depoKodu = widget.kalemModel.depoKodu
                              ..belgeTarihi = widget.kalemModel.tarih,
                          );
                        } else {
                          result = await Get.toNamed("/seriRehberi", arguments: viewModel.stokModel?..depoKodu = widget.kalemModel.depoKodu);
                        }
                        if (result is! SeriList) return;
                        final result2 = await Get.toNamed(
                          "/seriDetayi",
                          arguments: SeriDetayiModel(
                            kalanMiktar: viewModel.kalanMiktar,
                            hareketMiktari: viewModel.hareketMiktari,
                            miktarKadarSor: viewModel.stokModel?.seriMiktarKadarSor,
                            seriList: result..seri1 = result.seriNo,
                          ),
                        );
                        if (result2 is SeriList) {
                          viewModel.addSeriList(result2);
                        }
                      },
                      label: const Text("Seri Rehberi"),
                      icon: const Icon(
                        Icons.safety_divider,
                        size: UIHelper.midSize * 2,
                      ),
                    ).paddingAll(UIHelper.lowSize),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        final result = await Get.toNamed(
                          "/seriDetayi",
                          arguments: SeriDetayiModel(
                            kalanMiktar: viewModel.kalanMiktar,
                            hareketMiktari: viewModel.hareketMiktari,
                            miktarKadarSor: viewModel.stokModel?.seriMiktarKadarSor,
                          ),
                        );
                        if (result is SeriList) {
                          viewModel.addSeriList(result);
                        }
                      },
                      label: const Text("Seri Girişi"),
                      icon: const Icon(
                        Icons.edit_outlined,
                        size: UIHelper.midSize * 2,
                      ),
                    ).paddingAll(UIHelper.lowSize),
                  ),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: seriNoUret,
                      label: const Text("Seri Üret"),
                      icon: const Icon(
                        Icons.add_outlined,
                        size: UIHelper.midSize * 2,
                      ),
                    ).paddingAll(UIHelper.lowSize),
                  ).yetkiVarMi((BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false ? viewModel.stokModel?.seriCikistaOtomatikMi : viewModel.stokModel?.seriCikistaOtomatikMi) ?? false),
                ],
              ).yetkiVarMi(viewModel.kalanMiktar != 0 || viewModel.kalemModel.seriList.ext.isNullOrEmpty),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (viewModel.kalemModel.seriList.ext.isNullOrEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.dashboard_outlined),
                          Text("Seri Listesi Boş"),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    itemCount: viewModel.kalemModel.seriList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final SeriList model = viewModel.kalemModel.seriList![index];
                      return Card(
                        child: ListTile(
                          title: Text(model.seri1 ?? model.seriNo ?? ""),
                          subtitle: CustomLayoutBuilder(
                            splitCount: 2,
                            children: [
                              Text("Miktar: ${model.miktar.toIntIfDouble.toStringIfNotNull ?? ""}"),
                              Text("Son Kul. Tarihi: ${model.sonKullanmaTarihi?.toDateString ?? ""}").yetkiVarMi(model.sonKullanmaTarihi != null),
                            ],
                          ),
                          onTap: () async {
                            await bottomSheetDialogManager.showBottomSheetDialog(
                              context,
                              title: model.seri1 ?? "",
                              children: [
                                BottomSheetModel(
                                  title: loc.generalStrings.edit,
                                  iconWidget: Icons.edit_outlined,
                                  onTap: () async {
                                    Get.back();
                                    final result = await Get.toNamed(
                                      "/seriDetayi",
                                      arguments: SeriDetayiModel(
                                        kalanMiktar: (viewModel.kalanMiktar.toDouble() + (model.miktar ?? 0)).toInt(),
                                        hareketMiktari: viewModel.hareketMiktari,
                                        seriList: model,
                                      ),
                                    );
                                    if (result is SeriList) {
                                      viewModel.updateSeriList(result, model.seri1 ?? "");
                                    }
                                  },
                                ),
                                BottomSheetModel(
                                  title: loc.generalStrings.delete,
                                  iconWidget: Icons.delete_outline_outlined,
                                  onTap: () {
                                    Get.back();
                                    dialogManager.showAreYouSureDialog(() {
                                      viewModel.removeSeriList(model.seri1 ?? "");
                                    });
                                  },
                                ),
                                BottomSheetModel(title: loc.generalStrings.print, iconWidget: Icons.print_outlined),
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
        bottomNavigationBar: bottomBar(),
      );

  Future<void> seriNoUret() async {
    final result = await viewModel.seriNoUret();
    if (result != null) {
      viewModel.addSeriList(
        SeriList(
          seri1: result.seriNo,
          miktar: viewModel.kalanMiktar.toDouble(),
        ),
      );
    }
  }

  BottomBarWidget bottomBar() => BottomBarWidget(
        isScrolledDown: true,
        children: [
          FooterButton(
            children: [
              const Text("Hareket Miktarı"),
              Observer(
                builder: (_) => Text(viewModel.hareketMiktari.toString()),
              ),
            ],
          ),
          FooterButton(
            children: [
              const Text("Kalan Miktar"),
              Observer(
                builder: (_) => Text(viewModel.kalanMiktar.toString()),
              ),
            ],
          ),
        ],
      );
}
