import "dart:developer";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../core/base/state/base_state.dart";
import "../core/components/textfield/custom_textfield.dart";
import "../core/constants/ui_helper/text_style_helper.dart";
import "../core/init/cache/cache_manager.dart";
import "../core/init/network/login/api_urls.dart";
import "add_company/model/account_model.dart";
import "auth/model/companies.dart";
import "auth/model/isletme_model.dart";
import "main_page/model/main_page_model.dart";

class EntryCompanyView extends StatefulWidget {
  const EntryCompanyView({super.key});

  @override
  State<EntryCompanyView> createState() => _EntryCompanyViewState();
}

class _EntryCompanyViewState extends BaseState<EntryCompanyView> {
  Map<String, dynamic> selected = {"Şirket": null, "İşletme": null, "Şube": null};
  Map<String, dynamic> selected2 = {"Şirket": "", "İşletme": null, "Şube": null};
  Map<String, dynamic> userData = {"Şirket": "", "İşletme": null, "Şube": null};
  List<CompanyModel>? sirket;
  List? isletme;
  List? sube;
  FocusNode? focusNode;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await dioGetData();
  }

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  dioGetData() async {
    sirket = await getSirket();
    if (sirket.isNotNullOrEmpty) {
      sube = await getSube(selected2["Şirket"].toString()).onError((error, stackTrace) => []);
      if (sube!.length == 1) {
        selected["Şube"] = sube![0];
        selected2["Şube"] = sube![0].subeKodu;
        userData["Şube"] = sube![0].subeAdi;
        focusNode!.requestFocus();
      }
      isletme = await getIsletme();
      if (isletme!.length == 1) {
        selected["İşletme"] = isletme![0];
        selected2["İşletme"] = isletme![0].isletmeKodu;
        userData["İşletme"] = isletme![0].isletmeAdi;
        focusNode!.requestFocus();
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
      selected["Şirket"] = list[0];
      selected2["Şirket"] = list[0].company;
      userData["Şirket"] = list[0].company;
    }
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

  Future<List> getSube(String sirket) async {
    List list = [];
    final response = await networkManager.dioGet<IsletmeModel>(
      path: ApiUrls.isletmelerSubeler,
      bodyModel: IsletmeModel(),
      addTokenKey: true,
      addQuery: true,
      queryParameters: {"Veritabani": sirket},
    );
    final data = response.data;
    if (data != null) {
      for (IsletmeModel element in data) {
        list.add(element);
      }
    }
    return list;
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: false,
        title: const Text("Şirkete Giriş"),
      ),
      body: FutureBuilder(
        future: dioGetData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
                padding: context.paddingNormal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          CustomTextField(
                            text: "Şirket",
                            children: [
                              DropdownButtonFormField(
                                autofocus: true,
                                decoration: const InputDecoration(
                                  hoverColor: Colors.transparent,
                                ),
                                isExpanded: true,
                                validator: validator,
                                focusNode: focusNode,
                                value: selected["Şirket"],
                                items: sirket?.toSet().map((e) => DropdownMenuItem(value: e, child: Text(e.company!.toString()))).toList(),
                                onChanged: (value) {
                                  if (value is CompanyModel) {
                                    setState(() {
                                      selected["Şirket"] = value;
                                      selected2["Şirket"] = value.company;
                                      userData["Şirket"] = value.company;
                                      selected["İşletme"] = null;
                                      selected2["İşletme"] = null;
                                      selected["Şube"] = null;
                                      selected2["Şube"] = null;
                                      focusNode!.requestFocus();
                                    });
                                  }
                                  log(selected2.toString(), name: "Şirket");
                                },
                              )
                            ],
                          ),
                          CustomTextField(
                            text: "İşletme Kodu",
                            children: [
                              DropdownButtonFormField(
                                isExpanded: true,
                                validator: validator,
                                focusNode: focusNode,
                                value: selected["İşletme"],
                                //items: isletme değişkenindeki unique değerler
                                items: isletme!.toSet().map((e) => DropdownMenuItem(value: e, child: Text("${e.isletmeAdi} ${e.isletmeKodu ?? 0}"))).toList(),
                                onChanged: (value) {
                                  if (value is IsletmeModel) {
                                    selected["İşletme"] = value;
                                    selected2["İşletme"] = value.isletmeKodu;
                                    userData["İşletme"] = value.isletmeAdi;
                                    log(userData.toString(), name: "İşletmeler");
                                    focusNode?.requestFocus();
                                  }
                                },
                              )
                            ],
                          ),
                          CustomTextField(
                            text: "Şube Kodu ",
                            children: [
                              DropdownButtonFormField(
                                isExpanded: true,
                                validator: validator,
                                key: formKey,
                                value: selected["Şube"],
                                focusNode: focusNode,
                                items: sube?.map((e) => DropdownMenuItem(value: e, child: Text("${e.subeAdi} ${e.subeKodu ?? 0}"))).toList(),
                                onChanged: (value) {
                                  if (value is IsletmeModel) {
                                    selected["Şube"] = value;
                                    selected2["Şube"] = value.subeKodu ?? 0;
                                    userData["Şube"] = value.subeAdi;
                                    log(selected2.toString(), name: "Şube");
                                    log(value.toString(), name: "Şube");
                                    log(sube!.length.toString(), name: "Şube");
                                    focusNode?.unfocus();
                                  }
                                },
                              )
                            ],
                          ),
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
                          ///   "AKTIF_ISLETME_KODU": selected2["İşletme"].toString(),
                          ///  "AKTIF_VERITABANI": selected2["Şirket"].toString(),
                          ///   "G_CID": "/Y5TBF72qY7bnZl3+NOYvUtln/g5FJPl4jQ9i59td5M=",
                          ///   "UYE_EMAIL": "destek@netfect.com",
                          ///   "OZEL_CIHAZ_KIMLIGI": "4b0f40f3caabceaa7e6a60d5ba133d3323741f0644c2dbb6b74b40152f9aeaf7",
                          /// };
                          final model = AccountModel.instance
                            ..aktifVeritabani = selected2["Şirket"]
                            ..aktifIsletmeKodu = selected2["İşletme"]
                            ..aktifSubeKodu = selected2["Şube"]
                            ..gCid = "/Y5TBF72qY7bnZl3+NOYvUtln/g5FJPl4jQ9i59td5M=";
                          log(selected2.toString(), name: "SONUNDA");
                          dialogManager.showLoadingDialog("${selected2["Şirket"]} şirketine giriş yapılıyor.");
                          final response = await networkManager.dioPost<MainPageModel>(
                              path: ApiUrls.createSession,
                              bodyModel: MainPageModel(),
                              addTokenKey: true,
                              data: model,
                              headers: {
                                "VERITABANI": selected2["Şirket"].toString(),
                                "ISLETME_KODU": selected2["İşletme"].toString(),
                                "SUBE_KODU": selected2["Şube"].toString(),
                                "content-type": "application/json"
                              });
                          if (response.data != null) {
                            MainPageModel model = response.data[0];
                            CacheManager.setAnaVeri(model);
                            CacheManager.setVeriTabani(selected2);
                            CacheManager.setIsletmeSube(userData);
                            Get.offAndToNamed("/mainPage");
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
                ));
          } else {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircularProgressIndicator.adaptive(),
                context.emptySizedHeightBoxLow,
                const Text("Şirketler yükleniyor.", style: TextStyleHelper.subtitleWhite),
              ],
            ));
          }
        },
      ),
    );
  }

  String? validator(value) {
    if (value == null) {
      return "";
    }
    return null;
  }
}
