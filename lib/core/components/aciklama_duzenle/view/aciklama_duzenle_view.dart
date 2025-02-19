import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/ek_rehber_request_model.dart";
import "package:picker/core/base/view/genel_rehber/model/genel_rehber_model.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/static_variables/static_variables.dart";
import "package:picker/view/main_page/model/user_model/ek_rehberler_model.dart";

import "../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../base/state/base_state.dart";
import "../../../constants/enum/edit_tipi_enum.dart";
import "../../../constants/extensions/date_time_extensions.dart";
import "../../../constants/ui_helper/ui_helper.dart";
import "../../textfield/custom_text_field.dart";
import "../../wrap/appbar_title.dart";
import "../view_model/aciklama_duzenle_view_model.dart";

final class AciklamaDuzenleView extends StatefulWidget {
  const AciklamaDuzenleView({required this.editEnum, required this.model, super.key});
  final EditTipiEnum editEnum;
  final BaseSiparisEditModel model;

  @override
  State<AciklamaDuzenleView> createState() => _AciklamaDuzenleViewState();
}

final class _AciklamaDuzenleViewState extends BaseState<AciklamaDuzenleView> {
  AciklamaDuzenleViewModel viewModel = AciklamaDuzenleViewModel();
  final int maxLength = StaticVariables.maxAciklamaLength;
  late final TextEditingController _belgeNoController;
  late final TextEditingController _cariController;
  late final TextEditingController _tarihController;
  late final TextEditingController _aciklama1Controller;
  late final TextEditingController _aciklama2Controller;
  late final TextEditingController _aciklama3Controller;
  late final TextEditingController _aciklama4Controller;
  late final TextEditingController _aciklama5Controller;
  late final TextEditingController _aciklama6Controller;
  late final TextEditingController _aciklama7Controller;
  late final TextEditingController _aciklama8Controller;
  late final TextEditingController _aciklama9Controller;
  late final TextEditingController _aciklama10Controller;
  late final TextEditingController _aciklama11Controller;
  late final TextEditingController _aciklama12Controller;
  late final TextEditingController _aciklama13Controller;
  late final TextEditingController _aciklama14Controller;
  late final TextEditingController _aciklama15Controller;
  late final TextEditingController _aciklama16Controller;

  @override
  void initState() {
    widget.model.tag = "FaturaModel";
    widget.model.islemKodu = 14;
    viewModel.setTalepTeklifListesiModel(widget.model);
    _belgeNoController = TextEditingController(text: widget.model.belgeNo);
    _cariController = TextEditingController(text: widget.model.cariAdi);
    _tarihController = TextEditingController(text: widget.model.tarih.toDateString);
    _aciklama1Controller = TextEditingController(text: widget.model.acik1);
    _aciklama2Controller = TextEditingController(text: widget.model.acik2);
    _aciklama3Controller = TextEditingController(text: widget.model.acik3);
    _aciklama4Controller = TextEditingController(text: widget.model.acik4);
    _aciklama5Controller = TextEditingController(text: widget.model.acik5);
    _aciklama6Controller = TextEditingController(text: widget.model.acik6);
    _aciklama7Controller = TextEditingController(text: widget.model.acik7);
    _aciklama8Controller = TextEditingController(text: widget.model.acik8);
    _aciklama9Controller = TextEditingController(text: widget.model.acik9);
    _aciklama10Controller = TextEditingController(text: widget.model.acik10);
    _aciklama11Controller = TextEditingController(text: widget.model.acik11);
    _aciklama12Controller = TextEditingController(text: widget.model.acik12);
    _aciklama13Controller = TextEditingController(text: widget.model.acik13);
    _aciklama14Controller = TextEditingController(text: widget.model.acik14);
    _aciklama15Controller = TextEditingController(text: widget.model.acik15);
    _aciklama16Controller = TextEditingController(text: widget.model.acik16);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (!yetkiController.faturaAciklamaAlanlari(widget.editEnum, 0)) {
        await dialogManager.showAlertDialog("Herhangi bir açıklama alanına erişim yetkiniz yok.");
        Get.back();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _belgeNoController.dispose();
    _cariController.dispose();
    _tarihController.dispose();
    _aciklama1Controller.dispose();
    _aciklama2Controller.dispose();
    _aciklama3Controller.dispose();
    _aciklama4Controller.dispose();
    _aciklama5Controller.dispose();
    _aciklama6Controller.dispose();
    _aciklama7Controller.dispose();
    _aciklama8Controller.dispose();
    _aciklama9Controller.dispose();
    _aciklama10Controller.dispose();
    _aciklama11Controller.dispose();
    _aciklama12Controller.dispose();
    _aciklama13Controller.dispose();
    _aciklama14Controller.dispose();
    _aciklama15Controller.dispose();
    _aciklama16Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "Açıklama Düzenle"),
      actions: [
        IconButton(
          onPressed: () async {
            await dialogManager.showAreYouSureDialog(() async {
              final result = await viewModel.postData();
              if (result.isSuccess) {
                Get.back(result: true);
                dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
              }
            });
          },
          icon: const Icon(Icons.save_outlined),
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextField(labelText: "Belge No", controller: _belgeNoController, readOnly: true),
          CustomTextField(labelText: "Cari", controller: _cariController, readOnly: true),
          CustomTextField(labelText: "Tarih", isMust: true, controller: _tarihController, readOnly: true),
          const Text("Ek açıklamalar").paddingAll(UIHelper.lowSize),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 1))
            CustomTextField(
              readOnly: getEkRehberById(1) != null,
              suffixMore: getEkRehberById(1) != null,
              onTap: () async => getGenelRehber(1),
              labelText: widget.editEnum.aciklamaLabel(1),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama1(null),
              controller: _aciklama1Controller,
              onChanged: (value) => viewModel.setAciklama1(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 2))
            CustomTextField(
              readOnly: getEkRehberById(2) != null,
              suffixMore: getEkRehberById(2) != null,
              onTap: () async => getGenelRehber(2),
              labelText: widget.editEnum.aciklamaLabel(2),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama2(null),
              controller: _aciklama2Controller,
              onChanged: (value) => viewModel.setAciklama2(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 3))
            CustomTextField(
              readOnly: getEkRehberById(3) != null,
              suffixMore: getEkRehberById(3) != null,
              onTap: () async => getGenelRehber(3),
              labelText: widget.editEnum.aciklamaLabel(3),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama3(null),
              controller: _aciklama3Controller,
              onChanged: (value) => viewModel.setAciklama3(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 4))
            CustomTextField(
              readOnly: getEkRehberById(4) != null,
              suffixMore: getEkRehberById(4) != null,
              onTap: () async => getGenelRehber(4),
              labelText: widget.editEnum.aciklamaLabel(4),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama4(null),
              controller: _aciklama4Controller,
              onChanged: (value) => viewModel.setAciklama4(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 5))
            CustomTextField(
              readOnly: getEkRehberById(5) != null,
              suffixMore: getEkRehberById(5) != null,
              onTap: () async => getGenelRehber(5),
              labelText: widget.editEnum.aciklamaLabel(5),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama5(null),
              controller: _aciklama5Controller,
              onChanged: (value) => viewModel.setAciklama5(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 6))
            CustomTextField(
              readOnly: getEkRehberById(6) != null,
              suffixMore: getEkRehberById(6) != null,
              onTap: () async => getGenelRehber(6),
              labelText: widget.editEnum.aciklamaLabel(6),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama6(null),
              controller: _aciklama6Controller,
              onChanged: (value) => viewModel.setAciklama6(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 7))
            CustomTextField(
              readOnly: getEkRehberById(7) != null,
              suffixMore: getEkRehberById(7) != null,
              onTap: () async => getGenelRehber(7),
              labelText: widget.editEnum.aciklamaLabel(7),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama7(null),
              controller: _aciklama7Controller,
              onChanged: (value) => viewModel.setAciklama7(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 8))
            CustomTextField(
              readOnly: getEkRehberById(8) != null,
              suffixMore: getEkRehberById(8) != null,
              onTap: () async => getGenelRehber(8),
              labelText: widget.editEnum.aciklamaLabel(8),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama8(null),
              controller: _aciklama8Controller,
              onChanged: (value) => viewModel.setAciklama8(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 9))
            CustomTextField(
              readOnly: getEkRehberById(9) != null,
              suffixMore: getEkRehberById(9) != null,
              onTap: () async => getGenelRehber(9),
              labelText: widget.editEnum.aciklamaLabel(9),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama9(null),
              controller: _aciklama9Controller,
              onChanged: (value) => viewModel.setAciklama9(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 10))
            CustomTextField(
              readOnly: getEkRehberById(10) != null,
              suffixMore: getEkRehberById(10) != null,
              onTap: () async => getGenelRehber(10),
              labelText: widget.editEnum.aciklamaLabel(10),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama10(null),
              controller: _aciklama10Controller,
              onChanged: (value) => viewModel.setAciklama10(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 11))
            CustomTextField(
              readOnly: getEkRehberById(11) != null,
              suffixMore: getEkRehberById(11) != null,
              onTap: () async => getGenelRehber(11),
              labelText: widget.editEnum.aciklamaLabel(11),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama11(null),
              controller: _aciklama11Controller,
              onChanged: (value) => viewModel.setAciklama11(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 12))
            CustomTextField(
              readOnly: getEkRehberById(12) != null,
              suffixMore: getEkRehberById(12) != null,
              onTap: () async => getGenelRehber(12),
              labelText: widget.editEnum.aciklamaLabel(12),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama12(null),
              controller: _aciklama12Controller,
              onChanged: (value) => viewModel.setAciklama12(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 13))
            CustomTextField(
              readOnly: getEkRehberById(13) != null,
              suffixMore: getEkRehberById(13) != null,
              onTap: () async => getGenelRehber(13),
              labelText: widget.editEnum.aciklamaLabel(13),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama13(null),
              controller: _aciklama13Controller,
              onChanged: (value) => viewModel.setAciklama13(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 14))
            CustomTextField(
              readOnly: getEkRehberById(14) != null,
              suffixMore: getEkRehberById(14) != null,
              onTap: () async => getGenelRehber(14),
              labelText: widget.editEnum.aciklamaLabel(14),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama14(null),
              controller: _aciklama14Controller,
              onChanged: (value) => viewModel.setAciklama14(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 15))
            CustomTextField(
              readOnly: getEkRehberById(15) != null,
              suffixMore: getEkRehberById(15) != null,
              onTap: () async => getGenelRehber(15),
              labelText: widget.editEnum.aciklamaLabel(15),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama15(null),
              controller: _aciklama15Controller,
              onChanged: (value) => viewModel.setAciklama15(value),
            ),
          if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 16))
            CustomTextField(
              readOnly: getEkRehberById(16) != null,
              suffixMore: getEkRehberById(16) != null,
              onTap: () async => getGenelRehber(16),
              labelText: widget.editEnum.aciklamaLabel(16),
              maxLength: maxLength,
              onClear: () => viewModel.setAciklama16(null),
              controller: _aciklama16Controller,
              onChanged: (value) => viewModel.setAciklama16(value),
            ),
        ],
      ).paddingAll(UIHelper.lowSize),
    ),
  );

  EkRehberlerModel? getEkRehberById(int? id) {
    if (userModel.ekRehberler.ext.isNullOrEmpty) return null;
    if ((widget.model.getEditTipiEnum?.fiyatGrubuGorunsunMu ?? false) &&
        parametreModel.satisFiyatGrubuSorulacakAlan == id.toStringIfNotNull) {
      return EkRehberlerModel(alan: "ACIK${id ?? ""}", baslik: "Fiyat Grubu");
    }
    return userModel.ekRehberler?.firstWhereOrNull(
      (element) =>
          element.alan == "ACIK${id ?? ""}" && element.ekran == BaseSiparisEditModel.instance.getEditTipiEnum?.rawValue,
    );
  }

  Future<void> getGenelRehber(int? id) async {
    if (id == null) {
      dialogManager.showErrorSnackBar("ID bulunamadı.");
      return;
    }
    final ekRehberModel = getEkRehberById(id);
    EkRehberRequestModel ekRehberRequestModel = EkRehberRequestModel(
      belgeNo: widget.model.belgeNo,
      belgeTipi: widget.model.getEditTipiEnum?.rawValue,
      belgeTarihi: widget.model.tarih,
      id: ekRehberModel?.id,
      cariKodu: widget.model.cariKodu,
      baslik: ekRehberModel?.baslik,
    );
    final isFiyatGrubu =
        (widget.model.getEditTipiEnum?.fiyatGrubuGorunsunMu ?? false) &&
        parametreModel.satisFiyatGrubuSorulacakAlan == id.toStringIfNotNull;
    if (isFiyatGrubu) {
      ekRehberRequestModel = ekRehberRequestModel.copyWith(rehberKodu: 2, baslik: "Fiyat Grubu");
    } else {
      ekRehberRequestModel = ekRehberRequestModel.copyWith(rehberKodu: 8);
    }
    if (ekRehberModel != null) {
      final result = await Get.toNamed("mainPage/genelRehber", arguments: ekRehberRequestModel);
      if (result is! GenelRehberModel) return;
      switch (id) {
        case 1:
          _aciklama1Controller.text = result.kodu ?? "";
          viewModel.setAciklama1(result.kodu ?? "");
        case 2:
          _aciklama2Controller.text = result.kodu ?? "";
          viewModel.setAciklama2(result.kodu ?? "");
        case 3:
          _aciklama3Controller.text = result.kodu ?? "";
          viewModel.setAciklama3(result.kodu ?? "");
        case 4:
          _aciklama4Controller.text = result.kodu ?? "";
          viewModel.setAciklama4(result.kodu ?? "");
        case 5:
          _aciklama5Controller.text = result.kodu ?? "";
          viewModel.setAciklama5(result.kodu ?? "");
        case 6:
          _aciklama6Controller.text = result.kodu ?? "";
          viewModel.setAciklama6(result.kodu ?? "");
        case 7:
          _aciklama7Controller.text = result.kodu ?? "";
          viewModel.setAciklama7(result.kodu ?? "");
        case 8:
          _aciklama8Controller.text = result.kodu ?? "";
          viewModel.setAciklama8(result.kodu ?? "");
        case 9:
          _aciklama9Controller.text = result.kodu ?? "";
          viewModel.setAciklama9(result.kodu ?? "");
        case 10:
          _aciklama10Controller.text = result.kodu ?? "";
          viewModel.setAciklama10(result.kodu ?? "");
        case 11:
          _aciklama11Controller.text = result.kodu ?? "";
          viewModel.setAciklama11(result.kodu ?? "");
        case 12:
          _aciklama12Controller.text = result.kodu ?? "";
          viewModel.setAciklama12(result.kodu ?? "");
        case 13:
          _aciklama13Controller.text = result.kodu ?? "";
          viewModel.setAciklama13(result.kodu ?? "");
        case 14:
          _aciklama14Controller.text = result.kodu ?? "";
          viewModel.setAciklama14(result.kodu ?? "");
        case 15:
          _aciklama15Controller.text = result.kodu ?? "";
          viewModel.setAciklama15(result.kodu ?? "");
        case 16:
          _aciklama16Controller.text = result.kodu ?? "";
          viewModel.setAciklama16(result.kodu ?? "");

        default:
      }
    }
  }
}
