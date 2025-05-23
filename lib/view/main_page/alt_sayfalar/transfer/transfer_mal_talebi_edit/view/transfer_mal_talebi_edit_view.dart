import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_edit/alt_sayfalar/transfer_mal_talebi_genel/view/transfer_mal_talebi_genel_view.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_edit/alt_sayfalar/transfer_mal_talebi_kalemler/view/transfer_mal_talebi_kalemler_view.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_edit/view_model/transfer_mal_talebi_edit_view_model.dart";

final class TransferMalTalebiEditView extends StatefulWidget {
  const TransferMalTalebiEditView({required this.model, super.key});

  final BaseEditModel<BaseSiparisEditModel> model;

  @override
  State<TransferMalTalebiEditView> createState() => _TransferMalTalebiEditViewState();
}

final class _TransferMalTalebiEditViewState extends BaseState<TransferMalTalebiEditView>
    with SingleTickerProviderStateMixin {
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
      if (!widget.model.isEkle) {
        await viewModel.getData(widget.model.model?.id ?? 0);
      } else {
        viewModel.setModel(BaseSiparisEditModel());
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
  Widget build(BuildContext context) => BaseScaffold(appBar: appBar(), body: body());

  AppBar appBar() => AppBar(
    title: AppBarTitle(title: "Depo Talep Detayı", subtitle: widget.model.baseEditEnum?.getName),
    actions: [
      if (widget.model.baseEditEnum?.goruntuleMi != true)
        IconButton(
          onPressed: () async {
            if (BaseSiparisEditModel.instance.kalemler.isEmptyOrNull) {
              dialogManager.showErrorSnackBar("En az bir kalem eklemelisiniz");
              return;
            }
            if (BaseSiparisEditModel.instance.hedefSube == null) {
              dialogManager.showErrorSnackBar("Karşı şube seçmelisiniz");
              return;
            }
            if (BaseSiparisEditModel.instance.depoKodu == null) {
              dialogManager.showErrorSnackBar("Giriş depo seçmelisiniz");
              return;
            }
            dialogManager.showAreYouSureDialog(
              onYes: () async {
                final result = await viewModel.save(widget.model.isEkle);
                if (result) {
                  Get.back(result: true);
                  dialogManager.showSuccessSnackBar("İşlem başarılı");
                }
              },
            );
          },
          icon: const Icon(Icons.save_outlined),
        ),
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
        builder: (_) => viewModel.model != null
            ? TransferMalTalebiGenelView(model: widget.model)
            : const Center(child: CircularProgressIndicator.adaptive()),
      ),
      Observer(
        builder: (_) => TransferMalTalebiKalemlerView(model: widget.model..model = BaseSiparisEditModel.instance),
      ),
    ],
  );
}
