import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/static_variables/static_variables.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/sayim_girisi/view_model/sayim_girisi_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";

class SayimGirisiView extends StatefulWidget {
  final Future<void> Function() onStokSelected;
  const SayimGirisiView({super.key, required this.onStokSelected});

  @override
  State<SayimGirisiView> createState() => _SayimGirisiViewState();
}

class _SayimGirisiViewState extends BaseState<SayimGirisiView> {
  final SayimGirisiViewModel viewModel = SayimGirisiViewModel();
  late final TextEditingController stokController;
  late final TextEditingController stokAdiController;
  late final TextEditingController projeController;
  late final TextEditingController ekAlan1Controller;
  late final TextEditingController ekAlan2Controller;
  late final TextEditingController ekAlan3Controller;
  late final TextEditingController ekAlan4Controller;
  late final TextEditingController ekAlan5Controller;
  late final TextEditingController miktarController;
  late final TextEditingController serilerController;
  late final TextEditingController olcuBirimiController;

  @override
  void initState() {
    stokController = TextEditingController(text: viewModel.filtreModel.stokKodu);
    stokAdiController = TextEditingController(text: viewModel.filtreModel.stokAdi);
    projeController = TextEditingController(text: viewModel.filtreModel.projeAdi);
    ekAlan1Controller = TextEditingController(text: viewModel.filtreModel.kull1s);
    ekAlan2Controller = TextEditingController(text: viewModel.filtreModel.kull2s);
    ekAlan3Controller = TextEditingController(text: viewModel.filtreModel.kull3s);
    ekAlan4Controller = TextEditingController(text: viewModel.filtreModel.kull4s);
    ekAlan5Controller = TextEditingController(text: viewModel.filtreModel.kull5s);
    miktarController = TextEditingController(text: viewModel.filtreModel.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar));
    olcuBirimiController = TextEditingController();
    serilerController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    stokController.dispose();
    stokAdiController.dispose();
    projeController.dispose();
    ekAlan1Controller.dispose();
    ekAlan2Controller.dispose();
    ekAlan3Controller.dispose();
    ekAlan4Controller.dispose();
    ekAlan5Controller.dispose();
    miktarController.dispose();
    olcuBirimiController.dispose();
    serilerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Form(
          key: StaticVariables.instance.sayimGenelFormKey,
          child: Column(
            children: [
              CustomTextField(
                labelText: "Stok",
                isMust: true,
                readOnly: true,
                suffixMore: true,
                controller: stokController,
                suffix: IconButton(
                  onPressed: () async {
                    final stokKodu = await Get.toNamed("qr");
                    if (stokKodu is String) {
                      final StokListesiModel? stokModel = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: stokKodu));
                      setStok(stokModel);
                    }
                  },
                  icon: const Icon(Icons.qr_code_scanner),
                ).yetkiVarMi(!yetkiController.sayimGizlenecekAlanlar("barkod")),
                onTap: () async {
                  final stokModel = await Get.toNamed("mainPage/stokListesiOzel");
                  setStok(stokModel);
                },
              ),
              CustomTextField(
                labelText: "Stok Adı",
                readOnly: true,
                controller: stokAdiController,
                valueWidget: Observer(builder: (context) => Text(viewModel.filtreModel.stokKodu ?? "")),
                suffix: IconButton(
                  icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                  onPressed: () async {
                    if (viewModel.stokModel != null) {
                      dialogManager.showStokGridViewDialog(viewModel.stokModel);
                    } else {
                      dialogManager.showAlertDialog("Önce stok seçiniz");
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Proje",
                      isMust: true,
                      enabled: !yetkiController.sayimDegistirilmeyecekAlanlar("proje"),
                      readOnly: true,
                      suffixMore: true,
                      controller: projeController,
                      valueWidget: Observer(builder: (context) => Text(viewModel.filtreModel.projeKodu ?? "")),
                      onTap: () async {
                        final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.filtreModel.projeKodu);
                        if (result is BaseProjeModel) {
                          projeController.text = result.projeAciklama ?? "";
                          viewModel.setProjeKodu(result);
                        }
                      },
                    ),
                  ).yetkiVarMi(yetkiController.projeUygulamasiAcikMi && !yetkiController.sayimGizlenecekAlanlar("proje")),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Miktar",
                      isMust: true,
                      // readOnly: !yetkiController.sayimDegistirilmeyecekAlanlar("miktar"),
                      enabled: !yetkiController.sayimDegistirilmeyecekAlanlar("miktar"),
                      controller: miktarController,
                      suffix: Wrap(
                        children: [
                          IconButton(
                            onPressed: () {
                              viewModel.decreaseMiktar();
                              miktarController.text = "${viewModel.filtreModel.miktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}";
                            },
                            icon: const Icon(Icons.remove),
                          ),
                          IconButton(
                            onPressed: () {
                              viewModel.increaseMiktar();
                              miktarController.text = "${viewModel.filtreModel.miktar?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}";
                            },
                            icon: const Icon(Icons.add),
                          ),
                        ],
                      ).yetkiVarMi(!yetkiController.sayimDegistirilmeyecekAlanlar("miktar")),
                    ),
                  ).yetkiVarMi(!yetkiController.sayimGizlenecekAlanlar("miktar")),
                ],
              ),
              //TODO Serileri ekle

              Observer(
                builder: (_) => CustomTextField(
                  labelText: "Seriler",
                  isMust: true,
                  controller: serilerController,
                  suffixMore: true,
                  readOnly: true,
                  // onTap: ,
                  validator: (value) {
                    if (value == "") return "Bu alan boş bırakılamaz.";
                    if (viewModel.stokModel?.seriMiktarKadarSor == true && viewModel.filtreModel.miktar != viewModel.filtreModel.seriList?.length) {
                      return "Girdiğiniz miktar (${viewModel.filtreModel.miktar.toIntIfDouble ?? 0}) ve seri miktarı (${viewModel.filtreModel.seriList?.length ?? 0})";
                    }
                    return null;
                  },
                ).yetkiVarMi(viewModel.stokModel?.seriGirislerdeAcik == true),
              ),
              CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  CustomTextField(
                    labelText: "Ek Alan 1",
                    controller: ekAlan1Controller,
                    onChanged: viewModel.setEkAlan1,
                  ).yetkiVarMi(yetkiController.sayimEkAlanlar(1)),
                  CustomTextField(
                    labelText: "Ek Alan 2",
                    controller: ekAlan2Controller,
                    onChanged: viewModel.setEkAlan2,
                  ).yetkiVarMi(yetkiController.sayimEkAlanlar(2)),
                  CustomTextField(
                    labelText: "Ek Alan 3",
                    controller: ekAlan3Controller,
                    onChanged: viewModel.setEkAlan3,
                  ).yetkiVarMi(yetkiController.sayimEkAlanlar(3)),
                  CustomTextField(
                    labelText: "Ek Alan 4",
                    controller: ekAlan4Controller,
                    onChanged: viewModel.setEkAlan4,
                  ).yetkiVarMi(yetkiController.sayimEkAlanlar(4)),
                  CustomTextField(
                    labelText: "Ek Alan 5",
                    controller: ekAlan5Controller,
                    onChanged: viewModel.setEkAlan5,
                  ).yetkiVarMi(yetkiController.sayimEkAlanlar(5)),
                ],
              ),
              Observer(
                builder: (_) => CustomTextField(
                  labelText: "Ölçü Birimi",
                  readOnly: true,
                  suffixMore: true,
                  controller: olcuBirimiController,
                ).yetkiVarMi(viewModel.filtreModel.stokKodu != null),
              ),
              Card(
                child: Observer(
                  builder: (_) => SwitchListTile.adaptive(
                    value: viewModel.hemenKaydetsinMi,
                    onChanged: viewModel.setHemenKaydet,
                    title: const Text("Stok Seçildiğinde Hemen Kaydet"),
                  ),
                ),
              ).yetkiVarMi(!yetkiController.adminMi && !yetkiController.sayimHemenKaydet),
              Card(
                child: SwitchListTile.adaptive(
                  value: false,
                  onChanged: (value) {},
                  title: const Text("Otomatik Sayım Etiketi Yazdır"),
                ),
              ).yetkiVarMi(yetkiController.yazdirmaSayim),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );

  Future<void> setStok(StokListesiModel? stokModel) async {
    if (stokModel is! BaseStokMixin) return;
    viewModel.setStokModel(stokModel);
    viewModel.setOlcuBirimi(yetkiController.sayimVarsayilanOlcuBirimi);
    stokController.text = stokModel?.stokKodu ?? "";
    stokAdiController.text = stokModel?.stokAdi ?? "";
    olcuBirimiController.text = stokModel?.olcuBirimiSelector(yetkiController.sayimVarsayilanOlcuBirimi) ?? "";
    if (viewModel.hemenKaydetsinMi) {
      await widget.onStokSelected();
    }
  }
}
