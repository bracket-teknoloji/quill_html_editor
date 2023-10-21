import "dart:developer";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../core/base/model/base_bottom_sheet_response_model.dart";
import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../model/main_page_model.dart";
import "../../../../../../model/param_model.dart";
import "../../../../cari_listesi/model/cari_listesi_model.dart";
import "../../../../cari_listesi/model/cari_save_request_model.dart";
import "../../../../cari_listesi/model/cari_sehirler_model.dart";
import "../../../../cari_network_manager.dart";
import "../model/ulke_model.dart";
import "../view_model/base_cari_genel_edit_view_model.dart";

class BaseEditCariGenelView extends StatefulWidget {
  final BaseEditModel? model;
  const BaseEditCariGenelView({super.key, this.model});

  @override
  State<BaseEditCariGenelView> createState() => BaseEditCariGenelViewState();
}

class BaseEditCariGenelViewState extends BaseState<BaseEditCariGenelView> {
  BaseCariGenelEditViewModel viewModel = BaseCariGenelEditViewModel();
  MainPageModel? anaVeri = CacheManager.getAnaVeri();
  List<UlkeModel>? ulkeler;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  late final TextEditingController kodController;
  late final TextEditingController cariTipiController;
  late final TextEditingController adController;
  late final TextEditingController ulkeController;
  late final TextEditingController ilController;
  late final TextEditingController ilceCOntroller;
  late final TextEditingController postaKoduController;
  late final TextEditingController adresController;
  late final TextEditingController telefonController;
  late final TextEditingController ePostaController;
  late final TextEditingController webController;
  late final TextEditingController vergiDairesiController;
  late final TextEditingController vergiNoController;
  late final TextEditingController dovizController;
  late final TextEditingController plasiyerController;
  late final TextEditingController vadeGunuController;
  late final TextEditingController odemeTipiController;
  late final bool enabled;

  @override
  void initState() {
    enabled = widget.model?.baseEditEnum != BaseEditEnum.goruntule;
    // StaticVariables.instance.cariKartiGenelFormKey.currentState?.activate();kodController = TextEditingController(text: viewModel.model?.cariKodu);
    viewModel.setModel(CariSaveRequestModel.instance);
    if (widget.model?.baseEditEnum == BaseEditEnum.ekle || widget.model?.baseEditEnum == BaseEditEnum.kopyala) {
      viewModel.model?.yeniKayit = true;
      viewModel.changeIslemKodu(1);
    } else if (widget.model?.baseEditEnum == BaseEditEnum.duzenle) {
      viewModel.changeIslemKodu(2);
    }
    viewModel.changeIsSahisFirmasi(viewModel.model?.sahisFirmasi ?? false);
    viewModel.changeIsDovizli(viewModel.model?.dovizli == "E");
    (viewModel.model?.dovizli == "E" && viewModel.model?.dovizKoduAciklama == null)
        ? viewModel.changeDovizTipi(DovizList()
          ..isim = "TL"
          ..dovizKodu = 0)
        : null;
    viewModel.changeAdi(viewModel.model?.adi);
    viewModel.changeCariTipi(viewModel.model?.tipi);
    viewModel.changeKodu(viewModel.model?.kodu);
    kodController = TextEditingController(text: viewModel.model?.kodu);
    cariTipiController = TextEditingController(text: viewModel.cariTipiMap.entries.firstWhereOrNull((MapEntry<String, String> element) => element.value == viewModel.model?.tipi)?.key);
    adController = TextEditingController(text: viewModel.model?.adi);
    ulkeController = TextEditingController(text: viewModel.model?.ulkeKoduAciklama);
    ilController = TextEditingController(text: viewModel.model?.sehir);
    ilceCOntroller = TextEditingController(text: viewModel.model?.ilce);
    postaKoduController = TextEditingController(text: viewModel.model?.postakodu);
    adresController = TextEditingController(text: viewModel.model?.adres);
    telefonController = TextEditingController(text: viewModel.model?.telefon);
    ePostaController = TextEditingController(text: viewModel.model?.eposta);
    webController = TextEditingController(text: viewModel.model?.website);
    vergiDairesiController = TextEditingController(text: viewModel.model?.vergiDairesi);
    vergiNoController = TextEditingController(text: viewModel.model?.vergiNo);
    dovizController = TextEditingController(text: (viewModel.model?.dovizli == "E" && viewModel.model?.dovizKoduAciklama == null) ? mainCurrency : viewModel.model?.dovizKoduAciklama);
    plasiyerController = TextEditingController(text: parametreModel.plasiyerList?.firstWhereOrNull((PlasiyerList element) => element.plasiyerKodu == viewModel.model?.plasiyerKodu)?.plasiyerAciklama);
    vadeGunuController = TextEditingController(text: viewModel.model?.vadeGunu ?? "");
    odemeTipiController = TextEditingController(
        text: viewModel.model?.odemeTipi == "0"
            ? "Nakit"
            : viewModel.model?.odemeTipi == "1"
                ? "Havale"
                : viewModel.model?.odemeTipi == "2"
                    ? "Çek"
                    : "");
    // if (widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != BaseEditEnum.kopyala) {
    //   getCariDetay(model?.cariKodu ?? "");
    // }
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      if (viewModel.model?.kodu == null) {
        final String? kod = await CariNetworkManager.getSiradakiKod(kod: kodController.text);
        kodController.text = kod ?? "";
        viewModel.changeKodu(kod);
      }
    });
    super.initState();
  }

  @override
  void deactivate() {
    StaticVariables.instance.cariKartiGenelFormKey.currentState?.deactivate();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Form(
          key: StaticVariables.instance.cariKartiGenelFormKey,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: CustomWidgetWithLabel(
                  isVertical: true,
                  text: "Şahıs Firması",
                  onlyLabelpaddingLeft: UIHelper.lowSize,
                  child: Observer(builder: (_) => Switch.adaptive(value: viewModel.isSahisFirmasi, onChanged: enabled ? (bool value) => viewModel.changeIsSahisFirmasi(value) : null)),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: CustomTextField(
                    enabled: enabled && (widget.model?.baseEditEnum == BaseEditEnum.ekle || widget.model?.baseEditEnum == BaseEditEnum.kopyala),
                    readOnly: widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != BaseEditEnum.kopyala,
                    isMust: true,
                    labelText: "Kodu",
                    controller: kodController,
                    suffix: Wrap(
                      children: <IconButton>[
                        IconButton(
                            onPressed: () async {
                              final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                              if (result != null && result is CariListesiModel) {
                                kodController.text = result.kodu ?? "";
                                viewModel.changeKodu(result.kodu);
                              }
                              log(result.toString());
                            },
                            icon: const Icon(Icons.more_horiz_outlined)),
                        IconButton(
                            onPressed: () async {
                              final String? kod = await CariNetworkManager.getSiradakiKod(kod: kodController.text);
                              kodController.text = kod ?? "";
                              viewModel.changeKodu(kod);
                            },
                            icon: const Icon(Icons.format_list_numbered_rtl_outlined))
                      ].map((IconButton e) => SizedBox(width: 35, child: e)).toList(),
                    ),
                  )),
                  Expanded(
                      child: CustomTextField(
                    enabled: enabled && yetkiController.cariKartiDegistirilmeyecekAlanlar("tipi"),
                    isMust: true,
                    labelText: "Cari Tipi",
                    valueWidget: Observer(builder: (_) => Text(viewModel.model?.tipi ?? "")),
                    readOnly: true,
                    controller: cariTipiController,
                    suffixMore: true,
                    onTap: () async {
                      final result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                          title: "Cari Tipi",
                          children: List.generate(
                              viewModel.cariTipiMap.length,
                              (int index) => BottomSheetModel(
                                  title: viewModel.cariTipiMap.keys.toList()[index], value: viewModel.cariTipiMap.entries.toList()[index], description: viewModel.cariTipiMap.values.toList()[index])));
                      if (result is MapEntry) {
                        cariTipiController.text = result.key;
                        viewModel.changeCariTipi(result.value);
                      }
                    },
                  ))
                ],
              ),
              CustomTextField(
                enabled: enabled,
                labelText: "Adı",
                controller: adController,
                isMust: true,
                onChanged: (String p0) {
                  viewModel.changeAdi(p0);
                },
              ),
              CustomTextField(
                enabled: enabled,
                labelText: "Ülke",
                readOnly: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model?.ulkeKodu ?? "")),
                controller: ulkeController,
                suffixMore: true,
                onClear: () => viewModel.changeUlke(null),
                onTap: () async {
                  ulkeler ??= await getUlkeData();
                  if (mounted) {
                    final BaseBottomSheetResponseModel? result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                        title: "Ülkeler",
                        children: List.generate(
                            ulkeler!.length,
                            (int index) => BottomSheetModel(
                                title: ulkeler?[index].ulkeAdi ?? "",
                                value: ulkeler?[index].ulkeKodu,
                                description: ulkeler?[index].ulkeKodu,
                                onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: ulkeler?[index].ulkeAdi, value: ulkeler?[index].ulkeKodu)))));
                    if (result != null) {
                      ulkeController.text = result.title ?? "";
                      viewModel.changeUlke(result.value);
                    }
                  }
                },
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Expanded(
                    child: CustomTextField(
                  enabled: enabled,
                  labelText: "Şehir",
                  controller: ilController,
                  readOnly: true,
                  suffixMore: true,
                  onClear: () => viewModel.changeIl(null),
                  onTap: () async {
                    if (viewModel.sehirler == null) {
                      await viewModel.getFilterData();
                    }
                    // ignore: use_build_context_synchronously
                    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context,
                        title: "Şehirler",
                        children: List.generate(viewModel.sehirler?.length ?? 0, (int index) => BottomSheetModel(title: viewModel.sehirler?[index].sehirAdi ?? "", value: viewModel.sehirler?[index])));
                    if (result is CariSehirlerModel) {
                      ilController.text = result.sehirAdi ?? "";
                      viewModel.changeIl(result.sehirAdi);
                    }
                  },
                )),
                Expanded(
                    child: CustomTextField(
                  enabled: enabled,
                  labelText: "İlçe",
                  controller: ilceCOntroller,
                  onChanged: (String p0) => viewModel.changeIlce(p0),
                )),
              ]),
              CustomTextField(
                enabled: enabled,
                labelText: "Posta Kodu",
                controller: postaKoduController,
                onChanged: (String p0) => viewModel.changePostaKodu(p0),
              ),
              CustomTextField(
                enabled: enabled,
                labelText: "Adres",
                controller: adresController,
                onChanged: (String p0) => viewModel.changeAdres(p0),
              ),
              CustomTextField(
                enabled: enabled,
                labelText: "Telefon",
                controller: telefonController,
                keyboardType: TextInputType.phone,
                onChanged: (String p0) {
                  viewModel.changeTelefon(p0);
                },
              ),
              CustomTextField(
                enabled: enabled,
                labelText: "E-Posta",
                controller: ePostaController,
                onChanged: (String p0) => viewModel.changeEposta(p0),
              ),
              CustomTextField(
                enabled: enabled,
                labelText: "Web",
                controller: webController,
                onChanged: (String p0) => viewModel.changeWeb(p0),
              ),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Expanded(
                    child: CustomTextField(
                  enabled: enabled && yetkiController.cariKartiDegistirilmeyecekAlanlar("vergi"),
                  labelText: "Vergi Dairesi",
                  controller: vergiDairesiController,
                  onChanged: (String p0) => viewModel.changeVergiDairesi(p0),
                )),
                Expanded(
                    child: Observer(
                        builder: (_) => CustomTextField(
                              enabled: enabled && yetkiController.cariKartiDegistirilmeyecekAlanlar("vergi"),
                              labelText: viewModel.isSahisFirmasi ? "T.C. Kimlik No" : "Vergi No",
                              controller: vergiNoController,
                              keyboardType: TextInputType.number,
                              maxLength: viewModel.isSahisFirmasi ? 11 : 10,
                              onChanged: (String p0) => viewModel.changeVergiNo(p0),
                            )))
              ]),
              Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                Expanded(
                    child: CustomTextField(
                  enabled: enabled && yetkiController.cariKartiDegistirilmeyecekAlanlar("plasiyer"),
                  labelText: "Plasiyer",
                  readOnly: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model?.plasiyerKodu ?? "")),
                  controller: plasiyerController,
                  suffixMore: true,
                  onClear: () {
                    viewModel.changePlasiyer(null);
                  },
                  onTap: () async {
                    final PlasiyerList? result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                        title: "Plasiyer",
                        children: List.generate(anaVeri?.paramModel?.plasiyerList?.length ?? 0,
                            (int index) => BottomSheetModel(title: anaVeri?.paramModel?.plasiyerList?[index].plasiyerAciklama ?? "", value: anaVeri?.paramModel?.plasiyerList?[index])));
                    if (result != null) {
                      plasiyerController.text = result.plasiyerAciklama ?? "";
                      viewModel.changePlasiyer(result.plasiyerKodu);
                    }
                  },
                )).yetkiVarMi(parametreModel.plasiyerUygulamasi == true),
                Expanded(
                    child: CustomWidgetWithLabel(
                        isVertical: true,
                        onlyLabelpaddingLeft: UIHelper.lowSize,
                        text: "Dövizli",
                        child: Observer(
                            builder: (_) => Switch.adaptive(
                                value: viewModel.isDovizli,
                                onChanged: enabled
                                    ? (bool value) {
                                        if (!value) {
                                          dovizController.text = "";
                                          viewModel.changeDovizTipi(null);
                                        }
                                        viewModel.changeIsDovizli(value);
                                      }
                                    : null))))
              ]),
              Observer(
                  builder: (_) => Visibility(
                      visible: viewModel.isDovizli,
                      child: CustomTextField(
                        enabled: enabled && yetkiController.cariKartiDegistirilmeyecekAlanlar("dov_tipi"),
                        labelText: "Döviz Tipi",
                        valueWidget: Observer(builder: (_) => Text(viewModel.model?.dovizKodu.toStringIfNotNull ?? "")),
                        controller: dovizController,
                        readOnly: true,
                        suffixMore: true,
                        onTap: () async {
                          final DovizList? result = await bottomSheetDialogManager.showDovizBottomSheetDialog(context);
                          if (result is DovizList) {
                            dovizController.text = result.isim ?? "";
                            viewModel.changeDovizTipi(result);
                          }
                        },
                      ))),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                      child: CustomTextField(
                    enabled: enabled && yetkiController.cariKartiDegistirilmeyecekAlanlar("vade_gunu"),
                    labelText: "Vade Günü",
                    controller: vadeGunuController,
                    keyboardType: TextInputType.number,
                    onChanged: (String p0) => viewModel.changeVadeGunu(int.tryParse(p0)),
                  )),
                  Expanded(
                      child: CustomTextField(
                    enabled: enabled && yetkiController.cariKartiDegistirilmeyecekAlanlar("odeme_tipi"),
                    readOnly: true,
                    labelText: "Ödeme Tipi",
                    controller: odemeTipiController,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model?.odemeTipi ?? "")),
                    suffixMore: true,
                    onClear: () {
                      viewModel.changeOdemeTipi(null);
                    },
                    onTap: () async {
                      final BaseBottomSheetResponseModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Ödeme Tipi", children: <BottomSheetModel?>[
                        BottomSheetModel(title: "Nakit", value: "0", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Nakit", value: "0"))),
                        BottomSheetModel(title: "Havale", value: "1", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Havale", value: "1"))),
                        BottomSheetModel(title: "Çek", value: "2", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Çek", value: "2"))),
                      ]);
                      if (result != null) {
                        odemeTipiController.text = result.title ?? "";
                        viewModel.changeOdemeTipi(result.value);
                      }
                    },
                  ))
                ],
              ),
            ],
          ),
        ),
      );

  Future<List<UlkeModel>?> getUlkeData() async {
    final GenericResponseModel<NetworkManagerMixin> response =
        await networkManager.dioGet<UlkeModel>(path: ApiUrls.getUlkeler, bodyModel: UlkeModel(), addCKey: true, addSirketBilgileri: true, addTokenKey: true);
    return response.data?.map((e) => e as UlkeModel).toList().cast<UlkeModel>();
  }
}
