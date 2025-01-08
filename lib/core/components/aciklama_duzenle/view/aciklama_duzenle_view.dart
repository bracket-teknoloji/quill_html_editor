import "package:flutter/material.dart";
import "package:get/get.dart";

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
  final int maxLength = 100;
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

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) async {
        if (!yetkiController.faturaAciklamaAlanlari(widget.editEnum, 0)) {
          await dialogManager.showAlertDialog("Herhangi bir açıklama alanına erişim yetkiniz yok.");
          Get.back();
        }
      },
    );
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
          title: const AppBarTitle(
            title: "Açıklama Düzenle",
          ),
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
              CustomTextField(
                labelText: "Belge No",
                controller: _belgeNoController,
                readOnly: true,
              ),
              CustomTextField(
                labelText: "Cari",
                controller: _cariController,
                readOnly: true,
              ),
              CustomTextField(
                labelText: "Tarih",
                isMust: true,
                controller: _tarihController,
                readOnly: true,
              ),
              const Text("Ek açıklamalar").paddingAll(UIHelper.lowSize),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 1))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(1),
                  maxLength: maxLength,
                  controller: _aciklama1Controller,
                  onChanged: (value) => viewModel.setAciklama1(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 2))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(2),
                  maxLength: maxLength,
                  controller: _aciklama2Controller,
                  onChanged: (value) => viewModel.setAciklama2(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 3))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(3),
                  maxLength: maxLength,
                  controller: _aciklama3Controller,
                  onChanged: (value) => viewModel.setAciklama3(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 4))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(4),
                  maxLength: maxLength,
                  controller: _aciklama4Controller,
                  onChanged: (value) => viewModel.setAciklama4(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 5))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(5),
                  maxLength: maxLength,
                  controller: _aciklama5Controller,
                  onChanged: (value) => viewModel.setAciklama5(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 6))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(6),
                  maxLength: maxLength,
                  controller: _aciklama6Controller,
                  onChanged: (value) => viewModel.setAciklama6(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 7))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(7),
                  maxLength: maxLength,
                  controller: _aciklama7Controller,
                  onChanged: (value) => viewModel.setAciklama7(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 8))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(8),
                  maxLength: maxLength,
                  controller: _aciklama8Controller,
                  onChanged: (value) => viewModel.setAciklama8(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 9))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(9),
                  maxLength: maxLength,
                  controller: _aciklama9Controller,
                  onChanged: (value) => viewModel.setAciklama9(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 10))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(10),
                  maxLength: maxLength,
                  controller: _aciklama10Controller,
                  onChanged: (value) => viewModel.setAciklama10(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 11))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(11),
                  maxLength: maxLength,
                  controller: _aciklama11Controller,
                  onChanged: (value) => viewModel.setAciklama11(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 12))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(12),
                  maxLength: maxLength,
                  controller: _aciklama12Controller,
                  onChanged: (value) => viewModel.setAciklama12(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 13))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(13),
                  maxLength: maxLength,
                  controller: _aciklama13Controller,
                  onChanged: (value) => viewModel.setAciklama13(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 14))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(14),
                  maxLength: maxLength,
                  controller: _aciklama14Controller,
                  onChanged: (value) => viewModel.setAciklama14(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 15))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(15),
                  maxLength: maxLength,
                  controller: _aciklama15Controller,
                  onChanged: (value) => viewModel.setAciklama15(value),
                ),
              if (yetkiController.faturaAciklamaAlanlari(widget.editEnum, 16))
                CustomTextField(
                  labelText: widget.editEnum.aciklamaLabel(16),
                  maxLength: maxLength,
                  controller: _aciklama16Controller,
                  onChanged: (value) => viewModel.setAciklama16(value),
                ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );
}
