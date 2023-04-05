import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
            duration: const Duration(seconds: 10),
            margin: const EdgeInsets.all(0),
            child: LottieBuilder.network("https://assets5.lottiefiles.com/packages/lf20_l4fgppor.json"),
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
