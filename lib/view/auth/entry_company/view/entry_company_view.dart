// ignore_for_file: use_build_context_synchronously

import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:mobx/mobx.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/helper_widgets/custom_label_widget.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/badge_color_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/add_company/model/account_model.dart";
import "package:picker/view/auth/entry_company/view_model/entry_company_view_model.dart";
import "package:picker/view/auth/model/company_model.dart";
import "package:picker/view/auth/model/isletme_model.dart";
import "package:picker/view/main_page/model/main_page_model.dart";

class EntryCompanyView extends StatefulWidget {
  const EntryCompanyView({super.key, this.isSplash, this.onMenu});

  final bool? isSplash;
  final bool? onMenu;

  @override
  State<EntryCompanyView> createState() => _EntryCompanyViewState();
}

class _EntryCompanyViewState extends BaseState<EntryCompanyView> {
  bool first = true;
  List<IsletmeModel>? isletme;
  late final TextEditingController isletmeController;
  List<CompanyModel>? sirket;

  late final TextEditingController sirketController;
  late final TextEditingController subeController;
  final EntryCompanyViewModel viewModel = EntryCompanyViewModel();

  @override
  void dispose() {
    sirketController.dispose();
    isletmeController.dispose();
    subeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    sirketController = TextEditingController();
    isletmeController = TextEditingController();
    subeController = TextEditingController();
    if (CacheManager.getLogout == true) {
      viewModel.selected = CacheManager.getVeriTabani.asObservable();
      viewModel.userData = CacheManager.getIsletmeSube.asObservable();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        if (await viewModel.getData()) {
          await sirketDialog(context);
        }
      } catch (e) {
        Get.toNamed("login");
      }
    });
  }

  Future subeDialog(BuildContext context) async {
    if (viewModel.subeList?.length == 1) {
      subeController.text = "${viewModel.subeList?[0].subeKodu} - ${viewModel.subeList?[0].subeAdi}";

      viewModel.selectedSube(viewModel.subeList?[0]);
      return;
    }
    final list = viewModel.subeList?.where((element) => element.isletmeKodu == viewModel.selected["İşletme"]).toList();
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Şube Seçiniz",
      groupValue: viewModel.selected["Şube"],
      children: List.generate(
        list?.length ?? 0,
        (index) {
          final item = list?[index];
          return BottomSheetModel(
            title: item?.subeAdi ?? "",
            value: item,
            description: item?.subeKodu.toStringIfNotNull,
            groupValue: item?.subeKodu,
          );
        },
      ),
    );
    if (result is IsletmeModel) {
      subeController.text = "${result.subeKodu} - ${result.subeAdi}";
      viewModel.selectedSube(result);
    }
  }

  Future sirketDialog(BuildContext context) async {
    if (viewModel.sirketList?.length == 1) {
      sirketController.text = viewModel.sirketList?[0].company ?? "";
      viewModel.selectedSirket(viewModel.sirketList?[0]);
      await viewModel.getSube();
      isletmeController.clear();
      subeController.clear();
      await isletmeDialog(context);
      return;
    }
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      title: "Şirket Seçiniz",
      groupValue: viewModel.selected["Şirket"],
      children: List.generate(
        viewModel.sirketList?.length ?? 0,
        (index) {
          final CompanyModel? model = viewModel.sirketList?[index];
          return BottomSheetModel(
            iconWidget: Icons.storage_outlined,
            title: model?.company ?? "",
            description: "${model?.year}",
            descriptionWidget: model?.isDevredilmis == true ? ColorfulBadge(label: Text("Devredildi (${model?.devSirket})"), badgeColorEnum: BadgeColorEnum.kapali) : null,
            value: model,
            groupValue: model?.company,
          );
        },
      ),
    );
    if (result is CompanyModel) {
      first = false;
      sirketController.text = result.company ?? "";
      isletmeController.clear();
      subeController.clear();
      viewModel.selectedSirket(result);
      await viewModel.getSube();
      await isletmeDialog(context);
    } else {
      if (first && widget.isSplash == false) {
        first = false;
        Get.back();
      }
    }
  }

  Future isletmeDialog(BuildContext context, {bool isTapOnIsletme = false}) async {
    if (viewModel.isletmeList?.length == 1 && !isTapOnIsletme) {
      isletmeController.text = "${viewModel.isletmeList?[0].isletmeKodu} - ${viewModel.isletmeList?[0].isletmeAdi ?? ""}";
      viewModel.selectedIsletme(viewModel.isletmeList?[0]);
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
        ),
      ),
    );
    if (result is IsletmeModel) {
      isletmeController.text = "${result.isletmeKodu} - ${result.isletmeAdi}";
      subeController.clear();
      viewModel.selectedIsletme(result);
      await subeDialog(context);
    }
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
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
          title: const AppBarTitle(title: "Şirkete Giriş"),
          actions: [
            IconButton(
              onPressed: () async {
                if (sirketController.text.isEmpty) {
                  dialogManager.showErrorSnackBar("Şirket seçiniz.");
                  return;
                }
                final result = await networkManager.dbUpdate(sirketController.text);
                if (result.isSuccess) {
                  dialogManager.showInfoDialog("Veritabanı güncellendi\n${result.message ?? ""}");
                } else {
                  dialogManager.showErrorSnackBar("Veritabanı güncellenemedi.");
                }
              },
              icon: const Icon(Icons.cloud_upload_outlined),
            ).yetkiVarMi(AccountModel.instance.admin == "E"),
          ],
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
                                onTap: () async => await isletmeDialog(context, isTapOnIsletme: true),
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
                                  ..aktifSubeKodu = viewModel.selected["Şube"]
                                  ..admin = CacheManager.getHesapBilgileri?.admin ?? "H";
                                final token = await networkManager.getToken(
                                  queryParameters: {
                                    "deviceInfos": jsonEncode(
                                      (CacheManager.getHesapBilgileri
                                            ?..cihazKimligi = AccountModel.instance.cihazKimligi
                                            ..konumDate = DateTime.now()
                                            ..konumTarihi = AccountModel.instance.getKonumTarihi
                                            ..cihazTarihi = AccountModel.instance.getKonumTarihi
                                            ..uyeEmail = CacheManager.getVerifiedUser.account?.email ?? "")
                                          ?.toJson(),
                                    ),
                                  },
                                  data: {
                                    "grant_type": "password",
                                    "username": CacheManager.getVerifiedUser.username,
                                    "password": CacheManager.getVerifiedUser.password,
                                  },
                                );
                                if (token != null) {
                                  CacheManager.setVerifiedUser(CacheManager.getVerifiedUser);
                                  if (token.accessToken != null) {
                                    CacheManager.setToken(token.accessToken!);
                                  }
                                }
                                final response = await networkManager.dioPost<MainPageModel>(
                                  path: ApiUrls.createSession,
                                  bodyModel: MainPageModel(),
                                  showError: true,
                                  showLoading: true,
                                  data: model,
                                  headers: {
                                    "VERITABANI": viewModel.selected["Şirket"].toString(),
                                    "ISLETME_KODU": viewModel.selected["İşletme"].toString(),
                                    "SUBE_KODU": viewModel.selected["Şube"].toString(),
                                    "content-type": "application/json",
                                  },
                                );
                                if (response.isSuccess) {
                                  final MainPageModel model = response.dataList[0];
                                  CacheManager.setVeriTabani(viewModel.selected);
                                  CacheManager.setIsletmeSube(viewModel.userData);
                                  CacheManager.setLogout(true);
                                  await CacheManager.setAnaVeri(model);
                                  Get.offAllNamed("/mainPage");
                                  final account = CacheManager.getAccounts(AccountModel.instance.uyeEmail ?? "");
                                  if (account?.karsilamaMesaji != null) {
                                    dialogManager.showInfoSnackBar(account?.karsilamaMesaji ?? "", duration: Duration(seconds: account?.karsilamaSaniye ?? 0));
                                  }
                                  if (response.message.ext.isNotNullOrNoEmpty) dialogManager.showInfoDialog(response.message ?? "");
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
}
