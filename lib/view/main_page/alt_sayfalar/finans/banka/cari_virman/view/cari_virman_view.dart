import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_proje_model.dart";

import "../../../../../../../core/base/model/seri_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/text/bakiye_text.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../model/param_model.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../cari/cari_listesi/model/cari_request_model.dart";
import "../view_model/cari_virman_view_model.dart";

final class CariVirmanView extends StatefulWidget {
  const CariVirmanView({super.key, this.model});
  final CariListesiModel? model;

  @override
  State<CariVirmanView> createState() => _CariVirmanViewState();
}

final class _CariVirmanViewState extends BaseState<CariVirmanView> {
  final CariVirmanViewModel viewModel = CariVirmanViewModel();
  late final TextEditingController _tarihController;
  late final TextEditingController _seriController;
  late final TextEditingController _tahsilatiYapilacakCariController;
  late final TextEditingController _odemesiYapilacakCariController;
  late final TextEditingController _tutarController;
  late final TextEditingController _vadeGunuController;
  late final TextEditingController _plasiyerController;
  late final TextEditingController _projeController;
  late final TextEditingController _tahsilatYapilanCariAciklamaController;
  late final TextEditingController _odemeYapilanCariAciklamaController;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    viewModel
      ..setTarih(DateTime.now().dateTimeWithoutTime)
      ..setTutar(widget.model?.bakiye);
    _tarihController = TextEditingController(text: viewModel.requestModel.tarih.toDateString);
    _seriController = TextEditingController();
    _tahsilatiYapilacakCariController = TextEditingController();
    _odemesiYapilacakCariController = TextEditingController();
    _tutarController = TextEditingController(
      text: widget.model?.bakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar),
    );
    _vadeGunuController = TextEditingController(
      text: viewModel.requestModel.tarih?.difference(DateTime.now().dateTimeWithoutTime!).inDays.toString(),
    );
    _plasiyerController = TextEditingController();
    _projeController = TextEditingController();
    _tahsilatYapilanCariAciklamaController = TextEditingController();
    _odemeYapilanCariAciklamaController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await odemeSekliBottomSheet();
      await seriBottomSheet();
      if (viewModel.requestModel.cariKodu != null) {
        await odemeCariBottomSheet();
      } else {
        await tahsilatCariBottomSheet();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _tarihController.dispose();
    _seriController.dispose();
    _tahsilatiYapilacakCariController.dispose();
    _odemesiYapilacakCariController.dispose();
    _tutarController.dispose();
    _vadeGunuController.dispose();
    _plasiyerController.dispose();
    _projeController.dispose();
    _tahsilatYapilanCariAciklamaController.dispose();
    _odemeYapilanCariAciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: AppBarTitle(title: "Cari Virman", subtitle: widget.model?.cariKodu),
      actions: [
        IconButton(
          onPressed: () async {
            if (formKey.currentState?.validate() == true) {
              dialogManager.showAreYouSureDialog(() async {
                final result = await viewModel.sendData();
                if (result.isSuccess) {
                  dialogManager.showSuccessSnackBar(result.message ?? "İşlem Başarılı");
                  Get.back(result: true);
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
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    onTap: () async {
                      final date = await dialogManager.showDateTimePicker(initialDate: viewModel.requestModel.tarih);
                      if (date != null) {
                        viewModel.setTarih(date);
                        _tarihController.text = date.toDateString;
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    labelText: "Seri",
                    controller: _seriController,
                    isMust: true,
                    suffixMore: true,
                    readOnly: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.dekontSeri ?? "")),
                    onTap: () async => await seriBottomSheet(),
                  ),
                ),
              ],
            ),
            CustomTextField(
              labelText: "Tahsilat Yapılacak Cari",
              controller: _tahsilatiYapilacakCariController,
              valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.cariKodu ?? "")),
              isMust: true,
              suffixMore: true,
              readOnly: true,
              suffix: IconButton(
                onPressed: () async {
                  if (_tahsilatiYapilacakCariController.text.isEmpty) {
                    dialogManager.showAlertDialog("Önce Cari Seçiniz");
                    return;
                  }
                  await dialogManager.showCariIslemleriGridViewDialog(
                    await networkManager.getCariModel(CariRequestModel(kod: [viewModel.requestModel.cariKodu ?? ""])),
                  );
                },
                icon: Icon(Icons.open_in_new_outlined, color: theme.colorScheme.primary),
              ),
              onTap: () async => await tahsilatCariBottomSheet(),
            ),
            Observer(builder: (_) => BakiyeText(value: viewModel.requestModel.tahsilatBakiye)),
            CustomTextField(
              labelText: "Ödeme Yapılacak Cari",
              controller: _odemesiYapilacakCariController,
              valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.hedefCariKodu ?? "")),
              isMust: true,
              suffixMore: true,
              readOnly: true,
              suffix: IconButton(
                onPressed: () async {
                  if (_odemesiYapilacakCariController.text.isEmpty) {
                    dialogManager.showAlertDialog("Önce Hedef Cari Seçiniz");
                    return;
                  }
                  await dialogManager.showCariIslemleriGridViewDialog(
                    await networkManager.getCariModel(
                      CariRequestModel(kod: [viewModel.requestModel.hedefCariKodu ?? ""]),
                    ),
                  );
                },
                icon: Icon(Icons.open_in_new_outlined, color: theme.colorScheme.primary),
              ),
              onTap: () async => await odemeCariBottomSheet(),
            ),
            Observer(builder: (_) => BakiyeText(value: viewModel.requestModel.odemeBakiye)),
            Row(
              children: [
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
                Expanded(
                  child: CustomTextField(
                    labelText: "Vade Günü",
                    controller: _vadeGunuController,
                    keyboardType: TextInputType.number,
                    valueWidget: Observer(builder: (_) => Text(viewModel.vadeGunu.toDateString)),
                    onChanged: (value) => viewModel.setVadeGunu(int.tryParse(value)),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                if (yetkiController.plasiyerUygulamasiAcikMi)
                  Expanded(
                    child: CustomTextField(
                      labelText: "Plasiyer",
                      controller: _plasiyerController,
                      valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.plasiyerKodu ?? "")),
                      isMust: true,
                      readOnly: true,
                      suffixMore: true,
                      onTap: () async {
                        final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(
                          context,
                          viewModel.requestModel.plasiyerKodu,
                        );
                        if (result is PlasiyerList) {
                          _plasiyerController.text = result.plasiyerAciklama ?? "";
                          viewModel.setPlasiyer(result.plasiyerKodu);
                        }
                      },
                    ),
                  ),
                if (yetkiController.projeUygulamasiAcikMi)
                  Expanded(
                    child: CustomTextField(
                      labelText: "Proje",
                      controller: _projeController,
                      valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.projeKodu ?? "")),
                      isMust: true,
                      readOnly: true,
                      suffixMore: true,
                      onTap: () async {
                        final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(
                          context,
                          viewModel.requestModel.projeKodu,
                        );
                        if (result is BaseProjeModel) {
                          _projeController.text = result.projeAciklama ?? "";
                          viewModel.setProjeKodu(result.projeKodu);
                        }
                      },
                    ),
                  ),
              ],
            ),
            CustomTextField(
              labelText: "Tahsilat Yapılan Cari Hareketi Açıklama",
              controller: _tahsilatYapilanCariAciklamaController,
              onChanged: viewModel.setAciklama,
            ),
            CustomTextField(
              labelText: "Ödeme Yapılan Cari Hareketi Açıklama",
              controller: _odemeYapilanCariAciklamaController,
              onChanged: viewModel.setHedefAciklama,
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      ),
    ),
  );

  Future<void> seriBottomSheet() async {
    final result = await bottomSheetDialogManager.showSeriKodBottomSheetDialog(
      context,
      viewModel.requestModel.dekontSeri,
    );
    if (result is SeriModel) {
      viewModel.setSeri(result.seriNo);
      _seriController.text = result.aciklama ?? "";
    }
  }

  Future<void> odemeSekliBottomSheet() async {
    final projeModel = yetkiController.varsayilanProje;
    _projeController.text = projeModel?.projeAciklama ?? "";
    viewModel.setProjeKodu(projeModel?.projeKodu);
    final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
      context,
      groupValue: null,
      title: widget.model?.cariAdi ?? "",
      children: [
        BottomSheetModel(title: "Tahsilat Yap", value: true),
        BottomSheetModel(title: "Ödeme Yap", value: false),
      ],
    );
    if (result == false) {
      viewModel
        ..setOdemeCari(widget.model?.cariKodu)
        ..setOdemeBakiye(widget.model?.bakiye ?? 0);
      _odemesiYapilacakCariController.text = widget.model?.cariAdi ?? "";
      _odemeYapilanCariAciklamaController.text = "CARİ VİR. ${widget.model?.cariAdi} (BANKA İŞLEMİ)";
      viewModel.setHedefAciklama(_odemeYapilanCariAciklamaController.text);
    } else {
      viewModel
        ..setTahsilatCari(widget.model?.cariKodu)
        ..setTahsilatBakiye(widget.model?.bakiye ?? 0)
        ..setVadeGunu(widget.model?.vadeGunu);
      _vadeGunuController.text = (widget.model?.vadeGunu ?? 0).toString();
      _tahsilatiYapilacakCariController.text = widget.model?.cariAdi ?? "";
      _tahsilatYapilanCariAciklamaController.text = "CARİ VİR. ${widget.model?.cariAdi} (BANKA İŞLEMİ)";
      viewModel.setAciklama(_tahsilatYapilanCariAciklamaController.text);
    }
    _plasiyerController.text = widget.model?.plasiyerAciklama ?? "";
    viewModel.setPlasiyer(widget.model?.plasiyerKodu);
  }

  Future<void> odemeCariBottomSheet() async {
    final result = await Get.toNamed("mainPage/cariListesiOzel");
    if (result is CariListesiModel) {
      viewModel
        ..setOdemeCari(result.cariKodu)
        ..setOdemeBakiye(result.bakiye ?? 0);
      _odemesiYapilacakCariController.text = result.cariAdi ?? "";
      _odemeYapilanCariAciklamaController.text = "CARİ VİR. ${result.cariAdi} (BANKA İŞLEMİ)";
      viewModel.setHedefAciklama(_odemeYapilanCariAciklamaController.text);
    }
  }

  Future<void> tahsilatCariBottomSheet() async {
    final result = await Get.toNamed("mainPage/cariListesiOzel");
    if (result is CariListesiModel) {
      viewModel
        ..setTahsilatCari(result.cariKodu)
        ..setVadeGunu(result.vadeGunu)
        ..setTahsilatBakiye(result.bakiye ?? 0);
      _vadeGunuController.text = (result.vadeGunu ?? 0).toString();
      _tahsilatiYapilacakCariController.text = result.cariAdi ?? "";
      _tahsilatYapilanCariAciklamaController.text = "CARİ VİR. ${result.cariAdi} (BANKA İŞLEMİ)";
      viewModel.setAciklama(_tahsilatYapilanCariAciklamaController.text);
    }
  }
}
