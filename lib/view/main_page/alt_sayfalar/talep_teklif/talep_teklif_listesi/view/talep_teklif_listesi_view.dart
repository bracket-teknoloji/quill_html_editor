import "package:flutter/material.dart";
import "package:flutter/rendering.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/constants/enum/talep_teklif_tipi_enum.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/view/talep_teklif_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/view_model/talep_teklif_listesi_view_model.dart";

class TalepTeklifListesiView extends StatefulWidget {
  final TalepTeklifEnum talepTeklifEnum;
  const TalepTeklifListesiView({super.key, required this.talepTeklifEnum});

  @override
  State<TalepTeklifListesiView> createState() => _TalepTeklifListesiViewState();
}

class _TalepTeklifListesiViewState extends State<TalepTeklifListesiView> {
  final TalepTeklifListesiViewModel viewModel = TalepTeklifListesiViewModel();
  late final ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();
    viewModel.setPickerBelgeTuru(widget.talepTeklifEnum.rawValue);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
      _scrollController.addListener(() async {
        if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && viewModel.dahaVarMi) {
          await viewModel.getData();
          viewModel.setIsScrolledDown(true);
        }
        if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
          viewModel.setIsScrolledDown(true);
        } else if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
          viewModel.setIsScrolledDown(false);
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
        appBar: AppBar(
          title: Text(widget.talepTeklifEnum.getName),
        ),
        bottomNavigationBar: const BottomBarWidget(isScrolledDown: true, children: []),
        body: RefreshIndicator.adaptive(
          onRefresh: viewModel.resetPage,
          child: Observer(
            builder: (_) {
              if (viewModel.talepTeklifListesiModelList == null) {
                return const Center(child: CircularProgressIndicator.adaptive());
              } else if (viewModel.talepTeklifListesiModelList!.isEmpty) {
                return const Center(child: Text("Veri Yok"));
              } else {
                return ListView.builder(
                  controller: _scrollController,
                  primary: false,
                  padding: UIHelper.lowPadding,
                  itemCount: viewModel.talepTeklifListesiModelList!.length + (viewModel.dahaVarMi ? 1 : 0),
                  itemBuilder: (_, index) {
                    if (index == viewModel.talepTeklifListesiModelList!.length) {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    }
                    final TalepTeklifListesiModel model = viewModel.talepTeklifListesiModelList![index];
                    return Card(
                      child: ListTile(
                        title: Text(model.belgeNo ?? ""),
                        subtitle: Text(model.cariAdi ?? ""),
                        trailing: Text(model.genelToplam?.toString() ?? ""),
                      ),
                    );
                  },
                );
              }
            },
          ),
        ),
      );
}
