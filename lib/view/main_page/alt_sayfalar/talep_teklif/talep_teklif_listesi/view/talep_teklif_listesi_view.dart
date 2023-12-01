import "package:flutter/material.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/constants/enum/talep_teklif_tipi_enum.dart";

class TalepTeklifListesiView extends StatefulWidget {
  final TalepTeklifEnum talepTeklifEnum;
  const TalepTeklifListesiView({super.key, required this.talepTeklifEnum});

  @override
  State<TalepTeklifListesiView> createState() => _TalepTeklifListesiViewState();
}

class _TalepTeklifListesiViewState extends State<TalepTeklifListesiView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Talep Teklif Listesi"),
        ),
        bottomNavigationBar: const BottomBarWidget(isScrolledDown: true, children: []),
        body: RefreshIndicator.adaptive(
          onRefresh: () async {},
          child: ListView(),
        ),
      );
}
