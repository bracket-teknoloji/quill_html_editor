import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/fiyat_ozeti/model/stok_fiyat_ozeti_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/fiyat_ozeti/view_model/fiyat_ozeti_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

final class FiyatOzetiView extends StatefulWidget {
  final StokListesiModel model;
  const FiyatOzetiView({super.key, required this.model});

  @override
  State<FiyatOzetiView> createState() => _FiyatOzetiViewState();
}

final class _FiyatOzetiViewState extends State<FiyatOzetiView> {
  final FiyatOzetiViewModel viewModel = FiyatOzetiViewModel();

  @override
  void initState() {
    viewModel.setRequestModel(StokFiyatOzetiRequestModel.fromStokListesiModel(widget.model));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: AppBarTitle(
          title: "Fiyat Özeti",
          subtitle: widget.model.stokKodu,
        ),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.setStokFiyatOzetiListesi(null);
          await viewModel.getData();
        },
        child: Observer(
          builder: (_) {
            if (viewModel.grupList == null) return const ListViewShimmer();
            if (viewModel.grupList?.isEmpty ?? true) return const Center(child: Text("Veri Bulunamadı"));
            return ListView.builder(
              itemCount: viewModel.grupList?.length ?? 0,
              itemBuilder: (context, index) {
                final grup = viewModel.grupList![index];
                return Column(
                  children: [
                    Text(grup ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                    ...List.generate(viewModel.grupMap[grup ?? ""]?.length ?? 0, (index) {
                      final stok = viewModel.grupMap[grup ?? ""]![index];
                      return Card(
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(stok.tip?.toUpperCase() ?? "", style: const TextStyle(color: UIHelper.primaryColor)),
                              Text(stok.tarih.toDateString),
                            ],
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(stok.cariAdi ?? ""),
                              CustomLayoutBuilder(
                                splitCount: 2,
                                children: [
                                  Text("Net Fiyat\n${stok.fiyat?.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat)} ${stok.dovizAdi}"),
                                  Text("Brüt Fiyat\n${stok.brutFiyat?.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat)} ${stok.dovizAdi}"),
                                ],
                              ),
                            ],
                          ),
                          // subtitle: Text(stok.fiyat.toStringAsFixed(2)),
                          // trailing: Text(stok.stokKodu),
                        ),
                      );
                    }),
                  ],
                );
              },
            ).paddingAll(UIHelper.lowSize);
          },
        ),
      );
}
