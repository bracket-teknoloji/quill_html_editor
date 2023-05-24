import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/core/constants/enum/base_edit_enum.dart';
import 'package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart';

import '../../../model/base_edit_model.dart';
import '../../../state/base_state.dart';
import 'base_stok_edit_fiyat/view/base_stok_edit_fiyat_view.dart';
import 'base_stok_edit_fiyat_listesi/view/base_stok_edit_fiyat_listesi_view.dart';
import 'base_stok_edit_genel/view/base_stok_edit_genel_view.dart';

class BaseStokEditingView extends StatefulWidget {
  final String? appBarTitle;
  final String? appBarSubtitle;
  final bool? isSubTitleSmall;
  // final List<Widget>? actions;
  final BaseEditModel<StokListesiModel>? model;
  const BaseStokEditingView({super.key, this.appBarTitle, this.appBarSubtitle, this.isSubTitleSmall, this.model});

  @override
  State<BaseStokEditingView> createState() => _BaseStokEditingViewState();
}

class _BaseStokEditingViewState extends BaseState<BaseStokEditingView> {
  List<Tab>? get tabs => (widget.model!.baseEditEnum != BaseEditEnum.ekle) ? [const Tab(child: Text("Fiyat Listesi"))] : [];
  List<Widget>? get views => (widget.model!.baseEditEnum != BaseEditEnum.ekle) ? [const BaseStokEditFiyatListesiView()] : [];

  @override
  Widget build(BuildContext context) {
    List<Tab> tabList = [const Tab(child: Text("Genel")), ...?tabs, const Tab(child: Text("Fiyat")), const Tab(child: Text("Seriler"))];
    List<Widget> viewList = [BaseStokEditGenelView(model: widget.model), ...?views, const BaseStokEditFiyatView(), const Center(child: Text(""))];
    return WillPopScope(
      onWillPop: () async {
        return true;
        //! BURAYA BAK
      },
      child: DefaultTabController(
        length: tabList.length,
        child: Scaffold(
          appBar: AppBar(
            title: AppBarTitle(title: widget.appBarTitle ?? "Stok Detayları", subtitle: widget.appBarSubtitle ?? widget.model?.model?.stokAdi ?? ""),
            actions: [Visibility(visible: widget.model?.baseEditEnum != BaseEditEnum.goruntule, child: IconButton(onPressed: () {}, icon: const Icon(Icons.save_outlined)))],
            bottom: TabBar(
              tabs: tabList,
            ),
          ),
          body: TabBarView(children: viewList),
        ),
      ),
    );
  }
}
