import 'package:flutter/material.dart';
import 'package:picker/core/base/model/base_edit_model.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/alt_sayfalar/base_siparisler_diger/view/base_siparisler_diger_view.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/alt_sayfalar/base_siparisler_genel/view/base_siparisler_genel_view.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_reuqest_model.dart';

import '../../../../../../core/constants/enum/base_edit_enum.dart';
import '../alt_sayfalar/base_siparisler_kalemler/view/base_siparis_kalemler_view.dart';
import '../alt_sayfalar/base_siparisler_toplamlar/view/base_siparis_toplamlar_view.dart';

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
  late TabController tabController;
  late BaseEditModel<SiparisEditRequestModel> model;

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    model = widget.model;
    model.model?.kayitModu = widget.model.baseEditEnum == BaseEditEnum.duzenle
        ? "S"
        : widget.model.baseEditEnum == BaseEditEnum.goruntule
            ? "U"
            : null;
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
              title: const Text("Sipariş Detayları"),
              bottom: TabBar(
                controller: tabController,
                tabs: const [Tab(child: Text("Genel")), Tab(child: Text("Diğer")), Tab(child: Text("Kalemler")), Tab(child: Text("Toplamlar"))],
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                BaseSiparislerGenelView(model: model),
                const BaseSiparislerDigerView(),
                const BaseSiparisKalemlerView(),
                // Center(child: Text("Diğer")),
                const BaseSiparisToplamlarView(),
              ],
            ),
          ),
        ),
        onWillPop: () async {
          return true;
        });
  }
}
