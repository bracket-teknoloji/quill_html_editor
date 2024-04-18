import "package:flutter/material.dart";

class OlcumKalemSecView extends StatefulWidget {
  const OlcumKalemSecView({super.key});

  @override
  State<OlcumKalemSecView> createState() => _OlcumKalemSecViewState();
}

class _OlcumKalemSecViewState extends State<OlcumKalemSecView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: ListView.builder(itemBuilder: (context, index) => const ListTile()),
      );
}
