import "package:flutter/material.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";

import "../view_model/kasa_dekontlar_view_model.dart";

class KasaDekontlarView extends StatefulWidget {
  const KasaDekontlarView({super.key});

  @override
  State<KasaDekontlarView> createState() => _KasaDekontlarViewState();
}

class _KasaDekontlarViewState extends State<KasaDekontlarView> {
  KasaDekontlarViewModel viewModel = KasaDekontlarViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(title: "Dekontlar", subtitle: "(25)"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: ListView(),
    );
  }
}
