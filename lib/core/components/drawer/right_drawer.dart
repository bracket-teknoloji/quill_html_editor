import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../base/state/base_state.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends BaseState<EndDrawer> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20))),
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.blue, Colors.red]),
              backgroundBlendMode: BlendMode.darken,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
            ),
            height: height * 0.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(child: LottieBuilder.network("https://assets5.lottiefiles.com/packages/lf20_l4fgppor.json")),
                // Text(CacheManager.getAnaVeri()!.userModel?.adSoyad ?? ""),
                // Text(CacheManager.getAnaVeri()!.userModel?.kuladi ?? ""),
                // Text(CacheManager.getAnaVeri()!.userModel?.erpKullanici ?? ""),
                // const Text("Profil"),
                // Text(CacheManager.getAnaVeri()!.userModel?.profilAdi ?? ""),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.logout_outlined),
            title: const Text("Çıkış Yap"),
            onTap: () {
              scaffoldKey.currentState!.closeDrawer();
              scaffoldKey.currentState!.closeEndDrawer();
              dialogManager.showExitDialog();
            },
          )
        ]));
  }
}
