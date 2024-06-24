import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/barkod_tanimla/alt_sayfalar/barkod_kayitlari/view/barkod_tanimla_kayitlari_view.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/barkod_tanimla/alt_sayfalar/stok_karti/view/barkod_tanimla_stok_karti_view.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/barkod_tanimla/view_model/barkod_tanimla_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

final class BarkodTanimlaView extends StatefulWidget {
  const BarkodTanimlaView({super.key});

  @override
  State<BarkodTanimlaView> createState() => _BarkodTanimlaViewState();
}

final class _BarkodTanimlaViewState extends BaseState<BarkodTanimlaView> with TickerProviderStateMixin {
  late final TabController tabController;
  late final TextEditingController searchController;
  late final TextEditingController stokController;
  final BarkodTanimlaViewModel viewModel = BarkodTanimlaViewModel();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    searchController = TextEditingController();
    stokController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    searchController.dispose();
    stokController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(
            title: "Barkod Tanımla",
          ),
          actions: [
            IconButton(
              onPressed: saveStok,
              icon: const Icon(Icons.save_outlined),
            ),
          ],
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(text: "Stok Kartı"),
              Tab(text: "Barkod Kayıtları"),
            ],
          ),
        ),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: CustomTextField(
                labelText: "Stok Kodu/Barkod",
                controller: searchController,
                onSubmitted: updateStok,
                suffix: Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        final qr = await Get.toNamed("qr");
                        if (qr is String) {
                          await updateStok(qr);
                        }
                      },
                      icon: const Icon(Icons.qr_code_scanner_outlined),
                    ),
                    IconButton(
                      onPressed: () async {
                        final stok = await Get.toNamed("/mainPage/stokListesiOzel");
                        if (stok is StokListesiModel) {
                          await updateStok(stok.stokKodu!);
                        }
                      },
                      icon: const Icon(Icons.more_horiz_outlined),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: CustomTextField(
                labelText: "Stok",
                controller: stokController,
                valueWidget: Observer(builder: (_) => Text(viewModel.stokModel?.stokKodu ?? "")),
                isMust: true,
                readOnly: true,
                suffix: IconButton(
                  onPressed: () {
                    if (viewModel.stokModel == null) {
                      dialogManager.showAlertDialog("Önce stok seçiniz.");
                      return;
                    }
                    dialogManager.showStokGridViewDialog(viewModel.stokModel);
                  },
                  icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                ),
              ),
            ),
          ],
          body: TabBarView(
            controller: tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Observer(
                builder: (_) => BarkodTanimlaStokKartiView(
                  model: viewModel.stokModel,
                  onChanged: viewModel.setStokModel,
                ),
              ),
              Observer(
                builder: (_) => BarkodTanimlaKayitlariView(model: viewModel.stokModel),
              ),
            ],
          ),
        ).paddingAll(UIHelper.lowSize),
      );

  Future<void> saveStok() async {
    if (viewModel.stokModel == null) {
      dialogManager.showAlertDialog("Stok Seçilmedi. Lütfen Stok Seçiniz.");
      return;
    }

    final result = await viewModel.savesStok();
    if (result) {
      viewModel.setStokModel(StokListesiModel(stokKodu: searchController.text, stokAdi: stokController.text));
      dialogManager.showSuccesDialog("Stok Başarıyla Kaydedildi.");
      tabController.animateTo(1);
    }
  }

  Future<void> updateStok(String stokKodu) async {
    searchController.text = stokKodu;
    await viewModel.getStok(stokKodu);
    if (viewModel.stokModel == null) return;
    stokController.text = viewModel.stokModel!.stokAdi ?? viewModel.stokModel!.stokKodu ?? "";
  }
}
