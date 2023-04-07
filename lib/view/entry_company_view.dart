import "dart:developer";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../core/base/state/base_state.dart";
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
  Map selected = {"Şirket": "", "İşletme": -1, "Şube": -1};
  List<String>? sirket;
  List? isletme;
  List? sube;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await dioGetData();
  }

  dioGetData() async {
    sirket = await getSirket();
    isletme = await getIsletme(selected["Şirket"].toString()).onError((error, stackTrace) => []);
    sube = await getSube();
  }

  Future<List<String>?> getSirket({String? name}) async {
    List<String> list = [];
    final response = await networkManager.dioGet<CompanyModel>(
      path: ApiUrls.veriTabanlari,
      bodyModel: CompanyModel(),
      addTokenKey: true,
    );
    final data = response.data;
    for (CompanyModel element in data) {
      list.add(element.company.toString());
    }
    if (selected["Şirket"] == "") {
      selected["Şirket"] = data[0].company;
    }
    return list;
  }

  Future<List> getIsletme(String sirket) async {
    List list = [];
    final response = await networkManager.dioGet<IsletmeModel>(
      path: ApiUrls.isletmelerSubeler,
      bodyModel: IsletmeModel(),
      addTokenKey: true,
      addQuery: true,
      queryParameters: {"Veritabani": sirket},
    );
    final data = response.data;
    for (IsletmeModel element in data) {
      list.add(element);
    }
    return list;
  }

  Future<List> getSube() async {
    List data = [];
    for (var element in isletme!) {
      if (sube?.contains(element) == false) {
        data.add(element.isletmeAdi);
      }
    }
    var data2 = data.toSet().toList();
    return data2;
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
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
                    Form(
                      key: formKey,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            DropdownButtonFormField(
                              value: selected["Şirket"].toString(),
                              decoration: const InputDecoration(
                                labelText: "Şirket",
                                border: OutlineInputBorder(),
                              ),
                              items: sirket
                                  ?.map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selected["Şirket"] = value;
                                });
                                log(selected.toString(), name: "Şirket");
                              },
                            ),
                            DropdownButtonFormField(
                              decoration: const InputDecoration(
                                labelText: "İşletmeler",
                                border: OutlineInputBorder(),
                              ),
                              items: isletme
                                  ?.map((e) => DropdownMenuItem(value: e, child: Text(e.subeAdi.toString())))
                                  .toList(),
                              onChanged: (value) {
                                selected["İşletme"] = isletme?.indexOf(value);
                                log(selected.toString(), name: "İşletme");
                              },
                            ),
                            DropdownButtonFormField(
                              decoration: const InputDecoration(
                                labelText: "Şubeler",
                                border: OutlineInputBorder(),
                              ),
                              items: sube
                                  ?.map((e) => DropdownMenuItem(
                                        value: e ?? "",
                                        child: Text(e.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) async {
                                selected["Şube"] = sube?.indexOf(value);
                                log(selected.toString(), name: "Şube");
                              },
                            ),
                          ]
                              .map((widget) => Padding(
                                    padding: context.onlyBottomPaddingNormal,
                                    child: widget,
                                  ))
                              .toList()),
                    ),
                    context.emptySizedHeightBoxLow,
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          //TODO  : AccountModel ile değiştirilecek

                          /// var [model] = {
                          ///   "AKTIF_ISLETME_KODU": selected["İşletme"].toString(),
                          ///  "AKTIF_VERITABANI": selected["Şirket"].toString(),
                          //   "G_CID": "/Y5TBF72qY7bnZl3+NOYvUtln/g5FJPl4jQ9i59td5M=",
                          //   "UYE_EMAIL": "destek@netfect.com",
                          //   "OZEL_CIHAZ_KIMLIGI": "4b0f40f3caabceaa7e6a60d5ba133d3323741f0644c2dbb6b74b40152f9aeaf7",
                          // };
                          final model = AccountModel.instance
                            ..aktifVeritabani = selected["Şirket"]
                            ..aktifIsletmeKodu = selected["İşletme"]
                            ..aktifSubeKodu = selected["Şube"]
                            ..gCid = "/Y5TBF72qY7bnZl3+NOYvUtln/g5FJPl4jQ9i59td5M=";
                          dialogManager.showLoadingDialog();
                          final response = await networkManager.dioPost<MainPageModel>(
                              path: ApiUrls.createSession,
                              bodyModel: MainPageModel(),
                              addTokenKey: true,
                              data: model,
                              headers: {
                                "VERITABANI": selected["Şirket"].toString(),
                                "ISLETME_KODU": selected["İşletme"].toString(),
                                "SUBE_KODU": selected["Şube"].toString(),
                                "content-type": "application/json"
                              });
                          dialogManager.hideAlertDialog;
                          if (response.data != null) {
                            MainPageModel model = response.data[0];
                            CacheManager.setanaVeri(model);
                            // log (model[0].userModel!.profilYetki.toString());
                            var b = CacheManager.getAnaVeri();
                            log(b?.sirketModel.toString() ?? "null", name: "cache");
                            Get.toNamed("mainPage");
                            dialogManager.showCupertinoDialog(model.userModel!.profilYetki.toString());
                          } else {
                            dialogManager.showCupertinoDialog(response.message.toString());
                          }
                        }
                      },
                      child: const Text("Giriş"),
                    ),
                  ],
                ));
          } else {
            return const Center(
                child: CircularProgressIndicator.adaptive(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)));
          }
        },
      ),
    );
  }
}
