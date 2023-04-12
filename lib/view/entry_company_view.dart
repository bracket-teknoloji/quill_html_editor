import "dart:developer";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../core/base/state/base_state.dart";
import "../core/components/textfield/custom_textfield.dart";
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
  Map selected = {"Şirket": null, "İşletme": null, "Şube": null};
  List<String>? sirket;
  List? isletme;
  List? sube;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    await dioGetData();
  }

  @override
  void initState() {
    super.initState();
  }

  dioGetData() async {
    sirket = await getSirket();
    sube = await getSube(selected["Şirket"].toString()).onError((error, stackTrace) => []);
    isletme = await getIsletme();
  }

  Future<List<String>?> getSirket({String? name}) async {
    List<String> list = [""];
    final response = await networkManager.dioGet<CompanyModel>(
      path: ApiUrls.veriTabanlari,
      bodyModel: CompanyModel(),
      addTokenKey: true,
    );
    final data = response.data;
    for (CompanyModel element in data) {
      list.add(element.company.toString());
    }
    if (selected["Şirket"] == null) {
      selected["Şirket"] = "";
      setState(() {});
    }
    return list;
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

  Future<List> getIsletme() async {
    List data = [];
    for (var element in sube!) {
      if (isletme?.contains(element) == false) {
        data.add(element);
      }
    }
    return data;
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
                            CustomTextField(
                              text: "Şirket",
                              children: [
                                DropdownButtonFormField(
                                  isExpanded: true,
                                  validator: validator,
                                  value: sirket?.length == 1 ? sirket![0] : selected["Şirket"],
                                  items: sirket
                                      ?.map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e.toString()),
                                          ))
                                      .toList(),
                                  onChanged: (value) {
                                    setState(() {
                                      selected["Şirket"] = value;
                                      selected["İşletme"] = null;
                                      selected["Şube"] = null;
                                    });
                                    log(selected.toString(), name: "Şirket");
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
                                  //items: isletme değişkenindeki unique değerler
                                  items: isletme!.map((e) => e).toSet().map((e) => DropdownMenuItem(value: e, child: Text("${e.isletmeAdi} ${e.isletmeKodu ?? 0}"))).toList(),
                                  onChanged: (value) async {
                                    if (value is IsletmeModel) {
                                      selected["İşletme"] = value.isletmeKodu;
                                      log(selected.toString(), name: "İşletmeler");
                                      log(value.hashCode.toString(), name: "İşletmeler");
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
                                  items: sube?.map((e) => DropdownMenuItem(value: e, child: Text("${e.subeAdi} ${e.subeKodu ?? 0}"))).toList(),
                                  onChanged: (value) {
                                    if (value is IsletmeModel) {
                                      selected["Şube"] = value.isletmeKodu;
                                      log(selected.toString(), name: "Şube");
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
                    ),
                    context.emptySizedHeightBoxLow,
                    ElevatedButton(
                      onPressed: () async {
                        if (!selected.values.contains(null)) {
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
                          if (response.data != null) {
                            MainPageModel model = response.data[0];
                            CacheManager.setanaVeri(model);
                            var b = CacheManager.getAnaVeri();
                            log(b?.sirketModel.toString() ?? "null", name: "cache");
                            Get.toNamed("mainPage");
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
            return const Center(child: CircularProgressIndicator.adaptive(valueColor: AlwaysStoppedAnimation<Color>(Colors.black)));
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
