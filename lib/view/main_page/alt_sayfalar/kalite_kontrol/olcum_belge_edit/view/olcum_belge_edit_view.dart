import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
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
                Text("Ölçümler", style: theme.textTheme.bodyLarge).paddingAll(UIHelper.lowSize).yetkiVarMi(viewModel.model?.olcumler.ext.isNotNullOrEmpty ?? false),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: viewModel.model?.olcumler?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = viewModel.model?.olcumler?[index];
                      return Card(
                        child: SizedBox(
                          width: width * 0.4,
                          child: ListTile(
                            title: Text("Ölçüm ${index + 1}"),
                            subtitle: CustomLayoutBuilder(
                              splitCount: 1,
                              children: [
                                Text("Kaydeden: ${item?.kayityapankul}").yetkiVarMi(item?.kayityapankul != null),
                                Text("Kayıt Tarihi: ${item?.kayittarihi?.toDateString}").yetkiVarMi(item?.kayittarihi != null),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ).yetkiVarMi(viewModel.model?.olcumler.ext.isNotNullOrEmpty ?? false),
                Text("Prosesler", style: theme.textTheme.bodyLarge).paddingAll(UIHelper.lowSize).yetkiVarMi(viewModel.model?.prosesler.ext.isNotNullOrEmpty ?? false),
                Expanded(
                  flex: 5,
                  child: ListView.builder(
                    itemCount: viewModel.model?.prosesler?.length ?? 0,
                    itemBuilder: (context, index) {
                      final item = viewModel.model?.prosesler?[index];
                      return Card(
                        child: ListTile(
                          title: Text(item?.proses ?? ""),
                          subtitle: CustomLayoutBuilder(
                            splitCount: 2,
                            children: [
                              Text("Kriter: ${item?.kriter}").yetkiVarMi(item?.kriter != null),
                              Text("Kabul Şartı: ${item?.kabulSarti}").yetkiVarMi(item?.kabulSarti != null),
                              Text("Tolerans: ${item?.tolerans}").yetkiVarMi(item?.tolerans != null),
                              Text("Ölçüm Sıklığı: ${item?.olcumSikligi}").yetkiVarMi(item?.olcumSikligi != null),
                              Text("Ekipman: ${item?.ekipman}").yetkiVarMi(item?.ekipman != null),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ).yetkiVarMi(viewModel.model?.prosesler.ext.isNotNullOrEmpty ?? false),
              ],
            ).paddingAll(UIHelper.lowSize);
          },
        ),
      );
}
