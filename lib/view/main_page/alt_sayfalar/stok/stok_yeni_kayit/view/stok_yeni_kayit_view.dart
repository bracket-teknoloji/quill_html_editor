import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:mobx/mobx.dart";

import "../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../../model/param_model.dart";
import "../../stok_hareketleri/model/stok_hareketleri_model.dart";
import "../model/stok_yeni_kayit_model.dart";
import "../view_model/stok_yeni_kayit_view_model.dart";

class StokYeniKayitView extends StatefulWidget {
  final StokHareketleriModel? model;
  const StokYeniKayitView({super.key, this.model});

  @override
  State<StokYeniKayitView> createState() => _StokYeniKayitViewState();
}

class _StokYeniKayitViewState extends BaseState<StokYeniKayitView> {
  late StokYeniKayitViewModel viewModel = StokYeniKayitViewModel()..isSelected = (widget.model?.cikisIslemi ?? false) ? [false, true].asObservable() : ([true, false]).asObservable();
  late final TextEditingController stokKoduController = TextEditingController(text: widget.model?.stokKodu ?? "");
  late final TextEditingController tarihController = TextEditingController(text: widget.model?.stharTarih?.toDateString ?? viewModel.model.tarih.toDateString);
  late final TextEditingController belgeNoController = TextEditingController(text: widget.model?.fisno ?? viewModel.model.belgeNo);
  late final TextEditingController hareketTuruController = TextEditingController(text: widget.model?.hareketTuruAciklama ?? viewModel.model.hareketTuru);
  late final TextEditingController fiyatController = TextEditingController(text: widget.model?.stharNf.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? viewModel.model.fiyat.toStringIfNotNull);
  late final TextEditingController depoController = TextEditingController(text: widget.model?.depoKodu.toStringIfNotNull ?? viewModel.model.depoKodu.toStringIfNotNull);
  late final TextEditingController miktarController = TextEditingController(text: widget.model?.stharGcmik.toStringIfNotNull ?? viewModel.model.miktar.toStringIfNotNull);
  late final TextEditingController aciklamaController = TextEditingController(text: widget.model?.aciklama ?? viewModel.model.aciklama);
  late final TextEditingController plasiyerController = TextEditingController(text: widget.model?.plasiyerAciklama ?? viewModel.model.plasiyerKodu);
  late final TextEditingController projeController = TextEditingController(text: widget.model?.projeKodu ?? viewModel.model.projeKodu);
  final GlobalKey key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Yeni Stok hareket Kaydı"),
          actions: [
            IconButton(
              onPressed: () async {
                //check if form is valid
                if ((key.currentState as FormState).validate()) {
                  dialogManager.showAreYouSureDialog(() async {
                    dialogManager.showLoadingDialog("Kaydediliyor");
                    viewModel.setStokKodu(stokKoduController.text);
                    final GenericResponseModel result = await networkManager.dioPost<StokYeniKayitModel>(
                      path: ApiUrls.saveStokHareket,
                      bodyModel: StokYeniKayitModel(),
                      addCKey: true,
                      addSirketBilgileri: true,
                      data: viewModel.model.toJson(),
                    );
                    dialogManager.hideAlertDialog;
                    if (result.success ?? false) {
                      dialogManager.showSuccessSnackBar("Kayıt başarılı");
                      Get.back();
                    } else {
                      dialogManager.showErrorSnackBar("Kayıt başarısız");
                    }
                  });
                }
              },
              icon: const Icon(Icons.save_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: key,
            child: Column(
              children: [
                Center(
                  child: Observer(
                    builder: (_) => ToggleButtons(
                      constraints: BoxConstraints(minWidth: width / 2.1, minHeight: height / 20),
                      isSelected: viewModel.isSelected,
                      children: viewModel.toggleButtonName.map(Text.new).toList(),
                      onPressed: (index) {
                        viewModel.model.gc = index == 0 ? "G" : "C";
                        viewModel.changeIsSelected(index);
                      },
                    ),
                  ),
                ),
                CustomTextField(
                  labelText: "Stok",
                  valueText: widget.model?.stokKodu ?? "",
                  readOnly: true,
                  isMust: true,
                  controller: stokKoduController,
                ),
                CustomTextField(
                  labelText: "Tarih",
                  isMust: true,
                  readOnly: true,
                  controller: tarihController,
                  isDateTime: true,
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: viewModel.model.tarih ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    ).then((value) {
                      if (value != null) {
                        viewModel.model.tarih = value;
                        tarihController.text = viewModel.model.tarih.toDateString;
                      }
                    });
                  },
                ),
                CustomTextField(
                  labelText: "Belge No",
                  controller: belgeNoController,
                  onSubmitted: (p0) {
                    viewModel.model.belgeNo = p0;
                    belgeNoController.text = viewModel.model.belgeNo ?? "";
                  },
                ),
                CustomTextField(
                  labelText: "Hareket Türü",
                  valueText: viewModel.model.hareketTuru,
                  isMust: true,
                  readOnly: true,
                  controller: hareketTuruController,
                  suffixMore: true,
                  onTap: () async {
                    final MapEntry? result = await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: "Hareket Türü",
                      children: viewModel.hareketTurMap.entries.map((e) => BottomSheetModel(title: e.key, description: e.value, onTap: () => Get.back(result: e))).toList(),
                    );
                    if (result != null) {
                      hareketTuruController.text = result.key;
                      viewModel.model.hareketTuru = result.value;
                    }
                  },
                ),
                CustomTextField(
                  labelText: "Fiyat",
                  controller: fiyatController,
                  keyboardType: TextInputType.number,
                  onSubmitted: (p0) {
                    if (p0.isNotEmpty) {
                      viewModel.model.fiyat = int.tryParse(p0);
                      fiyatController.text = viewModel.model.fiyat.commaSeparatedWithDecimalDigits(OndalikEnum.tutar);
                    }
                  },
                ),
                CustomTextField(
                  labelText: "Depo",
                  isMust: true,
                  readOnly: true,
                  controller: depoController,
                  suffixMore: true,
                  onTap: () async {
                    final DepoList? result = await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: "Depo",
                      children: viewModel.anaVeri?.paramModel?.depoList
                          ?.map((e) => BottomSheetModel(title: e.depoTanimi ?? "", description: e.depoKodu.toStringIfNotNull, onTap: () => Get.back(result: e)))
                          .toList(),
                    );
                    if (result != null) {
                      depoController.text = result.depoTanimi ?? "";
                      viewModel.model.depoKodu = result.depoKodu;
                    }
                  },
                ),
                CustomTextField(
                  labelText: "Miktar",
                  isMust: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Bu alan boş bırakılamaz";
                    }
                    return null;
                  },
                  controller: miktarController,
                  suffix: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          viewModel.model.miktar = (viewModel.model.miktar!) + 1;
                          miktarController.text = viewModel.model.miktar.toStringIfNotNull ?? "";
                        },
                        icon: const Icon(Icons.add),
                      ),
                      IconButton(
                        onPressed: () {
                          if (viewModel.model.miktar! > 0) viewModel.model.miktar = (viewModel.model.miktar!) - 1;
                          miktarController.text = viewModel.model.miktar.toStringIfNotNull ?? "";
                        },
                        icon: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  labelText: "Açıklama",
                  controller: aciklamaController,
                  onSubmitted: (p0) => viewModel.model.aciklama = p0,
                ),
                CustomTextField(
                  labelText: "Plasiyer",
                  isMust: true,
                  readOnly: true,
                  controller: plasiyerController,
                  suffixMore: true,
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: "Plasiyer",
                      children: viewModel.anaVeri?.paramModel?.plasiyerList
                          ?.map(
                            (e) => BottomSheetModel(
                              title: e.plasiyerAciklama ?? "",
                              onTap: () {
                                Get.back(result: e);
                              },
                            ),
                          )
                          .toList(),
                    );
                    if (result != null) {
                      plasiyerController.text = result.plasiyerAciklama ?? "";
                      viewModel.model.plasiyerKodu = result.plasiyerKodu;
                    }
                  },
                ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                CustomTextField(
                  labelText: "Proje",
                  valueText: viewModel.model.projeKodu ?? "",
                  isMust: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Bu alan boş bırakılamaz";
                    }
                    return null;
                  },
                  readOnly: true,
                  controller: projeController,
                  suffixMore: true,
                  onTap: () async {
                    final result = viewModel.projeListesi ?? await getProjeData();
                    if (result != null) {
                      // ignore: use_build_context_synchronously
                      final BaseProjeModel? dialogResult = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        title: "Proje (${result.length})",
                        children: result
                            .map(
                              (e) => BottomSheetModel(
                                title: e.projeKodu ?? "",
                                description: e.projeAciklama ?? "",
                                onTap: () => Get.back(result: e),
                              ),
                            )
                            .toList(),
                      );
                      if (dialogResult != null) {
                        projeController.text = dialogResult.projeAciklama ?? "";
                        viewModel.model.projeKodu = dialogResult.projeKodu;
                      }
                    }
                  },
                ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
              ].map((e) => e.paddingOnly(bottom: UIHelper.lowSize)).toList(),
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );

  Future<List<BaseProjeModel>?> getProjeData() async {
    dialogManager.showLoadingDialog("Proje Listesi Getiriliyor...");
    final result = await networkManager.dioGet<BaseProjeModel>(path: ApiUrls.getProjeler, bodyModel: BaseProjeModel());

    dialogManager.hideAlertDialog;
    if (result.success ?? false) {
      viewModel.setProjeListesi(result.data.map((e) => e as BaseProjeModel).toList().cast<BaseProjeModel>());
      return result.data.map((e) => e as BaseProjeModel).toList().cast<BaseProjeModel>();
    }
    return null;
  }
}
