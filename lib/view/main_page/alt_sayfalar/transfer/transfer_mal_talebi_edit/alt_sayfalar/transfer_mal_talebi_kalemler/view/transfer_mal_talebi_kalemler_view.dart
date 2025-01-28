import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";

class TransferMalTalebiKalemlerView extends StatefulWidget {
  const TransferMalTalebiKalemlerView({super.key});

  @override
  State<TransferMalTalebiKalemlerView> createState() => _TransferMalTalebiKalemlerViewState();
}

class _TransferMalTalebiKalemlerViewState extends State<TransferMalTalebiKalemlerView> {
  @override
  Widget build(BuildContext context) => BaseScaffold(
        body: body(),
        floatingActionButton: fab(),
      );

  CustomFloatingActionButton fab() => const CustomFloatingActionButton(isScrolledDown: true);

  Center body() => const Center(child: Text("TransferMalTalebiKalemlerView"));
}
