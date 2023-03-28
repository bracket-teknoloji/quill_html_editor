import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

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
                  context: context,
                  builder: (context) => Column(children: const [
                        ListTile(
                          title: Text("Firma Adı"),
                          subtitle: Text("Bracket Teknoloji"),
                        ),
                        ListTile(
                            title: Text("Firma E-Posta Adresi"),
                            subtitle: Text(""))
                      ]));
            },
            title: const Text("Add Company"),
            trailing: const Icon(Icons.chevron_right_outlined),
            subtitle: const Text("Bracket Teknoloji"),
          ),
        ),
      ],
    );
  }
}
