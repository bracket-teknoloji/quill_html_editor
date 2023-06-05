import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../../../../../../../core/base/model/base_empty_model.dart';
import '../../../../../../../../core/base/state/base_state.dart';
import '../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import '../../../../../../../../core/components/textfield/custom_label_widget.dart';
import '../../../../../../../../core/components/textfield/custom_text_field.dart';
import '../../../../../../../../core/constants/enum/base_edit_enum.dart';
import '../../../../../../../../core/constants/extensions/number_extensions.dart';
import '../../../../../../../../core/constants/ui_helper/ui_helper.dart';
import '../../../../../../../../core/init/network/login/api_urls.dart';
import '../../../model/stok_detay_model.dart';
import '../view_model/base_stok_edit_fiyat_view_model.dart';

class BaseStokEditFiyatView extends StatefulWidget {
  final BaseEditEnum? model;
  const BaseStokEditFiyatView({super.key, this.model});

  @override
  State<BaseStokEditFiyatView> createState() => _BaseStokEditFiyatViewState();
}

class _BaseStokEditFiyatViewState extends BaseState<BaseStokEditFiyatView> {
  bool get isEnabled => widget.model != BaseEditEnum.goruntule;
  static StokDetayModel get stokDetayModel => StokDetayModel.instance;
  BaseStokEditFiyatViewModel viewModel = BaseStokEditFiyatViewModel();
  TextEditingController alisKdvOraniController = TextEditingController(text: stokDetayModel.stokList?.first.alisKdv.toStringIfNull ?? "");
  TextEditingController alisFiyat1Controller = TextEditingController(text: stokDetayModel.stokList?.first.alisFiat1.toStringIfNull ?? "");
  TextEditingController alisFiyat2Controller = TextEditingController(text: stokDetayModel.stokList?.first.alisFiat2.toStringIfNull ?? "");
  TextEditingController alisFiyat3Controller = TextEditingController(text: stokDetayModel.stokList?.first.alisFiat3.toStringIfNull ?? "");
  TextEditingController alisFiyat4Controller = TextEditingController(text: stokDetayModel.stokList?.first.alisFiat4.toStringIfNull ?? "");
  TextEditingController alisDovizTipiController = TextEditingController(text: stokDetayModel.stokList?.first.satisDovizAdi ?? "");
  TextEditingController alisDovizFiyatiController = TextEditingController(text: stokDetayModel.stokList?.first.dovAlisFiat.toStringIfNull ?? "");
  TextEditingController satisKdvOraniController = TextEditingController(text: stokDetayModel.stokList?.first.satisKdv.toStringIfNull ?? "");
  TextEditingController satisFiyat1Controller = TextEditingController(text: stokDetayModel.stokList?.first.satisFiat1.toStringIfNull ?? "");
  TextEditingController satisFiyat2Controller = TextEditingController(text: stokDetayModel.stokList?.first.satisFiat2.toStringIfNull ?? "");
  TextEditingController satisFiyat3Controller = TextEditingController(text: stokDetayModel.stokList?.first.satisFiat3.toStringIfNull ?? "");
  TextEditingController satisFiyat4Controller = TextEditingController(text: stokDetayModel.stokList?.first.satisFiat4.toStringIfNull ?? "");
  TextEditingController satisDovizTipiController = TextEditingController(text: stokDetayModel.stokList?.first.satisDovizAdi ?? "");
  TextEditingController satisDovizFiyatiController = TextEditingController(text: stokDetayModel.stokList?.first.dovSatisFiat.toStringIfNull ?? "");
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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomWidgetWithLabel(text: "Alış", children: [
            CustomTextField(
                enabled: isEnabled,
                labelText: "KDV Oranı",
                controller: alisKdvOraniController,
                suffix: IconButton(
                    onPressed: () async {
                      if (viewModel.kdvOraniList.isNullOrEmpty) {
                        await getKdvOrani();
                      }
                      // ignore: use_build_context_synchronously
                      double? result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                          title: "KDV Oranları",
                          children: viewModel.kdvOraniList?.map((element) => BottomSheetModel(title: element.toStringIfNull ?? "", onTap: () => Get.back(result: element))).toList());
                      if (result != null) {
                        alisKdvOraniController.text = result.toString();
                        stokDetayModel.stokList?.first.alisKdv = result;
                      }
                    },
                    icon: const Icon(Icons.more_horiz_outlined))),
            Row(
              children: [
                Expanded(
                    child:
                        CustomTextField(enabled: isEnabled, labelText: "Fiyat 1", controller: alisFiyat1Controller, onChanged: (p0) => stokDetayModel.stokList?.first.alisFiat1 = double.tryParse(p0))),
                Expanded(
                    child:
                        CustomTextField(enabled: isEnabled, labelText: "Fiyat 2", controller: alisFiyat2Controller, onChanged: (p0) => stokDetayModel.stokList?.first.alisFiat2 = double.tryParse(p0))),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child:
                        CustomTextField(enabled: isEnabled, labelText: "Fiyat 3", controller: alisFiyat3Controller, onChanged: (p0) => stokDetayModel.stokList?.first.alisFiat3 = double.tryParse(p0))),
                Expanded(
                    child:
                        CustomTextField(enabled: isEnabled, labelText: "Fiyat 4", controller: alisFiyat4Controller, onChanged: (p0) => stokDetayModel.stokList?.first.alisFiat4 = double.tryParse(p0))),
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
                          MapEntry? result = await getDovizList();
                          if (result != null) {
                            stokDetayModel.stokList?.first.alisDovTip = result.key;
                            alisDovizTipiController.text = result.value;
                          }
                        },
                        suffix: const Icon(Icons.more_horiz_outlined))),
                Expanded(
                    child: CustomTextField(
                        enabled: isEnabled, labelText: "Alış Fiyatı", controller: alisDovizFiyatiController, onChanged: (p0) => stokDetayModel.stokList?.first.dovAlisFiat = double.tryParse(p0))),
              ],
            ),
          ]),
          CustomWidgetWithLabel(
            text: "Satış",
            children: [
              CustomTextField(
                  enabled: isEnabled,
                  labelText: "KDV Oranı",
                  controller: satisKdvOraniController,
                  suffix: IconButton(
                      onPressed: () async {
                        if (viewModel.kdvOraniList.isNullOrEmpty) {
                          await getKdvOrani();
                        }
                        // ignore: use_build_context_synchronously
                        double? result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                            title: "KDV Oranları",
                            children: viewModel.kdvOraniList?.map((element) => BottomSheetModel(title: element.toStringIfNull ?? "", onTap: () => Get.back(result: element))).toList());
                        if (result != null) {
                          satisKdvOraniController.text = result.toString();
                          stokDetayModel.stokList?.first.satisKdv = result;
                        }
                      },
                      icon: const Icon(Icons.more_horiz_outlined))),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          keyboardType: TextInputType.number,
                          enabled: isEnabled,
                          labelText: "Fiyat 1",
                          controller: satisFiyat1Controller,
                          onChanged: (p0) => stokDetayModel.stokList?.first.satisFiat1 = double.tryParse(p0))),
                  Expanded(
                      child: CustomTextField(
                          keyboardType: TextInputType.number,
                          enabled: isEnabled,
                          labelText: "Fiyat 2",
                          controller: satisFiyat2Controller,
                          onChanged: (p0) => stokDetayModel.stokList?.first.satisFiat2 = double.tryParse(p0))),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: CustomTextField(
                          keyboardType: TextInputType.number,
                          enabled: isEnabled,
                          labelText: "Fiyat 3",
                          controller: satisFiyat3Controller,
                          onChanged: (p0) => stokDetayModel.stokList?.first.satisFiat3 = double.tryParse(p0))),
                  Expanded(
                      child: CustomTextField(
                          keyboardType: TextInputType.number,
                          enabled: isEnabled,
                          labelText: "Fiyat 4",
                          controller: satisFiyat4Controller,
                          onChanged: (p0) => stokDetayModel.stokList?.first.satisFiat4 = double.tryParse(p0))),
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
                            MapEntry? result = await getDovizList();
                            if (result != null) {
                              satisDovizTipiController.text = result.value;
                              stokDetayModel.stokList?.first.satDovTip = result.key;
                            }
                          },
                          suffix: const Icon(Icons.more_horiz_outlined))),
                  Expanded(
                      child: CustomTextField(
                          enabled: isEnabled, labelText: "Alış Fiyatı", controller: satisDovizFiyatiController, onChanged: (p0) => stokDetayModel.stokList?.first.dovSatisFiat = double.tryParse(p0))),
                ],
              ),
            ],
          )
        ],
      ).paddingAll(UIHelper.lowSize),
    );
  }

  Future<void> getKdvOrani() async {
    var result =
        await networkManager.dioGet<BaseEmptyModel>(path: ApiUrls.getStokDigerBilgi, bodyModel: BaseEmptyModel(), addCKey: true, addSirketBilgileri: true, queryParameters: {"BilgiTipi": "KDVGRUP"});
    if (result.success == true) {
      viewModel.setKdvOraniList(jsonDecode(result.paramData?["STOK_KDVGRUP_JSON"]).cast<double>());
    } else {
      dialogManager.showAlertDialog("KDV listesine erişilemedi.${result.message ?? ""}");
    }
  }

  Future<MapEntry?> getDovizList() async {
    MapEntry? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context,
        title: "Döviz Tipi",
        children: viewModel.dovizList.entries
            .map((e) => BottomSheetModel(
                  title: e.value,
                  onTap: () {
                    Get.back(result: e);
                  },
                ))
            .toList());
    return result;
  }
}
