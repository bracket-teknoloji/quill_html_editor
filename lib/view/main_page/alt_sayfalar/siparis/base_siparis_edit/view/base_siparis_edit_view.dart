import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:picker/core/base/model/base_edit_model.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/alt_sayfalar/base_siparisler_diger/view/base_siparisler_diger_view.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/alt_sayfalar/base_siparisler_genel/view/base_siparisler_genel_view.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/view_model/base_siparis_editing_view_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_reuqest_model.dart';

import '../../../../../../core/constants/enum/base_edit_enum.dart';
import '../../../../../../core/init/network/login/api_urls.dart';
import '../alt_sayfalar/base_siparisler_kalemler/view/base_siparis_kalemler_view.dart';
import '../alt_sayfalar/base_siparisler_toplamlar/view/base_siparis_toplamlar_view.dart';
import '../model/base_siparis_edit_model.dart';

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

  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging) {}
      if (tabController.index == 3) {
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
      }
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
                  onPressed: () {},
                  icon: const Icon(Icons.more_vert_outlined),
                ),
                Observer(builder: (_) {
                  return Visibility(
                    visible: viewModel.isLastPage,
                    child: IconButton(
                      onPressed: () async {
                        await postData();
                      },
                      icon: const Icon(Icons.save_outlined),
                    ),
                  );
                }),
              ],
              bottom: TabBar(
                controller: tabController,
                tabs: [
                  const Tab(child: Text("Genel")),
                  const Tab(child: Text("Diğer")),
                  Tab(child: Observer(builder: (_) {
                    return Text("Kalemler (${viewModel.getKalemCount})");
                  })),
                  const Tab(child: Text("Toplamlar"))
                ],
              ),
            ),
            body: TabBarView(
              controller: tabController,
              children: [
                Observer(
                    builder: (_) => (viewModel.isBaseSiparisEmpty && widget.model.baseEditEnum != BaseEditEnum.ekle)
                        ? const Center(child: CircularProgressIndicator.adaptive())
                        : BaseSiparislerGenelView(model: model)),
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
      BaseSiparisEditModel.setInstance(result.data.first as BaseSiparisEditModel);
      viewModel.changeFuture();
    }
  }

  Future<void> postData() async {
    var result = await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.saveFatura, bodyModel: BaseSiparisEditModel(), data: BaseSiparisEditModel.instance.toJson(), showLoading: true);
    if (result.success == true) {}
  }
}
