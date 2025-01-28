import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_edit/alt_sayfalar/transfer_mal_talebi_genel/view/transfer_mal_talebi_genel_view.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_edit/alt_sayfalar/transfer_mal_talebi_kalemler/view/transfer_mal_talebi_kalemler_view.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_edit/view_model/transfer_mal_talebi_edit_view_model.dart";

class TransferMalTalebiEditView extends StatefulWidget {
  const TransferMalTalebiEditView({required this.model, super.key});

  final BaseEditModel<BaseSiparisEditModel> model;

  @override
  State<TransferMalTalebiEditView> createState() => _TransferMalTalebiEditViewState();
}

class _TransferMalTalebiEditViewState extends BaseState<TransferMalTalebiEditView> with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  final TransferMalTalebiEditViewModel viewModel = TransferMalTalebiEditViewModel();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    if (widget.model.model != null) {
      viewModel.setModel(widget.model.model!);
      BaseSiparisEditModel.setInstance(widget.model.model!);
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model.enable) {
        await viewModel.getData(widget.model.model?.id ?? 0);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    BaseSiparisEditModel.resetInstance();
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
          if (widget.model.baseEditEnum?.goruntuleMi != true) IconButton(onPressed: () {}, icon: const Icon(Icons.save_outlined)),
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
          Observer(
            builder: (_) => viewModel.model != null ? TransferMalTalebiGenelView(model: widget.model) : const Center(child: CircularProgressIndicator.adaptive()),
          ),
          const TransferMalTalebiKalemlerView(),
        ],
      );
}
