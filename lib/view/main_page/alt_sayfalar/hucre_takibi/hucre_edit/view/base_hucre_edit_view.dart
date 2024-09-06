import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/hucre_takibi_islem_turu_enum.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_edit/alt_sayfalar/base_hucre_genel/view/base_hucre_genel_view.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_edit/alt_sayfalar/base_hucre_kalemler/view/base_hucre_kalemler_view.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_edit/view_model/hucre_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/hucre_takibi/hucre_transferi/model/hucre_transferi_model.dart";

class BaseHucreEditView extends StatefulWidget {
  final HucreTakibiIslemTuruEnum islemTuru;
  const BaseHucreEditView({super.key, required this.islemTuru});

  @override
  State<BaseHucreEditView> createState() => _BaseHucreEditViewState();
}

class _BaseHucreEditViewState extends BaseState<BaseHucreEditView> with TickerProviderStateMixin {
  final HucreEditViewModel viewModel = HucreEditViewModel();
  late final TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    SingletonModels.hucreTransferiModel = HucreTransferiModel();
    SingletonModels.hucreTransferiModel.islemTuru = widget.islemTuru.kodu;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      tabController.addListener(() {
        if (tabController.indexIsChanging && tabController.index == 1 && !SingletonModels.hucreTransferiModel.kalemlereGidilsinMi) {
          dialogManager.showAlertDialog("Gerekli alanları doldurunuz");
          tabController.animateTo(0);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    SingletonModels.hucreTransferiModel = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: widget.islemTuru.getName,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (!SingletonModels.hucreTransferiModel.isValid) return dialogManager.showAlertDialog("Lütfen formu eksiksiz doldurunuz!");
                final result = await viewModel.sendData();
                if (result) {
                  SingletonModels.hucreTransferiModel = HucreTransferiModel(islemTuru: widget.islemTuru.kodu);
                  tabController.animateTo(0);
                  dialogManager.showSuccessSnackBar("İşlem başarıyla gerçekleştirildi");
                }
              },
              icon: const Icon(Icons.save_outlined),
            ),
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
          physics: const NeverScrollableScrollPhysics(),
          controller: tabController,
          children: [
            BaseHucreGenelView(tabController: tabController),
            const BaseHucreKalemlerView(),
          ],
        ),
      );
}
