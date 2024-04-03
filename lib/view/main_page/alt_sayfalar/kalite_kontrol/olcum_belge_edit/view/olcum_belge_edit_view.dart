import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/view/view_model/olcum_belge_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/model/olcum_girisi_listesi_model.dart";

class OlcumBelgeEditView extends StatefulWidget {
  final OlcumGirisiListesiModel model;
  const OlcumBelgeEditView({super.key, required this.model});

  @override
  State<OlcumBelgeEditView> createState() => _OlcumBelgeEditViewState();
}

final class _OlcumBelgeEditViewState extends BaseState<OlcumBelgeEditView> {
  final OlcumBelgeEditViewModel viewModel = OlcumBelgeEditViewModel();

  @override
  void initState() {
    viewModel.setRequestModel(widget.model);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Ölçüm Detayı",
            subtitle: widget.model.belgeNo,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc.generalStrings.options,
                  children: [
                    BottomSheetModel(
                      title: "Proses Ekle",
                      iconWidget: Icons.add_outlined,
                      onTap: () async {
                        Get.back();
                        Get.toNamed("/mainPage/prosesEkle");
                      },
                    ),
                  ],
                );
              },
              icon: const Icon(Icons.more_vert_outlined),
            ),
          ],
        ),
        floatingActionButton: CustomFloatingActionButton(
          isScrolledDown: true,
          onPressed: () async {
            final result = await Get.toNamed("/mainPage/olcumEkle", arguments: widget.model);
            if (result == null) {}
          },
        ),
        body: Observer(
          builder: (_) {
            if (viewModel.model == null) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  child: ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${viewModel.belgeModel?.stokAdi}").yetkiVarMi(viewModel.belgeModel?.stokAdi != null),
                        ColorfulBadge(
                          label: Text("${viewModel.belgeModel?.sira}"),
                          badgeColorEnum: BadgeColorEnum.cari,
                        ).yetkiVarMi(viewModel.belgeModel?.sira != null),
                      ],
                    ),
                    subtitle: CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        Text("Belge Tipi: ${viewModel.belgeModel?.belgeTipi}").yetkiVarMi(viewModel.belgeModel?.belgeTipi != null),
                        Text("Stok Kodu: ${viewModel.belgeModel?.stokKodu}").yetkiVarMi(viewModel.belgeModel?.stokKodu != null),
                        Text("Tarih: ${viewModel.belgeModel?.tarih.toDateString}").yetkiVarMi(viewModel.belgeModel?.tarih != null),
                        Text("Miktar: ${viewModel.belgeModel?.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}").yetkiVarMi(viewModel.belgeModel?.miktar != null),
                      ],
                    ),
                  ),
                ),
                Text("Prosesler", style: theme.textTheme.bodyLarge).paddingAll(UIHelper.lowSize).yetkiVarMi(viewModel.model?.prosesler.ext.isNotNullOrEmpty ?? false),
                Expanded(
                  flex: 2,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.model?.prosesler?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = viewModel.model?.prosesler?[index];
                      return Card(
                        child: SizedBox(
                          width: context.width * 0.8,
                          height: 300,
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(item?.proses ?? ""),
                                const Icon(Icons.engineering_outlined),
                              ],
                            ),
                            subtitle: Wrap(
                              children: [
                                Text("Kriter: ${item?.kriter}", overflow: TextOverflow.ellipsis).yetkiVarMi(item?.kriter != null),
                                CustomLayoutBuilder(
                                  splitCount: 2,
                                  children: [
                                    Text("Kabul Şartı: ${item?.kabulSarti}", overflow: TextOverflow.ellipsis).yetkiVarMi(item?.kabulSarti != null),
                                    Text("Tolerans: ${item?.tolerans}", overflow: TextOverflow.ellipsis).yetkiVarMi(item?.tolerans != null),
                                    Text("Ölçüm Sıklığı: ${item?.olcumSikligi}", overflow: TextOverflow.ellipsis).yetkiVarMi(item?.olcumSikligi != null),
                                    Text("Ekipman: ${item?.ekipman}", overflow: TextOverflow.ellipsis).yetkiVarMi(item?.ekipman != null),
                                    Text("Numune Miktarı: ${item?.numuneMiktari.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}", overflow: TextOverflow.ellipsis)
                                        .yetkiVarMi(item?.numuneMiktari != null),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ).yetkiVarMi(viewModel.model?.prosesler.ext.isNotNullOrEmpty ?? false),
                Text("Ölçümler", style: theme.textTheme.bodyLarge).paddingAll(UIHelper.lowSize).yetkiVarMi(viewModel.model?.olcumler.ext.isNotNullOrEmpty ?? false),
                Expanded(
                  flex: 7,
                  child: viewModel.model?.olcumler?.isEmpty == true
                      ? const Center(
                          child: Text("Ölçüm kaydı bulunamadı"),
                        )
                      : ListView.builder(
                          itemCount: viewModel.model?.olcumler?.length ?? 0,
                          itemBuilder: (context, index) {
                            final item = viewModel.model?.olcumler?[index];
                            return Card(
                              child: ListTile(
                                title: Text("Ölçüm ${index + 1}"),
                                subtitle: CustomLayoutBuilder(
                                  splitCount: 2,
                                  children: [
                                    Text("Kaydeden: ${item?.kayityapankul}").yetkiVarMi(item?.kayityapankul != null),
                                    Text("Kayıt Tarihi: ${item?.kayittarihi?.toDateString}").yetkiVarMi(item?.kayittarihi != null),
                                    Text("Operatör: ${item?.olcumlerOperator}").yetkiVarMi(item?.olcumlerOperator != null),
                                  ],
                                ),
                              ),
                            );
                          },
                        ).yetkiVarMi(viewModel.model?.olcumler.ext.isNotNullOrEmpty ?? false),
                ),
              ],
            ).paddingAll(UIHelper.lowSize);
          },
        ),
      );
}
