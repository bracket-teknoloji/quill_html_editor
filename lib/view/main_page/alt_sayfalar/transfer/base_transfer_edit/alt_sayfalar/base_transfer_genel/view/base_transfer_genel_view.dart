import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../model/param_model.dart";
import "../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
// import "../../../../../../../model/param_model.dart";
// import "../../../../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
// import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
// import "../../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../view_model/base_transfer_genel_view_model.dart";

class BaseTransferGenelView extends StatefulWidget {
  final BaseEditModel<SiparisEditRequestModel> model;
  const BaseTransferGenelView({super.key, required this.model});

  @override
  State<BaseTransferGenelView> createState() => BaseTransferGenelViewState();
}

class BaseTransferGenelViewState extends BaseState<BaseTransferGenelView> {
  BaseEditModel<SiparisEditRequestModel> get siparisModel => widget.model;
  BaseTransferGenelViewModel viewModel = BaseTransferGenelViewModel();
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  bool get isEkle => siparisModel.isEkle || siparisModel.isKopyala || siparisModel.isRevize;
  bool get enable => widget.model.enable;
  TalTekParam? get taltekParam => parametreModel.talTekParam?.firstWhereOrNull((element) => element.belgeTipi == model.belgeTuru);

  late final TextEditingController _belgeNoController;
  late final TextEditingController _cariController;
  late final TextEditingController _gidecegiSubeController;
  late final TextEditingController _teslimCariController;
  late final TextEditingController _hareketTuruController;
  late final TextEditingController _tarihController;
  late final TextEditingController _topluGirisDepoController;
  late final TextEditingController _topluCikisDepoController;
  late final TextEditingController _ozelKod2Controller;
  late final TextEditingController _isEmriController;
  late final TextEditingController _projeController;
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
    if (!yetkiController.transferDatLokalDATSeciliGelmesin && viewModel.model.lokalDat == null) {
      viewModel.setLokalDepo(true);
    }
    if (yetkiController.transferLokalDatHareketTuru != null && viewModel.model.hareketTuru == null) {
      viewModel.setHareketTuru(yetkiController.transferLokalDatHareketTuru);
    }
    _belgeNoController = TextEditingController(text: model.belgeNo);
    _cariController = TextEditingController(text: model.cariAdi);
    _gidecegiSubeController = TextEditingController(text: model.teslimCariAdi);
    _teslimCariController = TextEditingController(text: model.teslimCariAdi);
    _hareketTuruController = TextEditingController(text: viewModel.hareketTuruMap.entries.firstWhereOrNull((element) => element.value == viewModel.model.hareketTuru)?.key);
    _tarihController = TextEditingController(text: model.tarih.toDateString);
    _topluGirisDepoController = TextEditingController(text: model.topluGirisDepoTanimi);
    _topluCikisDepoController = TextEditingController(text: model.topluCikisDepoTanimi);
    _ozelKod2Controller = TextEditingController(
      text: parametreModel.listOzelKodTum?.firstWhereOrNull((ListOzelKodTum element) => element.belgeTipi == "S" && element.fiyatSirasi == 0 && element.kod == model.ozelKod2)?.aciklama ??
          model.ozelKod2,
    );
    _isEmriController = TextEditingController(text: model.isemriAciklama);
    _projeController = TextEditingController(text: model.projeAciklama);
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
    _cariController.dispose();
    _gidecegiSubeController.dispose();
    _teslimCariController.dispose();
    _hareketTuruController.dispose();
    _tarihController.dispose();
    _topluGirisDepoController.dispose();
    _topluCikisDepoController.dispose();
    _ozelKod2Controller.dispose();
    _isEmriController.dispose();
    _projeController.dispose();
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
            key: StaticVariables.instance.transferGenelFormKey,
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
                  validator: (value) {
                    if (value?.length != 15) {
                      return "15 basamaklı olmalıdır.";
                    }
                    if (viewModel.model.ebelgeCheckbox == "E" && !(parametreModel.arrEIrsSeri?.any((element) => value?.startsWith(element) ?? true) ?? false)) {
                      return "E-İrsaliye için ${parametreModel.arrEIrsSeri?.join(", ")} serisi kullanılmalı.";
                    }
                    return null;
                  },
                ),

                // CustomTextField(
                //   labelText: "Teslim Cari",
                //   readOnly: true,
                //   isMust: true,
                //   suffixMore: true,
                //   controller: _teslimCariController,
                //   enabled: enable,
                //   valueWidget: Observer(builder: (_) => Text(viewModel.model.teslimCari ?? "")),
                //   onTap: () async {
                //     final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                //     if (result != null) {
                //       _teslimCariController.text = result.cariAdi ?? "";
                //     }
                //   },
                // ),
                // //.yetkiVarMi(yetkiController.sevkiyatSatisFatGizlenecekAlanlar("teslim_cari") && widget.model.editTipiEnum?.irsaliyeMi != true),
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
                      "mainPage/cariRehberi",
                      arguments: CariListesiRequestModel(
                        menuKodu: "CARI_CREH",
                        belgeTuru: model.getEditTipiEnum?.rawValue,
                      ),
                    );
                    if (cariModel == null) return null;
                    final result = await networkManager.getCariModel(
                      CariRequestModel.fromCariListesiModel(cariModel)
                        ..secildi = "E"
                        ..kisitYok = true
                        ..teslimCari = "E"
                        ..eFaturaGoster = true,
                    );
                    if (result is CariListesiModel) {
                      _cariController.text = result.cariAdi ?? "";
                      viewModel.model.cariTitle = result.efaturaCarisi == "E"
                          ? "E-Fatura"
                          : result.efaturaCarisi == "H"
                              ? "E-Arşiv"
                              : null;
                      //TODO DEPO KODUNU ZEKİ ABİYE SOR
                      // if (yetkiController.transferDatCarininDepoGetir) {
                      //   viewModel.setTopluGirisDepoKodu(DepoList()..depoKodu = result.depoKodlari?.firstOrNull);
                      // }
                      viewModel.setCariAdi(result.cariAdi);
                      viewModel.setCariKodu(result.cariKodu);
                      viewModel.model.vadeGunu = result.vadeGunu;
                      viewModel.model.efaturaTipi = result.efaturaTipi;
                      _belgeNoController.text = "";
                      await getBelgeNo();
                    }
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomWidgetWithLabel(
                        text: "Lokal Depo",
                        isVertical: true,
                        child: Observer(
                          builder: (_) => Switch.adaptive(
                            value: viewModel.model.lokalDat == "E",
                            onChanged: enable ? (bool value) => viewModel.setLokalDepo(value) : null,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomWidgetWithLabel(
                        text: "KDV Dahil",
                        isVertical: true,
                        child: Observer(
                          builder: (_) => Switch.adaptive(
                            value: viewModel.kdvDahil,
                            onChanged: enable ? (bool value) => viewModel.changeKdvDahil(value) : null,
                          ),
                        ),
                      ),
                    ).yetkiVarMi(yetkiController.transferLokalDatGizlenecekAlanlar("kdv_dahil_haric")),
                    Expanded(
                      child: CustomWidgetWithLabel(
                        text: "E-İrsaliye",
                        isVertical: true,
                        child: Observer(
                          builder: (_) => Switch.adaptive(
                            value: viewModel.model.ebelgeCheckbox == "E",
                            onChanged: enable && !yetkiController.transferDatEIrsaliyeIsaretleyemesin
                                ? (bool value) {
                                    viewModel.setEIrsaliye(value);
                                    if (value) {
                                      dialogManager.showInfoSnackBar("E-İrsaliye için ${parametreModel.arrEIrsSeri?.join(", ")} serisi kullanılmalı.");
                                    }
                                  }
                                : null,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Observer(
                  builder: (_) => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: CustomTextField(
                          labelText: "Gideceği Şube",
                          readOnly: true,
                          isMust: true,
                          suffixMore: true,
                          controller: _gidecegiSubeController,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.cikisSubeKodu.toIntIfDouble.toStringIfNotNull ?? "")),
                          onTap: () async {
                            final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              title: "Gideceği Şube",
                              groupValue: viewModel.model.cikisSubeKodu,
                              children: List.generate(parametreModel.subeList?.length ?? 0, (index) {
                                final SubeList? item = parametreModel.subeList?[index];
                                return BottomSheetModel(title: item?.subeAdi ?? "", value: item, groupValue: item?.subeKodu, description: item?.subeKodu.toStringIfNotNull);
                              }),
                            );
                            if (result is SubeList) {
                              viewModel.setCikisSube(result.subeKodu);
                              _gidecegiSubeController.text = result.subeAdi ?? "";
                            }
                          },
                        ),
                      ),
                      Expanded(
                        child: CustomTextField(
                          labelText: "Ambar (Giriş Depo Cari)",
                          readOnly: true,
                          isMust: true,
                          suffixMore: true,
                          controller: _teslimCariController,
                          enabled: enable,
                          onTap: () async {
                            final cariModel = await Get.toNamed(
                              "mainPage/cariRehberi",
                              arguments: CariListesiRequestModel(
                                menuKodu: "CARI_CREH",
                                belgeTuru: model.getEditTipiEnum?.rawValue,
                              ),
                            );
                            if (cariModel == null) return null;
                            final result = await networkManager.getCariModel(
                              CariRequestModel.fromCariListesiModel(cariModel)
                                ..secildi = "E"
                                ..kisitYok = true
                                ..teslimCari = "E"
                                ..eFaturaGoster = true,
                            );
                            if (result is CariListesiModel) {
                              viewModel.setTeslimCariAdi(result.cariAdi);
                              viewModel.setTeslimCariKodu(result.cariKodu);
                              _teslimCariController.text = result.cariAdi ?? "";
                            }
                          },
                        ),
                      ),
                    ],
                  ).yetkiVarMi(viewModel.model.lokalDat != "E"),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: CustomTextField(
                        labelText: "Hareket Türü",
                        readOnly: true,
                        isMust: true,
                        enabled: enable && !yetkiController.transferLokalDatHarTuruDegismesin,
                        suffixMore: true,
                        controller: _hareketTuruController,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.hareketTuru ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                            context,
                            title: "Hareket Türü",
                            groupValue: viewModel.model.hareketTuru,
                            children: List.generate(viewModel.hareketTuruMap.length, (index) {
                              final MapEntry<String, String> item = viewModel.hareketTuruMap.entries.toList()[index];
                              return BottomSheetModel(title: item.key, value: item, groupValue: item.value, description: item.value);
                            }),
                          );
                          if (result is MapEntry) {
                            viewModel.setHareketTuru(result.value);
                            _hareketTuruController.text = result.key;
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
                        enabled: enable,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: CustomTextField(
                        labelText: "Toplu Çıkış Depo",
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("toplu_depo"),
                        readOnly: true,
                        suffixMore: true,
                        controller: _topluCikisDepoController,
                        enabled: enable,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.cikisDepoKodu.toStringIfNotNull ?? "")),
                        onClear: () => viewModel.setTopluCikisDepoKodu(null),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showTopluDepoBottomSheetDialog(context, viewModel.model.topluDepo);
                          if (result != null) {
                            _topluCikisDepoController.text = result.depoTanimi ?? "";
                            viewModel.setTopluCikisDepoKodu(result);
                          }
                        },
                        validator: (value) {
                          if (value == "") {
                            return null;
                          }
                          if (model.cikisDepoKodu == model.girisDepoKodu) {
                            return "Giriş ve Çıkış depolar aynı olamaz.";
                          }
                          return null;
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Toplu Giriş Depo",
                        readOnly: true,
                        isMust: true,
                        //  && yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A1"),
                        suffixMore: true,
                        controller: _topluGirisDepoController,
                        enabled: enable,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.girisDepoKodu.toStringIfNotNull ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showTopluDepoBottomSheetDialog(context, viewModel.model.topluDepo);
                          if (result != null) {
                            _topluGirisDepoController.text = result.depoTanimi ?? "";
                            viewModel.setTopluGirisDepoKodu(result);
                          }
                        },
                        validator: (value) {
                          if (value == "") {
                            return "Depo Kodu boş bırakılamaz.";
                          }
                          if (model.cikisDepoKodu == model.girisDepoKodu) {
                            return "Giriş ve Çıkış depolar aynı olamaz.";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
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
                      ).yetkiVarMi(yetkiController.ebelgeOzelKod2AktifMi(model.getEditTipiEnum?.satisMi ?? false)),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "İş Emri",
                        suffixMore: true,
                        readOnly: true,
                        controller: _isEmriController,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.isemriNo ?? "")),
                        onClear: () => viewModel.changeIsEmri(null),
                        onTap: () async {
                          final result = await Get.toNamed("/mainPage/isEmriRehberiOzel");
                          if (result is IsEmirleriModel) {
                            viewModel.changeIsEmri(result);
                            _isEmriController.text = result.stokKodu ?? "";
                          }
                        },
                      ).yetkiVarMi(yetkiController.transferIsEmriSorulsun),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: "Proje",
                  readOnly: true,
                  isMust: true,
                  suffixMore: true,
                  controller: _projeController,
                  enabled: enable && yetkiController.transferLokalDatDegistirilmeyecekAlanlar("proje"),
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                  onTap: () async {
                    final BaseProjeModel? result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
                    if (result is BaseProjeModel) {
                      _projeController.text = result.projeAciklama ?? "";
                      viewModel.setProje(result);
                    }
                  },
                ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi && yetkiController.transferLokalDatGizlenecekAlanlar("proje")),
                CustomTextField(
                  labelText: "Açıklama",
                  enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A"),
                  isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A"),
                  controllerText: viewModel.model.aciklama,
                  onChanged: (value) => viewModel.model.aciklama = value,
                ),

                CustomWidgetWithLabel(
                  text: "Ek Açıklamalar",
                  child: Column(
                    children: <Widget>[
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A1"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A1"),
                        onChanged: (value) => viewModel.setAciklama(1, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi1 : parametreModel.alisEkAciklamaTanimi1) ?? "Açıklama 1",
                        controller: _aciklama1Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A2"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A2"),
                        onChanged: (value) => viewModel.setAciklama(2, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi2 : parametreModel.alisEkAciklamaTanimi2) ?? "Açıklama 2",
                        controller: _aciklama2Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A3"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A3"),
                        onChanged: (value) => viewModel.setAciklama(3, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi3 : parametreModel.alisEkAciklamaTanimi3) ?? "Açıklama 3",
                        controller: _aciklama3Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A4"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A4"),
                        onChanged: (value) => viewModel.setAciklama(4, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi4 : parametreModel.alisEkAciklamaTanimi4) ?? "Açıklama 4",
                        controller: _aciklama4Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A5"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A5"),
                        onChanged: (value) => viewModel.setAciklama(5, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi5 : parametreModel.alisEkAciklamaTanimi5) ?? "Açıklama 5",
                        controller: _aciklama5Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A6"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A6"),
                        onChanged: (value) => viewModel.setAciklama(6, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi6 : parametreModel.alisEkAciklamaTanimi6) ?? "Açıklama 6",
                        controller: _aciklama6Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A7"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A7"),
                        onChanged: (value) => viewModel.setAciklama(7, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi7 : parametreModel.alisEkAciklamaTanimi7) ?? "Açıklama 7",
                        controller: _aciklama7Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A8"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A8"),
                        onChanged: (value) => viewModel.setAciklama(8, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi8 : parametreModel.alisEkAciklamaTanimi8) ?? "Açıklama 8",
                        controller: _aciklama8Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A9"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A9"),
                        onChanged: (value) => viewModel.setAciklama(9, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi9 : parametreModel.alisEkAciklamaTanimi9) ?? "Açıklama 9",
                        controller: _aciklama9Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A10"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A10"),
                        onChanged: (value) => viewModel.setAciklama(10, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi10 : parametreModel.alisEkAciklamaTanimi10) ?? "Açıklama 10",
                        controller: _aciklama10Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A11"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A11"),
                        onChanged: (value) => viewModel.setAciklama(11, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi11 : parametreModel.alisEkAciklamaTanimi11) ?? "Açıklama 11",
                        controller: _aciklama11Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A12"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A12"),
                        onChanged: (value) => viewModel.setAciklama(12, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi12 : parametreModel.alisEkAciklamaTanimi12) ?? "Açıklama 12",
                        controller: _aciklama12Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A13"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A13"),
                        onChanged: (value) => viewModel.setAciklama(13, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi13 : parametreModel.alisEkAciklamaTanimi13) ?? "Açıklama 13",
                        controller: _aciklama13Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A14"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A14"),
                        onChanged: (value) => viewModel.setAciklama(14, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi14 : parametreModel.alisEkAciklamaTanimi14) ?? "Açıklama 14",
                        controller: _aciklama14Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A15"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A15"),
                        onChanged: (value) => viewModel.setAciklama(15, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi15 : parametreModel.alisEkAciklamaTanimi15) ?? "Açıklama 15",
                        controller: _aciklama15Controller,
                      ),
                      CustomTextField(
                        enabled: enable && !yetkiController.transferLokalDatDegistirilmeyecekAlanlar("A16"),
                        isMust: yetkiController.transferLokalDatBosGecilmeyecekAlanlar("A16"),
                        onChanged: (value) => viewModel.setAciklama(16, value),
                        labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi16 : parametreModel.alisEkAciklamaTanimi16) ?? "Açıklama 16",
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
    if (result.success == true) {
      final List<BaseSiparisEditModel> list = (result.data as List).map((e) => e as BaseSiparisEditModel).toList().cast<BaseSiparisEditModel>();
      BaseSiparisEditModel.instance.belgeNo = list.firstOrNull?.belgeNo;
      _belgeNoController.text = BaseSiparisEditModel.instance.belgeNo ?? "";
    }
  }
}
