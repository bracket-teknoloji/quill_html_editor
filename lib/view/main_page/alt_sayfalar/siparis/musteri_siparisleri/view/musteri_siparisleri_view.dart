import 'package:flutter/material.dart';
import 'package:picker/core/base/state/base_state.dart';

class MusteriSiparisleriView extends StatefulWidget {
  const MusteriSiparisleriView({super.key});

  @override
  State<MusteriSiparisleriView> createState() => _MusteriSiparisleriViewState();
}

class _MusteriSiparisleriViewState extends BaseState<MusteriSiparisleriView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Müşteri Siparişleri"),
      ),
      body: Container(),
    );
  }
}
