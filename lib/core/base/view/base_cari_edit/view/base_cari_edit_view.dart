import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/base/view/base_cari_edit/model/base_editing_model.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/core/constants/enum/cari_edit_enum.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_save_request_model.dart';

import '../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';
import '../../../state/base_state.dart';
import 'base_cari_edit_banka/view/base_cari_edit_banka_view.dart';
import 'base_cari_edit_diger/view/base_edit_cari_diger_view.dart';
import 'base_cari_edit_genel/model/base_cari_edit_model.dart';
import 'base_cari_edit_genel/view/base_edit_cari_genel_view.dart';
import 'base_cari_edit_ozel/view/base_edit_cari_ozet_view.dart';

class BaseCariEditingView extends StatefulWidget {
  final String? appBarTitle;
  final String? appBarSubtitle;
  final bool? isSubTitleSmall;
  // final List<Widget>? actions;
  final BaseCariEditModel? cariListesiModel;
  final BaseEditingModel? model;
  const BaseCariEditingView({super.key, this.appBarTitle, this.appBarSubtitle, this.model, this.isSubTitleSmall, this.cariListesiModel});

  @override
  State<BaseCariEditingView> createState() => _BasCariEditingViewState();
}

class _BasCariEditingViewState extends BaseState<BaseCariEditingView> {
  List<Tab>? get addTabs => widget.cariListesiModel?.cariEditEnum != CariEditEnum.ekle && widget.cariListesiModel?.cariEditEnum != null
      ? [const Tab(child: Text("Özet")), const Tab(child: Text("Banka")), const Tab(child: Text("İletişim"))]
      : [];
  List<Widget>? get addBody => widget.cariListesiModel?.cariEditEnum != CariEditEnum.ekle && widget.cariListesiModel?.cariEditEnum != null
      ? [
          const BaseEditCariOzetView(),
          const BaseCariEditBankaView(),
          const Center(child: Text("İletişim")),
        ]
      : [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var tabs = [
      const Tab(child: Text("Genel")),
      const Tab(child: Text("Diğer")),
      ...?addTabs,
    ];
    var views = [
      BaseEditCariGenelView(model: widget.cariListesiModel),
      CariEditDigerView(model: widget.cariListesiModel),
      ...?addBody,
    ];
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        // bottomNavigationBar: NavigationBar(destinations: const [Tab(child: Text("Genel")), Tab(child: Text("Diğer"))]),
        appBar: AppBar(
          title: AppBarTitle(title: (widget.appBarTitle ?? "Cari Kartı"), subtitle: (widget.cariListesiModel?.cariEditEnum?.name ?? CariEditEnum.ekle.name), isSubTitleSmall: widget.isSubTitleSmall),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined),
            ),
            IconButton(
              onPressed: () {
                postData();
              },
              icon: const Icon(Icons.save_outlined),
            ),
          ],
          bottom: TabBar(indicatorColor: UIHelper.primaryColor, indicatorSize: TabBarIndicatorSize.tab, labelColor: UIHelper.primaryColor, tabs: tabs),
        ),
        body: TabBarView(
          // controller: _tabController,
          children: views,
        ).paddingAll(UIHelper.midSize),
      ),
    );
  }

  Future<void> postData() async {
    CariListesiModel.instance.kodu = CariListesiModel.instance.cariKodu;
    Map<String, dynamic> data = CariListesiModel.instance.toJson();
    CariSaveRequestModel model = CariSaveRequestModel();
    model = model.fromJson(data);
    // Map deneme = {
    //   "ACIKLAMA1": "d",
    //   "ACIKLAMA2": "d",
    //   "ACIKLAMA3": "g",
    //   "ADI": "Deneme",
    //   "ADRES": "Erenler",
    //   "BILGI": "Abc",
    //   "BOYLAM": 30.41015,
    //   "DOVIZLI": "E",
    //   "EFATURA_SENARYO": "TEM",
    //   "EPOSTA": "bracket@gmail.com",
    //   "ENLEM": 40.739626,
    //   "GRUP_KODU": "S",
    //   "ILCE": "erenler",
    //   "ISLEM_KODU": 2,
    //   "KILIT": "H",
    //   "KOD1": "K1_2",
    //   "KOD2": "K2_2",
    //   "KOD3": "K3_1",
    //   "KOD4": "k4",
    //   "KOD5": "test",
    //   "KODU": "OZLHESCARI1",
    //   "KULL1N": 3.0,
    //   "KULL1S": "d",
    //   "KULL2N": 3.0,
    //   "KULL2S": "ds",
    //   "KULL3N": 1.0,
    //   "KULL3S": "d",
    //   "KULL4N": 3.5,
    //   "KULL4S": "f",
    //   "KULL5N": 3.0,
    //   "KULL5S": "h",
    //   "KULL6N": 4.0,
    //   "KULL6S": "w",
    //   "KULL7N": 35.0,
    //   "KULL7S": "v",
    //   "KULL8N": 85.0,
    //   "KULL8S": "h",
    //   "ODEME_TIPI": "0",
    //   "POSTAKODU": "540502",
    //   "REQUEST_VERSION": 6,
    //   "SahisFirmasi": true,
    //   "SEHIR": "sakarya",
    //   "SUBE_KODU": "-1",
    //   "TELEFON": "0555",
    //   "TIPI": "A",
    //   "ULKE_KODU": "TR",
    //   "VADE_GUNU": "0",
    //   "WEBSITE": "www"
    // };
    model = model..kodu = CariListesiModel.instance.cariKodu;
    print(model.toJson());
    var response = await networkManager.dioPost<CariListesiModel>(
      path: ApiUrls.saveCari,
      bodyModel: CariListesiModel(),
      addTokenKey: true,
      addCKey: true,
      addSirketBilgileri: true,
      //! data: deneme,
    );
    log(response.toString());
  }
}
