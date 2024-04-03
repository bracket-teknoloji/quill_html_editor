import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_ekle_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/view_model/olcum_ekle_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/model/olcum_girisi_listesi_model.dart";

class OlcumEkleView extends StatefulWidget {
  final OlcumGirisiListesiModel model;
  const OlcumEkleView({super.key, required this.model});

  @override
  State<OlcumEkleView> createState() => _OlcumEkleViewState();
}

class _OlcumEkleViewState extends BaseState<OlcumEkleView> {
  final OlcumEkleViewModel viewModel = OlcumEkleViewModel();
  late final TextEditingController belgeNoController;

  @override
  void initState() {
    viewModel.setRequestModel(OlcumEkleModel.fromOlcumGirisiModel(widget.model));
    belgeNoController = TextEditingController(text: viewModel.requestModel.belgeNo);
    super.initState();
  }

  @override
  void dispose() {
    belgeNoController.dispose();
    super.dispose();
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  title: Text("Belge No: ${viewModel.requestModel.belgeNo ?? ""}"),
                  subtitle: CustomLayoutBuilder(
                    splitCount: 2,
                    children: [
                      Text("Belge Tipi: ${widget.model.belgeTipi ?? ""}"),
                      Text("Tarih: ${widget.model.tarih.toDateString}"),
                      Text("Stok Adı: ${widget.model.stokAdi}"),
                      Text("Stok Kodu: ${widget.model.stokKodu}"),
                      // Text(widget.model.stok ?? ""),
                    ],
                  ),
                ),
              ),
              // Expanded(child: V)
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );
}
