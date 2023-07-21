import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart';
import 'package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart';
import 'package:picker/core/components/card/musteri_siparisleri_card.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/components/floating_action_button/custom_floating_action_button.dart';
import 'package:picker/core/components/textfield/custom_app_bar_text_field.dart';
import 'package:picker/core/components/wrap/appbar_title.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
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
  List<MusteriSiparisleriModel?>? get musteriSiparisleriList => viewModel.musteriSiparisleriList;

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
      appBar: appBar(context),
      floatingActionButton: fab(),
      body: body(),
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      //*Title
      title: Observer(
          builder: (_) => viewModel.searchBar
              ? CustomAppBarTextField(
                  onFieldSubmitted: (value) {
                    viewModel.setSearchText(value);
                    viewModel.setMusteriSiparisleriList(null);
                    viewModel.setDahaVarMi(true);
                    viewModel.resetSayfa();
                    getData();
                  },
                )
              : AppBarTitle(title: "Müşteri Siparişleri", subtitle: viewModel.musteriSiparisleriList?.length.toString())),
      //*Actions
      actions: [
        IconButton(
            onPressed: () {
              viewModel.changeSearchBar();
              getData();
            },
            icon: Observer(builder: (_) => viewModel.searchBar ? const Icon(Icons.search_off_outlined) : const Icon(Icons.search_outlined)))
      ],
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
                onPressed: () async {
                  var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "Sıralama",
                      children:
                          List.generate(viewModel.siralaMap.length, (index) => BottomSheetModel(title: viewModel.siralaMap.keys.toList()[index], value: viewModel.siralaMap.values.toList()[index])));
                  if (result != null) {
                    viewModel.setSiralama(result);
                    viewModel.resetSayfa();
                    viewModel.setMusteriSiparisleriList(null);
                    viewModel.setDahaVarMi(true);
                    getData();
                  }
                },
                child: const Text("Sırala"),
              ),
            ],
          )),
    );
  }

  Observer fab() => Observer(builder: (_) => CustomFloatingActionButton(isScrolledDown: viewModel.isScrolledDown));

  RefreshIndicator body() {
    return RefreshIndicator.adaptive(
        onRefresh: () async {
          viewModel.setMusteriSiparisleriList(null);
          viewModel.setDahaVarMi(true);
          getData();
        },
        child: Observer(
            builder: (_) => musteriSiparisleriList.isNullOrEmpty
                ? (viewModel.musteriSiparisleriList?.isEmpty ?? false)
                    ? const Center(child: Text("Stok Bulunamadı"))
                    : const Center(child: CircularProgressIndicator.adaptive())
                : Observer(builder: (_) {
                    return ListView.builder(
                      primary: false,
                      padding: UIHelper.lowPadding,
                      controller: scrollController,
                      itemCount: musteriSiparisleriList?.length != null ? musteriSiparisleriList!.length + 1 : 0,
                      itemBuilder: (context, index) {
                        if (index == (viewModel.musteriSiparisleriList?.length ?? 0)) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 150),
                            height: (viewModel.dahaVarMi) ? 50 : 0,
                            child: const Center(child: CircularProgressIndicator.adaptive()),
                          );
                        }
                        return MusteriSiparisleriCard(model: viewModel.musteriSiparisleriList?[index]);
                      },
                    );
                  })));
  }

  void getData() async {
    viewModel.setDahaVarMi(false);
    var result =
        await networkManager.dioGet<MusteriSiparisleriModel>(path: ApiUrls.getFaturalar, bodyModel: MusteriSiparisleriModel(), queryParameters: viewModel.musteriSiparisleriRequestModel.toJson());
    if (result.data != null) {
      List<MusteriSiparisleriModel?>? list = result.data.map((e) => e as MusteriSiparisleriModel).toList().cast<MusteriSiparisleriModel?>();
      if (list!.length < 25) {
        viewModel.setDahaVarMi(false);
      } else {
        viewModel.setDahaVarMi(true);
        viewModel.increaseSayfa();
      }
      if (viewModel.musteriSiparisleriList == null) {
        viewModel.setMusteriSiparisleriList(list);
      } else {
        viewModel.addMusteriSiparisleriList(list);
      }
      // if (viewModel.sayfa == 1) {
      //   viewModel.setMusteriSiparisleriList(list);
      //   viewModel.setDahaVarMi(true);
      //   viewModel.increaseSayfa();
      // } else if (viewModel.sayfa > 1) {
      // if (list!.length < 25) {
      //   viewModel.setDahaVarMi(false);
      // } else {
      //   viewModel.setDahaVarMi(true);
      //   viewModel.increaseSayfa();
      // }
      //   viewModel.addMusteriSiparisleriList(list);
      // }
    }
  }
}
