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
import "../view_model/base_stok_edit_fiyat_view_model.dart";

final class BaseStokEditFiyatView extends StatefulWidget {
  const BaseStokEditFiyatView({super.key, this.model});
  final BaseEditEnum? model;

  @override
  State<BaseStokEditFiyatView> createState() => _BaseStokEditFiyatViewState();
}

final class _BaseStokEditFiyatViewState extends BaseState<BaseStokEditFiyatView> {
  bool get isEnabled => widget.model != BaseEditEnum.goruntule;
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
      text: stokListesiModel.alisKdv.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    alisFiyat1Controller = TextEditingController(
      text: stokListesiModel.alisFiat1.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    alisFiyat2Controller = TextEditingController(
      text: stokListesiModel.alisFiat2.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    alisFiyat3Controller = TextEditingController(
      text: stokListesiModel.alisFiat3.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    alisFiyat4Controller = TextEditingController(
      text: stokListesiModel.alisFiat4.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    alisDovizTipiController = TextEditingController(text: stokListesiModel.alisDovizAdi ?? "");
    alisDovizFiyatiController = TextEditingController(
      text: stokListesiModel.dovAlisFiat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisKdvOraniController = TextEditingController(
      text: stokListesiModel.satisKdv.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisFiyat1Controller = TextEditingController(
      text: stokListesiModel.satisFiat1.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisFiyat2Controller = TextEditingController(
      text: stokListesiModel.satisFiat2.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisFiyat3Controller = TextEditingController(
      text: stokListesiModel.satisFiat3.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisFiyat4Controller = TextEditingController(
      text: stokListesiModel.satisFiat4.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
    );
    satisDovizTipiController = TextEditingController(text: stokListesiModel.satisDovizAdi ?? "");
    satisDovizFiyatiController = TextEditingController(
      text: stokListesiModel.dovSatisFiat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati),
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
        if (yetkiController.stokAlisFiyatGoster)
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
                              title: element.commaSeparatedWithDecimalDigits(OndalikEnum.oran),
                              value: element,
                            ),
                          )
                          .toList(),
                    );
                    if (result != null) {
                      alisKdvOraniController.text = result.commaSeparatedWithDecimalDigits(OndalikEnum.oran);
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
                          p0.toDoubleWithFormattedString;
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
                          p0.toDoubleWithFormattedString;
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
                          p0.toDoubleWithFormattedString;
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
                          p0.toDoubleWithFormattedString;
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
                        isMust: true,
                        controller: alisDovizTipiController,
                        readOnly: true,
                        onTap: () async {
                          final MapEntry? result = await getDovizList();
                          if (result != null) {
                            stokListesiModel.alisDovTip = result.key;
                            stokListesiModel.alisDovizAdi = result.value;
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
                          p0.toDoubleWithFormattedString;
                          stokListesiModel.dovAlisFiat = p0.toDoubleWithFormattedString;
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        if (yetkiController.stokSatisFiyatGoster)
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
                              title: element.commaSeparatedWithDecimalDigits(OndalikEnum.oran),
                              value: element,
                            ),
                          )
                          .toList(),
                    );
                    if (result != null) {
                      satisKdvOraniController.text = result.toString();

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
                          p0.toDoubleWithFormattedString;
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
                          p0.toDoubleWithFormattedString;
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
                          p0.toDoubleWithFormattedString;
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
                          p0.toDoubleWithFormattedString;
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
                        isMust: true,
                        controller: satisDovizTipiController,
                        readOnly: true,
                        onTap: () async {
                          final MapEntry? result = await getDovizList();
                          if (result != null) {
                            satisDovizTipiController.text = result.value;
                            stokListesiModel.satisDovizAdi = result.value;
                            stokListesiModel.satDovTip = result.key;
                          }
                        },
                        suffixMore: true,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        enabled: isEnabled,
                        labelText: "Satış Fiyatı",
                        isFormattedString: true,
                        controller: satisDovizFiyatiController,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (p0) {
                          p0.toDoubleWithFormattedString;
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
      viewModel.setKdvOraniList(jsonDecode(result.paramData?["STOK_KDVGRUP_JSON"] ?? "0").cast<double>());
    } else {
      dialogManager.showAlertDialog("KDV listesine erişilemedi.${result.message ?? ""}");
    }
  }

  Future<MapEntry<int, String>?> getDovizList() async => await bottomSheetDialogManager.showBottomSheetDialog(
    context,
    title: "Döviz Tipi",
    children: viewModel.dovizList.entries.map((e) => BottomSheetModel(title: e.value, value: e)).toList(),
  );
}
