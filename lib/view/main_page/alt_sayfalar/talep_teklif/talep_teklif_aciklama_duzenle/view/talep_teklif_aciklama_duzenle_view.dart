import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/talep_teklif_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_aciklama_duzenle/view_model/talep_teklif_aciklama_duzenle_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/model/talep_teklif_listesi_model.dart";

class TalepTeklifAciklamaDuzenleView extends StatefulWidget {
  final TalepTeklifEnum talTekEnum;
  final TalepTeklifListesiModel model;
  const TalepTeklifAciklamaDuzenleView({super.key, required this.talTekEnum, required this.model});

  @override
  State<TalepTeklifAciklamaDuzenleView> createState() => _TalepTeklifAciklamaDuzenleViewState();
}

class _TalepTeklifAciklamaDuzenleViewState extends BaseState<TalepTeklifAciklamaDuzenleView> {
  TalepTeklifAciklamaDuzenleViewModel viewModel = TalepTeklifAciklamaDuzenleViewModel();
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
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const AppBarTitle(
            title: "Açıklama Düzenle",
          ),
          actions: [
            // IconButton(
            //   onPressed: () async {
            //     await dialogManager.showAreYouSureDialog(() async {
            //       final result = await viewModel.postData();
            //       if (result.success ?? false) {
            //         dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
            //       }
            //     });
            //   },
            //   icon: const Icon(Icons.save_outlined),
            // ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(1),
                controller: _aciklama1Controller,
                onChanged: (value) => viewModel.setAciklama1(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(2),
                controller: _aciklama2Controller,
                onChanged: (value) => viewModel.setAciklama2(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(3),
                controller: _aciklama3Controller,
                onChanged: (value) => viewModel.setAciklama3(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(4),
                controller: _aciklama4Controller,
                onChanged: (value) => viewModel.setAciklama4(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(5),
                controller: _aciklama5Controller,
                onChanged: (value) => viewModel.setAciklama5(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(6),
                controller: _aciklama6Controller,
                onChanged: (value) => viewModel.setAciklama6(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(7),
                controller: _aciklama7Controller,
                onChanged: (value) => viewModel.setAciklama7(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(8),
                controller: _aciklama8Controller,
                onChanged: (value) => viewModel.setAciklama8(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(9),
                controller: _aciklama9Controller,
                onChanged: (value) => viewModel.setAciklama9(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(10),
                controller: _aciklama10Controller,
                onChanged: (value) => viewModel.setAciklama10(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(11),
                controller: _aciklama11Controller,
                onChanged: (value) => viewModel.setAciklama11(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(12),
                controller: _aciklama12Controller,
                onChanged: (value) => viewModel.setAciklama12(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(13),
                controller: _aciklama13Controller,
                onChanged: (value) => viewModel.setAciklama13(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(14),
                controller: _aciklama14Controller,
                onChanged: (value) => viewModel.setAciklama14(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(15),
                controller: _aciklama15Controller,
                onChanged: (value) => viewModel.setAciklama15(value),
              ),
              CustomTextField(
                labelText: widget.talTekEnum.aciklamaLabel(16),
                controller: _aciklama16Controller,
                onChanged: (value) => viewModel.setAciklama16(value),
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );
}
