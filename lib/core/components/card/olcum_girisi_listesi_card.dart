import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_girisi/model/olcum_girisi_listesi_model.dart";

class OlcumGirisiListesiCard extends StatefulWidget {
  final OlcumGirisiListesiModel model;
  const OlcumGirisiListesiCard({super.key, required this.model});

  @override
  State<OlcumGirisiListesiCard> createState() => _OlcumGirisiListesiCardState();
}

class _OlcumGirisiListesiCardState extends BaseState<OlcumGirisiListesiCard> {
  OlcumGirisiListesiModel get model => widget.model;

  @override
  Widget build(BuildContext context) => const Card(
        child: ListTile(
          title: Text("Ölçüm Girişi"),
        ),
      );
}
