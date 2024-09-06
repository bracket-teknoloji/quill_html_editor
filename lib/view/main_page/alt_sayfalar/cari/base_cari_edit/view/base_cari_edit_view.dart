import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../cari_listesi/model/cari_detay_model.dart";
import "../../cari_listesi/model/cari_kosullar_model.dart";
import "../../cari_listesi/model/cari_listesi_model.dart";
import "../../cari_listesi/model/cari_save_request_model.dart";
import "../../cari_network_manager.dart";
import "../view_model/base_cari_edit_view_model.dart";
import "base_cari_edit_banka/view/base_cari_edit_banka_view.dart";
import "base_cari_edit_diger/view/base_edit_cari_diger_view.dart";
import "base_cari_edit_genel/view/base_edit_cari_genel_view.dart";
import "base_cari_edit_iletisim/view/base_edit_cari_iletisim_view.dart";
import "base_cari_edit_ozel/view/base_edit_cari_ozet_view.dart";

class BaseCariEditingView extends StatefulWidget {
  final String? appBarTitle;
  final String? appBarSubtitle;
  final bool? isSubTitleSmall;
  // final List<Widget>? actions;
  final BaseEditModel? model;
  const BaseCariEditingView({super.key, this.appBarTitle, this.appBarSubtitle, this.isSubTitleSmall, this.model});

  @override
  State<BaseCariEditingView> createState() => _BasCariEditingViewState();
}

class _BasCariEditingViewState extends BaseState<BaseCariEditingView> with TickerProviderStateMixin {
  bool get goruntulenecekMi => widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != null && widget.model?.baseEditEnum != BaseEditEnum.kopyala;
  BaseCariEditViewModel viewModel = BaseCariEditViewModel();
  late final TabController tabController;
  List<Tab> get tabs => <Widget>[
        Tab(child: Text(loc.generalStrings.general)),
        Tab(child: Text(loc.generalStrings.other)),
        const Tab(child: Text("Özet")).yetkiVarMi(goruntulenecekMi),
        const Tab(child: Text("Banka")).yetkiVarMi(goruntulenecekMi),
        const Tab(child: Text("İletişim")).yetkiVarMi(goruntulenecekMi),
      ].whereType<Tab>().toList();

  List<Widget> get views => <Widget>[
        Observer(builder: (_) => viewModel.isDownloadCompletedSuccesfully == true ? BaseEditCariGenelView(model: widget.model) : Center(child: Text(viewModel.message ?? ""))),
        CariEditDigerView(model: widget.model),
        const BaseEditCariOzetView().yetkiVarMi(goruntulenecekMi),
        const BaseCariEditBankaView().yetkiVarMi(goruntulenecekMi),
        const BaseCariEditIletisimView().yetkiVarMi(goruntulenecekMi),
      ].where((Widget element) => element is! SizedBox).toList();
  @override
  void initState() {
    tabController = TabController(length: goruntulenecekMi ? 5 : 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      tabController.addListener(() async {
        if (tabController.index != 0 && !tabController.indexIsChanging) {
          await vergiNoChecker();
        }
      });
      if (widget.model?.baseEditEnum != BaseEditEnum.ekle) {
        if (widget.model?.baseEditEnum == BaseEditEnum.kopyala) {
          CariSaveRequestModel.setInstance(CariSaveRequestModel.instance.fromCariListesiModel(widget.model?.model));
          viewModel.changeIsDownloadCompletedSuccesfully(true);
          return;
        }
        final GenericResponseModel<CariDetayModel> result = await networkManager.dioGet<CariDetayModel>(
          path: ApiUrls.getCariDetay,
          bodyModel: CariDetayModel(),
          showError: false,
          showLoading: true,
          queryParameters: <String, dynamic>{"CariKodu": widget.model?.model.cariKodu},
        );
        if (result.isSuccess && result.dataList.isNotEmpty) {
          CariDetayModel.setInstance(result.dataList.first);
          CariListesiModel.setInstance(result.dataList.first.cariList?.firstOrNull);
          CariSaveRequestModel.setInstance(CariSaveRequestModel.instance.fromCariListesiModel(CariDetayModel.instance.cariList?.first));
          if (widget.model?.baseEditEnum == BaseEditEnum.kopyala) {
            final String? kod = await CariNetworkManager.getSiradakiKod(kod: "");
            CariSaveRequestModel.instance.kodu = kod;
          }
          final List<CariKosullarModel>? kosulList = await CariNetworkManager.getkosullar(null);
          CariSaveRequestModel.instance.kosulKoduAciklama = kosulList?.firstWhereOrNull((CariKosullarModel element) => element.kosulKodu == CariSaveRequestModel.instance.kosulKodu)?.kosulSabitAdi;
        } else {
          await dialogManager.showAlertDialog(result.message ?? result.messageDetail ?? result.errorDetails ?? "Bilinmeyen bir hata oluştu");
          Get.back(result: true);
        }
        viewModel.changeIsDownloadCompletedSuccesfully(result.isSuccess);
      } else {
        viewModel.changeIsDownloadCompletedSuccesfully(true);
        CariDetayModel.setInstance(CariDetayModel());
      }
    });

    // tabController?.addListener(() {
    //   if (tabController.indexIsChanging) {
    //     FocusScope.of(context).unfocus();
    //   }
    // });
    super.initState();
  }

  @override
  void dispose() {
    CariSaveRequestModel.setInstance(null);
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, value) async {
          if (didPop) {
            return;
          }
          if (widget.model?.baseEditEnum == BaseEditEnum.goruntule) {
            Get.back(result: false);
            return;
          }
          await dialogManager.showAreYouSureDialog(() => Get.back(result: false));
        },
        child: BaseScaffold(
          // bottomNavigationBar: NavigationBar(destinations: const [Tab(child: Text(loc.generalStrings.general)), Tab(child: Text(loc.generalStrings.general))]),
          appBar: AppBar(
            title: AppBarTitle(
              title: widget.appBarTitle ?? "Cari Kartı",
              subtitle: (widget.model?.baseEditEnum ?? BaseEditEnum.ekle).getName,
              isSubTitleSmall: widget.isSubTitleSmall,
            ),
            actions: <Widget>[
              // IconButton(
              //   onPressed: () {},
              //   icon: const Icon(Icons.more_vert_outlined),
              // ),
              IconButton(
                onPressed: () async {
                  if (validate.isEmpty) {
                    final result = await vergiNoChecker();
                    if (result) {
                      await dialogManager.showAreYouSureDialog(() async => await postData());
                    }
                  } else {
                    await dialogManager.showEmptyFieldDialog(validate.keys.toList(), onOk: () => tabController.animateTo(validate.values.first));
                  }
                },
                icon: const Icon(Icons.save_outlined),
              ).yetkiVarMi(kaydetButonuYetki),
            ],
            bottom: TabBar(
              tabs: tabs,
              controller: tabController,
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: views,
          ).paddingAll(UIHelper.midSize),
        ),
      );

  Future<void> postData() async {
    final GenericResponseModel<NetworkManagerMixin> response = await networkManager.dioPost<CariListesiModel>(
      path: ApiUrls.saveCari,
      bodyModel: CariListesiModel(),
      showLoading: true,
      data: CariSaveRequestModel.instance.toJson(),
    );
    if (response.isSuccess) {
      Get.back(result: true);
      dialogManager.showSuccessSnackBar(response.message ?? "Kayıt başarılı");
    }
  }

  Map<String, int> get validate {
    final Map<String, int> map = <String, int>{};
    final CariSaveRequestModel data = CariSaveRequestModel.instance;
    if (data.kodu.ext.isNullOrEmpty) {
      map["Kodu"] = 0;
    }
    if (data.tipi.ext.isNullOrEmpty) {
      map["Cari Tipi"] = 0;
    }
    if (data.adi.ext.isNullOrEmpty) {
      map["Adı"] = 0;
    }
    if (data.subeKodu.ext.isNullOrEmpty) {
      map["Şube Kodu"] = 1;
    }
    if (data.kilit.ext.isNullOrEmpty) {
      map["Kilit"] = 1;
    }
    return map;
  }

  Future<bool> vergiNoChecker() async {
    if (CariSaveRequestModel.instance.vergiNo != null && widget.model?.baseEditEnum != BaseEditEnum.goruntule) {
      // if model is SahisFirmasi vergino should be 11 digit
      if (CariSaveRequestModel.instance.sahisFirmasi == true && CariSaveRequestModel.instance.vergiNo!.length != 11) {
        await dialogManager.showAlertDialog("TC Kimlik 11 haneli olmalıdır");
        tabController.animateTo(0);
        return false;
      } else if (CariSaveRequestModel.instance.sahisFirmasi != true && CariSaveRequestModel.instance.vergiNo!.length != 10) {
        await dialogManager.showAlertDialog("Vergi No 10 haneli olmalıdır");
        tabController.animateTo(0);
        return false;
      } else {
        return true;
      }
    }
    return true;
  }

  bool get kaydetButonuYetki {
    if (widget.model?.baseEditEnum == BaseEditEnum.goruntule) return false;
    switch (widget.model?.baseEditEnum) {
      case BaseEditEnum.ekle:
      case BaseEditEnum.kopyala:
      case BaseEditEnum.revize:
      case BaseEditEnum.taslak:
        return widget.model?.editTipiEnum?.eklensinMi ?? false;
      case BaseEditEnum.duzenle:
        return widget.model?.editTipiEnum?.duzenlensinMi ?? false;
      default:
        return false;
    }
  }
}
