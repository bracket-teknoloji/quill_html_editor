import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/constants/enum/siparis_tipi_enum.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../siparisler/model/siparis_edit_request_model.dart";
import "../../../model/base_siparis_edit_model.dart";
import "../view_model/base_siparisler_genel_view_model.dart";

class BaseSiparislerGenelView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseSiparislerGenelView({super.key, required this.model});

  @override
  State<BaseSiparislerGenelView> createState() => _BaseSiparislerGenelViewState();
}

class _BaseSiparislerGenelViewState extends BaseState<BaseSiparislerGenelView> {
  BaseSiparislerGenelViewModel viewModel = BaseSiparislerGenelViewModel();
  BaseEditModel<SiparisEditRequestModel> get siparisModel => widget.model;
  bool get enable => siparisModel.enable;
  bool get isDuzenle => siparisModel.isDuzenle;
  bool get isEkle => siparisModel.isEkle;
  bool get isGoruntule => siparisModel.isGoruntule;
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
    return WillPopScope(
      onWillPop: () async {
        // if (formKey.currentState!.validate()) {
        //   formKey.currentState!.save();
        //   return true;
        // } else {
        //   return false;
        // }
        return true;
      },
      child: SingleChildScrollView(
        child: Form(
          key: StaticVariables.instance.siparisGenelFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                  visible: model.isRemoteTempBelgeNull,
                  child: CustomTextField(
                    enabled: enable,
                    labelText: "Belge No",
                    isMust: true,
                    controller: belgeNoController,
                    maxLength: 15,
                    suffix: IconButton(
                        onPressed: () async {
                          await getBelgeNo();
                        },
                        icon: const Icon(Icons.format_list_numbered_rtl_outlined)),
                    onChanged: (value) {
                      model.belgeNo = value;
                    },
                  )),
              CustomTextField(
                  enabled: isEkle,
                  labelText: "Cari",
                  readOnly: true,
                  isMust: true,
                  suffixMore: true,
                  controller: cariController,
                  // valueWidget: Observer(builder: (_) => Text(viewModel.model.cariModel?.cariKodu ?? "")),
                  onTap: () async {
                    var result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                    if (result != null && result is CariListesiModel) {
                      model.cariModel = result;
                      cariController.text = result.cariAdi ?? "";
                    }
                  }),
              CustomTextField(
                  enabled: enable,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: CustomTextField(
                          enabled: enable,
                          labelText: "Belge Tipi",
                          readOnly: true,
                          isMust: true,
                          suffixMore: true,
                          controller: belgeTipiController,
                          onTap: () async {
                            var result = await bottomSheetDialogManager.showBelgeTipiBottomSheetDialog(context);
                            if (result != null) {
                              model.belgeTipi = result.belgeTipiId;
                              belgeTipiController.text = result.belgeTipi ?? "";
                            }
                          })),
                  Expanded(
                      child: CustomTextField(
                    enabled: enable,
                    labelText: "Plasiyer",
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    controller: plasiyerController,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                    onTap: () async {
                      var result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context);
                      if (result != null) {
                        viewModel.setPlasiyer(result);
                        model.cariModel?.plasiyerKodu = result.plasiyerKodu;
                        model.cariModel?.plasiyerAciklama = result.plasiyerAciklama;
                        plasiyerController.text = result.plasiyerAciklama ?? "";
                      }
                    },
                  )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: CustomTextField(
                          enabled: enable,
                          labelText: "Tarih",
                          isMust: true,
                          readOnly: true,
                          onTap: () async {
                            var result = await dialogManager.showDateTimePicker();
                            if (result != null) {
                              model.tarih = result;
                              tarihController.text = result.toDateString;
                            }
                          },
                          suffix: const Icon(Icons.date_range_outlined),
                          controller: tarihController)),
                  Expanded(
                      child: CustomTextField(
                          enabled: enable,
                          labelText: "Teslim Tarihi",
                          isMust: true,
                          readOnly: true,
                          onTap: () async {
                            var result = await dialogManager.showDateTimePicker();
                            if (result != null) {
                              model.teslimTarihi = result;
                              teslimTarihController.text = result.toDateString;
                            }
                          },
                          suffix: const Icon(Icons.date_range_outlined),
                          controller: teslimTarihController)),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: CustomTextField(
                    enabled: enable,
                    labelText: "Toplu Depo",
                    readOnly: true,
                    suffixMore: true,
                    controller: topluDepoController,
                    onTap: () async {
                      var result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context);
                      if (result != null) {
                        model.topluDepo = result.depoKodu;
                        topluDepoController.text = result.depoTanimi ?? result.depoKodu.toStringIfNull ?? "";
                      }
                    },
                  )),
                  Expanded(
                      child: CustomTextField(
                    enabled: enable,
                    labelText: "Proje",
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    controller: projeController,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                    onTap: () async {
                      BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context);
                      if (result != null) {
                        viewModel.setProjeKodu(result);
                        projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
                      }
                    },
                  )),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: CustomTextField(
                          enabled: enable,
                          labelText: "Ödeme Kodu",
                          readOnly: true,
                          suffixMore: true,
                          controller: odemeKoduController,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.odemeKodu ?? "")),
                          onTap: () async {
                            var result = await bottomSheetDialogManager.showOdemeKoduBottomSheetDialog(context);
                            if (result != null) {
                              viewModel.setOdemeKodu(result.odemeKodu);
                              odemeKoduController.text = result.aciklama ?? "";
                            }
                          })),
                  Expanded(
                      child: CustomTextField(
                          enabled: enable,
                          labelText: "Koşul",
                          readOnly: true,
                          suffixMore: true,
                          controller: kosulController,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.kosulKodu ?? "")),
                          onTap: () async {
                            var result = await bottomSheetDialogManager.showKosullarBottomSheetDialog(context);
                            if (result != null) {
                              viewModel.setKosulKodu(result.kosulKodu);
                              kosulController.text = result.genelKosulAdi ?? result.kosulKodu ?? "";
                            }
                          })),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: CustomTextField(
                    enabled: enable,
                    labelText: "Özel Kod 1",
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    controller: ozelKod1Controller,
                    onTap: () async {
                      ListOzelKodTum? result = await bottomSheetDialogManager.showOzelKod1BottomSheetDialog(context);
                      if (result != null) {
                        model.ozelKod1 = result.kod;
                        ozelKod1Controller.text = result.aciklama ?? result.kod ?? "";
                      }
                      // var result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Özel Kod 1");
                    },
                  )),
                  Expanded(
                      child: CustomTextField(
                    enabled: enable,
                    labelText: "Özel Kod 2",
                    readOnly: true,
                    suffixMore: true,
                    controller: ozelKod2Controller,
                    onTap: () async {
                      ListOzelKodTum? result = await bottomSheetDialogManager.showOzelKod2BottomSheetDialog(context);
                      if (result != null) {
                        model.ozelKod2 = result.kod;
                        ozelKod2Controller.text = result.aciklama ?? result.kod ?? "";
                      }
                    },
                  )),
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
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(1),
                          labelText: "Teslim Edilecek Kişi",
                          onChanged: (p0) => changeAciklama(1, p0),
                          controller: teslimEdilecekKisiController),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(2), labelText: "B2B Email", onChanged: (p0) => changeAciklama(2, p0), controller: b2bEmailController),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(3),
                          labelText: "Masraf Kodu",
                          onChanged: (p0) => changeAciklama(3, p0),
                          controller: masrafKoduController),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(4),
                          labelText: "Masraf Yeri",
                          onChanged: (p0) => changeAciklama(4, p0),
                          controller: masrafYeriController),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(5),
                          labelText: "Sipariş Notu",
                          onChanged: (p0) => changeAciklama(5, p0),
                          controller: siparisNotuController),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(6), labelText: "S.A.S. No", onChanged: (p0) => changeAciklama(6, p0), controller: sASNoController),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(7),
                          labelText: "B2B Sepet ID",
                          onChanged: (p0) => changeAciklama(7, p0),
                          controller: b2bSepetIDController),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(8),
                          labelText: "Tam Teslimat",
                          onChanged: (p0) => changeAciklama(8, p0),
                          controller: tamTeslimatController),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(9),
                          labelText: "Satış Açık. 9",
                          onChanged: (p0) => changeAciklama(9, p0),
                          controller: satisAcik9Controller),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(10),
                          labelText: "Satış Açık. 10",
                          onChanged: (p0) => changeAciklama(10, p0),
                          controller: satisAcik10Controller),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(11),
                          labelText: "Satış Açık. 11",
                          onChanged: (p0) => changeAciklama(11, p0),
                          controller: satisAcik11Controller),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(12),
                          labelText: "Fiyat Grubu",
                          onChanged: (p0) => changeAciklama(12, p0),
                          controller: fiyatGrubuController),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(13),
                          labelText: "Satış Açık. 13",
                          onChanged: (p0) => changeAciklama(13, p0),
                          controller: satisAcik13Controller),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(14),
                          labelText: "Satış Açık. 14",
                          onChanged: (p0) => changeAciklama(14, p0),
                          controller: satisAcik14Controller),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(15),
                          labelText: "Satış Açık. 15",
                          onChanged: (p0) => changeAciklama(15, p0),
                          controller: satisAcik15Controller),
                      CustomTextField(
                          enabled: enable && yetkiController.siparisMSSatirAciklamaAlanlari(16),
                          labelText: "Satış Açık. 16",
                          onChanged: (p0) => changeAciklama(16, p0),
                          controller: satisAcik16Controller),
                    ],
                  ))
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      ),
    );
  }

  Future<void> init() async {
    controllerFiller();
    if (BaseSiparisEditModel.instance.belgeNo == null) {
      await getBelgeNo();
    }
  }

  // Future<void> getData() async {
  //   var result = await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.getFaturaDetay, bodyModel: BaseSiparisEditModel(), data: widget.model.model?.toJson(), showLoading: true);
  //   if (result.success == true) {
  //     BaseSiparisEditModel.setInstance(result.data.first as BaseSiparisEditModel);
  //     controllerFiller();
  //   }
  // }

  Future<void> getBelgeNo() async {
    var result = await networkManager.dioGet<BaseSiparisEditModel>(
        path: ApiUrls.getSiradakiBelgeNo,
        bodyModel: BaseSiparisEditModel(),
        queryParameters: {"Seri": belgeNoController.text, "BelgeTipi": widget.model.siparisTipiEnum!.rawValue, "EIrsaliye": "H", "CariKodu": model.cariModel?.cariKodu},
        showLoading: true);
    if (result.success == true) {
      BaseSiparisEditModel.instance.belgeNo = result.data!.first.belgeNo;
      belgeNoController.text = BaseSiparisEditModel.instance.belgeNo ?? "";
    }

    controllerFiller();
  }

  void controllerFiller() {
    model.tarih ??= DateTime.now();
    model.teslimTarihi ??= DateTime.now();
    belgeNoController.text = model.belgeNo ?? "";
    cariController.text = model.cariModel?.cariAdi ?? "";
    teslimCariController.text = model.teslimCariAdi ?? "";
    belgeTipiController.text = (model.tipi ?? 0) < 6 ? "Yurtiçi" : "Yurtdışı";
    plasiyerController.text = model.cariModel?.plasiyerAciklama ?? "";
    tarihController.text = model.tarih.toDateString;
    teslimTarihController.text = model.teslimTarihi.toDateString;
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
    // controllerFiller();
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
