import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:hive_flutter/hive_flutter.dart";
import "../../../core/init/cache/cache_manager.dart";

import "../../../core/base/state/base_state.dart";
import "../../../core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart";
import "../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../core/constants/ui_helper/ui_helper.dart";
import "../model/account_response_model.dart";

class AccountsView extends StatefulWidget {
  const AccountsView({super.key});

  @override
  State<AccountsView> createState() => _AccountsViewState();
}

class _AccountsViewState extends BaseState<AccountsView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int get getListLength => Hive.box("accounts").length;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.offAndToNamed("/");
        return false;
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            dynamic refresh = await Get.toNamed("/addAccount");
            if (refresh == null || refresh == true) {
              setState(() {});
            }
          },
          child: const Icon(Icons.add),
        ),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.offAndToNamed("/");
            },
            icon: const Icon(Icons.arrow_back),
          ),
          title: const Text("Hesaplar"),
        ),
        body: getListLength == 0
            ? const Center(child: Text("Hesap Bulunamadı"))
            : Padding(
                padding: UIHelper.midPadding,
                child: ListView.builder(
                    itemCount: getListLength == 0 ? 1 : getListLength,
                    itemBuilder: (context, index) {
                      AccountResponseModel account = Hive.box("accounts").getAt(index);
                      return Card(
                        child: ListTile(
                          onTap: () {
                            BottomSheetDialogManager().showBottomSheetDialog(context, title: account.firma.toString(), children: [
                              BottomSheetModel(
                                  iconWidget: Icons.delete_outline,
                                  title: "Sil",
                                  onTap: () {
                                    Navigator.pop(context);
                                    dialogManager.showAreYouSureDialog(() {
                                      CacheManager.removeAccounts(account.email ?? "");
                                      CacheManager.resetVerifiedUser();
                                      setState(() {});
                                    });
                                  }),
                              //TODO Sunucu Tercihi Sayfasına Yönlendir
                              BottomSheetModel(iconWidget: Icons.storage_rounded, title: "Sunucu Tercihi", onTap: () {}),
                            ]);
                          },
                          title: Text(account.firma.toString()),
                          subtitle: Text(account.email.toString()),
                          trailing: const Icon(Icons.more_vert),
                        ),
                      );
                    }),
              ),
      ),
    );
  }

  dynamic bottomSheet(BuildContext context, {required String firma}) {
    return showModalBottomSheet(
        isDismissible: true,
        useSafeArea: true,
        context: context,
        builder: (context) => Column(mainAxisSize: MainAxisSize.min, children: [
              ListTile(
                leading: const Icon(Icons.edit_outlined),
                title: Text(
                  "Düzelt",
                  style: theme.textTheme.bodyLarge,
                ),
                onTap: () {
                  //TODO Düzenleme Sayfasına Yönlendir
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: Text("Sil", style: theme.textTheme.bodyLarge),
                onTap: () {
                  Navigator.pop(context);
                  dialogManager.showAreYouSureDialog(() {
                    CacheManager.removeAccounts(firma);
                    CacheManager.resetVerifiedUser();
                    setState(() {});
                  });
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.workspaces_outlined),
                title: Text("Sunucu Tercihi", style: theme.textTheme.bodyLarge),
              )
            ]));
  }
}
