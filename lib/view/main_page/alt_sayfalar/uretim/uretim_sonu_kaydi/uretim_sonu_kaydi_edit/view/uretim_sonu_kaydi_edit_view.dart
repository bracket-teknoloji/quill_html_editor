import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/alt_sayfalar/uretim_sonu_kaydi_edit_genel/view/uretim_sonu_kaydi_edit_genel_view.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/alt_sayfalar/uretim_sonu_kaydi_edit_kalemler/view/uretim_sonu_kaydi_edit_kalemler_view.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/view_model/uretim_sonu_kaydi_edit_view_model.dart";

final class UretimSonuKaydiEditView extends StatefulWidget {
  final BaseEditModel<KalemModel> model;
  const UretimSonuKaydiEditView({super.key, required this.model});

  @override
  State<UretimSonuKaydiEditView> createState() => _UretimSonuKaydiEditViewState();
}

final class _UretimSonuKaydiEditViewState extends BaseState<UretimSonuKaydiEditView> with TickerProviderStateMixin {
  final UretimSonuKaydiEditViewModel viewModel = UretimSonuKaydiEditViewModel();
  late final TabController tabController;

  @override
  void initState() {
    viewModel.setBelgeNo(widget.model.model?.belgeNo);
    tabController = TabController(length: tabSize, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getKalemler();
    });
    super.initState();
  }

  int get tabSize => yetkiController.uretimSonuKalemliYapi ? 2 : 1;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Üretim Sonu Kaydı",
            subtitle: widget.model.baseEditEnum?.getName,
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.save_outlined)).yetkiVarMi(tabController.index == tabSize),
          ],
          bottom: yetkiController.uretimSonuKalemliYapi
              ? TabBar(
                  controller: tabController,
                  tabs: [
                    Tab(text: loc.generalStrings.general),
                    Observer(
                      builder: (_) => Tab(text: "Kalemler (${viewModel.kalemList?.length ?? 0})"),
                    ),
                  ],
                )
              : null,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            UretimSonuKaydiEditGenelView(model: widget.model),
            UretimSonuKaydiEditKalemlerView(kalemList: viewModel.kalemList).yetkiVarMi(yetkiController.uretimSonuKalemliYapi),
          ].where((element) => element is! SizedBox).toList(),
        ).paddingAll(UIHelper.lowSize),
      );
}
