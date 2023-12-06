import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/static_variables/static_variables.dart";
import "package:picker/core/init/network/login/api_urls.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../model/param_model.dart";
import "../../../../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../view_model/base_fatura_genel_view_model.dart";

class BaseFaturaGenelView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseFaturaGenelView({super.key, required this.model});

  @override
  State<BaseFaturaGenelView> createState() => BaseFaturaGenelViewState();
}

class BaseFaturaGenelViewState extends BaseState<BaseFaturaGenelView> {
  BaseEditModel<SiparisEditRequestModel> get siparisModel => widget.model;
  BaseFaturaGenelViewModel viewModel = BaseFaturaGenelViewModel();
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  bool get isEkle => siparisModel.isEkle || siparisModel.isKopyala;
  bool get enable => widget.model.enable;

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
        await getBelgeNo();
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
            key: StaticVariables.instance.faturaGenelFormKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Card(
                  child: ListTile(
                    onTap: () async => Get.toNamed(
                      "/mainPage/eBelgePdf",
                      arguments: EBelgeListesiModel(belgeTuru: widget.model.editTipiEnum?.rawValue, ebelgeTuru: "EFT", resmiBelgeNo: BaseSiparisEditModel.instance.resmiBelgeNo ?? ""),
                    ),
                    contentPadding: UIHelper.lowPaddingHorizontal,
                    leading: const Icon(Icons.info_outline),
                    title: Text(eBelgeButtonText),
                    trailing: const Icon(Icons.open_in_new_outlined),
                  ),
                ).paddingOnly(bottom: UIHelper.lowSize).yetkiVarMi(model.cariEfaturami == "E"),
                CustomTextField(
                  enabled: enable,
                  labelText: "Belge No",
                  isMust: true,
                  controller: _belgeNoController,
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
                CustomTextField(labelText: "Resmi Belge No", isMust: true, controller: _resmiBelgeNoController, enabled: enable, maxLength: 16, onTap: () {})
                    .yetkiVarMi(widget.model.baseEditEnum == BaseEditEnum.goruntule),
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
                    if (result != null) {
                      _cariController.text = result.cariAdi ?? "";
                    }
                  },
                ),
                CustomTextField(
                  labelText: "Teslim Cari",
                  readOnly: true,
                  suffixMore: true,
                  controller: _teslimCariController,
                  enabled: enable && yetkiController.sevkiyatIrsDegistirilmeyecekAlanlar("teslim_cari"),
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.teslimCari ?? "")),
                  onTap: () async {
                    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                    if (result != null) {
                      _teslimCariController.text = result.cariAdi ?? "";
                    }
                  },
                ).yetkiVarMi(yetkiController.sevkiyatSatisFatGizlenecekAlanlar("teslim_cari") && widget.model.editTipiEnum?.irsaliyeMi != true),
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
                          final result = await bottomSheetDialogManager.showBottomSheetDialog(
                            context,
                            title: "Belge Tipi",
                            children: List.generate(
                              viewModel.belgeTipi.length,
                              (int index) => BottomSheetModel(
                                title: viewModel.belgeTipi.keys.toList()[index],
                                description: viewModel.belgeTipi.values.toList()[index].toStringIfNotNull,
                                value: viewModel.belgeTipi.entries.toList()[index],
                              ),
                            ),
                          );
                          if (result is MapEntry) {
                            _belgeTipiController.text = result.key ?? "";
                            viewModel.setBelgeTipi(result.value);
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
                    Expanded(
                      child: CustomTextField(
                        labelText: "Özel Kod 2",
                        readOnly: true,
                        suffixMore: true,
                        controller: _ozelKod2Controller,
                        enabled: enable,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.ozelKod2 ?? "")),
                        onClear: () => viewModel.setOzelKod2(null),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showOzelKod2BottomSheetDialog(context, viewModel.model.ozelKod2);
                          if (result != null) {
                            _ozelKod2Controller.text = result.aciklama ?? "";
                            viewModel.setOzelKod2(result.kod);
                          }
                        },
                      ),
                    ),
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
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi1 ?? "Açıklama 1", controller: _aciklama1Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(1)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi2 ?? "Açıklama 2", controller: _aciklama2Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(2)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi3 ?? "Açıklama 3", controller: _aciklama3Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(3)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi4 ?? "Açıklama 4", controller: _aciklama4Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(4)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi5 ?? "Açıklama 5", controller: _aciklama5Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(5)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi6 ?? "Açıklama 6", controller: _aciklama6Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(6)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi7 ?? "Açıklama 7", controller: _aciklama7Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(7)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi8 ?? "Açıklama 8", controller: _aciklama8Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(8)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi9 ?? "Açıklama 9", controller: _aciklama9Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(9)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi10 ?? "Açıklama 10", controller: _aciklama10Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(10)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi11 ?? "Açıklama 11", controller: _aciklama11Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(11)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi12 ?? "Açıklama 12", controller: _aciklama12Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(12)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi13 ?? "Açıklama 13", controller: _aciklama13Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(13)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi14 ?? "Açıklama 14", controller: _aciklama14Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(14)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi15 ?? "Açıklama 15", controller: _aciklama15Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(15)),
                      CustomTextField(enabled: enable, labelText: parametreModel.satisEkAciklamaTanimi16 ?? "Açıklama 16", controller: _aciklama16Controller)
                          .yetkiVarMi(yetkiController.siparisMSAciklamaAlanlari(16)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  String get eBelgeButtonText {
    if (model.efaturaMi == "E") {
      if (model.efaturaDurumu == "TAS") {
        return "E-Fatura Taslağı (${model.resmiBelgeNo})";
      }
      return "E-Fatura (${model.resmiBelgeNo})";
    } else if (model.earsivMi == "E") {
      if (model.earsivDurumu == "TAS") {
        return "E-Arşiv Taslağı (${model.resmiBelgeNo})";
      }
      return "E-Arşiv (${model.resmiBelgeNo})";
    } else {
      if (model.eirsaliyeDurumu == "TAS") {
        return "E-İrsaliye Taslağı (${model.resmiBelgeNo})";
      } else {
        return "E-İrsaliye (${model.resmiBelgeNo})";
      }
    }
  }

  Future<void> getBelgeNo() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      queryParameters: {"Seri": _belgeNoController.text, "BelgeTipi": widget.model.editTipiEnum?.rawValue, "EIrsaliye": "H", "CariKodu": model.cariKodu ?? ""},
      showLoading: true,
    );
    if (result.success == true) {
      BaseSiparisEditModel.instance.belgeNo = result.data?.first.belgeNo;
      _belgeNoController.text = BaseSiparisEditModel.instance.belgeNo ?? "";
    }
  }
}
