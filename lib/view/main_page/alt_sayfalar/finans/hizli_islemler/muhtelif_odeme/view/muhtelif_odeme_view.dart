// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/muhasebe_referans_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/muhasebe_kodu_belge_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/hizli_islemler/muhtelif_odeme/view_model/muhtelif_odeme_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

class MuhtelifOdemeView extends StatefulWidget {
  final bool? tahsilatMi;
  const MuhtelifOdemeView({super.key, this.tahsilatMi});

  @override
  State<MuhtelifOdemeView> createState() => _MuhtelifOdemeViewState();
}

class _MuhtelifOdemeViewState extends BaseState<MuhtelifOdemeView> {
  MuhtelifOdemeViewModel viewModel = MuhtelifOdemeViewModel();
  late final TextEditingController _belgeNoController;
  late final TextEditingController _tarihController;
  late final TextEditingController _kasaController;
  late final TextEditingController _sozlesmeController;
  late final TextEditingController _seriController;
  late final TextEditingController _hesapController;
  late final TextEditingController _tutarController;
  late final TextEditingController _krediKartiNoController;
  late final TextEditingController _referansKoduController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projekoduController;
  late final TextEditingController _aciklamaController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
      viewModel.setTahsilatMi(widget.tahsilatMi);
      viewModel.setTarih(DateTime.now().dateTimeWithoutTime);
    _belgeNoController = TextEditingController();
    _tarihController = TextEditingController(text: viewModel.model.tarih?.toDateString);
    _kasaController = TextEditingController();
    _sozlesmeController = TextEditingController();
    _seriController = TextEditingController();
    _hesapController = TextEditingController();
    _tutarController = TextEditingController();
    _krediKartiNoController = TextEditingController();
    _referansKoduController = TextEditingController();
    _plasiyerController = TextEditingController();
    _projekoduController = TextEditingController();
    _aciklamaController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getKasa();
      await getMuhKodu();
      // await getSeri();

      // viewModel.setPickerBelgeTuru("KKT");
      await viewModel.getSiradakiKod();
      _belgeNoController.text = viewModel.model.belgeNo ?? "";
      _tarihController.text = viewModel.model.tarih?.toDateString ?? "";
    });
    super.initState();
  }

  @override
  void dispose() {
    _belgeNoController.dispose();
    _tarihController.dispose();
    _kasaController.dispose();
    _sozlesmeController.dispose();
    _seriController.dispose();
    _hesapController.dispose();
    _tutarController.dispose();
    _krediKartiNoController.dispose();
    _referansKoduController.dispose();
    _plasiyerController.dispose();
    _projekoduController.dispose();
    _aciklamaController.dispose();

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
      title: Observer(builder: (_) => AppBarTitle(title: "Muhtelif ${viewModel.model.tahsilatmi == true ? "Tahsilat" : "Ödeme"}")),
      actions: [
        IconButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              viewModel.setAciklama(_aciklamaController.text);
              await dialogManager.showAreYouSureDialog(() async {
                var result = await viewModel.postData();
                if (result.success == true) {
                  Get.back(result: true);
                  dialogManager.showSuccessSnackBar(result.message ?? "Kayıt başarılı");
                }
              });
            }
          },
          icon: const Icon(Icons.save_outlined),
        ),
      ],
    );
  }

  SingleChildScrollView body(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
          CustomTextField(
              labelText: "Belge No",
              controller: _belgeNoController,
              maxLength: 15,
              onChanged: (value) => viewModel.setBelgeNo(value),
              suffix: IconButton(
                onPressed: () async {
                  await viewModel.getSiradakiKod();
                  _belgeNoController.text = viewModel.model.belgeNo ?? "";
                },
                icon: const Icon(Icons.add_outlined),
              )),
          Observer(builder: (_) {
            return Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "Tarih",
                    controller: _tarihController,
                    isMust: true,
                    isDateTime: true,
                    readOnly: true,
                    onTap: () async {
                      var result = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime(2100));
                      if (result != null) {
                        _tarihController.text = result.toDateString;
                        viewModel.setTarih(result.dateTimeWithoutTime);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Kasa",
                    controller: _kasaController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.kasaKodu ?? "")),
                    onTap: () async => await getKasa(),
                  ),
                ),
              ],
            );
          }),
          Observer(builder: (_) {
            return Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "Muh. Kodu",
                    controller: _hesapController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.hesapKodu ?? "")),
                    onTap: () async => await getMuhKodu(),
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Tutar",
                    controller: _tutarController,
                    isMust: true,
                    isFormattedString: true,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    onChanged: (value) => viewModel.setTutar(value.toDoubleWithFormattedString),
                  ),
                ),
              ],
            );
          }),
          Observer(builder: (_) {
            return Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    labelText: "Plasiyer",
                    controller: _plasiyerController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                    onTap: () async {
                      var result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context);
                      if (result is PlasiyerList) {
                        _plasiyerController.text = result.plasiyerAciklama ?? "";
                        viewModel.setPlasiyerKodu(result);
                      }
                    },
                  ),
                ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi == true),
                Expanded(
                  child: CustomTextField(
                    labelText: "Referans Kodu",
                    controller: _referansKoduController,
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model.refKod ?? "")),
                    onTap: () async {
                      if (viewModel.muhaRefList.ext.isNullOrEmpty) {
                        await viewModel.getMuhaRefList();
                      }
                      var result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context,
                          title: "Referans Kodu", children: viewModel.muhaRefList!.map((e) => BottomSheetModel(title: e.tanimi ?? "", value: e)).toList());
                      if (result is MuhasebeReferansModel) {
                        _referansKoduController.text = result.tanimi ?? "";
                        viewModel.setReferansKodu(result.kodu);
                      }
                    },
                  ),
                ).yetkiVarMi(yetkiController.referansKodu(viewModel.showReferansKodu))
              ],
            );
          }),
          CustomTextField(
            labelText: "Kasa Har. Açıklama",
            controller: _aciklamaController,
            onChanged: (value) => viewModel.setAciklama(value),
          ),
        ]).paddingAll(UIHelper.lowSize),
      ),
    );
  }

  Future<void> getMuhKodu() async {
    var result = await bottomSheetDialogManager.showMuhasebeMuhasebeKoduBottomSheetDialog(context, belgeTipi: MuhasebeBelgeTipiEnum.muo, hesapTipi: viewModel.model.hesapTipi);
    if (result is StokMuhasebeKoduModel) {
      _hesapController.text = result.hesapAdi ?? result.hesapKodu ?? "";
      viewModel.setHesapTipi(result.agm);
      viewModel.setShowReferansKodu(result.hesapTipi);
      viewModel.setHesapKodu(result.hesapKodu);
    }
  }

  Future<void> getKasa() async {
    KasaList? result = await bottomSheetDialogManager.showKasaBottomSheetDialog(context);
    if (result != null) {
      _kasaController.text = result.kasaTanimi ?? "";
      viewModel.setKasaKodu(result.kasaKodu);
    }
  }
}
