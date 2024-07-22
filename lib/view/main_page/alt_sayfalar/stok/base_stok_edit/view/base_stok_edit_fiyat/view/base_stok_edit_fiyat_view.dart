import "dart:convert";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../../core/base/model/base_empty_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../stok_liste/model/stok_listesi_model.dart";
import "../../../model/stok_detay_model.dart";
import "../view_model/base_stok_edit_fiyat_view_model.dart";

final class BaseStokEditFiyatView extends StatefulWidget {
  final BaseEditEnum? model;
  const BaseStokEditFiyatView({super.key, this.model});

  @override
  State<BaseStokEditFiyatView> createState() => _BaseStokEditFiyatViewState();
}

final class _BaseStokEditFiyatViewState extends BaseState<BaseStokEditFiyatView> {
  bool get isEnabled => widget.model != BaseEditEnum.goruntule;
  static StokDetayModel get stokDetayModel => StokDetayModel.instance;
  static StokListesiModel get stokListesiModel => StokListesiModel.instance;
  final BaseStokEditFiyatViewModel viewModel = BaseStokEditFiyatViewModel();
  late final TextEditingController alisKdvOraniController;
  late final TextEditingController alisFiyat1Controller;
  late final TextEditingController alisFiyat2Controller;
  late final TextEditingController alisFiyat3Controller;
  late final TextEditingController alisFiyat4Controller;
  late final TextEditingController alisDovizTipiController;
  late final TextEditingController alisDovizFiyatiController;
  late final TextEditingController satisKdvOraniController;
  late final TextEditingController satisFiyat1Controller;
  late final TextEditingController satisFiyat2Controller;
  late final TextEditingController satisFiyat3Controller;
  late final TextEditingController satisFiyat4Controller;
  late final TextEditingController satisDovizTipiController;
  late final TextEditingController satisDovizFiyatiController;

  @override
  void initState() {
    alisKdvOraniController = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.alisKdv.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? stokListesiModel.alisKdv.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    alisFiyat1Controller = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.alisFiat1.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ??
          stokListesiModel.alisFiat1.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    alisFiyat2Controller = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.alisFiat2.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ??
          stokListesiModel.alisFiat2.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    alisFiyat3Controller = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.alisFiat3.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ??
          stokListesiModel.alisFiat3.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    alisFiyat4Controller = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.alisFiat4.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ??
          stokListesiModel.alisFiat4.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    alisDovizTipiController = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.satisDovizAdi ?? stokListesiModel.alisDovizAdi ?? "",
    );
    alisDovizFiyatiController = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.dovAlisFiat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ??
          stokListesiModel.dovAlisFiat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisKdvOraniController = TextEditingController(
      text:
          stokDetayModel.stokList?.firstOrNull?.satisKdv.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ?? stokListesiModel.satisKdv.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisFiyat1Controller = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.satisFiat1.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ??
          stokListesiModel.satisFiat1.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisFiyat2Controller = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.satisFiat2.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ??
          stokListesiModel.satisFiat2.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisFiyat3Controller = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.satisFiat3.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ??
          stokListesiModel.satisFiat3.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisFiyat4Controller = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.satisFiat4.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ??
          stokListesiModel.satisFiat4.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisDovizTipiController = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.satisDovizAdi ?? stokListesiModel.satisDovizAdi ?? "",
    );
    satisDovizFiyatiController = TextEditingController(
      text: stokDetayModel.stokList?.firstOrNull?.dovSatisFiat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati) ??
          stokListesiModel.dovSatisFiat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    super.initState();
  }

  @override
  void dispose() {
    alisKdvOraniController.dispose();
    alisFiyat1Controller.dispose();
    alisFiyat2Controller.dispose();
    alisFiyat3Controller.dispose();
    alisFiyat4Controller.dispose();
    alisDovizTipiController.dispose();
    alisDovizFiyatiController.dispose();
    satisKdvOraniController.dispose();
    satisFiyat1Controller.dispose();
    satisFiyat2Controller.dispose();
    satisFiyat3Controller.dispose();
    satisFiyat4Controller.dispose();
    satisDovizTipiController.dispose();
    satisDovizFiyatiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(
          children: [
            CustomWidgetWithLabel(
              text: "Alış",
              child: Wrap(
                children: [
                  CustomTextField(
                    enabled: isEnabled,
                    labelText: "KDV Oranı",
                    controller: alisKdvOraniController,
                    isFormattedString: true,
                    readOnly: true,
                    suffixMore: true,
                    onTap: () async {
                      if (viewModel.kdvOraniList.ext.isNullOrEmpty) {
                        await getKdvOrani();
                      }
                      // ignore: use_build_context_synchronously
                      final double? result = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        title: "KDV Oranları",
                        children: viewModel.kdvOraniList
                            ?.map(
                              (element) => BottomSheetModel(
                                title: element.toStringIfNotNull ?? "",
                                onTap: () => Get.back(result: element),
                              ),
                            )
                            .toList(),
                      );
                      if (result != null) {
                        alisKdvOraniController.text = result.toString();
                        stokDetayModel.stokList?.firstOrNull?.alisKdv = result;
                        stokListesiModel.alisKdv = result;
                      }
                    },
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          enabled: isEnabled,
                          labelText: "Fiyat 1",
                          isFormattedString: true,
                          controller: alisFiyat1Controller,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (p0) {
                            stokDetayModel.stokList?.firstOrNull?.alisFiat1 = p0.toDoubleWithFormattedString;
                            stokListesiModel.alisFiat1 = p0.toDoubleWithFormattedString;
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          enabled: isEnabled,
                          labelText: "Fiyat 2",
                          isFormattedString: true,
                          controller: alisFiyat2Controller,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (p0) {
                            stokDetayModel.stokList?.firstOrNull?.alisFiat2 = p0.toDoubleWithFormattedString;
                            stokListesiModel.alisFiat2 = p0.toDoubleWithFormattedString;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          enabled: isEnabled,
                          labelText: "Fiyat 3",
                          isFormattedString: true,
                          controller: alisFiyat3Controller,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (p0) {
                            stokDetayModel.stokList?.firstOrNull?.alisFiat3 = p0.toDoubleWithFormattedString;
                            stokListesiModel.alisFiat3 = p0.toDoubleWithFormattedString;
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          enabled: isEnabled,
                          labelText: "Fiyat 4",
                          isFormattedString: true,
                          controller: alisFiyat4Controller,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (p0) {
                            stokDetayModel.stokList?.firstOrNull?.alisFiat4 = p0.toDoubleWithFormattedString;
                            stokListesiModel.alisFiat4 = p0.toDoubleWithFormattedString;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          enabled: isEnabled,
                          labelText: "Döviz Tipi",
                          controller: alisDovizTipiController,
                          readOnly: true,
                          onTap: () async {
                            final MapEntry? result = await getDovizList();
                            if (result != null) {
                              stokDetayModel.stokList?.firstOrNull?.alisDovTip = result.key;
                              stokDetayModel.stokList?.firstOrNull?.alisDovizAdi = result.value;
                              alisDovizTipiController.text = result.value;
                            }
                          },
                          suffixMore: true,
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          enabled: isEnabled,
                          labelText: "Alış Fiyatı",
                          isFormattedString: true,
                          controller: alisDovizFiyatiController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (p0) {
                            stokDetayModel.stokList?.firstOrNull?.dovAlisFiat = p0.toDoubleWithFormattedString;
                            stokListesiModel.dovAlisFiat = p0.toDoubleWithFormattedString;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CustomWidgetWithLabel(
              text: "Satış",
              child: Wrap(
                children: [
                  CustomTextField(
                    enabled: isEnabled,
                    labelText: "KDV Oranı",
                    readOnly: true,
                    suffixMore: true,
                    onTap: () async {
                      if (viewModel.kdvOraniList.ext.isNullOrEmpty) {
                        await getKdvOrani();
                      }
                      // ignore: use_build_context_synchronously
                      final double? result = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        title: "KDV Oranları",
                        children: viewModel.kdvOraniList
                            ?.map(
                              (element) => BottomSheetModel(
                                title: element.toStringIfNotNull ?? "",
                                onTap: () => Get.back(result: element),
                              ),
                            )
                            .toList(),
                      );
                      if (result != null) {
                        satisKdvOraniController.text = result.toString();
                        stokDetayModel.stokList?.firstOrNull?.satisKdv = result;
                        stokListesiModel.satisKdv = result;
                      }
                    },
                    controller: satisKdvOraniController,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          enabled: isEnabled,
                          labelText: "Fiyat 1",
                          isFormattedString: true,
                          controller: satisFiyat1Controller,
                          onChanged: (p0) {
                            stokDetayModel.stokList?.firstOrNull?.satisFiat1 = p0.toDoubleWithFormattedString;
                            stokListesiModel.satisFiat1 = p0.toDoubleWithFormattedString;
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          enabled: isEnabled,
                          labelText: "Fiyat 2",
                          isFormattedString: true,
                          controller: satisFiyat2Controller,
                          onChanged: (p0) {
                            stokDetayModel.stokList?.firstOrNull?.satisFiat2 = p0.toDoubleWithFormattedString;
                            stokListesiModel.satisFiat2 = p0.toDoubleWithFormattedString;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          enabled: isEnabled,
                          labelText: "Fiyat 3",
                          isFormattedString: true,
                          controller: satisFiyat3Controller,
                          onChanged: (p0) {
                            stokDetayModel.stokList?.firstOrNull?.satisFiat3 = p0.toDoubleWithFormattedString;
                            stokListesiModel.satisFiat3 = p0.toDoubleWithFormattedString;
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          enabled: isEnabled,
                          labelText: "Fiyat 4",
                          isFormattedString: true,
                          controller: satisFiyat4Controller,
                          onChanged: (p0) {
                            stokDetayModel.stokList?.firstOrNull?.satisFiat4 = p0.toDoubleWithFormattedString;
                            stokListesiModel.satisFiat4 = p0.toDoubleWithFormattedString;
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          enabled: isEnabled,
                          labelText: "Döviz Tipi",
                          controller: satisDovizTipiController,
                          readOnly: true,
                          onTap: () async {
                            final MapEntry? result = await getDovizList();
                            if (result != null) {
                              satisDovizTipiController.text = result.value;
                              stokDetayModel.stokList?.firstOrNull?.satDovTip = result.key;
                              stokListesiModel.satDovTip = result.key;
                            }
                          },
                          suffixMore: true,
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          enabled: isEnabled,
                          labelText: "Alış Fiyatı",
                          isFormattedString: true,
                          controller: satisDovizFiyatiController,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          onChanged: (p0) {
                            stokDetayModel.stokList?.firstOrNull?.dovSatisFiat = p0.toDoubleWithFormattedString;
                            stokListesiModel.dovSatisFiat = p0.toDoubleWithFormattedString;
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Future<void> getKdvOrani() async {
    final result = await networkManager.dioGet<BaseEmptyModel>(
      path: ApiUrls.getStokDigerBilgi,
      bodyModel: BaseEmptyModel(),
      queryParameters: {"BilgiTipi": "KDVGRUP"},
    );
    if (result.isSuccess) {
      viewModel.setKdvOraniList(
        jsonDecode(result.paramData?["STOK_KDVGRUP_JSON"]).cast<double>(),
      );
    } else {
      dialogManager.showAlertDialog("KDV listesine erişilemedi.${result.message ?? ""}");
    }
  }

  Future<MapEntry?> getDovizList() async {
    final MapEntry? result = await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Döviz Tipi",
      children: viewModel.dovizList.entries
          .map(
            (e) => BottomSheetModel(
              title: e.value,
              value: e.value,
              onTap: () {
                Get.back(result: e);
              },
            ),
          )
          .toList(),
    );
    return result;
  }
}
