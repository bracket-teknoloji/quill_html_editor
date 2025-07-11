import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/view/base_stok_edit_ek_bilgiler/view/base_stok_edit_ek_bilgiler_view.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../stok_liste/model/stok_listesi_model.dart";
import "../model/save_stok_model.dart";
import "../model/stok_detay_model.dart";
import "../view_model/base_stok_edit_view_model.dart";
import "base_stok_edit_fiyat/view/base_stok_edit_fiyat_view.dart";
import "base_stok_edit_fiyat_listesi/view/base_stok_edit_fiyat_listesi_view.dart";
import "base_stok_edit_genel/view/base_stok_edit_genel_view.dart";
import "base_stok_edit_seriler/view/base_stok_edit_seriler_view.dart";

final class BaseStokEditingView extends StatefulWidget {
  const BaseStokEditingView({super.key, this.appBarTitle, this.appBarSubtitle, this.isSubTitleSmall, this.model});
  final String? appBarTitle;
  final String? appBarSubtitle;
  final bool? isSubTitleSmall;
  // final List<Widget>? actions;
  final BaseEditModel<StokListesiModel>? model;

  @override
  State<BaseStokEditingView> createState() => _BaseStokEditingViewState();
}

final class _BaseStokEditingViewState extends BaseState<BaseStokEditingView> with TickerProviderStateMixin {
  final BaseStokEditingViewModel viewModel = BaseStokEditingViewModel();
  late final TabController _tabController;
  int get tabLength => tabPages.length;

  @override
  void initState() {
    viewModel.setStokListesiModel(widget.model?.model);
    if (viewModel.stokListesiModel?.alisDovTip case (null || 0)) {
      viewModel.stokListesiModel
        ?..alisDovTip = 0
        ..alisDovizAdi = mainCurrency;
    }
    if (viewModel.stokListesiModel?.satDovTip case (null || 0)) {
      viewModel.stokListesiModel
        ?..satDovTip = 0
        ..satisDovizAdi = mainCurrency;
    }
    viewModel.stokListesiModel?.subeKodu ??= -1;
    _tabController = TabController(length: tabLength, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model?.baseEditEnum != BaseEditEnum.ekle) {
        await viewModel.getData();
        if (widget.model?.baseEditEnum.kopyalaMi ?? false) {
          widget.model?.model?.stokKodu = null;
        }
      } else {
        viewModel.setIsSuccess(true);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    StokListesiModel.setInstance(null);
    SaveStokModel.setInstance(null);
    StokDetayModel.setInstance(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    onPopInvokedWithResult: (didPop, value) async {
      if (didPop) {
        return;
      }
      if (widget.model?.baseEditEnum.goruntuleMi ?? false) {
        Get.back(result: true);
        return;
      }
      await dialogManager.showAreYouSureDialog(onYes: () => Get.back(result: true));
    },
    child: DefaultTabController(
      length: tabLength,
      child: BaseScaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: widget.appBarTitle ?? "Stok Detayları",
            subtitle: widget.appBarSubtitle ?? widget.model?.model?.stokAdi ?? "",
          ),
          actions: [
            Visibility(
              visible: kaydetButonuYetki,
              child: IconButton(
                onPressed: () async {
                  if (validate.isEmpty) {
                    dialogManager.showAreYouSureDialog(onYes: postData);
                  } else {
                    dialogManager.showEmptyFieldDialog(
                      validate.keys,
                      onOk: () => _tabController.animateTo(validate.values.first),
                    );
                  }
                },
                icon: const Icon(Icons.save_outlined),
              ),
            ),
          ],
          bottom: TabBar(controller: _tabController, tabs: tabs),
        ),
        body: TabBarView(controller: _tabController, children: tabPages),
      ),
    ),
  );

  List<Widget> get tabPages => [
    Observer(
      builder: (_) {
        if (viewModel.isSuccess) {
          return BaseStokEditGenelView(model: widget.model?.baseEditEnum);
        } else {
          return const Center(child: CircularProgressIndicator.adaptive());
        }
      },
    ),
    if (widget.model!.baseEditEnum != BaseEditEnum.ekle &&
        widget.model!.baseEditEnum != BaseEditEnum.kopyala &&
        yetkiController.stokFiyatGoster)
      const BaseStokEditFiyatListesiView(),
    if (yetkiController.stokFiyatGoster) BaseStokEditFiyatView(model: widget.model?.baseEditEnum),
    if (parametreModel.mapStokKullSahalar != null) BaseStokEditEkBilgilerView(model: widget.model?.baseEditEnum),
    BaseStokEditSerilerView(model: widget.model?.baseEditEnum),
  ];

  List<Widget> get tabs => [
    Tab(child: Text(loc.generalStrings.general)),
    if (widget.model!.baseEditEnum != BaseEditEnum.ekle &&
        widget.model!.baseEditEnum != BaseEditEnum.kopyala &&
        yetkiController.stokFiyatGoster)
      const Tab(child: Text("Fiyat Listesi", maxLines: 2, textAlign: TextAlign.center)),
    if (yetkiController.stokFiyatGoster) const Tab(child: Text("Fiyat")),
    if (parametreModel.mapStokKullSahalar != null)
      const Tab(child: Text("Ek Bilgiler", maxLines: 2, textAlign: TextAlign.center)),
    const Tab(child: Text("Seriler")),
  ];

  Future<void> postData() async {
    final StokListesiModel model = StokListesiModel.instance;
    final SaveStokModel saveStokModel = SaveStokModel.fromStokListesiModel(model)
      ..yeniKayit =
          widget.model?.baseEditEnum == BaseEditEnum.ekle || widget.model?.baseEditEnum == BaseEditEnum.kopyala;
    if (widget.model?.baseEditEnum == BaseEditEnum.ekle) {
      saveStokModel.islemKodu = 1;
    }
    final result = await networkManager.dioPost<SaveStokModel>(
      path: ApiUrls.saveStok,
      bodyModel: SaveStokModel(),
      showLoading: true,
      data: saveStokModel.toJson(),
    );
    if (result.isSuccess) {
      dialogManager.showSuccessSnackBar("Başarılı");
      Get.back(result: saveStokModel);
      SaveStokModel.setInstance(SaveStokModel());
    }
  }

  Map<String, int> get validate {
    final StokListesiModel model = StokListesiModel.instance;
    final Map<String, int> validate = {};
    if (model.stokKodu.ext.isNullOrEmpty) {
      validate["Stok Kodu"] = 0;
    }
    if (model.subeKodu.toStringIfNotNull.ext.isNullOrEmpty) {
      validate["Şube Kodu"] = 0;
    }
    return validate;
  }

  bool get kaydetButonuYetki {
    if (widget.model?.baseEditEnum.goruntuleMi ?? false) return false;
    return switch (widget.model?.baseEditEnum) {
      BaseEditEnum.ekle ||
      BaseEditEnum.kopyala ||
      BaseEditEnum.revize ||
      BaseEditEnum.taslak => yetkiController.stokKartiYeniKayit,
      BaseEditEnum.duzenle => yetkiController.stokKartiDuzenleme,
      _ => false,
    };
  }
}
