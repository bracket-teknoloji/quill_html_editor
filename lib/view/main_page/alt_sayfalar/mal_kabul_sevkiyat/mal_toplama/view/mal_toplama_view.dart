import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/alt_sayfalar/mal_kabul_sevkiyat/mal_toplama/view_model/mal_toplama_view_model.dart";

final class MalToplamaView extends StatefulWidget {
  const MalToplamaView({super.key});

  @override
  State<MalToplamaView> createState() => _MalToplamaViewState();
}

final class _MalToplamaViewState extends State<MalToplamaView> {
  final MalToplamaViewModel viewModel = MalToplamaViewModel();
  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "Mal Toplama"),
      actions: [
        IconButton(icon: const Icon(Icons.search_outlined), onPressed: () {}),
        IconButton(icon: const Icon(Icons.sort_by_alpha_outlined), onPressed: () {}),
        IconButton(icon: const Icon(Icons.filter_alt_outlined), onPressed: () {}),
      ],
    ),
  );
}
