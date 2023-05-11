import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/base/view/base_cari_edit/model/base_editing_model.dart';
import 'package:picker/core/base/view/base_cari_edit/view/base_edit_genel/model/base_cari_edit_model.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';

import 'base_edit_genel/view/base_edit_cari_genel_view.dart';

class BaseCariEditingView extends StatefulWidget {
  final String? appBarTitle;
  final String? appBarSubtitle;
  final bool? isSubTitleSmall;
  final List<Widget>? actions;
  final BaseCariEditModel? cariListesiModel;
  final BaseEditingModel? model;
  const BaseCariEditingView({super.key, this.appBarTitle, this.appBarSubtitle, this.actions, this.model, this.isSubTitleSmall, this.cariListesiModel});

  @override
  State<BaseCariEditingView> createState() => _BasCarieEditingViewState();
}

class _BasCarieEditingViewState extends State<BaseCariEditingView> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.model?.tabs?.length ?? 2,
      child: Scaffold(
        // bottomNavigationBar: NavigationBar(destinations: const [Tab(child: Text("Genel")), Tab(child: Text("Diğer"))]),
        appBar: AppBar(
          title: AppBarTitle(
              title: widget.appBarTitle ?? "Cari Kartı", subtitle: widget.appBarSubtitle ?? widget.cariListesiModel!.model?.cariAdi, isSubTitleSmall: widget.isSubTitleSmall),
          actions: widget.actions,
          bottom: TabBar(
              indicatorColor: UIHelper.primaryColor,
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: UIHelper.primaryColor,
              tabs: const [Tab(child: Text("Genel")), Tab(child: Text("Diğer"))]),
        ),
        body: TabBarView(
          // controller: _tabController,
          children: [BaseEditCariGenelView(model: widget.cariListesiModel), const Center(child: Text("İletişim"))],
        ).paddingAll(UIHelper.midSize),
      ),
    );
  }
}
