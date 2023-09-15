import "dart:developer";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";

import "../../../core/base/model/base_network_mixin.dart";
import "../../../core/base/model/generic_response_model.dart";
import "../../../core/base/state/base_state.dart";
import "../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../core/constants/ui_helper/ui_helper.dart";
import "../../../core/init/cache/cache_manager.dart";
import "../../../core/init/network/login/api_urls.dart";
import "../../add_company/model/account_model.dart";
import "../../main_page/model/main_page_model.dart";
import "../model/companies.dart";
import "../model/isletme_model.dart";

class EntryCompanyView extends StatefulWidget {
  const EntryCompanyView({super.key});

  @override
  State<EntryCompanyView> createState() => _EntryCompanyViewState();
}

class _EntryCompanyViewState extends BaseState<EntryCompanyView> {
  Map selected = {"Şirket": "", "İşletme": null, "Şube": null};
  Map userData = {"Şirket": "", "İşletme": null, "Şube": null};
  List<CompanyModel>? sirket;
  List<IsletmeModel>? isletme;
  List<IsletmeModel>? sube;
  late final TextEditingController sirketController;
  late final TextEditingController isletmeController;
  late final TextEditingController subeController;

  @override
  void initState() {
    sirketController = TextEditingController();
    isletmeController = TextEditingController();
    subeController = TextEditingController();
    selected = CacheManager.getVeriTabani();
    userData = CacheManager.getIsletmeSube;
    super.initState();
  }

  @override
  dispose() {
    sirketController.dispose();
    isletmeController.dispose();
    subeController.dispose();
    super.dispose();
  }

  Future<void> dioGetData() async {
    sirket = await getSirket();

    if (sirket?.length == 1 && mounted) {
      sirketController.text = sirket?.first.company ?? "";
    } else if (sirket?.length != 1 && sirketController.text == "") {
      await sirketDialog(context);
    }
    if (selected["Şirket"] != "" || selected["Şirket"] != null) {
      sube = await getSube(selected["Şirket"]);
      if (!mounted) return;
      isletme = await getIsletme();
      if (isletme?.length == 1 && sirketController.text != "") {
        isletmeController.text = isletme?.first.isletmeAdi ?? "";
        selected["İşletme"] = isletme?.first.isletmeKodu;
        userData["İşletme"] = isletme?.first.isletmeAdi;
      } else if (isletmeController.text == "" && sirketController.text != "") {
        if (!mounted) return;
        await isletmeDialog(context);
      }
      if (sube?.length == 1 && isletmeController.text != "") {
        subeController.text = sube?.first.subeAdi ?? "";
        selected["Şube"] = sube?.first.subeKodu;
        userData["Şube"] = sube?.first.subeAdi;
      } else if (subeController.text == "" && sirketController.text != "") {
        if (!mounted) return;
        await subeDialog(context);
      }
    }
  }

  Future<List<CompanyModel>?> getSirket({String? name}) async {
    List<CompanyModel> list = [];
    final response = await networkManager.dioGet<CompanyModel>(
      path: ApiUrls.veriTabanlari,
      bodyModel: CompanyModel(),
    );
    final data = response.data;
    for (CompanyModel element in data) {
      list.add(element);
    }
    if (list.length == 1) {
      selected["Şirket"] = list.first.company;
      userData["Şirket"] = list.first.company;
    }
    return list;
  }

  Future<List<IsletmeModel>?> getIsletme() async {
    List<IsletmeModel> data = [];
    for (var element in sube ?? []) {
      if (data.any((element) => element.isletmeKodu == element.isletmeKodu)) {
        continue;
      } else {
        data.add(element);
      }
    }
    return data;
  }

  Future<List<IsletmeModel>?> getSube(String? sirket) async {
    List<IsletmeModel> isletmeList = [];
    if (sirket.ext.isNullOrEmpty) {
      return isletmeList;
    } else {
      final response = await networkManager.dioGet<IsletmeModel>(path: ApiUrls.isletmelerSubeler, bodyModel: IsletmeModel(), queryParameters: {"Veritabani": sirket});
      if (response.data != null && response.data is List) {
        final List<IsletmeModel> data = response.data.whereType<IsletmeModel>().toList();
        for (IsletmeModel element in data) {
          element.subeKodu == null ? isletmeList.add(element..subeKodu = 0) : isletmeList.add(element);
        }
        CacheManager.setSubeListesi(data);
      }
      return isletmeList;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Şirkete Giriş")),
      body: FutureBuilder(
        future: dioGetData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Padding(
                  padding: UIHelper.midPadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      CustomWidgetWithLabel(text: "Şirket", child: CustomTextField(readOnly: true, controller: sirketController, suffixMore: true, onTap: () => sirketDialog(context))),
                      CustomWidgetWithLabel(text: "İşletme Kodu", child: CustomTextField(readOnly: true, controller: isletmeController, suffixMore: true, onTap: () => isletmeDialog(context))),
                      CustomWidgetWithLabel(text: "Şube Kodu", child: CustomTextField(readOnly: true, controller: subeController, suffixMore: true, onTap: () => subeDialog(context))),
                      ElevatedButton(
                        onPressed: () async {
                          if (!selected.values.contains(null)) {
                            final model = AccountModel.instance
                              ..aktifVeritabani = selected["Şirket"]
                              ..aktifIsletmeKodu = selected["İşletme"]
                              ..aktifSubeKodu = selected["Şube"];
                            dialogManager.showLoadingDialog("${selected["Şirket"]} şirketine giriş yapılıyor.");
                            GenericResponseModel<NetworkManagerMixin> response;
                            response = await networkManager.dioPost<MainPageModel>(path: ApiUrls.createSession, bodyModel: MainPageModel(), showError: false, data: model, headers: {
                              "VERITABANI": selected["Şirket"].toString(),
                              "ISLETME_KODU": selected["İşletme"].toString(),
                              "SUBE_KODU": selected["Şube"].toString(),
                              "content-type": "application/json"
                            });
                            if (response.data != null) {
                              MainPageModel model = response.data.first;
                              CacheManager.setAnaVeri(model);
                              CacheManager.setVeriTabani(selected);
                              CacheManager.setIsletmeSube(userData);
                              CacheManager.setLogout(true);
                              Get.offAndToNamed("/mainPage");
                              var result = await networkManager.dioPost<AccountModel>(
                                  path: ApiUrls.saveUyeBilgileri, bodyModel: AccountModel(), showError: false, data: CacheManager.getHesapBilgileri?.toJson());
                              if (result.success == true) {
                                log("Session Başarılı");
                              }
                              (response.message?.ext.isNotNullOrNoEmpty ?? false) ? dialogManager.showAlertDialog(response.message.toString()) : null;
                            } else {
                              dialogManager.hideAlertDialog;
                              dialogManager.showAlertDialog(response.message ?? "Bir hata oluştu. Lütfen tekrar deneyiniz.");
                            }
                          } else {
                            dialogManager.showErrorSnackBar("Boş bırakmayınız.");
                          }
                        },
                        child: const Text("Giriş"),
                      ).paddingOnly(top: UIHelper.midSize).paddingSymmetric(horizontal: UIHelper.lowSize),
                    ],
                  )),
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
            ));
          }
        },
      ),
    );
  }

  Future<void> subeDialog(BuildContext context) async {
    var result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context,
        title: "Şube Seçiniz", children: List.generate(sube?.length ?? 0, (index) => BottomSheetModel(title: sube?[index].subeAdi ?? "", value: sube?[index])));
    if (result != null) {
      setState(() {
        subeController.text = "${result.subeAdi} ${result.subeKodu ?? 0}";
        selected["Şube"] = result.subeKodu ?? 0;
        userData["Şube"] = result.subeAdi;
      });
    }
  }

  Future<void> sirketDialog(BuildContext context) async {
    var result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context,
        title: "Şirket Seçiniz", children: List.generate(sirket?.length ?? 0, (index) => BottomSheetModel(title: sirket![index].company ?? "", value: sirket?[index])));
    if (result != null) {
      setState(() {
        isletmeController.text = "";
        sirketController.text = result.company ?? "";
        selected["Şirket"] = result.company;
        userData["Şirket"] = result.company;
        selected["İşletme"] = null;
        selected["Şube"] = null;
      });
    }
  }

  Future<void> isletmeDialog(BuildContext context) async {
    var result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context,
        title: "İşletme Seçiniz", children: List.generate(isletme?.length ?? 0, (index) => BottomSheetModel(title: isletme![index].isletmeAdi ?? "", value: isletme?[index])));
    if (result != null) {
      setState(() {
        isletmeController.text = "${result.isletmeAdi} ${result.isletmeKodu ?? 0}";
        selected["İşletme"] = result.isletmeKodu ?? 0;
        userData["İşletme"] = result.isletmeAdi;
        selected["Şube"] = null;
      });
    }
  }
}
