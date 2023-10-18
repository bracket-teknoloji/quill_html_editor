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
import "../../../../../../core/constants/extensions/number_extensions.dart";
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
  CariListesiModel get cariListesiModel => CariListesiModel.instance;
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
      if (widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != BaseEditEnum.kopyala) {
        var result = await networkManager
            .dioGet<CariDetayModel>(path: ApiUrls.getCariDetay, bodyModel: CariDetayModel(), showError: false, showLoading: true, queryParameters: {"CariKodu": widget.model?.model.cariKodu});
        viewModel.changeIsDownloadCompletedSuccesfully(result.success);
        if (result.data != null && result.data!.isNotEmpty && result.success != null) {
          CariDetayModel.setInstance(result.data[0]);
        } else {
          await dialogManager.showAlertDialog(result.message ?? result.messageDetail ?? result.errorDetails ?? "Bilinmeyen bir hata oluştu");
          Get.back();
        }
      } else {
        viewModel.changeIsDownloadCompletedSuccesfully(true);
      }
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    CariListesiModel.setInstance(null);
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
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        // bottomNavigationBar: NavigationBar(destinations: const [Tab(child: Text("Genel")), Tab(child: Text("Diğer"))]),
        appBar: AppBar(
          title: AppBarTitle(title: (widget.appBarTitle ?? "Cari Kartı"), subtitle: (widget.model?.baseEditEnum?.name ?? BaseEditEnum.ekle.name), isSubTitleSmall: widget.isSubTitleSmall),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            ),
            addSaveButton,
          ].nullCheckWithGeneric,
          bottom: viewModel.isDownloadCompletedSuccesfully == true
              ? TabBar(
                  tabs: tabs,
                  controller: tabController,
                  onTap: (value) => tabController?.animateTo(value),
                  // onTap: (value) {
                  //   if (StaticVariables.formKey.currentState!.validate()) {
                  //
                  // tabController?.animateTo(value);
                  //   } else {
                  //     tabController?.animateTo(tabController!.previousIndex);
                  //     dialogManager.showErrorSnackBar("Lütfen zorunlu alanları doldurunuz.");
                  //   }
                  // },
                )
              : null,
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
    dialogManager.showLoadingDialog("Yükleniyor");
    Map<String, dynamic> data = CariListesiModel.instance.toJson();
    CariSaveRequestModel model = CariSaveRequestModel.instance;
    model = model.fromJson(data);
    model = model
      ..kodu = CariListesiModel.instance.cariKodu
      ..website = CariListesiModel.instance.web
      ..telefon = CariListesiModel.instance.cariTel
      ..eposta = CariListesiModel.instance.email
      ..adi = CariListesiModel.instance.cariAdi
      ..adres = CariListesiModel.instance.cariAdres
      ..ilce = CariListesiModel.instance.cariIlce
      ..sehir = CariListesiModel.instance.cariIl
      ..yeniKayit = widget.model?.baseEditEnum == BaseEditEnum.ekle
      ..tipi = CariListesiModel.instance.cariTip;
    var response = await networkManager.dioPost<CariListesiModel>(
      path: ApiUrls.saveCari,
      bodyModel: CariListesiModel(),
      addCKey: true,
      showError: false,
      addSirketBilgileri: true,
      data: model.toJson(),
    );
    if (!(response.success == true)) {
      dialogManager.hideAlertDialog;
      dialogManager.showAlertDialog("Eksik bilgi var\n${response.message}");
    } else {
      dialogManager.hideAlertDialog;
      dialogManager.showSuccessSnackBar("Kayıt başarılı");
      Get.back();
    }
  }

  Map<String, int> get validate {
    Map<String, int> map = {};
    CariListesiModel data = CariListesiModel.instance;
    if (data.cariKodu.ext.isNullOrEmpty) {
      map["Kodu"] = 0;
    }
    if (data.cariTip.ext.isNullOrEmpty) {
      map["Cari Tipi"] = 0;
    }
    if (data.cariAdi.ext.isNullOrEmpty) {
      map["Adı"] = 0;
    }
    if (data.subeKodu.toStringIfNotNull.ext.isNullOrEmpty) {
      map["Şube Kodu"] = 1;
    }
    if (data.kilit.ext.isNullOrEmpty) {
      map["Kilit"] = 1;
    }
    return map;
  }
}
