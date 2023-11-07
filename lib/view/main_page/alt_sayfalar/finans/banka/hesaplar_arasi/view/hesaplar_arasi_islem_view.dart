import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/constants/enum/hesaplar_arasi_enum.dart";

class HesaplarArasiIslemView extends StatefulWidget {
  final HesaplarArasiEnum hesaplarArasiEnum;
  const HesaplarArasiIslemView({super.key, required this.hesaplarArasiEnum});

  @override
  State<HesaplarArasiIslemView> createState() => _HesaplarArasiIslemViewState();
}

class _HesaplarArasiIslemViewState extends BaseState<HesaplarArasiIslemView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Hesaplar Arası İşlem"),
        ),
        body: Container(),
      );
}
