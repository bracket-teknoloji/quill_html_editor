import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../core/base/state/base_state.dart';
import 'account_response_model.dart';

class AccountsView extends StatefulWidget {
  const AccountsView({super.key});

  @override
  State<AccountsView> createState() => _AccountsViewState();
}

int getListLength() {
  return Hive.box("accounts").length;
}

class _AccountsViewState extends BaseState<AccountsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hesaplar"),
      ),
      body: getListLength() == 0
          ? const Center(child: Text("Hesap Bulunamadı"))
          : ListView.builder(
              itemCount: getListLength() == 0 ? 1 : getListLength(),
              itemBuilder: (context, index) {
                AccountResponseModel account = Hive.box("accounts").getAt(index);
                return ListTile(
                  onTap: () {
                    bottomSheet(context, firma: account.firma.toString());
                  },
                  title: Text(account.firma.toString()),
                  subtitle: Text(account.email.toString()),
                );
              }),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context, {required String firma}) {
    return showModalBottomSheet(
        isDismissible: true,
        useSafeArea: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                trailing: const Icon(Icons.edit_outlined),
                title: const Text("Düzelt"),
                onTap: () {
                  //TODO Düzenleme Sayfasına Yönlendir
                },
              ),
              ListTile(
                trailing: const Icon(Icons.delete_outline),
                title: const Text("Sil"),
                onTap: () {
                  Navigator.pop(context);
                  dialogManager.showAreYouSureDialog(() {
                    Hive.box("accounts").delete(firma);
                    setState(() {});
                  });
                },
              ),
              const ListTile(
                trailing: Icon(Icons.workspaces_outlined),
                title: Text("Sunucu Tercihi"),
              )
            ]));
  }
}
