import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/oturumlar/view_model/oturumlar_view_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/shimmer/list_view_shimmer.dart";
import "package:picker/core/components/textfield/custom_app_bar_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/add_company/model/account_model.dart";

class OturumlarView extends StatefulWidget {
  const OturumlarView({super.key});

  @override
  State<OturumlarView> createState() => _OturumlarViewState();
}

class _OturumlarViewState extends BaseState<OturumlarView> {
  OturumlarViewModel viewModel = OturumlarViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Observer(
            builder: (_) {
              if (viewModel.isSearchBarOpen) {
                return CustomAppBarTextField(onChanged: viewModel.setSearchValue);
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
                viewModel.setIsSearchBarOpen();
                if (!viewModel.isSearchBarOpen) {
                  viewModel.setSearchValue("");
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
        body: RefreshIndicator.adaptive(
          onRefresh: viewModel.getData,
          child: Observer(
            builder: (_) {
              if (viewModel.filteredList == null) return const ListViewShimmer();
              if (viewModel.filteredList!.isEmpty) return const Center(child: Text("Oturum bulunamadı."));
              return ListView.builder(
                itemCount: viewModel.filteredList?.length ?? 0,
                itemBuilder: (context, index) {
                  final AccountModel model = viewModel.filteredList![index];
                  return Card(
                    child: ListTile(
                      onTap: () async {
                        await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: model.kullaniciAdi ?? "",
                          children: [
                            BottomSheetModel(
                              title: "Oturumu Kapat",
                              iconWidget: Icons.logout_outlined,
                              onTap: () async {
                                Get.back();
                                dialogManager.showAreYouSureDialog(() async {
                                  viewModel.logout(model);
                                });
                              },
                            ),
                          ],
                        );
                      },
                      title: Text(
                        "${model.kullaniciAdi ?? ""} (${model.adi ?? ""} ${model.soyadi ?? ""})",
                        style: TextStyle(color: model.cihazKimligi == AccountModel.instance.cihazKimligi ? UIHelper.primaryColor : null),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Kayıt Tarihi: ${model.girisTarihi?.toDateString}"),
                          Text("Son Giriş Tarihi: ${model.sonKullanimTarihi?.toDateString}"),
                          CustomLayoutBuilder(
                            splitCount: 2,
                            children: [
                              Text("Marka: ${model.cihazMarkasi ?? ""}"),
                              Text("Model: ${model.cihazModeli ?? ""}"),
                              Text("Şirket: ${model.aktifVeritabani ?? ""}"),
                              Text("Şube: ${model.aktifSubeKodu ?? "0"}"),
                              Text("Uyg.Rev No: ${model.uygulamaSurumKodu ?? ""}"),
                            ],
                          ),
                        ],
                      ).paddingOnly(top: UIHelper.lowSize),
                    ),
                  );
                },
              ).paddingAll(UIHelper.lowSize);
            },
          ),
        ),
      );
}
