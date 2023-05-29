import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/core/constants/enum/base_edit_enum.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_save_request_model.dart';

import '../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';
import '../../../model/base_edit_model.dart';
import '../../../state/base_state.dart';
import 'base_cari_edit_banka/view/base_cari_edit_banka_view.dart';
import 'base_cari_edit_diger/view/base_edit_cari_diger_view.dart';
import 'base_cari_edit_genel/view/base_edit_cari_genel_view.dart';
import 'base_cari_edit_iletisim/view/base_edit_cari_iletisim_view.dart';
import 'base_cari_edit_ozel/view/base_edit_cari_ozet_view.dart';

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

class _BasCariEditingViewState extends BaseState<BaseCariEditingView> {
  List<Tab>? get addTabs => widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != null
      ? [const Tab(child: Text("Özet")), const Tab(child: Text("Banka")), const Tab(child: Text("İletişim"))]
      : [];
  List<Widget>? get addBody =>
      widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != null ? [const BaseEditCariOzetView(), const BaseCariEditBankaView(), const BaseCariEditIletisimView()] : [];
  Widget? get addSaveButton => widget.model?.baseEditEnum != BaseEditEnum.goruntule
      ? IconButton(
          onPressed: () async {
            dialogManager.showSnackBar("Yükleniyor");
            await postData();
          },
          icon: const Icon(Icons.save_outlined))
      : null;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tabs = [const Tab(child: Text("Genel")), const Tab(child: Text("Diğer")), ...?addTabs];
    var views = [BaseEditCariGenelView(model: widget.model), CariEditDigerView(model: widget.model), ...?addBody];
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
            addSaveButton ?? Container(),
          ],
          bottom: TabBar(tabs: tabs),
        ),
        body: TabBarView(
          // controller: _tabController,
          children: views,
        ).paddingAll(UIHelper.midSize),
      ),
    );
  }

  Future<void> postData() async {
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
      addTokenKey: true,
      addCKey: true,
      addSirketBilgileri: true,
      data: model.toJson(),
    );
    if (!(response.success ?? false)) {
      dialogManager.showAlertDialog("Eksik bilgi var\n${response.message}");
    } else {
      dialogManager.showSnackBar("Kayıt başarılı");
      Get.back();
    }
  }
}
