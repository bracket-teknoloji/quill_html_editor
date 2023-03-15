import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/components/dialog/dialog_manager.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            duration: Duration(seconds: 10),
            child: Text("Favorite"),
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: Text("Çıkış Yap ${context.isIOSDevice}"),
            onTap: () => DialogManager.exitDialog(context),
          )
        ]));
  }
}
