import 'package:flutter/material.dart';

import '../../base/state/base_state.dart';


class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends BaseState<EndDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          DrawerHeader(
            decoration: BoxDecoration(color: theme.canvasColor),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            duration: const Duration(seconds: 10),
            child: const Text("Favorite"),
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text("Çıkış Yap"),
            onTap: () {
              dialogManager.showExitDialog();
            },
          )
        ]));
  }
}
