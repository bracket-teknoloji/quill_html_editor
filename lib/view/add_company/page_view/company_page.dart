import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/view/add_company/page_view/account_response_model.dart';

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
      body: ListView.builder(
          itemCount: getListLength() == 0 ? 1 : getListLength(),
          itemBuilder: getListLength() == 0
              ? (context, index) => const Center(
                    child: Text("Hesap Bulunamadı"),
                  )
              : (context, index) {
                  AccountResponseModel account =
                      Hive.box("accounts").getAt(index);
                  return ListTile(
                    onTap: () {
                      bottomSheet(context,
                          kisaAd: account.firmaKisaAdi.toString());
                    },
                    title: Text(account.firma.toString()),
                    subtitle: Text(account.email.toString()),
                  );
                }),
    );
  }

  Future<dynamic> bottomSheet(BuildContext context, {required String kisaAd}) {
    return showModalBottomSheet(
        isDismissible: true,
        useSafeArea: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                trailing: const Icon(Icons.edit_outlined),
                title: const Text("Düzelt"),
                onTap: () {},
              ),
              ListTile(
                trailing: const Icon(Icons.delete_outline),
                title: const Text("Sil"),
                onTap: () {
                  Hive.box("accounts").delete(kisaAd);
                  setState(() {});
                  //close bottom sheet
                  Navigator.pop(context);
                },
              ),
              const ListTile(
                trailing: Icon(Icons.workspaces_outlined),
                title: Text("Sunucu Tercihi"),
              )
            ]));
  }
}
