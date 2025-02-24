import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/view/belge_kontrol/view_model/belge_kontrol_view_model.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/wrap/appbar_title.dart";

final class BelgeKontrolView extends StatefulWidget {
  const BelgeKontrolView({super.key});

  @override
  State<BelgeKontrolView> createState() => _BelgeKontrolViewState();
}

final class _BelgeKontrolViewState extends State<BelgeKontrolView> {
  final BelgeKontrolViewModel viewModel = BelgeKontrolViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await viewModel.getData();
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const AppBarTitle(title: "Belge Kontrol")),
    body: Column(
      children: [
        Expanded(
          child: Observer(
            builder:
                (_) => RefreshableListView(
                  onRefresh: () async {},
                  items: viewModel.observableList,
                  itemBuilder: (item) => Text(item.belgeNo ?? ""),
                ),
          ),
        ),
      ],
    ),
  );
}
