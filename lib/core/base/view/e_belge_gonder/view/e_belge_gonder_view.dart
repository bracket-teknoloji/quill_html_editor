// ignore_for_file: use_build_context_synchronously

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/e_belge_gonder/model/model/dizayn_model.dart";
import "package:picker/core/base/view/e_belge_gonder/view_model/e_belge_gonder_view_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/color_palette.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/e_belge/e_belge_gelen_giden_kutusu/model/e_belge_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparis_edit_request_model.dart";

class EBelgeGonderView extends StatefulWidget {
  final BaseSiparisEditModel model;
  const EBelgeGonderView({super.key, required this.model});

  @override
  State<EBelgeGonderView> createState() => _EBelgeGonderViewState();
}

class _EBelgeGonderViewState extends BaseState<EBelgeGonderView> {
  late final EBelgeGonderViewModel viewModel;
  late final TextEditingController _cariController;
  late final TextEditingController _belgeNoController;
  late final TextEditingController _resmiBelgeNoController;
  late final TextEditingController _dovizTipiController;
  late final TextEditingController _araToplamController;
  late final TextEditingController _kdvTutariController;
  late final TextEditingController _genelToplamController;
  late final TextEditingController _dovizliToplamController;
  late final TextEditingController _senaryoController;
  late final TextEditingController _dizaynController;
  late final TextEditingController _gonderimSekliController;
  late final TextEditingController _cariEPostaController;

  EBelgeListesiModel get model => viewModel.model;

  @override
  void initState() {
    BaseSiparisEditModel.setInstance(widget.model..kdvDahil = (widget.model.kdvDahilMi ?? false) ? "E" : "H");
    viewModel = EBelgeGonderViewModel(model: EBelgeListesiModel.faturaGonder(widget.model), siparisEditModel: widget.model);
    _cariController = TextEditingController(text: widget.model.cariAdi);
    _belgeNoController = TextEditingController(text: widget.model.belgeNo);
    _resmiBelgeNoController = TextEditingController(text: widget.model.resmiBelgeNo);
    _dovizTipiController = TextEditingController(text: widget.model.dovizAdi);
    _araToplamController = TextEditingController(text: widget.model.eBelgeGonderAraToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    _kdvTutariController = TextEditingController(text: widget.model.kdv.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    _genelToplamController = TextEditingController(text: widget.model.genelToplam.commaSeparatedWithDecimalDigits(OndalikEnum.tutar));
    _dovizliToplamController = TextEditingController(text: widget.model.dovizTutari.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari));
    _senaryoController = TextEditingController(text: viewModel.senaryoMap.entries.firstWhere((element) => element.value == widget.model.efaturaTipi).key);
    _dizaynController = TextEditingController();
    _gonderimSekliController = TextEditingController();
    _cariEPostaController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getDizayn(otomatikSec: true);
    });
    super.initState();
  }

  @override
  void dispose() {
    _cariController.dispose();
    _belgeNoController.dispose();
    _resmiBelgeNoController.dispose();
    _dovizTipiController.dispose();
    _araToplamController.dispose();
    _kdvTutariController.dispose();
    _genelToplamController.dispose();
    _dovizliToplamController.dispose();
    _senaryoController.dispose();
    _dizaynController.dispose();
    _gonderimSekliController.dispose();
    _cariEPostaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          Get.back(result: true);
          return false;
        },
    child: Scaffold(
          appBar: AppBar(
            title: AppBarTitle(
              title: "${widget.model.titleName} Gönder",
              subtitle: widget.model.belgeNo,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  labelText: "Cari",
                  controller: _cariController,
                  readOnly: true,
                  valueWidget: Text(model.cariKodu ?? ""),
                  suffix: IconButton(
                    onPressed: () async {
                      dialogManager.showCariGridViewDialog(CariListesiModel.fromSiparisModel(widget.model));
                    },
                    icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                  ),
                ),
                CustomTextField(
                  labelText: "Belge No",
                  controller: _belgeNoController,
                  readOnly: true,
                  suffix: IconButton(
                    onPressed: () async {
                      dialogManager.showSiparisGridViewDialog(model: widget.model);
                    },
                    icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                  ),
                ),
                CustomTextField(
                  labelText: "Resmi Belge No",
                  controller: _resmiBelgeNoController,
                  readOnly: true,
                  suffix: IconButton(
                    onPressed: () async => await Get.toNamed(
                      "/mainPage/faturaEdit",
                      arguments: BaseEditModel(
                        model: widget.model,
                        baseEditEnum: BaseEditEnum.goruntule,
                        editTipiEnum: widget.model.getEditTipiEnum,
                      ),
                    ),
                    icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                  ),
                ),
                CustomLayoutBuilder(
                  splitCount: 2,
                  children: [
                    CustomTextField(
                      labelText: "Döviz Tipi",
                      controller: _dovizTipiController,
                      readOnly: true,
                    ).yetkiVarMi(widget.model.dovizliMi),
                    CustomTextField(
                      labelText: "Ara Toplam",
                      controller: _araToplamController,
                      readOnly: true,
                    ),
                    CustomTextField(
                      labelText: "KDV Tutarı",
                      controller: _kdvTutariController,
                      readOnly: true,
                    ),
                    CustomTextField(
                      labelText: "Genel Toplam",
                      controller: _genelToplamController,
                      readOnly: true,
                    ),
                    CustomTextField(
                      labelText: "Dövizli Toplam",
                      controller: _dovizliToplamController,
                      readOnly: true,
                    ).yetkiVarMi(widget.model.dovizliMi),
                    Observer(
                      builder: (_) => CustomTextField(
                        labelText: "Senaryo",
                        controller: _senaryoController,
                        readOnly: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(model.senaryoTipi ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                            context,
                            title: "Senaryo Seçiniz",
                            groupValue: model.senaryoTipi,
                            children: List.generate(
                              viewModel.senaryoMap.length,
                              (index) => BottomSheetModel(
                                title: viewModel.senaryoMap.entries.elementAt(index).key,
                                groupValue: viewModel.senaryoMap.entries.elementAt(index).value,
                                value: viewModel.senaryoMap.entries.elementAt(index),
                              ),
                            ),
                          );
                          if (result is MapEntry) {
                            viewModel.setSenaryo(result.value);
                            _senaryoController.text = result.key;
                          }
                        },
                      ).yetkiVarMi(!viewModel.siparisEditModel.taslakMi),
                    ),
                    Observer(
                      builder: (_) => CustomTextField(
                        labelText: "Dizayn",
                        controller: _dizaynController,
                        readOnly: true,
                        isMust: true,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(model.dizaynNo.toStringIfNotNull ?? "")),
                        onTap: () async => await getDizayn(),
                      ).yetkiVarMi(!viewModel.siparisEditModel.taslakMi),
                    ),
                  ],
                ),
                Observer(
                  builder: (_) => SwitchListTile.adaptive(
                    value: model.dovizliOlustur ?? false,
                    onChanged: viewModel.setDovizOlustur,
                    title: const Text("Döviz Oluştur"),
                  ).yetkiVarMi(widget.model.dovizliMi && !viewModel.siparisEditModel.taslakMi),
                ),
                Observer(
                  builder: (_) => SwitchListTile.adaptive(
                    value: model.gonderimSekliEPosta ?? false,
                    onChanged: (value) async {
                      viewModel.setGonderimSekliEposta(value);
                      if (value) {
                        _cariEPostaController.text = await viewModel.getCariModel.then((cariModel) => cariModel?.email ?? "") ?? "";
                      } else {
                        _cariEPostaController.text = "";
                      }
                    },
                    title: const Text("Gönderim Şekli E-Posta"),
                  ),
                ),
                Observer(
                  builder: (_) => SwitchListTile.adaptive(
                    value: model.internetFaturasi ?? false,
                    onChanged: viewModel.setInternetFaturasi,
                    title: const Text("İnternet Tipli"),
                  ).yetkiVarMi(!viewModel.siparisEditModel.taslakMi),
                ),
                Observer(
                  builder: (_) => Visibility(
                    visible: model.gonderimSekliEPosta ?? false,
                    child: CustomTextField(
                      labelText: "Cari E-Posta",
                      controller: _cariEPostaController,
                      readOnly: true,
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => ElevatedButton.icon(
                    onPressed: () async {
                      dialogManager.showAreYouSureDialog(() async {
                        final result = await viewModel.sendTaslak();
                        if (result.success ?? false) {
                          dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
                          final BaseSiparisEditModel? siparisModel = await networkManager.getBaseSiparisEditModel(SiparisEditRequestModel.fromSiparislerModel(viewModel.siparisEditModel));
                          if (siparisModel != null) {
                            viewModel.setModel(EBelgeListesiModel.faturaGonder(siparisModel));
                            viewModel.setSiparisModel(siparisModel);
                          }
                        }
                      });
                    },
                    label: const Text("Taslak Oluştur"),
                    icon: const Icon(Icons.add),
                  ).paddingAll(UIHelper.lowSize).yetkiVarMi(!viewModel.siparisEditModel.taslakMi),
                ),
                Observer(
                  builder: (_) => Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          final result = await viewModel.deleteTaslak();
                          if (result.success ?? false) {
                            final BaseSiparisEditModel? siparisModel = await networkManager.getBaseSiparisEditModel(SiparisEditRequestModel.fromSiparislerModel(viewModel.siparisEditModel));
                            if (siparisModel != null) {
                            dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
                              viewModel.setModel(EBelgeListesiModel.faturaGonder(siparisModel));
                              
                              viewModel.setSiparisModel(siparisModel);
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: ColorPalette.persianRed, foregroundColor: Colors.white),
                        child: const Column(
                          children: [Icon(Icons.delete_outline_outlined), Text("Taslak Sil")],
                        ).paddingAll(UIHelper.lowSize),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          Get.toNamed("/mainPage/eBelgePdf", arguments: model);
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: ColorPalette.outerSpace, foregroundColor: Colors.white),
                        child: const Column(
                          children: [Icon(Icons.preview_outlined), Text("Görüntüle")],
                        ).paddingAll(UIHelper.lowSize),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final result = await viewModel.sendEBelge();
                          if (result.success ?? false) {
                            dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
  
                            Get.back(result: true);
                          }
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: ColorPalette.mantis, foregroundColor: Colors.white),
                        child: const Column(
                          children: [Icon(Icons.send_outlined), Text("Gönder")],
                        ).paddingAll(UIHelper.lowSize),
                      ),
                    ].map((e) => Expanded(child: e.paddingAll(UIHelper.lowSize))).toList(),
                  ).yetkiVarMi(viewModel.siparisEditModel.taslakMi),
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
  );

  Future<void> getDizayn({bool? otomatikSec}) async {
    final result = await viewModel.getDizayn();
    if (result.length == 1 && (otomatikSec ?? false)) {
      _dizaynController.text = result.first.dizaynAdi ?? "";
      viewModel.setDizaynNo(result.first.id ?? 0);
    } else {
      final selectedDizaynModel = await bottomSheetDialogManager.showRadioBottomSheetDialog(
        context,
        title: "Dizayn Seçiniz",
        groupValue: viewModel.model.dizaynNo,
        children: List.generate(result.length, (index) {
          final DizaynModel dizaynModel = result[index];
          return BottomSheetModel(title: dizaynModel.dizaynAdi ?? "", groupValue: dizaynModel.id, value: dizaynModel);
        }),
      );
      if (selectedDizaynModel is DizaynModel) {
        _dizaynController.text = selectedDizaynModel.dizaynAdi ?? "";
        viewModel.setDizaynNo(selectedDizaynModel.id ?? 0);
      }
    }
  }
}
