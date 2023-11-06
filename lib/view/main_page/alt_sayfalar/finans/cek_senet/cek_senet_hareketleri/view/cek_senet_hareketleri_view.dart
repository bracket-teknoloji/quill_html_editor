import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_hareketleri/model/cek_senet_hareketleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_hareketleri/view_model/cek_senet_hareketleri_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_model.dart";

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
  Widget build(BuildContext context) => Scaffold(
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
                        Text(model.belgeNo ?? ""),
                        Text(model.hesapKodu ?? ""),
                        Text(model.islemAdi ?? ""),
                      ],
                    ),
                    subtitle: LayoutBuilder(
                      builder: (context, constraints) => Wrap(
                        children: [
                          Text("Yeri: ${model.yeri ?? ""}"),
                          Text("Durumu: ${model.durum ?? ""}"),
                          Text("Kayıt Yapan Kul: ${model.kayityapankul ?? ""}"),
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
                    trailing: Text(model.tarih.toDateString),
                  ),
                );
              }
            },
          ),
        ),
      );
}
