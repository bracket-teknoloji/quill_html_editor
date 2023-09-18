import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../../model/main_page_model.dart";
import "../../cari_hareketleri/model/cari_hareketleri_model.dart";
import "../model/cari_hareket_yeni_kayit_model.dart";
import "../view_model/cari_hareket_yeni_kayit_view_model.dart";

class CariYeniKayitView extends StatefulWidget {
  final BaseEditModel<CariHareketleriModel>? model;
  const CariYeniKayitView({super.key, this.model});

  @override
  State<CariYeniKayitView> createState() => _CariYeniKayitViewState();
}

class _CariYeniKayitViewState extends BaseState<CariYeniKayitView> {
  CariHareketYeniKayitViewModel viewModel = CariHareketYeniKayitViewModel();
  CariHareketleriModel? get model => widget.model?.model ?? CariHareketleriModel();
  bool get enable => widget.model?.baseEditEnum != BaseEditEnum.goruntule;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController? cariKoduController;
  TextEditingController? tarihController;
  TextEditingController? hareketTuruController;
  TextEditingController? belgeNoController;
  TextEditingController? aciklamaController;
  TextEditingController? vadeTarihiController;
  TextEditingController? tutarController;
  TextEditingController? plasiyerController;
  TextEditingController? projeController;
  MainPageModel? mainPageModel = CacheManager.getAnaVeri();

  @override
  void initState() {
    viewModel.model = CariHareketYeniKayitModel().fromJson(model?.toJson() ?? {});
    viewModel.model.yeniKayit = widget.model == BaseEditModel(model: CariHareketleriModel()) ? true : null;
    viewModel.model.inckeyno = model?.inckeyno;
    viewModel.model.tarih ??= DateTime.now();
    viewModel.model.vadeTarihi ??= DateTime.now();
    cariKoduController = TextEditingController(text: model?.cariAdi);
    tarihController = TextEditingController(text: viewModel.model.tarih?.toDateString);
    hareketTuruController = TextEditingController(text: model?.hareketAciklama);
    belgeNoController = TextEditingController(text: model?.belgeNo);
    aciklamaController = TextEditingController(text: model?.aciklama);
    vadeTarihiController = TextEditingController(text: viewModel.model.vadeTarihi?.toDateString);
    tutarController = TextEditingController(text: model?.borc.toStringIfNotNull ?? model?.alacak.toStringIfNotNull ?? "");
    plasiyerController = TextEditingController(text: model?.plasiyerAciklama);
    projeController = TextEditingController(text: model?.projeAciklama);
    if (widget.model?.baseEditEnum != BaseEditEnum.ekle) {
      viewModel.setIsSelected(model?.borc == null ? 1 : 0);
    }

    super.initState();
  }

  @override
  void dispose() {
    cariKoduController?.dispose();
    tarihController?.dispose();
    hareketTuruController?.dispose();
    belgeNoController?.dispose();
    aciklamaController?.dispose();
    vadeTarihiController?.dispose();
    tutarController?.dispose();
    plasiyerController?.dispose();
    projeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: body(context),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: AppBarTitle(title: "Cari Hareket", subtitle: widget.model!.baseEditEnum!.name),
      actions: [
        Visibility(
          visible: enable,
          child: IconButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  dialogManager.showAreYouSureDialog(() => postData());
                }
              },
              icon: const Icon(Icons.save_outlined)),
        )
      ],
    );
  }

  SingleChildScrollView body(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Observer(
              builder: (_) => ToggleButtons(
                isSelected: viewModel.isSelected,
                constraints: BoxConstraints(minWidth: width / 2.1, minHeight: 50),
                children: viewModel.toggleButtonLabelList.map((e) => Text(e)).toList(),
                onPressed: (index) => widget.model?.baseEditEnum == BaseEditEnum.goruntule ? null : viewModel.setIsSelected(index),
              ),
            ).paddingSymmetric(vertical: UIHelper.lowSize),
            CustomTextField(enabled: enable, labelText: "Cari", valueText: viewModel.model.cariKodu, readOnly: true, isMust: true, validator: validator, controller: cariKoduController),
            CustomTextField(
                enabled: enable,
                labelText: "Tarih",
                isMust: true,
                readOnly: true,
                validator: validator,
                controller: tarihController,
                suffix: const Icon(Icons.calendar_month_outlined),
                onTap: () {
                  showDatePicker(
                    context: context,
                    initialDate: viewModel.model.tarih ?? DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  ).then((value) {
                    if (value != null) {
                      viewModel.model.tarih = value;
                      tarihController?.text = value.toDateString;
                    }
                  });
                }),
            Observer(builder: (_) {
              return CustomTextField(
                enabled: enable,
                labelText: "Hareket Türü",
                valueText: model?.hareketKodu ?? viewModel.getHareketKodu,
                isMust: true,
                validator: validator,
                readOnly: true,
                controller: hareketTuruController,
                suffixMore: true,
                onTap: () async {
                  Map? result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Hareket Türü", children: [
                    BottomSheetModel(title: "Devir", description: "A", onTap: () => Get.back(result: {"title": "Devir", "value": "A"}))
                  ]);
                  if (result != null) {
                    hareketTuruController?.text = result["title"];
                    viewModel.setModelHareketKodu(result["value"]);
                  }
                },
              );
            }),
            CustomTextField(enabled: enable, labelText: "Belge No", controller: belgeNoController, onChanged: (value) => viewModel.model.belgeNo = value),
            CustomTextField(enabled: enable, labelText: "Açıklama", controller: aciklamaController, onChanged: (value) => viewModel.model.aciklama = value),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    enabled: enable,
                    labelText: "Vade Tarihi",
                    isMust: true,
                    readOnly: true,
                    validator: validator,
                    controller: vadeTarihiController,
                    suffix: const Icon(Icons.calendar_month_outlined),
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: viewModel.model.vadeTarihi ?? DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      ).then((value) {
                        if (value != null) {
                          viewModel.model.vadeTarihi = value;
                          vadeTarihiController?.text = value.toDateString;
                        }
                      });
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                      enabled: enable,
                      labelText: "Tutar",
                      isMust: true,
                      validator: validator,
                      controller: tutarController,
                      onChanged: (value) => viewModel.model.borc == null ? viewModel.model.alacak = double.tryParse(value) : viewModel.model.borc = double.tryParse(value)),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    enabled: enable,
                    labelText: "Plasiyer",
                    isMust: true,
                    readOnly: true,
                    validator: validator,
                    controller: plasiyerController,
                    onTap: () async {
                      var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                          title: "Plasiyer",
                          children: mainPageModel?.paramModel?.plasiyerList
                              ?.map((e) =>
                                  BottomSheetModel(title: e.plasiyerAciklama ?? "", description: e.plasiyerKodu, onTap: () => Get.back(result: {"title": e.plasiyerAciklama, "value": e.plasiyerKodu})))
                              .toList());
                      if (result != null) {
                        plasiyerController?.text = result["title"];
                        viewModel.model.plasiyerKodu = result["value"];
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    enabled: enable,
                    labelText: "Proje",
                    readOnly: true,
                    isMust: true,
                    validator: validator,
                    controller: projeController,
                    suffixMore: true,
                    onTap: () async {
                      if (viewModel.projeList.isEmpty) {
                        viewModel.setProjeList(await getProjeData());
                      }
                      // ignore: use_build_context_synchronously
                      var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                          title: "Projeler",
                          children: viewModel.projeList
                              .map((e) => BottomSheetModel(title: e.projeAciklama ?? "", description: e.projeKodu, onTap: () => Get.back(result: {"title": e.projeAciklama, "value": e.projeKodu})))
                              .toList());
                      if (result != null) {
                        projeController?.text = result["title"];
                        viewModel.model.projeKodu = result["value"];
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      ),
    );
  }

  void postData() async {
    var result =
        await networkManager.dioPost<CariHareketleriModel>(path: ApiUrls.saveCariHareket, bodyModel: CariHareketleriModel(), data: viewModel.model.toJson(), addCKey: true, addSirketBilgileri: true);
    if (result.success ?? false) {
      dialogManager.showSuccessSnackBar(result.message ?? "Kayıt Başarılı");
      Get.back(result: false);
    } else {
      dialogManager.showErrorSnackBar(result.message ?? "Kayıt Başarısız");
    }
  }

  String? validator(p0) {
    if (p0 == null || p0.isEmpty) {
      return "Bu alan boş bırakılamaz";
    }
    return null;
  }

  Future<List<BaseProjeModel>?> getProjeData() async {
    dialogManager.showLoadingDialog("Proje Listesi Getiriliyor...");
    var result = await networkManager.dioGet<BaseProjeModel>(path: ApiUrls.getProjeler, bodyModel: BaseProjeModel(), addCKey: true, addSirketBilgileri: true);

    dialogManager.hideAlertDialog;
    if (result.success ?? false) {
      return result.data.map((e) => e as BaseProjeModel).toList().cast<BaseProjeModel>();
    }
    return null;
  }
}
