import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/base_cari_edit/view_model/base_cari_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_detay_model.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../cari_listesi/model/cari_listesi_model.dart";
import "../../cari_listesi/model/cari_save_request_model.dart";
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
  BaseCariEditViewModel viewModel = BaseCariEditViewModel();
  TabController? tabController;
  List<Tab>? get addTabs => widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != null && widget.model?.baseEditEnum != BaseEditEnum.kopyala
      ? [const Tab(child: Text("Özet")), const Tab(child: Text("Banka")), const Tab(child: Text("İletişim"))]
      : [];
  List<Widget>? get addBody => widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != null && widget.model?.baseEditEnum != BaseEditEnum.kopyala
      ? [const BaseEditCariOzetView(), const BaseCariEditBankaView(), const BaseCariEditIletisimView()]
      : [];
  Widget? get addSaveButton => widget.model?.baseEditEnum != BaseEditEnum.goruntule
      ? IconButton(
          onPressed: () async {
            if (validate.isEmpty) {
              dialogManager.showAreYouSureDialog(() async => await postData());
            } else {
              await dialogManager.showEmptyFieldDialog(validate.keys.toList(), onOk: () => tabController?.animateTo(validate.values.first));
            }
          },
          icon: const Icon(Icons.save_outlined))
      : null;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model?.baseEditEnum != BaseEditEnum.ekle) {
        var result = await networkManager
            .dioGet<CariDetayModel>(path: ApiUrls.getCariDetay, bodyModel: CariDetayModel(), showError: false, showLoading: true, queryParameters: {"CariKodu": widget.model?.model.cariKodu});
        viewModel.changeIsDownloadCompletedSuccesfully(result.success);
        if (result.data != null && result.data!.isNotEmpty && result.success != null) {
          CariDetayModel.setInstance(result.data[0]);
          CariSaveRequestModel.setInstance(CariSaveRequestModel.instance.fromCariListesiModel(CariDetayModel.instance.cariList?.first));
        } else {
          await dialogManager.showAlertDialog(result.message ?? result.messageDetail ?? result.errorDetails ?? "Bilinmeyen bir hata oluştu");
          Get.back();
        }
      } else {
        viewModel.changeIsDownloadCompletedSuccesfully(true);
        CariDetayModel.setInstance(CariDetayModel());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    CariSaveRequestModel.setInstance(null);
    BaseEditCariGenelViewState.viewModel.model = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabs = [const Tab(child: Text("Genel")), const Tab(child: Text("Diğer")), ...?addTabs];
    var views = [
      Observer(builder: (_) {
        return viewModel.isDownloadCompletedSuccesfully == true ? BaseEditCariGenelView(model: widget.model) : Center(child: Text(viewModel.message ?? ""));
      }),
      CariEditDigerView(model: widget.model),
      ...?addBody
    ];
    tabController = TabController(length: tabs.length, vsync: this);
    return WillPopScope(
      onWillPop: () async {
        bool result = false;
        await dialogManager.showAreYouSureDialog(() async => result = true);
        return result;
      },
      child: Scaffold(
        // bottomNavigationBar: NavigationBar(destinations: const [Tab(child: Text("Genel")), Tab(child: Text("Diğer"))]),
        appBar: AppBar(
          title: AppBarTitle(title: (widget.appBarTitle ?? "Cari Kartı"), subtitle: ((widget.model?.baseEditEnum ?? BaseEditEnum.ekle).name), isSubTitleSmall: widget.isSubTitleSmall),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            ),
            addSaveButton,
          ].nullCheckWithGeneric,
          bottom: TabBar(
            tabs: tabs,
            controller: tabController,
            // onTap: (value) => tabController?.animateTo(value),
          ),
        ),
        body: Observer(builder: (_) {
          return TabBarView(
            controller: tabController,
            physics: viewModel.isDownloadCompletedSuccesfully == true ? const AlwaysScrollableScrollPhysics() : const NeverScrollableScrollPhysics(),
            children: views,
          ).paddingAll(UIHelper.midSize);
        }),
      ),
    );
  }

  Future<void> postData() async {
    var response = await networkManager.dioPost<CariListesiModel>(
      path: ApiUrls.saveCari,
      bodyModel: CariListesiModel(),
      addCKey: true,
      showLoading: true,
      addSirketBilgileri: true,
      data: CariSaveRequestModel.instance.toJson(),
    );
    if (response.success == true) {
      Get.back(result: true);
      dialogManager.showSuccessSnackBar(response.message ?? "Kayıt başarılı");
    }
  }

  Map<String, int> get validate {
    Map<String, int> map = {};
    CariSaveRequestModel data = CariSaveRequestModel.instance;
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
}
