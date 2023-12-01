import "package:flutter/material.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/talep_teklif_tipi_enum.dart";
import "package:picker/view/main_page/alt_sayfalar/talep_teklif/talep_teklif_listesi/model/talep_teklif_listesi_model.dart";

class TalepTeklifAciklamaDuzenleView extends StatefulWidget {
  final TalepTeklifEnum talTekEnum;
  final TalepTeklifListesiModel model;
  const TalepTeklifAciklamaDuzenleView({super.key, required this.talTekEnum, required this.model});

  @override
  State<TalepTeklifAciklamaDuzenleView> createState() => _TalepTeklifAciklamaDuzenleViewState();
}

class _TalepTeklifAciklamaDuzenleViewState extends BaseState<TalepTeklifAciklamaDuzenleView> {
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
    _belgeNoController = TextEditingController();
    _cariController = TextEditingController();
    _tarihController = TextEditingController();
    _aciklama1Controller = TextEditingController();
    _aciklama2Controller = TextEditingController();
    _aciklama3Controller = TextEditingController();
    _aciklama4Controller = TextEditingController();
    _aciklama5Controller = TextEditingController();
    _aciklama6Controller = TextEditingController();
    _aciklama7Controller = TextEditingController();
    _aciklama8Controller = TextEditingController();
    _aciklama9Controller = TextEditingController();
    _aciklama10Controller = TextEditingController();
    _aciklama11Controller = TextEditingController();
    _aciklama12Controller = TextEditingController();
    _aciklama13Controller = TextEditingController();
    _aciklama14Controller = TextEditingController();
    _aciklama15Controller = TextEditingController();
    _aciklama16Controller = TextEditingController();
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
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                labelText: "Belge No",
                controller: _belgeNoController,
              ),
              CustomTextField(
                labelText: "Cari",
                controller: _cariController,
              ),
              CustomTextField(
                labelText: "Tarih",
                isMust: true,
                controller: _tarihController,
              ),
              const Text("Ek açıklamalar"),
              CustomTextField(labelText: "", controller: _aciklama1Controller),
              CustomTextField(labelText: "", controller: _aciklama2Controller),
              CustomTextField(labelText: "", controller: _aciklama3Controller),
              CustomTextField(labelText: "", controller: _aciklama4Controller),
              CustomTextField(labelText: "", controller: _aciklama5Controller),
              CustomTextField(labelText: "", controller: _aciklama6Controller),
              CustomTextField(labelText: "", controller: _aciklama7Controller),
              CustomTextField(labelText: "", controller: _aciklama8Controller),
              CustomTextField(labelText: "", controller: _aciklama9Controller),
              CustomTextField(labelText: "", controller: _aciklama10Controller),
              CustomTextField(labelText: "", controller: _aciklama11Controller),
              CustomTextField(labelText: "", controller: _aciklama12Controller),
              CustomTextField(labelText: "", controller: _aciklama13Controller),
              CustomTextField(labelText: "", controller: _aciklama14Controller),
              CustomTextField(labelText: "", controller: _aciklama15Controller),
              CustomTextField(labelText: "", controller: _aciklama16Controller),
            ],
          ),
        ),
      );
}
