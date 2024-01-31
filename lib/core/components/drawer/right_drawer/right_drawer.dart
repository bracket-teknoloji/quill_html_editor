import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

import "../../../../view/add_company/model/account_model.dart";
import "../../../../view/add_company/model/account_response_model.dart";
import "../../../base/state/base_state.dart";
import "../../../constants/ui_helper/icon_helper.dart";
import "../../../constants/ui_helper/ui_helper.dart";
import "../../../gen/assets.gen.dart";
import "../../../init/app_info/app_info.dart";
import "../../../init/cache/cache_manager.dart";
import "drawer_model.dart";

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
                  Text(loc(context).rightDrawer.profile, style: theme.textTheme.bodySmall).marginOnly(top: UIHelper.midSize),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      if (CacheManager.getAnaVeri!.userModel!.admin == "E")
                        Icon(Icons.local_police_outlined, color: UIHelper.primaryColor, size: 20).marginOnly(right: UIHelper.lowSize)
                      else
                        const SizedBox(),
                      Text(
                        CacheManager.getAnaVeri!.userModel?.profilAdi ?? loc(context).rightDrawer.executiveUser,
                        style: CacheManager.getAnaVeri!.userModel?.admin == "E"
                            ? theme.textTheme.bodyMedium?.copyWith(color: UIHelper.primaryColor, fontWeight: FontWeight.bold)
                            : theme.textTheme.bodySmall,
                      ),
                    ],
                  ).marginOnly(bottom: UIHelper.midSize),
                ],
              ),
              Divider(
                indent: UIHelper.midSize,
                endIndent: UIHelper.midSize,
              ),
              Expanded(
                child: ListView.separated(
                  padding: UIHelper.zeroPadding,
                  itemBuilder: (context, index) {
                    final DrawerModel item = items[index];
                    return ListTile(
                      dense: true,
                      onTap: item.onTap,
                      title: Text(
                        "${items[index].title}",
                        style: theme.textTheme.bodyMedium,
                      ),
                      horizontalTitleGap: 0,
                      leading: Icon(item.iconWidget, size: 20, color: theme.colorScheme.primary),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: items.length,
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
                              Text(
                                loc(context).rightDrawer.changeCompany,
                                style: theme.textTheme.bodySmall,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
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
                              Text(loc(context).rightDrawer.exit, style: theme.textTheme.bodySmall),
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

  List<DrawerModel> get items => [
        DrawerModel(
          title: "${CacheManager.getVeriTabani["Şirket"]} (${CacheManager.getVeriTabani["Şube"]})",
          iconWidget: Icons.storage_outlined,
        ),
        DrawerModel(
          title: CacheManager.getIsletmeSube["İşletme"],
          iconWidget: Icons.home_outlined,
        ),
        // DrawerModel(
        //   title: "${CacheManager.getAccounts(AccountModel.instance.uyeEmail ?? "")?.wsWan}",
        //   iconWidget: Icons.router_outlined,
        // ),
        DrawerModel(
          title: "${CacheManager.getVeriTabani["Şube"]} - ${CacheManager.getIsletmeSube["Şube"]}",
          iconWidget: Icons.location_on_outlined,
          // onTap: () async {
          //   Get.back();
          //   await dialogManager.showLocationDialog();
          //   log("message");
          // },
        ),
        DrawerModel(
          title: "v${AppInfoModel.instance.version}",
          iconWidget: Icons.route_outlined,
        ),
        DrawerModel(
          title: _urlAdi,
          iconWidget: Icons.link_outlined,
          onTap: () async {
            if (_urlAdi == " ") return;
            await bottomSheetDialogManager.showBaglantiSekliBottomSheetDialog(context, account);
            setState(() {});
          },
        ),
        DrawerModel(
          title: loc(context).rightDrawer.themeChange,
          iconWidget: Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.dark_mode_outlined,
          onTap: () async {
            if (Get.isDarkMode) {
              Get.changeThemeMode(ThemeMode.light);
            } else {
              Get.changeThemeMode(ThemeMode.dark);
            }
            CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(acikTemaMi: Get.isDarkMode));
          },
        ).isDebug(),
        DrawerModel(
          title: loc(context).rightDrawer.releaseNotes,
          iconWidget: Icons.new_releases_outlined,
          onTap: () {
            //close Drawer
            Get.back();
            return Get.toNamed("/mainPage/surumYenilikleri");
          },
        ),
      ].nullCheckWithGeneric.cast<DrawerModel>();

  AccountResponseModel? account = CacheManager.getAccounts(AccountModel.instance.uyeEmail ?? "");
  String get _urlAdi {
    if (CacheManager.getUzaktanMi(account?.firmaKisaAdi)) {
      return "${getIP(account?.wsWan ?? "")} (${loc(context).rightDrawer.remote})";
    } else {
      return "${getIP(account?.wsLan ?? "")} (${loc(context).rightDrawer.local})";
    }
  }

  String getIP(String url) {
    if (url.isEmpty) return "";
    final List<String> urlSplit = url.split("/");
    // remove ":" from last element of urlSplit

    // get 3rd element of urlSplit and split it with ".". Then observe first 3 elements of it.
    final List<String> ipSplit = urlSplit[2].split(".");
    // if any element contains ":" then split it with ":" and get first element of it.
    for (var ip in ipSplit) {
      if (ip.contains(":")) {
        ipSplit[ipSplit.indexOf(ip)] = ip.split(":")[0];
      }
    }

    for (int i = 1; i < ipSplit.length - 1; i++) {
      ipSplit[i] = ipSplit[i].split(":")[0];
      if (ipSplit[i].contains(":")) {}
      ipSplit[i] = "*" * (ipSplit[i].length);
    }
    // join elements with "."
    return ipSplit.join(".");
  }
}
