import "dart:developer";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import '../../../core/base/state/base_state.dart';
import '../../../core/components/dialog/bottom_sheet/bottom_sheet_dialog_manager.dart';
import '../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../core/components/helper_widgets/custom_label_widget.dart';
import '../../../core/init/cache/cache_manager.dart';
import '../../../core/init/network/login/api_urls.dart';
import '../../add_company/model/account_model.dart';
import '../../main_page/model/main_page_model.dart';
import '../model/companies.dart';
import '../model/isletme_model.dart';

class EntryCompanyView extends StatefulWidget {
  const EntryCompanyView({super.key});

  @override
  State<EntryCompanyView> createState() => _EntryCompanyViewState();
}

class _EntryCompanyViewState extends BaseState<EntryCompanyView> {
  Map selected = {"Şirket": "", "İşletme": null, "Şube": null};
  // Map<String, dynamic> selected = {"Şirket": "", "İşletme": null, "Şube": null};
  Map userData = {"Şirket": "", "İşletme": null, "Şube": null};
  List<CompanyModel>? sirket;
  List? isletme;
  List? sube;
  FocusNode? focusNode;
  TextEditingController? controller1;
  TextEditingController? controller2;
  TextEditingController? controller3;

  @override
  void initState() {
    super.initState();
    controller1 = TextEditingController();
    controller2 = TextEditingController();
    controller3 = TextEditingController();
    selected = CacheManager.getVeriTabani();
    // controller1?.text = CacheManager.getVeriTabani()?["Şirket"] ?? "";
    // controller2?.text = CacheManager.getIsletmeSube()?["İşletme"] ?? "";
    // controller3?.text = "${CacheManager.getIsletmeSube()?["Şube"] ?? ""} ${CacheManager.getVeriTabani()?["Şube"] ?? ""}";
    userData = CacheManager.getIsletmeSube();
    focusNode = FocusNode();
  }

  @override
  dispose() {
    focusNode!.dispose();
    controller1!.dispose();
    controller2!.dispose();
    controller3!.dispose();
    super.dispose();
  }

  dioGetData() async {
    sirket = await getSirket();

    if (sirket!.length == 1 && mounted) {
      controller1!.text = sirket![0].company!;
    } else if (sirket!.length != 1 && controller1?.text == "") {
      await sirketDialog(context);
    }
    if (selected["Şirket"] != "" || selected["Şirket"] != null) {
      sube = await getSube(selected["Şirket"]);
      if (!mounted) return;
      isletme = await getIsletme();
      if (isletme!.length == 1 && controller1?.text != "") {
        controller2!.text = isletme![0].isletmeAdi!;
        selected["İşletme"] = isletme![0].isletmeKodu;
        userData["İşletme"] = isletme![0].isletmeAdi;
        focusNode!.requestFocus();
      } else if (controller2?.text == "" && controller1?.text != "") {
        if (!mounted) return;
        await isletmeDialog(context);
      }
      if (sube!.length == 1 && controller2?.text != "") {
        controller3!.text = sube![0].subeAdi!;
        selected["Şube"] = sube![0].subeKodu;
        userData["Şube"] = sube![0].subeAdi;
        focusNode!.requestFocus();
      } else if (controller3?.text == "" && controller1?.text != "") {
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
      addTokenKey: true,
    );
    final data = response.data;
    for (CompanyModel element in data) {
      list.add(element);
    }
    if (list.length == 1) {
      selected["Şirket"] = list[0].company;
      userData["Şirket"] = list[0].company;
    }
    focusNode!.requestFocus();
    return list;
  }

  Future<List> getIsletme() async {
    List data = [];
    for (var element in sube!) {
      if (data.any((element) => element.isletmeKodu == element.isletmeKodu)) {
        continue;
      } else {
        data.add(element);
      }
    }
    return data;
  }

  Future<List> getSube(String? sirket) async {
    if (sirket == null || sirket == "") return [];
    List list = [];
    final response = await networkManager.dioGet<IsletmeModel>(
      path: ApiUrls.isletmelerSubeler,
      bodyModel: IsletmeModel(),
      addTokenKey: true,
      addQuery: true,
      queryParameters: {"Veritabani": sirket},
    );
    log("message");
    final data = response.data;
    if (data != null) {
      for (IsletmeModel element in data) {
        element.subeKodu == null ? list.add(element..subeKodu = 0) : list.add(element);
      }
      CacheManager.setSubeListesi(data);
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Şirkete Giriş"),
      ),
      body: FutureBuilder(
        future: dioGetData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Padding(
                  padding: context.paddingNormal,
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
                                CustomWidgetWithLabel(text: "Şirket", children: [
                                  TextFormField(
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
                                ]),
                                CustomWidgetWithLabel(
                                  text: "İşletme Kodu",
                                  children: [
                                    TextFormField(
                                      controller: controller2,
                                      enabled: isletme?.isNotNullOrEmpty,
                                      readOnly: true,
                                      onTap: () {
                                        isletmeDialog(context);
                                      },
                                      decoration: const InputDecoration(
                                        suffixIcon: Icon(Icons.more_horiz_outlined),
                                      ),
                                    )
                                  ],
                                ),
                                CustomWidgetWithLabel(text: "Şube Kodu", children: [
                                  TextFormField(
                                    controller: controller3,
                                    enabled: sube?.isNotNullOrEmpty,
                                    readOnly: true,
                                    onTap: () {
                                      subeDialog(context);
                                    },
                                    decoration: const InputDecoration(
                                      suffixIcon: Icon(Icons.more_horiz_outlined),
                                    ),
                                  )
                                ]),
                                // CustomWidgetWithLabel(
                                //   text: "Şirket",
                                //   children: [
                                //     DropdownButtonFormField(
                                //       autofocus: true,
                                //       decoration: const InputDecoration(
                                //         hoverColor: Colors.transparent,
                                //       ),
                                //       isExpanded: true,
                                //       validator: validator,
                                //       focusNode: focusNode,
                                //       items: sirket?.toSet().map((e) => DropdownMenuItem(value: e, child: Text(e.company!.toString()))).toList(),
                                //       onChanged: (value) {
                                //         if (value is CompanyModel) {
                                //           setState(() {
                                //             selected["Şirket"] = value.company;
                                //             userData["Şirket"] = value.company;
                                //             selected["İşletme"] = null;
                                //             selected["Şube"] = null;
                                //             focusNode!.requestFocus();
                                //           });
                                //         }
                                //         log(selected.toString(), name: "Şirket");
                                //       },
                                //     )
                                //   ],
                                // ),
                                // CustomWidgetWithLabel(
                                //   text: "İşletme Kodu",
                                //   children: [
                                //     DropdownButtonFormField(
                                //       isExpanded: true,
                                //       validator: validator,
                                //       focusNode: focusNode,
                                //       //items: isletme değişkenindeki unique değerler
                                //       items: isletme!.toSet().map((e) => DropdownMenuItem(value: e, child: Text("${e.isletmeAdi} ${e.isletmeKodu ?? 0}"))).toList(),
                                //       onChanged: (value) {
                                //         if (value is IsletmeModel) {
                                //           selected["İşletme"] = value.isletmeKodu;
                                //           userData["İşletme"] = value.isletmeAdi;
                                //           log(userData.toString(), name: "İşletmeler");
                                //           focusNode?.requestFocus();
                                //         }
                                //       },
                                //     )
                                //   ],
                                // ),
                                // CustomWidgetWithLabel(
                                //   text: "Şube Kodu ",
                                //   children: [
                                //     DropdownButtonFormField(
                                //       isExpanded: true,
                                //       validator: validator,
                                //       key: formKey,
                                //       focusNode: focusNode,
                                //       items: sube?.map((e) => DropdownMenuItem(value: e, child: Text("${e.subeAdi} ${e.subeKodu ?? 0}"))).toList(),
                                //       onChanged: (value) {
                                //         if (value is IsletmeModel) {
                                //           selected["Şube"] = value.subeKodu ?? 0;
                                //           userData["Şube"] = value.subeAdi;
                                //           log(selected.toString(), name: "Şube");
                                //           log(value.toString(), name: "Şube");
                                //           log(sube!.length.toString(), name: "Şube");
                                //           focusNode?.unfocus();
                                //         }
                                //       },
                                //     )
                                //   ],
                                // ),
                              ]
                                  .map((widget) => Padding(
                                        padding: context.onlyBottomPaddingNormal,
                                        child: widget,
                                      ))
                                  .toList()),
                          context.emptySizedHeightBoxLow,
                          ElevatedButton(
                            onPressed: () async {
                              if (!selected.values.contains(null)) {
                                /// var [model] = {
                                ///   "AKTIF_ISLETME_KODU": selected["İşletme"].toString(),
                                ///  "AKTIF_VERITABANI": selected["Şirket"].toString(),
                                ///   "G_CID": "/Y5TBF72qY7bnZl3+NOYvUtln/g5FJPl4jQ9i59td5M=",
                                ///   "UYE_EMAIL": "destek@netfect.com",
                                ///   "OZEL_CIHAZ_KIMLIGI": "4b0f40f3caabceaa7e6a60d5ba133d3323741f0644c2dbb6b74b40152f9aeaf7",
                                /// };
                                final model = AccountModel.instance
                                  // ..admin = CacheManager.getAnaVeri()?.userModel?.admin
                                  ..aktifVeritabani = selected["Şirket"]
                                  ..aktifIsletmeKodu = selected["İşletme"]
                                  ..aktifSubeKodu = selected["Şube"];

                                ///!!!!!!!!!!!!!!!!!!!! --> TODO BUNU EKLE
                                // ..gCid = "/Y5TBF72qY7bnZl3+NOYvUtln/g5FJPl4jQ9i59td5M=";
                                log(selected.toString(), name: "SONUNDA");
                                dialogManager.showLoadingDialog("${selected["Şirket"]} şirketine giriş yapılıyor.");
                                log(CacheManager.getHesapBilgileri().toJson().toString(), name: "dflkgjsşldkfjsşd");

                                final response = await networkManager.dioPost<MainPageModel>(path: ApiUrls.createSession, bodyModel: MainPageModel(), addTokenKey: true, data: model, headers: {
                                  "VERITABANI": selected["Şirket"].toString(),
                                  "ISLETME_KODU": selected["İşletme"].toString(),
                                  "SUBE_KODU": selected["Şube"].toString(),
                                  "content-type": "application/json"
                                });
                                if (response.data != null) {
                                  MainPageModel model = response.data[0];
                                  CacheManager.setAnaVeri(model);
                                  CacheManager.setVeriTabani(selected);
                                  CacheManager.setIsletmeSube(userData);
                                  CacheManager.setLogout(true);
                                  Get.offAndToNamed("/mainPage");
                                  // Get.toNamed("/mainPage");
                                  response.message.isNotNullOrNoEmpty ? dialogManager.showAlertDialog(response.message.toString()) : null;
                                } else {
                                  dialogManager.hideAlertDialog;
                                  dialogManager.showAlertDialog(response.message.toString());
                                }
                              } else {
                                dialogManager.showSnackBar("Boş bırakmayınız.");
                              }
                            },
                            child: const Text("Giriş"),
                          ),
                        ],
                      ),
                    ),
                  )),
            );
          } else {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator.adaptive(),
                context.emptySizedHeightBoxLow,
                Text("Şirketler yükleniyor.", style: theme.textTheme.bodySmall),
              ],
            ));
          }
        },
      ),
    );
  }

  subeDialog(BuildContext context) {
    controller3!.text = "";
    BottomSheetDialogManager().showRadioBottomSheetDialog(context,
        title: "Şube Seçiniz",
        children: List.generate(
          sube?.length ?? 0,
          (index) {
            return BottomSheetModel(
              icon: "Saat",
              title: sube![index].subeAdi!,
              onTap: () {
                setState(() {
                  controller3!.text = "${sube![index].subeAdi} ${sube![index].subeKodu ?? 0}";
                  selected["Şube"] = sube![index].subeKodu ?? 0;
                  userData["Şube"] = sube![index].subeAdi;
                });
                Get.back();
              },
            );
          },
        ));
  }

  sirketDialog(BuildContext context) {
    controller2!.text = "";

    BottomSheetDialogManager().showRadioBottomSheetDialog(context,
        title: "Şirket Seçiniz",
        children: List.generate(
          sirket?.length ?? 0,
          (index) {
            return BottomSheetModel(
              icon: "Saat",
              iconWidget: Icons.storage_outlined,
              title: sirket![index].company!,
              onTap: () {
                setState(() {
                  controller1!.text = sirket![index].company!;
                  selected["Şirket"] = sirket![index].company;
                  userData["Şirket"] = sirket![index].company;
                  selected["İşletme"] = null;
                  selected["Şube"] = null;
                });
                Get.back();
              },
            );
          },
        ));
  }

  isletmeDialog(BuildContext context) {
    BottomSheetDialogManager().showRadioBottomSheetDialog(context,
        title: "İşletme Seçiniz",
        children: List.generate(
          isletme?.length ?? 0,
          (index) {
            return BottomSheetModel(
              icon: "Saat",
              iconWidget: Icons.data_array_outlined,
              title: isletme![index].isletmeAdi!,
              onTap: () {
                setState(() {
                  controller2!.text = "${isletme![index].isletmeAdi} ${isletme![index].isletmeKodu ?? 0}";
                  selected["İşletme"] = isletme![index].isletmeKodu ?? 0;
                  userData["İşletme"] = isletme![index].isletmeAdi;
                  selected["Şube"] = null;
                });
                Get.back();
              },
            );
          },
        ));
  }
}
