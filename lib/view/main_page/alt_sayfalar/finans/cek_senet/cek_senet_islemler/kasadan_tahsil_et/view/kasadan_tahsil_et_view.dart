import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../core/base/model/muhasebe_referans_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../../core/constants/enum/cek_senet_listesi_enum.dart";
import "../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../model/param_model.dart";
import "../../../cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "../../../cek_senet_tahsilati/model/save_cek_senet_model.dart";
import "../view_model/kasadan_tahsil_et_view_model.dart";

class KasadanTahsilEtView extends StatefulWidget {
  final CekSenetListesiModel model;
  const KasadanTahsilEtView({super.key, required this.model});

  @override
  State<KasadanTahsilEtView> createState() => _KasadanTahsilEtViewState();
}

class _KasadanTahsilEtViewState extends BaseState<KasadanTahsilEtView> {
  late final KasadanTahsilEtViewModel viewModel;
  CekSenetListesiModel get model => widget.model;
  CekSenetListesiEnum get cekSenetEnum => widget.model.cekSenetListesiEnum;
  late final TextEditingController _tarihController;
  late final TextEditingController _kasaController;
  late final TextEditingController _musteriCekiController;
  late final TextEditingController _tutarController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projeController;
  late final TextEditingController _referansKoduController;
  late final TextEditingController _kasaHarAciklamaController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel = KasadanTahsilEtViewModel(model: SaveCekSenetModel.fromCekSenetListesiModel(model));
    viewModel.model.gc = cekSenetEnum.borcMu ? "C" : "G";
    viewModel.model.tahsilatmi = cekSenetEnum.borcMu ? null : true;
    _tarihController = TextEditingController(text: model.tarih.toDateString);
    _kasaController = TextEditingController();
    _musteriCekiController = TextEditingController(text: model.belgeNo);
    _tutarController = TextEditingController(text: model.tutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    _plasiyerController = TextEditingController(text: model.plasiyerKodu);
    _projeController = TextEditingController(text: model.projeKodu);
    _referansKoduController = TextEditingController();
    _kasaHarAciklamaController = TextEditingController(text: viewModel.aciklama);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await setKasa();
    });
    super.initState();
  }

  @override
  void dispose() {
    _tarihController.dispose();
    _kasaController.dispose();
    _musteriCekiController.dispose();
    _tutarController.dispose();
    _plasiyerController.dispose();
    _projeController.dispose();
    _referansKoduController.dispose();
    _kasaHarAciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Kasadan Tahsil Et",
            subtitle: cekSenetEnum.title,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  dialogManager.showAreYouSureDialog(() async {
                    if (viewModel.model.tutar case (null || 0.0)) {
                      dialogManager.showErrorSnackBar("Tutar boş bırakılamaz!");
                      return;
                    }
                    viewModel.model.guid = const Uuid().v4();
                    final result = await viewModel.postData();
                    if (result.isSuccess) {
                      dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                      Get.back(result: true);
                    }
                  });
                  // await viewModel.saveData();
                  // await Get.back(result: true);
                }
              },
              icon: const Icon(Icons.save_outlined),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Tarih",
                        controller: _tarihController,
                        isDateTime: true,
                        isMust: true,
                        readOnly: true,
                        onTap: setTarih,
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
                        onTap: setKasa,
                      ),
                    ),
                  ],
                ),
                CustomTextField(
                  labelText: "Müşteri Çeki",
                  controller: _musteriCekiController,
                  onChanged: (value) {
                    viewModel.setMusteriCeki(value);
                    _kasaHarAciklamaController.text = viewModel.aciklama;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Tutar",
                        controller: _tutarController,
                        isMust: true,
                        readOnly: true,
                      ),
                    ),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Plasiyer",
                        controller: _plasiyerController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                        onTap: setPlasiyerKodu,
                      ),
                    ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Proje",
                        controller: _projeController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                        onTap: setProjekodu,
                      ),
                    ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Referans Kodu",
                        controller: _referansKoduController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model.refKod ?? "")),
                        onTap: setReferansKodu,
                      ),
                    ).yetkiVarMi(!cekSenetEnum.borcMu),
                  ],
                ),
                CustomTextField(labelText: "Kasa Har. Açıklama", controller: _kasaHarAciklamaController, onChanged: viewModel.setKasaHarAciklama),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );

  Future<void> setTarih() async {
    final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.tarih);
    if (result != null) {
      viewModel.setTarih(result);
      _tarihController.text = result.toDateString;
    }
  }

  Future<void> setKasa() async {
    final result = await bottomSheetDialogManager.showKasaBottomSheetDialog(context, viewModel.model.kasaKodu);
    if (result is KasaList) {
      viewModel.setKasaKodu(result.kasaKodu);
      _kasaController.text = result.kasaTanimi ?? "";
    }
  }

  Future<void> setPlasiyerKodu() async {
    final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
    if (result is PlasiyerList) {
      viewModel.setPlasiyerKodu(result.plasiyerKodu);
      _plasiyerController.text = result.plasiyerAciklama ?? "";
    }
  }

  Future<void> setProjekodu() async {
    final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
    if (result is BaseProjeModel) {
      viewModel.setProjeKodu(result.projeKodu);
      _projeController.text = result.projeAciklama ?? "";
    }
  }

  Future<void> setReferansKodu() async {
    final result = await bottomSheetDialogManager.showReferansKodBottomSheetDialog(context, viewModel.model.refKod);
    if (result is MuhasebeReferansModel) {
      viewModel.setReferansKodu(result.kodu);
      _referansKoduController.text = result.tanimi ?? "";
    }
  }
}
