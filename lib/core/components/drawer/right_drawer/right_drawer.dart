import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../base/state/base_state.dart';
import '../../../constants/ui_helper/icon_helper.dart';
import '../../../constants/ui_helper/text_style_helper.dart';
import '../../../constants/ui_helper/ui_helper.dart';
import '../../../init/cache/cache_manager.dart';
import 'drawer_constants.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends BaseState<EndDrawer> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var textStyle = const TextStyle(fontSize: 15, color: Colors.black);
    return Drawer(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      SizedBox(
        height: height * 0.3,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: LottieBuilder.network("https://assets7.lottiefiles.com/packages/lf20_kHcgEqT4Li.json")),
            Text(CacheManager.getAnaVeri()!.userModel?.adSoyad ?? "", style: TextStyleHelper.titleBlack),
            Text(CacheManager.getVerifiedUser!["company"] ?? "", style: TextStyleHelper.subtitleBlack),
            Text(CacheManager.getVerifiedUser!["email"] ?? "", style: TextStyleHelper.subtitleBlack.copyWith(color: TextStyleHelper.subtitleBlack.color!.withOpacity(0.5))),
            Text("Profil", style: TextStyleHelper.subtitleBlack.copyWith(color: TextStyleHelper.subtitleBlack.color!.withOpacity(0.5))),
            Text(CacheManager.getAnaVeri()!.userModel?.profilAdi ?? "", style: textStyle),
          ],
        ),
      ),
      const Divider(
        endIndent: 0,
        indent: 0,
      ),
      Expanded(
        child: ListView.separated(
            padding: UIHelper.zeroPadding,
            itemBuilder: (context, index) => ListTile(
                  dense: true,
                  visualDensity: VisualDensity.compact,
                  title: Text(
                    "${DrawerMenuItems().items[index]}",
                    style: TextStyleHelper.subtitleBlack,
                  ),
                  leading: IconHelper.getIcon(IconHelper.smallIconBlack, Icons.android_rounded),
                ),
            separatorBuilder: (context, index) => const Divider(),
            itemCount: DrawerMenuItems().items.length),
      ),
      Expanded(
        child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Get.offAndToNamed("/entryCompany");
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconHelper.getIcon(
                          IconHelper.smallIconPrimary,
                          Icons.storage_rounded,
                        ),
                        const Text("Şirket Değiştir", style: TextStyleHelper.captionBlack),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      dialogManager.showExitDialog();
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconHelper.getIcon(
                          IconHelper.smallIconPrimary,
                          Icons.exit_to_app_rounded,
                        ),
                        const Text("Çıkış", style: TextStyleHelper.captionBlack),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      )
    ]));
  }
}
