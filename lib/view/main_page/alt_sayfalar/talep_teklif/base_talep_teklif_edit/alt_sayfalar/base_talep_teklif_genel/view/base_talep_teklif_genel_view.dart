import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/belge_tipi_model.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/static_variables/static_variables.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
// import "../../../../../../../model/param_model.dart";
// import "../../../../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
// import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
// import "../../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../view_model/base_talep_teklif_genel_view_model.dart";

class BaseTalepTeklifGenelView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseTalepTeklifGenelView({super.key, required this.model});

  @override
  State<BaseTalepTeklifGenelView> createState() => BaseTalepTeklifGenelViewState();
}

class BaseTalepTeklifGenelViewState extends BaseState<BaseTalepTeklifGenelView> {
  BaseEditModel<SiparisEditRequestModel> get siparisModel => widget.model;
  BaseTalepTeklifGenelViewModel viewModel = BaseTalepTeklifGenelViewModel();
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  bool get isEkle => siparisModel.isEkle || siparisModel.isKopyala || siparisModel.isRevize;
  bool get enable => widget.model.enable;
  TalTekParam? get taltekParam => parametreModel.talTekParam?.firstWhereOrNull((element) => element.belgeTipi == model.belgeTuru);

  late final TextEditingController _belgeNoController;
  late final TextEditingController _resmiBelgeNoController;
  late final TextEditingController _cariController;
  late final TextEditingController _teslimCariController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _belgeTipiController;
  late final TextEditingController _tarihController;
  late final TextEditingController _topluDepoController;
  late final TextEditingController _ozelKod2Controller;
  late final TextEditingController _aciklama1Controller;
  late final TextEditingController _aciklama2Controller;
  late final TextEditingController _aciklama3Controller;
  late final TextEditingController _aciklama4Controller;
  late final TextEditingController _aciklama5Controller;
  late final TextEditingController _aciklama6Controller;
  late final TextEditingController _aciklama7Controller;
  late final TextEditingController _aciklama8Controller;
  late final TextEditingController _aciklama9Controller;
  late final TextEditingController _aciklama10Controller;
  late final TextEditingController _aciklama11Controller;
  late final TextEditingController _aciklama12Controller;
  late final TextEditingController _aciklama13Controller;
  late final TextEditingController _aciklama14Controller;
  late final TextEditingController _aciklama15Controller;
  late final TextEditingController _aciklama16Controller;

  @override
  void initState() {
    _belgeNoController = TextEditingController(text: model.belgeNo);
    _resmiBelgeNoController = TextEditingController(text: model.resmiBelgeNo);
    _cariController = TextEditingController(text: model.cariAdi);
    _teslimCariController = TextEditingController(text: model.teslimCariAdi);
    _plasiyerController = TextEditingController(text: model.plasiyerAciklama);
    _belgeTipiController = TextEditingController(text: viewModel.belgeTipi.keys.firstWhereOrNull((String element) => viewModel.belgeTipi[element] == model.tipi));
    _belgeTipiController.text = (model.tipi ?? 0) < 6 ? "Yurtiçi" : "Yurtdışı";
    _tarihController = TextEditingController(text: model.tarih.toDateString);
    _topluDepoController = TextEditingController(text: model.topluDepo.toStringIfNotNull);
    _ozelKod2Controller = TextEditingController(text: model.ozelKod2);
    _aciklama1Controller = TextEditingController(text: model.acik1);
    _aciklama2Controller = TextEditingController(text: model.acik2);
    _aciklama3Controller = TextEditingController(text: model.acik3);
    _aciklama4Controller = TextEditingController(text: model.acik4);
    _aciklama5Controller = TextEditingController(text: model.acik5);
    _aciklama6Controller = TextEditingController(text: model.acik6);
    _aciklama7Controller = TextEditingController(text: model.acik7);
    _aciklama8Controller = TextEditingController(text: model.acik8);
    _aciklama9Controller = TextEditingController(text: model.acik9);
    _aciklama10Controller = TextEditingController(text: model.acik11);
    _aciklama11Controller = TextEditingController(text: model.acik12);
    _aciklama12Controller = TextEditingController(text: model.acik13);
    _aciklama13Controller = TextEditingController(text: model.acik13);
    _aciklama14Controller = TextEditingController(text: model.acik14);
    _aciklama15Controller = TextEditingController(text: model.acik15);
    _aciklama16Controller = TextEditingController(text: model.acik16);
    viewModel.changeKdvDahil(model.kdvDahil == "E" ? true : false);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (BaseSiparisEditModel.instance.belgeNo == null || widget.model.isKopyala) {
        await getBelgeNo(null);
        // BaseSiparisEditModel.instance.belgeNo= await networkManager.getSiradakiBelgeNo(SiradakiBelgeNoModel(belgeNo: model.belgeNo, belgeTuru: model.belgeTuru, sirketKodu: model.sirketKodu));
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _belgeNoController.dispose();
    _resmiBelgeNoController.dispose();
    _cariController.dispose();
    _teslimCariController.dispose();
    _plasiyerController.dispose();
    _belgeTipiController.dispose();
    _tarihController.dispose();
    _topluDepoController.dispose();
    _ozelKod2Controller.dispose();
    _aciklama1Controller.dispose();
    _aciklama2Controller.dispose();
    _aciklama3Controller.dispose();
    _aciklama4Controller.dispose();
    _aciklama5Controller.dispose();
    _aciklama6Controller.dispose();
    _aciklama7Controller.dispose();
    _aciklama8Controller.dispose();
    _aciklama9Controller.dispose();
    _aciklama10Controller.dispose();
    _aciklama11Controller.dispose();
    _aciklama12Controller.dispose();
    _aciklama13Controller.dispose();
    _aciklama14Controller.dispose();
    _aciklama15Controller.dispose();
    _aciklama16Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
        padding: UIHelper.lowPadding,
        child: SingleChildScrollView(
          child: Form(
            key: StaticVariables.instance.talepTeklifGenelFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Card(
                //   child: ListTile(
                //     onTap: () async => Get.toNamed(
                //       "/mainPage/eBelgePdf",
                //       arguments: EBelgeListesiModel(belgeTuru: widget.model.editTipiEnum?.rawValue, ebelgeTuru: "EFT", resmiBelgeNo: BaseSiparisEditModel.instance.resmiBelgeNo ?? ""),
                //     ),
                //     contentPadding: UIHelper.lowPaddingHorizontal,
                //     leading: const Icon(Icons.info_outline),
                //     title: Text(eBelgeButtonText),
                //     trailing: const Icon(Icons.open_in_new_outlined),
                //   ),
                // ).paddingOnly(bottom: UIHelper.lowSize).yetkiVarMi(model.cariEfaturami == "E"),
                CustomTextField(
                  labelText: "Belge No",
                  isMust: true,
                  controller: _belgeNoController,
                  enabled: enable,
                  maxLength: 15,
                  suffix: IconButton(
                    onPressed: () async {
                      await getBelgeNo(_belgeNoController.text);
                    },
                    icon: const Icon(Icons.format_list_numbered_rtl_outlined),
                  ),
                  onTap: () {},
                ),
                // CustomTextField(labelText: "Resmi Belge No", isMust: true, controller: _resmiBelgeNoController, enabled: enable, maxLength: 16, onTap: () {}),
                CustomTextField(
                  labelText: "Cari",
                  readOnly: true,
                  isMust: true,
                  suffixMore: true,
                  controller: _cariController,
                  enabled: isEkle,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.cariKodu ?? "")),
                  onTap: () async {
                    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                     if (result is CariListesiModel) {
                      _cariController.text = result.cariAdi ?? "";
                      viewModel.model.vadeGunu = result.vadeGunu;
                    }
                  },
                ),
                // CustomTextField(
                //   labelText: "Teslim Cari",
                //   readOnly: true,
                //   isMust: true,
                //   suffixMore: true,
                //   controller: _teslimCariController,
                //   enabled: enable && yetkiController.sevkiyatIrsDegistirilmeyecekAlanlar("teslim_cari"),
                //   valueWidget: Observer(builder: (_) => Text(viewModel.model.teslimCari ?? "")),
                //   onTap: () async {
                //     final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                //     if (result != null) {
                //       _teslimCariController.text = result.cariAdi ?? "";
                //     }
                //   },
                // ).yetkiVarMi(yetkiController.sevkiyatSatisFatGizlenecekAlanlar("teslim_cari") && widget.model.editTipiEnum?.irsaliyeMi != true),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: CustomTextField(
                        labelText: "Proje",
                        readOnly: true,
                        isMust: true,
                        suffixMore: true,
                        controller: _plasiyerController,
                        enabled: enable && yetkiController.sevkiyatIrsDegistirilmeyecekAlanlar("proje"),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                        onTap: () async {
                          final BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
                          if (result is BaseProjeModel) {
                            _plasiyerController.text = result.projeAciklama ?? "";
                            viewModel.setProje(result);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi && yetkiController.sevkiyatSatisFatGizlenecekAlanlar("proje")),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Plasiyer",
                        readOnly: true,
                        isMust: true,
                        suffixMore: true,
                        controller: _plasiyerController,
                        enabled: enable && yetkiController.sevkiyatIrsDegistirilmeyecekAlanlar("plasiyer"),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                        onTap: () async {
                          final PlasiyerList? result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
                          if (result != null) {
                            _plasiyerController.text = result.plasiyerAciklama ?? "";
                            viewModel.setPlasiyer(result);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi && yetkiController.sevkiyatSatisFatGizlenecekAlanlar("plasiyer")),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: CustomTextField(
                        labelText: "Belge Tipi",
                        readOnly: true,
                        isMust: true,
                        suffixMore: true,
                        controller: _belgeTipiController,
                        enabled: enable && yetkiController.sevkiyatIrsDegistirilmeyecekAlanlar("belge_tipi"),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.tipi.toStringIfNotNull ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showBelgeTipiBottomSheetDialog(context, model.belgeTipi);

                          if (result is BelgeTipiModel) {
                            _belgeTipiController.text = result.belgeTipi ?? "";
                            viewModel.setBelgeTipi(result.belgeTipiId);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.sevkiyatSatisFatGizlenecekAlanlar("belge_tipi")),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Tarih",
                        readOnly: true,
                        isMust: true,
                        isDateTime: true,
                        controller: _tarihController,
                        enabled: enable && yetkiController.sevkiyatIrsDegistirilmeyecekAlanlar("teslim_cari"),
                        onTap: () async {
                          final DateTime? result = await dialogManager.showDateTimePicker();
                          if (result != null) {
                            _tarihController.text = result.toDateString;
                            viewModel.setTarih(result);
                          }
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: CustomTextField(
                        labelText: "Toplu Depo",
                        readOnly: true,
                        suffixMore: true,
                        controller: _topluDepoController,
                        enabled: enable && yetkiController.sevkiyatIrsDegistirilmeyecekAlanlar("toplu_depo"),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.topluDepo.toStringIfNotNull ?? "")),
                        onClear: () => viewModel.setTopluDepoKodu(null),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showTopluDepoBottomSheetDialog(context, viewModel.model.topluDepo);
                          if (result != null) {
                            _topluDepoController.text = result.depoTanimi ?? "";
                            viewModel.setTopluDepoKodu(result.depoKodu);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.sevkiyatSatisFatGizlenecekAlanlar("toplu_depo")),
                    // Expanded(
                    //   child: CustomTextField(
                    //     labelText: "Özel Kod 2",
                    //     readOnly: true,
                    //     suffixMore: true,
                    //     controller: _ozelKod2Controller,
                    //     enabled: enable,
                    //     valueWidget: Observer(builder: (_) => Text(viewModel.model.ozelKod2 ?? "")),
                    //     onClear: () => viewModel.setOzelKod2(null),
                    //     onTap: () async {
                    //       final result = await bottomSheetDialogManager.showOzelKod2BottomSheetDialog(context, viewModel.model.ozelKod2);
                    //       if (result != null) {
                    //         _ozelKod2Controller.text = result.aciklama ?? "";
                    //         viewModel.setOzelKod2(result.kod);
                    //       }
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                CustomWidgetWithLabel(
                  text: "KDV Dahil",
                  isVertical: true,
                  child: Observer(
                    builder: (_) => Switch.adaptive(
                      value: viewModel.kdvDahil,
                      onChanged: (enable && yetkiController.sevkiyatIrsDegistirilmeyecekAlanlar("kdv_dahil_haric")) ? (bool value) => viewModel.changeKdvDahil(value) : null,
                    ),
                  ),
                ).yetkiVarMi(yetkiController.sevkiyatSatisFatGizlenecekAlanlar("kdv_dahil_haric")),
                CustomWidgetWithLabel(
                  text: "Ek Açıklamalar",
                  child: Column(
                    children: <Widget>[
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar1 ?? "Açıklama 1", onChanged: (value) => changeAciklama(1, value), controller: _aciklama1Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(1)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar2 ?? "Açıklama 2", onChanged: (value) => changeAciklama(2, value), controller: _aciklama2Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(2)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar3 ?? "Açıklama 3", onChanged: (value) => changeAciklama(3, value), controller: _aciklama3Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(3)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar4 ?? "Açıklama 4", onChanged: (value) => changeAciklama(4, value), controller: _aciklama4Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(4)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar5 ?? "Açıklama 5", onChanged: (value) => changeAciklama(5, value), controller: _aciklama5Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(5)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar6 ?? "Açıklama 6", onChanged: (value) => changeAciklama(6, value), controller: _aciklama6Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(6)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar7 ?? "Açıklama 7", onChanged: (value) => changeAciklama(7, value), controller: _aciklama7Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(7)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar8 ?? "Açıklama 8", onChanged: (value) => changeAciklama(8, value), controller: _aciklama8Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(8)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar9 ?? "Açıklama 9", onChanged: (value) => changeAciklama(9, value), controller: _aciklama9Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(9)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar10 ?? "Açıklama 10", onChanged: (value) => changeAciklama(10, value), controller: _aciklama10Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(10)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar11 ?? "Açıklama 11", onChanged: (value) => changeAciklama(11, value), controller: _aciklama11Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(11)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar12 ?? "Açıklama 12", onChanged: (value) => changeAciklama(12, value), controller: _aciklama12Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(12)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar13 ?? "Açıklama 13", onChanged: (value) => changeAciklama(13, value), controller: _aciklama13Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(13)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar14 ?? "Açıklama 14", onChanged: (value) => changeAciklama(14, value), controller: _aciklama14Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(14)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar15 ?? "Açıklama 15", onChanged: (value) => changeAciklama(15, value), controller: _aciklama15Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(15)),
                      CustomTextField(enabled: enable, labelText: taltekParam?.aciklar16 ?? "Açıklama 16", onChanged: (value) => changeAciklama(16, value), controller: _aciklama16Controller)
                          .yetkiVarMi(yetkiController.talepTeklifAciklamaAlanlari(16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

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

  Future<void> getBelgeNo(String? seri) async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      queryParameters: {"Seri": seri, "BelgeTipi": BaseSiparisEditModel.instance.getEditTipiEnum?.rawValue, "EIrsaliye": "H"},
      showLoading: true,
    );
    if (result.success == true) {
      final List<BaseSiparisEditModel>? list = result.data.map((e) => e as BaseSiparisEditModel).toList().cast<BaseSiparisEditModel>();
      BaseSiparisEditModel.instance.belgeNo = list?.firstOrNull?.belgeNo;
      _belgeNoController.text = BaseSiparisEditModel.instance.belgeNo ?? "";
    }
  }
}
