import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/components/helper_widgets/custom_label_widget.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_reuqest_model.dart';

import '../../../../../../../../core/base/model/base_edit_model.dart';
import '../../../../../../../../core/constants/enum/base_edit_enum.dart';
import '../../../../../../../../core/init/network/login/api_urls.dart';

class BaseSiparislerGenelView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseSiparislerGenelView({super.key, required this.model});

  @override
  State<BaseSiparislerGenelView> createState() => _BaseSiparislerGenelViewState();
}

class _BaseSiparislerGenelViewState extends BaseState<BaseSiparislerGenelView> {
  bool get isEnable => widget.model.baseEditEnum != BaseEditEnum.goruntule;
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  late TextEditingController belgeNoController;
  late TextEditingController cariController;
  late TextEditingController teslimCariController;
  late TextEditingController belgeTipiController;
  late TextEditingController plasiyerController;
  late TextEditingController tarihController;
  late TextEditingController teslimTarihController;
  late TextEditingController topluDepoController;
  late TextEditingController projeController;
  late TextEditingController odemeKoduController;
  late TextEditingController kosulController;
  late TextEditingController ozelKod1Controller;
  late TextEditingController ozelKod2Controller;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        init();
    });
    controllerInitializer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(
            enabled: isEnable,
            labelText: "Belge No",
            readOnly: true,
            maxLength: 15,
          ),
          CustomTextField(enabled: isEnable, labelText: "Cari", readOnly: true, suffixMore: true),
          CustomTextField(enabled: isEnable, labelText: "Teslim Cari", readOnly: true, suffixMore: true),
          Row(
            children: [
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Belge Tipi", readOnly: true, suffixMore: true)),
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Plasiyer", readOnly: true, suffixMore: true)),
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Tarih", readOnly: true, onTap: () => dialogManager.showDateTimePicker(), suffix: const Icon(Icons.date_range_outlined))),
              Expanded(
                  child:
                      CustomTextField(enabled: isEnable, labelText: "Teslim Tarihi", readOnly: true, onTap: () => dialogManager.showDateTimePicker(), suffix: const Icon(Icons.date_range_outlined))),
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Toplu Depo", readOnly: true, suffixMore: true)),
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Proje", readOnly: true, suffixMore: true)),
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Ödeme Kodu", readOnly: true, suffixMore: true)),
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Koşul", readOnly: true, suffixMore: true)),
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Özel Kod 1", readOnly: true, suffixMore: true)),
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Özel Kod 2", readOnly: true, suffixMore: true)),
            ],
          ),
          CustomWidgetWithLabel(text: "KDV Dahil", isVertical: true, child: Switch.adaptive(value: true, onChanged: (value) => true)),
          CustomWidgetWithLabel(
              text: "Ek Açıklamalar",
              child: Column(
                children: [
                  CustomTextField(enabled: isEnable, labelText: "Teslim Edilecek Kişi"),
                  CustomTextField(enabled: isEnable, labelText: "B2B Email"),
                  CustomTextField(enabled: isEnable, labelText: "Masraf Kodu"),
                  CustomTextField(enabled: isEnable, labelText: "Masraf Yeri"),
                  CustomTextField(enabled: isEnable, labelText: "Sipariş Notu"),
                  CustomTextField(enabled: isEnable, labelText: "S.A.S. No"),
                  CustomTextField(enabled: isEnable, labelText: "B2B Sepet ID"),
                  CustomTextField(enabled: isEnable, labelText: "Tam Teslimat"),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 9"),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 10"),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 11"),
                  CustomTextField(enabled: isEnable, labelText: "Fiyat Grubu"),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 13"),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 14"),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 15"),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 16"),
                ],
              ))
        ],
      ).paddingAll(UIHelper.lowSize),
    );
  }
  Future<void> init() async {
      if (widget.model.baseEditEnum != BaseEditEnum.ekle) {
    await getData();
      }
    controllerInitializer();
  }

  Future<void> getData() async {
    var result = await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.getFaturaDetay, bodyModel: BaseSiparisEditModel(), data: widget.model.model?.toJson());
    if (result.success == true) {
      BaseSiparisEditModel.setInstance(result.data!);
    }
  }

  void controllerInitializer() {
    belgeNoController = TextEditingController();
    cariController = TextEditingController();
    teslimCariController = TextEditingController();
    belgeTipiController = TextEditingController();
    plasiyerController = TextEditingController();
    tarihController = TextEditingController();
    teslimTarihController = TextEditingController();
    topluDepoController = TextEditingController();
    projeController = TextEditingController();
    odemeKoduController = TextEditingController();
    kosulController = TextEditingController();
    ozelKod1Controller = TextEditingController();
    ozelKod2Controller = TextEditingController();
  }
}
