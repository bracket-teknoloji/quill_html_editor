import "package:flutter/material.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_edit/alt_sayfalar/base_hucre_genel/view/base_hucre_genel_view.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_edit/alt_sayfalar/base_hucre_kalemler/view/base_hucre_kalemler_view.dart";

class BaseHucreEditView extends StatefulWidget {
  const BaseHucreEditView({super.key});

  @override
  State<BaseHucreEditView> createState() => _BaseHucreEditViewState();
}

class _BaseHucreEditViewState extends State<BaseHucreEditView> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(
            title: "Hücre Yerleştir",
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.save_outlined)),
          ],
          bottom: TabBar(
            controller: tabController,
            tabs: const [
              Tab(text: "Genel"),
              Tab(text: "Kalemler"),
            ],
          ),
        ),
        body: TabBarView(
          controller: tabController,
          children: const [
            BaseHucreGenelView(),
            BaseHucreKalemlerView(),
          ],
        ),
      );
}
