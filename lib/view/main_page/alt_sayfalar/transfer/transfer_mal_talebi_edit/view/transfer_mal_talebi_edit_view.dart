import "package:flutter/material.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_edit/alt_sayfalar/transfer_mal_talebi_genel/view/transfer_mal_talebi_genel_view.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_listesi/model/transfer_mal_talebi_listesi_model.dart";

class TransferMalTalebiEditView extends StatefulWidget {
  const TransferMalTalebiEditView({required this.model, super.key});

  final BaseEditModel<TransferMalTalebiListesiModel> model;

  @override
  State<TransferMalTalebiEditView> createState() => _TransferMalTalebiEditViewState();
}

class _TransferMalTalebiEditViewState extends BaseState<TransferMalTalebiEditView> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: AppBarTitle(
          title: "Depo Talep Detayı",
          subtitle: widget.model.baseEditEnum?.getName,
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.save_outlined)),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: loc.generalStrings.general),
            const Tab(text: "Kalemler"),
          ],
        ),
      );

  TabBarView body() => TabBarView(
        controller: _tabController,
        children: [
          const TransferMalTalebiGenelView(),
          const Center(child: Text("Tab 1")),
        ],
      );
}
