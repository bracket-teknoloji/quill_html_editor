import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../base/state/base_state.dart";
import "../../../constants/ui_helper/icon_helper.dart";
import "../../../constants/ui_helper/ui_helper.dart";
import "../../../gen/assets.gen.dart";
import "../../../init/cache/cache_manager.dart";
import "drawer_constants.dart";

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends BaseState<EndDrawer> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => Drawer(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(UIHelper.highSize),
            bottomLeft: Radius.circular(UIHelper.highSize),
          ),
        ),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Expanded(child: LottieBuilder.network("https://assets9.lottiefiles.com/packages/lf20_yMpiqXia1k.json")),
                  Assets.lotties.personLottie.lottie(height: height * 0.2),
                  Text(CacheManager.getAnaVeri!.userModel?.adSoyad ?? "", style: theme.textTheme.bodyLarge),
                  Text(CacheManager.getVerifiedUser.account?.firma ?? "", style: theme.textTheme.bodyMedium),
                  Text("Profil", style: theme.textTheme.bodySmall).marginOnly(top: UIHelper.midSize),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (CacheManager.getAnaVeri!.userModel!.admin == "E")
                        Icon(Icons.local_police_outlined, color: UIHelper.primaryColor, size: 20).marginOnly(right: UIHelper.lowSize)
                      else
                        const SizedBox(),
                      Text(
                        CacheManager.getAnaVeri!.userModel?.profilAdi ?? "Yetkili Kullanıcı",
                        style: CacheManager.getAnaVeri!.userModel?.admin == "E"
                            ? theme.textTheme.bodyMedium?.copyWith(color: UIHelper.primaryColor, fontWeight: FontWeight.bold)
                            : theme.textTheme.bodySmall,
                      ),
                    ],
                  ).marginOnly(bottom: UIHelper.midSize),
                ],
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
                    onTap: DrawerMenuItems.items[index].onTap,
                    title: Text(
                      "${DrawerMenuItems.items[index]}",
                      style: theme.textTheme.bodyMedium,
                    ),
                    horizontalTitleGap: 0,
                    leading: Icon(DrawerMenuItems.items[index].iconWidget, size: 20, color: theme.colorScheme.primary),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: DrawerMenuItems.items.length,
                ),
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.change_circle_outlined), label: const Text("Şirket Değiştir")).paddingAll(UIHelper.lowSize)),
              //     Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.logout_outlined), label: const Text("Çıkış")).paddingAll(UIHelper.lowSize)),
              //   ],
              // ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: theme.dividerColor, width: 0.1)),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(borderRadius: UIHelper.zeroBorderRadius),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Get.toNamed("/entryCompany", arguments: false);
                          },
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Icon(Icons.rule_s)
                              IconHelper.smallIcon("sirket_degistir", color: UIHelper.primaryColor, size: 24).marginOnly(right: UIHelper.midSize),
                              Text("Şirket Değiştir", style: theme.textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border(top: BorderSide(color: theme.dividerColor, width: 0.1), left: BorderSide(color: theme.dividerColor, width: 0.1)),
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
                              Icon(Icons.logout_outlined, color: UIHelper.primaryColor, size: 24).marginOnly(right: UIHelper.midSize),
                              Text("Çıkış", style: theme.textTheme.bodySmall),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
