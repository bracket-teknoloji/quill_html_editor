import "package:flutter/material.dart";
import "package:picker/core/components/bottom_bar/bottom_bar.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";

class DekontEditKalemlerView extends StatefulWidget {
  const DekontEditKalemlerView({super.key});

  @override
  State<DekontEditKalemlerView> createState() => _DekontEditKalemlerViewState();
}

class _DekontEditKalemlerViewState extends State<DekontEditKalemlerView> {
  @override
  Widget build(BuildContext context) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: ListView(
          padding: UIHelper.lowPadding,
        ),
        bottomNavigationBar: const BottomBarWidget(isScrolledDown: true, children: []),
      );
}
