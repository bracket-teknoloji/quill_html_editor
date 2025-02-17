import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../stok_liste/model/stok_listesi_model.dart";
import "../alt_sayfalar/barkod_kayitlari/view/barkod_tanimla_kayitlari_view.dart";
import "../alt_sayfalar/stok_karti/view/barkod_tanimla_stok_karti_view.dart";
import "../view_model/barkod_tanimla_view_model.dart";

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
    int tabLength = 0;
    if (yetkiController.stokBarkodStokKartiGorunsun) tabLength++;
    if (yetkiController.stokBarkodKayitlari) tabLength++;
    tabController = TabController(length: tabLength, vsync: this);
    searchController = TextEditingController();
    stokController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (tabLength == 0) {
        await dialogManager.showAlertDialog(
          "Barkod alanlarına yetkili değilsiniz. Profil tanımlama ekranından görünecek alanlara yetki vermelisiniz.",
        );
        Get.back();
      }
    });
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
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "Barkod Tanımla"),
      actions: [
        if (yetkiController.stokBarkodStokKartiGorunsun && yetkiController.stokBarkodEkle)
          IconButton(onPressed: saveStok, icon: const Icon(Icons.save_outlined)),
      ],
      bottom:
          yetkiController.stokBarkodStokKartiGorunsun
              ? TabBar(
                controller: tabController,
                tabs: [
                  if (yetkiController.stokBarkodStokKartiGorunsun) const Tab(text: "Stok Kartı"),
                  if (yetkiController.stokBarkodKayitlari) const Tab(text: "Barkod Kayıtları"),
                ],
              )
              : null,
    ),
    body: NestedScrollView(
      headerSliverBuilder:
          (context, innerBoxIsScrolled) => [
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
        children:
            [
              if (yetkiController.stokBarkodStokKartiGorunsun)
                Observer(
                  builder:
                      (_) => BarkodTanimlaStokKartiView(model: viewModel.stokModel, onChanged: viewModel.setStokModel),
                ),
              if (yetkiController.stokBarkodKayitlari)
                Observer(builder: (_) => BarkodTanimlaKayitlariView(model: viewModel.stokModel)),
            ].where((element) => element is! SizedBox).toList(),
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
