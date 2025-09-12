import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/ek_rehber_request_model.dart";
import "package:picker/core/base/view/genel_rehber/model/genel_rehber_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/view/main_page/model/user_model/ek_rehberler_model.dart";

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
  late final TextEditingController _teslimTarihController;
  late final TextEditingController _topluDepoController;
  late final TextEditingController _ozelKod1Controller;
  late final TextEditingController _ozelKod2Controller;
  late final TextEditingController _kosulController;
  late final TextEditingController _odemeKoduController;
  late final TextEditingController _exportTipiController;
  late final TextEditingController _exportRefNoController;
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
    _belgeTipiController.text = model.yurticiMi ? "Yurtiçi" : "Yurtdışı";
    _tarihController = TextEditingController(text: model.tarih.toDateString);
    _teslimTarihController = TextEditingController(text: model.teslimTarihi.toDateString);
    _topluDepoController = TextEditingController(text: model.depoTanimi ?? model.topluDepo.toStringIfNotNull);
    _ozelKod1Controller = TextEditingController(
      text:
          parametreModel.listOzelKodTum
              ?.firstWhereOrNull(
                (element) =>
                    element.belgeTipi == model.getEditTipiEnum?.rawValue &&
                    element.fiyatSirasi == 0 &&
                    element.kod == model.ozelKod1,
              )
              ?.aciklama ??
          model.ozelKod1,
    );
    _ozelKod2Controller = TextEditingController(
      text:
          parametreModel.listOzelKodTum
              ?.firstWhereOrNull(
                (element) =>
                    element.belgeTipi == model.getEditTipiEnum?.rawValue &&
                    element.fiyatSirasi == 0 &&
                    element.kod == model.ozelKod2,
              )
              ?.aciklama ??
          model.ozelKod2,
    );
    _kosulController = TextEditingController(text: model.kosulKodu);
    _odemeKoduController = TextEditingController(text: model.odemeKodu);
    _exportRefNoController = TextEditingController(text: model.exportrefno);
    _exportTipiController = TextEditingController(
      text: viewModel.ihracatTipi.entries.firstWhereOrNull((element) => element.value == model.exportTipi)?.key ?? "",
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
    _teslimTarihController.dispose();
    _topluDepoController.dispose();
    _ozelKod1Controller.dispose();
    _ozelKod2Controller.dispose();
    _kosulController.dispose();
    _odemeKoduController.dispose();
    _exportRefNoController.dispose();
    _exportTipiController.dispose();
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
                  _plasiyerController.text = result.plasiyerAlani ?? "";
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
                            _plasiyerController.text = result.plasiyerAlani ?? "";
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
                          _plasiyerController.text = result.plasiyerAlani ?? "";
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
                          if ((result.belgeTipiId ?? 0) < 6) {
                            _exportTipiController.clear();
                            _exportRefNoController.clear();
                            viewModel
                              ..setExportTipi(null)
                              ..setExportRefNo(null);
                          }
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
            CustomTextField(
              enabled: enable,
              labelText: "Teslim Tarihi",
              isMust: true,
              isDateTime: true,
              readOnly: true,
              onTap: () async {
                final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.teslimTarihi);
                if (result != null) {
                  model.teslimTarihi = result;
                  _teslimTarihController.text = result.toDateString;
                }
              },
              controller: _teslimTarihController,
            ),
            Observer(
              builder: (_) {
                if (viewModel.model.yurticiMi) return const SizedBox.shrink();
                return Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "İhracat Tipi",
                        readOnly: true,
                        isMust: true,
                        suffixMore: true,
                        controller: _exportTipiController,
                        valueWidget: Observer(
                          builder: (_) => Text(viewModel.model.exportTipi.toStringIfNotNull ?? ""),
                        ),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                            context,
                            title: "İhracat Tipi",
                            groupValue: viewModel.model.exportTipi,
                            children: viewModel.ihracatTipi.entries
                                .map(
                                  (e) => BottomSheetModel(
                                    title: e.key,
                                    description: e.value.toString(),
                                    value: e,
                                    groupValue: e.value,
                                  ),
                                )
                                .toList(),
                          );
                          if (result != null) {
                            viewModel.setExportTipi(result);
                            _exportTipiController.text = result.key;
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Export Ref. No",
                        enabled: enable,
                        controller: _exportRefNoController,
                        onChanged: (value) => viewModel.setExportRefNo(value),
                      ),
                    ),
                  ],
                );
              },
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
            if (yetkiController.kosulAktif(model.getEditTipiEnum))
              CustomTextField(
                enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("OdemeKodu") ?? false),
                labelText: "Ödeme Kodu",
                readOnly: true,
                suffixMore: true,
                controller: _odemeKoduController,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.odemeKodu ?? "")),
                onTap: () async {
                  final result = await bottomSheetDialogManager.showOdemeKoduBottomSheetDialog(
                    context,
                    viewModel.model.odemeKodu,
                  );
                  if (result is ListCariOdemeKodu) {
                    viewModel.setOdemeKodu(result.odemeKodu);
                    _odemeKoduController.text = result.aciklama ?? "";
                  }
                },
              ),
            if (yetkiController.kosulAktif(model.getEditTipiEnum))
              CustomTextField(
                enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("kosul") ?? false),
                labelText: "Koşul",
                readOnly: true,
                isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("kosul") ?? false,
                suffixMore: true,
                controller: _kosulController,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.kosulKodu ?? "")),
                onTap: () async {
                  final result = await bottomSheetDialogManager.showKosullarBottomSheetDialog(
                    context,
                    viewModel.model.kosulKodu,
                    null,
                    model.getEditTipiEnum,
                  );
                  if (result != null) {
                    viewModel.setKosulKodu(result);
                    _kosulController.text = result.genelKosulAdi ?? result.kosulKodu ?? "";
                  }
                },
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                if (yetkiController.ebelgeOzelKod1AktifMi(model.getEditTipiEnum) &&
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

                if (yetkiController.ebelgeOzelKod2AktifMi(model.getEditTipiEnum) &&
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
                  ).yetkiVarMi(yetkiController.ebelgeOzelKod2AktifMi(model.getEditTipiEnum)),
              ],
            ),
            if (!(model.getEditTipiEnum?.gizlenecekAlanlar("kdv_dahil_haric") ?? false) &&
                taltekParam?.kdvDahilHaricSor == "E")
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
            if (model.getEditTipiEnum?.aciklamalarGorunecekMi(0) ?? false)
              CustomWidgetWithLabel(
                text: "Ek Açıklamalar",
                child: Column(
                  children: <Widget>[
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(1) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(1) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A1") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A1") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A1"),
                        suffixMore: getEkRehberById(1) != null,
                        readOnly: getEkRehberById(1) != null,
                        onClear: () => viewModel.setAciklama(1, null),
                        onTap: () async => await getGenelRehber(1),
                        onChanged: (value) => viewModel.setAciklama(1, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar1 ?? "Açıklama 1",
                        controller: _aciklama1Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(2) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(2) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A2") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A2") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A2"),
                        suffixMore: getEkRehberById(2) != null,
                        readOnly: getEkRehberById(2) != null,
                        onClear: () => viewModel.setAciklama(2, null),
                        onTap: () async => await getGenelRehber(2),
                        onChanged: (value) => viewModel.setAciklama(2, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar2 ?? "Açıklama 2",
                        controller: _aciklama2Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(3) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(3) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A3") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A3") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A3"),
                        suffixMore: getEkRehberById(3) != null,
                        readOnly: getEkRehberById(3) != null,
                        onClear: () => viewModel.setAciklama(3, null),
                        onTap: () async => await getGenelRehber(3),
                        onChanged: (value) => viewModel.setAciklama(3, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar3 ?? "Açıklama 3",
                        controller: _aciklama3Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(4) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(4) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A4") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A4") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A4"),
                        suffixMore: getEkRehberById(4) != null,
                        readOnly: getEkRehberById(4) != null,
                        onClear: () => viewModel.setAciklama(4, null),
                        onTap: () async => await getGenelRehber(4),
                        onChanged: (value) => viewModel.setAciklama(4, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar4 ?? "Açıklama 4",
                        controller: _aciklama4Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(5) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(5) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A5") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A5") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A5"),
                        suffixMore: getEkRehberById(5) != null,
                        readOnly: getEkRehberById(5) != null,
                        onClear: () => viewModel.setAciklama(5, null),
                        onTap: () async => await getGenelRehber(5),
                        onChanged: (value) => viewModel.setAciklama(5, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar5 ?? "Açıklama 5",
                        controller: _aciklama5Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(6) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(6) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A6") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A6") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A6"),
                        suffixMore: getEkRehberById(6) != null,
                        readOnly: getEkRehberById(6) != null,
                        onClear: () => viewModel.setAciklama(6, null),
                        onTap: () async => await getGenelRehber(6),
                        onChanged: (value) => viewModel.setAciklama(6, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar6 ?? "Açıklama 6",
                        controller: _aciklama6Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(7) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(7) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A7") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A7") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A7"),
                        suffixMore: getEkRehberById(12) != null,
                        readOnly: getEkRehberById(12) != null,
                        onClear: () => viewModel.setAciklama(12, null),
                        onTap: () async => await getGenelRehber(12),
                        onChanged: (value) => viewModel.setAciklama(7, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar7 ?? "Açıklama 7",
                        controller: _aciklama7Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(8) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(8) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A8") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A8") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A8"),
                        suffixMore: getEkRehberById(8) != null,
                        readOnly: getEkRehberById(8) != null,
                        onClear: () => viewModel.setAciklama(8, null),
                        onTap: () async => await getGenelRehber(8),
                        onChanged: (value) => viewModel.setAciklama(8, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar8 ?? "Açıklama 8",
                        controller: _aciklama8Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(9) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(9) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A9") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A9") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A9"),
                        suffixMore: getEkRehberById(9) != null,
                        readOnly: getEkRehberById(9) != null,
                        onClear: () => viewModel.setAciklama(9, null),
                        onTap: () async => await getGenelRehber(9),
                        onChanged: (value) => viewModel.setAciklama(9, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar9 ?? "Açıklama 9",
                        controller: _aciklama9Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(10) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(10) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A10") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A10") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A10"),
                        suffixMore: getEkRehberById(10) != null,
                        readOnly: getEkRehberById(10) != null,
                        onClear: () => viewModel.setAciklama(10, null),
                        onTap: () async => await getGenelRehber(10),
                        onChanged: (value) => viewModel.setAciklama(10, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar10 ?? "Açıklama 10",
                        controller: _aciklama10Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(11) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(11) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A11") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A11") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A11"),
                        suffixMore: getEkRehberById(11) != null,
                        readOnly: getEkRehberById(11) != null,
                        onClear: () => viewModel.setAciklama(11, null),
                        onTap: () async => await getGenelRehber(11),
                        onChanged: (value) => viewModel.setAciklama(11, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar11 ?? "Açıklama 11",
                        controller: _aciklama11Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(12) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(12) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A12") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A12") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A12"),
                        suffixMore: getEkRehberById(12) != null,
                        readOnly: getEkRehberById(12) != null,
                        onClear: () => viewModel.setAciklama(12, null),
                        onTap: () async => await getGenelRehber(12),
                        onChanged: (value) => viewModel.setAciklama(12, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar12 ?? "Açıklama 12",
                        controller: _aciklama12Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(13) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(13) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A13") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A13") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A13"),
                        suffixMore: getEkRehberById(13) != null,
                        readOnly: getEkRehberById(13) != null,
                        onClear: () => viewModel.setAciklama(13, null),
                        onTap: () async => await getGenelRehber(13),
                        onChanged: (value) => viewModel.setAciklama(13, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar13 ?? "Açıklama 13",
                        controller: _aciklama13Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(14) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(14) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A14") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A14") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A14"),
                        suffixMore: getEkRehberById(14) != null,
                        readOnly: getEkRehberById(14) != null,
                        onClear: () => viewModel.setAciklama(14, null),
                        onTap: () async => await getGenelRehber(14),
                        onChanged: (value) => viewModel.setAciklama(14, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar14 ?? "Açıklama 14",
                        controller: _aciklama14Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(15) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(15) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A15") ?? false))
                      CustomTextField(
                        enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A15") ?? false),
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A15"),
                        suffixMore: getEkRehberById(15) != null,
                        readOnly: getEkRehberById(15) != null,
                        onClear: () => viewModel.setAciklama(15, null),
                        onTap: () async => await getGenelRehber(15),
                        onChanged: (value) => viewModel.setAciklama(15, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar15 ?? "Açıklama 15",
                        controller: _aciklama15Controller,
                      ),
                    if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(16) ?? false) &&
                        yetkiController.talepTeklifSatisTeklifiAciklamaAlanlari(16) &&
                        !(model.getEditTipiEnum?.gizlenecekAlanlar("A16") ?? false))
                      CustomTextField(
                        enabled: enable,
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A16"),
                        suffixMore: getEkRehberById(16) != null,
                        readOnly: getEkRehberById(16) != null,
                        onClear: () => viewModel.setAciklama(16, null),
                        onTap: () async => await getGenelRehber(16),
                        onChanged: (value) => viewModel.setAciklama(16, GenelRehberModel(kodu: value)),
                        maxLength: StaticVariables.maxAciklamaLength,
                        labelText: taltekParam?.aciklar16 ?? "Açıklama 16",
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

  EkRehberlerModel? getEkRehberById(int? id) {
    if (userModel.ekRehberler.ext.isNullOrEmpty) return null;
    if ((model.getEditTipiEnum?.fiyatGrubuGorunsunMu ?? false) &&
        parametreModel.satisFiyatGrubuSorulacakAlan == id.toStringIfNotNull) {
      return EkRehberlerModel(alan: "ACIK${id ?? ""}", baslik: "Fiyat Grubu");
    }
    return userModel.ekRehberler?.firstWhereOrNull(
      (element) =>
          element.alan == "ACIK${id ?? ""}" && element.ekran == BaseSiparisEditModel.instance.getEditTipiEnum?.rawValue,
    );
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
    final isFiyatGrubu =
        (model.getEditTipiEnum?.fiyatGrubuGorunsunMu ?? false) &&
        parametreModel.satisFiyatGrubuSorulacakAlan == id.toStringIfNotNull;
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
}
