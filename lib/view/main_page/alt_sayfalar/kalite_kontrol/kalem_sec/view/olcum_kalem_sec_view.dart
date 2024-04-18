import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/kalem_sec/view_model/olcum_kalem_sec_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";

class OlcumKalemSecView extends StatefulWidget {
  final OlcumBelgeModel model;
  const OlcumKalemSecView({super.key, required this.model});

  @override
  State<OlcumKalemSecView> createState() => _OlcumKalemSecViewState();
}

class _OlcumKalemSecViewState extends BaseState<OlcumKalemSecView> {
  OlcumKalemSecViewModel viewModel = OlcumKalemSecViewModel();

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
            title: "Kalem Seç",
            subtitle: widget.model.belgeNo,
          ),
        ),
        body: Observer(
          builder: (_) {
            if (viewModel.olcumGirisiListesi == null) {
              return const ListViewShimmer();
            }
            if (viewModel.olcumGirisiListesi?.isEmpty ?? false) {
              return const Center(
                child: Text("Kalem bulunamadı!"),
              );
            }
            return ListView.builder(
              itemCount: viewModel.olcumGirisiListesi?.length ?? 0,
              itemBuilder: (context, index) {
                final OlcumBelgeModel item = viewModel.olcumGirisiListesi![index];
                return Card(
                  child: ListTile(
                    onTap: () async {
                      if (!item.prosesVarMi) {
                        dialogManager.showErrorSnackBar("Bu kalemin prosesi bulunmamaktadır.");
                      } else {
                        Get.toNamed("/mainPage/olcumDetay", arguments: item);
                      }
                    },
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.stokAdi ?? "", overflow: TextOverflow.ellipsis, maxLines: 1),
                        ColorfulBadge(
                          label: Text("Proses ${item.prosesVarMi ? "Var" : "Yok"}"),
                          badgeColorEnum: item.prosesVarMi ? BadgeColorEnum.basarili : BadgeColorEnum.hata,
                        ),
                      ],
                    ),
                    subtitle: CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        Text("Stok Kodu: ${item.stokKodu ?? ""}"),
                        Text("Sıra: ${item.sira ?? ""}"),
                        Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                      ],
                    ),
                  ),
                );
              },
            ).paddingAll(UIHelper.lowSize);
          },
        ),
      );
}
