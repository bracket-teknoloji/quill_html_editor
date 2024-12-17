import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/ek_rehber_request_model.dart";
import "package:picker/core/base/view/genel_rehber/model/genel_rehber_model.dart";
import "package:picker/view/main_page/model/user_model/ek_rehberler_model.dart";

import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../core/constants/enum/edit_tipi_enum.dart";
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

final class BaseSiparislerGenelView extends StatefulWidget {
  const BaseSiparislerGenelView({super.key, required this.model});
  final BaseEditModel<SiparisEditRequestModel> model;

  @override
  State<BaseSiparislerGenelView> createState() => _BaseSiparislerGenelViewState();
}

final class _BaseSiparislerGenelViewState extends BaseState<BaseSiparislerGenelView> {
  final BaseSiparislerGenelViewModel viewModel = BaseSiparislerGenelViewModel();
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
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Form(
          key: StaticVariables.instance.siparisGenelFormKey,
          child: Padding(
            padding: UIHelper.lowPaddingOnlyTop,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Card(
                //   child: ListTile(
                //     onTap: () async => Get.toNamed(
                //       "/mainPage/eBelgePdf",
                //       arguments: EBelgeListesiModel(belgeTuru: widget.model.editTipiEnum?.rawValue, ebelgeTuru: "EFT", resmiBelgeNo: model.resmiBelgeNo ?? model.belgeNo ?? ""),
                //     ),
                //     contentPadding: UIHelper.lowPaddingHorizontal,
                //     leading: const Icon(Icons.info_outline),
                //     title: Text("E-Fatura Taslağı (${model.resmiBelgeNo})"),
                //     trailing: const Icon(Icons.open_in_new_outlined),
                //   ),
                // ).paddingOnly(bottom: UIHelper.lowSize).yetkiVarMi(model.cariEfaturami == "E"),
                Visibility(
                  visible: model.isRemoteTempBelgeNull && !yetkiController.kontrolluAktarBelgeTipleri(model.getEditTipiEnum?.rawValue),
                  child: CustomTextField(
                    enabled: enable,
                    labelText: "Belge No",
                    isMust: true,
                    controller: belgeNoController,
                    maxLength: 15,
                    suffix: IconButton(
                      onPressed: getBelgeNo,
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
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.cariKodu ?? "")),
                  onTap: () async {
                    final result = await Get.toNamed("mainPage/cariListesi", arguments: true);
                    if (result != null && result is CariListesiModel) {
                      model
                        ..cariAdi = result.cariAdi ?? ""
                        ..cariKodu = result.cariKodu ?? ""
                        ..vadeGunu = result.vadeGunu ?? 0;
                      cariController.text = result.cariAdi ?? "";
                      if (yetkiController.plasiyerUygulamasiAcikMi) {
                        model
                          ..plasiyerAciklama = result.plasiyerAciklama
                          ..plasiyerKodu = result.plasiyerKodu;
                        plasiyerController.text = result.plasiyerAciklama ?? result.plasiyerKodu ?? "";
                      }
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
                  suffix: yetkiController.cariTeslimCariSatisBaglanmisCarilerSecilsinMi
                      ? null
                      : IconButton(
                          onPressed: () async {
                            if (cariController.text.isEmpty) {
                              dialogManager.showAlertDialog("Önce Cari Seçiniz");
                              return;
                            }
                            final result = await Get.toNamed(
                              "mainPage/cariRehberi",
                              arguments: CariListesiRequestModel(
                                bagliCariKodu: model.cariKodu,
                                menuKodu: "CARI_CREH",
                                teslimCari: "E",
                                belgeTuru: widget.model.editTipiEnum?.rawValue,
                              ),
                            );
                            if (result != null && result is CariListesiModel) {
                              model
                                ..teslimCari = result.cariKodu
                                ..teslimCariAdi = result.cariAdi;
                              teslimCariController.text = result.cariAdi ?? "";
                            }
                          },
                          icon: const Icon(Icons.hub_outlined),
                        ),
                  onClear: () {
                    model
                      ..teslimCari = null
                      ..teslimCariAdi = null;
                    teslimCariController.clear();
                  },
                  onTap: !yetkiController.siparisFarkliTeslimCariAktif
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
                              teslimCariController.text = result.cariAdi ?? "";
                              plasiyerController.text = result.plasiyerAciklama ?? "";
                            }
                          } else {
                            if (cariController.text.isEmpty) {
                              dialogManager.showAlertDialog("Önce Cari Seçiniz");
                              return;
                            }
                            final result = await Get.toNamed(
                              "mainPage/cariRehberi",
                              arguments: CariListesiRequestModel(
                                bagliCariKodu: model.cariKodu,
                                menuKodu: "CARI_CREH",
                                teslimCari: "E",
                                belgeTuru: widget.model.editTipiEnum?.rawValue,
                              ),
                            );
                            if (result != null && result is CariListesiModel) {
                              model
                                ..teslimCari = result.cariKodu
                                ..teslimCariAdi = result.cariAdi;
                              teslimCariController.text = result.cariAdi ?? "";
                            }
                          }
                        },
                ).yetkiVarMi(yetkiController.siparisFarkliTeslimCariAktif && parametreModel.bagliCariVar == true),
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

                        // valueWidget: Observer(builder: (_) => Text(viewModel.model.belgeTipi.toStringIfNotNull ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showBelgeTipiBottomSheetDialog(context, model.belgeTipi);
                          if (result != null) {
                            model
                              ..belgeTipi = result.belgeTipiId
                              ..tipi = result.belgeTipiId;
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
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
                          if (result != null) {
                            viewModel.setPlasiyer(result);
                            model
                              ..plasiyerKodu = result.plasiyerKodu
                              ..plasiyerAciklama = result.plasiyerAciklama;
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
                          final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.tarih);
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
                          final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.teslimTarihi);
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
                          final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, viewModel.model.topluDepo);
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
                          final BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
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
                          final result = await bottomSheetDialogManager.showOdemeKoduBottomSheetDialog(context, viewModel.model.odemeKodu);
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
                          final result = await bottomSheetDialogManager.showKosullarBottomSheetDialog(context, viewModel.model.kosulKodu, null);
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
                          final ListOzelKodTum? result = await bottomSheetDialogManager.showOzelKod1BottomSheetDialog(context, viewModel.model.ozelKod1);
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
                          final ListOzelKodTum? result = await bottomSheetDialogManager.showOzelKod2BottomSheetDialog(context, viewModel.model.ozelKod2);
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
                    builder: (_) => Switch.adaptive(value: viewModel.kdvDahil, onChanged: widget.model.baseEditEnum != BaseEditEnum.goruntule ? viewModel.changeKdvDahil : null),
                  ),
                ).paddingAll(UIHelper.lowSize),
                CustomWidgetWithLabel(
                  text: "Ek Açıklamalar",
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(1) != null,
                        suffixMore: getEkRehberById(1) != null,
                        onTap: () async => await getGenelRehber(1),
                        onClear: () => viewModel.setAciklama(1, null),
                        onChanged: (value) => viewModel.setAciklama(1, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama1Adi ?? "")),
                        labelText: getEkRehberById(1)?.alan == "ACIK1"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK1")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi1 : parametreModel.alisEkAciklamaTanimi1) ?? "Açıklama 1",
                        controller: _aciklama1Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 1)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(2) != null,
                        onClear: () => viewModel.setAciklama(2, null),
                        suffixMore: getEkRehberById(2) != null,
                        onTap: () async => await getGenelRehber(2),
                        onChanged: (value) => viewModel.setAciklama(2, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama2Adi ?? "")),
                        labelText: getEkRehberById(2)?.alan == "ACIK2"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK2")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi2 : parametreModel.alisEkAciklamaTanimi2) ?? "Açıklama 2",
                        controller: _aciklama2Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 2)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(3) != null,
                        suffixMore: getEkRehberById(3) != null,
                        onClear: () => viewModel.setAciklama(3, null),
                        onChanged: (value) => viewModel.setAciklama(3, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama3Adi ?? "")),
                        labelText: getEkRehberById(3)?.alan == "ACIK3"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK3")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi3 : parametreModel.alisEkAciklamaTanimi3) ?? "Açıklama 3",
                        controller: _aciklama3Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 3)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(4) != null,
                        suffixMore: getEkRehberById(4) != null,
                        onClear: () => viewModel.setAciklama(4, null),
                        onTap: () async => await getGenelRehber(4),
                        onChanged: (value) => viewModel.setAciklama(4, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama4Adi ?? "")),
                        labelText: getEkRehberById(4)?.alan == "ACIK4"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK4")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi4 : parametreModel.alisEkAciklamaTanimi4) ?? "Açıklama 4",
                        controller: _aciklama4Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 4)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(5) != null,
                        suffixMore: getEkRehberById(5) != null,
                        onTap: () async => await getGenelRehber(5),
                        onClear: () => viewModel.setAciklama(5, null),
                        onChanged: (value) => viewModel.setAciklama(5, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama5Adi ?? "")),
                        labelText: getEkRehberById(5)?.alan == "ACIK5"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK5")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi5 : parametreModel.alisEkAciklamaTanimi5) ?? "Açıklama 5",
                        controller: _aciklama5Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 5)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(6) != null,
                        suffixMore: getEkRehberById(6) != null,
                        onTap: () async => await getGenelRehber(6),
                        onClear: () => viewModel.setAciklama(6, null),
                        onChanged: (value) => viewModel.setAciklama(6, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama6Adi ?? "")),
                        labelText: getEkRehberById(6)?.alan == "ACIK6"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK6")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi6 : parametreModel.alisEkAciklamaTanimi6) ?? "Açıklama 6",
                        controller: _aciklama6Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 6)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(7) != null,
                        suffixMore: getEkRehberById(7) != null,
                        onTap: () async => await getGenelRehber(7),
                        onClear: () => viewModel.setAciklama(7, null),
                        onChanged: (value) => viewModel.setAciklama(7, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama7Adi ?? "")),
                        labelText: getEkRehberById(7)?.alan == "ACIK7"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK7")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi7 : parametreModel.alisEkAciklamaTanimi7) ?? "Açıklama 7",
                        controller: _aciklama7Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 7)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(8) != null,
                        suffixMore: getEkRehberById(8) != null,
                        onClear: () => viewModel.setAciklama(8, null),
                        onTap: () async => await getGenelRehber(8),
                        onChanged: (value) => viewModel.setAciklama(8, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama8Adi ?? "")),
                        labelText: getEkRehberById(8)?.alan == "ACIK8"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK8")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi8 : parametreModel.alisEkAciklamaTanimi8) ?? "Açıklama 8",
                        controller: _aciklama8Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 8)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(9) != null,
                        suffixMore: getEkRehberById(9) != null,
                        onTap: () async => await getGenelRehber(9),
                        onClear: () => viewModel.setAciklama(9, null),
                        onChanged: (value) => viewModel.setAciklama(9, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama9Adi ?? "")),
                        labelText: getEkRehberById(9)?.alan == "ACIK9"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK9")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi9 : parametreModel.alisEkAciklamaTanimi9) ?? "Açıklama 9",
                        controller: _aciklama9Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 9)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(10) != null,
                        suffixMore: getEkRehberById(10) != null,
                        onTap: () async => await getGenelRehber(10),
                        onClear: () => viewModel.setAciklama(10, null),
                        onChanged: (value) => viewModel.setAciklama(10, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama10Adi ?? "")),
                        labelText: getEkRehberById(10)?.alan == "ACIK10"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK10")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi10 : parametreModel.alisEkAciklamaTanimi10) ?? "Açıklama 10",
                        controller: _aciklama10Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 10)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(11) != null,
                        suffixMore: getEkRehberById(11) != null,
                        onTap: () async => await getGenelRehber(11),
                        onClear: () => viewModel.setAciklama(11, null),
                        onChanged: (value) => viewModel.setAciklama(11, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama11Adi ?? "")),
                        labelText: getEkRehberById(11)?.alan == "ACIK11"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK11")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi11 : parametreModel.alisEkAciklamaTanimi11) ?? "Açıklama 11",
                        controller: _aciklama11Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 11)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(12) != null,
                        suffixMore: getEkRehberById(12) != null,
                        onTap: () async => await getGenelRehber(12),
                        onClear: () => viewModel.setAciklama(12, null),
                        onChanged: (value) => viewModel.setAciklama(12, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama12Adi ?? "")),
                        labelText: getEkRehberById(12)?.alan == "ACIK12"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK12")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi12 : parametreModel.alisEkAciklamaTanimi12) ?? "Açıklama 12",
                        controller: _aciklama12Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 12)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(13) != null,
                        suffixMore: getEkRehberById(13) != null,
                        onTap: () async => await getGenelRehber(13),
                        onClear: () => viewModel.setAciklama(13, null),
                        onChanged: (value) => viewModel.setAciklama(13, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama13Adi ?? "")),
                        labelText: getEkRehberById(13)?.alan == "ACIK13"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK13")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi13 : parametreModel.alisEkAciklamaTanimi13) ?? "Açıklama 13",
                        controller: _aciklama13Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 13)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(14) != null,
                        suffixMore: getEkRehberById(14) != null,
                        onTap: () async => await getGenelRehber(14),
                        onClear: () => viewModel.setAciklama(14, null),
                        onChanged: (value) => viewModel.setAciklama(14, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama14Adi ?? "")),
                        labelText: getEkRehberById(14)?.alan == "ACIK14"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK14")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi14 : parametreModel.alisEkAciklamaTanimi14) ?? "Açıklama 14",
                        controller: _aciklama14Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 14)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(15) != null,
                        suffixMore: getEkRehberById(15) != null,
                        onTap: () async => await getGenelRehber(15),
                        onClear: () => viewModel.setAciklama(15, null),
                        onChanged: (value) => viewModel.setAciklama(15, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama15Adi ?? "")),
                        labelText: getEkRehberById(15)?.alan == "ACIK15"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK15")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi15 : parametreModel.alisEkAciklamaTanimi15) ?? "Açıklama 15",
                        controller: _aciklama15Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 15)),
                      CustomTextField(
                        enabled: enable,
                        readOnly: getEkRehberById(16) != null,
                        suffixMore: getEkRehberById(16) != null,
                        onTap: () async => await getGenelRehber(16),
                        onClear: () => viewModel.setAciklama(16, null),
                        onChanged: (value) => viewModel.setAciklama(16, GenelRehberModel(kodu: value)),
                        labelText: getEkRehberById(16)?.alan == "ACIK16"
                            ? userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK16")?.baslik
                            : (satisMi ? parametreModel.satisEkAciklamaTanimi16 : parametreModel.alisEkAciklamaTanimi16) ?? "Açıklama 16",
                        controller: _aciklama16Controller,
                      ).yetkiVarMi(yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 16)),
                    ],
                  ),
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );

  Future<void> init() async {
    controllerFiller();

    if ((BaseSiparisEditModel.instance.belgeNo == null || widget.model.isKopyala) && !yetkiController.kontrolluAktarBelgeTipleri(model.getEditTipiEnum?.rawValue)) {
      await getBelgeNo();
    }
    controllerFiller();
  }

  bool get satisMi => model.getEditTipiEnum?.satisMi ?? false;

  Future<void> getBelgeNo() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      queryParameters: {"Seri": belgeNoController.text, "BelgeTipi": widget.model.editTipiEnum?.rawValue, "EIrsaliye": "H", "CariKodu": model.cariKodu ?? ""},
      showLoading: true,
    );
    if (result.isSuccess) {
      BaseSiparisEditModel.instance.belgeNo = result.dataList.firstOrNull?.belgeNo;
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
    plasiyerController.text = model.plasiyerAciklama ?? model.plasiyerKodu ?? "";
    tarihController.text = model.tarih.toDateString;
    teslimTarihController.text = model.teslimTarihi.toDateString;
    topluDepoController.text = yetkiController.lokalDepoUygulamasiAcikMi ? (model.depoTanimi ?? model.topluDepo.toStringIfNotNull) ?? "" : "";
    projeController.text = model.projeAciklama ?? model.projeKodu ?? "";
    odemeKoduController.text = model.odemeKodu ?? "";
    kosulController.text = model.kosulKodu ?? "";
    ozelKod1Controller.text = model.ozelKod1 ?? "";
    ozelKod2Controller.text =
        parametreModel.listOzelKodTum?.firstWhereOrNull((element) => element.belgeTipi == "S" && element.fiyatSirasi == 0 && element.kod == model.ozelKod2)?.aciklama ??
            model.ozelKod2 ??
            "";
    _aciklama1Controller.text = model.acik1 ?? "";
    _aciklama2Controller.text = model.acik2 ?? "";
    _aciklama3Controller.text = model.acik3 ?? "";
    _aciklama4Controller.text = model.acik4 ?? "";
    _aciklama5Controller.text = model.acik5 ?? "";
    _aciklama6Controller.text = model.acik6 ?? "";
    _aciklama7Controller.text = model.acik7 ?? "";
    _aciklama8Controller.text = model.acik8 ?? "";
    _aciklama9Controller.text = model.acik9 ?? "";
    _aciklama10Controller.text = model.acik10 ?? "";
    _aciklama11Controller.text = model.acik11 ?? "";
    _aciklama12Controller.text = model.acik12 ?? "";
    _aciklama13Controller.text = model.acik13 ?? "";
    _aciklama14Controller.text = model.acik14 ?? "";
    _aciklama15Controller.text = model.acik15 ?? "";
    _aciklama16Controller.text = model.acik16 ?? "";
    if (model.topluDepo != null) {
      topluDepoController.text = parametreModel.depoList?.firstWhereOrNull((element) => element.depoKodu == model.topluDepo)?.depoTanimi ?? "";
    }
    if (model.ozelKod2 != null) {
      ozelKod2Controller.text = parametreModel.listOzelKodTum?.firstWhereOrNull((element) => element.kod == model.ozelKod2)?.aciklama ?? "";
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
    _aciklama1Controller = TextEditingController();
    _aciklama2Controller = TextEditingController();
    _aciklama3Controller = TextEditingController();
    _aciklama4Controller = TextEditingController();
    _aciklama5Controller = TextEditingController();
    _aciklama6Controller = TextEditingController();
    _aciklama7Controller = TextEditingController();
    _aciklama8Controller = TextEditingController();
    _aciklama9Controller = TextEditingController();
    _aciklama10Controller = TextEditingController();
    _aciklama11Controller = TextEditingController();
    _aciklama12Controller = TextEditingController();
    _aciklama13Controller = TextEditingController();
    _aciklama14Controller = TextEditingController();
    _aciklama15Controller = TextEditingController();
    _aciklama16Controller = TextEditingController();
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

  EkRehberlerModel? getEkRehberById(int? id) =>
      userModel.ekRehberler?.firstWhereOrNull((element) => element.alan == "ACIK${id ?? ""}" && element.ekran == BaseSiparisEditModel.instance.getEditTipiEnum?.rawValue);

  Future<void> getGenelRehber(int? id) async {
    if (id == null) {
      dialogManager.showErrorSnackBar("ID bulunamadı.");
      return;
    }
    final siparisModel = BaseSiparisEditModel.instance;
    final ekRehberModel = getEkRehberById(id);
    if (ekRehberModel != null) {
      var result = await Get.toNamed(
        "mainPage/genelRehber",
        arguments: EkRehberRequestModel(
          belgeNo: siparisModel.belgeNo,
          belgeTipi: siparisModel.getEditTipiEnum?.rawValue,
          belgeTarihi: siparisModel.tarih,
          id: ekRehberModel.id,
          cariKodu: siparisModel.cariKodu,
          baslik: ekRehberModel.baslik,
          rehberKodu: 8,
        ),
      );
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
    // TODO: Bu eklenebilir ama şu anlık işlevsiz. GetGenelRehber isteği atılması lazım.
    if (getEkRehberById(id) == null) return null;
    return getEkRehberById(id)!.baslik;
  }
}
