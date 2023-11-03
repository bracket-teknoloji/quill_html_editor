import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/banka_listesi/view_model/banka_listesi_view_model.dart";

class BankaListesiView extends StatefulWidget {
  const BankaListesiView({super.key});

  @override
  State<BankaListesiView> createState() => _BankaListesiViewState();
}

class _BankaListesiViewState extends BaseState<BankaListesiView> {
  final BankaListesiViewModel viewModel = BankaListesiViewModel();


  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              return AppBarTitle();
            },
          ),
        ),
        body: const Center(
          child: Text("Banka Listesi"),
        ),
      );
}
