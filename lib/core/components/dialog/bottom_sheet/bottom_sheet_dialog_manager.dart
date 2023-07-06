import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';

import '../../../constants/extensions/list_extensions.dart';
import '../../../constants/ui_helper/icon_helper.dart';
import '../../../constants/ui_helper/ui_helper.dart';
import '../../../init/cache/cache_manager.dart';
import '../../button/toggle_buttons/toggle_button.dart';
import '../../helper_widgets/custom_label_widget.dart';
import '../../helper_widgets/responsive_height_box.dart';
import 'model/bottom_sheet_model.dart';
import 'model/bottom_sheet_response_model.dart';
import 'view_model/bottom_sheet_state_manager.dart';

class BottomSheetDialogManager {
  static final BottomSheetStateManager viewModel = BottomSheetStateManager();
  showBottomSheetDialog(BuildContext context, {required String title, Widget? body, List<BottomSheetModel>? children, bool aramaVarMi = false}) {
    List<BottomSheetModel>? children2 = children;
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
                    ? children.isNotNullOrEmpty
                        ? SizedBox(
                            // if children are not fit to screen, it will be scrollable
                            height: children!.length * ((children?.any((element) => element.description.isNotNullOrNoEmpty) ?? false) ? 60 : 50) < Get.height * 0.9
                                ? children!.length * ((children?.any((element) => element.description.isNotNullOrNoEmpty) ?? false) ? 60 : 50)
                                : Get.height * 0.9,
                            child: ListView.builder(
                              itemCount: children?.length,
                              itemBuilder: (context, index) => Column(
                                children: [
                                  ListTile(
                                      onTap: children?[index].onTap,
                                      title: Text(children![index].title),
                                      subtitle: children![index].description != null ? Text(children![index].description ?? '') : null,
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
                        : Center(child: Text('Veri bulunamadı.', style: context.theme.textTheme.titleMedium)).paddingAll(UIHelper.highSize)
                    : WillPopScope(
                        child: SingleChildScrollView(child: body),
                        onWillPop: () async {
                          var result = body;
                          Get.back(result: result);
                          return true;
                        }),
                context.isKeyBoardOpen ? const ResponsiveBox() : Container(),
              ],
            ),
          );
        });
  }

  showRadioBottomSheetDialog(BuildContext context, {required String title, Widget? body, List<BottomSheetModel?>? children}) {
    children = children?.nullCheck.cast<BottomSheetModel>();
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
                                            children?[index]?.onTap!();
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

  showCheckBoxBottomSheetDialog(BuildContext context, {List<BottomSheetModel>? children, required String title, bool onlyValue = false }) {
    List<dynamic>? list;
    if (viewModel.isSelectedListMap?[title] == null) {
      viewModel.changeIsSelectedListMap(title, List.generate(children!.length, (index) => false));
    } else {
      if (children!.length != viewModel.isSelectedListMap?[title]!.length) {
        viewModel.changeIsSelectedListMap(title, List.generate(children.length, (index) => false));
      }
    }
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
            children.isNotNullOrEmpty
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
                                          children[index].onTap!();
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
    if (viewModel.kodControllerText.isNullOrEmpty || viewModel.getKodControllerText?.length != onayliGrupNo.length) {
      viewModel.changeKodControllerTextList(List.generate(onayliGrupNo.length, (index) => ""));
    }
    TextEditingController sehirController = TextEditingController(text: viewModel.sehir ?? "");
    TextEditingController plasiyerController = TextEditingController(text: viewModel.plasiyer ?? "");
    TextEditingController ilceController = TextEditingController(text: viewModel.ilce ?? "");
    List controllers = List.generate(onayliGrupNo.length, (index) => TextEditingController(text: viewModel.getKodControllerText![index]));
    BottomSheetResponseModel bottomSheetResponseModel = BottomSheetResponseModel.instance;
    return showBottomSheetDialog(context,
        title: "Filtrele",
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomWidgetWithLabel(
              text: "Bakiye Durumu",
              children: [ToggleButton()],
            ),
            Center(
              child: Wrap(
                runAlignment: WrapAlignment.spaceAround,
                alignment: WrapAlignment.start,
                children: [
                  Observer(builder: (_) {
                    return CustomTextField(
                      labelText: "Plasiyer",
                      controller: plasiyerController,
                      suffix: const Icon(Icons.more_horiz_outlined),
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
                      suffix: const Icon(Icons.more_horiz_outlined),
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
                        suffix: const Icon(Icons.more_horiz_outlined),
                        readOnly: true,
                        onTap: () async {
                          var a = await showRadioBottomSheetDialog(context, title: "Tipi seç", children: [
                            BottomSheetModel(title: "Alıcı", value: "A", onTap: () => Get.back(result: "Alıcı")),
                            BottomSheetModel(title: "Satıcı", value: "S", onTap: () => Get.back(result: "Satıcı")),
                            BottomSheetModel(title: "Toptancı", value: "T", onTap: () => Get.back(result: "Toptancı")),
                            BottomSheetModel(title: "Kefil", value: "K", onTap: () => Get.back(result: "Kefil")),
                            BottomSheetModel(title: "Müstahsil", value: "M", onTap: () => Get.back(result: "Müstahsil")),
                            BottomSheetModel(title: "Diğer", value: "D", onTap: () => Get.back(result: "Diğer")),
                            BottomSheetModel(title: "Komisyoncu", value: "I", onTap: () => Get.back(result: "Komisyoncu")),
                          ]);
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
                          suffix: const Icon(Icons.more_horiz_outlined),
                          readOnly: true,
                          onTap: () async {
                            var result =
                                await showCheckBoxBottomSheetDialog(context, title: "$title seç", children: List.generate(data.length, (index2) => BottomSheetModel(title: data[index2].grupAdi)));
                            if (result != null) {
                              controllers[index].text = result.join(", ");
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
}
