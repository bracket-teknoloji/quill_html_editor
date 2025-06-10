import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:hive_ce_flutter/hive_flutter.dart";

import "../../../core/base/state/base_state.dart";
import "../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../core/components/wrap/appbar_title.dart";
import "../../../core/constants/ui_helper/ui_helper.dart";
import "../../../core/init/cache/cache_manager.dart";
import "../model/account_response_model.dart";

final class AccountsView extends StatefulWidget {
  const AccountsView({super.key});

  @override
  State<AccountsView> createState() => _AccountsViewState();
}

final class _AccountsViewState extends BaseState<AccountsView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  int get getListLength => CacheManager.accountsBox.length;

  @override
  Widget build(BuildContext context) => BaseScaffold(floatingActionButton: fab(), appBar: appBar(), body: body());

  AppBar appBar() => AppBar(
    leading: IconButton(onPressed: Get.back, icon: const Icon(Icons.arrow_back)),
    title: const AppBarTitle(title: "Hesaplar"),
  );

  CustomFloatingActionButton fab() => CustomFloatingActionButton(
    isScrolledDown: true,
    onPressed: () async {
      final result = await Get.toNamed("/addAccount");
      if (result != null) {
        setState(() {});
      }
    },
    // child: const Icon(Icons.add),
  );

  Widget body() => getListLength == 0
      ? const Center(child: Text("Hesap Bulunamadı"))
      : Padding(
          padding: UIHelper.midPadding,
          child: ListView.builder(
            itemCount: getListLength == 0 ? 1 : getListLength,
            itemBuilder: (context, index) {
              final AccountResponseModel account = Hive.box("accounts").getAt(index);
              return Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.only(left: UIHelper.midSize, right: UIHelper.lowSize),
                  onTap: () {
                    bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: account.firma.toString(),
                      children: [
                        BottomSheetModel(
                          iconWidget: Icons.delete_outline,
                          title: loc.generalStrings.delete,
                          onTap: () {
                            Get.back();
                            dialogManager.showAreYouSureDialog(
                              onYes: () {
                                CacheManager.removeAccounts(account.email ?? "");
                                CacheManager.resetVerifiedUser();
                                setState(() {});
                              },
                            );
                          },
                        ),
                        BottomSheetModel(
                          iconWidget: Icons.storage_rounded,
                          title: "Sunucu Tercihi",
                          onTap: () async {
                            Get.back();
                            await bottomSheetDialogManager.showBaglantiSekliBottomSheetDialog(context, account);
                          },
                        ),
                      ],
                    );
                  },
                  title: Text(account.firma.toString()),
                  subtitle: Text(account.email.toString()),
                  trailing: const Icon(Icons.more_vert_outlined),
                ),
              );
            },
          ),
        );
}
