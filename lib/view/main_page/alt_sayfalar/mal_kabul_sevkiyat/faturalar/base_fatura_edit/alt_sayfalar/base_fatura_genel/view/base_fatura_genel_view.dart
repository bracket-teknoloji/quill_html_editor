import "dart:async";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/ek_rehber_request_model.dart";
import "package:picker/core/base/view/genel_rehber/model/genel_rehber_model.dart";
import "package:picker/view/main_page/model/user_model/ek_rehberler_model.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "../../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/extensions/text_span_extensions.dart";
import "../../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../../model/param_model.dart";
import "../../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../../cari/cari_listesi/model/cari_request_model.dart";
import "../../../../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../view_model/base_fatura_genel_view_model.dart";

final class BaseFaturaGenelView extends StatefulWidget {
  const BaseFaturaGenelView({required this.model, super.key});
  final BaseEditModel<SiparisEditRequestModel> model;

  @override
  State<BaseFaturaGenelView> createState() => BaseFaturaGenelViewState();
}

final class BaseFaturaGenelViewState extends BaseState<BaseFaturaGenelView> {
  BaseEditModel<SiparisEditRequestModel> get siparisModel => widget.model;
  BaseFaturaGenelViewModel viewModel = BaseFaturaGenelViewModel();
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  bool get isEkle => siparisModel.isEkle || siparisModel.isKopyala || siparisModel.isRevize || siparisModel.isTaslak;
  bool get enable => widget.model.enable;

  late final TextEditingController _belgeNoController;
  late final TextEditingController _resmiBelgeNoController;
  late final TextEditingController _cariController;
  late final TextEditingController _teslimCariController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projeController;
  late final TextEditingController _belgeTipiController;
  late final TextEditingController _tarihController;
  late final TextEditingController _topluDepoController;
  late final TextEditingController _ozelKod1Controller;
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
    _belgeTipiController = TextEditingController(text: viewModel.belgeTipi.firstOrNull?.key);
    if (viewModel.model.belgeTipi == null && enable) viewModel.setBelgeTipi(model.getEditTipiEnum?.varsayilanBelgeTipi ?? viewModel.belgeTipi.firstOrNull?.value);
    _belgeTipiController.text = viewModel.belgeTipi.firstWhereOrNull((element) => element.value == viewModel.model.belgeTipi)?.key ?? "";
    _projeController = TextEditingController(text: model.projeAciklama ?? model.projeKodu);
    _tarihController = TextEditingController(text: model.tarih.toDateString);
    _topluDepoController = TextEditingController(text: model.depoTanimi ?? model.topluDepo.toStringIfNotNull);
    _ozelKod1Controller = TextEditingController(text: model.ozelKod1);
    _ozelKod2Controller = TextEditingController(
      text: parametreModel.listOzelKodTum
              ?.firstWhereOrNull(
                (element) => element.belgeTipi == "S" && element.fiyatSirasi == 0 && element.kod == model.ozelKod2,
              )
              ?.aciklama ??
          model.ozelKod2,
    );
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
      if (model.belgeNo == null) {
        await getBelgeNo(widget.model.baseEditEnum.siparistenKopyalaMi, seri: model.getEditTipiEnum?.irsaliyeMi == true && model.eBelgeCheckBoxMi ? parametreModel.seriEIrsaliye : null);
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
    _projeController.dispose();
    _belgeTipiController.dispose();
    _tarihController.dispose();
    _topluDepoController.dispose();
    _ozelKod1Controller.dispose();
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
                      arguments: EBelgeListesiModel(belgeTuru: widget.model.editTipiEnum?.rawValue, ebelgeTuru: "EFT", resmiBelgeNo: model.resmiBelgeNo ?? ""),
                    ),
                    contentPadding: UIHelper.lowPaddingHorizontal,
                    leading: const Icon(Icons.info_outline),
                    title: Text(eBelgeButtonText),
                    subtitle: model.efattanTutar != null
                        ? Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "Genel Toplam: ${model.efattanTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency"),
                                TextSpan(text: "\nGenel Döviz Tutarı: ${model.efattanDoviz.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari)} ${model.efattanDovizAdi ?? ""}")
                                    .yetkiVarMi(model.efattanDoviz != null),
                              ].nullCheckWithGeneric,
                            ),
                          )
                        : null,
                    trailing: const Icon(Icons.open_in_new_outlined),
                  ),
                ).paddingOnly(bottom: UIHelper.lowSize).yetkiVarMi(model.efaturaMi == "E" && model.resmiBelgeNo != null),
                if (!yetkiController.kontrolluAktarBelgeTipleri(model.getEditTipiEnum?.rawValue))
                  CustomTextField(
                    enabled: enable,
                    labelText: "Belge No",
                    isMust: true,
                    controller: _belgeNoController,
                    maxLength: 15,
                    suffix: IconButton(
                      onPressed: () async {
                        await getBelgeNo(widget.model.baseEditEnum.siparistenKopyalaMi);
                      },
                      icon: const Icon(Icons.format_list_numbered_rtl_outlined),
                    ),
                    validator: (value) {
                      if (value case (null || "")) return "Belge No Boş Olamaz";
                      if (model.eBelgeCheckBoxMi && !value.startsWith("EIR")) return "E-Fatura Belge No EIR ile başlamalıdır";
                      return null;
                    },
                    onChanged: (value) {
                      model.belgeNo = value;
                    },
                  ),
                CustomTextField(labelText: "Resmi Belge No", isMust: true, controller: _resmiBelgeNoController, enabled: enable, maxLength: 16, onTap: () {})
                    .yetkiVarMi(widget.model.baseEditEnum == BaseEditEnum.goruntule || widget.model.baseEditEnum == BaseEditEnum.taslak),
                CustomTextField(
                  labelText: "Cari",
                  readOnly: true,
                  isMust: true,
                  suffixMore: true,
                  controller: _cariController,
                  enabled: isEkle,
                  valueWidget: Observer(
                    builder: (_) => Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: viewModel.model.cariKodu ?? ""),
                          const TextSpan(text: "  "),
                          TextSpan(
                            text: viewModel.model.cariTitle,
                            style: const TextStyle(color: ColorPalette.mantis),
                          ),
                        ],
                      ),
                    ),
                  ),
                  suffix: IconButton(
                    onPressed: () async {
                      if (_cariController.text.isEmpty) {
                        dialogManager.showAlertDialog("Önce Cari Seçiniz");
                        return;
                      }
                      final result = await networkManager.getCariModel(CariRequestModel(kod: [viewModel.model.cariKodu ?? ""]));
                      if (result != null) {
                        dialogManager.showCariIslemleriGridViewDialog(result);
                      }
                    },
                    icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                  ).yetkiVarMi(isEkle),
                  onTap: () async {
                    final result = await Get.toNamed(
                      "mainPage/cariRehberi",
                      arguments: CariListesiRequestModel(
                        belgeTuru: model.getEditTipiEnum?.rawValue,
                      ),
                    );
                    if (result is CariListesiModel) {
                      final cariModel = await networkManager.getCariModel(CariRequestModel.fromCariListesiModel(result));
                      _cariController.text = cariModel!.cariAdi ?? "";
                      // _plasiyerController.text = result.plasiyerAciklama ?? "";
                      viewModel.model.cariTitle = cariModel.efaturaCarisi == "E"
                          ? "E-Fatura"
                          : cariModel.efaturaCarisi == "H"
                              ? "E-Arşiv"
                              : null;
                      viewModel
                        ..setCariAdi(cariModel.cariAdi)
                        ..setCariKodu(cariModel.cariKodu)
                        ..setPlasiyer(PlasiyerList(plasiyerAciklama: cariModel.plasiyerAciklama, plasiyerKodu: cariModel.plasiyerKodu));
                      viewModel.model.vadeGunu = cariModel.vadeGunu;
                      viewModel.model.efaturaTipi = cariModel.efaturaTipi;
                      _plasiyerController.text = cariModel.plasiyerAciklama ?? "";
                      _belgeNoController.clear();
                      await getBelgeNo(
                        widget.model.baseEditEnum.siparistenKopyalaMi,
                        seri: viewModel.model.eBelgeCheckBoxMi ? parametreModel.seriEIrsaliye : null,
                      );
                    }
                  },
                ),
                CustomTextField(
                  enabled: enable && yetkiController.siparisFarkliTeslimCariAktif(model.getEditTipiEnum),
                  labelText: "Teslim Cari",
                  readOnly: true,
                  suffixMore: true,
                  controller: _teslimCariController,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.teslimCari ?? "")),
                  suffix: yetkiController.cariTeslimCariSatisBaglanmisCarilerSecilsinMi
                      ? null
                      : IconButton(
                          onPressed: () async {
                            if (model.cariKodu == null) {
                              dialogManager.showAlertDialog("Önce Cari Seçiniz");
                              return;
                            }
                            final result = await Get.toNamed(
                              "mainPage/cariRehberi",
                              arguments: CariListesiRequestModel(
                                bagliCariKodu: model.cariKodu,
                                teslimCari: "E",
                                belgeTuru: widget.model.editTipiEnum?.rawValue,
                              ),
                            );
                            if (result != null && result is CariListesiModel) {
                              model
                                ..teslimCari = result.cariKodu
                                ..teslimCariAdi = result.cariAdi;
                              _teslimCariController.text = result.cariAdi ?? "";
                            }
                          },
                          icon: const Icon(Icons.hub_outlined),
                        ),
                  onClear: () {
                    model
                      ..teslimCari = null
                      ..teslimCariAdi = null;
                    _teslimCariController.clear();
                  },
                  onTap: !yetkiController.siparisFarkliTeslimCariAktif(model.getEditTipiEnum)
                      ? null
                      : () async {
                          if (!yetkiController.cariTeslimCariSatisBaglanmisCarilerSecilsinMi) {
                            final result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                            if (result != null && result is CariListesiModel) {
                              model
                                ..teslimCari = result.cariKodu
                                ..teslimCariAdi = result.cariAdi
                                ..plasiyerAciklama = result.plasiyerAciklama
                                ..plasiyerKodu = result.plasiyerKodu;
                              _teslimCariController.text = result.cariAdi ?? "";
                              _plasiyerController.text = result.plasiyerAciklama ?? "";
                            }
                          } else {
                            if (_cariController.text.isEmpty) {
                              dialogManager.showAlertDialog("Önce Cari Seçiniz");
                              return;
                            }
                            final result = await Get.toNamed(
                              "mainPage/cariRehberi",
                              arguments: CariListesiRequestModel(
                                bagliCariKodu: model.cariKodu,
                                teslimCari: "E",
                                belgeTuru: widget.model.editTipiEnum?.rawValue,
                              ),
                            );
                            if (result != null && result is CariListesiModel) {
                              model
                                ..teslimCari = result.cariKodu
                                ..teslimCariAdi = result.cariAdi;
                              _teslimCariController.text = result.cariAdi ?? "";
                            }
                          }
                        },
                ).yetkiVarMi(!(model.getEditTipiEnum?.gizlenecekAlanlar("teslim_cari") ?? false) && widget.model.baseEditEnum != BaseEditEnum.taslak),
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
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("belge_tipi") ?? false),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.belgeTipi.toStringIfNotNull ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                            context,
                            title: "Belge Tipi",
                            groupValue: viewModel.model.belgeTipi,
                            children: List.generate(
                              viewModel.belgeTipi.length,
                              (index) => BottomSheetModel(
                                title: viewModel.belgeTipi[index].key,
                                description: viewModel.belgeTipi[index].value.toStringIfNotNull,
                                value: viewModel.belgeTipi.toList()[index],
                                groupValue: viewModel.belgeTipi.toList()[index].value,
                              ),
                            ),
                          );
                          if (result != null) {
                            _belgeTipiController.text = result.key;
                            viewModel.setBelgeTipi(result.value);
                          }
                        },
                      ),
                    ).yetkiVarMi(!(model.getEditTipiEnum?.gizlenecekAlanlar("belge_tipi") ?? false)),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Tarih",
                        readOnly: true,
                        isMust: true,
                        isDateTime: true,
                        controller: _tarihController,
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("teslim_cari") ?? false),
                        onTap: () async {
                          final DateTime? result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.tarih);
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
                  children: <Widget>[
                    Expanded(
                      child: CustomTextField(
                        labelText: "Proje",
                        readOnly: true,
                        isMust: true,
                        suffixMore: true,
                        controller: _projeController,
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("proje") ?? false),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                        onTap: () async {
                          final BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
                          if (result is BaseProjeModel) {
                            _projeController.text = result.projeAciklama ?? "";
                            viewModel.setProje(result);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi && !(model.getEditTipiEnum?.gizlenecekAlanlar("proje") ?? false)),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Plasiyer",
                        readOnly: true,
                        isMust: true,
                        suffixMore: true,
                        controller: _plasiyerController,
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("plasiyer") ?? false),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                        onTap: () async {
                          final PlasiyerList? result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
                          if (result != null) {
                            _plasiyerController.text = result.plasiyerAciklama ?? "";
                            viewModel.setPlasiyer(result);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi && !(model.getEditTipiEnum?.gizlenecekAlanlar("plasiyer") ?? false)),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: CustomTextField(
                        labelText: "Özel Kod 1",
                        readOnly: true,
                        suffixMore: true,
                        isMust: true,
                        controller: _ozelKod1Controller,
                        enabled: enable,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.ozelKod1 ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showOzelKod1BottomSheetDialog(context, viewModel.model.ozelKod1);
                          if (result != null) {
                            _ozelKod1Controller.text = result.aciklama ?? "";
                            viewModel.setOzelKod1(result.kod);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.ebelgeOzelKod1AktifMi(model.getEditTipiEnum?.satisMi ?? false) && widget.model.baseEditEnum != BaseEditEnum.taslak),
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
                    ).yetkiVarMi(yetkiController.ebelgeOzelKod2AktifMi(model.getEditTipiEnum?.satisMi ?? false)),
                  ],
                ),
                CustomTextField(
                  labelText: "Toplu Depo",
                  readOnly: true,
                  suffixMore: true,
                  controller: _topluDepoController,
                  enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("toplu_depo") ?? false),
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.topluDepo.toStringIfNotNull ?? "")),
                  onClear: () => viewModel.setTopluDepoKodu(null),
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showTopluDepoBottomSheetDialog(context, viewModel.model.topluDepo);
                    if (result != null) {
                      _topluDepoController.text = result.depoTanimi ?? "";
                      viewModel.setTopluDepoKodu(result.depoKodu);
                    }
                  },
                ).yetkiVarMi(!(model.getEditTipiEnum?.gizlenecekAlanlar("toplu_depo") ?? false)),
                CustomLayoutBuilder(
                  splitCount: 2,
                  children: [
                    CustomWidgetWithLabel(
                      text: "KDV Dahil",
                      isVertical: true,
                      child: Observer(
                        builder: (_) => Switch.adaptive(
                          value: viewModel.kdvDahil,
                          onChanged: (enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("kdv_dahil_haric") ?? false)) ? (value) => viewModel.changeKdvDahil(value) : null,
                        ),
                      ),
                    ).yetkiVarMi(!(model.getEditTipiEnum?.gizlenecekAlanlar("kdv_dahil_haric") ?? false)),
                    CustomWidgetWithLabel(
                      text: "E-İrsaliye",
                      isVertical: true,
                      child: Observer(
                        builder: (_) => Switch.adaptive(
                          value: viewModel.ebelgeCheckbox,
                          onChanged: enable
                              ? (value) async {
                                  viewModel.changeEbelgeCheckBox(value);
                                  if (value) {
                                    await getBelgeNo(false, seri: parametreModel.seriEIrsaliye ?? "");
                                  } else {
                                    await getBelgeNo(false, seri: "");
                                  }
                                }
                              : null,
                        ),
                      ),
                    ).yetkiVarMi(model.getEditTipiEnum.irsaliyeMi),
                  ],
                ),
                if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 0))
                  CustomWidgetWithLabel(
                    text: "Ek Açıklamalar",
                    child: Column(
                      children: <Widget>[
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(1) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A1"),
                          suffixMore: getEkRehberById(1) != null,
                          onTap: () async => await getGenelRehber(1),
                          onClear: () => viewModel.setAciklama(1, null),
                          onChanged: (value) => viewModel.setAciklama(1, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama1Adi ?? "")),
                          labelText: getEkRehberById(1)?.alan == "ACIK1"
                              ? getEkRehberById(1)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi1 : parametreModel.alisEkAciklamaTanimi1) ?? "Açıklama 1",
                          controller: _aciklama1Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 1)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(2) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A2"),
                          onClear: () => viewModel.setAciklama(2, null),
                          suffixMore: getEkRehberById(2) != null,
                          onTap: () async => await getGenelRehber(2),
                          onChanged: (value) => viewModel.setAciklama(2, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama2Adi ?? "")),
                          labelText: getEkRehberById(2)?.alan == "ACIK2"
                              ? getEkRehberById(2)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi2 : parametreModel.alisEkAciklamaTanimi2) ?? "Açıklama 2",
                          controller: _aciklama2Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 2)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(3) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A3"),
                          suffixMore: getEkRehberById(3) != null,
                          onClear: () => viewModel.setAciklama(3, null),
                          onChanged: (value) => viewModel.setAciklama(3, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama3Adi ?? "")),
                          labelText: getEkRehberById(3)?.alan == "ACIK3"
                              ? getEkRehberById(3)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi3 : parametreModel.alisEkAciklamaTanimi3) ?? "Açıklama 3",
                          controller: _aciklama3Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 3)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(4) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A4"),
                          suffixMore: getEkRehberById(4) != null,
                          onClear: () => viewModel.setAciklama(4, null),
                          onTap: () async => await getGenelRehber(4),
                          onChanged: (value) => viewModel.setAciklama(4, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama4Adi ?? "")),
                          labelText: getEkRehberById(4)?.alan == "ACIK4"
                              ? getEkRehberById(4)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi4 : parametreModel.alisEkAciklamaTanimi4) ?? "Açıklama 4",
                          controller: _aciklama4Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 4)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(5) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A5"),
                          suffixMore: getEkRehberById(5) != null,
                          onTap: () async => await getGenelRehber(5),
                          onClear: () => viewModel.setAciklama(5, null),
                          onChanged: (value) => viewModel.setAciklama(5, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama5Adi ?? "")),
                          labelText: getEkRehberById(5)?.alan == "ACIK5"
                              ? getEkRehberById(5)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi5 : parametreModel.alisEkAciklamaTanimi5) ?? "Açıklama 5",
                          controller: _aciklama5Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 5)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(6) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A6"),
                          suffixMore: getEkRehberById(6) != null,
                          onTap: () async => await getGenelRehber(6),
                          onClear: () => viewModel.setAciklama(6, null),
                          onChanged: (value) => viewModel.setAciklama(6, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama6Adi ?? "")),
                          labelText: getEkRehberById(6)?.alan == "ACIK6"
                              ? getEkRehberById(6)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi6 : parametreModel.alisEkAciklamaTanimi6) ?? "Açıklama 6",
                          controller: _aciklama6Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 6)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(7) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A7"),
                          suffixMore: getEkRehberById(7) != null,
                          onTap: () async => await getGenelRehber(7),
                          onClear: () => viewModel.setAciklama(7, null),
                          onChanged: (value) => viewModel.setAciklama(7, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama7Adi ?? "")),
                          labelText: getEkRehberById(7)?.alan == "ACIK7"
                              ? getEkRehberById(7)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi7 : parametreModel.alisEkAciklamaTanimi7) ?? "Açıklama 7",
                          controller: _aciklama7Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 7)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(8) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("8"),
                          suffixMore: getEkRehberById(8) != null,
                          onClear: () => viewModel.setAciklama(8, null),
                          onTap: () async => await getGenelRehber(8),
                          onChanged: (value) => viewModel.setAciklama(8, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama8Adi ?? "")),
                          labelText: getEkRehberById(8)?.alan == "ACIK8"
                              ? getEkRehberById(8)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi8 : parametreModel.alisEkAciklamaTanimi8) ?? "Açıklama 8",
                          controller: _aciklama8Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 8)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(9) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A9"),
                          suffixMore: getEkRehberById(9) != null,
                          onTap: () async => await getGenelRehber(9),
                          onClear: () => viewModel.setAciklama(9, null),
                          onChanged: (value) => viewModel.setAciklama(9, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama9Adi ?? "")),
                          labelText: getEkRehberById(9)?.alan == "ACIK9"
                              ? getEkRehberById(9)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi9 : parametreModel.alisEkAciklamaTanimi9) ?? "Açıklama 9",
                          controller: _aciklama9Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 9)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(10) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A10"),
                          suffixMore: getEkRehberById(10) != null,
                          onTap: () async => await getGenelRehber(10),
                          onClear: () => viewModel.setAciklama(10, null),
                          onChanged: (value) => viewModel.setAciklama(10, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama10Adi ?? "")),
                          labelText: getEkRehberById(10)?.alan == "ACIK10"
                              ? getEkRehberById(10)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi10 : parametreModel.alisEkAciklamaTanimi10) ?? "Açıklama 10",
                          controller: _aciklama10Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 10)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(11) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A11"),
                          suffixMore: getEkRehberById(11) != null,
                          onTap: () async => await getGenelRehber(11),
                          onClear: () => viewModel.setAciklama(11, null),
                          onChanged: (value) => viewModel.setAciklama(11, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama11Adi ?? "")),
                          labelText: getEkRehberById(11)?.alan == "ACIK11"
                              ? getEkRehberById(11)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi11 : parametreModel.alisEkAciklamaTanimi11) ?? "Açıklama 11",
                          controller: _aciklama11Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 11)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(12) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A12"),
                          suffixMore: getEkRehberById(12) != null,
                          onTap: () async => await getGenelRehber(12),
                          onClear: () => viewModel.setAciklama(12, null),
                          onChanged: (value) => viewModel.setAciklama(12, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama12Adi ?? "")),
                          labelText: getEkRehberById(12)?.alan == "ACIK12"
                              ? getEkRehberById(12)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi12 : parametreModel.alisEkAciklamaTanimi12) ?? "Açıklama 12",
                          controller: _aciklama12Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 12)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(13) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A13"),
                          suffixMore: getEkRehberById(13) != null,
                          onTap: () async => await getGenelRehber(13),
                          onClear: () => viewModel.setAciklama(13, null),
                          onChanged: (value) => viewModel.setAciklama(13, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama13Adi ?? "")),
                          labelText: getEkRehberById(13)?.alan == "ACIK13"
                              ? getEkRehberById(13)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi13 : parametreModel.alisEkAciklamaTanimi13) ?? "Açıklama 13",
                          controller: _aciklama13Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 13)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(14) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A14"),
                          suffixMore: getEkRehberById(14) != null,
                          onTap: () async => await getGenelRehber(14),
                          onClear: () => viewModel.setAciklama(14, null),
                          onChanged: (value) => viewModel.setAciklama(14, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama14Adi ?? "")),
                          labelText: getEkRehberById(14)?.alan == "ACIK14"
                              ? getEkRehberById(14)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi14 : parametreModel.alisEkAciklamaTanimi14) ?? "Açıklama 14",
                          controller: _aciklama14Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 14)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(15) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A15"),
                          suffixMore: getEkRehberById(15) != null,
                          onTap: () async => await getGenelRehber(15),
                          onClear: () => viewModel.setAciklama(15, null),
                          onChanged: (value) => viewModel.setAciklama(15, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama5Adi ?? "")),
                          labelText: getEkRehberById(15)?.alan == "ACIK15"
                              ? getEkRehberById(15)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi15 : parametreModel.alisEkAciklamaTanimi15) ?? "Açıklama 15",
                          controller: _aciklama15Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 15)),
                        CustomTextField(
                          enabled: enable,
                          maxLength: StaticVariables.maxAciklamaLength,
                          readOnly: getEkRehberById(16) != null,
                          isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A16"),
                          suffixMore: getEkRehberById(16) != null,
                          onTap: () async => await getGenelRehber(16),
                          onClear: () => viewModel.setAciklama(16, null),
                          onChanged: (value) => viewModel.setAciklama(16, GenelRehberModel(kodu: value)),
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama6Adi ?? "")),
                          labelText: getEkRehberById(16)?.alan == "ACIK16"
                              ? getEkRehberById(16)?.baslik
                              : (satisMi ? parametreModel.satisEkAciklamaTanimi16 : parametreModel.alisEkAciklamaTanimi16) ?? "Açıklama 16",
                          controller: _aciklama16Controller,
                        ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 16)),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      );

  bool get satisMi => model.getEditTipiEnum?.satisMi ?? false;

  String get eBelgeButtonText {
    if (model.efaturaMi == "E" || model.cariEfaturami == "E") {
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
        return "E-Fatura (${model.resmiBelgeNo})";
      }
    }
  }

  Future<void> getBelgeNo(bool? siparistenKopyalaMi, {String? seri}) async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      queryParameters: {
        "Seri": (seri != null || _belgeNoController.text != "") ? seri ?? _belgeNoController.text : "",
        "BelgeTipi": widget.model.editTipiEnum?.rawValue,
        "EIrsaliye": model.eBelgeMi ? "E" : "H",
        "CariKodu": model.cariKodu ?? "",
      },
      showLoading: true,
    );
    if (result.isSuccess) {
      viewModel.setBelgeNo(result.dataList.firstOrNull?.belgeNo, siparistenKopyalaMi);
      if (siparistenKopyalaMi ?? false) {}
      _belgeNoController.text = model.belgeNo ?? "";
    }
  }

  EkRehberlerModel? getEkRehberById(int? id) {
    if (userModel.ekRehberler.ext.isNullOrEmpty) return null;
    if ((model.getEditTipiEnum?.fiyatGrubuGorunsunMu ?? false) && parametreModel.satisFiyatGrubuSorulacakAlan == id.toStringIfNotNull) {
      return EkRehberlerModel(alan: "ACIK${id ?? ""}", baslik: "Fiyat Grubu");
    }
    return userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK${id ?? ""}" && element.ekran == BaseSiparisEditModel.instance.getEditTipiEnum?.rawValue);
  }

  Future<void> getGenelRehber(int? id) async {
    if (id == null) {
      dialogManager.showErrorSnackBar("ID bulunamadı.");
      return;
    }
    final ekRehberModel = getEkRehberById(id);
    EkRehberRequestModel ekRehberRequestModel = EkRehberRequestModel(
      belgeNo: model.belgeNo,
      belgeTipi: model.getEditTipiEnum?.rawValue,
      belgeTarihi: model.tarih,
      id: ekRehberModel?.id,
      cariKodu: model.cariKodu,
      baslik: ekRehberModel?.baslik,
    );
    final isFiyatGrubu = (model.getEditTipiEnum?.fiyatGrubuGorunsunMu ?? false) && parametreModel.satisFiyatGrubuSorulacakAlan == id.toStringIfNotNull;
    if (isFiyatGrubu) {
      ekRehberRequestModel = ekRehberRequestModel.copyWith(rehberKodu: 2, baslik: "Fiyat Grubu");
    } else {
      ekRehberRequestModel = ekRehberRequestModel.copyWith(rehberKodu: 8);
    }
    if (ekRehberModel != null) {
      var result = await Get.toNamed("mainPage/genelRehber", arguments: ekRehberRequestModel);
      if (result == null) return;
      result = result as GenelRehberModel;
      switch (id) {
        case 1:
          _aciklama1Controller.text = result.kodu ?? "";
          viewModel.setAciklama(1, result);
        case 2:
          _aciklama2Controller.text = result.kodu ?? "";
          viewModel.setAciklama(2, result);
        case 3:
          _aciklama3Controller.text = result.kodu ?? "";
          viewModel.setAciklama(3, result);
        case 4:
          _aciklama4Controller.text = result.kodu ?? "";
          viewModel.setAciklama(4, result);
        case 5:
          _aciklama5Controller.text = result.kodu ?? "";
          viewModel.setAciklama(5, result);
        case 6:
          _aciklama6Controller.text = result.kodu ?? "";
          viewModel.setAciklama(6, result);
        case 7:
          _aciklama7Controller.text = result.kodu ?? "";
          viewModel.setAciklama(7, result);
        case 8:
          _aciklama8Controller.text = result.kodu ?? "";
          viewModel.setAciklama(8, result);
        case 9:
          _aciklama9Controller.text = result.kodu ?? "";
          viewModel.setAciklama(9, result);
        case 10:
          _aciklama10Controller.text = result.kodu ?? "";
          viewModel.setAciklama(10, result);
        case 11:
          _aciklama11Controller.text = result.kodu ?? "";
          viewModel.setAciklama(11, result);
        case 12:
          _aciklama12Controller.text = result.kodu ?? "";
          viewModel.setAciklama(12, result);
        case 13:
          _aciklama13Controller.text = result.kodu ?? "";
          viewModel.setAciklama(13, result);
        case 14:
          _aciklama14Controller.text = result.kodu ?? "";
          viewModel.setAciklama(14, result);
        case 15:
          _aciklama15Controller.text = result.kodu ?? "";
          viewModel.setAciklama(15, result);
        case 16:
          _aciklama16Controller.text = result.kodu ?? "";
          viewModel.setAciklama(16, result);
        default:
      }
    }
  }

  String? getAciklama(int? id) {
    // final String deneme = "NQR01|01NFFORC02|02deneme2|03deneme3|04165.3|054|06deneme6|07deneme7|08deneme8|09deneme9|1015.01.2022|11deneme11|12deneme12|13deneme13|14deneme14|15deneme15|16deneme16|17deneme17|18deneme18|19deneme19|20deneme20|21deneme21|22deneme22|23deneme23|24deneme24|25deneme25|26deneme26|27deneme27|28deneme28|29deneme29|30deneme30|31deneme31|32deneme32|33deneme33|34deneme34|50163.43";
    // TODO: Bu eklenebilir ama şu anlık işlevsiz. GetGenelRehber isteği atılması lazım.
    if (getEkRehberById(id) == null) return null;
    return getEkRehberById(id)!.baslik;
  }
}
