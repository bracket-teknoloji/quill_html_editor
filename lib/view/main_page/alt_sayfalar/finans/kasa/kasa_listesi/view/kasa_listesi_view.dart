import "package:flutter/material.dart";
import "package:picker/core/components/appbar/appbar_prefered_sized_bottom.dart";
import "package:picker/core/components/button/elevated_buttons/bottom_appbar_button.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/button/elevated_buttons/footer_button.dart";

class KasaListesiView extends StatefulWidget {
  const KasaListesiView({super.key});

  @override
  State<KasaListesiView> createState() => _KasaListesiViewState();
}

class _KasaListesiViewState extends BaseState<KasaListesiView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: appBar(),
      bottomNavigationBar: bottomAppBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text("Kasa Listesi"),
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))],
      bottom: AppBarPreferedSizedBottom(children: [
        AppBarButton(icon: Icons.filter_alt_outlined, onPressed: () {}, child: const Text("Filtrele")),
        AppBarButton(icon: Icons.sort_by_alpha_outlined, onPressed: () {}, child: const Text("Sırala")),
        AppBarButton(icon: Icons.refresh_outlined, onPressed: () {}, child: const Text("Yenile")),
      ]),
    );
  }

  Center body() => const Center(child: Text("Kasa Listesi"));

  BottomAppBar bottomAppBar() {
    return BottomAppBar(
        child: Row(
      children: [
        Expanded(
            child: FooterButton(children: [
          const Text("Gelir"),
          Text(
            "asd $mainCurrency",
            style: const TextStyle(color: Colors.green),
          ),
        ])),
        const VerticalDivider(),
        Expanded(
            child: FooterButton(children: [
          const Text("Gider"),
          Text("s $mainCurrency", style: const TextStyle(color: Colors.red)),
        ])),
        const VerticalDivider(),
        Expanded(
            child: FooterButton(children: [
          const Text("Bakiye"),
          Text("a $mainCurrency", style: const TextStyle(color: Colors.grey)),
        ]))
      ],
    ));
  }
}
