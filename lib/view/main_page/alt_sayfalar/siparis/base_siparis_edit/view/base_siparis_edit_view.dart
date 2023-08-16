import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../siparisler/model/siparis_edit_request_model.dart";
import "../alt_sayfalar/base_siparisler_diger/view/base_siparisler_diger_view.dart";
import "../alt_sayfalar/base_siparisler_genel/view/base_siparisler_genel_view.dart";
import "../alt_sayfalar/base_siparisler_kalemler/view/base_siparis_kalemler_view.dart";
import "../alt_sayfalar/base_siparisler_toplamlar/view/base_siparis_toplamlar_view.dart";
import "../model/base_siparis_edit_model.dart";
import "../view_model/base_siparis_editing_view_model.dart";

class BaseSiparisEditingView extends StatefulWidget {
  final String? appBarTitle;
  final String? appBarSubtitle;
  final bool? isSubTitleSmall;
  // final List<Widget>? actions;
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseSiparisEditingView({super.key, this.appBarTitle, this.appBarSubtitle, this.isSubTitleSmall, required this.model});

  @override
  State<BaseSiparisEditingView> createState() => _BaseSiparisEditingViewState();
}

class _BaseSiparisEditingViewState extends BaseState<BaseSiparisEditingView> with TickerProviderStateMixin {
  BaseSiparisEditingViewModel viewModel = BaseSiparisEditingViewModel();
  late TabController tabController;
  late BaseEditModel<SiparisEditRequestModel> model;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging && tabController.previousIndex == 0) {
        //😳 var result = StaticVariables.instance.siparisGenelFormKey.currentState?.validate();
        //😳 if (result == null || result == false) {
        //😳   tabController.animateTo(tabController.previousIndex);
        //😳 }
      }
      if (tabController.index == 3 && BaseSiparisEditModel.instance.kalemList.ext.isNotNullOrEmpty) {
        viewModel.changeIsLastPage(true);
      } else {
        viewModel.changeIsLastPage(false);
      }
    });
    model = widget.model;
    if (widget.model.baseEditEnum == BaseEditEnum.duzenle) {
      model.model?.kayitModu = "S";
    } else {
      if (widget.model.baseEditEnum == BaseEditEnum.goruntule) {
        model.model?.kayitModu = "U";
      } else {
        model.model?.kayitModu = null;
      }
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (BaseSiparisEditModel.instance.isEmpty && widget.model.baseEditEnum != BaseEditEnum.ekle) {
        await getData();
      } else if (widget.model.baseEditEnum == BaseEditEnum.ekle) {
        BaseSiparisEditModel.resetInstance();
        BaseSiparisEditModel.instance.isNew = true;
        var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
        if (result is CariListesiModel) {
          viewModel.changeIsBaseSiparisEmpty(true);
          BaseSiparisEditModel.instance.siparisTipi = model.siparisTipiEnum;
          BaseSiparisEditModel.instance.cariModel = result;
          BaseSiparisEditModel.instance.cariAdi = result.cariAdi;
          BaseSiparisEditModel.instance.cariKodu = result.cariKodu;
          BaseSiparisEditModel.instance.belgeTipi = int.tryParse(result.odemeTipi ?? "0");
        }
      }
      viewModel.changeIsBaseSiparisEmpty(false);
    });
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: AppBarTitle(
                title: widget.appBarTitle ?? "Sipariş",
                subtitle: widget.appBarSubtitle ?? widget.model.model?.belgeNo,
                isSubTitleSmall: widget.isSubTitleSmall,
              ),
              // title: const Text("Sipariş Detayları"),
              actions: [
                IconButton(
                  onPressed: () async {
                    await bottomSheetDialogManager.showBottomSheetDialog(context,
                        title: "Seçenekler",
                        children: [
                          BottomSheetModel(
                              title: "Cari İşlemleri",
                              iconWidget: Icons.person_2_outlined,
                              onTap: () {
                                Get.back();
                                dialogManager.showCariGridViewDialog(BaseSiparisEditModel.instance.cariModel);
                              }).yetkiKontrol(BaseSiparisEditModel.instance.cariModel == null),
                          BottomSheetModel(title: "Toplu İskonto Girişi", iconWidget: Icons.add_outlined),
                          BottomSheetModel(title: "Döviz Kurları", iconWidget: Icons.attach_money_outlined),
                          BottomSheetModel(title: "Döviz Kurlarını Güncelle", iconWidget: Icons.attach_money_outlined),
                          BottomSheetModel(
                              title: "Cari'ye Yapılan Son Satışlar",
                              iconWidget: Icons.info_outline_rounded,
                              onTap: () {
                                Get.back();
                                Get.toNamed("/mainPage/cariStokSatisOzeti", arguments: BaseSiparisEditModel.instance.cariModel);
                              }).yetkiKontrol(BaseSiparisEditModel.instance.cariModel == null),
                          BottomSheetModel(title: "Barkod Tanımla", iconWidget: Icons.qr_code_outlined),
                          BottomSheetModel(
                              title: "Ekranı Yeni Kayda Hazırla",
                              description: "Belge kaydından sonra yeni belge giriş ekranını otomatik hazırla.",
                              iconWidget: viewModel.yeniKaydaHazirlaMi ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
                              onTap: () {
                                Get.back();
                                viewModel.changeYeniKaydaHazirlaMi();
                              }),
                        ].nullCheck.cast<BottomSheetModel>());
                  },
                  icon: const Icon(Icons.more_vert_outlined),
                ),
                Observer(builder: (_) {
                  return Visibility(
                    visible: viewModel.isLastPage,
                    child: IconButton(
                      onPressed: () async {
                        if (await postData()) {
                          Get.back();
                          if (viewModel.yeniKaydaHazirlaMi) {
                            BaseSiparisEditModel.resetInstance();
                            BaseSiparisEditModel.instance.isNew = true;
                            Get.toNamed("/mainPage/siparisEdit", arguments: BaseEditModel(baseEditEnum: BaseEditEnum.ekle, siparisTipiEnum: model.siparisTipiEnum));
                          }
                        }
                      },
                      icon: const Icon(Icons.save_outlined),
                    ),
                  );
                }),
              ],
              bottom: TabBar(
                controller: tabController,
                tabs: const [Tab(child: Text("Genel")), Tab(child: Text("Diğer")), Tab(child: Text("Kalemler")), Tab(child: Text("Toplamlar"))],
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                Observer(builder: (_) => (viewModel.isBaseSiparisEmpty) ? const Center(child: CircularProgressIndicator.adaptive()) : BaseSiparislerGenelView(model: model)),
                BaseSiparislerDigerView(model: model),
                BaseSiparisKalemlerView(model: model),
                BaseSiparisToplamlarView(model: model),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          if (widget.model.baseEditEnum == BaseEditEnum.goruntule) {
            return true;
          }
          bool result = false;
          await dialogManager.showAreYouSureDialog(() {
            result = true;
            BaseSiparisEditModel.resetInstance();
          });
          return result;
        });
  }

  Future<void> getData() async {
    var result = await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.getFaturaDetay, bodyModel: BaseSiparisEditModel(), data: widget.model.model?.toJson(), showLoading: true);
    if (result.success == true) {
      viewModel.changeFuture();
      BaseSiparisEditModel.setInstance(result.data!.first);
    }
  }

  Future<bool> postData() async {
    var result = await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.saveFatura, bodyModel: BaseSiparisEditModel(), data: BaseSiparisEditModel.instance.toJson(), showLoading: true);
    if (result.success == true) {
      return true;
    } else {
      return false;
    }
  }
}
