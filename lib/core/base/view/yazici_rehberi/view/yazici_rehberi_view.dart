import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/yazici_model.dart";
import "package:picker/core/base/view/base_scaffold.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/bluetooth/bluetooth_manager.dart";
import "package:picker/core/init/dependency_injection/di_manager.dart";

class YaziciRehberiView extends StatefulWidget {
  const YaziciRehberiView({super.key});

  @override
  State<YaziciRehberiView> createState() => _YaziciRehberiViewState();
}

class _YaziciRehberiViewState extends State<YaziciRehberiView> {
  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(title: const Text("Printer Test")),
    body: StreamBuilder<List<YaziciModel>>(
      stream: DIManager.read<BluetoothManager>().scanForDevices(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final YaziciModel? yazici = snapshot.data?[index];
              return Card(
                child: ListTile(
                  title: Text(yazici?.yaziciAdi ?? ""),
                  subtitle: Text(yazici?.macAdresi ?? ""),
                  onTap: () async {
                    Get.back(result: yazici);
                  },
                ),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ).paddingAll(UIHelper.lowSize),
  );
}
