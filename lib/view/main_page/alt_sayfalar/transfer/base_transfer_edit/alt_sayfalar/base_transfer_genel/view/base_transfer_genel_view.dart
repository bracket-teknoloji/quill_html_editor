import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/init/cache/cache_manager.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "../../../../../../../../core/base/view/masraf_kodu/model/masraf_kodu_rehberi_model.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../model/param_model.dart";
import "../../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../../cari/cari_listesi/model/cari_request_model.dart";
import "../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../../../../uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";
// import "../../../../../../../model/param_model.dart";
// import "../../../../../../e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
// import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
// import "../../../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../view_model/base_transfer_genel_view_model.dart";

final class BaseTransferGenelView extends StatefulWidget {
  const BaseTransferGenelView({required this.model, super.key});
  final BaseEditModel<SiparisEditRequestModel> model;

  @override
  State<BaseTransferGenelView> createState() => BaseTransferGenelViewState();
}

final class BaseTransferGenelViewState extends BaseState<BaseTransferGenelView> {
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
  late final TextEditingController _cikisYeriController;
  late final TextEditingController _masrafKoduController;
  late final TextEditingController _topluGirisDepoController;
  late final TextEditingController _topluCikisDepoController;
  late final TextEditingController _ozelKod1Controller;
  late final TextEditingController _ozelKod2Controller;
  late final TextEditingController _isEmriController;
  late final TextEditingController _topluDepoController;
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
    if (!widget.model.isEkle) {
      viewModel
        ..setCariAdi(BaseSiparisEditModel.instance.cariModel?.cariAdi)
        ..setCariKodu(BaseSiparisEditModel.instance.cariModel?.cariKodu)
        ..setTopluCikisDepoKodu(
          DepoList()
            ..depoKodu = BaseSiparisEditModel.instance.cikisDepoKodu
            ..depoTanimi = parametreModel.depoList?.firstWhereOrNull((element) => element.depoKodu == BaseSiparisEditModel.instance.cikisDepoKodu)?.depoTanimi,
        )
        ..setTopluGirisDepoKodu(
          DepoList()
            ..depoKodu = BaseSiparisEditModel.instance.girisDepoKodu
            ..depoTanimi = parametreModel.depoList?.firstWhereOrNull((element) => element.depoKodu == BaseSiparisEditModel.instance.girisDepoKodu)?.depoTanimi,
        );
    }
    _belgeNoController = TextEditingController(text: model.belgeNo);
    _cariController = TextEditingController(text: viewModel.model.cariAdi);
    _gidecegiSubeController = TextEditingController(text: model.girisSubeAciklama);
    _teslimCariController = TextEditingController(text: model.teslimCariAdi);
    _hareketTuruController = TextEditingController(text: viewModel.hareketTuruMap.entries.firstWhereOrNull((element) => element.value == viewModel.model.hareketTuru)?.key);
    _tarihController = TextEditingController(text: model.tarih.toDateString);
    _masrafKoduController = TextEditingController(text: model.masrafKoduAdi ?? model.masrafKodu);
    _cikisYeriController = TextEditingController(text: viewModel.cikisYeriMap.entries.firstWhereOrNull((element) => element.value == model.cikisYeri)?.key);
    _topluGirisDepoController = TextEditingController(text: model.topluGirisDepoTanimi ?? viewModel.model.girisDepoKodu.toStringIfNotNull);
    _topluCikisDepoController = TextEditingController(text: model.topluCikisDepoTanimi ?? viewModel.model.cikisDepoKodu.toStringIfNotNull);
    _ozelKod1Controller = TextEditingController(
      text: parametreModel.listOzelKodTum?.firstWhereOrNull((element) => element.belgeTipi == "S" && element.fiyatSirasi == 0 && element.kod == model.ozelKod1)?.aciklama ?? model.ozelKod1,
    );
    _ozelKod2Controller = TextEditingController(
      text: parametreModel.listOzelKodTum?.firstWhereOrNull((element) => element.belgeTipi == "S" && element.fiyatSirasi == 0 && element.kod == model.ozelKod2)?.aciklama ?? model.ozelKod2,
    );
    _isEmriController = TextEditingController(text: model.isemriAciklama);
    _topluDepoController = TextEditingController(text: model.depoTanimi ?? model.topluDepo.toStringIfNotNull);
    _projeController = TextEditingController(text: model.projeAciklama ?? model.projeKodu);
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
      if (yetkiController.projeUygulamasiAcikMi && viewModel.model.projeKodu == null) {
        viewModel.setProje(yetkiController.varsayilanProje);
        _projeController.text = viewModel.model.projeAciklama ?? viewModel.model.projeKodu ?? "";
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
    _topluDepoController.dispose();
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
                    if (viewModel.model.eBelgeCheckBoxMi && !(parametreModel.arrEIrsSeri?.any((element) => value?.startsWith(element) ?? true) ?? false)) {
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
                Observer(
                  builder: (_) => CustomTextField(
                    labelText: "Cari",
                    readOnly: true,
                    isMust: viewModel.model.lokalDat != "E",
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
                          belgeTuru: model.getEditTipiEnum?.rawValue,
                        ),
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
                        viewModel.model.cariTitle = result.efaturaCarisi == "E"
                            ? "E-Fatura"
                            : result.efaturaCarisi == "H"
                                ? "E-Arşiv"
                                : null;
                        //TODO DEPO KODUNU ZEKİ ABİYE SOR
                        // if (yetkiController.transferDatCarininDepoGetir) {
                        //   viewModel.setTopluGirisDepoKodu(DepoList()..depoKodu = result.depoKodlari?.firstOrNull);
                        // }
                        viewModel
                          ..setCariAdi(result.cariAdi)
                          ..setCariKodu(result.cariKodu);
                        viewModel.model.vadeGunu = result.vadeGunu;
                        viewModel.model.efaturaTipi = result.efaturaTipi;
                        // _belgeNoController.clear();
                        // await getBelgeNo();
                      }
                    },
                  ).yetkiVarMi(!(widget.model.editTipiEnum?.ambarGirisiMi ?? false)),
                ),
                Row(
                  children: [
                    if (yetkiController.lokalDepoUygulamasiAcikMi && (model.getEditTipiEnum?.depoTransferiMi ?? false))
                      Expanded(
                        child: CustomWidgetWithLabel(
                          text: "Lokal Depo",
                          isVertical: true,
                          child: Observer(
                            builder: (_) => Switch.adaptive(
                              value: viewModel.model.lokalDat == "E",
                              onChanged: enable ? (value) => viewModel.setLokalDepo(value) : null,
                            ),
                          ),
                        ),
                      ),
                    if (!(model.getEditTipiEnum?.gizlenecekAlanlar("kdv_dahil_haric") ?? false) && !model.getEditTipiEnum.depoTransferiMi)
                      Expanded(
                        child: CustomWidgetWithLabel(
                          text: "KDV Dahil",
                          isVertical: true,
                          child: Observer(
                            builder: (_) => Switch.adaptive(
                              value: viewModel.kdvDahil,
                              onChanged: enable ? (value) => viewModel.changeKdvDahil(value) : null,
                            ),
                          ),
                        ),
                      ),
                    Expanded(
                      child: CustomWidgetWithLabel(
                        text: "E-İrsaliye",
                        isVertical: true,
                        child: Observer(
                          builder: (_) => Switch.adaptive(
                            value: viewModel.model.eBelgeCheckBoxMi,
                            onChanged: enable && !(model.getEditTipiEnum?.eIrsaliyeIsaretleyemesin ?? false)
                                ? (value) {
                                    viewModel.setEIrsaliye(value);
                                    if (value) {
                                      dialogManager.showInfoSnackBar("E-İrsaliye için ${parametreModel.arrEIrsSeri?.join(", ")} serisi kullanılmalı.");
                                    }
                                  }
                                : null,
                          ),
                        ),
                      ),
                    ).yetkiVarMi(!(widget.model.editTipiEnum?.ambarGirisiMi ?? false)),
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
                          enabled: enable,
                          controller: _gidecegiSubeController,
                          valueWidget: Observer(builder: (_) => Text(viewModel.model.girisSubeKodu.toIntIfDouble.toStringIfNotNull ?? "")),
                          onTap: () async {
                            final subeList = parametreModel.subeList?.where((element) => (element.subeKodu ?? 0).toStringIfNotNull != CacheManager.getVeriTabani["Şube"].toString()).toList();
                            final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              title: "Gideceği Şube",
                              groupValue: viewModel.model.girisSubeKodu,
                              children: List.generate(subeList?.length ?? 0, (index) {
                                final SubeList? item = subeList?[index];
                                return BottomSheetModel(title: item?.subeAdi ?? "", value: item, groupValue: item?.subeKodu ?? 0, description: (item?.subeKodu ?? 0).toStringIfNotNull);
                              }),
                            );
                            if (result is SubeList && result.subeKodu != viewModel.model.girisSubeKodu) {
                              viewModel.setGirisSube(result);
                              _gidecegiSubeController.text = result.subeAdi ?? "";
                              viewModel.setTopluGirisDepoKodu(null);
                              _topluGirisDepoController.clear();
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
                                belgeTuru: model.getEditTipiEnum?.rawValue,
                              ),
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
                              viewModel
                                ..setTeslimCariAdi(result.cariAdi)
                                ..setTeslimCariKodu(result.cariKodu);
                              _teslimCariController.text = result.cariAdi ?? "";
                            }
                          },
                        ),
                      ),
                    ],
                  ).yetkiVarMi(viewModel.model.lokalDat != "E" && (viewModel.model.getEditTipiEnum?.depoTransferiMi ?? false)),
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
                          if (result != null) {
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
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Masraf Kodu",
                        controller: _masrafKoduController,
                        readOnly: true,
                        suffixMore: true,
                        enabled: enable,
                        isMust: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.masrafKodu ?? "")),
                        onTap: () async {
                          final result = await Get.toNamed(
                            "mainPage/masrafKoduRehberi",
                            arguments: viewModel.model.masrafKoduTipi ?? -1,
                          );
                          if (result is MasrafKoduRehberiModel) {
                            _masrafKoduController.text = result.masrafAdi ?? result.masrafKodu ?? "";
                            viewModel.changeMasrafKodu(result);
                          }
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Çıkış Yeri",
                        controller: _cikisYeriController,
                        readOnly: true,
                        enabled: enable,
                        suffixMore: true,
                        isMust: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.cikisYeri ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                            context,
                            title: "Çıkış Yeri",
                            groupValue: viewModel.model.cikisYeri,
                            children: List.generate(
                              viewModel.cikisYeriMap.length,
                              (index) => BottomSheetModel(
                                title: viewModel.cikisYeriMap.entries.toList()[index].key,
                                value: viewModel.cikisYeriMap.entries.toList()[index],
                                description: viewModel.cikisYeriMap.entries.toList()[index].value,
                                groupValue: viewModel.cikisYeriMap.entries.toList()[index].value,
                              ),
                            ),
                          );
                          if (result != null) {
                            viewModel
                              ..changeCikisYeri(result.value)
                              ..setMasrafKoduTipi(viewModel.cikisYeriMap.entries.indexed.firstWhereOrNull((element) => element.$2.value == viewModel.model.cikisYeri)?.$1 ?? -1);

                            _cikisYeriController.text = result.key;
                          }
                        },
                      ),
                    ),
                  ],
                ).yetkiVarMi(!(model.getEditTipiEnum?.depoTransferiMi ?? false)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: CustomTextField(
                        labelText: "Toplu Çıkış Depo",
                        isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("toplu_depo"),
                        readOnly: true,
                        suffixMore: true,
                        controller: _topluCikisDepoController,
                        enabled: enable,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.cikisDepoKodu.toStringIfNotNull ?? "")),
                        onClear: () => viewModel.setTopluCikisDepoKodu(null),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showTopluDepoBottomSheetDialog(context, viewModel.model.cikisDepoKodu);
                          if (result != null) {
                            _topluCikisDepoController.text = result.depoTanimi ?? "";
                            viewModel.setTopluCikisDepoKodu(result);
                          }
                        },
                        validator: (value) {
                          if (value == "" && !(model.getEditTipiEnum?.bosGecilmeyecekAlanlar("toplu_depo") ?? false)) {
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
                        //  && model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A1"),
                        suffixMore: true,
                        controller: _topluGirisDepoController,
                        enabled: enable,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.girisDepoKodu.toStringIfNotNull ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showTopluDepoBottomSheetDialog(context, viewModel.model.girisDepoKodu, subeKodu: model.cikisSubeKodu);
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
                ).yetkiVarMi(model.getEditTipiEnum?.depoTransferiMi ?? false),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Özel Kod 1",
                        readOnly: true,
                        suffixMore: true,
                        isMust: true,
                        controller: _ozelKod1Controller,
                        enabled: enable,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.ozelKod1 ?? "")),
                        onClear: () => viewModel.setOzelKod1(null),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showOzelKod1BottomSheetDialog(context, viewModel.model.ozelKod1);
                          if (result != null) {
                            _ozelKod1Controller.text = result.aciklama ?? "";
                            viewModel.setOzelKod1(result.kod);
                          }
                        },
                      ),
                      //TODO Yetkiyi kontrol et
                    ).yetkiVarMi(yetkiController.ebelgeOzelKod1AktifMi(model.getEditTipiEnum?.satisMi ?? false) && false),
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
                if (!(model.getEditTipiEnum?.gizlenecekAlanlar("isemri") ?? false))
                  CustomTextField(
                    labelText: "İş Emri",
                    suffixMore: true,
                    readOnly: true,
                    isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("isemri"),
                    enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("isemri") ?? false),
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
                  ).yetkiVarMi(yetkiController.transferIsEmriSorulsun && !(widget.model.editTipiEnum?.ambarGirisiMi ?? false)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Toplu Depo",
                        readOnly: true,
                        //  && model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A1"),
                        suffixMore: true,
                        controller: _topluDepoController,
                        enabled: enable,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.topluDepo.toStringIfNotNull ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showTopluDepoBottomSheetDialog(context, viewModel.model.topluDepo);
                          if (result != null) {
                            _topluDepoController.text = result.depoTanimi ?? "";
                            viewModel.setDepoKodu(result);
                          }
                        },
                      ),
                    ).yetkiVarMi(model.getEditTipiEnum?.depoTransferiMi != true),
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
                            _projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
                            viewModel.setProje(result);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi && !(viewModel.model.getEditTipiEnum?.gizlenecekAlanlar("proje") ?? false)),
                  ],
                ),
                CustomTextField(
                  labelText: "Açıklama",
                  enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A") ?? false),
                  isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A"),
                  maxLength: StaticVariables.maxAciklamaLength,
                  controllerText: viewModel.model.aciklama,
                  onChanged: (value) => viewModel.model.aciklama = value,
                ).yetkiVarMi(!(widget.model.editTipiEnum?.ambarGirisiMi ?? false) && (viewModel.model.getEditTipiEnum?.aciklamaDuzenlensinMi ?? false)),

                if (yetkiController.faturaAciklamaAlanlari(model.getEditTipiEnum, 0))
                  CustomWidgetWithLabel(
                    text: "Ek Açıklamalar",
                    child: Column(
                      children: <Widget>[
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(1) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A1") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A1") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A1"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(1, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi1 : parametreModel.alisEkAciklamaTanimi1) ?? "Açıklama 1",
                            controller: _aciklama1Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(2) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A2") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A2") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A2"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(2, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi2 : parametreModel.alisEkAciklamaTanimi2) ?? "Açıklama 2",
                            controller: _aciklama2Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(3) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A3") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A3") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A3"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(3, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi3 : parametreModel.alisEkAciklamaTanimi3) ?? "Açıklama 3",
                            controller: _aciklama3Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(4) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A4") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A4") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A4"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(4, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi4 : parametreModel.alisEkAciklamaTanimi4) ?? "Açıklama 4",
                            controller: _aciklama4Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(5) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A5") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A5") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A5"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(5, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi5 : parametreModel.alisEkAciklamaTanimi5) ?? "Açıklama 5",
                            controller: _aciklama5Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(6) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A6") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A6") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A6"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(6, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi6 : parametreModel.alisEkAciklamaTanimi6) ?? "Açıklama 6",
                            controller: _aciklama6Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(7) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A7") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A7") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A7"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(7, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi7 : parametreModel.alisEkAciklamaTanimi7) ?? "Açıklama 7",
                            controller: _aciklama7Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(8) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A8") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A8") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A8"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(8, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi8 : parametreModel.alisEkAciklamaTanimi8) ?? "Açıklama 8",
                            controller: _aciklama8Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(9) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A9") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A9") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A9"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(9, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi9 : parametreModel.alisEkAciklamaTanimi9) ?? "Açıklama 9",
                            controller: _aciklama9Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(10) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A10") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A10") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A10"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(10, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi10 : parametreModel.alisEkAciklamaTanimi10) ?? "Açıklama 10",
                            controller: _aciklama10Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(11) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A11") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A11") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A11"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(11, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi11 : parametreModel.alisEkAciklamaTanimi11) ?? "Açıklama 11",
                            controller: _aciklama11Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(12) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A12") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A12") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A12"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(12, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi12 : parametreModel.alisEkAciklamaTanimi12) ?? "Açıklama 12",
                            controller: _aciklama12Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(13) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A13") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A13") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A13"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(13, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi13 : parametreModel.alisEkAciklamaTanimi13) ?? "Açıklama 13",
                            controller: _aciklama13Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(14) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A14") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A14") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A14"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(14, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi14 : parametreModel.alisEkAciklamaTanimi14) ?? "Açıklama 14",
                            controller: _aciklama14Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(15) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A15") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A15") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A15"),
                            maxLength: StaticVariables.maxAciklamaLength,
                            onChanged: (value) => viewModel.setAciklama(15, value),
                            labelText: (model.getEditTipiEnum?.satisMi ?? false ? parametreModel.satisEkAciklamaTanimi15 : parametreModel.alisEkAciklamaTanimi15) ?? "Açıklama 15",
                            controller: _aciklama15Controller,
                          ),
                        if ((model.getEditTipiEnum?.aciklamalarGorunecekMi(16) ?? false) && !(model.getEditTipiEnum?.gizlenecekAlanlar("A16") ?? false))
                          CustomTextField(
                            enabled: enable && !(model.getEditTipiEnum?.degistirilmeyecekAlanlar("A16") ?? false),
                            isMust: model.getEditTipiEnum?.bosGecilmeyecekAlanlar("A16"),
                            maxLength: StaticVariables.maxAciklamaLength,
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
    if (result.isSuccess) {
      BaseSiparisEditModel.instance.belgeNo = result.dataList.firstOrNull?.belgeNo;
      _belgeNoController.text = BaseSiparisEditModel.instance.belgeNo ?? "";
    }
  }
}
