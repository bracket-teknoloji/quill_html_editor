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
    return ListView.builder(
        itemCount: getListLength(),
        itemBuilder: getListLength() == 0
            ? (context, index) => const Center(
                  child: Text("Hesap Bulunamadı"),
                )
            : (context, index) {
                AccountResponseModel account =
                    Hive.box("accounts").getAt(index);
                return ListTile(
                  onTap: () {
                    bottomSheet(context);
                  },
                  title: Text(account.firma.toString()),
                  subtitle: Text(account.email.toString()),
                );
              });
  }

  Future<dynamic> bottomSheet(BuildContext context) {
    return showModalBottomSheet(
        isDismissible: true,
        useSafeArea: true,
        backgroundColor: Colors.white,
        context: context,
        builder: (context) =>
            Column(mainAxisSize: MainAxisSize.min, children: const [
              ListTile(
                trailing: Icon(Icons.edit_outlined),
                title: Text("Düzelt"),
              ),
              ListTile(
                trailing: Icon(Icons.delete_outline),
                title: Text("Sil"),
              ),
              ListTile(
                trailing: Icon(Icons.workspaces_outlined),
                title: Text("Sunucu Tercihi"),
              )
            ]));
  }
}
