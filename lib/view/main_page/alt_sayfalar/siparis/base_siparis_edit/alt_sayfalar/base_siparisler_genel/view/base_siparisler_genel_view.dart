import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
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
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../model/param_model.dart";
import "../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../siparisler/model/siparis_edit_request_model.dart";
import "../../../model/base_siparis_edit_model.dart";
import "../view_model/base_siparisler_genel_view_model.dart";

final class BaseSiparislerGenelView extends StatefulWidget {
  const BaseSiparislerGenelView({required this.model, super.key});
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible:
                  model.isRemoteTempBelgeNull &&
                  !yetkiController.kontrolluAktarBelgeTipleri(model.getEditTipiEnum?.rawValue),
              child: CustomTextField(
                enabled: enable,
                labelText: "Belge No",
                isMust: true,
                controller: belgeNoController,
                maxLength: 15,
                suffix: IconButton(onPressed: getBelgeNo, icon: const Icon(Icons.format_list_numbered_rtl_outlined)),
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
                    ..vadeGunu = result.vadeGunu
                    ..vadeTarihi = DateTime.now().add(Duration(days: result.vadeGunu ?? 0)).dateTimeWithoutTime;
                  cariController.text = result.cariAdi ?? "";
                  if (yetkiController.plasiyerUygulamasiAcikMi) {
                    model
                      ..plasiyerAciklama = result.plasiyerAciklama
                      ..plasiyerKodu = result.plasiyerKodu;
                    plasiyerController.text = result.plasiyerAciklama ?? result.plasiyerKodu ?? "";
                  }
                  if (!yetkiController.siparisFarkliTeslimCariAktif(model.getEditTipiEnum)) {
                    cariController.text = result.cariAdi ?? "";
                    model.teslimCariAdi = result.cariAdi;
                  }
                }
              },
            ),
            if (yetkiController.siparisFarkliTeslimCariAktif(model.getEditTipiEnum) &&
                parametreModel.bagliCariVar == true)
              CustomTextField(
                enabled: enable && yetkiController.siparisFarkliTeslimCariAktif(model.getEditTipiEnum),
                labelText: "Teslim Cari",
                readOnly: true,
                suffixMore: true,
                controller: teslimCariController,
                suffix:
                    yetkiController.cariTeslimCariSatisBaglanmisCarilerSecilsinMi
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
                onTap:
                    !yetkiController.siparisFarkliTeslimCariAktif(model.getEditTipiEnum)
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

                    // valueWidget: Observer(builder: (_) => Text(viewModel.model.belgeTipi.toStringIfNotNull ?? "")),
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showBelgeTipiBottomSheetDialog(
                        context,
                        model.belgeTipi,
                      );
                      if (result != null) {
                        model
                          ..belgeTipi = result.belgeTipiId
                          ..tipi = result.belgeTipiId;
                        belgeTipiController.text = result.belgeTipi ?? "";
                      }
                    },
                  ),
                ),
                if (yetkiController.plasiyerUygulamasiAcikMi)
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
                        final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
                          context,
                          viewModel.model.plasiyerKodu,
                        );
                        if (result != null) {
                          viewModel.setPlasiyer(result);
                          model
                            ..plasiyerKodu = result.plasiyerKodu
                            ..plasiyerAciklama = result.plasiyerAciklama;
                          plasiyerController.text = result.plasiyerAciklama ?? "";
                        }
                      },
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
                if (yetkiController.lokalDepoUygulamasiAcikMi &&
                    (yetkiController.topluDepoKullan(model.getEditTipiEnum)))
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
                        final result = await bottomSheetDialogManager.showTopluDepoBottomSheetDialog(
                          context,
                          viewModel.model.topluDepo,
                        );
                        if (result is DepoList) {
                          viewModel.setTopluDepoKodu(result.depoKodu);
                          topluDepoController.text = result.depoTanimi ?? result.depoKodu.toStringIfNotNull ?? "";
                        }
                      },
                    ),
                  ),
                if (yetkiController.projeUygulamasiAcikMi)
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
                        final BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(
                          context,
                          viewModel.model.projeKodu,
                        );
                        if (result is BaseProjeModel) {
                          viewModel.setProjeKodu(result);
                          projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
                        }
                      },
                    ),
                  ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (yetkiController.siparisKosulAktifMi(model.getEditTipiEnum))
                  Expanded(
                    child: CustomTextField(
                      enabled: enable,
                      labelText: "Ödeme Kodu",
                      readOnly: true,
                      suffixMore: true,
                      controller: odemeKoduController,
                      valueWidget: Observer(builder: (_) => Text(viewModel.model.odemeKodu ?? "")),
                      onTap: () async {
                        final result = await bottomSheetDialogManager.showOdemeKoduBottomSheetDialog(
                          context,
                          viewModel.model.odemeKodu,
                        );
                        if (result is ListCariOdemeKodu) {
                          viewModel.setOdemeKodu(result.odemeKodu);
                          odemeKoduController.text = result.aciklama ?? "";
                        }
                      },
                    ),
                  ),
                if (yetkiController.siparisKosulAktifMi(model.getEditTipiEnum))
                  Expanded(
                    child: CustomTextField(
                      enabled: enable,
                      labelText: "Koşul",
                      readOnly: true,
                      suffixMore: true,
                      controller: kosulController,
                      valueWidget: Observer(builder: (_) => Text(viewModel.model.kosulKodu ?? "")),
                      onTap: () async {
                        final result = await bottomSheetDialogManager.showKosullarBottomSheetDialog(
                          context,
                          viewModel.model.kosulKodu,
                          null,
                        );
                        if (result != null) {
                          viewModel.setKosulKodu(result.kosulKodu);
                          kosulController.text = result.genelKosulAdi ?? result.kosulKodu ?? "";
                        }
                      },
                    ),
                  ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (yetkiController.satisOzelKod1AktifMi)
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
                        final result = await bottomSheetDialogManager.showOzelKod1BottomSheetDialog(
                          context,
                          viewModel.model.ozelKod1,
                        );
                        if (result != null) {
                          ozelKod1Controller.text = result.aciklama ?? "";
                          viewModel.setOzelKod1(result.kod);
                          if (model.kalemList.ext.isNotNullOrEmpty) {
                            await dialogManager.showAreYouSureDialog(() async {
                              final isSuccess = await viewModel.fiyatGuncelle();
                              if (isSuccess) {
                                dialogManager.showSuccesDialog("Fiyatlar Güncellendi");
                              }
                            }, title: "Özel kod değiştirildi, fiyatları güncellemek istiyor musunuz?");
                          }
                        }
                      },
                    ),
                  ),
                if (yetkiController.satisOzelKod2AktifMi)
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
                        final ListOzelKodTum? result = await bottomSheetDialogManager.showOzelKod2BottomSheetDialog(
                          context,
                          viewModel.model.ozelKod2,
                        );
                        if (result != null) {
                          viewModel.setOzelKod2(result.kod);
                          ozelKod2Controller.text = result.aciklama ?? result.kod ?? "";
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
                builder:
                    (_) => Switch.adaptive(
                      value: viewModel.kdvDahil,
                      onChanged: widget.model.baseEditEnum != BaseEditEnum.goruntule ? viewModel.changeKdvDahil : null,
                    ),
              ),
            ).paddingAll(UIHelper.lowSize),
            if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 0))
              CustomWidgetWithLabel(
                text: "Ek Açıklamalar",
                child: Column(
                  children: <Widget>[
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 1))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(1) != null,
                        suffixMore: getEkRehberById(1) != null,
                        onTap: () async => await getGenelRehber(1),
                        onClear: () => viewModel.setAciklama(1, null),
                        onChanged: (value) => viewModel.setAciklama(1, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama1Adi ?? "")),
                        labelText:
                            getEkRehberById(1)?.alan == "ACIK1"
                                ? getEkRehberById(1)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi1
                                        : parametreModel.alisEkAciklamaTanimi1) ??
                                    "Açıklama 1",
                        controller: _aciklama1Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 2))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(2) != null,
                        onClear: () => viewModel.setAciklama(2, null),
                        suffixMore: getEkRehberById(2) != null,
                        onTap: () async => await getGenelRehber(2),
                        onChanged: (value) => viewModel.setAciklama(2, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama2Adi ?? "")),
                        labelText:
                            getEkRehberById(2)?.alan == "ACIK2"
                                ? getEkRehberById(2)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi2
                                        : parametreModel.alisEkAciklamaTanimi2) ??
                                    "Açıklama 2",
                        controller: _aciklama2Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 3))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(3) != null,
                        suffixMore: getEkRehberById(3) != null,
                        onClear: () => viewModel.setAciklama(3, null),
                        onChanged: (value) => viewModel.setAciklama(3, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama3Adi ?? "")),
                        labelText:
                            getEkRehberById(3)?.alan == "ACIK3"
                                ? getEkRehberById(3)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi3
                                        : parametreModel.alisEkAciklamaTanimi3) ??
                                    "Açıklama 3",
                        controller: _aciklama3Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 4))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(4) != null,
                        suffixMore: getEkRehberById(4) != null,
                        onClear: () => viewModel.setAciklama(4, null),
                        onTap: () async => await getGenelRehber(4),
                        onChanged: (value) => viewModel.setAciklama(4, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama4Adi ?? "")),
                        labelText:
                            getEkRehberById(4)?.alan == "ACIK4"
                                ? getEkRehberById(4)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi4
                                        : parametreModel.alisEkAciklamaTanimi4) ??
                                    "Açıklama 4",
                        controller: _aciklama4Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 5))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(5) != null,
                        suffixMore: getEkRehberById(5) != null,
                        onTap: () async => await getGenelRehber(5),
                        onClear: () => viewModel.setAciklama(5, null),
                        onChanged: (value) => viewModel.setAciklama(5, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama5Adi ?? "")),
                        labelText:
                            getEkRehberById(5)?.alan == "ACIK5"
                                ? getEkRehberById(5)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi5
                                        : parametreModel.alisEkAciklamaTanimi5) ??
                                    "Açıklama 5",
                        controller: _aciklama5Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 6))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(6) != null,
                        suffixMore: getEkRehberById(6) != null,
                        onTap: () async => await getGenelRehber(6),
                        onClear: () => viewModel.setAciklama(6, null),
                        onChanged: (value) => viewModel.setAciklama(6, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama6Adi ?? "")),
                        labelText:
                            getEkRehberById(6)?.alan == "ACIK6"
                                ? getEkRehberById(6)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi6
                                        : parametreModel.alisEkAciklamaTanimi6) ??
                                    "Açıklama 6",
                        controller: _aciklama6Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 7))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(7) != null,
                        suffixMore: getEkRehberById(7) != null,
                        onTap: () async => await getGenelRehber(7),
                        onClear: () => viewModel.setAciklama(7, null),
                        onChanged: (value) => viewModel.setAciklama(7, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama7Adi ?? "")),
                        labelText:
                            getEkRehberById(7)?.alan == "ACIK7"
                                ? getEkRehberById(7)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi7
                                        : parametreModel.alisEkAciklamaTanimi7) ??
                                    "Açıklama 7",
                        controller: _aciklama7Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 8))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(8) != null,
                        suffixMore: getEkRehberById(8) != null,
                        onClear: () => viewModel.setAciklama(8, null),
                        onTap: () async => await getGenelRehber(8),
                        onChanged: (value) => viewModel.setAciklama(8, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama8Adi ?? "")),
                        labelText:
                            getEkRehberById(8)?.alan == "ACIK8"
                                ? getEkRehberById(8)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi8
                                        : parametreModel.alisEkAciklamaTanimi8) ??
                                    "Açıklama 8",
                        controller: _aciklama8Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 9))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(9) != null,
                        suffixMore: getEkRehberById(9) != null,
                        onTap: () async => await getGenelRehber(9),
                        onClear: () => viewModel.setAciklama(9, null),
                        onChanged: (value) => viewModel.setAciklama(9, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama9Adi ?? "")),
                        labelText:
                            getEkRehberById(9)?.alan == "ACIK9"
                                ? getEkRehberById(9)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi9
                                        : parametreModel.alisEkAciklamaTanimi9) ??
                                    "Açıklama 9",
                        controller: _aciklama9Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 10))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(10) != null,
                        suffixMore: getEkRehberById(10) != null,
                        onTap: () async => await getGenelRehber(10),
                        onClear: () => viewModel.setAciklama(10, null),
                        onChanged: (value) => viewModel.setAciklama(10, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama10Adi ?? "")),
                        labelText:
                            getEkRehberById(10)?.alan == "ACIK10"
                                ? getEkRehberById(10)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi10
                                        : parametreModel.alisEkAciklamaTanimi10) ??
                                    "Açıklama 10",
                        controller: _aciklama10Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 11))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(11) != null,
                        suffixMore: getEkRehberById(11) != null,
                        onTap: () async => await getGenelRehber(11),
                        onClear: () => viewModel.setAciklama(11, null),
                        onChanged: (value) => viewModel.setAciklama(11, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama11Adi ?? "")),
                        labelText:
                            getEkRehberById(11)?.alan == "ACIK11"
                                ? getEkRehberById(11)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi11
                                        : parametreModel.alisEkAciklamaTanimi11) ??
                                    "Açıklama 11",
                        controller: _aciklama11Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 12))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(12) != null,
                        suffixMore: getEkRehberById(12) != null,
                        onTap: () async => await getGenelRehber(12),
                        onClear: () => viewModel.setAciklama(12, null),
                        onChanged: (value) => viewModel.setAciklama(12, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama12Adi ?? "")),
                        labelText:
                            getEkRehberById(12)?.alan == "ACIK12"
                                ? getEkRehberById(12)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi12
                                        : parametreModel.alisEkAciklamaTanimi12) ??
                                    "Açıklama 12",
                        controller: _aciklama12Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 13))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(13) != null,
                        suffixMore: getEkRehberById(13) != null,
                        onTap: () async => await getGenelRehber(13),
                        onClear: () => viewModel.setAciklama(13, null),
                        onChanged: (value) => viewModel.setAciklama(13, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama13Adi ?? "")),
                        labelText:
                            getEkRehberById(13)?.alan == "ACIK13"
                                ? getEkRehberById(13)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi13
                                        : parametreModel.alisEkAciklamaTanimi13) ??
                                    "Açıklama 13",
                        controller: _aciklama13Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 14))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(14) != null,
                        suffixMore: getEkRehberById(14) != null,
                        onTap: () async => await getGenelRehber(14),
                        onClear: () => viewModel.setAciklama(14, null),
                        onChanged: (value) => viewModel.setAciklama(14, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama14Adi ?? "")),
                        labelText:
                            getEkRehberById(14)?.alan == "ACIK14"
                                ? getEkRehberById(14)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi14
                                        : parametreModel.alisEkAciklamaTanimi14) ??
                                    "Açıklama 14",
                        controller: _aciklama14Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 15))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(15) != null,
                        suffixMore: getEkRehberById(15) != null,
                        onTap: () async => await getGenelRehber(15),
                        onClear: () => viewModel.setAciklama(15, null),
                        onChanged: (value) => viewModel.setAciklama(15, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama5Adi ?? "")),
                        labelText:
                            getEkRehberById(15)?.alan == "ACIK15"
                                ? getEkRehberById(15)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi15
                                        : parametreModel.alisEkAciklamaTanimi15) ??
                                    "Açıklama 15",
                        controller: _aciklama15Controller,
                      ),
                    if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 16))
                      CustomTextField(
                        enabled: enable,
                        maxLength: StaticVariables.maxAciklamaLength,
                        readOnly: getEkRehberById(16) != null,
                        suffixMore: getEkRehberById(16) != null,
                        onTap: () async => await getGenelRehber(16),
                        onClear: () => viewModel.setAciklama(16, null),
                        onChanged: (value) => viewModel.setAciklama(16, GenelRehberModel(kodu: value)),
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.aciklama6Adi ?? "")),
                        labelText:
                            getEkRehberById(16)?.alan == "ACIK16"
                                ? getEkRehberById(16)?.baslik
                                : (satisMi
                                        ? parametreModel.satisEkAciklamaTanimi16
                                        : parametreModel.alisEkAciklamaTanimi16) ??
                                    "Açıklama 16",
                        controller: _aciklama16Controller,
                      ),
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

    if ((BaseSiparisEditModel.instance.belgeNo == null || widget.model.isKopyala) &&
        !yetkiController.kontrolluAktarBelgeTipleri(model.getEditTipiEnum?.rawValue)) {
      await getBelgeNo();
    }
    controllerFiller();
  }

  bool get satisMi => model.getEditTipiEnum?.satisMi ?? false;

  Future<void> getBelgeNo() async {
    final result = await networkManager.dioGet<BaseSiparisEditModel>(
      path: ApiUrls.getSiradakiBelgeNo,
      bodyModel: BaseSiparisEditModel(),
      queryParameters: {
        "Seri": belgeNoController.text,
        "BelgeTipi": widget.model.editTipiEnum?.rawValue,
        "EIrsaliye": "H",
        "CariKodu": model.cariKodu ?? "",
      },
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
    topluDepoController.text =
        yetkiController.lokalDepoUygulamasiAcikMi ? (model.depoTanimi ?? model.topluDepo.toStringIfNotNull) ?? "" : "";
    projeController.text = model.projeAciklama ?? model.projeKodu ?? "";
    odemeKoduController.text = model.odemeKodu ?? "";
    kosulController.text = model.kosulKodu ?? "";
    ozelKod1Controller.text = model.ozelKod1 ?? "";
    ozelKod2Controller.text =
        parametreModel.listOzelKodTum
            ?.firstWhereOrNull(
              (element) => element.belgeTipi == "S" && element.fiyatSirasi == 0 && element.kod == model.ozelKod2,
            )
            ?.aciklama ??
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
      topluDepoController.text =
          parametreModel.depoList?.firstWhereOrNull((element) => element.depoKodu == model.topluDepo)?.depoTanimi ?? "";
    }
    if (model.ozelKod2 != null) {
      ozelKod2Controller.text =
          parametreModel.listOzelKodTum?.firstWhereOrNull((element) => element.kod == model.ozelKod2)?.aciklama ?? "";
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

  String? getAciklama(int? id) {
    // TODO: Bu eklenebilir ama şu anlık işlevsiz. GetGenelRehber isteği atılması lazım.
    if (getEkRehberById(id) == null) return null;
    return getEkRehberById(id)!.baslik;
  }
}
