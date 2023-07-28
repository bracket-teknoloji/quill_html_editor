import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/model/base_proje_model.dart';
import 'package:picker/core/base/state/base_state.dart';
import 'package:picker/core/components/helper_widgets/custom_label_widget.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/constants/extensions/date_time_extensions.dart';
import 'package:picker/core/constants/extensions/number_extensions.dart';
import 'package:picker/core/constants/ui_helper/ui_helper.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';
import 'package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/alt_sayfalar/base_siparisler_genel/view_model/base_siparisler_genel_view_model.dart';
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
  BaseSiparislerGenelViewModel viewModel = BaseSiparislerGenelViewModel();
  bool get isEnable => widget.model.baseEditEnum != BaseEditEnum.goruntule;
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  late final TextEditingController belgeNoController;
  late final TextEditingController cariController;
  late final TextEditingController teslimCariController;
  late final TextEditingController belgeTipiController;
  late final TextEditingController plasiyerController;
  late final TextEditingController tarihController;
  late final TextEditingController teslimTarihController;
  late final TextEditingController topluDepoController;
  late final TextEditingController projeController;
  late final TextEditingController odemeKoduController;
  late final TextEditingController kosulController;
  late final TextEditingController ozelKod1Controller;
  late final TextEditingController ozelKod2Controller;
  late final TextEditingController teslimEdilecekKisiController;
  late final TextEditingController b2bEmailController;
  late final TextEditingController masrafKoduController;
  late final TextEditingController masrafYeriController;
  late final TextEditingController siparisNotuController;
  late final TextEditingController sASNoController;
  late final TextEditingController b2bSepetIDController;
  late final TextEditingController tamTeslimatController;
  late final TextEditingController satisAcik9Controller;
  late final TextEditingController satisAcik10Controller;
  late final TextEditingController satisAcik11Controller;
  late final TextEditingController fiyatGrubuController;
  late final TextEditingController satisAcik13Controller;
  late final TextEditingController satisAcik14Controller;
  late final TextEditingController satisAcik15Controller;
  late final TextEditingController satisAcik16Controller;

  @override
  void initState() {
    controllerInitializer();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      init();
    });
    super.initState();
  }

  @override
  void dispose() {
    controllerDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomTextField(enabled: isEnable, labelText: "Belge No", readOnly: true, isMust: true, controller: belgeNoController, maxLength: 15),
          CustomTextField(
              enabled: isEnable,
              labelText: "Cari",
              readOnly: true,
              isMust: true,
              suffixMore: true,
              controller: cariController,
              onTap: () async {
                var result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                if (result != null && result is CariListesiModel) {
                  model.cariAdi = result.cariAdi ?? "";
                  model.cariKodu = result.cariKodu ?? "";
                  cariController.text = result.cariAdi ?? "";
                }
              }),
          CustomTextField(
              enabled: isEnable,
              labelText: "Teslim Cari",
              readOnly: true,
              suffixMore: true,
              controller: teslimCariController,
              onTap: () async {
                var result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                if (result != null && result is CariListesiModel) {
                  model.cariKodu = result.cariKodu ?? "";
                  teslimCariController.text = result.cariAdi ?? "";
                }
              }),
          Row(
            children: [
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Belge Tipi", readOnly: true, isMust: true, suffixMore: true, controller: belgeTipiController)),
              Expanded(
                  child: CustomTextField(
                enabled: isEnable,
                labelText: "Plasiyer",
                isMust: true,
                readOnly: true,
                suffixMore: true,
                controller: plasiyerController,
                onTap: () async {
                  var result = await bottomSheetDialogManager.showPlasiyerDialog(context);
                  if (result != null) {
                    model.cariModel?.plasiyerKodu = result.plasiyerKodu;
                    model.cariModel?.plasiyerAciklama = result.plasiyerAciklama;
                    plasiyerController.text = result.plasiyerAciklama ?? "";
                  }
                },
              )),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: CustomTextField(
                      enabled: isEnable,
                      labelText: "Tarih",
                      isMust: true,
                      readOnly: true,
                      onTap: () => dialogManager.showDateTimePicker(),
                      suffix: const Icon(Icons.date_range_outlined),
                      controller: tarihController)),
              Expanded(
                  child: CustomTextField(
                      enabled: isEnable,
                      labelText: "Teslim Tarihi",
                      isMust: true,
                      readOnly: true,
                      onTap: () => dialogManager.showDateTimePicker(),
                      suffix: const Icon(Icons.date_range_outlined),
                      controller: teslimTarihController)),
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Toplu Depo", readOnly: true, suffixMore: true, controller: topluDepoController)),
              Expanded(
                  child: CustomTextField(
                enabled: isEnable,
                labelText: "Proje",
                isMust: true,
                readOnly: true,
                suffixMore: true,
                controller: projeController,
                onTap: () async {
                  BaseProjeModel? result = await bottomSheetDialogManager.showProjeDialog(context);
                  if (result != null) {
                    model.projeKodu = result.projeKodu;
                    projeController.text = result.projeAciklama ?? "";
                  }
                },
              )),
            ],
          ),
          Row(
            children: [
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Ödeme Kodu", readOnly: true, suffixMore: true, controller: odemeKoduController)),
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Koşul", readOnly: true, suffixMore: true, controller: kosulController)),
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: CustomTextField(
                enabled: isEnable,
                labelText: "Özel Kod 1",
                isMust: true,
                readOnly: true,
                suffixMore: true,
                controller: ozelKod1Controller,
                onTap: () async {
                  var result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Özel Kod 1");
                },
              )),
              Expanded(child: CustomTextField(enabled: isEnable, labelText: "Özel Kod 2", readOnly: true, suffixMore: true, controller: ozelKod2Controller)),
            ],
          ),
          CustomWidgetWithLabel(
            
              text: "KDV Dahil",
              isVertical: true,
              child: Observer(
                  builder: (_) => Switch.adaptive(value: viewModel.kdvDahil, onChanged: widget.model.baseEditEnum != BaseEditEnum.goruntule ? (value) => viewModel.changeKdvDahil(value) : null))),
          CustomWidgetWithLabel(
              text: "Ek Açıklamalar",
              child: Column(
                children: [
                  CustomTextField(enabled: isEnable, labelText: "Teslim Edilecek Kişi", onChanged: (p0) => changeAciklama(1, p0), controller: teslimEdilecekKisiController),
                  CustomTextField(enabled: isEnable, labelText: "B2B Email", onChanged: (p0) => changeAciklama(2, p0), controller: b2bEmailController),
                  CustomTextField(enabled: isEnable, labelText: "Masraf Kodu", onChanged: (p0) => changeAciklama(3, p0), controller: masrafKoduController),
                  CustomTextField(enabled: isEnable, labelText: "Masraf Yeri", onChanged: (p0) => changeAciklama(4, p0), controller: masrafYeriController),
                  CustomTextField(enabled: isEnable, labelText: "Sipariş Notu", onChanged: (p0) => changeAciklama(5, p0), controller: siparisNotuController),
                  CustomTextField(enabled: isEnable, labelText: "S.A.S. No", onChanged: (p0) => changeAciklama(6, p0), controller: sASNoController),
                  CustomTextField(enabled: isEnable, labelText: "B2B Sepet ID", onChanged: (p0) => changeAciklama(7, p0), controller: b2bSepetIDController),
                  CustomTextField(enabled: isEnable, labelText: "Tam Teslimat", onChanged: (p0) => changeAciklama(8, p0), controller: tamTeslimatController),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 9", onChanged: (p0) => changeAciklama(9, p0), controller: satisAcik9Controller),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 10", onChanged: (p0) => changeAciklama(10, p0), controller: satisAcik10Controller),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 11", onChanged: (p0) => changeAciklama(11, p0), controller: satisAcik11Controller),
                  CustomTextField(enabled: isEnable, labelText: "Fiyat Grubu", onChanged: (p0) => changeAciklama(12, p0), controller: fiyatGrubuController),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 13", onChanged: (p0) => changeAciklama(13, p0), controller: satisAcik13Controller),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 14", onChanged: (p0) => changeAciklama(14, p0), controller: satisAcik14Controller),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 15", onChanged: (p0) => changeAciklama(15, p0), controller: satisAcik15Controller),
                  CustomTextField(enabled: isEnable, labelText: "Satış Açık. 16", onChanged: (p0) => changeAciklama(16, p0), controller: satisAcik16Controller),
                ],
              ))
        ],
      ).paddingAll(UIHelper.lowSize),
    );
  }

  Future<void> init() async {
    if (widget.model.baseEditEnum != BaseEditEnum.ekle) {
      if (BaseSiparisEditModel.instance.isEmpty) {
        await getData();
      }
    } else {
      BaseSiparisEditModel.resetInstance();
    }
  }

  Future<void> getData() async {
    var result = await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.getFaturaDetay, bodyModel: BaseSiparisEditModel(), data: widget.model.model?.toJson(), showLoading: true);
    if (result.success == true) {
      BaseSiparisEditModel.setInstance(result.data.first as BaseSiparisEditModel);
      controllerFiller();
    }
  }

  void controllerFiller() {
    belgeNoController.text = model.belgeNo ?? "";
    cariController.text = model.cariAdi ?? "";
    teslimCariController.text = model.teslimCariAdi ?? "";
    belgeTipiController.text = model.belgeTuru ?? "";
    plasiyerController.text = model.cariModel?.plasiyerAciklama ?? "";
    tarihController.text = model.tarih != null ? model.tarih.toDateString() : "";
    teslimTarihController.text = model.teslimTarihi != null ? model.teslimTarihi.toDateString() : "";
    topluDepoController.text = model.topluDepo.toStringIfNull ?? "";
    projeController.text = model.projeAciklama ?? "";
    odemeKoduController.text = model.odemeKodu ?? "";
    kosulController.text = model.kosulKodu ?? "";
    ozelKod1Controller.text = model.ozelKod1 ?? "";
    ozelKod2Controller.text = model.ozelKod2 ?? "";
    // teslimEdilecekKisiController.text = model.slkdfjs ?? "";
    teslimEdilecekKisiController.text = model.acik1 ?? "";
    b2bEmailController.text = model.acik2 ?? "";
    masrafKoduController.text = model.acik3 ?? "";
    masrafYeriController.text = model.acik4 ?? "";
    siparisNotuController.text = model.acik5 ?? "";
    sASNoController.text = model.acik6 ?? "";
    b2bSepetIDController.text = model.acik7 ?? "";
    tamTeslimatController.text = model.acik8 ?? "";
    satisAcik9Controller.text = model.acik9 ?? "";
    satisAcik10Controller.text = model.acik10 ?? "";
    satisAcik11Controller.text = model.acik11 ?? "";
    fiyatGrubuController.text = model.acik12 ?? "";
    satisAcik13Controller.text = model.acik13 ?? "";
    satisAcik14Controller.text = model.acik14 ?? "";
    satisAcik15Controller.text = model.acik15 ?? "";
    satisAcik16Controller.text = model.acik16 ?? "";
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
    teslimEdilecekKisiController = TextEditingController();
    b2bEmailController = TextEditingController();
    masrafKoduController = TextEditingController();
    masrafYeriController = TextEditingController();
    siparisNotuController = TextEditingController();
    sASNoController = TextEditingController();
    b2bSepetIDController = TextEditingController();
    tamTeslimatController = TextEditingController();
    satisAcik9Controller = TextEditingController();
    satisAcik10Controller = TextEditingController();
    satisAcik11Controller = TextEditingController();
    fiyatGrubuController = TextEditingController();
    satisAcik13Controller = TextEditingController();
    satisAcik14Controller = TextEditingController();
    satisAcik15Controller = TextEditingController();
    satisAcik16Controller = TextEditingController();
    controllerFiller();
  }

  void controllerDisposer() {
    belgeNoController.dispose();
    cariController.dispose();
    teslimCariController.dispose();
    belgeTipiController.dispose();
    plasiyerController.dispose();
    tarihController.dispose();
    teslimTarihController.dispose();
    topluDepoController.dispose();
    projeController.dispose();
    odemeKoduController.dispose();
    kosulController.dispose();
    ozelKod1Controller.dispose();
    ozelKod2Controller.dispose();
    teslimEdilecekKisiController.dispose();
    b2bEmailController.dispose();
    masrafKoduController.dispose();
    masrafYeriController.dispose();
    siparisNotuController.dispose();
    sASNoController.dispose();
    b2bSepetIDController.dispose();
    tamTeslimatController.dispose();
    satisAcik9Controller.dispose();
    satisAcik10Controller.dispose();
    satisAcik11Controller.dispose();
    fiyatGrubuController.dispose();
    satisAcik13Controller.dispose();
    satisAcik14Controller.dispose();
    satisAcik15Controller.dispose();
    satisAcik16Controller.dispose();
  }

  void changeAciklama(int sira, String value) {
    switch (sira) {
      case 1:
        model.acik1 = value;
        break;
      case 2:
        model.acik2 = value;
        break;
      case 3:
        model.acik3 = value;
        break;
      case 4:
        model.acik4 = value;
        break;
      case 5:
        model.acik5 = value;
        break;
      case 6:
        model.acik6 = value;
        break;
      case 7:
        model.acik7 = value;
        break;
      case 8:
        model.acik8 = value;
        break;
      case 9:
        model.acik9 = value;
        break;
      case 10:
        model.acik10 = value;
        break;
      case 11:
        model.acik11 = value;
        break;
      case 12:
        model.acik12 = value;
        break;
      case 13:
        model.acik13 = value;
        break;
      case 14:
        model.acik14 = value;
        break;
      case 15:
        model.acik15 = value;
        break;
      case 16:
        model.acik16 = value;
        break;
      default:
    }
  }
}
