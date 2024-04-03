import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";

class ProsesEkleView extends StatefulWidget {
  const ProsesEkleView({super.key});

  @override
  State<ProsesEkleView> createState() => _ProsesEkleViewState();
}

class _ProsesEkleViewState extends BaseState<ProsesEkleView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(
            title: "Proses Ekle",
          ),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ),
      );
}
