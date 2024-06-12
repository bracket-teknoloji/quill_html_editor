import "package:flutter/material.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

class BarkodTanimlaEditView extends StatefulWidget {
  final StokListesiModel model;
  const BarkodTanimlaEditView({super.key, required this.model});

  @override
  State<BarkodTanimlaEditView> createState() => _BarkodTanimlaEditViewState();
}

class _BarkodTanimlaEditViewState extends State<BarkodTanimlaEditView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Barkod Tanımla",
            subtitle: widget.model.stokKodu,
          ),
        ),
      );
}
