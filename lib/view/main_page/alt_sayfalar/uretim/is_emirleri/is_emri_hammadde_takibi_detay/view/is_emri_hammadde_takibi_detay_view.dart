import "package:flutter/material.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_hammade_takibi/model/is_emri_hammadde_takibi_listesi_model.dart";

class IsEmriHammaddeTakibiDetayView extends StatefulWidget {
  final IsEmriHammaddeTakibiListesiModel model;
  const IsEmriHammaddeTakibiDetayView({super.key, required this.model});

  @override
  State<IsEmriHammaddeTakibiDetayView> createState() => _IsEmriHammaddeTakibiDetayViewState();
}

class _IsEmriHammaddeTakibiDetayViewState extends State<IsEmriHammaddeTakibiDetayView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: widget.model.stokKodu,
          ),
        ),
      );
}
