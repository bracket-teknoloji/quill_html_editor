import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";

class BankaHareketleriView extends StatefulWidget {
  const BankaHareketleriView({super.key});

  @override
  State<BankaHareketleriView> createState() => _BankaHareketleriViewState();
}

class _BankaHareketleriViewState extends BaseState<BankaHareketleriView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(
            title: "Banka Hareketleri",
          ),
        ),
        body: Container(),
      );
}
