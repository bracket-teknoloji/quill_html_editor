import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: LottieBuilder.network("https://assets7.lottiefiles.com/packages/lf20_kHcgEqT4Li.json")),
            Text(CacheManager.getAnaVeri()!.userModel?.adSoyad ?? "", style: TextStyleHelper.titleBlack),
            Text(CacheManager.getVerifiedUser!["company"] ?? "", style: TextStyleHelper.subtitleBlack),
            Text(CacheManager.getVerifiedUser!["email"] ?? "", style: TextStyleHelper.subtitleBlack.copyWith(color: TextStyleHelper.subtitleBlack.color!.withOpacity(0.5))),
            Text("Profil", style: TextStyleHelper.subtitleBlack.copyWith(color: TextStyleHelper.subtitleBlack.color!.withOpacity(0.5), fontSize: 12)).marginOnly(top: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CacheManager.getAnaVeri()!.userModel!.admin == "E"
                    ? SvgPicture.asset(
                        "assets/icons/PickerSvgIcon/Guvenlik.svg",
                        height: 20,
                        allowDrawingOutsideViewBox: true,
                        color: TextStyleHelper.subtitle.color,
                      ).marginOnly(right: 10)
                    : const SizedBox(),
                Text(CacheManager.getAnaVeri()!.userModel?.profilAdi ?? "Yetkili Kullanıcı",
                    style: CacheManager.getAnaVeri()!.userModel?.admin == "E" ? TextStyleHelper.subtitle : textStyle),
              ],
            ).marginOnly(bottom: 10),
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
            itemBuilder: (context, index) {
              return ListTile(
                dense: true,
                title: Text(
                  "${DrawerMenuItems().items[index]}",
                  style: TextStyleHelper.subtitleBlack,
                ),
                horizontalTitleGap: 0,
                leading: IconHelper.smallIcon(DrawerMenuItems().items[index].icon.toString(), color: Colors.black.withOpacity(0.8)).marginZero,
              );
            },
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
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: UIHelper.zeroBorderRadius),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Get.toNamed("/entryCompany");
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconHelper.smallIcon("Baglanti", color: UIHelper.primaryColor).marginOnly(right: 10),
                          Text("Şirket Değiştir", style: TextStyleHelper.subtitleBlack),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.grey, width: 0.5), left: BorderSide(color: Colors.grey, width: 0.5)),
                    ),
                    child: TextButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(borderRadius: UIHelper.zeroBorderRadius),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        dialogManager.showExitDialog();
                      },
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconHelper.smallIcon("Cikis", color: UIHelper.primaryColor).marginOnly(right: 10),
                          Text("Çıkış", style: TextStyleHelper.subtitleBlack),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      )
    ]));
  }
}
