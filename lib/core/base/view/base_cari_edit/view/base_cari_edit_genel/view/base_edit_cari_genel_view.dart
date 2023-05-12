import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:picker/core/base/helpers/helper.dart';
import 'package:picker/core/base/model/base_bottom_sheet_response_model.dart';
import 'package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart';
import 'package:picker/core/components/textfield/custom_label_widget.dart';
import 'package:picker/core/components/textfield/custom_text_field.dart';
import 'package:picker/core/init/cache/cache_manager.dart';
import 'package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart';

import '../../../../../../../view/main_page/model/main_page_model.dart';
import '../../../../../../constants/enum/cari_edit_enum.dart';
import '../../../../../state/base_state.dart';
import '../model/base_cari_edit_model.dart';
import '../model/ulke_model.dart';
import '../view_model/base_cari_genel_edit_view_model.dart';

class BaseEditCariGenelView extends StatefulWidget {
  final BaseCariEditModel? model;
  const BaseEditCariGenelView({super.key, this.model});

  @override
  State<BaseEditCariGenelView> createState() => _BaseEditCariGenelViewState();
}

class _BaseEditCariGenelViewState extends BaseState<BaseEditCariGenelView> {
  BaseCariGenelEditViewModel? viewModel = BaseCariGenelEditViewModel();
  MainPageModel? anaVeri = CacheManager.getAnaVeri();
  CariListesiModel? get model => widget.model?.model;
  List? ulkeler;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    viewModel?.changeModel(model);
    viewModel?.changeIsSahisFirmasi(model?.sahisFirmasiMi ?? false);
    viewModel?.changeIsDovizli(model?.dovizli ?? false);
  }

  @override
  Widget build(BuildContext context) {
    CariListesiModel.setInstance(model);
    bool enabled = widget.model?.cariEditEnum != CariEditEnum.goruntule;
    TextEditingController kodController = TextEditingController(text: viewModel?.model?.cariKodu);
    TextEditingController cariTipiController = TextEditingController(text: viewModel?.model?.cariTipAciklama);
    TextEditingController adController = TextEditingController(text: viewModel?.model?.cariAdi);
    TextEditingController ulkeController = TextEditingController(text: viewModel?.model?.ulkeAdi);
    TextEditingController ilController = TextEditingController(text: viewModel?.model?.cariIl);
    TextEditingController ilceCOntroller = TextEditingController(text: viewModel?.model?.cariIlce);
    TextEditingController postaKoduController = TextEditingController(text: viewModel?.model?.postakodu);
    TextEditingController adresController = TextEditingController(text: viewModel?.model?.cariAdres);
    TextEditingController telefonController = TextEditingController(text: viewModel?.model?.cariTel);
    TextEditingController ePostaController = TextEditingController(text: viewModel?.model?.email);
    TextEditingController webController = TextEditingController(text: viewModel?.model?.web);
    TextEditingController vergiDairesiController = TextEditingController(text: viewModel?.model?.vergiDairesi);
    TextEditingController vergiNoController = TextEditingController(text: viewModel?.model?.vergiNumarasi);
    TextEditingController dovizController = TextEditingController(text: viewModel?.model?.dovizAdi);
    TextEditingController plasiyerController = TextEditingController(text: viewModel?.model?.plasiyerAciklama);
    TextEditingController vadeGunuController = TextEditingController(text: viewModel?.model?.vadeGunu?.toStringIfNull ?? "");
    //! Hangi parametreyi alacak diye sor
    TextEditingController odemeGunController = TextEditingController(text: viewModel?.model?.odemeTipi ?? "");
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomWidgetWithLabel(
                isVertical: true,
                text: "Şahıs Firması",
                children: [
                  Observer(
                      builder: (_) => Switch.adaptive(
                          value: viewModel?.isSahisFirmasi ?? false,
                          onChanged: enabled
                              ? (value) {
                                  viewModel!.changeIsSahisFirmasi(value);
                                }
                              : null)),
                ],
              ),
            ),
            Row(children: [
              Expanded(child: CustomTextField(enabled: enabled, isMust: true, labelText: "Kodu", controller: kodController)),
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                isMust: true,
                labelText: "Cari Tipi",
                valueText: viewModel?.model?.cariTip,
                readOnly: true,
                controller: cariTipiController,
                onTap: () async {
                  var result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Cari Tipi", children: [
                    BottomSheetModel(title: "Alıcı", value: "A", description: "A", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Alıcı", value: "A"))),
                    BottomSheetModel(title: "Satıcı", value: "S", description: "S", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Satıcı", value: "S"))),
                    BottomSheetModel(title: "Toptancı", value: "T", description: "T", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Toptancı", value: "T"))),
                    BottomSheetModel(title: "Kefil", value: "K", description: "K", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Kefil", value: "K"))),
                    BottomSheetModel(title: "Müstahsil", value: "M", description: "M", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Müstahsil", value: "M"))),
                    BottomSheetModel(title: "Diğer", value: "D", description: "D", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Diğer", value: "D"))),
                    BottomSheetModel(title: "Komisyoncu", value: "I", description: "I", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Komisyoncu", value: "I"))),
                  ]);
                  if (result != null) {
                    setState(() {
                      viewModel?.changeModel(model
                        ?..cariTip = result.value
                        ..cariTipAciklama = result.title);
                    });
                  }
                },
                suffix: const Icon(Icons.more_horiz_outlined),
              ))
            ]),
            CustomTextField(enabled: enabled, labelText: "Adı", controller: adController, isMust: true),
            CustomTextField(
                enabled: enabled,
                labelText: "Ülke",
                readOnly: true,
                valueText: model?.ulkeKodu,
                controller: ulkeController,
                onTap: () async {
                  ulkeler ??= await getUlkeData();
                  if (mounted) {
                    BaseBottomSheetResponseModel? result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                        title: "Ülkeler",
                        children: List.generate(
                            ulkeler!.length,
                            (index) => BottomSheetModel(
                                title: ulkeler?[index].ulkeAdi!,
                                value: ulkeler?[index].ulkeKodu,
                                description: ulkeler?[index].ulkeKodu,
                                onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: ulkeler?[index].ulkeAdi, value: ulkeler?[index].ulkeKodu)))));
                    setState(() {
                      viewModel?.changeModel(model
                        ?..ulkeAdi = result?.title
                        ..ulkeKodu = result?.value);
                    });
                  }
                },
                suffix: Observer(
                  builder: (_) => viewModel?.model?.ulkeAdi == null
                      ? const Icon(Icons.more_horiz_outlined)
                      : IconButton(
                          icon: const Icon(Icons.clear_outlined),
                          onPressed: () => setState(() => viewModel?.changeModel(model
                            ?..ulkeAdi = null
                            ..ulkeKodu = null))),
                )),
            Row(children: [
              Expanded(child: CustomTextField(enabled: enabled, labelText: "İl", controller: ilController)),
              Expanded(child: CustomTextField(enabled: enabled, labelText: "İlçe", controller: ilceCOntroller)),
            ]),
            CustomTextField(enabled: enabled, labelText: "Posta Kodu", controller: postaKoduController),
            CustomTextField(enabled: enabled, labelText: "Adres", controller: adresController),
            CustomTextField(enabled: enabled, labelText: "Telefon", controller: telefonController),
            CustomTextField(enabled: enabled, labelText: "E-Posta", controller: ePostaController),
            CustomTextField(enabled: enabled, labelText: "Web", controller: webController),
            Row(children: [
              Expanded(child: CustomTextField(enabled: enabled, labelText: "Vergi Dairesi", controller: vergiDairesiController)),
              Expanded(child: CustomTextField(enabled: enabled, labelText: "Vergi No", controller: vergiNoController))
            ]),
            Row(children: [
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "Plasiyer",
                readOnly: true,
                valueText: model?.plasiyerKodu,
                controller: plasiyerController,
                onTap: () {
                  bottomSheetDialogManager.showBottomSheetDialog(context,
                      title: "PLasiyer",
                      children: List.generate(
                          anaVeri?.paramModel?.plasiyerList?.length ?? 0,
                          (index) => BottomSheetModel(
                              title: anaVeri?.paramModel?.plasiyerList?[index].plasiyerAciklama ?? "",
                              value: anaVeri?.paramModel?.plasiyerList?[index].plasiyerKodu ?? "",
                              onTap: () {
                                setState(() {
                                  viewModel?.changeModel(model
                                    ?..plasiyerKodu = anaVeri?.paramModel?.plasiyerList?[index].plasiyerKodu
                                    ..plasiyerAciklama = anaVeri?.paramModel?.plasiyerList?[index].plasiyerAciklama);
                                });
                                Get.back();
                              })));
                },
                suffix: Observer(
                  builder: (_) => viewModel?.model?.plasiyerAciklama == null
                      ? const Icon(Icons.more_horiz_outlined)
                      : IconButton(
                          icon: const Icon(Icons.clear_outlined),
                          onPressed: () => setState(() => viewModel?.changeModel(model
                            ?..plasiyerAciklama = null
                            ..plasiyerKodu = null))),
                ),
              )),
              Expanded(
                  child: CustomWidgetWithLabel(
                      isVertical: true,
                      text: "Dövizli",
                      children: [Observer(builder: (_) => Switch.adaptive(value: viewModel?.isDovizli ?? false, onChanged: enabled ? (value) => viewModel!.changeIsDovizli(value) : null))]))
            ]),
            Observer(
                builder: (_) => Visibility(
                    visible: viewModel!.isDovizli,
                    child: CustomTextField(
                      enabled: enabled,
                      labelText: "Döviz Tipi",
                      valueText: model?.dovizKodu == null ? "" : model?.dovizKodu.toString(),
                      controller: dovizController,
                      readOnly: true,
                      suffix: IconButton(
                          onPressed: () async {
                            var dovizList = anaVeri?.paramModel?.dovizList;
                            await bottomSheetDialogManager.showBottomSheetDialog(context,
                                title: "Döviz Tipi",
                                children: List.generate(
                                    dovizList!.length,
                                    (index) => BottomSheetModel(
                                        title: dovizList[index].isim!,
                                        value: dovizList[index].dovizKodu.toString(),
                                        onTap: () {
                                          setState(() {
                                            viewModel?.changeModel(model
                                              ?..dovizAdi = anaVeri?.paramModel?.dovizList?[index].isim.toString()
                                              ..dovizKodu = anaVeri?.paramModel?.dovizList?[index].dovizKodu);
                                          });
                                          Get.back();
                                        })));
                          },
                          icon: const Icon(Icons.more_horiz_outlined)),
                    ))),
            Row(
              children: [
                Expanded(child: CustomTextField(enabled: enabled, labelText: "Vade Günü", valueText: model?.dovizKodu?.toStringIfNull, controller: vadeGunuController)),
                Expanded(
                    child: CustomTextField(
                        enabled: enabled,
                        readOnly: true,
                        labelText: "Ödeme Günü",
                        controller: odemeGunController,
                        onTap: () async {
                          BaseBottomSheetResponseModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Ödeme Günü", children: [
                            BottomSheetModel(title: "Nakit", value: "0", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Nakit", value: "0"))),
                            BottomSheetModel(title: "Havale", value: "1", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Havale", value: "1"))),
                            BottomSheetModel(title: "Çek", value: "2", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Çek", value: "2"))),
                          ]);
                          if (result != null) {
                            setState(() {
                              viewModel?.changeModel(model?..odemeTipi = result.title);
                            });
                          }
                        },
                        suffix: Observer(
                            builder: (_) => viewModel?.model?.odemeTipi == null
                                ? const Icon(Icons.more_horiz_outlined)
                                : IconButton(icon: const Icon(Icons.clear_outlined), onPressed: () => setState(() => viewModel?.changeModel(model?..odemeTipi = null))))))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<UlkeModel>?> getUlkeData() async {
    var response = await networkManager.dioGet<UlkeModel>(path: ApiUrls.getUlkeler, bodyModel: UlkeModel(), addCKey: true, addSirketBilgileri: true, addTokenKey: true);
    // cast all items to UlkeModel and return
    return response.data?.map((e) => e as UlkeModel).toList().cast<UlkeModel>();
  }
}
