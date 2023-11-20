import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_islemler/cari_hesaba_cirola/view_model/cari_hesaba_cirola_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/cek_senet/cek_senet_listesi/model/cek_senet_listesi_model.dart";
import "package:picker/view/main_page/model/param_model.dart";
import "package:uuid/uuid.dart";

class CariHesabaCirolaView extends StatefulWidget {
  final CekSenetListesiModel model;
  const CariHesabaCirolaView({super.key, required this.model});

  @override
  State<CariHesabaCirolaView> createState() => _CariHesabaCirolaViewState();
}

class _CariHesabaCirolaViewState extends BaseState<CariHesabaCirolaView> {
  CariHesabaCirolaViewModel viewModel = CariHesabaCirolaViewModel();
  CekSenetListesiModel get model => widget.model;
  late final TextEditingController _belgeNoController;
  late final TextEditingController _islemTarihiController;
  late final TextEditingController _cariController;
  late final TextEditingController _projeController;
  late final TextEditingController _plasiyerController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel.model.belgeTipi = model.belgeTipi;
    viewModel.setBelgeNo(model.belgeNo);
    viewModel.setIslemTarihi(DateTime.now());
    viewModel.setCariKodu(CariListesiModel(cariAdi: model.cariAdi, cariKodu: model.cariKodu));
    viewModel.setProjekodu(model.projeKodu);
    viewModel.setPlasiyerKodu(model.plasiyerKodu);
    _belgeNoController = TextEditingController(text: model.belgeNo);
    _islemTarihiController = TextEditingController(text: DateTime.now().toDateString);
    _cariController = TextEditingController(text: model.cariAdi);
    _projeController = TextEditingController(text: model.projeKodu);
    _plasiyerController = TextEditingController(text: model.plasiyerKodu);
    super.initState();
  }

  @override
  void dispose() {
    _belgeNoController.dispose();
    _islemTarihiController.dispose();
    _cariController.dispose();
    _projeController.dispose();
    _plasiyerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Cari Hesaba Cirola",
            subtitle: model.belgeNo ?? "",
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (_formKey.currentState?.validate() ?? false) {
                  viewModel.model.guid = const Uuid().v4();
                  final result = await viewModel.saveData();
                  if (result.success ?? false) {
                    Get.back(result: true);
                    dialogManager.showSuccessSnackBar(result.message ?? "İşlem başarılı");
                  }
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
                CustomTextField(
                  labelText: "Belge No",
                  controller: _belgeNoController,
                  readOnly: true,
                ),
                CustomTextField(
                  labelText: "İşlem Tarihi",
                  controller: _islemTarihiController,
                  isDateTime: true,
                  isMust: true,
                  readOnly: true,
                  onTap: setTarih,
                ),
                CustomTextField(
                  labelText: "Cari",
                  controller: _cariController,
                  isMust: true,
                  readOnly: true,
                  suffixMore: true,
                  suffix: IconButton(onPressed: getCariIslemler, icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor)),
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.verilenKodu ?? "")),
                  onTap: setCari,
                ),
                CustomTextField(
                  labelText: "Proje",
                  controller: _projeController,
                  isMust: true,
                  readOnly: true,
                  suffixMore: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.projeKodu ?? "")),
                  onTap: setProjekodu,
                ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
                CustomTextField(
                  labelText: "Plasiyer",
                  controller: _plasiyerController,
                  isMust: true,
                  readOnly: true,
                  suffixMore: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
                  onTap: setPlasiyerKodu,
                ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
              ],
            ),
          ),
        ),
      );

  Future<void> setTarih() async {
    final result = await dialogManager.showDateTimePicker();
    if (result is DateTime) {
      _islemTarihiController.text = result.toDateString;
      viewModel.setIslemTarihi(result);
    }
  }

  Future<void> setCari() async {
    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
    if (result is CariListesiModel) {
      _cariController.text = result.cariAdi ?? "";
      viewModel.setCariKodu(result);
    }
  }

  Future<void> getCariIslemler() async {
    if (viewModel.model.cariKodu != null) {
      dialogManager.showCariGridViewDialog(viewModel.cariListesiModel);
    } else {
      dialogManager.showInfoSnackBar("Cari seçiniz");
    }
  }

  Future<void> setProjekodu() async {
    final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model.projeKodu);
    if (result is BaseProjeModel) {
      _projeController.text = result.projeAciklama ?? "";
      viewModel.setProjekodu(result.projeKodu);
    }
  }

  Future<void> setPlasiyerKodu() async {
    final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
    if (result is PlasiyerList) {
      _plasiyerController.text = result.plasiyerAciklama ?? "";
      viewModel.setPlasiyerKodu(result.plasiyerKodu);
    }
  }
}
