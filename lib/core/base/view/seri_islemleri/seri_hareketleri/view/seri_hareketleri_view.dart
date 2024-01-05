import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/seri_islemleri/seri_hareketleri/model/seri_hareketleri_model.dart";
import "package:picker/core/base/view/seri_islemleri/seri_hareketleri/view_model/seri_hareketleri_view_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

class SeriHareketleriView extends StatefulWidget {
  final StokListesiModel model;
  const SeriHareketleriView({super.key, required this.model});

  @override
  State<SeriHareketleriView> createState() => _SeriHareketleriViewState();
}

class _SeriHareketleriViewState extends BaseState<SeriHareketleriView> {
  SeriHareketleriViewModel viewModel = SeriHareketleriViewModel();

  @override
  void initState() {
    viewModel.setStokKodu(widget.model.stokKodu ?? "");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              if (viewModel.isSearchBarOpened) {
                return const CustomAppBarTextField();
              }
              return AppBarTitle(
                title: "Seri Hareketleri (${viewModel.seriHareketleriList?.length ?? 0})",
                subtitle: widget.model.stokKodu,
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () => viewModel.changeIsSearchBarOpened(),
              icon: Observer(
                builder: (_) => Icon(viewModel.isSearchBarOpened ? Icons.search_off_outlined : Icons.search_outlined),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Observer(
                builder: (_) => const Icon(Icons.more_vert_outlined),
              ),
            ),
          ],
        ),
        floatingActionButton: const CustomFloatingActionButton(isScrolledDown: true),
        body: Column(
          children: [
            const CustomTextField(
              labelText: "Stok",
              suffix: Row(
                children: [
                  Icon(Icons.qr_code_scanner),
                  Icon(Icons.qr_code_scanner),
                ],
              ),
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  if (viewModel.seriHareketleriList == null) {
                    return const ListViewShimmer();
                  }
                  if (viewModel.seriHareketleriList!.isEmpty) {
                    return const Center(child: Text("Veri Bulunamadı"));
                  }
                  return ListView.builder(
                    itemCount: viewModel.seriHareketleriList?.length ?? 0,
                    itemBuilder: (context, index) {
                      final SeriHareketleriModel item = viewModel.seriHareketleriList![index];
                      return Card(
                        child: ListTile(
                          title: Text(item.seriNo ?? ""),
                          subtitle: CustomLayoutBuilder(
                            splitCount: 2,
                            children: [
                              Text("Tarih: ${item.tarih?.toDateString ?? ""}"),
                              Text("Depo: ${item.depoKodu ?? ""} - ${item.depoTanimi ?? ""}"),
                              // Text("Tarih: ${item.seriNo ?? ""}"),
                              Text("Miktar: ${item.miktar.toIntIfDouble ?? ""}"),
                              Text("Açıklama: ${item.haracik ?? ""}"),
                              Text("Giriş/Çıkış: ${item.gckod ?? ""}"),
                              Text("Belge Tipi: ${item.belgeTipi ?? ""} - ${item.belgeTipiAdi ?? ""}"),
                              Text("Kayıt Tipi: ${item.kayitTipi ?? ""} - ${item.kayitTipiAdi ?? ""}"),
                              // Text("Şube: ${item. ?? ""}"),
                              Text("StHarInc: ${item.stharInc ?? ""}"),
                              Text("Belge No: ${item.belgeNo ?? ""}"),
                              // Text("Tarih: ${item.tarih?.toDateString ?? ""}"),
                              // Text("Tarih: ${item.tarih?.toDateString ?? ""}"),
                              // Text("Tarih: ${item.tarih?.toDateString ?? ""}"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );
}
