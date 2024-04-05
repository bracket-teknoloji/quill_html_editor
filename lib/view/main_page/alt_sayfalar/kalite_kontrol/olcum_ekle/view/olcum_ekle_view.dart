import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_ekle_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/view_model/olcum_ekle_view_model.dart";

class OlcumEkleView extends StatefulWidget {
  final OlcumBelgeEditModel model;
  const OlcumEkleView({super.key, required this.model});

  @override
  State<OlcumEkleView> createState() => _OlcumEkleViewState();
}

class _OlcumEkleViewState extends BaseState<OlcumEkleView> {
  final OlcumEkleViewModel viewModel = OlcumEkleViewModel();

  @override
  void initState() {
    viewModel.setRequestModel(OlcumEkleModel.fromOlcumGirisiModel(widget.model.olcumModel!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Ölçüm Ekle",
            subtitle: viewModel.requestModel.belgeTipi,
          ),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.save_outlined))],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                title: Text("Belge No: ${viewModel.requestModel.belgeNo ?? ""}"),
                subtitle: CustomLayoutBuilder(
                  splitCount: 2,
                  children: [
                    Text("Sıra: ${widget.model.olcumModel?.sira}"),
                    Text("Belge Tipi: ${widget.model.olcumModel?.belgeTipi ?? ""}"),
                    Text("Tarih: ${widget.model.olcumModel?.tarih.toDateString}"),
                    Text("Stok Adı: ${widget.model.olcumModel?.stokAdi}"),
                    Text("Stok Kodu: ${widget.model.olcumModel?.stokKodu}"),
                    // Text(widget.model.stok ?? ""),
                  ],
                ),
              ),
            ),
            Text("Prosesler", style: theme.textTheme.bodyLarge).paddingAll(UIHelper.lowSize),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.model.prosesler?.length ?? 0,
                itemBuilder: (context, index) {
                  final proses = widget.model.prosesler![index];
                  return Card(
                    // color: cardColor(viewModel.requestModel.prosesler?.where((element) => element.prosesId == proses.id).firstOrNull),
                    child: ListTile(
                      onTap: () async {
                        final result = await Get.toNamed("/mainPage/prosesEkle", arguments: proses);
                        if (result is OlcumEkleProsesModel) {
                          viewModel.addProsesModel(result);
                        }
                      },
                      title: Observer(
                        builder: (_) {
                          final eklenenProses = viewModel.requestModel.prosesler?.where((element) => element.prosesId == proses.id).firstOrNull;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(proses.proses ?? ""),
                              ColorfulBadge(
                                label: Text(eklenenProses.sonucAdi),
                                badgeColorEnum: eklenenProses.cardColor,
                              ).yetkiVarMi(eklenenProses != null),
                            ],
                          );
                        },
                      ),
                      subtitle: CustomLayoutBuilder(
                        splitCount: 2,
                        children: [
                          Text("Kriter: ${proses.kriter}"),
                          Text("Açıklama: ${proses.kabulSarti}"),
                          Text("Tarih: ${proses.kriter}"),
                          Text("Ekipman: ${proses.ekipman}"),
                          Text("Sonuç: ${viewModel.requestModel.prosesler?.where((element) => element.prosesId == proses.id).firstOrNull?.sonucAdi}"),
                        ],
                      ),
                      trailing: Observer(
                        builder: (_) => Icon(viewModel.requestModel.prosesler?.any((element) => element.prosesId == proses.id) ?? false ? Icons.check_box_outlined : Icons.check_box_outline_blank),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );
}
