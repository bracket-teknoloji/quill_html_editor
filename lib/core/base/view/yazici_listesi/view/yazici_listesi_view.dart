import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/yazici_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/yazici_listesi/view_model/yazici_listesi_view_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/bluetooth/bluetooth_manager.dart";

class YaziciListesiView extends StatefulWidget {
  const YaziciListesiView({super.key});

  @override
  State<YaziciListesiView> createState() => _YaziciListesiViewState();
}

class _YaziciListesiViewState extends BaseState<YaziciListesiView> {
  @override
  void initState() {
    viewModel.setYaziciListesi();
    super.initState();
  }

  final YaziciListesiViewModel viewModel = YaziciListesiViewModel();
  @override
  Widget build(BuildContext context) =>
      BaseScaffold(appBar: appbar(), floatingActionButton: fab(), body: body().paddingAll(UIHelper.lowSize));

  AppBar appbar() => AppBar(title: const Text("Yazıcı Listesi"));

  CustomFloatingActionButton fab() => CustomFloatingActionButton(
    isScrolledDown: true,
    onPressed: () async {
      final result = await Get.toNamed("/yaziciEkle");
      if (result case final YaziciModel result) {
        viewModel
          ..addYaziciListesi(result)
          ..setYaziciListesi();
      }
    },
  );

  Observer body() => Observer(
    builder:
        (_) => RefreshableListView(
          onRefresh: () async => viewModel.setYaziciListesi(),
          items: viewModel.yaziciListesi,
          itemBuilder:
              (item) => Card(
                child: ListTile(
                  title: Text(item.yaziciAdi ?? ""),
                  subtitle: Text(item.macAdresi),
                  leading: StreamBuilder<bool>(
                    stream: BluetoothManager().isDeviceConnected(item.macAdresi),
                    builder:
                        (context, snapshot) => IconButton(
                          onPressed: () async {
                            if (snapshot.data != true) {
                              await BluetoothManager().connectToDevice(item.macAdresi);
                            } else {
                              await BluetoothManager().disconnectFromDevice();
                            }
                            viewModel.setYaziciListesi();
                          },
                          icon: Icon(
                            snapshot.data != true ? Icons.bluetooth_searching : Icons.bluetooth_connected,
                            color: snapshot.data != true ? null : Colors.green,
                          ),
                        ),
                  ),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () async {
                          BluetoothManager().printText();
                        },
                        icon: const Icon(Icons.print_outlined),
                      ),
                      IconButton(
                        onPressed: () {
                          dialogManager.showAreYouSureDialog(
                            onYes: () async {
                              await BluetoothManager().disconnectFromDevice();
                              viewModel.removeYaziciListesi(item);
                            },
                          );
                        },
                        icon: const Icon(Icons.delete_outline_outlined),
                      ),
                    ],
                  ),
                ),
              ),
        ),
  );
}
