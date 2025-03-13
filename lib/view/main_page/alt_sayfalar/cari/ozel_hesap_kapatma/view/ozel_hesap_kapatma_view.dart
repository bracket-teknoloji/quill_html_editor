import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/ozel_hesap_kapatma/view_model/ozel_hesap_kapatma_view_model.dart";

class OzelHesapKapatmaView extends StatefulWidget {
  const OzelHesapKapatmaView({required this.cariModel, super.key});

  final CariListesiModel cariModel;

  @override
  State<OzelHesapKapatmaView> createState() => _OzelHesapKapatmaViewState();
}

class _OzelHesapKapatmaViewState extends State<OzelHesapKapatmaView> {
  final OzelHesapKapatmaViewModel viewModel = OzelHesapKapatmaViewModel();

  @override
  void initState() {
    viewModel
      ..setCariKodu(widget.cariModel.cariKodu ?? "")
      ..setBA(widget.cariModel.cariTip == "A" ? "B" : "A");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(title: const AppBarTitle(title: "Özel Hesap Kapatma")),
    body: Column(
      children: [
        Card(
          child: CustomLayoutBuilder.divideInHalf(
            children: [
              Text("Alacak Tutarı: ${widget.cariModel.alacakToplami ?? ""}"),
              Text("Kalan Tutar: ${widget.cariModel.alacakToplami ?? ""}"),
              Text("Açıklama: ${widget.cariModel.aciklama1 ?? ""}"),
            ],
          ),
        ),
        Expanded(
          child: Observer(
            builder:
                (_) => RefreshableListView(
                  onRefresh: () async {},
                  items: viewModel.observableList,
                  itemBuilder:
                      (item) => Card(
                        child: CheckboxListTile.adaptive(
                          value: false,
                          onChanged: (value) {},
                          title: Text(item.aciklama ?? ""),
                          subtitle: CustomLayoutBuilder.divideInHalf(children: [
                            
                          ]),
                        ),
                      ),
                ),
          ),
        ),
      ],
    ),
  );
}
