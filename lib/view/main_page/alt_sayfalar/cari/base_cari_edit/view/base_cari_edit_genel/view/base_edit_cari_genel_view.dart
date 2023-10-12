import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";

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
import "../../../../cari_listesi/model/cari_detay_model.dart";
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
  CariListesiModel? get model => widget.model?.model;
  List<UlkeModel>? ulkeler;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CariSaveRequestModel requestModel = CariSaveRequestModel.instance;
  FocusNode focusNode = FocusNode();
  List<CariDetayModel>? cariDetayListesi;
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
    // StaticVariables.instance.cariKartiGenelFormKey.currentState?.activate();
    if (widget.model?.baseEditEnum != BaseEditEnum.ekle &&
        widget.model?.baseEditEnum != BaseEditEnum.kopyala) {
      getCariDetay(model?.cariKodu ?? "");
    }
    viewModel.setModel(model);
    viewModel.changeIsSahisFirmasi(model?.sahisFirmasiMi ?? false);
    viewModel.changeIsDovizli(model?.dovizli ?? false);

    kodController = TextEditingController(text: viewModel.model?.cariKodu);
    cariTipiController =
        TextEditingController(text: viewModel.model?.cariTipAciklama);
    adController = TextEditingController(text: viewModel.model?.cariAdi);
    ulkeController = TextEditingController(text: viewModel.model?.ulkeAdi);
    ilController = TextEditingController(text: viewModel.model?.cariIl);
    ilceCOntroller = TextEditingController(text: viewModel.model?.cariIlce);
    postaKoduController =
        TextEditingController(text: viewModel.model?.postakodu);
    adresController = TextEditingController(text: viewModel.model?.cariAdres);
    telefonController = TextEditingController(text: viewModel.model?.cariTel);
    ePostaController = TextEditingController(text: viewModel.model?.email);
    webController = TextEditingController(text: viewModel.model?.web);
    vergiDairesiController =
        TextEditingController(text: viewModel.model?.vergiDairesi);
    vergiNoController =
        TextEditingController(text: viewModel.model?.vergiNumarasi);
    dovizController = TextEditingController(text: viewModel.model?.dovizAdi);
    plasiyerController =
        TextEditingController(text: viewModel.model?.plasiyerAciklama);
    vadeGunuController = TextEditingController(
        text: viewModel.model?.vadeGunu?.toStringIfNotNull ?? "");
    odemeTipiController = TextEditingController(
        text: viewModel.model?.odemeTipi == "0"
            ? "Peşin"
            : viewModel.model?.odemeTipi == "1"
                ? "Vade"
                : viewModel.model?.odemeTipi == "2"
                    ? "Çek"
                    : viewModel.model?.odemeTipi == "3"
                        ? "Senet"
                        : "");
    enabled = widget.model?.baseEditEnum != BaseEditEnum.goruntule;
    CariListesiModel.instance.subeKodu ??= 0;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (model?.cariKodu == null || model?.cariKodu == "") {
        viewModel.changeSiradakiKod(widget.model?.siradakiKod);
        kodController.text = widget.model?.siradakiKod ?? "";
      }
    });
    // viewModel.changeModel(viewModel.model);
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
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        key: StaticVariables.instance.cariKartiGenelFormKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomWidgetWithLabel(
                isVertical: true,
                text: "Şahıs Firması",
                child: Observer(
                    builder: (_) => Switch.adaptive(
                        value: viewModel.isSahisFirmasi,
                        onChanged: enabled
                            ? (value) {
                                viewModel.changeIsSahisFirmasi(value);
                                viewModel.model?.sahisFirmasiMi = value;
                                viewModel.changeModel(viewModel.model);
                              }
                            : null)),
              ),
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: CustomTextField(
                enabled: enabled &&
                    (widget.model?.baseEditEnum == BaseEditEnum.ekle ||
                        widget.model?.baseEditEnum == BaseEditEnum.kopyala),
                readOnly: widget.model?.baseEditEnum != BaseEditEnum.ekle &&
                    widget.model?.baseEditEnum != BaseEditEnum.kopyala,
                isMust: true,
                labelText: "Kodu",
                controller: kodController,
                suffix: Wrap(
                  children: [
                    IconButton(
                        onPressed: () async {
                          var result = await Get.toNamed(
                              "/mainPage/cariListesi",
                              arguments: true);
                          if (result != null && result is CariListesiModel) {
                            kodController.text = result.cariKodu ?? "";
                            viewModel.model?.cariKodu = result.cariKodu ?? "";
                            viewModel.changeModel(viewModel.model);
                          }
                          log(result.toString());
                        },
                        icon: const Icon(Icons.more_horiz_outlined)),
                    IconButton(
                        onPressed: () async {
                          String? kod = await CariNetworkManager.getSiradakiKod(
                              kod: kodController.text);
                          kodController.text = kod ?? "";
                          viewModel.model?.cariKodu = kod;
                          viewModel.changeModel(viewModel.model);
                        },
                        icon:
                            const Icon(Icons.format_list_numbered_rtl_outlined))
                  ].map((e) => SizedBox(width: 35, child: e)).toList(),
                ),
              )),
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                isMust: true,
                labelText: "Cari Tipi",
                valueWidget: Observer(
                    builder: (_) => Text(viewModel.model?.cariTip ?? "")),
                readOnly: true,
                controller: cariTipiController,
                suffixMore: true,
                onTap: () async {
                  var result = await bottomSheetDialogManager
                      .showBottomSheetDialog(context,
                          title: "Cari Tipi",
                          children: [
                        BottomSheetModel(
                            title: "Alıcı",
                            value: "A",
                            onTap: () => Get.back(
                                result: BaseBottomSheetResponseModel(
                                    title: "Alıcı", value: "A"))),
                        BottomSheetModel(
                            title: "Satıcı",
                            value: "S",
                            onTap: () => Get.back(
                                result: BaseBottomSheetResponseModel(
                                    title: "Satıcı", value: "S"))),
                        BottomSheetModel(
                            title: "Toptancı",
                            value: "T",
                            onTap: () => Get.back(
                                result: BaseBottomSheetResponseModel(
                                    title: "Toptancı", value: "T"))),
                        BottomSheetModel(
                            title: "Kefil",
                            value: "K",
                            onTap: () => Get.back(
                                result: BaseBottomSheetResponseModel(
                                    title: "Kefil", value: "K"))),
                        BottomSheetModel(
                            title: "Müstahsil",
                            value: "M",
                            onTap: () => Get.back(
                                result: BaseBottomSheetResponseModel(
                                    title: "Müstahsil", value: "M"))),
                        BottomSheetModel(
                            title: "Diğer",
                            value: "D",
                            onTap: () => Get.back(
                                result: BaseBottomSheetResponseModel(
                                    title: "Diğer", value: "D"))),
                        BottomSheetModel(
                            title: "Komisyoncu",
                            value: "I",
                            onTap: () => Get.back(
                                result: BaseBottomSheetResponseModel(
                                    title: "Komisyoncu", value: "I"))),
                      ]);
                  if (result != null) {
                    cariTipiController.text = result.title;
                    viewModel.changeCariTipi(result);
                    // model?.cariTip = result.value;
                    // model?.cariTipAciklama = result.title;
                    // viewModel.changeModel(viewModel.model
                    //   ..cariTipAciklama = result.title);
                  }
                },
              ))
            ]),
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
              valueWidget: Observer(
                  builder: (_) => Text(viewModel.model?.ulkeKodu ?? "")),
              controller: ulkeController,
              suffixMore: true,
              onClear: () => viewModel.changeUlke(null),
              onTap: () async {
                ulkeler ??= await getUlkeData();
                if (mounted) {
                  BaseBottomSheetResponseModel? result =
                      await bottomSheetDialogManager.showBottomSheetDialog(
                          context,
                          title: "Ülkeler",
                          children: List.generate(
                              ulkeler!.length,
                              (index) => BottomSheetModel(
                                  title: ulkeler?[index].ulkeAdi ?? "",
                                  value: ulkeler?[index].ulkeKodu,
                                  description: ulkeler?[index].ulkeKodu,
                                  onTap: () => Get.back(
                                      result: BaseBottomSheetResponseModel(
                                          title: ulkeler?[index].ulkeAdi,
                                          value: ulkeler?[index].ulkeKodu)))));
                  if (result != null) {
                    ulkeController.text = result.title ?? "";
                    viewModel.changeUlke(result);
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
                onChanged: (p0) {
                  viewModel.changeModel(viewModel.model?..cariIl = p0);
                },
              )),
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "İlçe",
                controller: ilceCOntroller,
                onChanged: (p0) {
                  viewModel.changeModel(viewModel.model?..cariIlce = p0);
                },
              )),
            ]),
            CustomTextField(
              enabled: enabled,
              labelText: "Posta Kodu",
              controller: postaKoduController,
              onChanged: (p0) {
                viewModel.changeModel(viewModel.model?..postakodu = p0);
              },
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Adres",
              controller: adresController,
              onChanged: (p0) {
                viewModel.changeModel(viewModel.model?..cariAdres = p0);
              },
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Telefon",
              controller: telefonController,
              onChanged: (p0) {
                viewModel.changeModel(viewModel.model?..cariTel = p0);
              },
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "E-Posta",
              controller: ePostaController,
              onChanged: (p0) {
                viewModel.changeModel(viewModel.model?..email = p0);
              },
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Web",
              controller: webController,
              onChanged: (p0) {
                viewModel.changeModel(viewModel.model?..web = p0);
              },
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "Vergi Dairesi",
                controller: vergiDairesiController,
                onChanged: (p0) {
                  viewModel.changeModel(viewModel.model?..vergiDairesi = p0);
                },
              )),
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "Vergi No",
                controller: vergiNoController,
                onChanged: (p0) {
                  viewModel.changeModel(viewModel.model?..vergiNumarasi = p0);
                },
              ))
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "Plasiyer",
                readOnly: true,
                valueWidget: Observer(
                    builder: (_) => Text(viewModel.model?.plasiyerKodu ?? "")),
                controller: plasiyerController,
                suffixMore: true,
                onClear: () {
                  viewModel.changePlasiyer(null);
                },
                onTap: () async {
                  PlasiyerList? result = await bottomSheetDialogManager
                      .showBottomSheetDialog(context,
                          title: "Plasiyer",
                          children: List.generate(
                              anaVeri?.paramModel?.plasiyerList?.length ?? 0,
                              (index) => BottomSheetModel(
                                  title: anaVeri
                                          ?.paramModel
                                          ?.plasiyerList?[index]
                                          .plasiyerAciklama ??
                                      "",
                                  value: anaVeri
                                      ?.paramModel?.plasiyerList?[index])));
                  if (result != null) {
                    plasiyerController.text = result.plasiyerAciklama ?? "";
                    viewModel.changePlasiyer(result);
                  }
                },
              )).yetkiVarMi(parametreModel.plasiyerUygulamasi == true),
              Expanded(
                  child: CustomWidgetWithLabel(
                      isVertical: true,
                      text: "Dövizli",
                      child: Observer(
                          builder: (_) => Switch.adaptive(
                              value: viewModel.isDovizli,
                              onChanged: enabled
                                  ? (value) {
                                      viewModel.changeIsDovizli(value);
                                      viewModel.model?.dovizli = value;
                                      viewModel.changeModel(viewModel.model);
                                    }
                                  : null))))
            ]),
            Observer(
                builder: (_) => Visibility(
                    visible: viewModel.isDovizli,
                    child: CustomTextField(
                      enabled: enabled,
                      labelText: "Döviz Tipi",
                      valueText: viewModel.model?.dovizKodu == null
                          ? ""
                          : viewModel.model?.dovizKodu.toString(),
                      controller: dovizController,
                      readOnly: true,
                      suffix: IconButton(
                          onPressed: () async {
                            var dovizList = anaVeri?.paramModel?.dovizList;
                            await bottomSheetDialogManager
                                .showBottomSheetDialog(context,
                                    title: "Döviz Tipi",
                                    children: List.generate(
                                        dovizList!.length,
                                        (index) => BottomSheetModel(
                                            title: dovizList[index].isim!,
                                            value: dovizList[index]
                                                .dovizKodu
                                                .toString(),
                                            onTap: () {
                                              dovizController.text =
                                                  dovizList[index].isim ?? "";
                                              viewModel.model?.dovizAdi =
                                                  dovizList[index].isim;
                                              viewModel.model?.dovizKodu =
                                                  dovizList[index].dovizKodu;
                                              viewModel
                                                  .changeModel(viewModel.model);
                                              Get.back();
                                            })));
                          },
                          icon: const Icon(Icons.more_horiz_outlined)),
                    ))),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: CustomTextField(
                  enabled: enabled,
                  labelText: "Vade Günü",
                  valueText: viewModel.model?.dovizKodu?.toStringIfNotNull,
                  controller: vadeGunuController,
                  onChanged: (p0) {
                    vadeGunuController.text = p0;
                    viewModel.model?.vadeGunu = int.tryParse(p0);
                    viewModel.changeModel(viewModel.model);
                  },
                )),
                Expanded(
                    child: CustomTextField(
                  enabled: enabled,
                  readOnly: true,
                  labelText: "Ödeme Tipi",
                  controller: odemeTipiController,
                  valueWidget: Observer(
                      builder: (_) => Text(viewModel.model?.odemeTipi ?? "")),
                  suffixMore: true,
                  onClear: () {
                    viewModel.changeOdemeTipi(null);
                    viewModel.changeModel(viewModel.model?..odemeTipi = null);
                  },
                  onTap: () async {
                    BaseBottomSheetResponseModel? result =
                        await bottomSheetDialogManager
                            .showRadioBottomSheetDialog(context,
                                title: "Ödeme Tipi",
                                children: [
                          BottomSheetModel(
                              title: "Nakit",
                              value: "0",
                              onTap: () => Get.back(
                                  result: BaseBottomSheetResponseModel(
                                      title: "Nakit", value: "0"))),
                          BottomSheetModel(
                              title: "Havale",
                              value: "1",
                              onTap: () => Get.back(
                                  result: BaseBottomSheetResponseModel(
                                      title: "Havale", value: "1"))),
                          BottomSheetModel(
                              title: "Çek",
                              value: "2",
                              onTap: () => Get.back(
                                  result: BaseBottomSheetResponseModel(
                                      title: "Çek", value: "2"))),
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
    var response = await networkManager.dioGet<UlkeModel>(
        path: ApiUrls.getUlkeler,
        bodyModel: UlkeModel(),
        addCKey: true,
        addSirketBilgileri: true,
        addTokenKey: true);
    return response.data?.map((e) => e as UlkeModel).toList().cast<UlkeModel>();
  }

  Future<void> getCariDetay(String query) async {
    var result = await networkManager.dioGet<CariDetayModel>(
        path: ApiUrls.getCariDetay,
        bodyModel: CariDetayModel(),
        queryParameters: {"CariKodu": query});
    if (result.data != null && result.data!.isNotEmpty) {
      CariDetayModel.setInstance(result.data[0]);
      cariDetayListesi = result.data
          .map((e) => e as CariDetayModel)
          .toList()
          .cast<CariDetayModel>();
    }
  }
}
