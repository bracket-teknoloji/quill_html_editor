import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/depo_bakiye_durumu/view_model/depo_bakiye_durumu_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

class DepoBakiyeDurumuView extends StatefulWidget {
  final StokListesiModel? model;
  const DepoBakiyeDurumuView({super.key, this.model});

  @override
  State<DepoBakiyeDurumuView> createState() => _DepoBakiyeDurumuViewState();
}

class _DepoBakiyeDurumuViewState extends BaseState<DepoBakiyeDurumuView> {
  final DepoBakiyeDurumuViewModel viewModel = DepoBakiyeDurumuViewModel();

  @override
  void initState() {
    if (widget.model != null) {
      viewModel.setStokKodu(widget.model?.stokKodu);
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Depo Bakiye Durumu",
            subtitle: widget.model?.stokAdi,
          ),
        ),
        body: Observer(
          builder: (_) => ListView.builder(
            itemCount: viewModel.subeAdiList?.length ?? 0,
            itemBuilder: (context, index) => Card(child: ListView.builder(itemCount: 5, itemBuilder: (context, index2) => Text(index2.toString()))),
          ),
        ),
      );
}
