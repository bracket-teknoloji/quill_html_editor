import "dart:developer";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../core/base/model/base_network_mixin.dart";
import "../../../core/base/model/generic_response_model.dart";
import "../../../core/base/state/base_state.dart";
import "../../../core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart";
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
  final bool? isSplash;
  const EntryCompanyView({super.key, this.isSplash});

  @override
  State<EntryCompanyView> createState() => _EntryCompanyViewState();
}

class _EntryCompanyViewState extends BaseState<EntryCompanyView> {
  Map selected = {"Şirket": "", "İşletme": null, "Şube": null};
  // Map<String, dynamic> selected = {"Şirket": "", "İşletme": null, "Şube": null};
  Map userData = {"Şirket": "", "İşletme": null, "Şube": null};
  List<CompanyModel>? sirket;
  List<IsletmeModel>? isletme;
  List<IsletmeModel>? sube;
  late final FocusNode focusNode;
  late final TextEditingController controller1;
  late final TextEditingController controller2;
  late final TextEditingController controller3;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    if (CacheManager.getLogout == true) {
      selected = CacheManager.getVeriTabani();
      userData = CacheManager.getIsletmeSube;
    }
    // controller1?.text = CacheManager.getVeriTabani()?["Şirket"] ?? "";
    // controller2?.text = CacheManager.getIsletmeSube()?["İşletme"] ?? "";
    // controller3?.text = "${CacheManager.getIsletmeSube()?["Şube"] ?? ""} ${CacheManager.getVeriTabani()?["Şube"] ?? ""}";
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: false,
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
        body: FutureBuilder(
          future: dioGetData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Padding(
                  padding: UIHelper.midPadding,
                  child: Center(
                    child: Container(
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              CustomWidgetWithLabel(
                                text: "Şirket",
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.more_horiz_outlined),
                                  ),
                                  controller: controller1,
                                  readOnly: true,
                                  autofocus: true,
                                  focusNode: focusNode,
                                  textInputAction: TextInputAction.next,
                                  onTap: () {
                                    sirketDialog(context);
                                  },
                                ),
                              ),
                              CustomWidgetWithLabel(
                                text: "İşletme Kodu",
                                child: TextFormField(
                                  controller: controller2,
                                  enabled: isletme?.ext.isNotNullOrEmpty,
                                  readOnly: true,
                                  onTap: () {
                                    isletmeDialog(context);
                                  },
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.more_horiz_outlined),
                                  ),
                                ),
                              ),
                              CustomWidgetWithLabel(
                                text: "Şube Kodu",
                                child: TextFormField(
                                  controller: controller3,
                                  enabled: sube?.ext.isNotNullOrEmpty,
                                  readOnly: true,
                                  onTap: () {
                                    subeDialog(context);
                                  },
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.more_horiz_outlined),
                                  ),
                                ),
                              ),
                            ]
                                .map(
                                  (widget) => Padding(
                                    padding: context.padding.onlyBottomLow,
                                    child: widget,
                                  ),
                                )
                                .toList(),
                          ),
                          context.sized.emptySizedHeightBoxLow,
                          ElevatedButton(
                            onPressed: () async {
                              if (!selected.values.contains(null)) {
                                final model = AccountModel.instance
                                  ..aktifVeritabani = selected["Şirket"]
                                  ..aktifIsletmeKodu = selected["İşletme"]
                                  ..aktifSubeKodu = selected["Şube"];
                                dialogManager.showLoadingDialog("${selected["Şirket"]} şirketine giriş yapılıyor.");
                                GenericResponseModel<NetworkManagerMixin> response;
                                response = await networkManager.dioPost<MainPageModel>(
                                  path: ApiUrls.createSession,
                                  bodyModel: MainPageModel(),
                                  showError: false,
                                  data: model,
                                  headers: {
                                    "VERITABANI": selected["Şirket"].toString(),
                                    "ISLETME_KODU": selected["İşletme"].toString(),
                                    "SUBE_KODU": selected["Şube"].toString(),
                                    "content-type": "application/json",
                                  },
                                );
                                if (response.data != null) {
                                  final MainPageModel model = response.data[0];
                                  CacheManager.setAnaVeri(model);
                                  CacheManager.setVeriTabani(selected);
                                  CacheManager.setIsletmeSube(userData);
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
                                  (response.message?.ext.isNotNullOrNoEmpty ?? false) ? dialogManager.showAlertDialog(response.message.toString()) : null;
                                } else {
                                  dialogManager.hideAlertDialog;
                                  dialogManager.showAlertDialog(response.message.toString());
                                }
                              } else {
                                dialogManager.showErrorSnackBar("Boş bırakmayınız.");
                              }
                            },
                            child: const Text("Giriş"),
                          ),
                        ],
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

  dynamic subeDialog(BuildContext context) {
    BottomSheetDialogManager().showRadioBottomSheetDialog(
      context,
      title: "Şube Seçiniz",
      children: List.generate(
        sube?.length ?? 0,
        (index) => BottomSheetModel(
          icon: "Saat",
          title: sube![index].subeAdi!,
          onTap: () {
            setState(() {
              controller3.text = "${sube![index].subeAdi} ${sube![index].subeKodu ?? 0}";
              selected["Şube"] = sube![index].subeKodu ?? 0;
              userData["Şube"] = sube![index].subeAdi;
            });
            Get.back();
          },
        ),
      ),
    );
  }

  dynamic sirketDialog(BuildContext context) {
    BottomSheetDialogManager().showRadioBottomSheetDialog(
      context,
      title: "Şirket Seçiniz",
      children: List.generate(
        sirket?.length ?? 0,
        (index) => BottomSheetModel(
          icon: "Saat",
          iconWidget: Icons.storage_outlined,
          title: sirket![index].company!,
          onTap: () {
            setState(() {
              controller1.text = sirket![index].company!;
              controller2.text = "";
              controller3.text = "";
              selected["Şirket"] = sirket![index].company;
              userData["Şirket"] = sirket![index].company;
              selected["İşletme"] = null;
              selected["Şube"] = null;
            });
            Get.back();
          },
        ),
      ),
    );
  }

  dynamic isletmeDialog(BuildContext context) {
    BottomSheetDialogManager().showRadioBottomSheetDialog(
      context,
      title: "İşletme Seçiniz",
      children: List.generate(
        isletme?.length ?? 0,
        (index) => BottomSheetModel(
          icon: "Saat",
          iconWidget: Icons.data_array_outlined,
          title: isletme![index].isletmeAdi!,
          onTap: () {
            setState(() {
              controller2.text = "${isletme![index].isletmeAdi} ${isletme![index].isletmeKodu ?? 0}";
              controller3.text = "";
              selected["İşletme"] = isletme![index].isletmeKodu ?? 0;
              userData["İşletme"] = isletme![index].isletmeAdi;
              selected["Şube"] = null;
            });
            Get.back();
          },
        ),
      ),
    );
  }

  Future<void> dioGetData() async {
    sirket = await getSirket();

    if (sirket?.length == 1 && mounted) {
      controller1.text = sirket?[0].company ?? "";
    } else if (sirket?.length != 1 && controller1.text == "") {
      if (mounted) {
        await sirketDialog(context);
      }
    }
    if (selected["Şirket"] != "" || selected["Şirket"] != null) {
      sube = await getSube(selected["Şirket"]);
      if (!mounted) return;
      isletme = await getIsletme();
      if (isletme!.length == 1 && controller1.text != "") {
        controller2.text = isletme![0].isletmeAdi!;
        selected["İşletme"] = isletme![0].isletmeKodu;
        userData["İşletme"] = isletme![0].isletmeAdi;
        focusNode.requestFocus();
      } else if (controller2.text == "" && controller1.text != "") {
        if (!mounted) return;
        await isletmeDialog(context);
      }
      if (sube!.length == 1 && controller2.text != "") {
        controller3.text = sube![0].subeAdi!;
        selected["Şube"] = sube![0].subeKodu;
        userData["Şube"] = sube![0].subeAdi;
        focusNode.requestFocus();
      } else if (controller3.text == "" && controller1.text != "") {
        if (!mounted) return;
        await subeDialog(context);
      }
    }
  }

  Future<List<CompanyModel>?> getSirket({String? name}) async {
    final List<CompanyModel> list = [];
    final response = await networkManager.dioGet<CompanyModel>(
      path: ApiUrls.veriTabanlari,
      bodyModel: CompanyModel(),
    );
    final data = response.data;
    for (CompanyModel element in data) {
      list.add(element);
    }
    if (list.length == 1) {
      selected["Şirket"] = list[0].company;
      userData["Şirket"] = list[0].company;
    }
    focusNode.requestFocus();
    return list;
  }

  Future<List<IsletmeModel>?> getIsletme() async {
    final List<IsletmeModel> data = [];
    for (var element in sube!) {
      if (data.any((element) => element.isletmeKodu == element.isletmeKodu)) {
        continue;
      } else {
        data.add(element);
      }
    }
    return data;
  }

  Future<List<IsletmeModel>?> getSube(String? sirket) async {
    if (sirket == null || sirket == "") return [];
    final List<IsletmeModel> list = [];
    final response = await networkManager.dioGet<IsletmeModel>(
      path: ApiUrls.isletmelerSubeler,
      bodyModel: IsletmeModel(),
      queryParameters: {"Veritabani": sirket},
    );
    final data = response.data;
    if (data != null) {
      for (IsletmeModel element in data) {
        element.subeKodu == null ? list.add(element..subeKodu = 0) : list.add(element);
      }
      CacheManager.setSubeListesi(data);
    }
    return list;
  }
}
