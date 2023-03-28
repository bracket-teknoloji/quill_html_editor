import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/constants/login_page_constants.dart';

class AccountsView extends StatefulWidget {
  const AccountsView({super.key});

  @override
  State<AccountsView> createState() => _AccountsViewState();
}

class _AccountsViewState extends State<AccountsView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(
          margin: context.paddingNormal,
          child: ListTile(
            onTap: () {
              showModalBottomSheet(
                  isDismissible: true,
                  useSafeArea: true,
                  backgroundColor: LoginConstants.linearGradient.colors[1],
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
            },
            title: const Text("Merhaba"),
            subtitle: const Text("Bracket Teknoloji"),
          ),
        ),
      ],
    );
  }
}
