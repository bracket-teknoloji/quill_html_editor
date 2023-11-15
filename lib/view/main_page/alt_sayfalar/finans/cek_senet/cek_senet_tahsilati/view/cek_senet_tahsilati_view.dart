import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/bottom_bar/bottom_bar.dart";
import "../../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/constants/enum/cek_senet_listesi_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../model/param_model.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../view_model/cek_senet_tahsilati_view_model.dart";

class CekSenetTahsilatiView extends StatefulWidget {
  final CekSenetListesiEnum cekSenetListesiEnum;
  const CekSenetTahsilatiView({super.key, required this.cekSenetListesiEnum});

  @override
  State<CekSenetTahsilatiView> createState() => _CekSenetTahsilatiViewState();
}

class _CekSenetTahsilatiViewState extends BaseState<CekSenetTahsilatiView> {
  CekSenetTahsilatiViewModel viewModel = CekSenetTahsilatiViewModel();
  late final TextEditingController _girisTarihiController;
  late final TextEditingController _cariController;
  late final TextEditingController _plasiyerController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _girisTarihiController = TextEditingController(text: DateTime.now().toDateString);
    _cariController = TextEditingController();
    _plasiyerController = TextEditingController();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      viewModel.setGirisTarihi(DateTime.now());
      await getCari();
    });
    super.initState();
  }

  @override
  void dispose() {
    _girisTarihiController.dispose();
    _cariController.dispose();
    _plasiyerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body().paddingAll(UIHelper.lowSize),
        bottomNavigationBar: bottomBar(),
      );

  AppBar appBar() => AppBar(
        title: Text("${widget.cekSenetListesiEnum.title} Tahsilatı"),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
          IconButton(
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                dialogManager.showAreYouSureDialog(() {
                  dialogManager.showInfoSnackBar("Henüz eklemedim :(");
                });
              }
            },
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      );

  CustomFloatingActionButton fab() => CustomFloatingActionButton(
        isScrolledDown: true,
        onPressed: add,
      );

  Form body() => Form(
        key: _formKey,
        child: Column(
          children: [
            CustomTextField(
              labelText: "Giriş Tarihi",
              controller: _girisTarihiController,
              isDateTime: true,
              isMust: true,
              readOnly: true,
              onTap: getTarih,
            ),
            CustomTextField(
              labelText: "Cari",
              controller: _cariController,
              isMust: true,
              readOnly: true,
              suffixMore: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.model.cariKodu ?? "")),
              suffix: IconButton(
                onPressed: getCariIslemleri,
                icon: Icon(
                  Icons.open_in_new_outlined,
                  color: UIHelper.primaryColor,
                ),
              ),
              onTap: getCari,
            ),
            CustomTextField(
              labelText: "Plasiyer",
              controller: _plasiyerController,
              isMust: true,
              readOnly: true,
              suffixMore: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.model.plasiyerKodu ?? "")),
              onTap: getPlasiyer,
            ),
            const Column(
              children: [
                Icon(Icons.refresh_outlined),
                Text("Bordroya Belge Eklemek İçin Artı Butonunu Kullanın."),
              ],
            ).paddingOnly(top: UIHelper.highSize * 5),
          ],
        ),
      );

  BottomBarWidget bottomBar() => const BottomBarWidget(isScrolledDown: true, children: []);

  Future<void> getTarih() async {
    final result = await dialogManager.showDateTimePicker();
    if (result != null) {
      viewModel.setGirisTarihi(result);
      _girisTarihiController.text = result.toDateString;
    }
  }

  Future<void> getCari() async {
    final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
    if (result is CariListesiModel) {
      viewModel.setCariKodu(result.cariKodu);
      _cariController.text = result.cariAdi ?? "";
    }
  }

  Future<void> getCariIslemleri() async {
    if (viewModel.model.cariKodu == null) {
      dialogManager.showInfoSnackBar("Lütfen cari seçiniz");
      return;
    } else {
      dialogManager.showCariGridViewDialog(CariListesiModel(cariKodu: viewModel.model.cariKodu, cariAdi: _cariController.text));
    }
  }

  Future<void> getPlasiyer() async {
    final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.model.plasiyerKodu);
    if (result is PlasiyerList) {
      viewModel.setPlasiyerKodu(result.plasiyerKodu);
      _plasiyerController.text = result.plasiyerAciklama ?? "";
    }
  }

  Future<void> add() async => Get.toNamed("/mainPage/cekSenetTahsilatEkle");
}
