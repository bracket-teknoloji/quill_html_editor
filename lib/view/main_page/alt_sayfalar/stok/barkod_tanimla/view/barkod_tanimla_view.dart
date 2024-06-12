import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/barkod_tanimla/alt_sayfalar/barkod_kayitlari/view/barkod_tanimla_kayitlari_view.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/barkod_tanimla/alt_sayfalar/stok_karti/view/barkod_tanimla_stok_karti_view.dart";

class BarkodTanimlaView extends StatefulWidget {
  const BarkodTanimlaView({super.key});

  @override
  State<BarkodTanimlaView> createState() => _BarkodTanimlaViewState();
}

class _BarkodTanimlaViewState extends BaseState<BarkodTanimlaView> with TickerProviderStateMixin {
  late final TabController tabController;
  late final TextEditingController searchController;
  late final TextEditingController stokController;

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
            IconButton(onPressed: () {}, icon: const Icon(Icons.save_outlined)),
          ],
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(text: "Stok Kartı"),
              Tab(text: "Barkod Kayıtları"),
            ],
          ),
        ),
        body: Column(
          children: [
            CustomTextField(
              labelText: "Stok Kodu/Barkod",
              controller: searchController,
            ),
            CustomTextField(
              labelText: "Stok",
              controller: stokController,
            ),
            Expanded(
              child: TabBarView(
                controller: tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  BarkodTanimlaStokKartiView(),
                  BarkodTanimlaKayitlariView(),
                ],
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );
}
