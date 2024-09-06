import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";

import "../../../../../view/add_company/model/account_model.dart";
import "../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../components/layout/custom_layout_builder.dart";
import "../../../../components/textfield/custom_app_bar_text_field.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../state/base_state.dart";
import "../view_model/oturumlar_view_model.dart";

final class OturumlarView extends StatefulWidget {
  const OturumlarView({super.key});

  @override
  State<OturumlarView> createState() => _OturumlarViewState();
}

final class _OturumlarViewState extends BaseState<OturumlarView> {
  final OturumlarViewModel viewModel = OturumlarViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              if (viewModel.isSearchBarOpen) {
                return CustomAppBarTextField(onChanged: viewModel.setSearchText);
              }
              return AppBarTitle(
                title: "Oturumlar",
                subtitle: viewModel.filteredList?.length.toString() ?? "",
              );
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                viewModel.changeSearchBarStatus();
                if (!viewModel.isSearchBarOpen) {
                  viewModel.setSearchText("");
                }
              },
              icon: Observer(
                builder: (_) {
                  if (viewModel.isSearchBarOpen) return const Icon(Icons.search_off_outlined);
                  return const Icon(Icons.search_outlined);
                },
              ),
            ),
          ],
        ),
        body: Observer(
          builder: (_) => RefreshableListView(
            onRefresh: viewModel.getData,
            items: viewModel.filteredList,
            itemBuilder: (item) => Card(
              child: ListTile(
                onTap: () async {
                  await bottomSheetDialogManager.showBottomSheetDialog(
                    context,
                    title: item.kullaniciAdi ?? "",
                    children: [
                      BottomSheetModel(
                        title: "Oturumu Kapat",
                        iconWidget: Icons.logout_outlined,
                        onTap: () async {
                          Get.back();
                          dialogManager.showAreYouSureDialog(() async {
                            viewModel.logout(item);
                            await viewModel.getData();
                          });
                        },
                      ),
                    ],
                  );
                },
                title: Text(
                  "${item.kullaniciAdi ?? ""} (${item.adi ?? ""} ${item.soyadi ?? ""})",
                  style: TextStyle(color: item.cihazKimligi == AccountModel.instance.cihazKimligi ? UIHelper.primaryColor : null),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kayıt Tarihi: ${item.girisTarihi?.toDateString}"),
                    Text("Son Giriş Tarihi: ${item.sonKullanimTarihi?.toDateString}"),
                    CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        Text("Marka: ${item.cihazMarkasi ?? ""}"),
                        Text("Model: ${item.cihazModeli ?? ""}"),
                        Text("Şirket: ${item.aktifVeritabani ?? ""}"),
                        Text("Şube: ${item.aktifSubeKodu ?? "0"}"),
                        Text("Uyg.Rev No: ${item.uygulamaSurumKodu ?? ""}"),
                      ],
                    ),
                  ],
                ).paddingOnly(top: UIHelper.lowSize),
              ),
            ),
          ),
        ),
      );
}
