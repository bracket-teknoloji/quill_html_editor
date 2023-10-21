import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../stok_liste/model/stok_listesi_model.dart";
import "../model/save_stok_model.dart";
import "base_stok_edit_fiyat/view/base_stok_edit_fiyat_view.dart";
import "base_stok_edit_fiyat_listesi/view/base_stok_edit_fiyat_listesi_view.dart";
import "base_stok_edit_genel/view/base_stok_edit_genel_view.dart";
import "base_stok_edit_seriler/view/base_stok_edit_seriler_view.dart";

class BaseStokEditingView extends StatefulWidget {
  final String? appBarTitle;
  final String? appBarSubtitle;
  final bool? isSubTitleSmall;
  // final List<Widget>? actions;
  final BaseEditModel? model;
  const BaseStokEditingView(
      {super.key,
      this.appBarTitle,
      this.appBarSubtitle,
      this.isSubTitleSmall,
      this.model});

  @override
  State<BaseStokEditingView> createState() => _BaseStokEditingViewState();
}

class _BaseStokEditingViewState extends BaseState<BaseStokEditingView>
    with TickerProviderStateMixin {
  TabController? tabController;
  List<Tab>? get tabs => (widget.model!.baseEditEnum != BaseEditEnum.ekle &&
          widget.model!.baseEditEnum != BaseEditEnum.kopyala)
      ? [const Tab(child: Text("Fiyat Listesi"))]
      : [];
  List<Widget>? get views => (widget.model!.baseEditEnum != BaseEditEnum.ekle &&
          widget.model!.baseEditEnum != BaseEditEnum.kopyala)
      ? [const BaseStokEditFiyatListesiView()]
      : [];

  @override
  Widget build(BuildContext context) {
    StokListesiModel.setInstance(widget.model?.model);
    final List<Tab> tabList = [
      const Tab(child: Text("Genel")),
      ...?tabs,
      const Tab(child: Text("Fiyat")),
      const Tab(child: Text("Seriler"))
    ];
    final List<Widget> viewList = [
      BaseStokEditGenelView(model: widget.model?.baseEditEnum),
      ...?views,
      BaseStokEditFiyatView(model: widget.model?.baseEditEnum),
      BaseStokEditSerilerView(model: widget.model?.baseEditEnum)
    ];
    tabController = TabController(length: tabList.length, vsync: this);
    return WillPopScope(
      onWillPop: () async {
        return true;
        //TODO! BURAYA BAK
      },
      child: DefaultTabController(
        length: tabList.length,
        child: Scaffold(
          appBar: AppBar(
            title: AppBarTitle(
                title: widget.appBarTitle ?? "Stok Detayları",
                subtitle: widget.appBarSubtitle ??
                    widget.model?.model?.stokAdi ??
                    ""),
            actions: [
              Visibility(
                  visible: widget.model?.baseEditEnum != BaseEditEnum.goruntule,
                  child: IconButton(
                      onPressed: () async {
                        if (validate.isEmpty) {
                          dialogManager.showAreYouSureDialog(postData);
                        } else {
                          dialogManager.showEmptyFieldDialog(
                            validate.keys,
                            onOk: () =>
                                tabController?.animateTo(validate.values.first),
                          );
                        }
                      },
                      icon: const Icon(Icons.save_outlined)))
            ],
            bottom: TabBar(
              controller: tabController,
              tabs: tabList,
            ),
          ),
          body: TabBarView(controller: tabController, children: viewList),
        ),
      ),
    );
  }

  void postData() async {
    final StokListesiModel model = StokListesiModel.instance;
    final SaveStokModel saveStokModel = SaveStokModel().fromJson(model.toJson());
    saveStokModel.adi = model.stokAdi;
    saveStokModel.kodu = model.stokKodu;
    saveStokModel.alisFiyati1 = model.alisFiat1;
    saveStokModel.alisDovizTipi = model.alisDovTip;
    saveStokModel.satisDovizTipi = model.satDovTip;
    saveStokModel.alisFiyati2 = model.alisFiat2;
    // saveStokModel.subeKodu = model.subeKodu;
    saveStokModel.alisFiyati3 = model.alisFiat3;
    saveStokModel.alisFiyati4 = model.alisFiat4;
    saveStokModel.olcuBirimi1 = model.olcuBirimi;
    saveStokModel.seriGiristeAktif = model.seriGirislerdeAcik;
    saveStokModel.seriCikistaAktif = model.seriCikislardaAcik;
    saveStokModel.seriGiristeOtomatik = model.seriGiristeOtomatikMi;
    saveStokModel.seriCikistaOtomatik = model.seriCikistaOtomatikMi;
    saveStokModel.seriMiktarKadar = model.seriMiktarKadarSor;
    saveStokModel.alisKdvOrani = model.alisKdv;
    saveStokModel.satisKdvOrani = model.satisKdv;
    saveStokModel.alisDovizFiyati = model.dovAlisFiat;
    saveStokModel.satisDovizFiyati = model.dovSatisFiat;
    saveStokModel.muhdetayKodu = model.muhdetayKodu;
    saveStokModel.islemKodu =
        widget.model?.baseEditEnum == BaseEditEnum.ekle ? 1 : 2;
    saveStokModel.yeniKayit = saveStokModel.islemKodu == 1 ? true : false;
    saveStokModel.satisFiyati1 = model.satisFiat1;
    saveStokModel.satisFiyati2 = model.satisFiat2;
    saveStokModel.satisFiyati3 = model.satisFiat3;
    saveStokModel.satisFiyati4 = model.satisFiat4;
    saveStokModel.alisFiyati1 = model.alisFiat1;
    saveStokModel.alisFiyati2 = model.alisFiat2;
    saveStokModel.alisFiyati3 = model.alisFiat3;
    saveStokModel.alisFiyati4 = model.alisFiat4;
    saveStokModel.satisKdvOrani = model.satisKdv;
    saveStokModel.alisKdvOrani = model.alisKdv;
    saveStokModel.satisDovizFiyati = model.dovSatisFiat;
    saveStokModel.alisDovizFiyati = model.dovAlisFiat;
    saveStokModel.alisDovizTipi = model.alisDovTip;
    saveStokModel.satisDovizTipi = model.satDovTip;
    dialogManager.showLoadingDialog("Kaydediliyor..");
    final result = await networkManager.dioPost<SaveStokModel>(
      path: ApiUrls.saveStok,
      bodyModel: SaveStokModel(),
      addCKey: true,
      addSirketBilgileri: true,
      data: saveStokModel.toJson(),
    );
    dialogManager.hideAlertDialog;
    SaveStokModel.setInstance(SaveStokModel());
    if (result.success == true) {
      dialogManager.showSuccessSnackBar("Başarılı");
      Get.back(result: BaseEditModel());
    } else {
      dialogManager.hideAlertDialog;
      dialogManager.showErrorSnackBar(result.message ?? "Hata oluştu");
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
}
