import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/core/init/network/login/api_urls.dart";
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

class _SayimEditViewState extends BaseState<SayimEditView> with SingleTickerProviderStateMixin {
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
                onPressed: () async {
                  final result = await networkManager.dioPost(path: ApiUrls.saveSayim, bodyModel: SayimListesiModel(), data: SingletonModels.sayimListesi?.filtre?.toJson());
                  if (result.success == true) {
                    SingletonModels.setSayimListesi
                    dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
                  }
                },
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
          children: const [
            SayimGirisiView(),
            SayimSayilanlarView(),
          ],
        ),
      );
}
