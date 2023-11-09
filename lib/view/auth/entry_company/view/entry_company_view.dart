// ignore_for_file: use_build_context_synchronously

import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/model/base_network_mixin.dart";
import "package:picker/core/base/model/generic_response_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/helper_widgets/custom_label_widget.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:picker/view/auth/entry_company/view_model/entry_company_view_model.dart";
import "package:picker/view/auth/model/companies.dart";
import "package:picker/view/auth/model/isletme_model.dart";
import "package:picker/view/main_page/model/main_page_model.dart";

class EntryCompanyView extends StatefulWidget {
  final bool? isSplash;
  final bool? onMenu;
  const EntryCompanyView({super.key, this.isSplash, this.onMenu});

  @override
  State<EntryCompanyView> createState() => _EntryCompanyViewState();
}

class _EntryCompanyViewState extends BaseState<EntryCompanyView> {
  // Map selected = {"Şirket": "", "İşletme": null, "Şube": null};
  // Map userData = {"Şirket": "", "İşletme": null, "Şube": null};
  // Map<String, dynamic> selected = {"Şirket": "", "İşletme": null, "Şube": null};
  List<CompanyModel>? sirket;
  List<IsletmeModel>? isletme;
  List<IsletmeModel>? sube;
  late final TextEditingController sirketController;
  late final TextEditingController isletmeController;
  late final TextEditingController subeController;
  final EntryCompanyViewModel viewModel = EntryCompanyViewModel();
  bool first = true;

  @override
  void initState() {
    super.initState();
    sirketController = TextEditingController();
    isletmeController = TextEditingController();
    subeController = TextEditingController();
    if (CacheManager.getLogout == true) {
      viewModel.selected = CacheManager.getVeriTabani().asObservable();
      viewModel.userData = CacheManager.getIsletmeSube.asObservable();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (await viewModel.getData()) {
        await sirketDialog(context);
      }
    });
    // controller1?.text = CacheManager.getVeriTabani()?["Şirket"] ?? "";
    // controller2?.text = CacheManager.getIsletmeSube()?["İşletme"] ?? "";
    // controller3?.text = "${CacheManager.getIsletmeSube()?["Şube"] ?? ""} ${CacheManager.getVeriTabani()?["Şube"] ?? ""}";
  }

  @override
  void dispose() {
    sirketController.dispose();
    isletmeController.dispose();
    subeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              if (widget.isSplash ?? false) {
                Get.offAndToNamed("/login");
              } else {
                Get.back();
              }
            },
            icon: const Icon(Icons.arrow_back_outlined),
          ),
          title: const Text("Şirkete Giriş"),
        ),
        body: Observer(
          builder: (_) {
            if (viewModel.sirketList.ext.isNotNullOrEmpty) {
              return SingleChildScrollView(
                child: Padding(
                  padding: UIHelper.midPadding,
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomWidgetWithLabel(
                            text: "Şirket",
                            child: CustomTextField(
                              suffixMore: true,
                              controller: sirketController,
                              readOnly: true,
                              onTap: () async => await sirketDialog(context),
                            ),
                          ),
                          Observer(
                            builder: (_) => CustomWidgetWithLabel(
                              text: "İşletme Kodu",
                              child: CustomTextField(
                                suffixMore: true,
                                enabled: viewModel.isletmeList.ext.isNotNullOrEmpty,
                                controller: isletmeController,
                                readOnly: true,
                                onTap: () async => await isletmeDialog(context),
                              ),
                            ),
                          ),
                          CustomWidgetWithLabel(
                            text: "Şube Kodu",
                            child: Observer(
                              builder: (_) => CustomTextField(
                                suffixMore: true,
                                enabled: viewModel.subeList.ext.isNotNullOrEmpty,
                                controller: subeController,
                                readOnly: true,
                                onTap: () async => await subeDialog(context),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              if (!viewModel.selected.values.contains(null)) {
                                final model = AccountModel.instance
                                  ..aktifVeritabani = viewModel.selected["Şirket"]
                                  ..aktifIsletmeKodu = viewModel.selected["İşletme"]
                                  ..aktifSubeKodu = viewModel.selected["Şube"];
                                dialogManager.showLoadingDialog("${viewModel.selected["Şirket"]} şirketine giriş yapılıyor.");
                                GenericResponseModel<NetworkManagerMixin> response;
                                response = await networkManager.dioPost<MainPageModel>(
                                  path: ApiUrls.createSession,
                                  bodyModel: MainPageModel(),
                                  showError: false,
                                  data: model,
                                  headers: {
                                    "VERITABANI": viewModel.selected["Şirket"].toString(),
                                    "ISLETME_KODU": viewModel.selected["İşletme"].toString(),
                                    "SUBE_KODU": viewModel.selected["Şube"].toString(),
                                    "content-type": "application/json",
                                  },
                                );
                                if (response.data != null) {
                                  final MainPageModel model = response.data[0];
                                  CacheManager.setAnaVeri(model);
                                  CacheManager.setVeriTabani(viewModel.selected);
                                  CacheManager.setIsletmeSube(viewModel.userData);
                                  CacheManager.setLogout(true);
                                  Get.offAndToNamed("/mainPage");
                                  final result = await networkManager.dioPost<AccountModel>(
                                    path: ApiUrls.saveUyeBilgileri,
                                    bodyModel: AccountModel(),
                                    showError: false,
                                    data: CacheManager.getHesapBilgileri?.toJson(),
                                  );
                                  if (result.success == true) {
                                    log("Session Başarılı");
                                  }
                                  // Get.toNamed("/mainPage");
                                  if (response.message?.ext.isNotNullOrNoEmpty ?? false) dialogManager.showAlertDialog(response.message.toString());
                                } else {
                                  dialogManager.hideAlertDialog;
                                  dialogManager.showAlertDialog(response.message.toString());
                                }
                              } else {
                                dialogManager.showErrorSnackBar("Boş bırakmayınız.");
                              }
                            },
                            child: const Text("Giriş"),
                          ).paddingAll(UIHelper.lowSize).paddingOnly(top: UIHelper.lowSize),
                        ]
                            .map(
                              (widget) => Padding(
                                padding: context.padding.onlyBottomLow,
                                child: widget,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CircularProgressIndicator.adaptive(),
                    context.sized.emptySizedHeightBoxLow,
                    Text("Şirketler yükleniyor.", style: theme.textTheme.bodySmall),
                  ],
                ),
              );
            }
          },
        ),
      );

  Future subeDialog(BuildContext context) async {
    if (viewModel.subeList?.length == 1) {
      subeController.text = viewModel.subeList?[0].subeAdi ?? "";

      viewModel.selectedSube(viewModel.subeList?[0]);
      // viewModel.selected["Şube"] = viewModel.subeList?[0].subeKodu ?? 0;
      // viewModel.userData["Şube"] = viewModel.subeList?[0].subeAdi;
      return;
    }
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Şube Seçiniz",
      groupValue: viewModel.selected["Şube"],
      children: List.generate(
        viewModel.subeList?.length ?? 0,
        (index) => BottomSheetModel(
          title: viewModel.subeList?[index].subeAdi ?? "",
          value: viewModel.subeList?[index],
          groupValue: viewModel.subeList?[index].subeKodu,
          // onTap: () {
          //   setState(() {
          //     subeController.text = "${viewModel.subeList?[index].subeAdi} ${viewModel.subeList?[index].subeKodu ?? 0}";
          //     selected["Şube"] = viewModel.subeList?[index].subeKodu ?? 0;
          //     userData["Şube"] = viewModel.subeList?[index].subeAdi;
          //   });
          //   Get.back();
          // },
        ),
      ),
    );
    if (result is IsletmeModel) {
      subeController.text = result.subeAdi ?? "";
      viewModel.selectedSube(result);
      // viewModel.selected["Şube"] = result.subeKodu ?? 0;
      // viewModel.userData["Şube"] = result.subeAdi;
    }
  }

  Future sirketDialog(BuildContext context) async {
    if (viewModel.sirketList?.length == 1) {
      sirketController.text = viewModel.sirketList?[0].company ?? "";
      viewModel.selectedSirket(viewModel.sirketList?[0]);
      // viewModel.selected["Şirket"] = viewModel.sirketList?[0].company ?? "";
      // viewModel.userData["Şirket"] = viewModel.sirketList?[0].company ?? "";
      // viewModel.selected["İşletme"] = null;
      // viewModel.selected["Şube"] = null;
      await viewModel.getSube();
      isletmeController.text = "";
      subeController.text = "";
      await isletmeDialog(context);
      return;
    }
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Şirket Seçiniz",
      groupValue: viewModel.selected["Şirket"],
      children: List.generate(
        viewModel.sirketList?.length ?? 0,
        (index) => BottomSheetModel(
          iconWidget: Icons.storage_outlined,
          title: viewModel.sirketList?[index].company ?? "",
          value: viewModel.sirketList?[index],
          groupValue: viewModel.sirketList?[index].company,
        ),
      ),
    );
    if (result is CompanyModel) {
      first = false;
      sirketController.text = result.company ?? "";
      isletmeController.text = "";
      subeController.text = "";
      viewModel.selectedSirket(result);
      // viewModel.selected["Şirket"] = result;
      // viewModel.userData["Şirket"] = result;
      // viewModel.selected["İşletme"] = null;
      // viewModel.selected["Şube"] = null;
      await viewModel.getSube();
      await isletmeDialog(context);
    } else {
      if (first && widget.isSplash == false) {
        first = false;
        Get.back();
      }
    }
  }

  Future isletmeDialog(BuildContext context) async {
    if (viewModel.isletmeList?.length == 1) {
      isletmeController.text = viewModel.isletmeList?[0].isletmeAdi ?? "";
      viewModel.selectedIsletme(viewModel.isletmeList?[0]);
      // viewModel.selected["İşletme"] = viewModel.isletmeList?[0].isletmeKodu ?? 0;
      // viewModel.userData["İşletme"] = viewModel.isletmeList?[0].isletmeAdi;
      await subeDialog(context);
      return;
    }
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "İşletme Seçiniz",
      groupValue: viewModel.selected["İşletme"],
      children: List.generate(
        viewModel.isletmeList?.length ?? 0,
        (index) => BottomSheetModel(
          iconWidget: Icons.data_array_outlined,
          title: viewModel.isletmeList?[index].isletmeAdi ?? "",
          value: viewModel.isletmeList?[index],
          groupValue: viewModel.isletmeList?[index].isletmeKodu,
          // onTap: () {
          //   isletmeController.text = "${viewModel.isletmeList?[index].isletmeAdi} ${viewModel.isletmeList?[index].isletmeKodu ?? 0}";
          //   subeController.text = "";
          //   viewModel.selected["İşletme"] = viewModel.isletmeList?[index].isletmeKodu ?? 0;
          //   viewModel.userData["İşletme"] = viewModel.isletmeList?[index].isletmeAdi;
          //   viewModel.selected["Şube"] = null;
          //   // setState(() {
          //   // });
          //   Get.back();
          // },
        ),
      ),
    );
    if (result is IsletmeModel) {
      isletmeController.text = "${result.isletmeAdi} ${result.isletmeKodu ?? 0}";
      subeController.text = "";
      viewModel.selectedIsletme(result);
      // viewModel.selected["İşletme"] = result.isletmeKodu ?? 0;
      // viewModel.userData["İşletme"] = result.isletmeAdi;
      // viewModel.selected["Şube"] = null;
    }
  }
}
