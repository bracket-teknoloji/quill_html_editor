import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

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
    _projeController = TextEditingController(text: model.projeAciklama ?? model.projeKodu);
    _plasiyerController = TextEditingController(text: model.plasiyerAciklama);
    _belgeTipiController = TextEditingController(
      text: viewModel.belgeTipi.keys.firstWhereOrNull((element) => viewModel.belgeTipi[element] == model.tipi),
    );
    _belgeTipiController.text = (model.tipi ?? 0) < 6 ? "Yurtiçi" : "Yurtdışı";
    _tarihController = TextEditingController(text: model.tarih.toDateString);
    _topluDepoController = TextEditingController(text: model.depoTanimi ?? model.topluDepo.toStringIfNotNull);
    _ozelKod2Controller = TextEditingController(
      text:
          parametreModel.listOzelKodTum
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
                builder:
                    (_) => Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(text: viewModel.model.cariKodu ?? ""),
                          const TextSpan(text: "  "),
                          TextSpan(text: viewModel.model.cariTitle, style: const TextStyle(color: ColorPalette.mantis)),
                        ],
                      ),
                    ),
              ),
              onTap: () async {
                final cariModel = await Get.toNamed(
                  "mainPage/cariRehberi",
                  arguments: CariListesiRequestModel(belgeTuru: model.getEditTipiEnum?.rawValue),
                );
                if (cariModel == null) return;
                final result = await networkManager.getCariModel(
                  CariRequestModel.fromCariListesiModel(cariModel)
                    ..secildi = "E"
                    ..kisitYok = true
                    ..teslimCari = "E"
                    ..eFaturaGoster = true,
                );
                if (result is CariListesiModel) {
                  _cariController.text = result.cariAdi ?? "";
                  _plasiyerController.text = result.plasiyerAciklama ?? "";
                  viewModel.model.cariTitle =
                      result.efaturaCarisi == "E"
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
            ),
            if (!(model.getEditTipiEnum?.gizlenecekAlanlar("kdv_dahil_haric") ?? false))
              CustomWidgetWithLabel(
                text: "KDV Dahil",
                isVertical: true,
                child: Observer(
                  builder:
                      (_) => Switch.adaptive(
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
