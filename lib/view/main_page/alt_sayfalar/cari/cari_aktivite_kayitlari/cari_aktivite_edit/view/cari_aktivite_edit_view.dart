import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/static_variables/singleton_models.dart";
import "../../model/cari_aktivite_listesi_model.dart";
import "../alt_sayfalar/cari_aktivite_detay/view/cari_aktivite_detay_view.dart";
import "../alt_sayfalar/cari_aktivite_genel/view/cari_aktivite_genel_view.dart";
import "../view_model/cari_aktivite_edit_view_model.dart";

class CariAktiviteEditView extends StatefulWidget {
  final BaseEditModel<CariAktiviteListesiModel> model;
  const CariAktiviteEditView({super.key, required this.model});

  @override
  State<CariAktiviteEditView> createState() => _CariAktiviteEditViewState();
}

class _CariAktiviteEditViewState extends BaseState<CariAktiviteEditView> with TickerProviderStateMixin {
  final CariAktiviteEditViewModel viewModel = CariAktiviteEditViewModel();
  late final TabController tabController;
  GlobalKey<FormState>? formKey;
  CariAktiviteListesiModel get cariAktiviteModel => widget.model.model!;

  bool get kayitYetkisi => widget.model.baseEditEnum?.ekleMi == true ? yetkiController.cariAktiviteYeniKayit : yetkiController.cariAktiviteDuzenleme;

  bool get enabled => widget.model.baseEditEnum?.goruntuleMi != true;

  @override
  void initState() {
    viewModel.baseEditEnum = widget.model.baseEditEnum;
    SingletonModels.setCariAktiviteListesi = cariAktiviteModel;
    tabController = TabController(length: yetkiController.cariAktiviteDetayliMi ? 2 : 1, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Cari Aktivite",
            subtitle: widget.model.baseEditEnum?.getName,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                tabController.animateTo(0);
                await Future.delayed(const Duration(milliseconds: 100));
                if (formKey?.currentState?.validate() == true) {
                  final result = await viewModel.saveCariAktivite();
                  if (result.isSuccess) {
                    dialogManager.showSuccessSnackBar(result.message ?? loc.generalStrings.success);
                    Get.back(result: true);
                  }
                }
              },
              icon: const Icon(Icons.save_outlined),
            ).yetkiVarMi(kayitYetkisi && widget.model.baseEditEnum != BaseEditEnum.goruntule),
          ],
          bottom: !yetkiController.cariAktiviteDetayliMi
              ? null
              : TabBar(
                  controller: tabController,
                  tabs: [
                    const Tab(text: "Genel"),
                    const Tab(text: "Detay").yetkiVarMi(yetkiController.cariAktiviteDetayliMi),
                  ].whereNot((element) => element is SizedBox).toList(),
                ),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            CariAktiviteGenelView(
              model: widget.model,
              onSave: (GlobalKey<FormState> value) => formKey = value,
            ),
            CariAktiviteDetayView(baseEditEnum: widget.model.baseEditEnum!).yetkiVarMi(yetkiController.cariAktiviteDetayliMi),
          ].whereNot((element) => element is SizedBox).toList(),
        ),
      );
}
