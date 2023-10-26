import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../core/constants/enum/siparis_tipi_enum.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../model/param_model.dart";
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
  bool get isEkle => siparisModel.isEkle || siparisModel.isKopyala;
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
  Widget build(BuildContext context) => WillPopScope(
        // if (formKey.currentState!.validate()) {
        //   formKey.currentState!.save();
        //   return true;
        // } else {
        //   return false;
        // }
        onWillPop: () async => true,
        child: SingleChildScrollView(
          child: Form(
            key: StaticVariables.instance.siparisGenelFormKey,
            child: Padding(
              padding: UIHelper.lowPaddingOnlyTop,
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
                        icon: const Icon(Icons.format_list_numbered_rtl_outlined),
                      ),
                      onChanged: (value) {
                        model.belgeNo = value;
                      },
                    ),
                  ),
                  CustomTextField(
                    enabled: isEkle,
                    labelText: "Cari",
                    readOnly: true,
                    isMust: true,
                    suffixMore: true,
                    controller: cariController,
                    // valueWidget: Observer(builder: (_) => Text(viewModel.model.cariKodu ?? "")),

                    onTap: () async {
                      final result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                      if (result != null && result is CariListesiModel) {
                        model.cariAdi = result.cariAdi ?? "";
                        model.cariKodu = result.cariKodu ?? "";
                        cariController.text = result.cariAdi ?? "";
                        if (!yetkiController.siparisFarkliTeslimCariAktif) {
                          cariController.text = result.cariAdi ?? "";
                          model.teslimCariAdi = result.cariAdi;
                        }
                      }
                    },
                  ),
                  CustomTextField(
                    enabled: enable && yetkiController.siparisFarkliTeslimCariAktif,
                    labelText: "Teslim Cari",
                    readOnly: true,
                    suffixMore: true,
                    controller: teslimCariController,
                    suffix: IconButton(
                      onPressed: () async {
                        final result = await Get.toNamed("mainPage/cariRehberi", arguments: model.cariKodu ?? "");
                        if (result != null && result is CariListesiModel) {
                          model.teslimCari = result.cariKodu;
                          model.teslimCariAdi = result.cariAdi;
                          teslimCariController.text = result.cariAdi ?? "";
                        }
                      },
                      icon: const Icon(Icons.hub_outlined),
                    ),
                    onClear: () {
                      model.teslimCari = null;
                      model.teslimCariAdi = null;
                      teslimCariController.text = "";
                    },
                    onTap: !yetkiController.siparisFarkliTeslimCariAktif
                        ? null
                        : () async {
                            final result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                            if (result != null && result is CariListesiModel) {
                              model.teslimCari = result.cariKodu;
                              model.teslimCariAdi = result.cariAdi;
                              model.plasiyerAciklama = result.plasiyerAciklama;
                              model.plasiyerKodu = result.plasiyerKodu;
                              teslimCariController.text = result.cariAdi ?? "";
                              plasiyerController.text = result.plasiyerAciklama ?? "";
                            }
                          },
                  ),
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
                            final result = await bottomSheetDialogManager.showBelgeTipiBottomSheetDialog(context);
                            if (result != null) {
                              model.belgeTipi = result.belgeTipiId;
                              belgeTipiController.text = result.belgeTipi ?? "";
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          enabled: enable,
                          labelText: "Plasiyer",
                          isMust: true,
                          readOnly: true,
                          suffixMore: true,
                          controller: plasiyerController,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                          onClear: () {
                            viewModel.setPlasiyer(null);
                            model.plasiyerKodu = null;
                            model.plasiyerAciklama = null;
                          },
                          onTap: () async {
                            final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context);
                            if (result != null) {
                              viewModel.setPlasiyer(result);
                              model.plasiyerKodu = result.plasiyerKodu;
                              model.plasiyerAciklama = result.plasiyerAciklama;
                              plasiyerController.text = result.plasiyerAciklama ?? "";
                            }
                          },
                        ),
                      ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
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
                          isDateTime: true,
                          onTap: () async {
                            final result = await dialogManager.showDateTimePicker();
                            if (result != null) {
                              model.tarih = result;
                              tarihController.text = result.toDateString;
                            }
                          },
                          controller: tarihController,
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          enabled: enable,
                          labelText: "Teslim Tarihi",
                          isMust: true,
                          isDateTime: true,
                          readOnly: true,
                          onTap: () async {
                            final result = await dialogManager.showDateTimePicker();
                            if (result != null) {
                              model.teslimTarihi = result;
                              teslimTarihController.text = result.toDateString;
                            }
                          },
                          controller: teslimTarihController,
                        ),
                      ),
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
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.topluDepo.toStringIfNotNull ?? "")),
                          onClear: () => viewModel.setTopluDepoKodu(null),
                          onTap: () async {
                            final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context);
                            if (result is DepoList) {
                              viewModel.setTopluDepoKodu(result.depoKodu);
                              topluDepoController.text = result.depoTanimi ?? result.depoKodu.toStringIfNotNull ?? "";
                            }
                          },
                        ),
                      ).yetkiVarMi(yetkiController.lokalDepoUygulamasiAcikMi),
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
                            final BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context);
                            if (result is BaseProjeModel) {
                              viewModel.setProjeKodu(result);
                              projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
                            }
                          },
                        ),
                      ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
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
                            final result = await bottomSheetDialogManager.showOdemeKoduBottomSheetDialog(context);
                            if (result is ListCariOdemeKodu) {
                              viewModel.setOdemeKodu(result.odemeKodu);
                              odemeKoduController.text = result.aciklama ?? "";
                            }
                          },
                        ),
                      ).yetkiVarMi(yetkiController.siparisKosulAktifMi),
                      Expanded(
                        child: CustomTextField(
                          enabled: enable,
                          labelText: "Koşul",
                          readOnly: true,
                          suffixMore: true,
                          controller: kosulController,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.kosulKodu ?? "")),
                          onTap: () async {
                            final result = await bottomSheetDialogManager.showKosullarBottomSheetDialog(context);
                            if (result != null) {
                              viewModel.setKosulKodu(result.kosulKodu);
                              kosulController.text = result.genelKosulAdi ?? result.kosulKodu ?? "";
                            }
                          },
                        ),
                      ).yetkiVarMi(yetkiController.siparisKosulAktifMi),
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
                          onClear: () => model.ozelKod2 = null,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.ozelKod1 ?? "")),
                          onTap: () async {
                            final ListOzelKodTum? result = await bottomSheetDialogManager.showOzelKod1BottomSheetDialog(context);
                            if (result != null) {
                              viewModel.setOzelKod1(result.kod);
                              ozelKod1Controller.text = result.aciklama ?? result.kod ?? "";
                            }
                            // var result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Özel Kod 1");
                          },
                        ),
                      ).yetkiVarMi(yetkiController.satisOzelKod1AktifMi),
                      Expanded(
                        child: CustomTextField(
                          enabled: enable,
                          labelText: "Özel Kod 2",
                          readOnly: true,
                          suffixMore: true,
                          controller: ozelKod2Controller,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.ozelKod2 ?? "")),
                          onClear: () => viewModel.setOzelKod2(null),
                          onTap: () async {
                            final ListOzelKodTum? result = await bottomSheetDialogManager.showOzelKod2BottomSheetDialog(context);
                            if (result != null) {
                              viewModel.setOzelKod2(result.kod);
                              ozelKod2Controller.text = result.aciklama ?? result.kod ?? "";
                            }
                          },
                        ),
                      ).yetkiVarMi(yetkiController.satisOzelKod2AktifMi),
                    ],
                  ),
                  CustomWidgetWithLabel(
                    text: "KDV Dahil",
                    isVertical: true,
                    child: Observer(
                      builder: (_) => Switch.adaptive(value: viewModel.kdvDahil, onChanged: widget.model.baseEditEnum != BaseEditEnum.goruntule ? (value) => viewModel.changeKdvDahil(value) : null),
                    ),
                  ).paddingAll(UIHelper.lowSize),
                  CustomWidgetWithLabel(
                    text: "Ek Açıklamalar",
                    child: Column(
                      children: [
                        CustomTextField(
                          enabled: enable,
                          labelText: parametreModel.satisEkAciklamaTanimi1 ?? "Açıklama 1",
                          onChanged: (p0) => changeAciklama(1, p0),
                          controller: teslimEdilecekKisiController,
                        ).yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(1)),
                        CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi2 ?? "Açıklama 2", onChanged: (p0) => changeAciklama(2, p0), controller: b2bEmailController)
                            .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(2)),
                        CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi3 ?? "Açıklama 3", onChanged: (p0) => changeAciklama(3, p0), controller: masrafKoduController)
                            .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(3)),
                        CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi4 ?? "Açıklama 4", onChanged: (p0) => changeAciklama(4, p0), controller: masrafYeriController)
                            .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(4)),
                        CustomTextField(
                          enabled: enable,
                          labelText: parametreModel.satisEkAciklamaTanimi5 ?? "Açıklama 5",
                          onChanged: (p0) => changeAciklama(5, p0),
                          controller: siparisNotuController,
                        ).yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(5)),
                        CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi6 ?? "Açıklama 6", onChanged: (p0) => changeAciklama(6, p0), controller: sASNoController)
                            .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(6)),
                        CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi7 ?? "Açıklama 7", onChanged: (p0) => changeAciklama(7, p0), controller: b2bSepetIDController)
                            .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(7)),
                        CustomTextField(
                          enabled: enable,
                          labelText: parametreModel.satisEkAciklamaTanimi8 ?? "Açıklama 8",
                          onChanged: (p0) => changeAciklama(8, p0),
                          controller: tamTeslimatController,
                        ).yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(8)),
                        CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi9 ?? "Açıklama 9", onChanged: (p0) => changeAciklama(9, p0), controller: satisAcik9Controller)
                            .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(9)),
                        CustomTextField(
                          enabled: enable,
                          labelText: parametreModel.satisEkAciklamaTanimi10 ?? "Açıklama 10",
                          onChanged: (p0) => changeAciklama(10, p0),
                          controller: satisAcik10Controller,
                        ).yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(10)),
                        CustomTextField(
                          enabled: enable,
                          labelText: parametreModel.satisEkAciklamaTanimi11 ?? "Açıklama 11",
                          onChanged: (p0) => changeAciklama(11, p0),
                          controller: satisAcik11Controller,
                        ).yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(11)),
                        CustomTextField(
                          enabled: enable,
                          labelText: parametreModel.satisEkAciklamaTanimi12 ?? "Açıklama 12",
                          onChanged: (p0) => changeAciklama(12, p0),
                          controller: fiyatGrubuController,
                        ).yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(12)),
                        CustomTextField(
                          enabled: enable,
                          labelText: parametreModel.satisEkAciklamaTanimi13 ?? "Açıklama 13",
                          onChanged: (p0) => changeAciklama(13, p0),
                          controller: satisAcik13Controller,
                        ).yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(13)),
                        CustomTextField(
                          enabled: enable,
                          labelText: parametreModel.satisEkAciklamaTanimi14 ?? "Açıklama 14",
                          onChanged: (p0) => changeAciklama(14, p0),
                          controller: satisAcik14Controller,
                        ).yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(14)),
                        CustomTextField(
                          enabled: enable,
                          labelText: parametreModel.satisEkAciklamaTanimi15 ?? "Açıklama 15",
                          onChanged: (p0) => changeAciklama(15, p0),
                          controller: satisAcik15Controller,
                        ).yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(15)),
                        CustomTextField(
                          enabled: enable,
                          labelText: parametreModel.satisEkAciklamaTanimi16 ?? "Açıklama 16",
                          onChanged: (p0) => changeAciklama(16, p0),
                          controller: satisAcik16Controller,
                        ).yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(16)),
                      ],
                    ),
                  ).yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(null)),
                ],
              ).paddingAll(UIHelper.lowSize),
            ),
          ),
        ),
      );

  Future<void> init() async {
    controllerFiller();

    if (BaseSiparisEditModel.instance.belgeNo == null || widget.model.isKopyala) {
      await getBelgeNo();
    }
    controllerFiller();
  }

  Future<void> getBelgeNo() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      queryParameters: {"Seri": belgeNoController.text, "BelgeTipi": widget.model.siparisTipiEnum?.rawValue, "EIrsaliye": "H", "CariKodu": model.cariKodu ?? ""},
      showLoading: true,
    );
    if (result.success == true) {
      BaseSiparisEditModel.instance.belgeNo = result.data?.first.belgeNo;
      belgeNoController.text = BaseSiparisEditModel.instance.belgeNo ?? "";
    }
  }

  void controllerFiller() {
    model.tarih ??= DateTime.now();
    model.teslimTarihi ??= DateTime.now();
    belgeNoController.text = model.belgeNo ?? "";
    cariController.text = model.cariAdi ?? "";
    teslimCariController.text = model.teslimCariAdi ?? "";
    belgeTipiController.text = (model.tipi ?? 0) < 6 ? "Yurtiçi" : "Yurtdışı";
    plasiyerController.text = model.plasiyerAciklama ?? "";
    tarihController.text = model.tarih.toDateString;
    teslimTarihController.text = model.teslimTarihi.toDateString;
    topluDepoController.text = yetkiController.lokalDepoUygulamasiAcikMi ? model.topluDepo.toStringIfNotNull ?? "" : "";
    projeController.text = model.projeAciklama ?? "";
    odemeKoduController.text = model.odemeKodu ?? "";
    kosulController.text = model.kosulKodu ?? "";
    ozelKod2Controller.text = model.ozelKod2 ?? "";
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
    if (yetkiController.satisOzelKod1AktifMi && model.ozelKod1 == null) {
      ozelKod1Controller.text = "T";
      viewModel.setOzelKod1("T");
    } else {
      ozelKod1Controller.text = model.ozelKod1 ?? "";
    }
    if (model.topluDepo != null) {
      topluDepoController.text = parametreModel.depoList?.firstWhere((element) => element.depoKodu == model.topluDepo).depoTanimi ?? "";
    }
    if (model.ozelKod2 != null) {
      ozelKod2Controller.text = parametreModel.listOzelKodTum?.firstWhere((element) => element.kod == model.ozelKod2).aciklama ?? "";
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
        model.ekAcik1 = value;
      case 2:
        model.acik2 = value;
        model.ekAcik2 = value;
      case 3:
        model.acik3 = value;
        model.ekAcik3 = value;
      case 4:
        model.acik4 = value;
        model.ekAcik4 = value;
      case 5:
        model.acik5 = value;
        model.ekAcik5 = value;
      case 6:
        model.acik6 = value;
        model.ekAcik6 = value;
      case 7:
        model.acik7 = value;
        model.ekAcik7 = value;
      case 8:
        model.acik8 = value;
        model.ekAcik8 = value;
      case 9:
        model.acik9 = value;
        model.ekAcik9 = value;
      case 10:
        model.acik10 = value;
        model.ekAcik10 = value;
      case 11:
        model.acik11 = value;
        model.ekAcik11 = value;
      case 12:
        model.acik12 = value;
        model.ekAcik12 = value;
      case 13:
        model.acik13 = value;
        model.ekAcik13 = value;
      case 14:
        model.acik14 = value;
        model.ekAcik14 = value;
      case 15:
        model.acik15 = value;
        model.ekAcik15 = value;
      case 16:
        model.acik16 = value;
        model.ekAcik16 = value;
      default:
    }
  }
}
