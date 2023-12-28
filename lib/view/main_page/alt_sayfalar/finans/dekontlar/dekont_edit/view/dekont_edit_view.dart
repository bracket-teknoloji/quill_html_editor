import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/alt_sayfalar/genel/view/dekont_edit_genel_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/alt_sayfalar/kalemler/view/dekont_edit_kalemler_view.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/model/dekont_islemler_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/dekont_edit/view_model/dekont_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/dekontlar/model/dekont_listesi_model.dart";

class DekontEditView extends StatefulWidget {
  final BaseEditEnum baseEditEnum;
  final DekontListesiModel? model;
  const DekontEditView({super.key, required this.baseEditEnum, this.model});

  @override
  State<DekontEditView> createState() => _DekontEditViewState();
}

class _DekontEditViewState extends BaseState<DekontEditView> with SingleTickerProviderStateMixin {
  final DekontEditViewModel viewModel = DekontEditViewModel();
  late final TabController _tabController;

  @override
  void initState() {
    SingletonDekontIslemlerRequestModel.setInstance(DekontIslemlerRequestModel());
    if (widget.baseEditEnum == BaseEditEnum.ekle) {
      SingletonDekontIslemlerRequestModel.instance.yeniKayit = true;
      SingletonDekontIslemlerRequestModel.instance.dekontIslemTuru = "DSG";
      viewModel.setIslemTamamlandi(true);
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.baseEditEnum == BaseEditEnum.duzenle) {
        await viewModel.getData(widget.model!);
        SingletonDekontIslemlerRequestModel.instance.dekontIslemTuru = "DSG";
      }
    });
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      if (!SingletonDekontIslemlerRequestModel.instance.ilkSayfaTamamMi) {
        dialogManager.showErrorSnackBar("Genel bilgileri doldurun.");
        _tabController.animateTo(0);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          late final bool result;
          await dialogManager.showAreYouSureDialog(() async {
            result = true;
          });
          return result;
        },
        child: Scaffold(
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
              tabs: [
                const Tab(text: "Genel"),
                Tab(
                  child: Observer(
                    builder: (_) => Text("Kalemler (${viewModel.kalemSayisi})"),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Observer(
                builder: (_) {
                  if (!viewModel.islemTamamlandi) {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                  return DekontEditGenelView(
                    baseEditEnum: widget.baseEditEnum,
                    onChanged: (value) {},
                  );
                },
              ),
              DekontEditKalemlerView(
                baseEditEnum: widget.baseEditEnum,
                onChanged: viewModel.setKalemSayisi,
              ),
            ],
          ),
        ),
      );

  IconButton get saveButton => IconButton(
        onPressed: () async {
          if (SingletonDekontIslemlerRequestModel.instance.toplamAlacak.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) !=
              SingletonDekontIslemlerRequestModel.instance.toplamBorc.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)) {
            dialogManager.showErrorSnackBar("Alacak ve Borç eşit olmalıdır.");
          } else if (SingletonDekontIslemlerRequestModel.instance.kalemler.ext.isNullOrEmpty) {
            dialogManager.showErrorSnackBar("Kalem ekleyin.");
            _tabController.animateTo(1);
          } else {
            final result = await viewModel.postData();
            if (result.success ?? false) {
              dialogManager.showSuccessSnackBar("İşlem Başarılı");
              Get.back();
            }
          }
        },
        icon: const Icon(Icons.save_outlined),
      );
}
