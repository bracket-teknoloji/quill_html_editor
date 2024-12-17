import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";

import "../../../../../../core/base/view/base_scaffold.dart";
import "../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../core/components/button/elevated_buttons/footer_button.dart";
import "../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../stok/stok_liste/model/stok_listesi_model.dart";
import "../view_model/hucre_hareketleri_view_model.dart";

final class HucreHareketleriView extends StatefulWidget {
  const HucreHareketleriView({required this.model, super.key});
  final StokListesiModel model;

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
  Widget build(BuildContext context) => BaseScaffold(
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
