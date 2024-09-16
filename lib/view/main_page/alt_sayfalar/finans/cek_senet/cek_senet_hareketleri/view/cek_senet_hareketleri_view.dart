import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/view/base_scaffold.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "../model/cek_senet_hareketleri_model.dart";
import "../view_model/cek_senet_hareketleri_view_model.dart";

class CekSenetHareketleriView extends StatefulWidget {
  final CekSenetListesiModel model;
  const CekSenetHareketleriView({super.key, required this.model});

  @override
  State<CekSenetHareketleriView> createState() => _CekSenetHareketleriViewState();
}

class _CekSenetHareketleriViewState extends State<CekSenetHareketleriView> {
  CekSenetHareketleriViewModel viewModel = CekSenetHareketleriViewModel();

  @override
  void initState() {
    viewModel.setCekSenetListesiModel(widget.model);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(title: "Çek Senet Hareketleri (${viewModel.cekSenetHareketleriListesi?.length ?? 0})"),
          ),
        ),
        body: Observer(
          builder: (_) => ListView.builder(
            itemCount: viewModel.cekSenetHareketleriListesi?.length ?? 0,
            itemBuilder: (context, index) {
              if (viewModel.cekSenetHareketleriListesi == null) {
                return const Center(child: CircularProgressIndicator.adaptive());
              } else if ((viewModel.cekSenetHareketleriListesi?.length ?? 0) < 1) {
                return const Center(child: Text("Veri bulunamadı", textAlign: TextAlign.center));
              } else {
                final CekSenetHareketleriModel model = viewModel.cekSenetHareketleriListesi![index];
                return Card(
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text(model.belgeNo ?? ""), Text(model.tarih.toDateString)],
                        ),
                        Text(model.hesapKodu ?? ""),
                        Text(model.islemAdi ?? ""),
                      ],
                    ),
                    subtitle: LayoutBuilder(
                      builder: (context, constraints) => Wrap(
                        children: [
                          Text("Yeri:\n${model.yerAdi}"),
                          Text("Durumu:\n${model.durumAdi}"),
                          Text("Kayıt Yapan Kul:\n${model.kayityapankul ?? ""}"),
                        ]
                            .map(
                              (e) => SizedBox(
                                width: constraints.maxWidth / 2,
                                child: e,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                );
              }
            },
          ).paddingAll(UIHelper.lowSize),
        ),
      );
}
