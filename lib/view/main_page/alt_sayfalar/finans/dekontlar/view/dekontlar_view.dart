import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/card/dekontlar_card.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../model/dekont_listesi_model.dart";
import "../view_model/dekontlar_view_model.dart";

class DekontlarView extends StatefulWidget {
  const DekontlarView({super.key});

  @override
  State<DekontlarView> createState() => _DekontlarViewState();
}

class _DekontlarViewState extends BaseState<DekontlarView> {
  DekontlarViewModel viewModel = DekontlarViewModel();
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.hasClients) {
          if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            if (viewModel.dahaVarMi) {
              await viewModel.getData();
              viewModel.setIsScrolledDown(true);
            }
          }
          if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
            viewModel.setIsScrolledDown(false);
          } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
            viewModel.setIsScrolledDown(true);
          }
          if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
            viewModel.setIsScrolledDown(false);
          }
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) => AppBarTitle(title: "Dekontlar", subtitle: "${viewModel.dekontListesi?.length ?? 0}"),
        ),
      );

  FloatingActionButton fab() => FloatingActionButton(
        onPressed: () async {
          await Get.toNamed("/mainPage/dekontEkle");
          await viewModel.resetPage();
        },
        child: const Icon(Icons.add_outlined),
      );

  RefreshIndicator body() => RefreshIndicator.adaptive(
        onRefresh: viewModel.resetPage,
        child: Observer(
          builder: (_) {
            if (viewModel.dekontListesi == null) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (viewModel.dekontListesi!.isEmpty) {
              return const Center(
                child: Text("Dekont bulunamadı"),
              );
            }
            return ListView.builder(
              controller: _scrollController,
              primary: false,
              shrinkWrap: true,
              padding: UIHelper.lowPadding,
              itemCount: (viewModel.dekontListesi?.length ?? 0) + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == viewModel.dekontListesi?.length) {
                  return Visibility(
                    visible: viewModel.dahaVarMi,
                    child: const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ),
                  );
                } else {
                  final DekontListesiModel model = viewModel.dekontListesi![index];
                  return DekontlarCard(
                    model: model,
                    onSelected: (value) async => await viewModel.resetPage(),
                  );
                }
              },
            );
          },
        ),
      );
}
