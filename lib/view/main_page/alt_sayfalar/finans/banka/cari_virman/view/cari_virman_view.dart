import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/seri_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/finans/banka/cari_virman/view_model/cari_virman_view_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

class CariVirmanView extends StatefulWidget {
  final CariListesiModel? model;
  const CariVirmanView({super.key, this.model});

  @override
  State<CariVirmanView> createState() => _CariVirmanViewState();
}

class _CariVirmanViewState extends BaseState<CariVirmanView> {
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
    viewModel.setTarih(DateTime.now().dateTimeWithoutTime);
    viewModel.setTutar(widget.model?.bakiye);
    _tarihController = TextEditingController(text: viewModel.requestModel.tarih.toDateString);
    _seriController = TextEditingController();
    _tahsilatiYapilacakCariController = TextEditingController();
    _odemesiYapilacakCariController = TextEditingController();
    _tutarController = TextEditingController(text: widget.model?.bakiye.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    _vadeGunuController = TextEditingController(text: viewModel.requestModel.tarih?.difference(DateTime.now().dateTimeWithoutTime!).inDays.toString());
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Cari Virman",
            subtitle: widget.model?.cariKodu,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (formKey.currentState?.validate() == true) {
                  dialogManager.showAreYouSureDialog(() async {
                    final result = await viewModel.sendData();
                    if (result.success == true) {
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
                      await dialogManager.showCariIslemleriGridViewDialog(await networkManager.getCariModel(CariRequestModel(kod: [viewModel.requestModel.cariKodu ?? ""])));
                    },
                    icon: Icon(Icons.open_in_new_outlined, color: theme.colorScheme.primary),
                  ),
                  onTap: () async => await tahsilatCariBottomSheet(),
                ),
                // Observer(
                //   builder: (_) {
                //     return bakiyeWidget(viewModel.requestModel.he);
                //   },
                // ),
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
                      await dialogManager.showCariIslemleriGridViewDialog(await networkManager.getCariModel(CariRequestModel(kod: [viewModel.requestModel.hedefCariKodu ?? ""])));
                    },
                    icon: Icon(Icons.open_in_new_outlined, color: theme.colorScheme.primary),
                  ),
                  onTap: () async => await odemeCariBottomSheet(),
                ),
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
                    Expanded(
                      child: CustomTextField(
                        labelText: "Plasiyer",
                        controller: _plasiyerController,
                        valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.plasiyerKodu ?? "")),
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showPlasiyerBottomSheetDialog(context, viewModel.requestModel.plasiyerKodu);
                          if (result is PlasiyerList) {
                            _plasiyerController.text = result.plasiyerAciklama ?? "";
                            viewModel.setPlasiyer(result.plasiyerKodu);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.plasiyerUygulamasiAcikMi),
                    Expanded(
                      child: CustomTextField(
                        labelText: "Proje",
                        controller: _projeController,
                        valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.projeKodu ?? "")),
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.requestModel.projeKodu);
                          if (result is PlasiyerList) {
                            _projeController.text = result?.projeAciklama ?? "";
                            viewModel.setProjeKodu(result?.projeKodu);
                          }
                        },
                      ),
                    ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
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

  Widget bakiyeWidget(double value, bool odenecekMi) =>
      Text("Bakiye: ${value.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} (${odenecekMi ? "Ödenecek" : "Tahsil Edilecek"})", style: TextStyle(
        color: UIHelper.getColorWithValue(odenecekMi ? -1: 1)
      ),).paddingAll(UIHelper.lowSize);

  Future<void> seriBottomSheet() async {
    final result = await bottomSheetDialogManager.showSeriKodBottomSheetDialog(context, viewModel.requestModel.dekontSeri);
    if (result is SeriModel) {
      viewModel.setSeri(result.seriNo);
      _seriController.text = result.aciklama ?? "";
    }
  }

  Future<void> odemeSekliBottomSheet() async {
    final projeModel = await yetkiController.varsayilanProje;
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
      viewModel.setOdemeCari(widget.model?.cariKodu);
      _odemesiYapilacakCariController.text = widget.model?.cariAdi ?? "";
      _odemeYapilanCariAciklamaController.text = "CARİ VİR. ${widget.model?.cariAdi} (BANKA İŞLEMİ)";
      viewModel.setHedefAciklama(_odemeYapilanCariAciklamaController.text);
    } else {
      viewModel.setTahsilatCari(widget.model?.cariKodu);

      viewModel.setVadeGunu(widget.model?.vadeGunu);
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
      viewModel.setOdemeCari(result.cariKodu);
      _odemesiYapilacakCariController.text = result.cariAdi ?? "";
      _odemeYapilanCariAciklamaController.text = "CARİ VİR. ${result.cariAdi} (BANKA İŞLEMİ)";
      viewModel.setHedefAciklama(_odemeYapilanCariAciklamaController.text);
    }
  }

  Future<void> tahsilatCariBottomSheet() async {
    final result = await Get.toNamed("mainPage/cariListesiOzel");
    if (result is CariListesiModel) {
      viewModel.setTahsilatCari(result.cariKodu);
      viewModel.setVadeGunu(result.vadeGunu);
      _vadeGunuController.text = (result.vadeGunu ?? 0).toString();
      _tahsilatiYapilacakCariController.text = result.cariAdi ?? "";
      _tahsilatYapilanCariAciklamaController.text = "CARİ VİR. ${result.cariAdi} (BANKA İŞLEMİ)";
      viewModel.setAciklama(_tahsilatYapilanCariAciklamaController.text);
    }
  }
}
