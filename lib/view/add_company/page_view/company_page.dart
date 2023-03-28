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
                  useSafeArea: true,
                  backgroundColor: LoginConstants.linearGradient.colors[1],
                  context: context,
                  builder: (context) =>
                      Column(mainAxisSize: MainAxisSize.min, children: const [
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
            subtitle: const Text("Bracket Teknoloji"),
          ),
        ),
      ],
    );
  }
}
