// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/components/slide_controller/view/slide_controller_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/enum/grup_kodu_enums.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/init/network/network_manager.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_kosullar_model.dart";
import "../../../../view/main_page/alt_sayfalar/cari/cari_network_manager.dart";
import "../../../../view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "../../../base/model/base_grup_kodu_model.dart";
import "../../../base/model/belge_tipi_model.dart";
import "../../../base/model/generic_response_model.dart";
import "../../../base/model/print_model.dart";
import "../../../constants/extensions/list_extensions.dart";
import "../../../constants/ui_helper/icon_helper.dart";
import "../../../constants/ui_helper/ui_helper.dart";
import "../../../init/cache/cache_manager.dart";
import '../../button/toggle_buttons/view/toggle_button.dart';
import "../../helper_widgets/responsive_height_box.dart";
import "../dialog_manager.dart";
import "model/bottom_sheet_model.dart";
import "model/bottom_sheet_response_model.dart";
import "view_model/bottom_sheet_state_manager.dart";

class BottomSheetDialogManager {
  static final BottomSheetStateManager viewModel = BottomSheetStateManager();
  showBottomSheetDialog(BuildContext context, {required String title, Widget? body, List<BottomSheetModel>? children, bool aramaVarMi = false}) {
    List<BottomSheetModel>? children2 = children;
    //if keyboard is open, close it
    //FocusScope.of(context).unfocus();
    return showModalBottomSheet(
        context: context,
        isDismissible: true,
        // constraints: BoxConstraints(maxHeight: Get.height * 0.9),
        barrierColor: Colors.black.withOpacity(0.9),
        enableDrag: false,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (context) {
          return SafeArea(
            child: Padding(
              padding: MediaQuery.of(context).viewInsets,
              child: Wrap(
                children: [
                  ListTile(
                    contentPadding: UIHelper.lowPadding,
                    title: Text(title, style: context.theme.textTheme.titleMedium).paddingOnly(left: UIHelper.lowSize),
                    trailing: IconButton(icon: const Icon(Icons.close), onPressed: () => Get.back()),
                    splashColor: Colors.transparent,
                  ).paddingSymmetric(vertical: 10),
                  const Divider(
                    thickness: 2,
                    endIndent: 0,
                    indent: 0,
                  ),
                  body == null && ((children?.length ?? 0) > 20)
                      ? TextField(
                          decoration: const InputDecoration(hintText: "Aramak istediğiniz metni yazınız."),
                          onSubmitted: (value) {
                            if (value == "") {
                              children = children2;
                            }
                            children = children!.where((element) => element.title.toLowerCase().contains(value.toLowerCase())).toList();
                          }).paddingAll(UIHelper.midSize)
                      : const SizedBox(),
                  body == null
                      ? children.ext.isNotNullOrEmpty
                          ? SizedBox(
                              // if children are not fit to screen, it will be scrollable
                              height: children!.length * ((children?.any((element) => element.description.ext.isNotNullOrNoEmpty) ?? false) ? 60 : 50) < Get.height * 0.9
                                  ? children!.length * ((children?.any((element) => element.description.ext.isNotNullOrNoEmpty) ?? false) ? 60 : 50)
                                  : Get.height * 0.9,
                              child: ListView.builder(
                                itemCount: children?.length,
                                itemBuilder: (context, index) => Column(
                                  children: [
                                    ListTile(
                                        onTap: children?[index].onTap ?? () => Get.back(result: children![index].value),
                                        title: Text(children![index].title),
                                        subtitle: children![index].description != null
                                            ? Text(children![index].description ?? "", style: TextStyle(color: context.theme.textTheme.bodyLarge?.color?.withOpacity(0.6)))
                                            : null,
                                        leading: children![index].icon != null || children![index].iconWidget != null
                                            ? SizedBox(
                                                width: 20,
                                                height: 20,
                                                child: children![index].iconWidget != null
                                                    ? Icon(children![index].iconWidget, size: 25, color: UIHelper.primaryColor)
                                                    : IconHelper.smallIcon(children![index].icon!),
                                              )
                                            : null),
                                    index != children!.length - 1
                                        ? Padding(
                                            padding: UIHelper.lowPaddingVertical,
                                            child: const Divider(),
                                          )
                                        : Container()
                                  ],
                                ),
                              ).paddingOnly(bottom: 10),
                            )
                          : Center(child: Text("Veri bulunamadı.", style: context.theme.textTheme.titleMedium)).paddingAll(UIHelper.highSize)
                      : SafeArea(
                          child: Container(constraints: BoxConstraints(maxHeight: Get.height * 0.9), child: SingleChildScrollView(child: body)),
                        ),
                  context.general.isKeyBoardOpen && body == null ? const ResponsiveBox() : Container(),
                ],
              ),
            ),
          );
        });
  }

  showRadioBottomSheetDialog(BuildContext context, {required String title, Widget? body, List<BottomSheetModel?>? children}) {
    children = children?.nullCheckWithGeneric;
    //FocusScope.of(context).unfocus();
    return showModalBottomSheet(
        context: context,
        isDismissible: true,
        barrierColor: Colors.black.withOpacity(0.9),
        enableDrag: false,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                contentPadding: UIHelper.lowPadding,
                title: Text(title, style: context.theme.textTheme.titleMedium).paddingOnly(left: UIHelper.lowSize),
                trailing: IconButton(icon: const Icon(Icons.close), onPressed: () => Get.back()),
                splashColor: Colors.transparent,
              ).paddingSymmetric(vertical: 10),
              const Divider(
                thickness: 2,
                endIndent: 0,
                indent: 0,
              ),
              body == null
                  ? SizedBox(
                      // if children are not fit to screen, it will be scrollable
                      height: children!.length * 50 < Get.height * 0.9 ? children.length * 50 : Get.height * 0.9,
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Wrap(
                                children: [
                                  ...List.generate(
                                    children.length,
                                    (index) => Wrap(
                                      children: [
                                        RadioListTile(
                                          activeColor: UIHelper.primaryColor,
                                          onChanged: (value) {
                                            viewModel.changeRadioGroupValue(title);
                                            if (children?[index]?.onTap != null) {
                                              children?[index]?.onTap!();
                                            } else {
                                              Get.back(result: children![index]?.value);
                                            }
                                          },
                                          value: children?[index]?.title,
                                          groupValue: viewModel.radioGroupValue,
                                          title: Text(children![index]!.title),
                                        ),
                                        index != children.length - 1
                                            ? Padding(
                                                padding: UIHelper.lowPaddingVertical,
                                                child: const Divider(),
                                              )
                                            : Container()
                                      ],
                                    ),
                                  ),
                                ],
                              ).paddingOnly(bottom: 10),
                            ),
                          ),
                        ],
                      ),
                    )
                  : WillPopScope(
                      child: SingleChildScrollView(child: body),
                      onWillPop: () async {
                        var result = body;
                        Get.back(result: result);
                        return true;
                      }),
            ],
          );
        });
  }

  showCheckBoxBottomSheetDialog(BuildContext context, {List<BottomSheetModel>? children, required String title, bool onlyValue = false}) {
    List<dynamic>? list;
    if (viewModel.isSelectedListMap?[title] == null) {
      viewModel.changeIsSelectedListMap(title, List.generate(children!.length, (index) => false));
    } else {
      if (children!.length != viewModel.isSelectedListMap?[title]!.length) {
        viewModel.changeIsSelectedListMap(title, List.generate(children.length, (index) => false));
      }
    }
    //FocusScope.of(context).unfocus();
    return showModalBottomSheet(
      context: context,
      isDismissible: true,
      barrierColor: Colors.black.withOpacity(0.9),
      enableDrag: false,
      useSafeArea: true,
      isScrollControlled: true,
      builder: (context) {
        return SafeArea(
            child: Wrap(
          children: [
            ListTile(
              contentPadding: UIHelper.lowPadding,
              title: Text(title, style: context.theme.textTheme.titleMedium).paddingOnly(left: UIHelper.lowSize),
              trailing: IconButton(icon: const Icon(Icons.close), onPressed: () => Get.back()),
              splashColor: Colors.transparent,
            ).paddingSymmetric(vertical: 10),
            const Divider(
              thickness: 2,
              endIndent: 0,
              indent: 0,
            ),
            children.ext.isNotNullOrEmpty
                ? SizedBox(
                    // if children are not fit to screen, it will be scrollable
                    height: (children.length + 1) * 50 < Get.height * 0.8 ? (children.length + 1) * 50 : Get.height * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Wrap(
                              children: List.generate(children.length, (index) {
                                return Wrap(
                                  children: [
                                    Observer(builder: (_) {
                                      return CheckboxListTile(
                                        controlAffinity: ListTileControlAffinity.leading,
                                        value: viewModel.isSelectedListMap?[title]![index],
                                        title: Text(children[index].title),
                                        onChanged: (value) {
                                          viewModel.changeIndexIsSelectedListMap(title, index, value!);
                                          // viewModel.isSelectedListMap![title]![index] = value!;
                                          list = selectedChecker(children, title, onlyValue);
                                          if (children[index].onTap != null) {
                                            children[index].onTap!();
                                          }
                                          // if (!value) {
                                          //   list!.remove(children[index].title);
                                          // }
                                        },
                                      );
                                    }),
                                    index != children.length - 1
                                        ? Padding(
                                            padding: UIHelper.lowPaddingVertical,
                                            child: const Divider(),
                                          )
                                        : Container()
                                  ],
                                ).paddingOnly(bottom: 10);
                              }),
                            ),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            list = selectedChecker(children, title, onlyValue);
                            Get.back(result: list);
                          },
                          child: const Text("Seç"),
                        )
                      ],
                    ),
                  )
                : Wrap(children: [Center(child: const Text("Veri Yok").paddingAll(UIHelper.highSize))]),
          ],
        ).paddingAll(UIHelper.midSize));
      },
    );
  }

  List<dynamic> selectedChecker(List<BottomSheetModel>? children, String title, bool onlyValue) {
    List list = [];
    for (var i = 0; i < viewModel.isSelectedListMap![title]!.length; i++) {
      if (viewModel.isSelectedListMap![title]![i]) {
        list.add(children![i].value ?? (onlyValue ? null : children[i].title));
      }
    }
    return list;
  }

  showFilterBottomSheetDialog(BuildContext context, {Function(int)? onTap, dynamic request}) {
    List onayliGrupNo = request["kod"].map((e) => e.grupNo).toSet().toList();
    onayliGrupNo.sort((a, b) => a.compareTo(b));
    List<List> items = [];
    for (var element in onayliGrupNo) {
      List liste = [];
      request["kod"].forEach((e) {
        if (e.grupNo == element) {
          liste.add(e);
        }
      });
      items.add(liste);
    }
    if (viewModel.kodControllerText.ext.isNullOrEmpty || viewModel.getKodControllerText?.length != onayliGrupNo.length) {
      viewModel.changeKodControllerTextList(List.generate(onayliGrupNo.length, (index) => ""));
    }
    TextEditingController sehirController = TextEditingController(text: viewModel.sehir ?? "");
    TextEditingController plasiyerController = TextEditingController(text: viewModel.plasiyer ?? "");
    TextEditingController ilceController = TextEditingController(text: viewModel.ilce ?? "");
    List controllers = List.generate(onayliGrupNo.length, (index) => TextEditingController(text: viewModel.getKodControllerText![index]));
    BottomSheetResponseModel bottomSheetResponseModel = BottomSheetResponseModel.instance;
    const childrenValueList2 = ["", "T", "O", "S", "B"];
    return showBottomSheetDialog(context,
        title: "Filtrele",
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SliderWidget(title: "Bakiye Durumu", childrenValueList2: childrenValueList2),
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.spaceAround,
                alignment: WrapAlignment.start,
                children: [
                  Observer(builder: (_) {
                    return CustomTextField(
                      labelText: "Plasiyer",
                      controller: plasiyerController,
                      suffixMore: true,
                      readOnly: true,
                      onTap: () async {
                        var data = CacheManager.getAnaVeri();

                        var result = await showCheckBoxBottomSheetDialog(context,
                            title: "Plasiyer seç",
                            children: List.generate(data?.paramModel?.plasiyerList?.length ?? 0, (index) => BottomSheetModel(title: data?.paramModel?.plasiyerList![index].plasiyerAciklama ?? "")));
                        if (result != null) {
                          var plasiyerKoduList = data?.paramModel?.plasiyerList?.where((element) => result.contains(element.plasiyerAciklama)).map((e) => e.plasiyerKodu).toList();
                          bottomSheetResponseModel.arrPlasiyer = plasiyerKoduList;
                          plasiyerController.text = result.join(", ");
                          viewModel.changePlasiyer(result.join(", "));
                        }
                      },
                    );
                  }),
                  Observer(builder: (_) {
                    return CustomTextField(
                      labelText: "Şehir",
                      readOnly: true,
                      controller: sehirController,
                      suffixMore: true,
                      onTap: () async {
                        var result = await showCheckBoxBottomSheetDialog(context,
                            title: "Şehir seç", children: List.generate(request["sehir"].length, (index) => BottomSheetModel(title: request["sehir"][index].sehirAdi)));
                        if (result != null) {
                          bottomSheetResponseModel.arrSehir = result;
                          viewModel.changeSehir(result.join(", "));
                          sehirController.text = viewModel.sehir ?? "";
                        }
                      },
                    );
                  }),
                  CustomTextField(
                    labelText: "İlçe",
                    controller: ilceController,
                    onChanged: (value) {
                      viewModel.changeIlce(value);
                    },
                  ),
                  Observer(builder: (_) {
                    return CustomTextField(
                        labelText: "Tipi",
                        controller: TextEditingController(text: viewModel.cariTipi),
                        suffixMore: true,
                        readOnly: true,
                        onTap: () async {
                          var a = await showCariTipiBottomSheetDialog(context);
                          if (a != null) {
                            var result = a != "Komisyoncu" ? a[0] : "I";
                            viewModel.cariTipi = a;
                            bottomSheetResponseModel.cariTipi = result;
                          }
                        });
                  }),
                  ...List.generate(
                    onayliGrupNo.length,
                    (index) {
                      String title = onayliGrupNo[index] != 0 ? "Kod ${onayliGrupNo[index]}" : "Grup Kodu";
                      List data = items[index];

                      return Observer(builder: (_) {
                        return CustomTextField(
                          labelText: title,
                          controller: controllers[index],
                          suffixMore: true,
                          readOnly: true,
                          onTap: () async {
                            var result =
                                await showCheckBoxBottomSheetDialog(context, title: "$title seç", children: List.generate(data.length, (index2) => BottomSheetModel(title: data[index2].grupAdi)));
                            if (result != null) {
                              if (result is String) {
                                controllers[index].text = result;
                              } else {
                                controllers[index].text = result.join(", ");
                              }
                              var a = data.where((element) => result.contains(element.grupAdi)).map((e) => e.grupKodu).toList();
                              arrKodFinder(index, bottomSheetResponseModel, a);
                            }
                          },
                        );
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                    child: Observer(builder: (_) {
                  return ElevatedButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white.withOpacity(0.1))),
                      onPressed: () {
                        ToggleButton.selected = "";
                        viewModel.changeSehir("");
                        viewModel.changeCariTipi("");
                        viewModel.changePlasiyer("");
                        viewModel.changeKodControllerTextList([...controllers.map((e) => e.text = "").toList()]);
                        viewModel.deleteIsSelectedListMap();
                        bottomSheetResponseModel.clear();
                        Get.back(result: bottomSheetResponseModel);
                      },
                      child: const Text("Filtreyi Temizle"));
                }).paddingOnly(right: UIHelper.lowSize)),
                Expanded(child: Observer(builder: (_) {
                  return ElevatedButton(
                      onPressed: () {
                        viewModel.changeKodControllerTextList([...controllers.map((e) => e.text).toList()]);
                        var a = bottomSheetResponseModel..filterBakiye = ToggleButton.selected;
                        a.ilce = viewModel.ilce;
                        Get.back(result: a);
                      },
                      child: const Text("Uygula"));
                })),
              ],
            ).paddingAll(UIHelper.lowSize),
            const ResponsiveBox(),
          ],
        ));
  }

  static void arrKodFinder(int index, BottomSheetResponseModel bottomSheetResponseModel, result) {
    switch (index) {
      case 0:
        bottomSheetResponseModel.arrGrupKodu = result;
        viewModel.changeKod0(result.join(", "));
        break;
      case 1:
        bottomSheetResponseModel.arrKod1 = result;
        viewModel.changeKod1(result.join(", "));
        break;
      case 2:
        bottomSheetResponseModel.arrKod2 = result;
        viewModel.changeKod2(result.join(", "));
        break;
      case 3:
        bottomSheetResponseModel.arrKod3 = result;
        viewModel.changeKod3(result.join(", "));
        break;
      case 4:
        bottomSheetResponseModel.arrKod4 = result;
        viewModel.changeKod4(result.join(", "));
        break;
      case 5:
        bottomSheetResponseModel.arrKod5 = result;
        viewModel.changeKod5(result.join(", "));
        break;
      default:
        "";
    }
  }

  void clearSelectedData() {
    viewModel.deleteIsSelectedListMap();
  }

  //  Future<GenericResponseModel<NetworkManagerMixin>> getData() async {
  //   GenericResponseModel<NetworkManagerMixin> response;
  //   response = await NetworkManager().dioGet<CariSehirlerModel>(path: ApiUrls.getCariKayitliSehirler, bodyModel: CariSehirlerModel(), addTokenKey: true, headers: {
  //     "VERITABANI": AccountModel.instance.aktifVeritabani.toString(),
  //     "ISLETME_KODU": AccountModel.instance.aktifIsletmeKodu.toString(),
  //     "SUBE_KODU": AccountModel.instance.aktifSubeKodu.toString(),
  //   });
  //   return response;
  // }
  Future<DepoList?> showDepoBottomSheetDialog(BuildContext context) async => await showRadioBottomSheetDialog(context,
      title: "Depo seç", children: CacheManager.getAnaVeri()?.paramModel?.depoList?.map((e) => BottomSheetModel(title: e.depoTanimi ?? "", value: e)).toList());

  Future<ListCariOdemeKodu?> showOdemeKoduBottomSheetDialog(BuildContext context) async => await showRadioBottomSheetDialog(context,
      title: "Ödeme Kodu seç", children: CacheManager.getAnaVeri()?.paramModel?.listCariOdemeKodu?.map((e) => BottomSheetModel(title: e.aciklama ?? "", value: e)).toList());
  showCariTipiBottomSheetDialog(BuildContext context) async => await showRadioBottomSheetDialog(context, title: "Tipi seç", children: [
        BottomSheetModel(title: "Alıcı", value: "A", onTap: () => Get.back(result: "Alıcı")),
        BottomSheetModel(title: "Satıcı", value: "S", onTap: () => Get.back(result: "Satıcı")),
        BottomSheetModel(title: "Toptancı", value: "T", onTap: () => Get.back(result: "Toptancı")),
        BottomSheetModel(title: "Kefil", value: "K", onTap: () => Get.back(result: "Kefil")),
        BottomSheetModel(title: "Müstahsil", value: "M", onTap: () => Get.back(result: "Müstahsil")),
        BottomSheetModel(title: "Diğer", value: "D", onTap: () => Get.back(result: "Diğer")),
        BottomSheetModel(title: "Komisyoncu", value: "I", onTap: () => Get.back(result: "Komisyoncu")),
      ]);
  Future<List<PlasiyerList?>?> showPlasiyerListesiBottomSheetDialog(BuildContext context) async {
    List<PlasiyerList> plasiyerList = CacheManager.getAnaVeri()?.paramModel?.plasiyerList ?? <PlasiyerList>[];
    var result = await showCheckBoxBottomSheetDialog(context,
        title: "Plasiyer Seçiniz", children: plasiyerList.map((e) => BottomSheetModel(title: e.plasiyerAciklama ?? e.plasiyerKodu ?? "", value: e)).toList());
    return result.cast<PlasiyerList>();
  }

  Future<List<BaseGrupKoduModel?>?> showGrupKoduCheckBoxBottomSheetDialog(BuildContext context, {required GrupKoduEnum modul, required int grupKodu, bool? kullanimda}) async {
    if (viewModel.grupKoduList.ext.isNullOrEmpty) {
      viewModel.changeGrupKoduList(await NetworkManager().getGrupKod(name: modul.name, grupNo: -1, kullanimda: kullanimda));
    }
    viewModel.filteredGrupKoduListFilter(grupKodu);
    var result = await showCheckBoxBottomSheetDialog(context,
        title: "Grup Kodu($grupKodu) Seçiniz", children: viewModel.filteredGrupKoduList?.map((e) => BottomSheetModel(title: e.grupAdi ?? "", value: e)).toList());
    if (result != null) {
      return result.cast<BaseGrupKoduModel>();
    }
    return null;
  }

  Future<BaseGrupKoduModel?> showGrupKoduBottomSheetDialog(BuildContext context, {required GrupKoduEnum modul, required int grupKodu, bool? kullanimda}) async {
    if (viewModel.grupKoduList.ext.isNullOrEmpty) {
      viewModel.changeGrupKoduList(await NetworkManager().getGrupKod(name: modul.name, grupNo: -1, kullanimda: kullanimda));
    }
    viewModel.filteredGrupKoduListFilter(grupKodu);
    var result =
        await showRadioBottomSheetDialog(context, title: "Grup Kodu Seçiniz", children: viewModel.filteredGrupKoduList?.map((e) => BottomSheetModel(title: e.grupAdi ?? "", value: e)).toList());
    if (result != null) {
      return result;
    }
    return null;
  }

  Future<StokMuhasebeKoduModel?> showMuhasebeKoduBottomSheetDialog(BuildContext context) async {
    if (viewModel.muhasebeKoduList.ext.isNullOrEmpty) {
      viewModel.changeMuhasebeKoduList(await NetworkManager().getMuhasebeKodlari());
    }
    return await showBottomSheetDialog(context,
        title: "Muhasebe Kodu Seçiniz",
        children: viewModel.muhasebeKoduList?.map((e) => BottomSheetModel(title: e.adi ?? "", description: "ALIŞ: ${e.alisHesabi ?? ""}\nSATIŞ: ${e.satisHesabi ?? ""}", value: e)).toList());
  }

  Future<PlasiyerList?> showPlasiyerBottomSheetDialog(BuildContext context) async {
    List<PlasiyerList> plasiyerList = CacheManager.getAnaVeri()?.paramModel?.plasiyerList ?? [];
    return await showRadioBottomSheetDialog(context,
        title: "Plasiyer Seçiniz", children: plasiyerList.map((e) => BottomSheetModel(title: e.plasiyerAciklama ?? e.plasiyerKodu ?? "", value: e)).toList());
  }

  Future<BaseProjeModel?> showProjeBottomSheetDialog(BuildContext context) async {
    List<BaseProjeModel> projeList = await NetworkManager().getProjeData() ?? [];
    BaseProjeModel? proje =
        await showRadioBottomSheetDialog(context, title: "Proje Seçiniz", children: projeList.map((e) => BottomSheetModel(title: e.projeAciklama ?? e.projeKodu ?? "", value: e)).toList());
    return proje;
  }

  Future<DovizList?> showDovizBottomSheetDialog(BuildContext context) async {
    List<DovizList> dovizList = CacheManager.getAnaVeri()?.paramModel?.dovizList ?? [];
    DovizList? doviz =
        await showRadioBottomSheetDialog(context, title: "Döviz Seçiniz", children: dovizList.map((e) => BottomSheetModel(title: e.isim ?? e.dovizKodu.toStringIfNotNull ?? "", value: e)).toList());
    return doviz;
  }

  Future<YaziciList?> showYaziciBottomSheetDialog(BuildContext context) async {
    List<YaziciList>? yaziciList = CacheManager.getAnaVeri()?.paramModel?.yaziciList;
    var result = await showRadioBottomSheetDialog(context,
        title: "Yazıcı Seçiniz",
        children: yaziciList
                ?.map((e) => BottomSheetModel(
                    title: (e.yaziciAdi ?? e.aciklama ?? ""),
                    onTap: () {
                      Get.back(result: e);
                    }))
                .toList() ??
            [].cast<BottomSheetModel>());
    if (result != null && result is YaziciList) {
      return result;
    }
    return null;
  }

  Future<NetFectDizaynList?> showDizaynBottomSheetDialog(BuildContext context) async {
    List<NetFectDizaynList> netFectDizaynList = CacheManager.getAnaVeri()?.paramModel?.netFectDizaynList ?? [];
    NetFectDizaynList? dizayn =
        await showRadioBottomSheetDialog(context, title: "Dizayn Seçiniz", children: netFectDizaynList.map((e) => BottomSheetModel(title: e.dizaynAdi ?? e.detayKod ?? "", value: e)).toList());
    return dizayn;
  }

  Future<BelgeTipiModel?> showBelgeTipiBottomSheetDialog(BuildContext context) async {
    List<BelgeTipiModel> belgeTipiList = [BelgeTipiModel(belgeTipi: "Yurt İçi", belgeTipiId: 2), BelgeTipiModel(belgeTipi: "Yurt Dışı", belgeTipiId: 6)];
    return await showRadioBottomSheetDialog(context,
        title: "Belge Tipi Seçiniz", children: belgeTipiList.map((e) => BottomSheetModel(title: e.belgeTipi ?? e.belgeTipiId.toStringIfNotNull ?? "", value: e)).toList());
  }

  Future showOlcuBirimiBottomSheetDialog(BuildContext context) async {
    // List olcuBirimleriList = CacheManager.getAnaVeri().paramModel.olc;
    // var olcuBirimi =
    //     await showRadioBottomSheetDialog(context, title: "Ölçü Birimi Seçiniz", children: olcuBirimleriList.map((e) => BottomSheetModel(title: e.olcuBirimi ?? "", value: e)).toList());
    // return olcuBirimi;
  }
  Future<ListIskTip?> showIskontoTipiBottomSheetDialog(BuildContext context) async {
    List<ListIskTip> iskontoTipiList = CacheManager.getAnaVeri()?.paramModel?.listIskTip ?? [];
    ListIskTip? iskontoTipi = await showRadioBottomSheetDialog(context,
        title: "İskonto Tipi Seçiniz", children: iskontoTipiList.map((e) => BottomSheetModel(title: e.aciklama ?? e.iskontoTipi.toStringIfNotNull ?? "", value: e)).toList());
    return iskontoTipi;
  }

  Future<CariKosullarModel?> showKosullarBottomSheetDialog(BuildContext context) async {
    GenericResponseModel data = await CariNetworkManager.getkosullar();
    List<CariKosullarModel> list = data.data.map((e) => e as CariKosullarModel).toList().cast<CariKosullarModel>();
    return await showRadioBottomSheetDialog(context, title: "Koşullar Seçiniz", children: list.map((e) => BottomSheetModel(title: e.genelKosulAdi ?? e.kosulKodu ?? "", value: e)).toList());
  }

  Future<double?> showKdvOranlariBottomSheetDialog(BuildContext context) async {
    var list = await NetworkManager().getKDVOrani();
    return await showRadioBottomSheetDialog(context, title: "KDV Oranı Seçiniz", children: list?.map((e) => BottomSheetModel(title: e.toString(), value: e)).toList());
  }

  Future<ListOzelKodTum?> showOzelKod1BottomSheetDialog(BuildContext context) async {
    List<ListOzelKodTum> list = CacheManager.getAnaVeri()?.paramModel?.listOzelKodTum?.where((element) => element.belgeTipi == "S" && element.fiyatSirasi != 0).toList() ?? [];
    return await showRadioBottomSheetDialog(context, title: "Özel Kod Seçiniz", children: list.map((e) => BottomSheetModel(title: e.aciklama ?? e.kod ?? "", value: e)).toList());
  }

  Future<ListOzelKodTum?> showOzelKod2BottomSheetDialog(BuildContext context) async {
    List<ListOzelKodTum> list = CacheManager.getAnaVeri()?.paramModel?.listOzelKodTum?.where((element) => element.belgeTipi == "S" && element.fiyatSirasi == 0).toList() ?? [];
    return await showRadioBottomSheetDialog(context, title: "Özel Kod Seçiniz", children: list.map((e) => BottomSheetModel(title: e.aciklama ?? e.kod ?? "", value: e)).toList());
  }

  Future<bool?> showPrintBottomSheetDialog(BuildContext context, PrintModel printModel, bool? askDizayn, bool? askMiktar) async {
    if (printModel.yaziciAdi == null) {
      List<YaziciList?> yaziciListe = CacheManager.getAnaVeri()?.paramModel?.yaziciList ?? [];
      if (yaziciListe.length == 1) {
        printModel = printModel.copyWith(yaziciAdi: yaziciListe.first?.yaziciAdi, yaziciTipi: yaziciListe.first?.yaziciTipi);
      } else if (yaziciListe.length > 1) {
        await showBottomSheetDialog(context, title: "Yazıcı Seçiniz", children: yaziciListe.map((e) => BottomSheetModel(title: e?.yaziciAdi ?? "", value: e)).toList());
        printModel = printModel.copyWith(yaziciAdi: yaziciListe.first?.yaziciAdi, yaziciTipi: yaziciListe.first?.yaziciTipi);
      } else {
        var yaziciList = await showYaziciBottomSheetDialog(context);
        if (yaziciList != null) {
          printModel = printModel.copyWith(yaziciAdi: yaziciList.yaziciAdi, yaziciTipi: yaziciList.yaziciTipi);
        } else {
          return null;
        }
      }
    }
    if (askDizayn == true) {
      List<NetFectDizaynList?> dizaynListe = CacheManager.getAnaVeri()?.paramModel?.netFectDizaynList?.where((element) => element.ozelKod == printModel.raporOzelKod).toList() ?? [];
      if (dizaynListe.length == 1) {
        printModel = printModel.copyWith(dizaynId: dizaynListe.first?.id);
      } else if (dizaynListe.length > 1) {
        await showBottomSheetDialog(context, title: "Dizayn Seçiniz", children: dizaynListe.map((e) => BottomSheetModel(title: e?.dizaynAdi ?? "", value: e)).toList());
        printModel = printModel.copyWith(dizaynId: dizaynListe.first?.id);
      } else {
        var dizaynList = await showDizaynBottomSheetDialog(context);
        if (dizaynList != null) {
          printModel = printModel.copyWith(dizaynId: dizaynList.id);
        } else {
          return null;
        }
      }
    }
    if (askMiktar == true) {
      TextEditingController dizaynController = TextEditingController(text: printModel.dizaynId.toStringIfNotNull);
      TextEditingController yaziciController = TextEditingController(text: printModel.yaziciAdi);
      TextEditingController kopyaController = TextEditingController(text: printModel.etiketSayisi.toStringIfNotNull);
      await showBottomSheetDialog(context,
          title: "",
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(labelText: "Dizayn", isMust: true, controller: dizaynController, readOnly: true, suffixMore: true, onTap: () async {}),
              CustomTextField(labelText: "Yazıcı", isMust: true, controller: yaziciController, readOnly: true, suffixMore: true, onTap: () async {}),
              CustomTextField(
                labelText: "Kopya Sayısı",
                isMust: true,
                controller: kopyaController,
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  int kopya = int.tryParse(value) ?? 0;
                  if ((int.tryParse(value) ?? 0) <= 0) {
                    kopya = 1;

                    return;
                  }
                  kopyaController.text = kopya.toString();
                  printModel = printModel.copyWith(etiketSayisi: 1);
                },
                suffix: Wrap(
                  children: [
                    IconButton(
                        onPressed: () {
                          printModel = printModel.copyWith(etiketSayisi: (printModel.etiketSayisi ?? 0) - 1);
                          kopyaController.text = printModel.etiketSayisi.toStringIfNotNull ?? "";
                        },
                        icon: const Icon(Icons.remove)),
                    IconButton(
                        onPressed: () {
                          printModel = printModel.copyWith(etiketSayisi: (printModel.etiketSayisi ?? 0) + 1);
                          kopyaController.text = printModel.etiketSayisi.toStringIfNotNull ?? "";
                        },
                        icon: const Icon(Icons.add)),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    var result = await NetworkManager().postPrint(context, model: printModel);
                    if (result.success == true) {
                      DialogManager().showSuccessSnackBar("Yazdırıldı.");
                    } else {
                      DialogManager().showAlertDialog(result.message ?? "Yazdırma işlemi başarısız.");
                    }
                    Get.back();
                    dizaynController.dispose();
                    yaziciController.dispose();
                    kopyaController.dispose();
                  },
                  child: const Text("Yazdır"))
            ],
          ));
    } else {
      var result = await NetworkManager().postPrint(
        context,
        model: printModel,
      );
      if (result.success == true) {
        DialogManager().showSuccessSnackBar("Yazdırıldı.");
        return true;
      } else {
        DialogManager().showErrorSnackBar(result.message ?? "Yazdırma işlemi başarısız.");
      }
    }
    return null;
  }
}

class SliderWidget extends StatefulWidget {
  final String title;
  final List<String> childrenValueList2;
  const SliderWidget({super.key, required this.childrenValueList2, required this.title});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  @override
  Widget build(BuildContext context) {
    return SlideControllerWidget(
        title: widget.title,
        childrenTitleList: const ["Tümü", "Tahsil Edilecek", "Ödeme Yapılacak", "Sıfır Bakiye", "Bakiyeli"],
        childrenValueList: widget.childrenValueList2,
        groupValue: ToggleButton.selected,
        filterOnChanged: (index) {
          setState(() {
            ToggleButton.selected = widget.childrenValueList2[index ?? 0];
          });
        });
  }
}
