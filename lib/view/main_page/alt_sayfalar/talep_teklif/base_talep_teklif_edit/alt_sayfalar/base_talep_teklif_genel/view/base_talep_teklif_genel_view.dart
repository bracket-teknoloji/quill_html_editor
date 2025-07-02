import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../../core/base/model/belge_tipi_model.dart";
import "../../../../../../../../core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "../../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../model/param_model.dart";
import "../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../cari/cari_listesi/model/cari_request_model.dart";
import "../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
// import "../../../../../../../model/param_model.dart";
// import "../../../../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
// import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
// import "../../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../view_model/base_talep_teklif_genel_view_model.dart";

final class BaseTalepTeklifGenelView extends StatefulWidget {
  const BaseTalepTeklifGenelView({required this.model, super.key});
  final BaseEditModel<SiparisEditRequestModel> model;

  @override
  State<BaseTalepTeklifGenelView> createState() => BaseTalepTeklifGenelViewState();
}

final class BaseTalepTeklifGenelViewState extends BaseState<BaseTalepTeklifGenelView> {
  BaseEditModel<SiparisEditRequestModel> get siparisModel => widget.model;
  BaseTalepTeklifGenelViewModel viewModel = BaseTalepTeklifGenelViewModel();
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  bool get isEkle => siparisModel.isEkle || siparisModel.isKopyala || siparisModel.isRevize;
  bool get enable => widget.model.enable;
  TalTekParam? get taltekParam =>
      parametreModel.talTekParam?.firstWhereOrNull((element) => element.belgeTipi == model.belgeTuru);

  late final TextEditingController _belgeNoController;
  late final TextEditingController _resmiBelgeNoController;
  late final TextEditingController _cariController;
  late final TextEditingController _teslimCariController;
  late final TextEditingController _projeController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _belgeTipiController;
  late final TextEditingController _tarihController;
  late final TextEditingController _topluDepoController;
  late final TextEditingController _ozelKod1Controller;
  late final TextEditingController _ozelKod2Controller;
  late final TextEditingController _kosulController;
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
    _projeController = TextEditingController(text: model.projeAciklama ?? model.projeKodu);
    _plasiyerController = TextEditingController(text: model.plasiyerAciklama);
    _belgeTipiController = TextEditingController(
      text: viewModel.belgeTipi.keys.firstWhereOrNull((element) => viewModel.belgeTipi[element] == model.tipi),
    );
    _belgeTipiController.text = (model.tipi ?? 0) < 6 ? "Yurtiçi" : "Yurtdışı";
    _tarihController = TextEditingController(text: model.tarih.toDateString);
    _topluDepoController = TextEditingController(text: model.depoTanimi ?? model.topluDepo.toStringIfNotNull);
    _ozelKod1Controller = TextEditingController(
      text: parametreModel.listOzelKodTum
              ?.firstWhereOrNull(
                (element) => element.belgeTipi == "S" && element.fiyatSirasi == 0 && element.kod == model.ozelKod1,
              )
              ?.aciklama ??
          model.ozelKod1,
    );
    _ozelKod2Controller = TextEditingController(
      text:
          parametreModel.listOzelKodTum
              ?.firstWhereOrNull(
                (element) => element.belgeTipi == "S" && element.fiyatSirasi == 0 && element.kod == model.ozelKod2,
              )
              ?.aciklama ??
          model.ozelKod2,
    );
    _kosulController = TextEditingController(text: model.kosulKodu ?? "");
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
    _projeController.dispose();
    _plasiyerController.dispose();
    _belgeTipiController.dispose();
    _tarihController.dispose();
    _topluDepoController.dispose();
    _ozelKod1Controller.dispose();
    _ozelKod2Controller.dispose();
    _kosulController.dispose();
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
            CustomTextField(
              labelText: "Belge No",
              isMust: true,
              controller: _belgeNoController,
              enabled: enable,
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
              onTap: () async {
                final cariModel = await Get.toNamed(
                  "mainPage/cariListesiOzel",
                  arguments: CariRequestModel(belgeTuru: model.getEditTipiEnum?.rawValue),
                );
                if (cariModel == null) return;
                final result = await networkManager.getCariModel(
                  CariRequestModel.fromCariListesiModel(cariModel)
                    ..secildi = "E"
                    ..kisitYok = true
                    ..eFaturaGoster = true,
                );
                if (result is CariListesiModel) {
                  _cariController.text = result.cariAdi ?? "";
                  _plasiyerController.text = result.plasiyerAciklama ?? "";
                  viewModel.model.cariTitle = result.efaturaCarisi == "E"
                      ? "E-Fatura"
                      : result.efaturaCarisi == "H"
                      ? "E-Arşiv"
                      : null;
                  viewModel
                    ..setCariAdi(result.cariAdi)
                    ..setCariKodu(result.cariKodu)
                    ..setPlasiyer(
                      PlasiyerList(plasiyerAciklama: result.plasiyerAciklama, plasiyerKodu: result.plasiyerKodu),
                    );
                  viewModel.model.vadeGunu = result.vadeGunu;
                  viewModel.model.efaturaTipi = result.efaturaTipi;
                  _belgeNoController.clear();
                  await getBelgeNo();
                }
              },
            ),
            if (yetkiController.siparisFarkliTeslimCariAktif(model.getEditTipiEnum) &&
                !(model.getEditTipiEnum?.gizlenecekAlanlar("teslim_cari") ?? false) &&
                widget.model.baseEditEnum != BaseEditEnum.taslak)
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
              ),
            Row(
              children: <Widget>[
                if (yetkiController.projeUygulamasiAcikMi &&
                    !(model.getEditTipiEnum?.gizlenecekAlanlar("proje") ?? false))
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
                        final BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(
                          context,
                          viewModel.model.projeKodu,
                        );
                        if (result is BaseProjeModel) {
                          _projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
                          viewModel.setProje(result);
                        }
                      },
                    ),
                  ),
                if (yetkiController.plasiyerUygulamasiAcikMi &&
                    !(model.getEditTipiEnum?.gizlenecekAlanlar("plasiyer") ?? false))
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
                        final PlasiyerList? result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
                          context,
                          viewModel.model.plasiyerKodu,
                        );
                        if (result != null) {
                          _plasiyerController.text = result.plasiyerAciklama ?? "";
                          viewModel.setPlasiyer(result);
                        }
                      },
                    ),
                  ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (!(model.getEditTipiEnum?.gizlenecekAlanlar("belge_tipi") ?? false))
                  Expanded(
                    child: CustomTextField(
                      labelText: "Belge Tipi",
                      readOnly: true,
                      isMust: true,
                      suffixMore: true,
                      controller: _belgeTipiController,
                      enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("belge_tipi") ?? false),
                      valueWidget: Observer(builder: (_) => Text(viewModel.model.tipi.toStringIfNotNull ?? "")),
                      onTap: () async {
                        final result = await bottomSheetDialogManager.showBelgeTipiBottomSheetDialog(
                          context,
                          model.tipi,
                        );
                        if (result is BelgeTipiModel) {
                          _belgeTipiController.text = result.belgeTipi ?? "";
                          viewModel.setBelgeTipi(result.belgeTipiId);
                        }
                      },
                    ),
                  ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Tarih",
                    readOnly: true,
                    isMust: true,
                    isDateTime: true,
                    controller: _tarihController,
                    enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("teslim_cari") ?? false),
                    onTap: () async {
                      final DateTime? result = await dialogManager.showDateTimePicker(
                        initialDate: viewModel.model.tarih,
                      );
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
                if (!(model.getEditTipiEnum?.gizlenecekAlanlar("toplu_depo") ?? false) &&
                    (yetkiController.topluDepoKullan(model.getEditTipiEnum)))
                  Expanded(
                    child: CustomTextField(
                      labelText: "Toplu Depo",
                      readOnly: true,
                      suffixMore: true,
                      controller: _topluDepoController,
                      isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("toplu_depo") ?? false,
                      enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("toplu_depo") ?? false),
                      valueWidget: Observer(builder: (_) => Text(viewModel.model.topluDepo.toStringIfNotNull ?? "")),
                      onClear: () => viewModel.setTopluDepoKodu(null),
                      onTap: () async {
                        final result = await bottomSheetDialogManager.showTopluDepoBottomSheetDialog(
                          context,
                          viewModel.model.topluDepo,
                        );
                        if (result != null) {
                          _topluDepoController.text = result.depoTanimi ?? "";
                          viewModel.setTopluDepoKodu(result.depoKodu);
                        }
                      },
                    ),
                  ),
              ],
            ), if (yetkiController.kosulAktif(model.getEditTipiEnum))
              CustomTextField(
                enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("kosul") ?? false),
                labelText: "Koşul",
                readOnly: true,
                suffixMore: true,
                controller: _kosulController,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.kosulKodu ?? "")),
                onTap: () async {
                  final result = await bottomSheetDialogManager.showKosullarBottomSheetDialog(
                    context,
                    viewModel.model.kosulKodu,
                    null,
                  );
                  if (result != null) {
                    viewModel.setKosulKodu(result.kosulKodu);
                    _kosulController.text = result.genelKosulAdi ?? result.kosulKodu ?? "";
                  }
                },
              ),
              Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (yetkiController.ebelgeOzelKod1AktifMi(model.getEditTipiEnum?.satisMi ?? false) &&
                    widget.model.baseEditEnum != BaseEditEnum.taslak)
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
                        final result = await bottomSheetDialogManager.showOzelKod1BottomSheetDialog(
                          context,
                          viewModel.model.ozelKod1,
                          model.getEditTipiEnum,
                        );
                        if (result != null) {
                          _ozelKod1Controller.text = result.aciklama ?? "";
                          viewModel.setOzelKod1(result.kod);
                          if (model.kalemList.ext.isNotNullOrEmpty) {
                            await dialogManager.showAreYouSureDialog(
                              onYes: () async {
                                final isSuccess = await viewModel.fiyatGuncelle();
                                if (isSuccess) {
                                  dialogManager.showSuccesDialog("Fiyatlar Güncellendi");
                                }
                              },
                              title: "Özel kod değiştirildi, fiyatları güncellemek istiyor musunuz?",
                            );
                          }
                        }
                      },
                    ),
                  ),

                if (yetkiController.ebelgeOzelKod2AktifMi(model.getEditTipiEnum?.satisMi ?? false) &&
                    widget.model.baseEditEnum != BaseEditEnum.taslak)
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
                        final result = await bottomSheetDialogManager.showOzelKod2BottomSheetDialog(
                          context,
                          viewModel.model.ozelKod2,
                        );
                        if (result != null) {
                          _ozelKod2Controller.text = result.aciklama ?? "";
                          viewModel.setOzelKod2(result.kod);
                        }
                      },
                    ),
                  ).yetkiVarMi(yetkiController.ebelgeOzelKod2AktifMi(model.getEditTipiEnum?.satisMi ?? false)),
              ],
            ),
            if (!(model.getEditTipiEnum?.gizlenecekAlanlar("kdv_dahil_haric") ?? false))
              CustomWidgetWithLabel(
                text: "KDV Dahil",
                isVertical: true,
                child: Observer(
                  builder: (_) => Switch.adaptive(
                    value: viewModel.kdvDahil,
                    onChanged:
                        (enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("kdv_dahil_haric") ?? false))
                        ? (value) => viewModel.changeKdvDahil(value)
                        : null,
                  ),
                ),
              ),
            if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 0))
              CustomWidgetWithLabel(
                text: "Ek Açıklamalar",
                child: Column(
                  children: <Widget>[
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(1))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar1 ?? "Açıklama 1",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(1, value),
                        controller: _aciklama1Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(2))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar2 ?? "Açıklama 2",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(2, value),
                        controller: _aciklama2Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(3))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar3 ?? "Açıklama 3",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(3, value),
                        controller: _aciklama3Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(4))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar4 ?? "Açıklama 4",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(4, value),
                        controller: _aciklama4Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(5))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar5 ?? "Açıklama 5",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(5, value),
                        controller: _aciklama5Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(6))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar6 ?? "Açıklama 6",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(6, value),
                        controller: _aciklama6Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(7))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar7 ?? "Açıklama 7",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(7, value),
                        controller: _aciklama7Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(8))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar8 ?? "Açıklama 8",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(8, value),
                        controller: _aciklama8Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(9))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar9 ?? "Açıklama 9",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(9, value),
                        controller: _aciklama9Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(10))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar10 ?? "Açıklama 10",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(10, value),
                        controller: _aciklama10Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(11))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar11 ?? "Açıklama 11",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(11, value),
                        controller: _aciklama11Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(12))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar12 ?? "Açıklama 12",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(12, value),
                        controller: _aciklama12Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(13))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar13 ?? "Açıklama 13",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(13, value),
                        controller: _aciklama13Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(14))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar14 ?? "Açıklama 14",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(14, value),
                        controller: _aciklama14Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(15))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar15 ?? "Açıklama 15",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(15, value),
                        controller: _aciklama15Controller,
                      ),
                    if (yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(16))
                      CustomTextField(
                        enabled: enable,
                        labelText: taltekParam?.aciklar16 ?? "Açıklama 16",
                        maxLength: StaticVariables.maxAciklamaLength,
                        onChanged: (value) => viewModel.setAciklama(16, value),
                        controller: _aciklama16Controller,
                      ),
                  ],
                ),
              ),
          ],
        ),
      ),
    ),
  );

  Future<void> getBelgeNo({String? seri}) async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      queryParameters: {
        "Seri": seri ?? _belgeNoController.text,
        "BelgeTipi": widget.model.editTipiEnum?.rawValue,
        "EIrsaliye": widget.model.editTipiEnum.irsaliyeMi ? "E" : "H",
        "CariKodu": model.cariKodu ?? "",
      },
      showLoading: true,
    );
    if (result.isSuccess) {
      BaseSiparisEditModel.instance.belgeNo = result.dataList.firstOrNull?.belgeNo;
      _belgeNoController.text = BaseSiparisEditModel.instance.belgeNo ?? "";
    }
  }
}
