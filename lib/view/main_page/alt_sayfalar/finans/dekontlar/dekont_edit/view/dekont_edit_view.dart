import "dart:developer";

import "package:flutter/material.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/alt_sayfalar/genel/view/dekont_edit_genel_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/alt_sayfalar/kalemler/view/dekont_edit_kalemler_view.dart";

class DekontEditView extends StatefulWidget {
  final BaseEditEnum baseEditEnum;
  const DekontEditView({super.key, required this.baseEditEnum});

  @override
  State<DekontEditView> createState() => _DekontEditViewState();
}

class _DekontEditViewState extends State<DekontEditView> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: tabs.length, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _tabController.addListener(() {
        if (_tabController.indexIsChanging) {
          log("Tab Changed: ${_tabController.index}");
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Genel Dekont",
            subtitle: widget.baseEditEnum.name,
          ),
          actions: [
            saveButton,
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: children,
        ),
      );

  IconButton get saveButton => IconButton(onPressed: () {}, icon: const Icon(Icons.save_outlined));

  final List<Tab> tabs = [
    const Tab(text: "Genel"),
    const Tab(text: "Kalemler"),
  ];

  final List<Widget> children = [
    const DekontEditGenelView(),
    const DekontEditKalemlerView(),
  ];
}
