import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/core/constants/static_variables/static_variables.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/sayilanlar_listesi/view/sayim_sayilanlar_view.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/sayim_girisi/view/sayim_girisi_view.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/view_model/sayim_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";

class SayimEditView extends StatefulWidget {
  final SayimListesiModel model;
  const SayimEditView({super.key, required this.model});

  @override
  State<SayimEditView> createState() => _SayimEditViewState();
}

class _SayimEditViewState extends BaseState<SayimEditView> with TickerProviderStateMixin {
  late final TabController controller;
  SayimListesiModel get model => widget.model..filtre = null;
  final SayimEditViewModel viewModel = SayimEditViewModel();

  @override
  void initState() {
    SingletonModels.setSayimListesi = model;
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      viewModel.setTabIndex(controller.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Sayım",
            subtitle: "Depo: ${widget.model.depoKodu}",
          ),
          actions: [
            // IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
            Observer(
              builder: (_) => IconButton(
                onPressed: () async => await saveSayim(),
                icon: const Icon(Icons.save_outlined),
              ).yetkiVarMi(viewModel.indexSifirMi),
            ),
          ],
          bottom: TabBar(
            controller: controller,
            tabs: const [
              Tab(
                child: Text("Sayım Girişi"),
              ),
              Tab(
                child: Text("Sayılanlar"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            SayimGirisiView(onStokSelected: saveSayim),
            SayimSayilanlarView(onEdit: onEdit),
          ],
        ),
      );

  Future<void> saveSayim() async {
    if (!StaticVariables.instance.isSayimValid) {
      dialogManager.showErrorSnackBar("Gerekli alanları doldurunuz.");
      return;
    }
    final result = await viewModel.sendData(model.depoKodu!);
    if (result.success == true) {
      SingletonModels.setSayimListesi = SingletonModels.sayimListesi?..filtre = SayimFiltreModel(islemKodu: 1, belgeNo: model.fisno);
      dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
      controller.animateTo(1);
    }
  }

  Future<void> onEdit(SayimFiltreModel model) async {
    final stok = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: model.stokKodu));
    SingletonModels.setSayimListesi = SingletonModels.sayimListesi?.copyWith(
      filtre: model.copyWith(fisno: null, belgeNo: model.fisno, kayittarihi: null, kayityapankul: null, cevrim: null, islemKodu: 1),
      stokModel: stok,
    );
    controller.animateTo(0);
  }
}
