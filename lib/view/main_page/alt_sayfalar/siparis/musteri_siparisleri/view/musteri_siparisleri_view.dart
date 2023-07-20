import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart';
import 'package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart';
import 'package:picker/core/components/card/musteri_siparisleri_card.dart';
import 'package:picker/core/components/floating_action_button/custom_floating_action_button.dart';
import 'package:picker/core/components/textfield/custom_app_bar_text_field.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/core/init/network/login/api_urls.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/musteri_siparisleri/model/musteri_siparisleri_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/musteri_siparisleri/view_model/musteri_siparisleri_view_model.dart';

class MusteriSiparisleriView extends StatefulWidget {
  const MusteriSiparisleriView({super.key});

  @override
  State<MusteriSiparisleriView> createState() => _MusteriSiparisleriViewState();
}

class _MusteriSiparisleriViewState extends BaseState<MusteriSiparisleriView> {
  late ScrollController scrollController;
  MusteriSiparisleriViewModel viewModel = MusteriSiparisleriViewModel();

  @override
  void initState() {
    scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getData();
    });
    scrollController.addListener(() async {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
        if (viewModel.dahaVarMi) {
          Future.delayed(const Duration(milliseconds: 500), () {
            getData();
          });
        }
      }
      if (scrollController.position.userScrollDirection == ScrollDirection.forward) {
        viewModel.changeIsScrolledDown(true);
      } else if (scrollController.position.userScrollDirection == ScrollDirection.reverse) {
        viewModel.changeIsScrolledDown(false);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //*Title
        title: Observer(builder: (_) => viewModel.searchBar ? const CustomAppBarTextField() : AppBarTitle(title: "Müşteri Siparişleri", subtitle: viewModel.musteriSiparisleriList?.length.toString())),
        //*Actions
        actions: [IconButton(onPressed: viewModel.changeSearchBar, icon: Observer(builder: (_) => viewModel.searchBar ? const Icon(Icons.search_off_outlined) : const Icon(Icons.search_outlined)))],
        //*Bottom
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: AppBarPreferedSizedBottom(
              children: [
                AppBarButton(
                  icon: Icons.filter_alt_outlined,
                  onPressed: () {},
                  child: const Text("Filtrele"),
                ),
                AppBarButton(
                  icon: Icons.sort_by_alpha_outlined,
                  onPressed: () {},
                  child: const Text("Sırala"),
                ),
              ],
            )),
      ),
      floatingActionButton: Observer(builder: (_) => CustomFloatingActionButton(isScrolledDown: viewModel.isScrolledDown)),
      body: Observer(builder: (_) {
        return RefreshIndicator.adaptive(
            onRefresh: () async {
              viewModel.setMusteriSiparisleriList(null);
              viewModel.setDahaVarMi(true);
              getData();
            },
            child: viewModel.musteriSiparisleriList == null
                ? const Center(child: CircularProgressIndicator.adaptive())
                : viewModel.musteriSiparisleriList!.isEmpty
                    ? const Center(child: Text("Sipariş bulunamadı"))
                    : Observer(builder: (_) {
                        return ListView.builder(
                          controller: scrollController,
                          itemCount: (viewModel.musteriSiparisleriList?.length ?? 0) + 1,
                          itemBuilder: (context, index) {
                            if (index == (viewModel.musteriSiparisleriList?.length ?? 0)) {
                              return Visibility(
                                visible: viewModel.dahaVarMi,
                                child: const Center(child: CircularProgressIndicator.adaptive()),
                              );
                            }
                            return MusteriSiparisleriCard(model: viewModel.musteriSiparisleriList![index]!);
                          },
                        );
                      }));
      }),
    );
  }

  void getData() async {
    viewModel.setDahaVarMi(false);
    var result =
        await networkManager.dioGet<MusteriSiparisleriModel>(path: ApiUrls.getFaturalar, bodyModel: MusteriSiparisleriModel(), queryParameters: viewModel.musteriSiparisleriRequestModel.toJson());
    if (result.data != null) {
      List<MusteriSiparisleriModel?>? list = result.data.map((e) => e as MusteriSiparisleriModel).toList().cast<MusteriSiparisleriModel?>();
      if (result.data.length < 25) {
        viewModel.setDahaVarMi(false);
        viewModel.setMusteriSiparisleriList(list);
      } else {
        viewModel.setDahaVarMi(true);
        viewModel.increaseSayfa();
        viewModel.setMusteriSiparisleriList(list);
      }
    }
  }
}
