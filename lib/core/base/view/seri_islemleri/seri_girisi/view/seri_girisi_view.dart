import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/wrap/appbar_title.dart";

import "../../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../../components/textfield/custom_text_field.dart";
import "../../../../../constants/extensions/number_extensions.dart";
import "../../../../../constants/ondalik_utils.dart";
import "../../../../../constants/ui_helper/ui_helper.dart";
import "../../../../state/base_state.dart";
import "../../seri_hareketleri/model/seri_hareketleri_model.dart";
import "../view_model/seri_girisi_view_model.dart";

class SeriGirisiView extends StatefulWidget {
  final SeriHareketleriModel? seriHareketleriModel;
  const SeriGirisiView({super.key, this.seriHareketleriModel});

  @override
  State<SeriGirisiView> createState() => _SeriGirisiViewState();
}

class _SeriGirisiViewState extends BaseState<SeriGirisiView> {
  SeriGirisiViewModel viewModel = SeriGirisiViewModel();
  late final TextEditingController _stokController;
  late final TextEditingController _depoController;
  late final TextEditingController _seri1Controller;
  late final TextEditingController _seri2Controller;
  late final TextEditingController _aciklama1Controller;
  late final TextEditingController _aciklama2Controller;
  late final TextEditingController _miktarController;
  late final TextEditingController _hareketAciklamaController;
  late final TextEditingController _belgeNoController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.seriHareketleriModel != null) {
      viewModel.setSeriHareketleriModel(widget.seriHareketleriModel!);
    }
    _stokController = TextEditingController(text: viewModel.seriHareketleriModel.stokAdi);
    _depoController = TextEditingController(text: viewModel.seriHareketleriModel.depoTanimi);
    _seri1Controller = TextEditingController(text: viewModel.seriHareketleriModel.seriNo);
    _seri2Controller = TextEditingController(text: viewModel.seriHareketleriModel.seri2);
    _aciklama1Controller = TextEditingController(text: viewModel.seriHareketleriModel.acik1);
    _aciklama2Controller = TextEditingController(text: viewModel.seriHareketleriModel.acik2);
    _miktarController = TextEditingController(text: viewModel.seriHareketleriModel.miktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar));
    _hareketAciklamaController = TextEditingController(text: viewModel.seriHareketleriModel.haracik);
    _belgeNoController = TextEditingController(text: viewModel.seriHareketleriModel.belgeNo);
    super.initState();
  }

  @override
  void dispose() {
    _stokController.dispose();
    _depoController.dispose();
    _seri1Controller.dispose();
    _seri2Controller.dispose();
    _aciklama1Controller.dispose();
    _aciklama2Controller.dispose();
    _miktarController.dispose();
    _hareketAciklamaController.dispose();
    _belgeNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: body(context),
      );

  AppBar appBar() => AppBar(
        title: const AppBarTitle(title: "Seri Girişi"),
        actions: [
          IconButton(
            icon: const Icon(Icons.save_outlined),
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                dialogManager.showAreYouSureDialog(() async {
                  final result = await viewModel.postData();
                  if (result) {
                    Get.back(result: true);
                    dialogManager.showSuccessSnackBar("İşlem başarılı");
                  }
                });
              }
            },
          ),
        ],
      );

  SingleChildScrollView body(BuildContext context) => SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) => Observer(
                  builder: (_) => ToggleButtons(
                    constraints: BoxConstraints.expand(width: (constraints.maxWidth - UIHelper.midSize - 2) / 2),
                    isSelected: viewModel.seriHareketleriModel.gckod == "C" ? [false, true] : [true, false],
                    onPressed: (index) => viewModel.setGcKod(index == 0 ? "G" : "C"),
                    children: const [
                      Text("Giriş"),
                      Text("Çıkış"),
                    ],
                  ),
                ),
              ).paddingSymmetric(vertical: UIHelper.lowSize),
              CustomTextField(
                labelText: "Stok",
                controller: _stokController,
                isMust: true,
                readOnly: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.seriHareketleriModel.stokKodu ?? "")),
                onTap: () async {
                  await getStok();
                },
                suffix: IconButton(
                  onPressed: () async {
                    final result = await getQrData();
                    if (result is String) {
                      _stokController.text = result;
                      viewModel.setStokKodu(result);
                    }
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                ),
              ),
              CustomTextField(
                labelText: "Depo",
                controller: _depoController,
                isMust: true,
                readOnly: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.seriHareketleriModel.depoKodu.toStringIfNotNull ?? "")),
                onTap: () async {
                  final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, viewModel.seriHareketleriModel.depoKodu);
                  if (result != null) {
                    _depoController.text = result.depoTanimi ?? "";
                    viewModel.setDepoKodu(result.depoKodu);
                  }
                },
              ),
              CustomTextField(
                labelText: "Seri 1",
                controller: _seri1Controller,
                isMust: true,
                onChanged: (value) => viewModel.setSeri1(value),
                suffix: IconButton(
                  onPressed: () async {
                    final result = await getQrData();
                    if (result is String) {
                      _seri1Controller.text = result;
                      viewModel.setSeri1(result);
                    }
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                ),
              ),
              CustomTextField(
                labelText: "Seri 2",
                controller: _seri2Controller,
                onChanged: (value) => viewModel.setSeri2(value),
                suffix: IconButton(
                  onPressed: () async {
                    final result = await getQrData();
                    if (result is String) {
                      _seri2Controller.text = result;
                      viewModel.setSeri2(result);
                    }
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Açıklama 1",
                      controller: _aciklama1Controller,
                      onChanged: (value) => viewModel.setAciklama1(value),
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Açıklama 2",
                      controller: _aciklama2Controller,
                      onChanged: (value) => viewModel.setAciklama2(value),
                    ),
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Miktar",
                controller: _miktarController,
                isFormattedString: true,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                isMust: true,
                onChanged: (value) {
                  viewModel.seriHareketleriModel.miktar = value.toDoubleWithFormattedString;
                },
                suffix: Wrap(
                  children: [
                    IconButton(
                      onPressed: () => updateMiktar(false),
                      icon: const Icon(Icons.remove),
                    ),
                    IconButton(
                      onPressed: () => updateMiktar(true),
                      icon: const Icon(Icons.add),
                    ),
                  ],
                ),
              ),
              CustomTextField(
                labelText: "Hareket Açıklama",
                controller: _hareketAciklamaController,
                onChanged: (value) => viewModel.setHareketAciklama(value),
              ),
              CustomTextField(
                labelText: "Belge No",
                controller: _belgeNoController,
                onChanged: (value) => viewModel.setBelgeNo(value),
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );

  Future<String?> getQrData() async {
    final result = await Get.toNamed("/qr");
    return result;
  }

  Future<void> getStok() async {
    final result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
    if (result is StokListesiModel) {
      _stokController.text = result.stokAdi ?? "";
      viewModel.setStokKodu(result.stokKodu ?? "");
    }
  }

  void updateMiktar(bool isIncrease) {
    if (isIncrease) {
      viewModel.increaseMiktar();
    } else {
      viewModel.decreaseMiktar();
    }
    _miktarController.text = viewModel.seriHareketleriModel.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar);
  }
}
