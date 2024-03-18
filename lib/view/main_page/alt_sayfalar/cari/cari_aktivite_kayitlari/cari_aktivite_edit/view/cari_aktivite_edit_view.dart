import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/cari_aktivite_edit/alt_sayfalar/cari_aktivite_detay/view/cari_aktivite_detay_view.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/cari_aktivite_edit/alt_sayfalar/cari_aktivite_genel/view/cari_aktivite_genel_view.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/cari_aktivite_edit/view_model/cari_aktivite_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";

class CariAktiviteEditView extends StatefulWidget {
  final BaseEditModel<CariAktiviteListesiModel> model;
  const CariAktiviteEditView({super.key, required this.model});

  @override
  State<CariAktiviteEditView> createState() => _CariAktiviteEditViewState();
}

class _CariAktiviteEditViewState extends BaseState<CariAktiviteEditView> with TickerProviderStateMixin {
  final CariAktiviteEditViewModel viewModel = CariAktiviteEditViewModel();
  late final TabController tabController;
  CariAktiviteListesiModel get cariAktiviteModel => widget.model.model!;

  bool get kayitYetkisi => widget.model.baseEditEnum?.ekleMi == true ? yetkiController.cariAktiviteYeniKayit : yetkiController.cariAktiviteDuzenleme;

  bool get enabled => widget.model.baseEditEnum?.goruntuleMi != true;

  @override
  void initState() {
    tabController = TabController(length: yetkiController.cariAktiviteAtayabilir ? 2 : 1, vsync: this);
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
          title: AppBarTitle(
            title: "Cari Aktivite",
            subtitle: widget.model.baseEditEnum?.name,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                // if (formKey.currentState?.validate() == true) {
                final result = await viewModel.saveCariAktivite();
                if (result.success == true) {
                  dialogManager.showSuccessSnackBar(result.message ?? loc.generalStrings.success);
                  Get.back(result: true);
                  // }
                }
              },
              icon: const Icon(Icons.save_outlined),
            ).yetkiVarMi(kayitYetkisi && widget.model.baseEditEnum != BaseEditEnum.goruntule),
          ],
          bottom: !yetkiController.cariAktiviteAtayabilir
              ? null
              : TabBar(
                  controller: tabController,
                  tabs: [
                    const Tab(text: "Genel"),
                    const Tab(text: "Detay").yetkiVarMi(yetkiController.cariAktiviteAtayabilir),
                  ].whereNot((element) => element is SizedBox).toList(),
                ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            CariAktiviteGenelView(
              model: widget.model,
              onSave: (bool value) => value,
            ),
            const CariAktiviteDetayView().yetkiVarMi(yetkiController.cariAktiviteAtayabilir),
          ].whereNot((element) => element is SizedBox).toList(),
        ),
      );
}
