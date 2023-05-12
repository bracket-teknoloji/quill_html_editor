import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/base/view/base_cari_edit/model/base_editing_model.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/core/constants/enum/cari_edit_enum.dart';

import '../../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';
import '../../../state/base_state.dart';
import 'base_cari_edit_genel/model/base_cari_edit_model.dart';
import 'base_cari_edit_genel/view/base_edit_cari_genel_view.dart';
import 'base_edit_diger/view/base_edit_cari_diger_view.dart';

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
          const Center(child: Text("Banka")),
          const Center(child: Text("İletişim")),
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
    Map data = CariListesiModel.instance.toJson();
    var response = await networkManager.dioPost<CariListesiModel>(
      path: ApiUrls.saveCari,
      bodyModel: CariListesiModel(),
      addTokenKey: true,
      addCKey: true,
      addSirketBilgileri: true,
      data: data,
    );
    log(response.toString());
  }
}
