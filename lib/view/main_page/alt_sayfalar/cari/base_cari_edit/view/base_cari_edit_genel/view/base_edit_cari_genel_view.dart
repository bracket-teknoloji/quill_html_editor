import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_detay_model.dart";

import "../../../../../../../../core/base/model/base_bottom_sheet_response_model.dart";
import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../model/main_page_model.dart";
import "../../../../../../model/param_model.dart";
import "../../../../cari_listesi/model/cari_listesi_model.dart";
import "../../../../cari_listesi/model/cari_save_request_model.dart";
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
  static BaseCariGenelEditViewModel viewModel = BaseCariGenelEditViewModel();
  MainPageModel? anaVeri = CacheManager.getAnaVeri();
  CariListesiModel? get model => CariDetayModel.instance.cariList?.first;
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
  late bool enabled;

  @override
  void initState() {
    enabled = widget.model?.baseEditEnum != BaseEditEnum.goruntule;
    // StaticVariables.instance.cariKartiGenelFormKey.currentState?.activate();kodController = TextEditingController(text: viewModel.model?.cariKodu);
    viewModel.model?.efaturaSenaryo = model?.efaturaTipi;
    viewModel.setModel(CariSaveRequestModel.instance);
    if (widget.model?.baseEditEnum == BaseEditEnum.ekle) {
      viewModel.model?.yeniKayit = true;
      viewModel.changeIslemKodu(1);
    } else if (widget.model?.baseEditEnum == BaseEditEnum.duzenle) {
      viewModel.changeIslemKodu(2);
    }
    // viewModel.changeIslemKodu();
    viewModel.changeIsSahisFirmasi(viewModel.model?.sahisFirmasi ?? model?.sahisFirmasiMi ?? false);
    viewModel.changeIsDovizli(viewModel.model?.dovizli == "E" || model?.dovizli == true);
    viewModel.changeAdi(viewModel.model?.adi ?? model?.cariAdi);
    viewModel.changeCariTipi(viewModel.model?.tipi ?? model?.cariTip);
    viewModel.changeKodu(viewModel.model?.kodu ?? model?.cariKodu);
    kodController = TextEditingController(text: model?.cariKodu);
    cariTipiController = TextEditingController(text: viewModel.model?.tipi ?? model?.cariTip);
    adController = TextEditingController(text: viewModel.model?.adi ?? model?.cariAdi);
    ulkeController = TextEditingController(text: viewModel.model?.ulkeKodu ?? model?.ulkeAdi);
    ilController = TextEditingController(text: viewModel.model?.sehir ?? model?.cariIl);
    ilceCOntroller = TextEditingController(text: viewModel.model?.ilce ?? model?.cariIlce);
    postaKoduController = TextEditingController(text: viewModel.model?.postakodu ?? model?.postakodu);
    adresController = TextEditingController(text: viewModel.model?.adres ?? model?.cariAdres);
    telefonController = TextEditingController(text: viewModel.model?.telefon ?? model?.cariTel);
    ePostaController = TextEditingController(text: viewModel.model?.eposta ?? model?.email);
    webController = TextEditingController(text: viewModel.model?.website ?? model?.web);
    vergiDairesiController = TextEditingController(text: viewModel.model?.vergiDairesi ?? model?.vergiDairesi);
    vergiNoController = TextEditingController(text: viewModel.model?.vergiNo ?? model?.vergiNumarasi);
    dovizController = TextEditingController(text: viewModel.model?.dovizKodu.toStringIfNotNull ?? model?.dovizAdi);
    plasiyerController = TextEditingController(text: viewModel.model?.plasiyerKodu ?? model?.plasiyerKodu);
    vadeGunuController = TextEditingController(text: viewModel.model?.vadeGunu ?? model?.vadeGunu.toStringIfNotNull ?? "");
    odemeTipiController = TextEditingController(
        text: model?.odemeTipi == "0"
            ? "Peşin"
            : model?.odemeTipi == "1"
                ? "Vade"
                : model?.odemeTipi == "2"
                    ? "Çek"
                    : model?.odemeTipi == "3"
                        ? "Senet"
                        : "");
    // if (widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != BaseEditEnum.kopyala) {
    //   getCariDetay(model?.cariKodu ?? "");
    // }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (model?.cariKodu == null || model?.cariKodu == "") {
        viewModel.changeSiradakiKod(widget.model?.siradakiKod);
        kodController.text = widget.model?.siradakiKod ?? "";
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
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: StaticVariables.instance.cariKartiGenelFormKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomWidgetWithLabel(
                isVertical: true,
                text: "Şahıs Firması",
                onlyLabelpaddingLeft: UIHelper.lowSize,
                child: Observer(
                    builder: (_) => Switch.adaptive(
                        value: viewModel.isSahisFirmasi,
                        onChanged: enabled
                            ? (value) {
                                model?.sahisFirmasiMi = value;
                                viewModel.changeIsSahisFirmasi(value);
                              }
                            : null)),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: CustomTextField(
                  enabled: enabled && (widget.model?.baseEditEnum == BaseEditEnum.ekle || widget.model?.baseEditEnum == BaseEditEnum.kopyala),
                  readOnly: widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != BaseEditEnum.kopyala,
                  isMust: true,
                  labelText: "Kodu",
                  controller: kodController,
                  suffix: Wrap(
                    children: [
                      IconButton(
                          onPressed: () async {
                            var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                            if (result != null && result is CariListesiModel) {
                              kodController.text = result.kodu ?? "";
                              viewModel.changeKodu(result.kodu);
                            }
                            log(result.toString());
                          },
                          icon: const Icon(Icons.more_horiz_outlined)),
                      IconButton(
                          onPressed: () async {
                            String? kod = await CariNetworkManager.getSiradakiKod(kod: kodController.text);
                            kodController.text = kod ?? "";
                            viewModel.changeKodu(kod);
                          },
                          icon: const Icon(Icons.format_list_numbered_rtl_outlined))
                    ].map((e) => SizedBox(width: 35, child: e)).toList(),
                  ),
                )),
                Expanded(
                    child: CustomTextField(
                  enabled: enabled,
                  isMust: true,
                  labelText: "Cari Tipi",
                  valueWidget: Observer(builder: (_) => Text(viewModel.model?.tipi ?? model?.cariTip ?? "")),
                  readOnly: true,
                  controller: cariTipiController,
                  suffixMore: true,
                  onTap: () async {
                    var result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Cari Tipi", children: [
                      BottomSheetModel(title: "Alıcı", value: "A", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Alıcı", value: "A"))),
                      BottomSheetModel(title: "Satıcı", value: "S", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Satıcı", value: "S"))),
                      BottomSheetModel(title: "Toptancı", value: "T", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Toptancı", value: "T"))),
                      BottomSheetModel(title: "Kefil", value: "K", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Kefil", value: "K"))),
                      BottomSheetModel(title: "Müstahsil", value: "M", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Müstahsil", value: "M"))),
                      BottomSheetModel(title: "Diğer", value: "D", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Diğer", value: "D"))),
                      BottomSheetModel(title: "Komisyoncu", value: "I", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Komisyoncu", value: "I"))),
                    ]);
                    if (result != null) {
                      cariTipiController.text = result.title;
                      viewModel.changeCariTipi(result.value);
                      // model?.cariTip = result.value;
                      // model?.cariTipAciklama = result.title;
                      // viewModel.changeModel(viewModel.model
                      //   ..cariTipAciklama = result.title);
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
              onChanged: (p0) {
                viewModel.changeAdi(p0);
              },
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Ülke",
              readOnly: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.model?.ulkeKodu ?? model?.ulkeKodu ?? "")),
              controller: ulkeController,
              suffixMore: true,
              onClear: () {
                viewModel.changeUlke("");
                model?.ulkeKodu = null;
                model?.ulkeAdi = null;
                viewModel.changeUlke(null);
              },
              onTap: () async {
                ulkeler ??= await getUlkeData();
                if (mounted) {
                  BaseBottomSheetResponseModel? result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "Ülkeler",
                      children: List.generate(
                          ulkeler!.length,
                          (index) => BottomSheetModel(
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
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "İl",
                controller: ilController,
                onChanged: (p0) => viewModel.changeIl(p0),
              )),
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "İlçe",
                controller: ilceCOntroller,
                onChanged: (p0) => viewModel.changeIlce(p0),
              )),
            ]),
            CustomTextField(
              enabled: enabled,
              labelText: "Posta Kodu",
              controller: postaKoduController,
              onChanged: (p0) => viewModel.changePostaKodu(p0),
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Adres",
              controller: adresController,
              onChanged: (p0) => viewModel.changeAdres(p0),
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Telefon",
              controller: telefonController,
              onChanged: (p0) {
                viewModel.changeTelefon(p0);
              },
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "E-Posta",
              controller: ePostaController,
              onChanged: (p0) => viewModel.changeEposta(p0),
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Web",
              controller: webController,
              onChanged: (p0) => viewModel.changeWeb(p0),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "Vergi Dairesi",
                controller: vergiDairesiController,
                onChanged: (p0) => viewModel.changeVergiDairesi(p0),
              )),
              Expanded(child: Observer(builder: (_) {
                return CustomTextField(
                  enabled: enabled,
                  labelText: viewModel.isSahisFirmasi ? "T.C. Kimlik No" : "Vergi No",
                  controller: vergiNoController,
                  keyboardType: TextInputType.number,
                  maxLength: viewModel.isSahisFirmasi ? 11 : 10,
                  onChanged: (p0) => viewModel.changeVergiNo(p0),
                );
              }))
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "Plasiyer",
                readOnly: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model?.plasiyerKodu ?? model?.plasiyerKodu ?? "")),
                controller: plasiyerController,
                suffixMore: true,
                onClear: () {
                  viewModel.changePlasiyer("");
                  model?.plasiyerKodu = null;
                  viewModel.changePlasiyer(null);
                },
                onTap: () async {
                  PlasiyerList? result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "Plasiyer",
                      children: List.generate(anaVeri?.paramModel?.plasiyerList?.length ?? 0,
                          (index) => BottomSheetModel(title: anaVeri?.paramModel?.plasiyerList?[index].plasiyerAciklama ?? "", value: anaVeri?.paramModel?.plasiyerList?[index])));
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
                                  ? (value) {
                                      if (!value) {
                                        dovizController.text = "";
                                        model?.dovizKodu = null;
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
                      enabled: enabled,
                      labelText: "Döviz Tipi",
                      valueWidget: Observer(builder: (_) => Text(viewModel.model?.dovizKodu.toStringIfNotNull ?? model?.dovizKodu.toStringIfNotNull ?? "")),
                      controller: dovizController,
                      readOnly: true,
                      suffixMore: true,
                      onTap: () async {
                        var result = await bottomSheetDialogManager.showDovizBottomSheetDialog(context);
                        if (result is DovizList) {
                          dovizController.text = result.isim ?? "";
                          viewModel.changeDovizTipi(result.dovizKodu);
                        }
                      },
                    ))),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: CustomTextField(
                  enabled: enabled,
                  labelText: "Vade Günü",
                  controller: vadeGunuController,
                  keyboardType: TextInputType.number,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model?.vadeGunu ?? model?.vadeGunu.toStringIfNotNull ?? "")),
                  onChanged: (p0) => viewModel.changeVadeGunu(int.tryParse(p0)),
                )),
                Expanded(
                    child: CustomTextField(
                  enabled: enabled,
                  readOnly: true,
                  labelText: "Ödeme Tipi",
                  controller: odemeTipiController,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model?.odemeTipi ?? model?.odemeTipi ?? "")),
                  suffixMore: true,
                  onClear: () {
                    viewModel.changeOdemeTipi("");
                    model?.odemeTipi = null;
                    viewModel.changeOdemeTipi(null);
                  },
                  onTap: () async {
                    BaseBottomSheetResponseModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Ödeme Tipi", children: [
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
  }

  Future<List<UlkeModel>?> getUlkeData() async {
    var response = await networkManager.dioGet<UlkeModel>(path: ApiUrls.getUlkeler, bodyModel: UlkeModel(), addCKey: true, addSirketBilgileri: true, addTokenKey: true);
    return response.data?.map((e) => e as UlkeModel).toList().cast<UlkeModel>();
  }
}
