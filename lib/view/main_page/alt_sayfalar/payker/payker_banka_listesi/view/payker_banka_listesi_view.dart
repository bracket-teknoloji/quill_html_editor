import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/core/base/view/base_scaffold.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_banka_listesi/view_model/payker_banka_listesi_view_model.dart";

class PaykerBankaListesiView extends StatefulWidget {
  const PaykerBankaListesiView({super.key});

  @override
  State<PaykerBankaListesiView> createState() => _PaykerBankaListesiViewState();
}

class _PaykerBankaListesiViewState extends State<PaykerBankaListesiView> {
  final PaykerBankaListesiViewModel _viewModel = PaykerBankaListesiViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const AppBarTitle(
        title: "Banka Listesi",
      ),
    ),
    body: Observer(
      builder: (_) => RefreshableListView(
        onRefresh: _viewModel.getData,
        items: _viewModel.observableList,
        itemBuilder: (item) => Card(
          child: ListTile(
            title: Text(item.text ?? ""),
            subtitle: Text(item.id ?? ""),
            onTap: () {},
          ),
        ),
      ),
    ),
  );
}
