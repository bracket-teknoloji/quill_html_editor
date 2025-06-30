import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/view/base_scaffold.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/view/main_page/alt_sayfalar/payker/payker_firma_bayi_listesi/view_model/payker_firma_bayi_listesi_view_model.dart";

class PaykerFirmaBayiListesiView extends StatefulWidget {
  const PaykerFirmaBayiListesiView({super.key, this.isGetData = false});

  final bool isGetData;

  @override
  State<PaykerFirmaBayiListesiView> createState() => _PaykerFirmaBayiListesiViewState();
}

class _PaykerFirmaBayiListesiViewState extends State<PaykerFirmaBayiListesiView> {
  final PaykerFirmaBayiListesiViewModel viewModel = PaykerFirmaBayiListesiViewModel();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => viewModel.getData());
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const Text("Payker Firma Bayi Listesi"),
    ),
    body: Observer(
      builder: (_) => RefreshableListView(
        onRefresh: viewModel.getData,
        items: viewModel.observableList,
        itemBuilder: (item) => Card(
          child: ListTile(
            title: Text(item.text ?? ""),
            subtitle: item.id != null ? Text(item.id!) : null,
            onTap: widget.isGetData ? () => Get.back(result: item) : null,
            // subtitle: Text(item.subtitle),
          ),
        ),
      ),
    ),
  );
}
