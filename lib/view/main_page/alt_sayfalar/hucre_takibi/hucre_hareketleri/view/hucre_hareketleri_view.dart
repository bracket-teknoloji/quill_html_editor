import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/components/button/elevated_buttons/footer_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_hareketleri/view_model/hucre_hareketleri_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

final class HucreHareketleriView extends StatefulWidget {
  final StokListesiModel model;
  const HucreHareketleriView({super.key, required this.model});

  @override
  State<HucreHareketleriView> createState() => _HucreHareketleriViewState();
}

final class _HucreHareketleriViewState extends State<HucreHareketleriView> {
  final HucreHareketleriViewModel viewModel = HucreHareketleriViewModel();

  @override
  void initState() {
    viewModel.setStokKodu(widget.model.stokKodu);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) => AppBarTitle(
              title: "Hücre Hareketleri (${viewModel.hucreHareketleriListesi?.length ?? 0})",
              subtitle: widget.model.stokKodu,
            ),
          ),
        ),
        bottomNavigationBar: BottomBarWidget(
          isScrolledDown: true,
          children: [
            FooterButton(
              children: [
                const Text("Giriş"),
                Observer(
                  builder: (_) => Text(viewModel.toplamGiris.toString()),
                ),
              ],
            ),
            FooterButton(
              children: [
                const Text("Çıkış"),
                Observer(
                  builder: (_) => Text(viewModel.toplamCikis.toString()),
                ),
              ],
            ),
            FooterButton(
              children: [
                const Text("Bakiye"),
                Observer(
                  builder: (_) => Text(viewModel.bakiye.toString(), style: TextStyle(color: UIHelper.getColorWithValue(viewModel.bakiye.toDouble()))),
                ),
              ],
            ),
          ],
        ),
        body: body(),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: viewModel.getData,
        child: Observer(
          builder: (_) {
            if (viewModel.hucreHareketleriListesi == null) return const ListViewShimmer();
            if (viewModel.hucreHareketleriListesi!.isEmpty) return const Center(child: Text("Hücre hareketi bulunamadı!"));
            return ListView.builder(
              itemCount: viewModel.hucreHareketleriListesi!.length,
              itemBuilder: (context, index) {
                final item = viewModel.hucreHareketleriListesi![index];
                return Card(
                  child: ListTile(
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Text(item.kayittarihi?.toDateTimeString() ?? "")),
                        Column(
                          children: [
                            Text("${item.netMiktar} AD", style: TextStyle(color: UIHelper.getColorWithValue(item.gc == "G" ? 1 : -1))),
                            Icon(item.gc == "G" ? Icons.arrow_back : Icons.arrow_forward, color: UIHelper.getColorWithValue(item.gc == "G" ? 1 : -1)),
                          ],
                        ),
                      ],
                    ),
                    subtitle: CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        Text("Belge No: ${item.stharFisno}").yetkiVarMi(item.stharFisno != null),
                        Text("Stok Kodu: ${item.stokKodu}").yetkiVarMi(item.stokKodu != null),
                        Text("YapKod: ${item.yapkod}").yetkiVarMi(item.yapkod != null),
                        Text("Hücre: ${item.hucreKodu}").yetkiVarMi(item.hucreKodu != null),
                        Text("Depo: ${item.depoTanimi}").yetkiVarMi(item.depoTanimi != null),
                        Text("Hareket Türü: ${item.hareketTuru}").yetkiVarMi(item.hareketTuru != null),
                        Text("Kaydeden: ${item.kayityapankul}").yetkiVarMi(item.kayityapankul != null),
                        Text("Kayıt No: ${item.inckeyno}").yetkiVarMi(item.inckeyno != null),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      );
}
